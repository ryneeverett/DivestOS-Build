#!/bin/bash
cd "$DOS_BUILD_BASE""kernel/lge/mako"
git apply $DOS_PATCHES_LINUX_CVES/0001-LinuxIncrementals/3.4/3.4.0002-0003.patch --exclude=Makefile
git apply $DOS_PATCHES_LINUX_CVES/0001-LinuxIncrementals/3.4/3.4.0046-0047.patch --exclude=Makefile
git apply $DOS_PATCHES_LINUX_CVES/0001-LinuxIncrementals/3.4/3.4.0089-0090.patch --exclude=Makefile
git apply $DOS_PATCHES_LINUX_CVES/0005-Copperhead-Deny_USB/3.4/3.4-Backport.patch
git apply $DOS_PATCHES_LINUX_CVES/0007-Accelerated_AES/3.4/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2013-4738/ANY/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2016-3857/ANY/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2016-3894/ANY/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2016-9793/ANY/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2017-1000111/ANY/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2017-11473/ANY/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2017-13305/ANY/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2017-16526/^4.13/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2017-16532/^4.13/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2017-16533/^4.13/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2017-16535/^4.13/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2017-16537/^4.13/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2017-16650/ANY/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2017-16USB/ANY/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2017-16USB/ANY/0005.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2017-16USB/ANY/0006.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2017-17806/ANY/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2018-1068/ANY/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2018-10879/3.4/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2018-10879/3.4/0003.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2018-10880/3.4/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2018-10882/3.4/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2018-11832/ANY/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2018-14634/ANY/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2018-9389/ANY/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2018-9416/ANY/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2018-9439/ANY/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2018-9516/ANY/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2019-2001/3.4/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2019-8912/ANY/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/Untracked-01/ANY/0008-nfsd-check-for-oversized-NFSv2-v3-arguments.patch
git apply $DOS_PATCHES_LINUX_CVES/Untracked-02/ANY/772877_0001-usb-core-Fix-use-after-free-for-hub-usb-device.patch
git apply $DOS_PATCHES_LINUX_CVES/Untracked-02/ANY/797912_0001-usb-gadget-Fix-synchronization-issue-between-f_audio.patch
git apply $DOS_PATCHES_LINUX_CVES/Untracked-02/ANY/870057_0001-wcnss-add-null-check-in-pm_ops-unregister.patch
git apply $DOS_PATCHES_LINUX_CVES/Untracked-02/ANY/kernel.msm.git-5d89eb01c93d8a62998e3bdccae28a7732e3bd51.patch
editKernelLocalversion "-dos.p40"
cd "$DOS_BUILD_BASE"
