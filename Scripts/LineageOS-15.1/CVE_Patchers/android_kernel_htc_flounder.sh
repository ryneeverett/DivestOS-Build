#!/bin/bash
cd "$DOS_BUILD_BASE""kernel/htc/flounder"
git apply $DOS_PATCHES_LINUX_CVES/0003-syskaller-Misc/ANY/0009.patch
git apply $DOS_PATCHES_LINUX_CVES/0005-Copperhead-Deny_USB/3.10/0001-Alt.patch
git apply $DOS_PATCHES_LINUX_CVES/0006-Copperhead-Kernel_Hardening/3.10/0004.patch
git apply $DOS_PATCHES_LINUX_CVES/0006-Copperhead-Kernel_Hardening/3.10/0007.patch
git apply $DOS_PATCHES_LINUX_CVES/0006-Copperhead-Kernel_Hardening/3.10/0008.patch
git apply $DOS_PATCHES_LINUX_CVES/0006-Copperhead-Kernel_Hardening/3.10/0009.patch
git apply $DOS_PATCHES_LINUX_CVES/0006-Copperhead-Kernel_Hardening/3.10/0010.patch
git apply $DOS_PATCHES_LINUX_CVES/0006-Copperhead-Kernel_Hardening/3.10/0011.patch
git apply $DOS_PATCHES_LINUX_CVES/0006-Copperhead-Kernel_Hardening/3.10/0012.patch
git apply $DOS_PATCHES_LINUX_CVES/0006-Copperhead-Kernel_Hardening/3.10/0013.patch
git apply $DOS_PATCHES_LINUX_CVES/0006-Copperhead-Kernel_Hardening/3.10/0014.patch
git apply $DOS_PATCHES_LINUX_CVES/0006-Copperhead-Kernel_Hardening/3.10/0015.patch
git apply $DOS_PATCHES_LINUX_CVES/0006-Copperhead-Kernel_Hardening/3.10/0016.patch
git apply $DOS_PATCHES_LINUX_CVES/0006-Copperhead-Kernel_Hardening/3.10/0017.patch
git apply $DOS_PATCHES_LINUX_CVES/0007-Accelerated_AES/3.10+/0011.patch
git apply $DOS_PATCHES_LINUX_CVES/0007-Accelerated_AES/3.10+/0012.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2014-9892/ANY/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2014-9900/ANY/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2015-7515/^4.4/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2015-8215/ANY/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2015-8944/ANY/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2015-8955/ANY/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2016-2475/ANY/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2016-7117/^4.5/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2016-8453/ANY/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2016-8464/3.10/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2016-8650/ANY/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2016-9576/3.10/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2016-9604/ANY/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2017-0449/ANY/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2017-0537/ANY/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2017-0861/3.10/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2017-1000365/3.10/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2017-1000410/ANY/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2017-10996/ANY/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2017-11089/ANY/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2017-11090/ANY/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2017-12153/3.2-^3.16/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2017-13168/3.10/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2017-13215/ANY/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2017-13216/3.10/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2017-13245/ANY/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2017-13246/ANY/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2017-13273/ANY/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2017-13292/ANY/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2017-13305/ANY/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2017-15837/ANY/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2017-15868/3.10/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2017-15868/3.10/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2017-16526/^4.13/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2017-16532/^4.13/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2017-16534/ANY/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2017-16537/^4.13/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2017-16538/^4.13/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2017-16538/^4.13/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2017-16643/3.5+/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2017-16645/ANY/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2017-16650/ANY/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2017-16USB/ANY/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2017-16USB/ANY/0005.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2017-16USB/ANY/0006.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2017-17558/ANY/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2017-17806/ANY/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2017-2671/^4.10/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2017-5669/^4.9/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2017-5972/ANY/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2017-6345/^4.9/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2017-6348/^4.9/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2017-6951/^3.14/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2017-7472/ANY/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2017-7533/3.10/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2017-7533/3.10/0003.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2017-9242/^4.11/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2018-1068/ANY/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2018-10876/ANY/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2018-10876/ANY/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2018-10879/3.10/0004.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2018-10880/3.10/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2018-10881/ANY/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2018-10882/3.10/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2018-10883/ANY/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2018-10883/ANY/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2018-1092/ANY/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2018-3584/ANY/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2018-5390/3.10/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2018-5390/3.10/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2018-9416/ANY/0001.patch
#git apply $DOS_PATCHES_LINUX_CVES/CVE-2018-9514/ANY/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2018-9515/ANY/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2018-9516/ANY/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2018-9518/ANY/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/LVT-2017-0003/3.10/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/Untracked-01/ANY/0008-nfsd-check-for-oversized-NFSv2-v3-arguments.patch
git apply $DOS_PATCHES_LINUX_CVES/Untracked-02/ANY/797912_0001-usb-gadget-Fix-synchronization-issue-between-f_audio.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2016-2475/ANY/0001.patch
editKernelLocalversion "-dos.p96"
cd "$DOS_BUILD_BASE"
