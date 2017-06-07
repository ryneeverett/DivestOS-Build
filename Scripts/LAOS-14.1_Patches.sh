#!/bin/bash
#Copyright (c) 2015-2017 Spot Communications, Inc.

#Delete Everything
#repo forall -c 'git add -A && git reset --hard' && rm -rf packages/apps/GmsCore out

#Prepare a build
#repo sync -j20 --force-sync && sh ../../Scripts/LAOS-14.1_Patches.sh && source ../../Scripts/Generic_Deblob.sh && source build/envsetup.sh && export ANDROID_HOME="/home/$USER/Android/Sdk" && export ANDROID_JACK_VM_ARGS="-Xmx6144m -Xms512m -Dfile.encoding=UTF-8 -XX:+TieredCompilation" && export JACK_SERVER_VM_ARGUMENTS="${ANDROID_JACK_VM_ARGS}" && GRADLE_OPTS=-Xmx2048m && export KBUILD_BUILD_USER=emy && export KBUILD_BUILD_HOST=dosbm

#Build!
#brunch lineage_mako-user && export OTA_PACKAGE_SIGNING_KEY=../../Signing_Keys/releasekey && export SIGNING_KEY_DIR=../../Signing_Keys && brunch lineage_clark-user && brunch lineage_bacon-user && brunch lineage_hammerhead-user && brunch lineage_shamu-user && brunch lineage_bullhead-user && brunch lineage_angler-user && brunch lineage_flo-user && brunch lineage_marlin-user && brunch lineage_ether-user && brunch lineage_Z00T-user

#
#START OF PREPRATION
#
#Set some variables for use later on
base="/mnt/Drive-1/Development/Other/Android_ROMs/Build/LineageOS-14.1/"
patches="/mnt/Drive-1/Development/Other/Android_ROMs/Patches/LineageOS-14.1/"
ANDROID_HOME="/home/$USER/Android/Sdk"

#Download some out-of-tree files for use later on
mkdir -p /tmp/ar
cd /tmp/ar
wget https://spotco.us/hosts -N #XXX: /hosts is built from non-commercial use files, switch to /hsc for release
wget https://github.com/emojione/emojione/raw/master/extras/fonts/emojione-android.ttf -N #XXX: Requires attribuition
wget https://patch-diff.githubusercontent.com/raw/TheMuppets/proprietary_vendor_oneplus/pull/81.patch -N

#Accept all SDK licences, not normally needed but Gradle managed apps fail without it
mkdir -p "$ANDROID_HOME/licenses"
echo -e "\n8933bad161af4178b1185d1a37fbf41ea5269c55" > "$ANDROID_HOME/licenses/android-sdk-license"
echo -e "\n84831b9409646a918e30573bab4c9c91346d8abd" > "$ANDROID_HOME/licenses/android-sdk-preview-license"

enter() {
	echo "================================================================================================"
	dir=$1;
	cd $base$dir;
	echo "[ENTERING] "$dir;
	git add -A && git reset --hard;
}

enableDexPreOpt() {
	echo "WITH_DEXPREOPT := true" >> BoardConfig.mk;
	echo "Enabled dexpreopt";
}

disableDexPreOpt() {
	sed -i 's/WITH_DEXPREOPT := true/WITH_DEXPREOPT := false/' BoardConfig.mk;
	echo "Disable dexpreopt";
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
sed -i 's|echo "ro.build.user=$USER"|echo "ro.build.user=emy"|' tools/buildinfo.sh; #Override build user
sed -i 's|echo "ro.build.host=`hostname`"|echo "ro.build.host=dosbm"|' tools/buildinfo.sh; #Override build host

enter "device/qcom/sepolicy"
patch -p1 < $patches"android_device_qcom_sepolicy/0001-Camera_Fix.patch" #Fix camera on user builds

enter "external/noto-fonts"
cp /tmp/ar/emojione-android.ttf other/NotoColorEmoji.ttf #Change emoji font to EmojiOne

enter "external/sqlite"
patch -p1 < $patches"android_external_sqlite/0001-Secure_Delete.patch" #Enable secure_delete by default

enter "external/svox"
git fetch https://android.googlesource.com/platform/external/svox refs/changes/72/302872/2 && git cherry-pick FETCH_HEAD #Fix garbled output See https://android-review.googlesource.com/#/c/302872/

enter "frameworks/base"
git revert 0326bb5e41219cf502727c3aa44ebf2daa19a5b3 #re-enable doze on devices without gms
git fetch https://review.lineageos.org/LineageOS/android_frameworks_base refs/changes/75/151975/31 && git cherry-pick FETCH_HEAD #network traffic
sed -i 's/DEFAULT_MAX_FILES = 1000;/DEFAULT_MAX_FILES = 0;/' services/core/java/com/android/server/DropBoxManagerService.java; #Disable DropBox
patch -p1 < $patches"android_frameworks_base/0003-Signature_Spoofing.patch" #Allow packages to spoof their signature (MicroG)
patch -p1 < $patches"android_frameworks_base/0005-Harden_Sig_Spoofing.patch" #Restrict signature spoofing to system apps signed with the platform key
rm core/res/res/values/config.xml.orig core/res/res/values/strings.xml.orig core/res/AndroidManifest.xml.orig

#enter "frameworks/opt/net/ims"
#patch -p1 < $patches"android_frameworks_opt_net_ims/0001-Fix_Calling.patch" #Fix calling after we remove IMS

enter "packages/apps/CMParts"
rm -rf src/org/cyanogenmod/cmparts/cmstats/ res/xml/anonymous_stats.xml res/xml/preview_data.xml #Nuke part of CMStats
git fetch https://review.lineageos.org/LineageOS/android_packages_apps_CMParts refs/changes/15/113415/23 && git cherry-pick FETCH_HEAD #network traffic
patch -p1 < $patches"android_packages_apps_CMParts/0001-Remove_Analytics.patch" #Remove the rest of CMStats

enter "packages/apps/CMUpdater"
patch -p1 < $patches"android_packages_apps_CMUpdater/0001-Server.patch" #Switch to our server

enter "packages/apps/CustomTiles"
git fetch https://review.lineageos.org/LineageOS/android_packages_apps_CustomTiles refs/changes/69/167069/1 && git cherry-pick FETCH_HEAD #System profiles tile

enter "packages/apps/Dialer"
sed -i 's/FLP_DEFAULT = FLP_GOOGLE;/FLP_DEFAULT = FLP_OPENSTREETMAP;/' src/com/android/dialer/lookup/LookupSettings.java; #Change default FLP to OpenStreetMap
sed -i 's/CMSettings.System.ENABLE_FORWARD_LOOKUP, 1)/CMSettings.System.ENABLE_FORWARD_LOOKUP, 0)/' src/com/android/dialer/lookup/LookupSettings.java; #Disable FLP by default
sed -i 's/CMSettings.System.ENABLE_PEOPLE_LOOKUP, 1)/CMSettings.System.ENABLE_PEOPLE_LOOKUP, 0)/' src/com/android/dialer/lookup/LookupSettings.java; #Disable PLP by default
#sed -i 's/CMSettings.System.ENABLE_REVERSE_LOOKUP, 1)/CMSettings.System.ENABLE_REVERSE_LOOKUP, 0)/' src/com/android/dialer/lookup/LookupSettings.java; #Disable RLP by default

enter "packages/apps/FakeStore"
patch -p1 < $patches"android_packages_apps_FakeStore/0001-Fixes.patch" #Update output paths and build tools

enter "packages/apps/FDroid"
patch -p1 < $patches"android_packages_apps_FDroid/0001.patch" #Enable privigled module

enter "packages/apps/FDroidPrivilegedExtension"
patch -p1 < $patches"android_packages_apps_FDroidPrivilegedExtension/0002-Release_Key.patch" #Change to release key
#release-keys: CB:1E:E2:EC:40:D0:5E:D6:78:F4:2A:E7:01:CD:FA:29:EE:A7:9D:0E:6D:63:32:76:DE:23:0B:F3:49:40:67:C3
#test-keys: C8:A2:E9:BC:CF:59:7C:2F:B6:DC:66:BE:E2:93:FC:13:F2:FC:47:EC:77:BC:6B:2B:0D:52:C1:1F:51:19:2A:B8

enter "packages/apps/IchnaeaNlpBackend"
patch -p1 < $patches"android_packages_apps_IchnaeaNlpBackend/0001-Fixes.patch" #Update output paths and build tools

enter "packages/apps/Nfc"
sed -i 's/static final boolean NFC_ON_DEFAULT = true;/static final boolean NFC_ON_DEFAULT = false;/' src/com/android/nfc/NfcService.java; #Disable NFC by default
sed -i 's/static final boolean NDEF_PUSH_ON_DEFAULT = true;/static final boolean NDEF_PUSH_ON_DEFAULT = false;/' src/com/android/nfc/NfcService.java; #Disable NDEF Push by default

enter "packages/apps/Settings"
sed -i 's/Settings.Secure.WEB_ACTION_ENABLED, 1/Settings.Secure.WEB_ACTION_ENABLED, 0/' src/com/android/settings/applications/ManageDomainUrls.java; #Disable "Instant Apps"
sed -i 's/private int mPasswordMaxLength = 16;/private int mPasswordMaxLength = 48;/' src/com/android/settings/ChooseLockPassword.java; #Increase max password length
sed -i 's/GSETTINGS_PROVIDER = "com.google.settings";/GSETTINGS_PROVIDER = "com.google.oQuae4av";/' src/com/android/settings/PrivacySettings.java; #MicroG doesn't support Backup, hide the options

enter "packages/inputmethods/LatinIME"
patch -p1 < $patches"android_packages_inputmethods_LatinIME/0001-Voice.patch" #Remove voice input key

enter "system/core"
cat /tmp/ar/hosts >> rootdir/etc/hosts #Merge in our HOSTS file
patch -p1 < $patches"android_system_core/0001-Hardening.patch" #Misc hardening

#enter "system/netd"
#patch -p1 < $patches"android_system_netd/0001-iptables.patch"; #Network hardening via iptables XXX: Doesn't seem to do anything?

enter "vendor/cm"
awk -i inplace '!/50-cm.sh/' config/common.mk; #Make sure our hosts is always used
patch -p1 < $patches"android_vendor_cm/0001-SCE.patch" #Include our extras such as MicroG and F-Droid
cp $patches"android_vendor_cm/sce.mk" config/sce.mk
sed -i 's/CM_BUILDTYPE := UNOFFICIAL/CM_BUILDTYPE := dos/' config/common.mk; #Change buildtype

enter "vendor/cmsdk"
git fetch https://review.lineageos.org/LineageOS/cm_platform_sdk refs/changes/21/148321/12 && git cherry-pick FETCH_HEAD #network traffic
cp $patches"cm_platform_sdk/profile_default.xml" cm/res/res/xml/profile_default.xml; #Replace default profiles with *way* better ones
#
#END OF ROM CHANGES
#

#
#START OF DEVICE CHANGES
#
enter "device/motorola/clark"
enableDexPreOpt

enter "vendor/oneplus"
git am /tmp/ar/81.patch #OSS Camera HAL

enter "device/oneplus/bacon"
git fetch https://review.lineageos.org/LineageOS/android_device_oneplus_bacon refs/changes/82/158782/5 && git cherry-pick FETCH_HEAD #OSS Camera HAL
enableDexPreOpt

enter "kernel/oneplus/msm8974"
patch -p1 < $patches"android_kernel_oneplus_msm8974/0001-OverUnderClock-EXTREME.patch" #300Mhz -> 268Mhz, 2.45Ghz -> 2.95Ghz	=+2.02Ghz XXX: Not 100% stable under intense workloads

enter "device/lge/mako"
disableDexPreOpt #bootloops
patch -p1 < $patches"android_device_lge_mako/0001-Enable_LTE.patch" #Enable LTE support (Requires LTE hybrid modem to be flashed)

#enter "kernel/lge/mako"
#patch -p1 < $patches"android_kernel_lge_mako/0001-OverUnderClock.patch" #384Mhz -> 81Mhz, 1.51Ghz -> 1.94Ghz	=+1.72Ghz #XXX: Causes *excessively* long boot times

enter "kernel/lge/hammerhead"
patch -p1 < $patches"android_kernel_lge_hammerhead/0001-OverUnderClock.patch" #2.26Ghz -> 2.95Ghz	=+2.76Ghz

enter "kernel/moto/shamu"
patch -p1 < $patches"android_kernel_moto_shamu/0001-OverUnderClock.patch" #300Mhz -> 35Mhz, 2.64Ghz -> 2.88Ghz	=+0.96Ghz

enter "kernel/motorola/msm8916"
patch -p1 < $patches"android_kernel_motorola_msm8916/0001-Overclock.patch" #1.36Ghz -> 1.88Ghz	=+ 2.07Ghz
#
#END OF DEVICE CHANGES
#
