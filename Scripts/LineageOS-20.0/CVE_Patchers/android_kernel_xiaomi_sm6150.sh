#!/bin/bash
if cd "$DOS_BUILD_BASE""kernel/xiaomi/sm6150"; then
git apply $DOS_PATCHES_LINUX_CVES/0001-LinuxIncrementals/4.14/4.14.0332-0333.patch --exclude=Makefile
git apply $DOS_PATCHES_LINUX_CVES/0001-LinuxIncrementals/4.14/4.14.0333-0334.patch --exclude=Makefile
git apply $DOS_PATCHES_LINUX_CVES/0001-LinuxIncrementals/4.14/4.14.0334-0335.patch --exclude=Makefile
git apply $DOS_PATCHES_LINUX_CVES/0002-Misc_Fixes-Steam/4.14/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/0003-syzkaller-Misc/ANY/0008.patch
git apply $DOS_PATCHES_LINUX_CVES/0005-Graphene-Deny_USB/4.14/0003.patch
git apply $DOS_PATCHES_LINUX_CVES/0008-Graphene-Kernel_Hardening-allocsize/4.14/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/0008-Graphene-Kernel_Hardening-allocsize/4.14/0007.patch
git apply $DOS_PATCHES_LINUX_CVES/0008-Graphene-Kernel_Hardening-allocsize/4.14/0011.patch
git apply $DOS_PATCHES_LINUX_CVES/0008-Graphene-Kernel_Hardening-allocsize/4.14/0016.patch
git apply $DOS_PATCHES_LINUX_CVES/0008-Graphene-Kernel_Hardening-allocsize/4.14/0021.patch
git apply $DOS_PATCHES_LINUX_CVES/0008-Graphene-Kernel_Hardening-bugon/4.14/0010.patch
git apply $DOS_PATCHES_LINUX_CVES/0008-Graphene-Kernel_Hardening-fortify/4.14/0004.patch
git apply $DOS_PATCHES_LINUX_CVES/0008-Graphene-Kernel_Hardening-misc/4.14/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/0008-Graphene-Kernel_Hardening-misc/4.14/0005.patch
git apply $DOS_PATCHES_LINUX_CVES/0008-Graphene-Kernel_Hardening-misc/4.14/0010.patch
git apply $DOS_PATCHES_LINUX_CVES/0008-Graphene-Kernel_Hardening-misc/4.14/0018.patch
git apply $DOS_PATCHES_LINUX_CVES/0008-Graphene-Kernel_Hardening-misc/4.14/0021.patch
git apply $DOS_PATCHES_LINUX_CVES/0008-Graphene-Kernel_Hardening-random/4.14/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/0008-Graphene-Kernel_Hardening-random/4.14/0007.patch
git apply $DOS_PATCHES_LINUX_CVES/0008-Graphene-Kernel_Hardening-random/4.14/0012.patch
git apply $DOS_PATCHES_LINUX_CVES/0008-Graphene-Kernel_Hardening-random/4.14/0017.patch
git apply $DOS_PATCHES_LINUX_CVES/0008-Graphene-Kernel_Hardening-ro/4.14/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/0008-Graphene-Kernel_Hardening-ro/4.14/0007.patch
git apply $DOS_PATCHES_LINUX_CVES/0008-Graphene-Kernel_Hardening-ro/4.14/0012.patch
git apply $DOS_PATCHES_LINUX_CVES/0008-Graphene-Kernel_Hardening-ro/4.14/0017.patch
git apply $DOS_PATCHES_LINUX_CVES/0008-Graphene-Kernel_Hardening-ro/4.14/0028.patch
git apply $DOS_PATCHES_LINUX_CVES/0008-Graphene-Kernel_Hardening-ro/4.14/0030.patch
git apply $DOS_PATCHES_LINUX_CVES/0008-Graphene-Kernel_Hardening-ro/4.14/0032.patch
git apply $DOS_PATCHES_LINUX_CVES/0008-Graphene-Kernel_Hardening-ro/4.14/0038.patch
git apply $DOS_PATCHES_LINUX_CVES/0008-Graphene-Kernel_Hardening-sanitize/4.14/0005.patch
git apply $DOS_PATCHES_LINUX_CVES/0008-Graphene-Kernel_Hardening-sanitize/4.14/0009.patch
git apply $DOS_PATCHES_LINUX_CVES/0008-Graphene-Kernel_Hardening-sanitize/4.14/0015.patch
git apply $DOS_PATCHES_LINUX_CVES/0008-Graphene-Kernel_Hardening-sanitize/4.14/0017.patch
git apply $DOS_PATCHES_LINUX_CVES/0008-Graphene-Kernel_Hardening-slab/4.14/0006.patch
git apply $DOS_PATCHES_LINUX_CVES/0008-Graphene-Kernel_Hardening-slab/4.14/0010.patch
git apply $DOS_PATCHES_LINUX_CVES/0008-Graphene-Kernel_Hardening-slab/4.14/0014.patch
git apply $DOS_PATCHES_LINUX_CVES/0008-Graphene-Kernel_Hardening-slab/4.14/0018.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2015-7837/ANY/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2016-3695/ANY/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2017-5754/^4.19/0157.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2017-18232/4.14/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2018-5897/ANY/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2018-9415/ANY/0005.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2018-20855/^4.18/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2019-3874/^5.1/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2019-9444/ANY/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2019-10564/ANY/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2019-11191/^5.0/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2019-12378/^5.1.5/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2019-12455/^5.2/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2019-12456/^5.1.5/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2019-15291/4.14/0004.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2019-16921/^4.16/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2019-18786/4.14/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2019-19051/4.14/0008.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2019-19068/4.14/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2019-19602/^5.4/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2019-20908/^5.2/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2020-11146/ANY/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2020-15780/^5.8/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2020-16119/^5.10/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2020-29372/^5.7/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2020-BleedingToothExtras/^5.10/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2021-1963/ANY/0003.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2021-3493/^5.10/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2021-28039/^5.11/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2021-35085/qca-wifi-host-cmn/0001.patch --directory=drivers/staging/qca-wifi-host-cmn
git apply $DOS_PATCHES_LINUX_CVES/CVE-2021-46912/^5.12/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2021-46958/^5.12/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2021-46982/^5.13/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2021-46999/^5.12/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2021-47007/^5.12/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2021-47058/^5.12/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2021-47173/4.14/0003.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2021-47209/^5.15/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2021-47234/^5.13/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2021-47266/^5.13/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2021-47283/^5.12/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2021-47346/^5.13/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2021-47430/^5.15/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2021-47455/^5.15/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2021-47472/4.14/0003.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2021-47498/^5.15/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2022-3061/^5.18/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2022-4382/^6.2/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2022-20148/^5.15/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2022-20158/4.14/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2022-20158/4.14/0003.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2022-20371/ANY/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2022-27950/^5.16/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2023-0590/4.14/0005.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2023-1989/4.14/0003.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2023-3567/4.14/0007.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2023-3777/^6.5/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2023-6270/^6.8/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2023-6932/4.14/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2023-23000/^5.16/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2023-25775/4.14/0003.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2023-28553/qca-wifi-host-cmn/0001.patch --directory=drivers/staging/qca-wifi-host-cmn
git apply $DOS_PATCHES_LINUX_CVES/CVE-2023-31083/^6.5/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2023-45863/4.14/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2023-46838/^6.7/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2023-52436/^6.7/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2023-52437/^6.7/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2023-52443/^6.7/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2023-52444/^6.7/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2023-52445/^6.7/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2023-52464/^6.7/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2023-52470/^6.7/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2023-52486/^6.7/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2023-52594/^6.6/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2023-52595/^6.6/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2023-52598/^6.7/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2023-52599/^6.7/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2023-52600/^6.7/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2023-52602/^6.7/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2023-52603/^6.7/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2023-52604/^6.7/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2023-52606/^6.7/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2023-52619/^6.7/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2023-52650/^6.7/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2023-52670/^6.7/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2023-52685/^6.7/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2023-52693/^6.7/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2023-52699/^6.8/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2023-52707/^6.2/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2023-52741/^6.2/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2023-52746/^6.2/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2023-52759/4.14/0003.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2023-52764/4.14/0003.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2023-52774/4.14/0003.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2023-52784/^6.6/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2023-52789/4.14/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2023-52799/4.14/0003.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2023-52804/4.14/0003.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2023-52805/4.14/0003.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2023-52806/4.14/0003.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2023-52809/4.14/0003.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2023-52810/4.14/0003.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2023-52813/4.14/0003.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2023-52818/4.14/0003.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2023-52819/4.14/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2023-52832/4.14/0003.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2023-52836/4.14/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2023-52843/4.14/0003.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2023-52845/4.14/0003.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2023-52847/^6.6/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2023-52855/4.14/0003.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2023-52865/4.14/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2023-52867/4.14/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2023-52875/4.14/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-0340/^6.4/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-21475/ANY/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-22099/^6.8/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-23849/^6.7/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-24855/^6.4/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-24857/^6.9/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-24861/^6.8/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-25739/^6.8/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-26600/^6.8/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-26635/^6.7/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-26636/^6.7/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-26645/^6.8/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-26651/^6.8/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-26663/^6.8/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-26675/^6.8/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-26679/^6.8/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-26697/^6.8/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-26704/^6.7/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-26720/^6.8/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-26752/^6.8/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-26754/^6.8/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-26760/^6.8/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-26772/^6.7/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-26777/^6.7/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-26778/^6.7/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-26791/^6.7/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-26793/^6.8/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-26805/^6.8/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-26816/^6.8/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-26825/^6.8/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-26839/^6.8/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-26859/^6.8/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-26861/^6.8/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-26874/^6.8/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-26875/^6.8/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-26880/^6.8/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-26889/^6.8/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-26894/^6.8/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-26900/^6.8/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-26901/^6.8/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-26917/^6.8/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-26950/^6.8/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-26951/^6.8/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-26956/^6.8/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-26961/^6.7/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-26965/^6.8/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-26966/^6.8/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-26972/^6.8/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-26973/^6.8/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-26981/^6.9/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-26993/^6.9/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-27000/^6.9/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-27009/^6.9/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-27013/^6.9/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-27033/^6.8/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-27059/^6.8/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-27074/^6.8/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-27075/^6.8/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-27388/^6.8/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-27393/^6.9/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-27398/^6.9/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-27399/^6.9/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-27401/^6.9/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-27405/^6.8/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-27410/^6.8/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-27412/^6.8/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-27413/^6.8/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-27416/^6.8/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-27419/^6.8/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-27420/^6.8/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-27421/^6.8/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-27426/^6.8/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-27427/^6.8/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-27428/^6.8/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-27429/^6.8/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-27430/^6.8/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-35789/^6.8/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-35806/^6.8/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-35822/^6.9/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-35824/^6.8/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-35825/^6.8/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-35828/^6.8/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-35830/^6.7/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-35849/^6.8/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-35879/^6.9/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-35886/^6.9/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-35887/^6.9/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-35915/^6.8/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-35922/^6.8/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-35930/^6.8/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-35933/^6.8/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-35935/^6.8/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-35944/^6.8/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-35947/^6.9/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-35950/^6.9/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-35954/^6.9/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-35962/^6.9/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-35969/^6.9/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-35978/^6.9/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-35982/^6.9/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-36004/^6.9/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-36013/^6.9/0001.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2019-12819/4.14/0006.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-27424/^6.8/0002.patch
git apply $DOS_PATCHES_LINUX_CVES/CVE-2024-27425/^6.8/0002.patch
editKernelLocalversion "-dos.p257"
else echo "kernel_xiaomi_sm6150 is unavailable, not patching.";
fi;
cd "$DOS_BUILD_BASE"
