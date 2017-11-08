#!/bin/bash
cd $base"kernel/lge/hammerhead"
git apply $cvePatches/CVE-2014-9881/ANY/0001.patch
git apply $cvePatches/CVE-2014-9882/ANY/0001.patch
git apply $cvePatches/CVE-2015-1593/ANY/0001.patch
git apply $cvePatches/CVE-2016-3894/ANY/0001.patch
git apply $cvePatches/CVE-2016-8650/ANY/0001.patch
git apply $cvePatches/CVE-2016-9576/3.4/0001.patch
git apply $cvePatches/CVE-2016-9604/ANY/0001.patch
git apply $cvePatches/CVE-2017-0611/3.4/0001.patch
git apply $cvePatches/CVE-2017-0710/ANY/0001.patch
git apply $cvePatches/CVE-2017-0750/ANY/0001.patch
git apply $cvePatches/CVE-2017-0751/ANY/0001.patch
git apply $cvePatches/CVE-2017-0786/ANY/0001.patch
git apply $cvePatches/CVE-2017-12153/3.2-^3.16/0001.patch
git apply $cvePatches/CVE-2017-16526/ANY/0001.patch
git apply $cvePatches/CVE-2017-16532/ANY/0001.patch
git apply $cvePatches/CVE-2017-16533/ANY/0001.patch
git apply $cvePatches/CVE-2017-16535/ANY/0001.patch
git apply $cvePatches/CVE-2017-16643/ANY/0001.patch
git apply $cvePatches/CVE-2017-16650/ANY/0001.patch
git apply $cvePatches/CVE-2017-16USB/ANY/0001.patch
git apply $cvePatches/CVE-2017-16USB/ANY/0005.patch
git apply $cvePatches/CVE-2017-2671/^4.10/0001.patch
git apply $cvePatches/CVE-2017-5970/^4.9/0001.patch
git apply $cvePatches/CVE-2017-6074/^4.9/0001.patch
git apply $cvePatches/CVE-2017-6345/^4.9/0001.patch
git apply $cvePatches/CVE-2017-6348/^4.9/0001.patch
git apply $cvePatches/CVE-2017-6951/^3.14/0001.patch
git apply $cvePatches/CVE-2017-7308/ANY/0003.patch
git apply $cvePatches/CVE-2017-7487/ANY/0001.patch
git apply $cvePatches/CVE-2017-8246/3.4/0002.patch
git apply $cvePatches/CVE-2017-8247/ANY/0001.patch
git apply $cvePatches/CVE-2017-8254/3.4/0001.patch
git apply $cvePatches/CVE-2017-9242/^4.11/0001.patch
git apply $cvePatches/CVE-2017-9684/ANY/0001.patch
git apply $cvePatches/Untracked/ANY/0008-nfsd-check-for-oversized-NFSv2-v3-arguments.patch
cd $base
