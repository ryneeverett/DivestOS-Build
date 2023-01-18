#!/bin/bash
cd "$DOS_BUILD_BASE""kernel/google/msm-4.9"
git apply $DOS_PATCHES_LINUX_CVES/0005-Graphene-Deny_USB/4.9/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/0008-Graphene-Kernel_Hardening/4.9/0025.patch
git apply $DOS_PATCHES_LINUX_CVES/0008-Graphene-Kernel_Hardening/4.9/0026.patch
git apply $DOS_PATCHES_LINUX_CVES/0008-Graphene-Kernel_Hardening/4.9/0027.patch
git apply $DOS_PATCHES_LINUX_CVES/0008-Graphene-Kernel_Hardening/4.9/0028.patch
git apply $DOS_PATCHES_LINUX_CVES/0008-Graphene-Kernel_Hardening/4.9/0029.patch
git apply $DOS_PATCHES_LINUX_CVES/0008-Graphene-Kernel_Hardening/4.9/0030.patch
git apply $DOS_PATCHES_LINUX_CVES/0008-Graphene-Kernel_Hardening/4.9/0031.patch
git apply $DOS_PATCHES_LINUX_CVES/0008-Graphene-Kernel_Hardening/4.9/0032.patch
git apply $DOS_PATCHES_LINUX_CVES/0008-Graphene-Kernel_Hardening/4.9/0033.patch
git apply $DOS_PATCHES_LINUX_CVES/0008-Graphene-Kernel_Hardening/4.9/0034.patch
git apply $DOS_PATCHES_LINUX_CVES/0008-Graphene-Kernel_Hardening/4.9/0035.patch
git apply $DOS_PATCHES_LINUX_CVES/0008-Graphene-Kernel_Hardening/4.9/0036.patch
git apply $DOS_PATCHES_LINUX_CVES/0008-Graphene-Kernel_Hardening/4.9/0037.patch
git apply $DOS_PATCHES_LINUX_CVES/0008-Graphene-Kernel_Hardening/4.9/0038.patch
git apply $DOS_PATCHES_LINUX_CVES/0008-Graphene-Kernel_Hardening/4.9/0039.patch
git apply $DOS_PATCHES_LINUX_CVES/0008-Graphene-Kernel_Hardening/4.9/0040.patch
git apply $DOS_PATCHES_LINUX_CVES/0008-Graphene-Kernel_Hardening/4.9/0041.patch
git apply $DOS_PATCHES_LINUX_CVES/0008-Graphene-Kernel_Hardening/4.9/0042.patch
git apply $DOS_PATCHES_LINUX_CVES/0008-Graphene-Kernel_Hardening/4.9/0043.patch
git apply $DOS_PATCHES_LINUX_CVES/0008-Graphene-Kernel_Hardening/4.9/0044.patch
git apply $DOS_PATCHES_LINUX_CVES/0008-Graphene-Kernel_Hardening/4.9/0045.patch
git apply $DOS_PATCHES_LINUX_CVES/0008-Graphene-Kernel_Hardening/4.9/0046.patch
git apply $DOS_PATCHES_LINUX_CVES/0008-Graphene-Kernel_Hardening/4.9/0047.patch
git apply $DOS_PATCHES_LINUX_CVES/0008-Graphene-Kernel_Hardening/4.9/0048.patch
git apply $DOS_PATCHES_LINUX_CVES/0008-Graphene-Kernel_Hardening/4.9/0049.patch
git apply $DOS_PATCHES_LINUX_CVES/0008-Graphene-Kernel_Hardening/4.9/0050.patch
git apply $DOS_PATCHES_LINUX_CVES/0008-Graphene-Kernel_Hardening/4.9/0051.patch
git apply $DOS_PATCHES_LINUX_CVES/0008-Graphene-Kernel_Hardening/4.9/0052.patch
git apply $DOS_PATCHES_LINUX_CVES/0008-Graphene-Kernel_Hardening/4.9/0053.patch
git apply $DOS_PATCHES_LINUX_CVES/0008-Graphene-Kernel_Hardening/4.9/0054.patch
git apply $DOS_PATCHES_LINUX_CVES/0008-Graphene-Kernel_Hardening/4.9/0055.patch
git apply $DOS_PATCHES_LINUX_CVES/0008-Graphene-Kernel_Hardening/ANY/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2015-7837/ANY/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2016-3695/ANY/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2017-16USB/ANY/0006.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2017-16USB/ANY/0008.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2017-16USB/ANY/0009.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2017-7477/4.9/0003.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2017-13693/^4.12.9/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2017-13694/^4.12.9/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2017-1000252/^4.13/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2018-5897/ANY/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2018-9415/ANY/0005.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2018-9462/ANY/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2018-9519/ANY/0001.patch
#git apply $DOS_PATCHES_LINUX_CVES/CVE-2018-11412/4.14/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2018-20855/^4.18/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2018-25020/4.14/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2019-10503/ANY/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2019-12378/^5.1.5/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2019-12455/^5.1.5/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2019-12456/^5.1.5/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2019-14040/ANY/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2019-15291/4.9/0007.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2019-16921/^4.16/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2019-16994/4.9/0004.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2019-19051/4.9/0013.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2019-19068/4.9/0005.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2019-20908/^5.2/0001.patch
#git apply $DOS_PATCHES_LINUX_CVES/CVE-2020-0067/4.14/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2020-3674/ANY/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2020-16119/^5.10/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2020-24394/4.14/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2021-3656/4.14/0004.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2021-33098/4.14/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2021-44879/^5.16/0001.patch
#git apply $DOS_PATCHES_LINUX_CVES/CVE-2021-45469/4.9-^5.16/0001.patch
#git apply $DOS_PATCHES_LINUX_CVES/CVE-2022-1204/4.14/0006.patch
#git apply $DOS_PATCHES_LINUX_CVES/CVE-2022-1204/4.14/0007.patch
#git apply $DOS_PATCHES_LINUX_CVES/CVE-2022-1204/4.14/0008.patch
#git apply $DOS_PATCHES_LINUX_CVES/CVE-2022-1204/4.14/0009.patch
#git apply $DOS_PATCHES_LINUX_CVES/CVE-2022-1204/4.14/0010.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2022-1679/4.14/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2022-2153/^5.17/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2022-2153/^5.17/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2022-3061/^5.18/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2022-3424/4.9/0004.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2022-20148/^5.15/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2022-20369/4.14/0006.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2022-20371/ANY/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2022-25664/ANY/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2022-25715/ANY/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2022-25722/ANY/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2022-27950/^5.16/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2022-28388/4.14/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2022-36280/4.9/0004.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2022-45934/4.9/0004.patch
editKernelLocalversion "-dos.p88"
cd "$DOS_BUILD_BASE"
