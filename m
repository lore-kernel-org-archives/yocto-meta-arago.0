Return-Path: <j-stiffler@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id DC8C252A78
	for <meta-arago@arago-project.org>;
	Thu, 12 Mar 2015 14:21:55 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2CELtX7003818
	for <meta-arago@arago-project.org>; Thu, 12 Mar 2015 09:21:55 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2CELrfX029683
	for <meta-arago@arago-project.org>; Thu, 12 Mar 2015 09:21:54 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0224.002; Thu, 12 Mar 2015 09:21:53 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Hernandez, Carlos" <ceh@ti.com>, "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] recipes-devtools: New ltp-ddt_1.0.0 recipe
Thread-Index: AQHQWzQO+VOPk3+2OEmUSaboahin5p0YSo6AgAAOXYCAAACxAIAAN0iAgACYOAD//650YIAADnHQ
Date: Thu, 12 Mar 2015 14:21:53 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F95814107E1F@DFLE09.ent.ti.com>
References: <1425993213-13246-1-git-send-email-ceh@ti.com>
	<20150311235329.GD23587@edge>
	<32B5D12402BE454796026F6AC58AA86E33115ACC@DLEE08.ent.ti.com>
	<20150312004722.GE23587@edge> <20150312040513.GI23587@edge>
	<5501902A.4060206@ti.com>
	<4B26FB5A64EBA14C87266869E037F95814107D47@DFLE09.ent.ti.com>
In-Reply-To: <4B26FB5A64EBA14C87266869E037F95814107D47@DFLE09.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
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
X-List-Received-Date: Thu, 12 Mar 2015 14:21:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I've done some more research since this is breaking all of my builds. Here =
is the command causing the error:

arm-linux-gnueabihf-gcc  -march=3Darmv7-a -marm -mthumb-interwork -mfloat-a=
bi=3Dhard -mfpu=3Dneon -mtune=3Dcortex-a9  -L/opt/linaro-2013.03/arm-linux-=
gnueabihf/lib -Wl,-rpath-link,/opt/linaro-2013.03/arm-linux-gnueabihf/lib -=
Wl,-O1 -Wl,--hash-style=3Dgnu --sysroot=3D/home/gtbldadm/ti/oe-layersetup/b=
uild-CORTEX_1/arago-tmp-external-linaro-toolchain/sysroots/am437x-evm -L/op=
t/linaro-2013.03/arm-linux-gnueabihf/lib -Wl,-rpath-link,/opt/linaro-2013.0=
3/arm-linux-gnueabihf/lib -Wl,-O1 -Wl,--hash-style=3Dgnu  -L../lib  ltp-bum=
p.o zoolib.o   -lm -lfl -o ltp-bump
/home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-external-linaro-to=
olchain/sysroots/am437x-evm/usr/lib/libfl.so: undefined reference to `yylex=
'
collect2: error: ld returned 1 exit status
make[1]: *** [ltp-bump] Error 1
make[1]: *** Waiting for unfinished jobs....


The symbol 'yylex' comes from a flex generated file. Not sure how this isn'=
t being seen in all builds... This will need to link with a flex generated =
file. In this case, all I can see is scan.c, which is generated from scan.l=
. So should ltp_bump link with scan.o? If not, then why would ltp-bump need=
 to link with libfl.so?

Can you find the log for linking 'ltp-bump' in one of the successful builds=
?




-----Original Message-----
From: meta-arago-bounces@arago-project.org [mailto:meta-arago-bounces@arago=
-project.org] On Behalf Of Stiffler, Jacob
Sent: Thursday, March 12, 2015 9:20 AM
To: Hernandez, Carlos; Dmytriyenko, Denys
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [PATCH] recipes-devtools: New ltp-ddt_1.0.0 recip=
e

Sounds like a missing dependency issue if an initial clean build fails, the=
n cleaning ltp-ddt before continuing the build allows it to succeed in some=
 cases.

- Jake

-----Original Message-----
From: meta-arago-bounces@arago-project.org [mailto:meta-arago-bounces@arago=
-project.org] On Behalf Of Hernandez, Carlos
Sent: Thursday, March 12, 2015 9:10 AM
To: Dmytriyenko, Denys
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [PATCH] recipes-devtools: New ltp-ddt_1.0.0 recip=
e

On 03/12/2015 12:05 AM, Denys Dmytriyenko wrote:
> Doesn't help. It still fails for am57xx-evm. It seems to build fine for a=
m335x-evm...
>
> Besides the undefined yylex error (which might be non-fatal), I also=20
> see
> these:
>
> | clock_gettime03.c:141:4: error: '__NR_clock_gettime' undeclared=20
> | (first use in this function)
>
> | clock_gettime03.c:168:31: error: 'cleanup' undeclared (first use in=20
> | this function)
>
> | faccessat01.c:70:21: error: '__NR_faccessat' undeclared (first use=20
> | in this function)
>

I saw that error but it went away after cleaning ltp-ddt and rebuilding.=20
See log below.

a0850405@a0850405-off1:~/code/tisdk/build$ MACHINE=3Ddra7xx-evm bitbake ltp=
-ddt -c clean Loading cache: 100%=20
|#######################################################################
|#######################################################################
|#####################################################|
ETA:  00:00:00
Loaded 2194 entries from dependency cache.
Parsing recipes: 100%=20
|#######################################################################
|#######################################################################
|###################################################|
Time: 00:00:02
Parsing of 1766 .bb files complete (1758 cached, 8 parsed). 2201 targets, 1=
99 skipped, 0 masked, 0 errors.
WARNING: No recipes available for:
/home/a0850405/code/tisdk/sources/meta-arago/meta-arago-distro/recipes-qt/q=
t5/qtbase_5.4.1.bbappend=20

/home/a0850405/code/tisdk/sources/meta-arago/meta-arago-distro/recipes-qt/q=
t5/qtwebkit_5.4.1.bbappend=20

NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION        =3D "1.22.0"
BUILD_SYS         =3D "i686-linux"
NATIVELSBSTRING   =3D "Ubuntu-14.04"
TARGET_SYS        =3D "arm-oe-linux-gnueabi"
MACHINE           =3D "dra7xx-evm"
DISTRO            =3D "arago"
DISTRO_VERSION    =3D "2015.02"
TUNE_FEATURES     =3D "armv7a vfp thumb neon callconvention-hard cortexa15"
TARGET_FPU        =3D "vfp-neon"
meta-arago-distro
meta-arago-extras =3D "master:7362ca23ba513bc8af251da6b8b8a7a029aeafca"
meta-qt5          =3D "master:adeaa6128b665920eb98eb7c064f4aacbd74b873"
toolchain-layer
meta-networking
meta-ruby
meta-oe           =3D "daisy:91dbdff2e1a0ca3dae72dfe0aaa022fc28974314"
meta-ti           =3D "daisy:a47fe3573ec2c7662eb385049807dea4f81fa284"
meta-linaro-toolchain =3D "daisy:bc63e777ad2748b8bfa7fa70ffd74700fa21a567"
meta              =3D "daisy:f34de2175f1d6a443f219b8ceaaf796cfbc6efd5"

NOTE: Preparing runqueue
NOTE: Executing RunQueue Tasks
NOTE: Tasks Summary: Attempted 1 tasks of which 0 didn't need to be rerun a=
nd all succeeded.

Summary: There was 1 WARNING message shown.


a0850405@a0850405-off1:~/code/tisdk/build$ MACHINE=3Ddra7xx-evm bitbake ltp=
-ddt Loading cache: 100%=20
|#######################################################################
|#######################################################################
|#####################################################|
ETA:  00:00:00
Loaded 2194 entries from dependency cache.
Parsing recipes: 100%=20
|#######################################################################
|#######################################################################
|###################################################|
Time: 00:00:01
Parsing of 1766 .bb files complete (1758 cached, 8 parsed). 2201 targets, 1=
99 skipped, 0 masked, 0 errors.
WARNING: No recipes available for:
/home/a0850405/code/tisdk/sources/meta-arago/meta-arago-distro/recipes-qt/q=
t5/qtbase_5.4.1.bbappend=20

/home/a0850405/code/tisdk/sources/meta-arago/meta-arago-distro/recipes-qt/q=
t5/qtwebkit_5.4.1.bbappend=20

NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION        =3D "1.22.0"
BUILD_SYS         =3D "i686-linux"
NATIVELSBSTRING   =3D "Ubuntu-14.04"
TARGET_SYS        =3D "arm-oe-linux-gnueabi"
MACHINE           =3D "dra7xx-evm"
DISTRO            =3D "arago"
DISTRO_VERSION    =3D "2015.02"
TUNE_FEATURES     =3D "armv7a vfp thumb neon callconvention-hard cortexa15"
TARGET_FPU        =3D "vfp-neon"
meta-arago-distro
meta-arago-extras =3D "master:7362ca23ba513bc8af251da6b8b8a7a029aeafca"
meta-qt5          =3D "master:adeaa6128b665920eb98eb7c064f4aacbd74b873"
toolchain-layer
meta-networking
meta-ruby
meta-oe           =3D "daisy:91dbdff2e1a0ca3dae72dfe0aaa022fc28974314"
meta-ti           =3D "daisy:a47fe3573ec2c7662eb385049807dea4f81fa284"
meta-linaro-toolchain =3D "daisy:bc63e777ad2748b8bfa7fa70ffd74700fa21a567"
meta              =3D "daisy:f34de2175f1d6a443f219b8ceaaf796cfbc6efd5"

NOTE: Preparing runqueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
NOTE: Tasks Summary: Attempted 465 tasks of which 452 didn't need to be rer=
un and all succeeded.

Summary: There was 1 WARNING message shown.


a0850405@a0850405-off1:~/code/tisdk/build$ ls arago-tmp-external-linaro-too=
lchain/
abi_version     buildstats/     cache/          deploy/ log/           =20
qa.log          saved_tmpdir    sstate-control/ stamps/        =20
sysroots/       work/
a0850405@a0850405-off1:~/code/tisdk/build$ ls arago-tmp-external-linaro-too=
lchain/deploy/
images/   ipk/      licenses/
a0850405@a0850405-off1:~/code/tisdk/build$ ls arago-tmp-external-linaro-too=
lchain/deploy/ipk/
all/                    cortexa15t2hf-vfp-neon/ dra7xx_evm/
a0850405@a0850405-off1:~/code/tisdk/build$ ls arago-tmp-external-linaro-too=
lchain/deploy/ipk/dra7xx_evm/ -ltr ...
...
-rw-r--r-- 2 a0850405 a0850405  38745494 Mar 10 16:32 ltp-ddt-dbg_1.0.0-r1-=
arago10+gitrAUTOINC+eef6281052_dra7xx_evm.ipk
-rw-r--r-- 2 a0850405 a0850405       952 Mar 10 16:32=20
ltp-ddt-dev_1.0.0-r1-arago10+gitrAUTOINC+eef6281052_dra7xx_evm.ipk
-rw-r--r-- 2 a0850405 a0850405     26224 Mar 10 16:32=20
ltp-ddt-doc_1.0.0-r1-arago10+gitrAUTOINC+eef6281052_dra7xx_evm.ipk
-rw-r--r-- 2 a0850405 a0850405  12129096 Mar 10 16:32 ltp-ddt_1.0.0-r1-arag=
o10+gitrAUTOINC+eef6281052_dra7xx_evm.ipk
-rw-r--r-- 2 a0850405 a0850405      3822 Mar 10 16:32=20
kernel-module-coproc-devfreq_1.0.0-r1-arago10+gitrAUTOINC+eef6281052_dra7xx=
_evm.ipk
-rw-r--r-- 2 a0850405 a0850405      3132 Mar 10 16:32=20
kernel-module-gpio-test_1.0.0-r1-arago10+gitrAUTOINC+eef6281052_dra7xx_evm.=
ipk
-rw-r--r-- 2 a0850405 a0850405      2452 Mar 10 16:32=20
kernel-module-kst-timer_1.0.0-r1-arago10+gitrAUTOINC+eef6281052_dra7xx_evm.=
ipk
-rw-r--r-- 2 a0850405 a0850405      2828 Mar 10 16:32=20
kernel-module-rpmsg-client-sample_1.0.0-r1-arago10+gitrAUTOINC+eef6281052_d=
ra7xx_evm.ipk

_______________________________________________
meta-arago mailing list
meta-arago@arago-project.org
http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
_______________________________________________
meta-arago mailing list
meta-arago@arago-project.org
http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

