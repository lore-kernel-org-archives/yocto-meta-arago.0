Return-Path: <ceh@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 14888529B3
	for <meta-arago@arago-project.org>;
	Thu, 12 Mar 2015 13:10:05 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2CDA4K9025153
	for <meta-arago@arago-project.org>; Thu, 12 Mar 2015 08:10:04 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2CDA3bj018938
	for <meta-arago@arago-project.org>; Thu, 12 Mar 2015 08:10:03 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 12 Mar 2015 08:10:02 -0500
Received: from [158.218.103.10] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2CDA2CX002437;
	Thu, 12 Mar 2015 08:10:02 -0500
Message-ID: <5501902A.4060206@ti.com>
Date: Thu, 12 Mar 2015 09:10:02 -0400
From: Carlos Hernandez <ceh@ti.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <1425993213-13246-1-git-send-email-ceh@ti.com>
	<20150311235329.GD23587@edge>
	<32B5D12402BE454796026F6AC58AA86E33115ACC@DLEE08.ent.ti.com>
	<20150312004722.GE23587@edge> <20150312040513.GI23587@edge>
In-Reply-To: <20150312040513.GI23587@edge>
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] recipes-devtools: New ltp-ddt_1.0.0 recipe
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Mar 2015 13:10:05 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/12/2015 12:05 AM, Denys Dmytriyenko wrote:
> Doesn't help. It still fails for am57xx-evm. It seems to build fine for am335x-evm...
>
> Besides the undefined yylex error (which might be non-fatal), I also see
> these:
>
> | clock_gettime03.c:141:4: error: '__NR_clock_gettime' undeclared (first use in this function)
>
> | clock_gettime03.c:168:31: error: 'cleanup' undeclared (first use in this function)
>
> | faccessat01.c:70:21: error: '__NR_faccessat' undeclared (first use in this function)
>

I saw that error but it went away after cleaning ltp-ddt and rebuilding. 
See log below.

a0850405@a0850405-off1:~/code/tisdk/build$ MACHINE=dra7xx-evm bitbake 
ltp-ddt -c clean
Loading cache: 100% 
|###################################################################################################################################################################################################| 
ETA:  00:00:00
Loaded 2194 entries from dependency cache.
Parsing recipes: 100% 
|#################################################################################################################################################################################################| 
Time: 00:00:02
Parsing of 1766 .bb files complete (1758 cached, 8 parsed). 2201 
targets, 199 skipped, 0 masked, 0 errors.
WARNING: No recipes available for:
/home/a0850405/code/tisdk/sources/meta-arago/meta-arago-distro/recipes-qt/qt5/qtbase_5.4.1.bbappend 

/home/a0850405/code/tisdk/sources/meta-arago/meta-arago-distro/recipes-qt/qt5/qtwebkit_5.4.1.bbappend 

NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION        = "1.22.0"
BUILD_SYS         = "i686-linux"
NATIVELSBSTRING   = "Ubuntu-14.04"
TARGET_SYS        = "arm-oe-linux-gnueabi"
MACHINE           = "dra7xx-evm"
DISTRO            = "arago"
DISTRO_VERSION    = "2015.02"
TUNE_FEATURES     = "armv7a vfp thumb neon callconvention-hard cortexa15"
TARGET_FPU        = "vfp-neon"
meta-arago-distro
meta-arago-extras = "master:7362ca23ba513bc8af251da6b8b8a7a029aeafca"
meta-qt5          = "master:adeaa6128b665920eb98eb7c064f4aacbd74b873"
toolchain-layer
meta-networking
meta-ruby
meta-oe           = "daisy:91dbdff2e1a0ca3dae72dfe0aaa022fc28974314"
meta-ti           = "daisy:a47fe3573ec2c7662eb385049807dea4f81fa284"
meta-linaro-toolchain = "daisy:bc63e777ad2748b8bfa7fa70ffd74700fa21a567"
meta              = "daisy:f34de2175f1d6a443f219b8ceaaf796cfbc6efd5"

NOTE: Preparing runqueue
NOTE: Executing RunQueue Tasks
NOTE: Tasks Summary: Attempted 1 tasks of which 0 didn't need to be 
rerun and all succeeded.

Summary: There was 1 WARNING message shown.


a0850405@a0850405-off1:~/code/tisdk/build$ MACHINE=dra7xx-evm bitbake 
ltp-ddt
Loading cache: 100% 
|###################################################################################################################################################################################################| 
ETA:  00:00:00
Loaded 2194 entries from dependency cache.
Parsing recipes: 100% 
|#################################################################################################################################################################################################| 
Time: 00:00:01
Parsing of 1766 .bb files complete (1758 cached, 8 parsed). 2201 
targets, 199 skipped, 0 masked, 0 errors.
WARNING: No recipes available for:
/home/a0850405/code/tisdk/sources/meta-arago/meta-arago-distro/recipes-qt/qt5/qtbase_5.4.1.bbappend 

/home/a0850405/code/tisdk/sources/meta-arago/meta-arago-distro/recipes-qt/qt5/qtwebkit_5.4.1.bbappend 

NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION        = "1.22.0"
BUILD_SYS         = "i686-linux"
NATIVELSBSTRING   = "Ubuntu-14.04"
TARGET_SYS        = "arm-oe-linux-gnueabi"
MACHINE           = "dra7xx-evm"
DISTRO            = "arago"
DISTRO_VERSION    = "2015.02"
TUNE_FEATURES     = "armv7a vfp thumb neon callconvention-hard cortexa15"
TARGET_FPU        = "vfp-neon"
meta-arago-distro
meta-arago-extras = "master:7362ca23ba513bc8af251da6b8b8a7a029aeafca"
meta-qt5          = "master:adeaa6128b665920eb98eb7c064f4aacbd74b873"
toolchain-layer
meta-networking
meta-ruby
meta-oe           = "daisy:91dbdff2e1a0ca3dae72dfe0aaa022fc28974314"
meta-ti           = "daisy:a47fe3573ec2c7662eb385049807dea4f81fa284"
meta-linaro-toolchain = "daisy:bc63e777ad2748b8bfa7fa70ffd74700fa21a567"
meta              = "daisy:f34de2175f1d6a443f219b8ceaaf796cfbc6efd5"

NOTE: Preparing runqueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
NOTE: Tasks Summary: Attempted 465 tasks of which 452 didn't need to be 
rerun and all succeeded.

Summary: There was 1 WARNING message shown.


a0850405@a0850405-off1:~/code/tisdk/build$ ls 
arago-tmp-external-linaro-toolchain/
abi_version     buildstats/     cache/          deploy/ log/            
qa.log          saved_tmpdir    sstate-control/ stamps/         
sysroots/       work/
a0850405@a0850405-off1:~/code/tisdk/build$ ls 
arago-tmp-external-linaro-toolchain/deploy/
images/   ipk/      licenses/
a0850405@a0850405-off1:~/code/tisdk/build$ ls 
arago-tmp-external-linaro-toolchain/deploy/ipk/
all/                    cortexa15t2hf-vfp-neon/ dra7xx_evm/
a0850405@a0850405-off1:~/code/tisdk/build$ ls 
arago-tmp-external-linaro-toolchain/deploy/ipk/dra7xx_evm/ -ltr
...
...
-rw-r--r-- 2 a0850405 a0850405  38745494 Mar 10 16:32 
ltp-ddt-dbg_1.0.0-r1-arago10+gitrAUTOINC+eef6281052_dra7xx_evm.ipk
-rw-r--r-- 2 a0850405 a0850405       952 Mar 10 16:32 
ltp-ddt-dev_1.0.0-r1-arago10+gitrAUTOINC+eef6281052_dra7xx_evm.ipk
-rw-r--r-- 2 a0850405 a0850405     26224 Mar 10 16:32 
ltp-ddt-doc_1.0.0-r1-arago10+gitrAUTOINC+eef6281052_dra7xx_evm.ipk
-rw-r--r-- 2 a0850405 a0850405  12129096 Mar 10 16:32 
ltp-ddt_1.0.0-r1-arago10+gitrAUTOINC+eef6281052_dra7xx_evm.ipk
-rw-r--r-- 2 a0850405 a0850405      3822 Mar 10 16:32 
kernel-module-coproc-devfreq_1.0.0-r1-arago10+gitrAUTOINC+eef6281052_dra7xx_evm.ipk
-rw-r--r-- 2 a0850405 a0850405      3132 Mar 10 16:32 
kernel-module-gpio-test_1.0.0-r1-arago10+gitrAUTOINC+eef6281052_dra7xx_evm.ipk
-rw-r--r-- 2 a0850405 a0850405      2452 Mar 10 16:32 
kernel-module-kst-timer_1.0.0-r1-arago10+gitrAUTOINC+eef6281052_dra7xx_evm.ipk
-rw-r--r-- 2 a0850405 a0850405      2828 Mar 10 16:32 
kernel-module-rpmsg-client-sample_1.0.0-r1-arago10+gitrAUTOINC+eef6281052_dra7xx_evm.ipk


