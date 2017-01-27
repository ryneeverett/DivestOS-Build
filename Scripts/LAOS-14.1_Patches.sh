#!/bin/bash

#TODO: Aggressive Doze (Verify Extended Doze First), Optimized build flags, Optimized toolchain, OTA Updates, Ship Chromium, Wallpaper

#Hard reset repos
#repo forall -c 'git add -A && git reset --hard'

#Delete Everything
#rm -rf build vendor/cm device/motorola/clark device/oneplus/bacon device/lge/mako kernel/lge/mako kernel/oneplus/msm8974 kernel/motorola/msm8992 packages/apps/Settings frameworks/base build system/core external/sqlite packages/apps/Nfc packages/apps/Settings packages/apps/FDroid packages/apps/FDroidPrivilegedExtension packages/apps/GmsCore packages/apps/GsfProxy packages/apps/FakeStore kernel/lge/hammerhead kernel/moto/shamu bootable/recovery packages/apps/CMParts vendor/cmsdk packages/apps/SetupWizard

#Start a build
#repo sync -j24 --force-sync && sh ../../Scripts/LAOS-14.1_Patches.sh && sh ../../Scripts/LAOS-14.1_Deblob.sh && source build/envsetup.sh && export WITH_SU=true && export ANDROID_HOME="/home/tad/Android/SDK" && export JACK_SERVER_VM_ARGUMENTS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx4096m" && brunch mako && export OTA_PACKAGE_SIGNING_KEY=../../Signing_Keys/releasekey && export SIGNING_KEY_DIR=../../Signing_Keys && brunch clark && brunch bacon && brunch thor

#
#START OF PREPRATION
#
#Set some variables for use later on
base="/home/tad/Android/Build/LineageOS-14.1/"
patches="/home/tad/Android/Patches/LineageOS-14.1/"
ANDROID_HOME="/home/tad/Android/SDK"

#Download some out-of-tree files for use later on
mkdir -p /tmp/ar
cd /tmp/ar
wget https://spotco.us/hosts -N
wget https://gitlab.com/copperhead/platform_external_chromium-webview/raw/nougat-mr1.1-release/prebuilt/arm64/webview.apk -N
wget https://github.com/Ranks/emojione/raw/master/assets/fonts/emojione-android.ttf -N
wget https://gitlab.com/fdroid/fdroidclient/merge_requests/425.patch -N

#Accept all SDK licences, not normally needed but Gradle managed apps fail without it
mkdir -p "$ANDROID_HOME/licenses"
echo -e "\n8933bad161af4178b1185d1a37fbf41ea5269c55" > "$ANDROID_HOME/licenses/android-sdk-license"
echo -e "\n84831b9409646a918e30573bab4c9c91346d8abd" > "$ANDROID_HOME/licenses/android-sdk-preview-license"

#Define a function to simplify this script
enter() {
	dir=$1;
	#project=${$dir//'/'/'_'}; #TODO: Add project conversion, to simplify patching
	cd $base$dir;
	echo "[ENTERING] "$dir;
	git add -A && git reset --hard;
}
#
#END OF PREPRATION
#

#
#START OF ROM CHANGES
#
enter "build"
#git revert 6f9c2e115aeccd7090f92f1fb91bc6052522cdd1 #Enable dex pre-optimization by default again
patch -p1 < $patches"android_build/0001-Automated_Build_Signing.patch" #Automated build signing

enter "external/noto-fonts"
cp /tmp/ar/emojione-android.ttf other/NotoColorEmoji.ttf #Change emoji font to EmojiOne

enter "system/core"
cat /tmp/ar/hosts >> rootdir/etc/hosts #Merge in our HOSTS file
patch -p1 < $patches"android_system_core/0001-Hardening.patch" #Misc hardening

enter "external/chromium-webview"
cp /tmp/ar/webview.apk prebuilt/arm64/webview.apk #Update arm64 WebView to Copperhead's

enter "external/sqlite"
patch -p1 < $patches"android_external_sqlite/0001-Secure_Delete.patch" #Enable secure_delete by default

enter "packages/apps/Nfc"
patch -p1 < $patches"android_packages_apps_Nfc/0001-Disable_NFC.patch" #Disable NFC and NDEF by default

enter "packages/apps/Settings"
patch -p1 < $patches"android_packages_apps_Settings/0001-Hide_Passwords.patch" #Hide passwords by default

enter "packages/apps/GmsCore"
patch -p1 < $patches"android_packages_apps_GmsCore/0001-Fixes.patch" #Update output paths and build tools

enter "packages/apps/GsfProxy"
patch -p1 < $patches"android_packages_apps_GsfProxy/0001-Fixes.patch" #Update output paths and build tools

enter "packages/apps/FakeStore"
patch -p1 < $patches"android_packages_apps_FakeStore/0001-Fixes.patch" #Update output paths and build tools

enter "packages/apps/FDroid"
patch -p1 < $patches"android_packages_apps_FDroid/0001.patch" #Enable privigled module
patch -p1 < $patches"android_packages_apps_FDroid/0003.patch" #Hide app updates for apps that are installed to /system
#git am /tmp/ar/425.patch #New UI (WIP)
rm app/src/main/res/xml/preferences.xml.orig

enter "packages/apps/FDroidPrivilegedExtension"
patch -p1 < $patches"android_packages_apps_FDroidPrivilegedExtension/0001-Update_Build_Tools.patch" #Update build tools
patch -p1 < $patches"android_packages_apps_FDroidPrivilegedExtension/0002-Release_Key.patch" #Change to release key
patch -p1 < $patches"android_packages_apps_FDroidPrivilegedExtension/0003-Test_Keys.patch" #Add test-keys XXX: ONLY USE FOR TEST BUILDS
#release-keys: CB:1E:E2:EC:40:D0:5E:D6:78:F4:2A:E7:01:CD:FA:29:EE:A7:9D:0E:6D:63:32:76:DE:23:0B:F3:49:40:67:C3
#test-keys: C8:A2:E9:BC:CF:59:7C:2F:B6:DC:66:BE:E2:93:FC:13:F2:FC:47:EC:77:BC:6B:2B:0D:52:C1:1F:51:19:2A:B8

enter "vendor/cmsdk"
git fetch https://review.lineageos.org/LineageOS/cm_platform_sdk refs/changes/21/148321/4 && git cherry-pick FETCH_HEAD #Network Traffic

enter "vendor/cm"
git fetch https://review.lineageos.org/LineageOS/android_vendor_cm refs/changes/01/156601/8 && git cherry-pick FETCH_HEAD #CustomTiles
rm -rf gello #Gello is built out-of-tree and bundles Google Play Services library
patch -p1 < $patches"android_vendor_cm/0001-SCE.patch" #Include our extras such as MicroG and F-Droid
cp $patches"android_vendor_cm/sce.mk" config/sce.mk

enter "packages/apps/CMParts"
git revert 311172074c5e18e39d88d34db0b9dd6532317811 #TODO: Rebase
git fetch https://review.lineageos.org/LineageOS/android_packages_apps_CMParts refs/changes/15/113415/11 && git cherry-pick FETCH_HEAD #Network Traffic
patch -p1 < $patches"android_packages_apps_CMParts/0001-Remove_Analytics.patch" #Remove analytics
rm res/xml/parts_catalog.xml.orig res/values/strings.xml.orig

enter "packages/apps/SetupWizard"
git fetch https://review.lineageos.org/LineageOS/android_packages_apps_SetupWizard refs/changes/42/158142/4 && git cherry-pick FETCH_HEAD #remove GMS
patch -p1 < $patches"android_packages_apps_SetupWizard/0001-Remove_Analytics.patch" #Remove analytics
patch -p1 < $patches"android_packages_apps_SetupWizard/0002-No_GMS.patch" #Disable GMS page

enter "frameworks/base"
git fetch https://review.lineageos.org/LineageOS/android_frameworks_base refs/changes/75/151975/8 && git cherry-pick FETCH_HEAD #Network Traffic
git revert 2aaa0472da8d254da1f07aa65a664012b52410f4 #re-enable doze on devices without gms
#patch -p1 < $patches"android_frameworks_base/0002-Failed_Unlock_Shutdown.patch" #Shutdown after five failed unlock attempts FIXME: Update shutdown() to match new args
patch -p1 < $patches"android_frameworks_base/0003-Signature_Spoofing.patch" #Allow packages to spoof their signature (MicroG)
patch -p1 < $patches"android_frameworks_base/0004-Hide_Passwords.patch" #Hide passwords by default
patch -p1 < $patches"android_frameworks_base/0005-Harden_Sig_Spoofing.patch" #Restrict signature spoofing to system apps signed with the platform key
rm core/res/res/values/config.xml.orig core/res/res/values/strings.xml.orig core/res/AndroidManifest.xml.orig
#
#END OF ROM CHANGES
#

#
#START OF DEVICE CHANGES
#
enter "device/motorola/clark"
patch -p1 < $patches"android_device_motorola_clark/0003-Enable_Dex_Preopt.patch" #Force enables dex pre-optimization
patch -p1 < $patches"android_device_motorola_clark/0004-Remove_Widevine.patch" #Removes Google Widevine and disables the DRM server
#patch -p1 < $patches"android_device_motorola_clark/0005-TWRP.patch" #Add TWRP support

enter "kernel/motorola/msm8992"
patch -p1 < $patches"android_kernel_motorola_msm8992/0001-OverUnderClock.patch" #a57: 1.82Ghz -> 2.01Ghz, a53 1.44Ghz -> 1.63Ghz, 384Mhz -> 300Mhz	=+1.14Ghz TODO: Enable by default
patch -p1 < $patches"android_kernel_motorola_msm8992/0002-MMC_Tweak.patch" #Improves MMC performance

enter "device/oneplus/bacon"
patch -p1 < $patches"android_device_oneplus_bacon/0001-Remove_DRM.patch" #Removes Microsoft PlayReady and Google Widevine
patch -p1 < $patches"android_device_oneplus_bacon/0002-Enable_Dex_Preopt.patch" #Force enables dex pre-optimization

enter "kernel/oneplus/msm8974" #Consider switching to https://github.com/erorcun/android_kernel_oneplus_msm8974-3.10
#patch -p1 < $patches"android_kernel_oneplus_msm8974/0001-OverUnderClock.patch" #300Mhz -> 268Mhz, 2.45Ghz -> 2.88Ghz	=+1.72Ghz
patch -p1 < $patches"android_kernel_oneplus_msm8974/0001-OverUnderClock-EXTREME.patch" #300Mhz -> 268Mhz, 2.45Ghz -> 2.95Ghz	=+2.02Ghz XXX: Not 100% stable under intense workloads

enter "device/lge/mako"
patch -p1 < $patches"android_device_lge_mako/0001-Enable_LTE.patch" #Enable LTE support (Requires LTE hybrid modem to be flashed)

enter "kernel/lge/mako"
patch -p1 < $patches"android_kernel_lge_mako/0001-OverUnderClock.patch" #384Mhz -> 81Mhz, 1.51Ghz -> 1.94Ghz	=+1.72Ghz

enter "kernel/lge/hammerhead"
patch -p1 < $patches"android_kernel_lge_hammerhead/0001-OverUnderClock.patch" #2.26Ghz -> 2.95Ghz	=+2.76Ghz

enter "kernel/moto/shamu"
patch -p1 < $patches"android_kernel_moto_shamu/0001-OverUnderClock.patch" #300Mhz -> 35Mhz, 2.64Ghz -> 2.88Ghz	=+0.96Ghz

enter "kernel/lge/bullhead"
patch -p1 < $patches"android_kernel_lge_bullhead/0001-OverUnderClock.patch" #a57: 1.82Ghz -> 2.01Ghz, a53 1.44Ghz -> 1.63Ghz, 384Mhz -> 300Mhz	=+1.14Ghz TODO: Enable by default
patch -p1 < $patches"android_kernel_lge_bullhead/0002-MMC_Tweak.patch" #Improves MMC performance

enter "kernel/motorola/msm8916"
patch -p1 < $patches"android_kernel_motorola_msm8916/Overclock.patch" #1.57Ghz -> 1.94Ghz	=+ 1.58Ghz
#
#END OF DEVICE CHANGES
#
