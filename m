Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 43A3652986
	for <meta-arago@arago-project.org>;
	Fri, 14 Mar 2014 16:16:55 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s2EGGr7L005758;
	Fri, 14 Mar 2014 11:16:53 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s2EGGrqf009535;
	Fri, 14 Mar 2014 11:16:53 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 14 Mar 2014 11:16:52 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s2EGGptB004580;
	Fri, 14 Mar 2014 11:16:52 -0500
Date: Fri, 14 Mar 2014 12:16:50 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Anders Darander <anders@chargestorm.se>
Message-ID: <20140314161649.GD12929@edge>
References: <20140310121416.GC4423@ad.chargestorm.se>
MIME-Version: 1.0
In-Reply-To: <20140310121416.GC4423@ad.chargestorm.se>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: Issue building gcc-cross-initial
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
X-List-Received-Date: Fri, 14 Mar 2014 16:16:57 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Yeah, I'm seeing the same breakage even in dylan - I'm looking into it now.=
=2E.

On Mon, Mar 10, 2014 at 01:14:28PM +0100, Anders Darander wrote:
> Hi,
>=20
> Summary:
>=20
> I'm attempting at moving a custom product from meta-arago (danny) to the
> latest master based on dora.
>=20
> However, I'm getting issues when I'm building gcc-cross-initial (we're
> not using an external toolchain).i
>=20
> I've seen this on my normal build machine running Ubuntu 12.04, though
> my example below was running a new OpenSuse machine.=20
> The choice of MACHINE=3D"am37x-evm" is made to get something resembling
> our real machine.
>=20
> When building gcc-cross-initial, libgcc fails to identify the "suffix of
> object files" when the configure-script for libgcc is being run.
>=20
> I hope that someone can help me with some ideas/pointers as to how this
> can be resolved. I've got the same issue with both gcc 4.7.2 and
> 4.8.1...
>=20
>=20
>=20
> Long story:
> Example for reproduction and some logs:
>=20
>=20
> I've reproduce the same issue using a clean, upstream checkout of
> everything, i.e.
>=20
> Checking out oe-layersetup.git
> Running:
> ./oe-layertool-setup.sh -f configs/arago-dora-config.txt
> cd build
> . conf/setenv
>=20
> Modifying conf/local.conf:
> MACHINE =3D "am37x-evm"
> TOOLCHAIN_TYPE =3D "internal"
> TOOLCHAIN_BRAND =3D "gcc"
>=20
> Running
> bitbake gcc-cross-initial
>=20
>=20
>=20
> This results in:
> Build Configuration:
> BB_VERSION        =3D "1.20.0"
> BUILD_SYS         =3D "x86_64-linux"
> NATIVELSBSTRING   =3D "SUSE-LINUX-13.1"
> TARGET_SYS        =3D "arm-oe-linux-gnueabi"
> MACHINE           =3D "am37x-evm"
> DISTRO            =3D "arago"
> DISTRO_VERSION    =3D "2013.12"
> TUNE_FEATURES     =3D "armv7a vfp thumb neon callconvention-hard cortexa8"
> TARGET_FPU        =3D "vfp-neon"
> meta-arago-distro=20
> meta-arago-extras =3D "master:7c1b5d8cab13d2f8459391db69157a58f8c3c8dc"
> meta-qt5          =3D "dora:0713745617924844fa04d865f0e502c2765e7a41"
> toolchain-layer  =20
> meta-networking  =20
> meta-ruby        =20
> meta-oe           =3D "dora:40e0f371f3eb1628655c484feac0cebf810737b4"
> meta-ti           =3D "dora:d343e3021c8c85b0defd635ae68b71ba60648e1d"
> meta-linaro-toolchain =3D "dora:00c2a868cafecb739178d6cdf912699ec3199fab"
> meta              =3D "dora:18f34944696a8098daf33a94bc2f532deb217d0a"
>=20
> ....
>=20
> And when reching gcc-cross-initial:
>=20
> | make[1]: Leaving directory
> `/mnt/cs-builds/anders/arago/build/arago-tmp-eglibc/work/cortexa8hf-vfp-n=
eon-2.6.37.2-oe-linux-gnueabi/gcc-cross-initial/4.8.1-r0/gcc-4.8.1/build.x8=
6_64-linux.arm-oe-linux-gnueabi/gcc'=20
> | Checking multilib configuration for libgcc... =20
> | mkdir -p -- arm-oe-linux-gnueabi/libgcc =20
> | Configuring in arm-oe-linux-gnueabi/libgcc =20
> | configure: creating cache ./config.cache =20
> | checking build system type... x86_64-pc-linux-gnu =20
> | checking host system type... arm-oe-linux-gnueabi =20
> | checking for --enable-version-specific-runtime-libs... no =20
> | checking for a BSD-compatible install... /usr/bin/install -c=20
> | checking for gawk... gawk =20
> | checking for arm-oe-linux-gnueabi-ar... arm-oe-linux-gnueabi-ar=20
> | checking for arm-oe-linux-gnueabi-lipo... arm-oe-linux-gnueabi-lipo =20
> | checking for arm-oe-linux-gnueabi-nm...
> /home/anders/cs-builds/arago/build/arago-tmp-eglibc/work/cortexa8hf-vfp-n=
eon-2.6.37.2-oe-linux-gnueabi/gcc-cross-initial/4.8.1-r0/gcc-4.8.1/build.x8=
6_64-linux.arm-oe-linux-gnueabi/./gcc/nm =20
> | checking for arm-oe-linux-gnueabi-ranlib...
> arm-oe-linux-gnueabi-ranlib =20
> | checking for arm-oe-linux-gnueabi-strip... arm-oe-linux-gnueabi-strip =
=20
> | checking whether ln -s works... yes =20
> | checking for arm-oe-linux-gnueabi-gcc...
> /home/anders/cs-builds/arago/build/arago-tmp-eglibc/work/cortexa8hf-vfp-n=
eon-2.6.37.2-oe-linux-gnueabi/gcc-cross-initial/4.8.1-r0/gcc-4.8.1/build.x8=
6_64-linux.arm-oe-linux-gnueabi/./gcc/xgcc
> -B/home/anders/cs-builds/arago/build/arago-tmp-eglibc/work/cortexa8hf-vfp=
-neon-2.6.37.2-oe-linux-gnueabi/gcc-cross-initial/4.8.1-r0/gcc-4.8.1/build.=
x86_64-linux.arm-oe-linux-gnueabi/./gcc/
> -march=3Darmv7-a -marm -mthumb-interwork -mfloat-abi=3Dhard -mfpu=3Dneon
> -mtune=3Dcortex-a8
> -isystem/home/anders/cs-builds/arago/build/arago-tmp-eglibc/sysroots/am37=
x-evm/usr/include
> -B/home/anders/cs-builds/arago/build/arago-tmp-eglibc/sysroots/x86_64-lin=
ux/usr/arm-oe-linux-gnueabi/bin/
> -B/home/anders/cs-builds/arago/build/arago-tmp-eglibc/sysroots/x86_64-lin=
ux/usr/arm-oe-linux-gnueabi/lib/
> -isystem
> /home/anders/cs-builds/arago/build/arago-tmp-eglibc/sysroots/x86_64-linux=
/usr/arm-oe-linux-gnueabi/include
> -isystem
> /home/anders/cs-builds/arago/build/arago-tmp-eglibc/sysroots/x86_64-linux=
/usr/arm-oe-linux-gnueabi/sys-include
> --sysroot=3D/home/anders/cs-builds/arago/build/arago-tmp-eglibc/work/cort=
exa8hf-vfp-neon-2.6.37.2-oe-linux-gnueabi/gcc-cross-initial/4.8.1-r0/gcc-4.=
8.1/build.x86_64-linux.arm-oe-linux-gnueabi/tmpsysroot =20
> | checking for suffix of object files... configure: error: in
> `/home/anders/cs-builds/arago/build/arago-tmp-eglibc/work/cortexa8hf-vfp-=
neon-2.6.37.2-oe-linux-gnueabi/gcc-cross-initial/4.8.1-r0/gcc-4.8.1/build.x=
86_64-linux.arm-oe-linux-gnueabi/arm-oe-linux-gnueabi/libgcc': =20
> | configure: error: cannot compute suffix of object files: cannot
> compile=20
> | See `config.log' for more details.=20
> | make: *** [configure-target-libgcc] Error 1 =20
> | ERROR: oe_runmake failed=20
>=20
>=20
> The log from the check for "suffix of object files" in config.log is:
> configure:3565: checking for suffix of object files
> configure:3587:
> /home/anders/cs-builds/arago/build/arago-tmp-eglibc/work/cortexa8hf-vfp-n=
eon-2.6.37.2-oe-linux-gnueabi/gcc-cross-initial/4.8.1-r0/gcc-4.8.1/build.x8=
6_64-linux.arm-oe-linux-gnueabi/./gcc/xgcc -B/home/anders/cs-builds/arago/b=
uild/arago-tmp-eglibc/work/cortexa8hf-vfp-neon-2.6.37.2-oe-linux-gnueabi/gc=
c-cross-initial/4.8.1-r0/gcc-4.8.1/build.x86_64-linux.arm-oe-linux-gnueabi/=
=2E/gcc/ -march=3Darmv7-a -marm -mthumb-interwork -mfloat-abi=3Dhard -mfpu=
=3Dneon -mtune=3Dcortex-a8 -isystem/home/anders/cs-builds/arago/build/arago=
-tmp-eglibc/sysroots/am37x-evm/usr/include -B/home/anders/cs-builds/arago/b=
uild/arago-tmp-eglibc/sysroots/x86_64-linux/usr/arm-oe-linux-gnueabi/bin/ -=
B/home/anders/cs-builds/arago/build/arago-tmp-eglibc/sysroots/x86_64-linux/=
usr/arm-oe-linux-gnueabi/lib/ -isystem/home/anders/cs-builds/arago/build/ar=
ago-tmp-eglibc/sysroots/x86_64-linux/usr/arm-oe-linux-gnueabi/include -isys=
tem/home/anders/cs-builds/arago/build/arago-tmp-eglibc/sysroots/x86_64-linu=
x/usr/arm-oe-linux-gnueabi/sys-include --sysroot=3D/home/anders
> /cs-builds/arago/build/arago-tmp-eglibc/work/cortexa8hf-vfp-neon-2.6.37.2=
-oe-linux-gnueabi/gcc-cross-initial/4.8.1-r0/gcc-4.8.1/build.x86_64-linux.a=
rm-oe-linux-gnueabi/tmpsysroot -c -g -Os
>   conftest.c >&5
> /home/anders/cs-builds/arago/build/arago-tmp-eglibc/work/cortexa8hf-vfp-n=
eon-2.6.37.2-oe-linux-gnueabi/gcc-cross
> -initial/4.8.1-r0/gcc-4.8.1/build.x86_64-linux.arm-oe-linux-gnueabi/./gcc=
/as: line 87: exec: -m: invalid option
> exec: usage: exec [-cl] [-a name] [command [arguments ...]] [redirection
> ...]
> configure:3591: $? =3D 1
> configure: failed program was:
> | /* confdefs.h */
> | #define PACKAGE_NAME "GNU C Runtime Library"
> | #define PACKAGE_TARNAME "libgcc"
> | #define PACKAGE_VERSION "1.0"
> | #define PACKAGE_STRING "GNU C Runtime Library 1.0"
> | #define PACKAGE_BUGREPORT ""
> | #define PACKAGE_URL "http://www.gnu.org/software/libgcc/"
> | /* end confdefs.h.  */
> |=20
> | int
> | main ()
> | {
> |=20
> |   ;
> |   return 0;
> | } =20
> configure:3605: error: in
> `/home/anders/cs-builds/arago/build/arago-tmp-eglibc/work/cortexa8hf-vfp-=
neon-2.6.37.2-oe-linux-gnueabi/gcc-cross-initial/4.8.1-r0/gcc-4.8.1/build.x=
86_64-linux.arm-oe-linux-gnueabi/arm-oe-linux-gnueabi/libgcc':
> configure:3608: error: cannot compute suffix of object files: cannot
> compile
> See `config.log' for more details.
>=20
> On the Ubuntu machine, the error is the same.
>=20
>=20
> Any ideas what can be causing this?=20
>=20
> Thanks in advance for any pointers...
>=20
> Cheers,
> Anders
>=20
> --=20
> Anders Darander
> ChargeStorm AB		Tel: +46 702 44 84 36
> Drottninggatan 20	Email: anders@chargestorm.se
> 602 24 Norrk=F6ping	Web: www.chargestorm.se
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

