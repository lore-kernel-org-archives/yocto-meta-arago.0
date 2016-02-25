Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id BB25E52A60
	for <meta-arago@arago-project.org>;
	Thu, 25 Feb 2016 00:16:47 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u1P0GknR003892;
	Wed, 24 Feb 2016 18:16:47 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1P0GkCS011359;
	Wed, 24 Feb 2016 18:16:46 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 24 Feb 2016 18:16:46 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1P0GkLp023068;
	Wed, 24 Feb 2016 18:16:46 -0600
Date: Wed, 24 Feb 2016 19:16:30 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Mike Brainerd <Mike.Brainerd@geemedia.com>
Message-ID: <20160225001630.GF29852@edge>
References: <ed3eb8ae44b746809e773759549f8304@GEE-EX01.globaleagleent.com>
MIME-Version: 1.0
In-Reply-To: <ed3eb8ae44b746809e773759549f8304@GEE-EX01.globaleagleent.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: arago build failed with errors
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
X-List-Received-Date: Thu, 25 Feb 2016 00:16:48 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

IIRC, AMSDK 8 was Daisy based, so you'd need to use Linaro 2013.03 gcc-4.7=
=20
toolchain. Also, what is your Linux distro version?

--=20
Denys


On Sun, Feb 21, 2016 at 11:55:43PM +0000, Mike Brainerd wrote:
>=20

> $ ./oe-layertool-setup.sh -f configs/amsdk/amsdk-08.00.00.00-config.txt
> /home/mbrainerd/tisdk
>=20
>=20
> cloning repo bitbake
>=20
> Cloning into '/home/mbrainerd/tisdk/sources/bitbake'...
> remote: Counting objects: 41124, done.
> remote: Compressing objects: 100% (11705/11705), done.
> remote: Total 41124 (delta 30364), reused 38178 (delta 27997)
> Receiving objects: 100% (41124/41124), 8.62 MiB | 2.19 MiB/s, done.
> Resolving deltas: 100% (30364/30364), done.
> Checking connectivity... done.
> Branch 1.22 set up to track remote branch 1.22 from origin.
> Switched to a new branch '1.22'
> Already up-to-date.
> Note: checking out '8e386a710023e000a504e05c13da0106df0c7f3a'.
>=20
> You are in 'detached HEAD' state. You can look around, make experimental
> changes and commit them, and you can discard any commits you make in this
> state without impacting any branches by performing another checkout.
>=20
> If you want to create a new branch to retain commits you create, you may
> do so (now or later) by using -b with the checkout command again. Example:
>=20
>   git checkout -b new_branch_name
>=20
> HEAD is now at 8e386a7... codeparser: Fix to better catch all getVar refe=
rences
>=20
>=20
> cloning repo meta-arago
>=20
> Cloning into '/home/mbrainerd/tisdk/sources/meta-arago'...
> remote: Counting objects: 19744, done.
> remote: Compressing objects: 100% (10166/10166), done.
> remote: Total 19744 (delta 14023), reused 13850 (delta 9105)
> Receiving objects: 100% (19744/19744), 10.20 MiB | 3.21 MiB/s, done.
> Resolving deltas: 100% (14023/14023), done.
> Checking connectivity... done.
> Branch amsdk-08.00.00.00-integration set up to track remote branch amsdk-=
08.00.00.00-integration from origin.
> Switched to a new branch 'amsdk-08.00.00.00-integration'
> Already up-to-date.
>=20
>=20
> cloning repo meta-qt5
>=20
> Cloning into '/home/mbrainerd/tisdk/sources/meta-qt5'...
> remote: Counting objects: 6337, done.
> remote: Compressing objects: 100% (127/127), done.
> remote: Total 6337 (delta 80), reused 0 (delta 0), pack-reused 6210
> Receiving objects: 100% (6337/6337), 1.80 MiB | 0 bytes/s, done.
> Resolving deltas: 100% (3851/3851), done.
> Checking connectivity... done.
> Already on 'master'
> Your branch is up-to-date with 'origin/master'.
> Already up-to-date.
> Note: checking out '37e921db22689131144b453d53a8cce4a314aa48'.
>=20
> You are in 'detached HEAD' state. You can look around, make experimental
> changes and commit them, and you can discard any commits you make in this
> state without impacting any branches by performing another checkout.
>=20
> If you want to create a new branch to retain commits you create, you may
> do so (now or later) by using -b with the checkout command again. Example:
>=20
>   git checkout -b new_branch_name
>=20
> HEAD is now at 37e921d... qtwebengine: Include resources in main package =
and add rdep on qmlplugins
>=20
>=20
> cloning repo meta-openembedded
>=20
> Cloning into '/home/mbrainerd/tisdk/sources/meta-openembedded'...
> remote: Counting objects: 57239, done.
> remote: Compressing objects: 100% (20907/20907), done.
> remote: Total 57239 (delta 34571), reused 56037 (delta 33606)
> Receiving objects: 100% (57239/57239), 23.16 MiB | 3.49 MiB/s, done.
> Resolving deltas: 100% (34571/34571), done.
> Checking connectivity... done.
> Branch daisy set up to track remote branch daisy from origin.
> Switched to a new branch 'daisy'
> Already up-to-date.
> Note: checking out 'd3d14d3fcca7fcde362cf0b31411dc4eea6d20aa'.
>=20
> You are in 'detached HEAD' state. You can look around, make experimental
> changes and commit them, and you can discard any commits you make in this
> state without impacting any branches by performing another checkout.
>=20
> If you want to create a new branch to retain commits you create, you may
> do so (now or later) by using -b with the checkout command again. Example:
>=20
>   git checkout -b new_branch_name
>=20
> HEAD is now at d3d14d3... gdal: fix sqlite, expat and libtiff detection
>=20
>=20
> cloning repo meta-ti
>=20
> Cloning into '/home/mbrainerd/tisdk/sources/meta-ti'...
> remote: Counting objects: 14823, done.
> remote: Compressing objects: 100% (6936/6936), done.
> remote: Total 14823 (delta 8511), reused 12954 (delta 7142)
> Receiving objects: 100% (14823/14823), 7.14 MiB | 2.71 MiB/s, done.
> Resolving deltas: 100% (8511/8511), done.
> Checking connectivity... done.
> warning: remote HEAD refers to nonexistent ref, unable to checkout.
>=20
> Branch amsdk-08.00.00.00-integration set up to track remote branch amsdk-=
08.00.00.00-integration from origin.
> Switched to a new branch 'amsdk-08.00.00.00-integration'
> Already up-to-date.
>=20
>=20
> cloning repo meta-linaro
>=20
> Cloning into '/home/mbrainerd/tisdk/sources/meta-linaro'...
> remote: Counting objects: 7906, done.
> remote: Compressing objects: 100% (3529/3529), done.
> remote: Total 7906 (delta 4101), reused 7659 (delta 3932)
> Receiving objects: 100% (7906/7906), 2.36 MiB | 0 bytes/s, done.
> Resolving deltas: 100% (4101/4101), done.
> Checking connectivity... done.
> Branch daisy set up to track remote branch daisy from origin.
> Switched to a new branch 'daisy'
> Already up-to-date.
> Note: checking out 'bc63e777ad2748b8bfa7fa70ffd74700fa21a567'.
>=20
> You are in 'detached HEAD' state. You can look around, make experimental
> changes and commit them, and you can discard any commits you make in this
> state without impacting any branches by performing another checkout.
>=20
> If you want to create a new branch to retain commits you create, you may
> do so (now or later) by using -b with the checkout command again. Example:
>=20
>   git checkout -b new_branch_name
>=20
> HEAD is now at bc63e77... bootwrapper: fix dependencies and compile flags
>=20
>=20
> cloning repo oe-core
>=20
> Cloning into '/home/mbrainerd/tisdk/sources/oe-core'...
> remote: Counting objects: 242896, done.
> remote: Compressing objects: 100% (65982/65982), done.
> remote: Total 242896 (delta 173699), reused 240933 (delta 172180)
> Receiving objects: 100% (242896/242896), 90.17 MiB | 2.85 MiB/s, done.
> Resolving deltas: 100% (173699/173699), done.
> Checking connectivity... done.
> Branch daisy set up to track remote branch daisy from origin.
> Switched to a new branch 'daisy'
> Already up-to-date.
> Note: checking out 'f34de2175f1d6a443f219b8ceaaf796cfbc6efd5'.
>=20
> You are in 'detached HEAD' state. You can look around, make experimental
> changes and commit them, and you can discard any commits you make in this
> state without impacting any branches by performing another checkout.
>=20
> If you want to create a new branch to retain commits you create, you may
> do so (now or later) by using -b with the checkout command again. Example:
>=20
>   git checkout -b new_branch_name
>=20
> HEAD is now at f34de21... beaglebone: enable the nowayout option for the =
watchdog
>=20
>=20
> #########################################################################=
#######
> The bblayers.conf configuration file has been created for you with some
> default values.  Please verify the contents of your conf/bblayers.conf
> file for correctness.
>=20
> NOTE: Any additional entries to this file will be lost if the ./oe-layert=
ool-setup.sh
>       script is run again.  To add entries permanently to this file
>       please add them to the config file used and rerun the
>       ./oe-layertool-setup.sh script.
>=20
>=20
>=20
> #########################################################################=
#######
> The local.conf configuration file has been created for you with some
> default values.  Please verify the contents of your conf/local.conf
> file for correctness.
>=20
> By default the number of threads used by the build is set to the number
> of CPUs found on your system.
>=20
> NOTE: You will probably want to change the default MACHINE setting in the
>       local.conf file to the machine you are trying to build.
>=20
>=20
>=20
> #########################################################################=
#######
> A setenv file has been created for you in the conf directory.  Please ver=
ify
> The contents of this file.  Once you have verified the contents please so=
urce
> this file to configure your environment for building:
>=20
>     . conf/setenv
>=20
> You can then start building using the bitbake command.  You will likely w=
ant
> to set the MACHINE option if you have not done so in your local.conf file.
>=20
> For example:
>     MACHINE=3Dxxxxx bitbake <target>
>=20
> Common targets are:
>     core-image-minimal
>     core-image-sato
>     meta-toolchain
>     meta-toolchain-sdk
>     adt-installer
>     meta-ide-support
> $ cd build
> $ la
> total 4
> drwxrwxr-x 2 mbrainerd mbrainerd 4096 Feb 21 17:26 conf
> $ . conf/setenv
> $ export PATH=3D$HOME/gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueabihf/b=
in:$PATH
> $ MACHINE=3Dam335x-evm bitbake core-image-minimal
> ERROR: Execution of event handler 'external_linaro_toolchain_version_hand=
ler' failed
> Traceback (most recent call last):
>   File "external_linaro_toolchain_version_handler(e)", line 8, in externa=
l_linaro_toolchain_version_handler(e=3D<bb.event.ConfigParsed object at 0x7=
facf08e54d0>)
>   File "external-linaro-toolchain-versions.inc", line 4, in elt_get_main_=
version(d=3D<bb.data_smart.DataSmart object at 0x7facf16e5450>)
> IndexError: list index out of range
>=20
> Parsing recipes: 100% |##################################################=
#| Time: 00:00:41
> Parsing of 1762 .bb files complete (0 cached, 1762 parsed). 2198 targets,=
 204 skipped, 0 masked, 0 errors.
> NOTE: Resolving any missing task queue dependencies
>=20
> Build Configuration:
> BB_VERSION        =3D "1.22.0"
> BUILD_SYS         =3D "x86_64-linux"
> NATIVELSBSTRING   =3D "Ubuntu-14.04"
> TARGET_SYS        =3D "arm-oe-linux-gnueabi"
> MACHINE           =3D "am335x-evm"
> DISTRO            =3D "arago"
> DISTRO_VERSION    =3D "2015.02"
> TUNE_FEATURES     =3D "armv7a vfp thumb neon callconvention-hard cortexa8"
> TARGET_FPU        =3D "vfp-neon"
> meta-arago-distro=20
> meta-arago-extras =3D "amsdk-08.00.00.00-integration:2d15e7da62646c907d24=
942483cbfddc03a6310b"
> meta-qt5          =3D "(detachedfrom37e921d):37e921db22689131144b453d53a8=
cce4a314aa48"
> toolchain-layer  =20
> meta-networking  =20
> meta-ruby        =20
> meta-oe           =3D "(detachedfromd3d14d3):d3d14d3fcca7fcde362cf0b31411=
dc4eea6d20aa"
> meta-ti           =3D "amsdk-08.00.00.00-integration:4fc5c40602d9a8266619=
34a94a8a7e5e5864c88f"
> meta-linaro-toolchain =3D "(detachedfrombc63e77):bc63e777ad2748b8bfa7fa70=
ffd74700fa21a567"
> meta              =3D "(detachedfromf34de21):f34de2175f1d6a443f219b8ceaaf=
796cfbc6efd5"
>=20
> NOTE: Preparing runqueue
> NOTE: Executing SetScene Tasks
> NOTE: Executing RunQueue Tasks
> ERROR: Execution of event handler 'external_linaro_toolchain_version_hand=
ler' failed
> Traceback (most recent call last):
>   File "external_linaro_toolchain_version_handler(e)", line 8, in externa=
l_linaro_toolchain_version_handler(e=3D<bb.event.ConfigParsed object at 0x7=
f7687924590>)
>   File "external-linaro-toolchain-versions.inc", line 4, in elt_get_main_=
version(d=3D<bb.data_smart.DataSmart object at 0x7f768a732b90>)
> IndexError: list index out of range
>=20
> WARNING: Failed to fetch URL http://zlib.net/pigz/pigz-2.3.1.tar.gz, atte=
mpting MIRRORS if available
> WARNING: Failed to fetch URL ftp://ftp.debian.org/debian/pool/main/b/base=
-passwd/base-passwd_3.5.29.tar.gz, attempting MIRRORS if available
> WARNING: Failed to fetch URL ftp://ftp.debian.org/debian/pool/main/n/netb=
ase/netbase_5.2.tar.gz, attempting MIRRORS if available
> WARNING: Failed to fetch URL ftp://ftp.debian.org/debian/pool/main/d/dpkg=
/dpkg_1.17.4.tar.xz, attempting MIRRORS if available
> WARNING: Failed to fetch URL http://ftp.de.debian.org/debian/pool/main/m/=
mklibs/mklibs_0.1.38.tar.gz, attempting MIRRORS if available
> ERROR: Execution of event handler 'external_linaro_toolchain_version_hand=
ler' failed
> Traceback (most recent call last):
>   File "external_linaro_toolchain_version_handler(e)", line 8, in externa=
l_linaro_toolchain_version_handler(e=3D<bb.event.ConfigParsed object at 0x7=
fc4976ae5d0>)
>   File "external-linaro-toolchain-versions.inc", line 4, in elt_get_main_=
version(d=3D<bb.data_smart.DataSmart object at 0x7fc49a33dbd0>)
> IndexError: list index out of range
>=20
> WARNING: The recipe external-linaro-toolchain is trying to install files =
into a shared area when those files already exist. Those files and their ma=
nifest location are:
>    /home/mbrainerd/tisdk/build/arago-tmp-external-linaro-toolchain/sysroo=
ts/am335x-evm/usr/include/uapi/.install
>    Matched in manifest-am335x-evm-linux-libc-headers.populate_sysroot
> Please verify which package should provide the above files.
> ERROR: Function failed: do_compile (log file is located at /home/mbrainer=
d/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa8t2hf-vfp-neo=
n-oe-linux-gnueabi/zlib/1.2.8-r0/temp/log.do_compile.9233)
> ERROR: Logfile of failure stored in: /home/mbrainerd/tisdk/build/arago-tm=
p-external-linaro-toolchain/work/cortexa8t2hf-vfp-neon-oe-linux-gnueabi/zli=
b/1.2.8-r0/temp/log.do_compile.9233
> Log data follows:
> | DEBUG: Executing shell function do_compile
> | NOTE: make -j 8 -e MAKEFLAGS=3D
> | arm-linux-gnueabihf-gcc  -march=3Darmv7-a -marm -mthumb-interwork -mflo=
at-abi=3Dhard -mfpu=3Dneon -mtune=3Dcortex-a8 --sysroot=3D/home/mbrainerd/t=
isdk/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm  -isyste=
m/home/mbrainerd/gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueabihf/arm-linu=
x-gnueabihf/include  -fstack-protector -O2 -pipe -g -feliminate-unused-debu=
g-types -I. -c -o example.o test/example.c
> | arm-linux-gnueabihf-gcc  -march=3Darmv7-a -marm -mthumb-interwork -mflo=
at-abi=3Dhard -mfpu=3Dneon -mtune=3Dcortex-a8 --sysroot=3D/home/mbrainerd/t=
isdk/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm  -isyste=
m/home/mbrainerd/gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueabihf/arm-linu=
x-gnueabihf/include  -fstack-protector -O2 -pipe -g -feliminate-unused-debu=
g-types  -isystem/home/mbrainerd/gcc-linaro-4.9-2015.05-x86_64_arm-linux-gn=
ueabihf/arm-linux-gnueabihf/include  -fstack-protector  -c -o adler32.o adl=
er32.c
> | arm-linux-gnueabihf-gcc  -march=3Darmv7-a -marm -mthumb-interwork -mflo=
at-abi=3Dhard -mfpu=3Dneon -mtune=3Dcortex-a8 --sysroot=3D/home/mbrainerd/t=
isdk/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm  -isyste=
m/home/mbrainerd/gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueabihf/arm-linu=
x-gnueabihf/include  -fstack-protector -O2 -pipe -g -feliminate-unused-debu=
g-types  -isystem/home/mbrainerd/gcc-linaro-4.9-2015.05-x86_64_arm-linux-gn=
ueabihf/arm-linux-gnueabihf/include  -fstack-protector  -c -o crc32.o crc32=
=2Ec
> | arm-linux-gnueabihf-gcc  -march=3Darmv7-a -marm -mthumb-interwork -mflo=
at-abi=3Dhard -mfpu=3Dneon -mtune=3Dcortex-a8 --sysroot=3D/home/mbrainerd/t=
isdk/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm  -isyste=
m/home/mbrainerd/gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueabihf/arm-linu=
x-gnueabihf/include  -fstack-protector -O2 -pipe -g -feliminate-unused-debu=
g-types  -isystem/home/mbrainerd/gcc-linaro-4.9-2015.05-x86_64_arm-linux-gn=
ueabihf/arm-linux-gnueabihf/include  -fstack-protector  -c -o deflate.o def=
late.c
> | arm-linux-gnueabihf-gcc  -march=3Darmv7-a -marm -mthumb-interwork -mflo=
at-abi=3Dhard -mfpu=3Dneon -mtune=3Dcortex-a8 --sysroot=3D/home/mbrainerd/t=
isdk/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm  -isyste=
m/home/mbrainerd/gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueabihf/arm-linu=
x-gnueabihf/include  -fstack-protector -O2 -pipe -g -feliminate-unused-debu=
g-types  -isystem/home/mbrainerd/gcc-linaro-4.9-2015.05-x86_64_arm-linux-gn=
ueabihf/arm-linux-gnueabihf/include  -fstack-protector  -c -o infback.o inf=
back.c
> | arm-linux-gnueabihf-gcc  -march=3Darmv7-a -marm -mthumb-interwork -mflo=
at-abi=3Dhard -mfpu=3Dneon -mtune=3Dcortex-a8 --sysroot=3D/home/mbrainerd/t=
isdk/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm  -isyste=
m/home/mbrainerd/gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueabihf/arm-linu=
x-gnueabihf/include  -fstack-protector -O2 -pipe -g -feliminate-unused-debu=
g-types  -isystem/home/mbrainerd/gcc-linaro-4.9-2015.05-x86_64_arm-linux-gn=
ueabihf/arm-linux-gnueabihf/include  -fstack-protector  -c -o inffast.o inf=
fast.c
> | arm-linux-gnueabihf-gcc  -march=3Darmv7-a -marm -mthumb-interwork -mflo=
at-abi=3Dhard -mfpu=3Dneon -mtune=3Dcortex-a8 --sysroot=3D/home/mbrainerd/t=
isdk/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm  -isyste=
m/home/mbrainerd/gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueabihf/arm-linu=
x-gnueabihf/include  -fstack-protector -O2 -pipe -g -feliminate-unused-debu=
g-types  -isystem/home/mbrainerd/gcc-linaro-4.9-2015.05-x86_64_arm-linux-gn=
ueabihf/arm-linux-gnueabihf/include  -fstack-protector  -c -o inflate.o inf=
late.c
> | arm-linux-gnueabihf-gcc  -march=3Darmv7-a -marm -mthumb-interwork -mflo=
at-abi=3Dhard -mfpu=3Dneon -mtune=3Dcortex-a8 --sysroot=3D/home/mbrainerd/t=
isdk/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm  -isyste=
m/home/mbrainerd/gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueabihf/arm-linu=
x-gnueabihf/include  -fstack-protector -O2 -pipe -g -feliminate-unused-debu=
g-types  -isystem/home/mbrainerd/gcc-linaro-4.9-2015.05-x86_64_arm-linux-gn=
ueabihf/arm-linux-gnueabihf/include  -fstack-protector  -c -o inftrees.o in=
ftrees.c
> | arm-linux-gnueabihf-gcc  -march=3Darmv7-a -marm -mthumb-interwork -mflo=
at-abi=3Dhard -mfpu=3Dneon -mtune=3Dcortex-a8 --sysroot=3D/home/mbrainerd/t=
isdk/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm  -isyste=
m/home/mbrainerd/gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueabihf/arm-linu=
x-gnueabihf/include  -fstack-protector -O2 -pipe -g -feliminate-unused-debu=
g-types  -isystem/home/mbrainerd/gcc-linaro-4.9-2015.05-x86_64_arm-linux-gn=
ueabihf/arm-linux-gnueabihf/include  -fstack-protector  -c -o trees.o trees=
=2Ec
> | arm-linux-gnueabihf-gcc  -march=3Darmv7-a -marm -mthumb-interwork -mflo=
at-abi=3Dhard -mfpu=3Dneon -mtune=3Dcortex-a8 --sysroot=3D/home/mbrainerd/t=
isdk/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm  -isyste=
m/home/mbrainerd/gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueabihf/arm-linu=
x-gnueabihf/include  -fstack-protector -O2 -pipe -g -feliminate-unused-debu=
g-types  -isystem/home/mbrainerd/gcc-linaro-4.9-2015.05-x86_64_arm-linux-gn=
ueabihf/arm-linux-gnueabihf/include  -fstack-protector  -c -o zutil.o zutil=
=2Ec
> | arm-linux-gnueabihf-gcc  -march=3Darmv7-a -marm -mthumb-interwork -mflo=
at-abi=3Dhard -mfpu=3Dneon -mtune=3Dcortex-a8 --sysroot=3D/home/mbrainerd/t=
isdk/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm  -isyste=
m/home/mbrainerd/gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueabihf/arm-linu=
x-gnueabihf/include  -fstack-protector -O2 -pipe -g -feliminate-unused-debu=
g-types  -isystem/home/mbrainerd/gcc-linaro-4.9-2015.05-x86_64_arm-linux-gn=
ueabihf/arm-linux-gnueabihf/include  -fstack-protector  -c -o compress.o co=
mpress.c
> | arm-linux-gnueabihf-gcc  -march=3Darmv7-a -marm -mthumb-interwork -mflo=
at-abi=3Dhard -mfpu=3Dneon -mtune=3Dcortex-a8 --sysroot=3D/home/mbrainerd/t=
isdk/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm  -isyste=
m/home/mbrainerd/gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueabihf/arm-linu=
x-gnueabihf/include  -fstack-protector -O2 -pipe -g -feliminate-unused-debu=
g-types  -isystem/home/mbrainerd/gcc-linaro-4.9-2015.05-x86_64_arm-linux-gn=
ueabihf/arm-linux-gnueabihf/include  -fstack-protector  -c -o uncompr.o unc=
ompr.c
> | arm-linux-gnueabihf-gcc  -march=3Darmv7-a -marm -mthumb-interwork -mflo=
at-abi=3Dhard -mfpu=3Dneon -mtune=3Dcortex-a8 --sysroot=3D/home/mbrainerd/t=
isdk/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm  -isyste=
m/home/mbrainerd/gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueabihf/arm-linu=
x-gnueabihf/include  -fstack-protector -O2 -pipe -g -feliminate-unused-debu=
g-types  -isystem/home/mbrainerd/gcc-linaro-4.9-2015.05-x86_64_arm-linux-gn=
ueabihf/arm-linux-gnueabihf/include  -fstack-protector  -c -o gzclose.o gzc=
lose.c
> | arm-linux-gnueabihf-gcc  -march=3Darmv7-a -marm -mthumb-interwork -mflo=
at-abi=3Dhard -mfpu=3Dneon -mtune=3Dcortex-a8 --sysroot=3D/home/mbrainerd/t=
isdk/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm  -isyste=
m/home/mbrainerd/gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueabihf/arm-linu=
x-gnueabihf/include  -fstack-protector -O2 -pipe -g -feliminate-unused-debu=
g-types  -isystem/home/mbrainerd/gcc-linaro-4.9-2015.05-x86_64_arm-linux-gn=
ueabihf/arm-linux-gnueabihf/include  -fstack-protector  -c -o gzlib.o gzlib=
=2Ec
> | arm-linux-gnueabihf-gcc  -march=3Darmv7-a -marm -mthumb-interwork -mflo=
at-abi=3Dhard -mfpu=3Dneon -mtune=3Dcortex-a8 --sysroot=3D/home/mbrainerd/t=
isdk/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm  -isyste=
m/home/mbrainerd/gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueabihf/arm-linu=
x-gnueabihf/include  -fstack-protector -O2 -pipe -g -feliminate-unused-debu=
g-types  -isystem/home/mbrainerd/gcc-linaro-4.9-2015.05-x86_64_arm-linux-gn=
ueabihf/arm-linux-gnueabihf/include  -fstack-protector  -c -o gzread.o gzre=
ad.c
> | arm-linux-gnueabihf-gcc  -march=3Darmv7-a -marm -mthumb-interwork -mflo=
at-abi=3Dhard -mfpu=3Dneon -mtune=3Dcortex-a8 --sysroot=3D/home/mbrainerd/t=
isdk/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm  -isyste=
m/home/mbrainerd/gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueabihf/arm-linu=
x-gnueabihf/include  -fstack-protector -O2 -pipe -g -feliminate-unused-debu=
g-types  -isystem/home/mbrainerd/gcc-linaro-4.9-2015.05-x86_64_arm-linux-gn=
ueabihf/arm-linux-gnueabihf/include  -fstack-protector  -c -o gzwrite.o gzw=
rite.c
> | arm-linux-gnueabihf-gcc  -march=3Darmv7-a -marm -mthumb-interwork -mflo=
at-abi=3Dhard -mfpu=3Dneon -mtune=3Dcortex-a8 --sysroot=3D/home/mbrainerd/t=
isdk/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm  -isyste=
m/home/mbrainerd/gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueabihf/arm-linu=
x-gnueabihf/include  -fstack-protector -O2 -pipe -g -feliminate-unused-debu=
g-types -I. -c -o minigzip.o test/minigzip.c
> | arm-linux-gnueabihf-gcc  -march=3Darmv7-a -marm -mthumb-interwork -mflo=
at-abi=3Dhard -mfpu=3Dneon -mtune=3Dcortex-a8 --sysroot=3D/home/mbrainerd/t=
isdk/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm  -isyste=
m/home/mbrainerd/gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueabihf/arm-linu=
x-gnueabihf/include  -fstack-protector -O2 -pipe -g -feliminate-unused-debu=
g-types -I. -D_FILE_OFFSET_BITS=3D64 -c -o example64.o test/example.c
> | arm-linux-gnueabihf-gcc  -march=3Darmv7-a -marm -mthumb-interwork -mflo=
at-abi=3Dhard -mfpu=3Dneon -mtune=3Dcortex-a8 --sysroot=3D/home/mbrainerd/t=
isdk/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm  -isyste=
m/home/mbrainerd/gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueabihf/arm-linu=
x-gnueabihf/include  -fstack-protector -O2 -pipe -g -feliminate-unused-debu=
g-types -I. -D_FILE_OFFSET_BITS=3D64 -c -o minigzip64.o test/minigzip.c
> | arm-linux-gnueabihf-ar rc libz.a adler32.o crc32.o deflate.o infback.o =
inffast.o inflate.o inftrees.o trees.o zutil.o compress.o uncompr.o gzclose=
=2Eo gzlib.o gzread.o gzwrite.o
> | arm-linux-gnueabihf-gcc  -march=3Darmv7-a -marm -mthumb-interwork -mflo=
at-abi=3Dhard -mfpu=3Dneon -mtune=3Dcortex-a8 --sysroot=3D/home/mbrainerd/t=
isdk/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm  -isyste=
m/home/mbrainerd/gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueabihf/arm-linu=
x-gnueabihf/include  -fstack-protector -O2 -pipe -g -feliminate-unused-debu=
g-types -o example example.o -L. libz.a
> | arm-linux-gnueabihf-gcc  -march=3Darmv7-a -marm -mthumb-interwork -mflo=
at-abi=3Dhard -mfpu=3Dneon -mtune=3Dcortex-a8 --sysroot=3D/home/mbrainerd/t=
isdk/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm  -isyste=
m/home/mbrainerd/gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueabihf/arm-linu=
x-gnueabihf/include  -fstack-protector -O2 -pipe -g -feliminate-unused-debu=
g-types -o minigzip minigzip.o -L. libz.a
> | arm-linux-gnueabihf-gcc  -march=3Darmv7-a -marm -mthumb-interwork -mflo=
at-abi=3Dhard -mfpu=3Dneon -mtune=3Dcortex-a8 --sysroot=3D/home/mbrainerd/t=
isdk/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm  -isyste=
m/home/mbrainerd/gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueabihf/arm-linu=
x-gnueabihf/include  -fstack-protector -O2 -pipe -g -feliminate-unused-debu=
g-types -o example64 example64.o -L. libz.a
> | arm-linux-gnueabihf-gcc  -march=3Darmv7-a -marm -mthumb-interwork -mflo=
at-abi=3Dhard -mfpu=3Dneon -mtune=3Dcortex-a8 --sysroot=3D/home/mbrainerd/t=
isdk/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm  -isyste=
m/home/mbrainerd/gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueabihf/arm-linu=
x-gnueabihf/include  -fstack-protector -O2 -pipe -g -feliminate-unused-debu=
g-types -o minigzip64 minigzip64.o -L. libz.a
> | /home/mbrainerd/gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueabihf/bin/.=
=2E/lib/gcc/arm-linux-gnueabihf/4.9.3/../../../../arm-linux-gnueabihf/bin/l=
d: cannot find ../../lib/ld-linux-armhf.so.3
> | collect2: error: ld returned 1 exit status
> | make: *** [example] Error 1
> | make: *** Waiting for unfinished jobs....
> | /home/mbrainerd/gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueabihf/bin/.=
=2E/lib/gcc/arm-linux-gnueabihf/4.9.3/../../../../arm-linux-gnueabihf/bin/l=
d: cannot find ../../lib/ld-linux-armhf.so.3
> | collect2: error: ld returned 1 exit status
> | make: *** [minigzip] Error 1
> | /home/mbrainerd/gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueabihf/bin/.=
=2E/lib/gcc/arm-linux-gnueabihf/4.9.3/../../../../arm-linux-gnueabihf/bin/l=
d: cannot find ../../lib/ld-linux-armhf.so.3
> | collect2: error: ld returned 1 exit status
> | make: *** [example64] Error 1
> | /home/mbrainerd/gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueabihf/bin/.=
=2E/lib/gcc/arm-linux-gnueabihf/4.9.3/../../../../arm-linux-gnueabihf/bin/l=
d: cannot find ../../lib/ld-linux-armhf.so.3
> | collect2: error: ld returned 1 exit status
> | make: *** [minigzip64] Error 1
> | ERROR: oe_runmake failed
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_compile (log file is located at /home/mbrain=
erd/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa8t2hf-vfp-n=
eon-oe-linux-gnueabi/zlib/1.2.8-r0/temp/log.do_compile.9233)
> ERROR: Task 835 (/home/mbrainerd/tisdk/sources/oe-core/meta/recipes-core/=
zlib/zlib_1.2.8.bb, do_compile) failed with exit code '1'
> ERROR: Function failed: do_configure (log file is located at /home/mbrain=
erd/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa8t2hf-vfp-n=
eon-oe-linux-gnueabi/libtool-cross/2.4.2-r6.1/temp/log.do_configure.7237)
> ERROR: Logfile of failure stored in: /home/mbrainerd/tisdk/build/arago-tm=
p-external-linaro-toolchain/work/cortexa8t2hf-vfp-neon-oe-linux-gnueabi/lib=
tool-cross/2.4.2-r6.1/temp/log.do_configure.7237
> Log data follows:
> | DEBUG: Executing python function sysroot_cleansstate
> | DEBUG: Python function sysroot_cleansstate finished
> | DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common', 'common-lin=
ux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi', 'common']
> | DEBUG: Executing shell function autotools_preconfigure
> | DEBUG: Shell function autotools_preconfigure finished
> | DEBUG: Executing python function autotools_copy_aclocals
> | DEBUG: Python function autotools_copy_aclocals finished
> | DEBUG: Executing shell function do_configure
> | automake (GNU automake) 1.14
> | Copyright (C) 2013 Free Software Foundation, Inc.
> | License GPLv2+: GNU GPL version 2 or later <http://gnu.org/licenses/gpl=
-2.0.html>
> | This is free software: you are free to change and redistribute it.
> | There is NO WARRANTY, to the extent permitted by law.
> |=20
> | Written by Tom Tromey <tromey@redhat.com>
> |        and Alexandre Duret-Lutz <adl@gnu.org>.
> | AUTOV is 1
> | NOTE: Executing ACLOCAL=3D"aclocal --system-acdir=3D/home/mbrainerd/tis=
dk/build/arago-tmp-external-linaro-toolchain/work/cortexa8t2hf-vfp-neon-oe-=
linux-gnueabi/libtool-cross/2.4.2-r6.1/build/aclocal-copy/" autoreconf --ve=
rbose --install --force --exclude=3Dlibtoolize -I /home/mbrainerd/tisdk/bui=
ld/arago-tmp-external-linaro-toolchain/work/cortexa8t2hf-vfp-neon-oe-linux-=
gnueabi/libtool-cross/2.4.2-r6.1/libtool-2.4.2/tests/
> | autoreconf: Entering directory `.'
> | autoreconf: configure.ac: not using Gettext
> | autoreconf: running: aclocal --system-acdir=3D/home/mbrainerd/tisdk/bui=
ld/arago-tmp-external-linaro-toolchain/work/cortexa8t2hf-vfp-neon-oe-linux-=
gnueabi/libtool-cross/2.4.2-r6.1/build/aclocal-copy/ -I /home/mbrainerd/tis=
dk/build/arago-tmp-external-linaro-toolchain/work/cortexa8t2hf-vfp-neon-oe-=
linux-gnueabi/libtool-cross/2.4.2-r6.1/libtool-2.4.2/tests/ -I /home/mbrain=
erd/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa8t2hf-vfp-n=
eon-oe-linux-gnueabi/libtool-cross/2.4.2-r6.1/libtool-2.4.2/tests/ --force =
-I libltdl/m4
> | autoreconf: configure.ac: tracing
> | autoreconf: running: /home/mbrainerd/tisdk/build/arago-tmp-external-lin=
aro-toolchain/sysroots/x86_64-linux/usr/bin/autoconf --include=3D/home/mbra=
inerd/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa8t2hf-vfp=
-neon-oe-linux-gnueabi/libtool-cross/2.4.2-r6.1/libtool-2.4.2/tests/ --force
> | autoreconf: running: /home/mbrainerd/tisdk/build/arago-tmp-external-lin=
aro-toolchain/sysroots/x86_64-linux/usr/bin/autoheader --include=3D/home/mb=
rainerd/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa8t2hf-v=
fp-neon-oe-linux-gnueabi/libtool-cross/2.4.2-r6.1/libtool-2.4.2/tests/ --fo=
rce
> | autoreconf: running: automake --foreign --add-missing --copy --force-mi=
ssing
> | parallel-tests: installing 'libltdl/config/test-driver'
> | autoreconf: running: gnu-configize
> | autoreconf: Leaving directory `.'
> | NOTE: Running /home/mbrainerd/tisdk/build/arago-tmp-external-linaro-too=
lchain/work/cortexa8t2hf-vfp-neon-oe-linux-gnueabi/libtool-cross/2.4.2-r6.1=
/libtool-2.4.2/configure  --build=3Dx86_64-linux 		  --host=3Darm-oe-linux-=
gnueabi 		  --target=3Darm-oe-linux-gnueabi 		  --prefix=3D/usr 		  --exec_=
prefix=3D/usr 		  --bindir=3D/usr/bin 		  --sbindir=3D/usr/sbin 		  --libex=
ecdir=3D/usr/lib/libtool 	  --datadir=3D/home/mbrainerd/tisdk/build/arago-t=
mp-external-linaro-toolchain/sysroots/am335x-evm/usr/share 		  --sysconfdir=
=3D/etc 		  --sharedstatedir=3D/com 		  --localstatedir=3D/var 		  --libdir=
=3D/usr/lib 		  --includedir=3D/usr/include 		  --oldincludedir=3D/usr/incl=
ude 		  --infodir=3D/home/mbrainerd/tisdk/build/arago-tmp-external-linaro-t=
oolchain/sysroots/am335x-evm/usr/share/info 		  --mandir=3D/home/mbrainerd/=
tisdk/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/sha=
re/man 		  --disable-silent-rules 		  --disable-dependency-tracking 		  --w=
ith-libtool-sysroot=3D/home/mbrainerd/tisdk/build/arago-tmp-external-linaro=
-toolchain/
> sysroots/am335x-evm
> | configure: loading site script /home/mbrainerd/tisdk/sources/meta-opene=
mbedded/meta-oe/site/endian-little
> | configure: loading site script /home/mbrainerd/tisdk/sources/oe-core/me=
ta/site/endian-little
> | configure: loading site script /home/mbrainerd/tisdk/sources/oe-core/me=
ta/site/arm-common
> | configure: loading site script /home/mbrainerd/tisdk/sources/oe-core/me=
ta/site/common-linux
> | configure: loading site script /home/mbrainerd/tisdk/sources/oe-core/me=
ta/site/common-glibc
> | configure: loading site script /home/mbrainerd/tisdk/sources/oe-core/me=
ta/site/arm-linux
> | configure: loading site script /home/mbrainerd/tisdk/sources/oe-core/me=
ta/site/common
> | ## ------------------------- ##
> | ## Configuring libtool 2.4.2 ##
> | ## ------------------------- ##
> |=20
> | checking for a BSD-compatible install... /usr/bin/install -c
> | checking whether build environment is sane... yes
> | checking for arm-oe-linux-gnueabi-strip... arm-linux-gnueabihf-strip
> | checking for a thread-safe mkdir -p... /bin/mkdir -p
> | checking for gawk... gawk
> | checking whether make sets $(MAKE)... yes
> | checking whether make supports nested variables... yes
> | checking build system type... x86_64-pc-linux-gnu
> | checking host system type... arm-oe-linux-gnueabi
> | configure: autobuild project... GNU Libtool
> | configure: autobuild revision... 2.4.2 ()
> | configure: autobuild hostname... oscar
> | configure: autobuild mode... default
> | configure: autobuild timestamp... 20160221T233606Z
> | checking for arm-oe-linux-gnueabi-gcc... arm-linux-gnueabihf-gcc  -marc=
h=3Darmv7-a -marm -mthumb-interwork -mfloat-abi=3Dhard -mfpu=3Dneon -mtune=
=3Dcortex-a8 --sysroot=3D/home/mbrainerd/tisdk/build/arago-tmp-external-lin=
aro-toolchain/sysroots/am335x-evm
> | checking whether the C compiler works... no
> | configure: error: in `/home/mbrainerd/tisdk/build/arago-tmp-external-li=
naro-toolchain/work/cortexa8t2hf-vfp-neon-oe-linux-gnueabi/libtool-cross/2.=
4.2-r6.1/build':
> | configure: error: C compiler cannot create executables
> | See `config.log' for more details
> | Configure failed. The contents of all config.log files follows to aid d=
ebugging
> | ERROR: oe_runconf failed
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_configure (log file is located at /home/mbra=
inerd/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa8t2hf-vfp=
-neon-oe-linux-gnueabi/libtool-cross/2.4.2-r6.1/temp/log.do_configure.7237)
> ERROR: Task 371 (/home/mbrainerd/tisdk/sources/oe-core/meta/recipes-devto=
ols/libtool/libtool-cross_2.4.2.bb, do_configure) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 652 tasks of which 1 didn't need to be rer=
un and 2 failed.
> Waiting for 0 running tasks to finish:
>=20
> Summary: 2 tasks failed:
>   /home/mbrainerd/tisdk/sources/oe-core/meta/recipes-core/zlib/zlib_1.2.8=
=2Ebb, do_compile
>   /home/mbrainerd/tisdk/sources/oe-core/meta/recipes-devtools/libtool/lib=
tool-cross_2.4.2.bb, do_configure
> Summary: There were 6 WARNING messages shown.
> Summary: There were 5 ERROR messages shown, returning a non-zero exit cod=
e.
> $

> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


