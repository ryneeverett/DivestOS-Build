#!/bin/bash
#DivestOS: A privacy oriented Android distribution
#Copyright (c) 2015-2018 Divested Computing, Inc.
#
#This program is free software: you can redistribute it and/or modify
#it under the terms of the GNU General Public License as published by
#the Free Software Foundation, either version 3 of the License, or
#(at your option) any later version.
#
#This program is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#GNU General Public License for more details.
#
#You should have received a copy of the GNU General Public License
#along with this program.  If not, see <https://www.gnu.org/licenses/>.

#Last verified: 2019-03-04

#Initialize aliases
#source ../../Scripts/init.sh

#Delete Everything and Sync
#resetWorkspace

#Apply all of our changes
#patchWorkspace

#Build!
#buildDevice [device]
#buildAll

#Generate an incremental
#./build/tools/releasetools/ota_from_target_files --block -t 8 -i old.zip new.zip update.zip

#Generate firmware deblobber
#mka firmware_deblobber

#
#START OF PREPRATION
#
#Download some (non-executable) out-of-tree files for use later on
cd "$DOS_TMP_DIR";
if [ "$DOS_HOSTS_BLOCKING" = true ]; then $DOS_TOR_WRAPPER wget "$DOS_HOSTS_BLOCKING_LIST" -N; fi;
cd "$DOS_BUILD_BASE";

#Accept all SDK licences, not normally needed but Gradle managed apps fail without it
mkdir -p "$ANDROID_HOME/licenses";
echo -e "\n8933bad161af4178b1185d1a37fbf41ea5269c55\nd56f5187479451eabf01fb78af6dfcb131a6481e" > "$ANDROID_HOME/licenses/android-sdk-license";
echo -e "\n84831b9409646a918e30573bab4c9c91346d8abd" > "$ANDROID_HOME/licenses/android-sdk-preview-license";
#
#END OF PREPRATION
#

#
#START OF ROM CHANGES
#

#top dir
cp -r "$DOS_PREBUILT_APPS""Fennec_DOS-Shim" "$DOS_BUILD_BASE""packages/apps/"; #Add a shim to install Fennec DOS without actually including the large APK
gpgVerifyDirectory "$DOS_PREBUILT_APPS""android_vendor_FDroid_PrebuiltApps/packages";
cp -r "$DOS_PREBUILT_APPS""android_vendor_FDroid_PrebuiltApps/." "$DOS_BUILD_BASE""vendor/fdroid_prebuilt/"; #Add the prebuilt apps
cp -r "$DOS_PATCHES_COMMON""android_vendor_divested/." "$DOS_BUILD_BASE""vendor/divested/"; #Add our vendor files

enterAndClear "build/make";
git revert 271f6ffa045064abcac066e97f2cb53ccb3e5126 61f7ee9386be426fd4eadc2c8759362edb5bef8; #Add back PicoTTS and language files
patch -p1 < "$DOS_PATCHES/android_build/0001-Automated_Build_Signing.patch"; #Automated build signing (CopperheadOS-13.0)
awk -i inplace '!/PRODUCT_EXTRA_RECOVERY_KEYS/' core/product.mk;
sed -i '74i$(my_res_package): PRIVATE_AAPT_FLAGS += --auto-add-overlay' core/aapt2.mk;

enterAndClear "device/qcom/sepolicy-legacy";
patch -p1 < "$DOS_PATCHES/android_device_qcom_sepolicy-legacy/0001-Camera_Fix.patch"; #Fix camera on -user builds XXX: REMOVE THIS TRASH
echo "SELINUX_IGNORE_NEVERALLOWS := true" >> sepolicy.mk; #necessary for -user builds of legacy devices

enterAndClear "external/svox";
git revert 1419d63b4889a26d22443fd8df1f9073bf229d3d; #Add back Makefiles
sed -i '12iLOCAL_SDK_VERSION := current' pico/Android.mk; #Fix build under Pie
sed -i 's/about to delete/unable to delete/' pico/src/com/svox/pico/LangPackUninstaller.java;
awk -i inplace '!/deletePackage/' pico/src/com/svox/pico/LangPackUninstaller.java;

enterAndClear "frameworks/base";
hardenLocationFWB "$DOS_BUILD_BASE";
sed -i 's/DEFAULT_MAX_FILES = 1000;/DEFAULT_MAX_FILES = 0;/' services/core/java/com/android/server/DropBoxManagerService.java; #Disable DropBox
sed -i 's/DEFAULT_MAX_FILES_LOWRAM = 300;/DEFAULT_MAX_FILES_LOWRAM = 0;/' services/core/java/com/android/server/DropBoxManagerService.java; #Disable DropBox
sed -i 's/(notif.needNotify)/(true)/' location/java/com/android/internal/location/GpsNetInitiatedHandler.java; #Notify user when location is requested via SUPL
if [ "$DOS_MICROG_INCLUDED" = "FULL" ]; then patch -p1 < "$DOS_PATCHES/android_frameworks_base/0002-Signature_Spoofing.patch"; fi; #Allow packages to spoof their signature (microG)
if [ "$DOS_MICROG_INCLUDED" = "FULL" ]; then patch -p1 < "$DOS_PATCHES/android_frameworks_base/0003-Harden_Sig_Spoofing.patch"; fi; #Restrict signature spoofing to system apps signed with the platform key
changeDefaultDNS;
#patch -p1 < "$DOS_PATCHES/android_frameworks_base/0005-Connectivity.patch"; #Change connectivity check URLs to ours
patch -p1 < "$DOS_PATCHES/android_frameworks_base/0006-Disable_Analytics.patch"; #Disable/reduce functionality of various ad/analytics libraries
rm -rf packages/PrintRecommendationService; #App that just creates popups to install proprietary print apps

if [ "$DOS_DEBLOBBER_REMOVE_IMS" = true ]; then
enterAndClear "frameworks/opt/net/ims";
patch -p1 < "$DOS_PATCHES/android_frameworks_opt_net_ims/0001-Fix_Calling.patch"; #Fix calling when IMS is removed
fi

enterAndClear "frameworks/opt/net/wifi";
#Fix an issue when permision review is enabled that prevents using the Wi-Fi quick tile
#See https://github.com/CopperheadOS/platform_frameworks_opt_net_wifi/commit/c2a2f077a902226093b25c563e0117e923c7495b
sed -i 's/boolean mPermissionReviewRequired/boolean mPermissionReviewRequired = false/' service/java/com/android/server/wifi/WifiServiceImpl.java;
awk -i inplace '!/mPermissionReviewRequired = Build.PERMISSIONS_REVIEW_REQUIRED/' service/java/com/android/server/wifi/WifiServiceImpl.java;
awk -i inplace '!/\|\| context.getResources\(\).getBoolean\(/' service/java/com/android/server/wifi/WifiServiceImpl.java;
awk -i inplace '!/com.android.internal.R.bool.config_permissionReviewRequired/' service/java/com/android/server/wifi/WifiServiceImpl.java;

if enter "kernel/wireguard"; then
if [ "$DOS_WIREGUARD_INCLUDED" = false ]; then rm Android.mk; fi;
#Remove system information from HTTP requests
awk -i inplace '!/USER_AGENT=/' fetch.sh;
sed -i '3iUSER_AGENT="WireGuard-AndroidROMBuild/0.2"' fetch.sh;
fi;

enterAndClear "lineage-sdk";
awk -i inplace '!/LineageWeatherManagerService/' lineage/res/res/values/config.xml; #Disable Weather
if [ "$DOS_DEBLOBBER_REMOVE_AUDIOFX" = true ]; then awk -i inplace '!/LineageAudioService/' lineage/res/res/values/config.xml; fi;

enterAndClear "packages/apps/LineageParts";
rm -rf src/org/lineageos/lineageparts/lineagestats/ res/xml/anonymous_stats.xml res/xml/preview_data.xml; #Nuke part of the analytics
patch -p1 < "$DOS_PATCHES/android_packages_apps_LineageParts/0001-Remove_Analytics.patch"; #Remove analytics

enterAndClear "packages/apps/Settings";
#patch -p1 < "$DOS_PATCHES/android_packages_apps_Settings/0001-Captive_Portal_Toggle.patch"; #Add option to disable captive portal checks, credit @MSe1969
sed -i 's/private int mPasswordMaxLength = 16;/private int mPasswordMaxLength = 48;/' src/com/android/settings/password/ChooseLockPassword.java; #Increase max password length
sed -i 's/if (isFullDiskEncrypted()) {/if (false) {/' src/com/android/settings/accessibility/*AccessibilityService*.java; #Never disable secure start-up when enabling an accessibility service
if [ "$DOS_MICROG_INCLUDED" = "FULL" ]; then sed -i 's/GSETTINGS_PROVIDER = "com.google.settings";/GSETTINGS_PROVIDER = "com.google.oQuae4av";/' src/com/android/settings/PrivacySettings.java; fi; #microG doesn't support Backup, hide the options

enterAndClear "packages/apps/SetupWizard";
patch -p1 < "$DOS_PATCHES/android_packages_apps_SetupWizard/0001-Remove_Analytics.patch"; #Remove analytics

enterAndClear "packages/apps/Updater";
patch -p1 < "$DOS_PATCHES_COMMON/android_packages_apps_Updater/0001-Server.patch"; #Switch to our server
patch -p1 < "$DOS_PATCHES/android_packages_apps_Updater/0002-Tor_Support.patch"; #Add Tor support
sed -i 's/PROP_BUILD_VERSION_INCREMENTAL);/PROP_BUILD_VERSION_INCREMENTAL).replaceAll("\\\\.", "");/' src/org/lineageos/updater/misc/Utils.java; #Remove periods from incremental version
#TODO: Remove changelog

enterAndClear "packages/apps/WallpaperPicker";
#TODO: Add back wallpapers
sed -i 's/req.touchEnabled = touchEnabled;/req.touchEnabled = true;/' src/com/android/wallpaperpicker/WallpaperCropActivity.java; #Allow scrolling
sed -i 's/mCropView.setTouchEnabled(req.touchEnabled);/mCropView.setTouchEnabled(true);/' src/com/android/wallpaperpicker/WallpaperCropActivity.java;
sed -i 's/WallpaperUtils.EXTRA_WALLPAPER_OFFSET, 0);/WallpaperUtils.EXTRA_WALLPAPER_OFFSET, 0.5f);/' src/com/android/wallpaperpicker/WallpaperPickerActivity.java; #Center aligned by default

enterAndClear "packages/inputmethods/LatinIME";
patch -p1 < "$DOS_PATCHES_COMMON/android_packages_inputmethods_LatinIME/0001-Voice.patch"; #Remove voice input key

enterAndClear "packages/services/Telephony";
patch -p1 < "$DOS_PATCHES/android_packages_services_Telephony/0001-PREREQ_Handle_All_Modes.patch";
patch -p1 < "$DOS_PATCHES/android_packages_services_Telephony/0002-More_Preferred_Network_Modes.patch";

enterAndClear "system/core";
if [ "$DOS_HOSTS_BLOCKING" = true ]; then cat "$DOS_HOSTS_FILE" >> rootdir/etc/hosts; fi; #Merge in our HOSTS file
#git revert b3609d82999d23634c5e6db706a3ecbc5348309a; #Always update recovery XXX: Wait until recovery-p topic is merged
patch -p1 < "$DOS_PATCHES/android_system_core/0001-Harden_Mounts.patch"; #Harden mounts with nodev/noexec/nosuid (CopperheadOS-13.0)

enterAndClear "system/sepolicy";
patch -p1 < "$DOS_PATCHES/android_system_sepolicy/0001-LGE_Fixes.patch"; #Fix -user builds for LGE devices
awk -i inplace '!/true cannot be used in user builds/' Android.mk; #Allow ignoring neverallows under -user

enterAndClear "vendor/lineage";
rm -rf overlay/common/lineage-sdk/packages/LineageSettingsProvider/res/values/defaults.xml; #Remove analytics
if [ "$DOS_HOSTS_BLOCKING" = true ]; then awk -i inplace '!/50-lineage.sh/' config/common.mk; fi; #Make sure our hosts is always used
awk -i inplace '!/PRODUCT_EXTRA_RECOVERY_KEYS/' config/common.mk; #Remove extra keys
awk -i inplace '!/security\/lineage/' config/common.mk; #Remove extra keys
awk -i inplace '!/WeatherProvider/' config/common.mk;
if [ "$DOS_DEBLOBBER_REMOVE_AUDIOFX" = true ]; then awk -i inplace '!/AudioFX/' config/common.mk; fi;
if [ "$DOS_MICROG_INCLUDED" = "NLP" ]; then sed -i '/Google provider/!b;n;s/com.google.android.gms/org.microg.nlp/' overlay/common/frameworks/base/core/res/res/values/config.xml; fi;
sed -i 's/LINEAGE_BUILDTYPE := UNOFFICIAL/LINEAGE_BUILDTYPE := dos/' config/common.mk; #Change buildtype
if [ "$DOS_NON_COMMERCIAL_USE_PATCHES" = true ]; then sed -i 's/LINEAGE_BUILDTYPE := dos/LINEAGE_BUILDTYPE := dosNC/' config/common.mk; fi;
echo 'include vendor/divested/divestos.mk' >> config/common.mk; #Include our customizations

enter "vendor/divested";
if [ "$DOS_MICROG_INCLUDED" = "FULL" ]; then echo "PRODUCT_PACKAGES += GmsCore GsfProxy FakeStore" >> packages.mk; fi;
if [ "$DOS_HOSTS_BLOCKING" = false ]; then echo "PRODUCT_PACKAGES += $DOS_HOSTS_BLOCKING_APP" >> packages.mk; fi;
#
#END OF ROM CHANGES
#

#
#START OF DEVICE CHANGES
#
enterAndClear "device/lge/mako";
echo "allow kickstart usbfs:dir search;" >> sepolicy/kickstart.te; #Fix forceencrypt on first boot
echo "allow system_server sensors_data_file:dir search;" >> sepolicy/system_server.te; #Fix qcom_sensors log spam
echo "allow system_server sensors_data_file:dir r_file_perms;" >> sepolicy/system_server.te;
sed -i 's/1333788672/880803840/' BoardConfig.mk; #don't touch partitions! DOS -user fits with 70M free
awk -i inplace '!/TARGET_RELEASETOOLS_EXTENSIONS/' BoardConfig.mk;

enterAndClear "device/oneplus/bacon";
sed -i 's/android.hardware.nfc@1.0-impl/android.hardware.nfc@1.0-impl.so/' device-proprietary-files.txt;

enterAndClear "device/oppo/msm8974-common";
sed -i "s/TZ.BF.2.0-2.0.0134/TZ.BF.2.0-2.0.0134|TZ.BF.2.0-2.0.0137/" board-info.txt; #Suport new TZ firmware https://review.lineageos.org/#/c/178999/

enter "vendor/google";
echo "" > atv/atv-common.mk;

#Make changes to all devices
cd "$DOS_BUILD_BASE";
if [ "$DOS_LOWRAM_ENABLED" = true ]; then find "device" -maxdepth 2 -mindepth 2 -type d -exec bash -c 'enableLowRam "$0"' {} \;; fi;
find "hardware/qcom/gps" -name "gps\.conf" -type f -exec bash -c 'hardenLocationConf "$0"' {} \;;
find "device" -name "gps\.conf" -type f -exec bash -c 'hardenLocationConf "$0"' {} \;;
find "device" -type d -name "overlay" -exec bash -c 'hardenLocationFWB "$0"' {} \;;
find "device" -maxdepth 2 -mindepth 2 -type d -exec bash -c 'enableDexPreOpt "$0"' {} \;;
find "device" -maxdepth 2 -mindepth 2 -type d -exec bash -c 'hardenUserdata "$0"' {} \;;
if [ "$DOS_STRONG_ENCRYPTION_ENABLED" = true ]; then find "device" -maxdepth 2 -mindepth 2 -type d -exec bash -c 'enableStrongEncryption "$0"' {} \;; fi;
find "kernel" -maxdepth 2 -mindepth 2 -type d -exec bash -c 'hardenDefconfig "$0"' {} \;;
cd "$DOS_BUILD_BASE";

#Fix broken options enabled by hardenDefconfig()
sed -i "s/CONFIG_DEBUG_RODATA=y/# CONFIG_DEBUG_RODATA is not set/" kernel/lge/mako/arch/arm/configs/lineageos_*_defconfig; #Breaks on compile
sed -i "s/CONFIG_STRICT_MEMORY_RWX=y/# CONFIG_STRICT_MEMORY_RWX is not set/" kernel/motorola/msm8996/arch/arm64/configs/*_defconfig; #Breaks on compile
#
#END OF DEVICE CHANGES
#