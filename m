Return-Path: <Yves.Godin@nutaq.com>
Received: from mail.nutaq.com (mail.lyrtechrd.com [24.37.17.211])
	by arago-project.org (Postfix) with ESMTPS id 067BC5298A
	for <meta-arago@arago-project.org>;
	Mon, 27 Jan 2014 17:09:57 +0000 (UTC)
X-ASG-Debug-ID: 1390842584-02f35b43b428eeb0001-NloGV9
Received: from NTWAEX01.interne.lyrtech.com ([172.16.10.16]) by mail.nutaq.com
	with ESMTP id kqLpa3kO9lbYwKxl for <meta-arago@arago-project.org>;
	Mon, 27 Jan 2014 12:09:44 -0500 (EST)
X-Barracuda-Envelope-From: Yves.Godin@nutaq.com
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Mon, 27 Jan 2014 12:10:02 -0500
X-ASG-Orig-Subj: lldpd
Message-ID: <86E210CFD3EEDE46A58DE4793CFA6C3FC2EF26@NTWAEX01.interne.lyrtech.com>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: lldpd
Thread-Index: Ac8bgp4h+5mvSAzWRHuoITbr7/FeyA==
From: "Yves Godin" <Yves.Godin@nutaq.com>
To: <meta-arago@arago-project.org>
X-Barracuda-Connect: UNKNOWN[172.16.10.16]
X-Barracuda-Start-Time: 1390842584
X-Barracuda-URL: http://172.16.0.8:8000/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at nutaq.com
X-Barracuda-BRTS-Status: 1
X-Barracuda-BRTS-Evidence: remlab.net
X-Barracuda-Spam-Score: -1002.00
X-Barracuda-Spam-Status: No, SCORE=-1002.00 using global scores of
	TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=1000.0 
Subject: lldpd
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
X-List-Received-Date: Mon, 27 Jan 2014 17:09:57 -0000
Content-class: urn:content-classes:message
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01CF1B82.9DEE61B9"

------_=_NextPart_001_01CF1B82.9DEE61B9
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

I'm trying to build the sc-mcsdk for the tci6614-evm but I am having
problem with the lldpd package.

I guess that /usr/sbin of the host machine is not the intended
installation path.

=20

I'm following the instructions as documented in the SC-MCSDK 2.0 User
Guide.

=20

Any advice ?

Yves

=20

Here is the output:

=20

Build Configuration:

BB_VERSION        =3D "1.17.0"

TARGET_ARCH       =3D "arm"

TARGET_OS         =3D "linux-gnueabi"

MACHINE           =3D "tci6614-evm"

DISTRO            =3D "arago"

DISTRO_VERSION    =3D "2013.04"

TUNE_FEATURES     =3D "armv7a vfp neon thumb callconvention-hard cortexa8"

TARGET_FPU        =3D "vfp-neon"

meta-arago-distro=20

meta-arago-extras =3D
"tci6614-evm-2.2.1:5368073046d02e64bb4f3b3323640f63b539b572"

toolchain-layer=20=20=20

meta-oe           =3D
"(nobranch):f00028caf257e386c0f3ae46bd4b3ba53dd0729d"

meta-ti           =3D
"tci6614-evm-2.2.1:1d2a6bde4429c1a390f9067464053e3968991582"

meta-linaro       =3D
"(nobranch):d0558fa4304592622423582f8b464e1c22cfe6f1"

meta              =3D
"(nobranch):0785489d558c34cacf5cb349949a15e27084efbf"

=20

NOTE: Resolving any missing task queue dependencies

NOTE: Preparing runqueue

NOTE: Executing SetScene Tasks

NOTE: Executing RunQueue Tasks

WARNING: Failed to fetch URL http://www.zlib.net/zlib-1.2.7.tar.bz2,
attempting MIRRORS if available

WARNING: Failed to fetch URL http://zlib.net/pigz/pigz-2.2.5.tar.gz,
attempting MIRRORS if available

WARNING: Failed to fetch URL
http://pkg-shadow.alioth.debian.org/releases/shadow-4.1.4.3.tar.bz2,
attempting MIRRORS if available

WARNING: Failed to fetch URL
http://kernel.org/pub/linux/utils/kernel/hotplug/udev-164.tar.gz,
attempting MIRRORS if available

WARNING: Failed to fetch URL
http://www.apache.org/dist/apr/apr-1.4.6.tar.bz2, attempting MIRRORS if
available

WARNING: Failed to fetch URL
http://www.apache.org/dist/apr/apr-util-1.4.1.tar.gz, attempting MIRRORS
if available

WARNING: Failed to fetch URL
http://www.apache.org/dist/subversion/subversion-1.7.6.tar.bz2,
attempting MIRRORS if available

WARNING: File '/lib/ld-2.15.so' from external-linaro-toolchain was
already stripped, this will prevent future debugging!

WARNING: File '/lib/libc-2.15.so' from external-linaro-toolchain was
already stripped, this will prevent future debugging!

WARNING: QA Issue: external-linaro-toolchain: Files/directories were
installed but not shipped

  /lib/libitm.spec

  /lib/libgomp.so.1

  /lib/libattr.so.1.1.0

  /lib/libattr.so.1

  /lib/libacl.so.1.1.0

  /lib/libgomp.so.1.0.0

  /lib/libacl.so.1

  /lib/libssp.so.0

  /lib/libitm.so.1.0.0

  /lib/libitm.so.1

  /lib/libssp.so.0.0.0

  /lib/libgomp.spec

  /lib/arm-linux-gnueabi

  /lib/arm-linux-gnueabi/libmudflap.so

  /lib/arm-linux-gnueabi/libgfortran.so

  /lib/arm-linux-gnueabi/libmudflapth.a

  /lib/arm-linux-gnueabi/libgomp.a

  /lib/arm-linux-gnueabi/libitm.spec

  /lib/arm-linux-gnueabi/libstdc++.so

  /lib/arm-linux-gnueabi/libgomp.so.1

  /lib/arm-linux-gnueabi/libmudflapth.so.0.0.0

  /lib/arm-linux-gnueabi/libstdc++.so.6

  /lib/arm-linux-gnueabi/libssp_nonshared.a

  /lib/arm-linux-gnueabi/libgomp.so.1.0.0

  /lib/arm-linux-gnueabi/libstdc++.a

  /lib/arm-linux-gnueabi/libitm.so

  /lib/arm-linux-gnueabi/libgomp.so

  /lib/arm-linux-gnueabi/libitm.a

  /lib/arm-linux-gnueabi/libstdc++.so.6.0.17-gdb.py

  /lib/arm-linux-gnueabi/libgfortran.a

  /lib/arm-linux-gnueabi/libgcc_s.so

  /lib/arm-linux-gnueabi/libmudflap.so.0.0.0

  /lib/arm-linux-gnueabi/libgcc_s.so.1

  /lib/arm-linux-gnueabi/libssp.so.0

  /lib/arm-linux-gnueabi/libmudflap.a

  /lib/arm-linux-gnueabi/libitm.so.1.0.0

  /lib/arm-linux-gnueabi/libmudflapth.so

  /lib/arm-linux-gnueabi/libgfortran.so.3.0.0

  /lib/arm-linux-gnueabi/libmudflap.so.0

  /lib/arm-linux-gnueabi/libmudflapth.so.0

  /lib/arm-linux-gnueabi/libssp.a

  /lib/arm-linux-gnueabi/libsupc++.a

  /lib/arm-linux-gnueabi/libstdc++.so.6.0.17

  /lib/arm-linux-gnueabi/libitm.so.1

  /lib/arm-linux-gnueabi/libssp.so.0.0.0

  /lib/arm-linux-gnueabi/libgfortran.spec

  /lib/arm-linux-gnueabi/libssp.so

  /lib/arm-linux-gnueabi/libgomp.spec

  /lib/arm-linux-gnueabi/libgfortran.so.3

  /lib/arm-linux-gnueabi/.debug

  /lib/arm-linux-gnueabi/.debug/libmudflap.so

  /lib/arm-linux-gnueabi/.debug/libgfortran.so

  /lib/arm-linux-gnueabi/.debug/libstdc++.so

  /lib/arm-linux-gnueabi/.debug/libgomp.so.1

  /lib/arm-linux-gnueabi/.debug/libmudflapth.so.0.0.0

  /lib/arm-linux-gnueabi/.debug/libstdc++.so.6

  /lib/arm-linux-gnueabi/.debug/libgomp.so.1.0.0

  /lib/arm-linux-gnueabi/.debug/libitm.so

  /lib/arm-linux-gnueabi/.debug/libgomp.so

  /lib/arm-linux-gnueabi/.debug/libmudflap.so.0.0.0

  /lib/arm-linux-gnueabi/.debug/libssp.so.0

  /lib/arm-linux-gnueabi/.debug/libitm.so.1.0.0

  /lib/arm-linux-gnueabi/.debug/libmudflapth.so

  /lib/arm-linux-gnueabi/.debug/libgfortran.so.3.0.0

  /lib/arm-linux-gnueabi/.debug/libmudflap.so.0

  /lib/arm-linux-gnueabi/.debug/libmudflapth.so.0

  /lib/arm-linux-gnueabi/.debug/libstdc++.so.6.0.17

  /lib/arm-linux-gnueabi/.debug/libitm.so.1

  /lib/arm-linux-gnueabi/.debug/libssp.so.0.0.0

  /lib/arm-linux-gnueabi/.debug/libssp.so

  /lib/arm-linux-gnueabi/.debug/libgfortran.so.3

  /usr/lib/liblzma.so.5.0.0

  /usr/lib/liblzma.so.5

WARNING: QA Issue: No GNU_HASH in the elf binary:
'/home/ygodin/devel/sc-mcsdk/oe-layersetup-mcsdk/build/arago-tmp-externa
l-linaro-toolchain/work/armv7ahf-vfp-neon-oe-linux-gnueabi/external-lina
ro-toolchain-2013.03-r2-arago3/packages-split/external-linaro-toolchain/
lib/libmudflapth.so.0.0.0'

WARNING: QA Issue: No GNU_HASH in the elf binary:
'/home/ygodin/devel/sc-mcsdk/oe-layersetup-mcsdk/build/arago-tmp-externa
l-linaro-toolchain/work/armv7ahf-vfp-neon-oe-linux-gnueabi/external-lina
ro-toolchain-2013.03-r2-arago3/packages-split/external-linaro-toolchain/
lib/libmudflap.so.0.0.0'

WARNING: QA Issue: non -staticdev package contains static .a library:
external-linaro-toolchain-dev path
'/work/armv7ahf-vfp-neon-oe-linux-gnueabi/external-linaro-toolchain-2013
.03-r2-arago3/packages-split/external-linaro-toolchain-dev/lib/libmudfla
pth.a'

WARNING: QA Issue: non -staticdev package contains static .a library:
external-linaro-toolchain-dev path
'/work/armv7ahf-vfp-neon-oe-linux-gnueabi/external-linaro-toolchain-2013
.03-r2-arago3/packages-split/external-linaro-toolchain-dev/lib/libgomp.a
'

WARNING: QA Issue: non -staticdev package contains static .a library:
external-linaro-toolchain-dev path
'/work/armv7ahf-vfp-neon-oe-linux-gnueabi/external-linaro-toolchain-2013
.03-r2-arago3/packages-split/external-linaro-toolchain-dev/lib/libitm.a'

WARNING: QA Issue: non -staticdev package contains static .a library:
external-linaro-toolchain-dev path
'/work/armv7ahf-vfp-neon-oe-linux-gnueabi/external-linaro-toolchain-2013
.03-r2-arago3/packages-split/external-linaro-toolchain-dev/lib/libmudfla
p.a'

WARNING: QA Issue: non -staticdev package contains static .a library:
external-linaro-toolchain-dev path
'/work/armv7ahf-vfp-neon-oe-linux-gnueabi/external-linaro-toolchain-2013
.03-r2-arago3/packages-split/external-linaro-toolchain-dev/lib/libssp.a'

WARNING: QA Issue: non -staticdev package contains static .a library:
external-linaro-toolchain-dev path
'/work/armv7ahf-vfp-neon-oe-linux-gnueabi/external-linaro-toolchain-2013
.03-r2-arago3/packages-split/external-linaro-toolchain-dev/usr/lib/libut
il.a'

WARNING: QA Issue: non -staticdev package contains static .a library:
external-linaro-toolchain-dev path
'/work/armv7ahf-vfp-neon-oe-linux-gnueabi/external-linaro-toolchain-2013
.03-r2-arago3/packages-split/external-linaro-toolchain-dev/usr/lib/libg.
a'

WARNING: QA Issue: non -staticdev package contains static .a library:
external-linaro-toolchain-dev path
'/work/armv7ahf-vfp-neon-oe-linux-gnueabi/external-linaro-toolchain-2013
.03-r2-arago3/packages-split/external-linaro-toolchain-dev/usr/lib/librp
csvc.a'

WARNING: QA Issue: non -staticdev package contains static .a library:
external-linaro-toolchain-dev path
'/work/armv7ahf-vfp-neon-oe-linux-gnueabi/external-linaro-toolchain-2013
.03-r2-arago3/packages-split/external-linaro-toolchain-dev/usr/lib/libc.
a'

WARNING: QA Issue: non -staticdev package contains static .a library:
external-linaro-toolchain-dev path
'/work/armv7ahf-vfp-neon-oe-linux-gnueabi/external-linaro-toolchain-2013
.03-r2-arago3/packages-split/external-linaro-toolchain-dev/usr/lib/libmc
heck.a'

WARNING: QA Issue: non -staticdev package contains static .a library:
external-linaro-toolchain-dev path
'/work/armv7ahf-vfp-neon-oe-linux-gnueabi/external-linaro-toolchain-2013
.03-r2-arago3/packages-split/external-linaro-toolchain-dev/usr/lib/libns
l.a'

WARNING: QA Issue: non -staticdev package contains static .a library:
external-linaro-toolchain-dev path
'/work/armv7ahf-vfp-neon-oe-linux-gnueabi/external-linaro-toolchain-2013
.03-r2-arago3/packages-split/external-linaro-toolchain-dev/usr/lib/librt
.a'

WARNING: QA Issue: non -staticdev package contains static .a library:
external-linaro-toolchain-dev path
'/work/armv7ahf-vfp-neon-oe-linux-gnueabi/external-linaro-toolchain-2013
.03-r2-arago3/packages-split/external-linaro-toolchain-dev/usr/lib/libm.
a'

WARNING: QA Issue: non -staticdev package contains static .a library:
external-linaro-toolchain-dev path
'/work/armv7ahf-vfp-neon-oe-linux-gnueabi/external-linaro-toolchain-2013
.03-r2-arago3/packages-split/external-linaro-toolchain-dev/usr/lib/libBr
okenLocale.a'

WARNING: QA Issue: non -staticdev package contains static .a library:
external-linaro-toolchain-dev path
'/work/armv7ahf-vfp-neon-oe-linux-gnueabi/external-linaro-toolchain-2013
.03-r2-arago3/packages-split/external-linaro-toolchain-dev/usr/lib/libpt
hread.a'

WARNING: QA Issue: non -staticdev package contains static .a library:
external-linaro-toolchain-dev path
'/work/armv7ahf-vfp-neon-oe-linux-gnueabi/external-linaro-toolchain-2013
.03-r2-arago3/packages-split/external-linaro-toolchain-dev/usr/lib/libre
solv.a'

WARNING: QA Issue: non -staticdev package contains static .a library:
external-linaro-toolchain-dev path
'/work/armv7ahf-vfp-neon-oe-linux-gnueabi/external-linaro-toolchain-2013
.03-r2-arago3/packages-split/external-linaro-toolchain-dev/usr/lib/libbs
d-compat.a'

WARNING: QA Issue: non -staticdev package contains static .a library:
external-linaro-toolchain-dev path
'/work/armv7ahf-vfp-neon-oe-linux-gnueabi/external-linaro-toolchain-2013
.03-r2-arago3/packages-split/external-linaro-toolchain-dev/usr/lib/libcr
ypt.a'

WARNING: QA Issue: non -staticdev package contains static .a library:
external-linaro-toolchain-dev path
'/work/armv7ahf-vfp-neon-oe-linux-gnueabi/external-linaro-toolchain-2013
.03-r2-arago3/packages-split/external-linaro-toolchain-dev/usr/lib/libie
ee.a'

WARNING: QA Issue: non -staticdev package contains static .a library:
external-linaro-toolchain-dev path
'/work/armv7ahf-vfp-neon-oe-linux-gnueabi/external-linaro-toolchain-2013
.03-r2-arago3/packages-split/external-linaro-toolchain-dev/usr/lib/liban
l.a'

WARNING: QA Issue: non -staticdev package contains static .a library:
external-linaro-toolchain-dev path
'/work/armv7ahf-vfp-neon-oe-linux-gnueabi/external-linaro-toolchain-2013
.03-r2-arago3/packages-split/external-linaro-toolchain-dev/usr/lib/libdl
.a'

WARNING: QA Issue: No GNU_HASH in the elf binary:
'/home/ygodin/devel/sc-mcsdk/oe-layersetup-mcsdk/build/arago-tmp-externa
l-linaro-toolchain/work/armv7ahf-vfp-neon-oe-linux-gnueabi/zip-3.0-r1/pa
ckages-split/zip/usr/bin/zip'

WARNING: QA Issue: No GNU_HASH in the elf binary:
'/home/ygodin/devel/sc-mcsdk/oe-layersetup-mcsdk/build/arago-tmp-externa
l-linaro-toolchain/work/armv7ahf-vfp-neon-oe-linux-gnueabi/zip-3.0-r1/pa
ckages-split/zip/usr/bin/zipsplit'

WARNING: QA Issue: No GNU_HASH in the elf binary:
'/home/ygodin/devel/sc-mcsdk/oe-layersetup-mcsdk/build/arago-tmp-externa
l-linaro-toolchain/work/armv7ahf-vfp-neon-oe-linux-gnueabi/zip-3.0-r1/pa
ckages-split/zip/usr/bin/zipcloak'

WARNING: QA Issue: No GNU_HASH in the elf binary:
'/home/ygodin/devel/sc-mcsdk/oe-layersetup-mcsdk/build/arago-tmp-externa
l-linaro-toolchain/work/armv7ahf-vfp-neon-oe-linux-gnueabi/zip-3.0-r1/pa
ckages-split/zip/usr/bin/zipnote'

WARNING: QA Issue: No GNU_HASH in the elf binary:
'/home/ygodin/devel/sc-mcsdk/oe-layersetup-mcsdk/build/arago-tmp-externa
l-linaro-toolchain/work/armv7ahf-vfp-neon-oe-linux-gnueabi/gdbm-1.8.3-r4
/packages-split/gdbm/usr/lib/libgdbm.so.3.0.0'

WARNING: The recipe is trying to install files into a shared area when
those files already exist. Those files are:

=20
/home/ygodin/devel/sc-mcsdk/oe-layersetup-mcsdk/build/arago-tmp-external
-linaro-toolchain/sysroots/tci6614-evm/lib/libattr.so.1.1.0

=20
/home/ygodin/devel/sc-mcsdk/oe-layersetup-mcsdk/build/arago-tmp-external
-linaro-toolchain/sysroots/tci6614-evm/lib/libattr.so.1

WARNING: The recipe is trying to install files into a shared area when
those files already exist. Those files are:

=20
/home/ygodin/devel/sc-mcsdk/oe-layersetup-mcsdk/build/arago-tmp-external
-linaro-toolchain/sysroots/tci6614-evm/lib/libacl.so.1.1.0

=20
/home/ygodin/devel/sc-mcsdk/oe-layersetup-mcsdk/build/arago-tmp-external
-linaro-toolchain/sysroots/tci6614-evm/lib/libacl.so.1

WARNING: ti-cuia: No generic license file exists for: TI in any provider

WARNING: QA Issue: ti-cuia: Files/directories were installed but not
shipped

  /usr/lib/gnu.targets.codesourcery.rtsv5T.a470MV

  /usr/lib/boot.am3g

  /usr/lib/syscalls.am3g

  /usr/lib/syscalls.am4g

  /usr/lib/gnu.targets.arm.rtsv7M.am4g

  /usr/lib/boot.am4g

  /usr/lib/gnu.targets.arm.rtsv6.av6

  /usr/lib/boot.am4fg

  /usr/lib/gnu.targets.arm.rtsv5T.av5T

  /usr/lib/syscalls.am4fg

  /usr/lib/gnu.targets.arm.rtsv7M.am3g

  /usr/lib/gnu.targets.arm.rtsv7A.av7A

  /usr/lib/gnu.targets.codesourcery.rtsv6.av6

  /usr/lib/gnu.targets.arm.rtsv7M.am4fg

WARNING: Failed to fetch URL
http://www.remlab.net/files/ndisc6/ndisc6-0.6.7.tar.bz2, attempting
MIRRORS if available

WARNING: Failed to fetch URL
ftp://ftp.uni-erlangen.de/pub/Linux/LOCAL/dosfstools/dosfstools-2.11.src
.tar.gz, attempting MIRRORS if available

WARNING: Failed to fetch URL
http://www.angstrom-distribution.org/unstable/sources/tinylogin-1.4.tar.
bz2, attempting MIRRORS if available

WARNING: ti-transportnetlib-ipsecmgr: No generic license file exists
for: TI in any provider

WARNING: ti-udma: No generic license file exists for: TI in any provider

WARNING: ti-trace-framework: No generic license file exists for: TI in
any provider

WARNING: QA Issue: udev: /lib/libgudev-1.0.so.0.0.1, installed in the
base_prefix, requires a shared library under exec_prefix (/usr):
libgobject-2.0.so.0 =3D> /usr/lib/libgobject-2.0.so.0 (0xdead2000)

WARNING: QA Issue: udev: /lib/libgudev-1.0.so.0.0.1, installed in the
base_prefix, requires a shared library under exec_prefix (/usr):
libgthread-2.0.so.0 =3D> /usr/lib/libgthread-2.0.so.0 (0xdead3000)

WARNING: QA Issue: udev: /lib/libgudev-1.0.so.0.0.1, installed in the
base_prefix, requires a shared library under exec_prefix (/usr):
libffi.so.6 =3D> /usr/lib/libffi.so.6 (0xdead4000)

WARNING: QA Issue: udev: /lib/libgudev-1.0.so.0.0.1, installed in the
base_prefix, requires a shared library under exec_prefix (/usr):
libglib-2.0.so.0 =3D> /usr/lib/libglib-2.0.so.0 (0xdead5000)

WARNING: QA Issue: udev: /lib/udev/udev-acl, installed in the
base_prefix, requires a shared library under exec_prefix (/usr):
libglib-2.0.so.0 =3D> /usr/lib/libglib-2.0.so.0 (0xdead2000)

ERROR: Function failed: do_install (see
/home/ygodin/devel/sc-mcsdk/oe-layersetup-mcsdk/build/arago-tmp-external
-linaro-toolchain/work/armv7ahf-vfp-neon-oe-linux-gnueabi/lldpd-0.5.7-r1
/temp/log.do_install.31494 for further information)

ERROR: Logfile of failure stored in:
/home/ygodin/devel/sc-mcsdk/oe-layersetup-mcsdk/build/arago-tmp-external
-linaro-toolchain/work/armv7ahf-vfp-neon-oe-linux-gnueabi/lldpd-0.5.7-r1
/temp/log.do_install.31494

Log data follows:

| DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common',
'common-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi',
'common']

| DEBUG: Executing shell function do_install

| NOTE: make -j 8 install

| Making install in src

| make[1]: Entering directory
`/home/ygodin/devel/sc-mcsdk/oe-layersetup-mcsdk/build/arago-tmp-externa
l-linaro-toolchain/work/armv7ahf-vfp-neon-oe-linux-gnueabi/lldpd-0.5.7-r
1/lldpd-0.5.7/src'

| make[2]: Entering directory
`/home/ygodin/devel/sc-mcsdk/oe-layersetup-mcsdk/build/arago-tmp-externa
l-linaro-toolchain/work/armv7ahf-vfp-neon-oe-linux-gnueabi/lldpd-0.5.7-r
1/lldpd-0.5.7/src'

| make[2]: Nothing to be done for `install-data-am'.

| test -z "/usr/sbin" || /bin/mkdir -p "/usr/sbin"

|   /bin/bash ../libtool   --mode=3Dinstall /usr/bin/install -c lldpd
lldpctl '/usr/sbin'

| libtool: install: /usr/bin/install -c lldpd /usr/sbin/lldpd

| /usr/bin/install: cannot create regular file `/usr/sbin/lldpd':
Permission denied

| make[2]: *** [install-sbinPROGRAMS] Error 1

| make[2]: Leaving directory
`/home/ygodin/devel/sc-mcsdk/oe-layersetup-mcsdk/build/arago-tmp-externa
l-linaro-toolchain/work/armv7ahf-vfp-neon-oe-linux-gnueabi/lldpd-0.5.7-r
1/lldpd-0.5.7/src'

| make[1]: *** [install-am] Error 2

| make[1]: Leaving directory
`/home/ygodin/devel/sc-mcsdk/oe-layersetup-mcsdk/build/arago-tmp-externa
l-linaro-toolchain/work/armv7ahf-vfp-neon-oe-linux-gnueabi/lldpd-0.5.7-r
1/lldpd-0.5.7/src'

| make: *** [install-recursive] Error 1

| ERROR: oe_runmake failed

| ERROR: Function failed: do_install (see
/home/ygodin/devel/sc-mcsdk/oe-layersetup-mcsdk/build/arago-tmp-external
-linaro-toolchain/work/armv7ahf-vfp-neon-oe-linux-gnueabi/lldpd-0.5.7-r1
/temp/log.do_install.31494 for further information)

ERROR: Task 1739
(/home/ygodin/devel/sc-mcsdk/oe-layersetup-mcsdk/sources/meta-arago/meta
-arago-extras/recipes-bsp/lldpd/lldpd_0.5.7.bb, do_install) failed with
exit code '1'

NOTE: Tasks Summary: Attempted 1772 tasks of which 179 didn't need to be
rerun and 1 failed.

Waiting for 0 running tasks to finish:

=20

Summary: 1 task failed:

=20
/home/ygodin/devel/sc-mcsdk/oe-layersetup-mcsdk/sources/meta-arago/meta-
arago-extras/recipes-bsp/lldpd/lldpd_0.5.7.bb, do_install

Summary: There were 53 WARNING messages shown.

Summary: There was 1 ERROR message shown, returning a non-zero exit
code.


------_=_NextPart_001_01CF1B82.9DEE61B9
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40"><head><meta http-equiv=3DContent-Type content=
=3D"text/html; charset=3Dus-ascii"><meta name=3DGenerator content=3D"Micros=
oft Word 12 (filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DFR-CA link=3Dblue vli=
nk=3Dpurple><div class=3DWordSection1><p class=3DMsoNormal><span lang=3DEN-=
CA>Hi,<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-CA>I&#8217=
;m trying to build the sc-mcsdk for the tci6614-evm but I am having problem=
 with the lldpd package.<o:p></o:p></span></p><p class=3DMsoNormal><span la=
ng=3DEN-CA>I guess that /usr/sbin of the host machine is not the intended i=
nstallation path.<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN=
-CA><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span lang=3DEN-CA>I&#=
8217;m following the instructions as documented in the SC-MCSDK 2.0 User Gu=
ide.<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-CA><o:p>&nbs=
p;</o:p></span></p><p class=3DMsoNormal><span lang=3DEN-CA>Any advice ?<o:p=
></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-CA>Yves<o:p></o:p></=
span></p><p class=3DMsoNormal><span lang=3DEN-CA><o:p>&nbsp;</o:p></span></=
p><p class=3DMsoNormal><span lang=3DEN-CA>Here is the output:<o:p></o:p></s=
pan></p><p class=3DMsoNormal><span lang=3DEN-CA><o:p>&nbsp;</o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-CA>Build Configuration:<o:p></o:p></s=
pan></p><p class=3DMsoNormal><span lang=3DEN-CA>BB_VERSION&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;1.17.0&quot;<o:p></o:p></span></p><p cl=
ass=3DMsoNormal><span lang=3DEN-CA>TARGET_ARCH&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; =3D &quot;arm&quot;<o:p></o:p></span></p><p class=3DMsoNormal><span=
 lang=3DEN-CA>TARGET_OS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D=
 &quot;linux-gnueabi&quot;<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-CA>MACHINE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; =3D &quot;tci6614-evm&quot;<o:p></o:p></span></p><p class=3DMsoNormal=
><span lang=3DEN-CA>DISTRO&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; =3D &quot;arago&quot;<o:p></o:p></span></p><p class=3DMso=
Normal><span lang=3DEN-CA>DISTRO_VERSION&nbsp;&nbsp;&nbsp; =3D &quot;2013.0=
4&quot;<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-CA>TUNE_F=
EATURES&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;armv7a vfp neon thumb callconvent=
ion-hard cortexa8&quot;<o:p></o:p></span></p><p class=3DMsoNormal><span lan=
g=3DEN-CA>TARGET_FPU&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;vf=
p-neon&quot;<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-CA>m=
eta-arago-distro <o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN=
-CA>meta-arago-extras =3D &quot;tci6614-evm-2.2.1:5368073046d02e64bb4f3b332=
3640f63b539b572&quot;<o:p></o:p></span></p><p class=3DMsoNormal><span lang=
=3DEN-CA>toolchain-layer&nbsp;&nbsp; <o:p></o:p></span></p><p class=3DMsoNo=
rmal><span lang=3DEN-CA>meta-oe&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; =3D &quot;(nobranch):f00028caf257e386c0f3ae46bd4b3ba53dd07=
29d&quot;<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-CA>meta=
-ti&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;t=
ci6614-evm-2.2.1:1d2a6bde4429c1a390f9067464053e3968991582&quot;<o:p></o:p><=
/span></p><p class=3DMsoNormal><span lang=3DEN-CA>meta-linaro&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; =3D &quot;(nobranch):d0558fa4304592622423582f8b464e1=
c22cfe6f1&quot;<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-C=
A>meta&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; =3D &quot;(nobranch):0785489d558c34cacf5cb349949a15e27084efbf&quo=
t;<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-CA><o:p>&nbsp;=
</o:p></span></p><p class=3DMsoNormal><span lang=3DEN-CA>NOTE: Resolving an=
y missing task queue dependencies<o:p></o:p></span></p><p class=3DMsoNormal=
><span lang=3DEN-CA>NOTE: Preparing runqueue<o:p></o:p></span></p><p class=
=3DMsoNormal><span lang=3DEN-CA>NOTE: Executing SetScene Tasks<o:p></o:p></=
span></p><p class=3DMsoNormal><span lang=3DEN-CA>NOTE: Executing RunQueue T=
asks<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-CA>WARNING: =
Failed to fetch URL http://www.zlib.net/zlib-1.2.7.tar.bz2, attempting MIRR=
ORS if available<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-=
CA>WARNING: Failed to fetch URL http://zlib.net/pigz/pigz-2.2.5.tar.gz, att=
empting MIRRORS if available<o:p></o:p></span></p><p class=3DMsoNormal><spa=
n lang=3DEN-CA>WARNING: Failed to fetch URL http://pkg-shadow.alioth.debian=
.org/releases/shadow-4.1.4.3.tar.bz2, attempting MIRRORS if available<o:p><=
/o:p></span></p><p class=3DMsoNormal><span lang=3DEN-CA>WARNING: Failed to =
fetch URL http://kernel.org/pub/linux/utils/kernel/hotplug/udev-164.tar.gz,=
 attempting MIRRORS if available<o:p></o:p></span></p><p class=3DMsoNormal>=
<span lang=3DEN-CA>WARNING: Failed to fetch URL http://www.apache.org/dist/=
apr/apr-1.4.6.tar.bz2, attempting MIRRORS if available<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-CA>WARNING: Failed to fetch URL http:=
//www.apache.org/dist/apr/apr-util-1.4.1.tar.gz, attempting MIRRORS if avai=
lable<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-CA>WARNING:=
 Failed to fetch URL http://www.apache.org/dist/subversion/subversion-1.7.6=
.tar.bz2, attempting MIRRORS if available<o:p></o:p></span></p><p class=3DM=
soNormal><span lang=3DEN-CA>WARNING: File '/lib/ld-2.15.so' from external-l=
inaro-toolchain was already stripped, this will prevent future debugging!<o=
:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-CA>WARNING: File '=
/lib/libc-2.15.so' from external-linaro-toolchain was already stripped, thi=
s will prevent future debugging!<o:p></o:p></span></p><p class=3DMsoNormal>=
<span lang=3DEN-CA>WARNING: QA Issue: external-linaro-toolchain: Files/dire=
ctories were installed but not shipped<o:p></o:p></span></p><p class=3DMsoN=
ormal><span lang=3DEN-CA>&nbsp; /lib/libitm.spec<o:p></o:p></span></p><p cl=
ass=3DMsoNormal><span lang=3DEN-CA>&nbsp; /lib/libgomp.so.1<o:p></o:p></spa=
n></p><p class=3DMsoNormal><span lang=3DEN-CA>&nbsp; /lib/libattr.so.1.1.0<=
o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-CA>&nbsp; /lib/li=
battr.so.1<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-CA>&nb=
sp; /lib/libacl.so.1.1.0<o:p></o:p></span></p><p class=3DMsoNormal><span la=
ng=3DEN-CA>&nbsp; /lib/libgomp.so.1.0.0<o:p></o:p></span></p><p class=3DMso=
Normal><span lang=3DEN-CA>&nbsp; /lib/libacl.so.1<o:p></o:p></span></p><p c=
lass=3DMsoNormal><span lang=3DEN-CA>&nbsp; /lib/libssp.so.0<o:p></o:p></spa=
n></p><p class=3DMsoNormal><span lang=3DEN-CA>&nbsp; /lib/libitm.so.1.0.0<o=
:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-CA>&nbsp; /lib/lib=
itm.so.1<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-CA>&nbsp=
; /lib/libssp.so.0.0.0<o:p></o:p></span></p><p class=3DMsoNormal><span lang=
=3DEN-CA>&nbsp; /lib/libgomp.spec<o:p></o:p></span></p><p class=3DMsoNormal=
><span lang=3DEN-CA>&nbsp; /lib/arm-linux-gnueabi<o:p></o:p></span></p><p c=
lass=3DMsoNormal><span lang=3DEN-CA>&nbsp; /lib/arm-linux-gnueabi/libmudfla=
p.so<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-CA>&nbsp; /l=
ib/arm-linux-gnueabi/libgfortran.so<o:p></o:p></span></p><p class=3DMsoNorm=
al><span lang=3DEN-CA>&nbsp; /lib/arm-linux-gnueabi/libmudflapth.a<o:p></o:=
p></span></p><p class=3DMsoNormal><span lang=3DEN-CA>&nbsp; /lib/arm-linux-=
gnueabi/libgomp.a<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN=
-CA>&nbsp; </span>/lib/arm-linux-gnueabi/libitm.spec<o:p></o:p></p><p class=
=3DMsoNormal>&nbsp; <span lang=3DEN-CA>/lib/arm-linux-gnueabi/libstdc++.so<=
o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-CA>&nbsp; /lib/ar=
m-linux-gnueabi/libgomp.so.1<o:p></o:p></span></p><p class=3DMsoNormal><spa=
n lang=3DEN-CA>&nbsp; /lib/arm-linux-gnueabi/libmudflapth.so.0.0.0<o:p></o:=
p></span></p><p class=3DMsoNormal><span lang=3DEN-CA>&nbsp; /lib/arm-linux-=
gnueabi/libstdc++.so.6<o:p></o:p></span></p><p class=3DMsoNormal><span lang=
=3DEN-CA>&nbsp; /lib/arm-linux-gnueabi/libssp_nonshared.a<o:p></o:p></span>=
</p><p class=3DMsoNormal><span lang=3DEN-CA>&nbsp; /lib/arm-linux-gnueabi/l=
ibgomp.so.1.0.0<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-C=
A>&nbsp; /lib/arm-linux-gnueabi/libstdc++.a<o:p></o:p></span></p><p class=
=3DMsoNormal><span lang=3DEN-CA>&nbsp; /lib/arm-linux-gnueabi/libitm.so<o:p=
></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-CA>&nbsp; /lib/arm-l=
inux-gnueabi/libgomp.so<o:p></o:p></span></p><p class=3DMsoNormal><span lan=
g=3DEN-CA>&nbsp; /lib/arm-linux-gnueabi/libitm.a<o:p></o:p></span></p><p cl=
ass=3DMsoNormal><span lang=3DEN-CA>&nbsp; /lib/arm-linux-gnueabi/libstdc++.=
so.6.0.17-gdb.py<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-=
CA>&nbsp; /lib/arm-linux-gnueabi/libgfortran.a<o:p></o:p></span></p><p clas=
s=3DMsoNormal><span lang=3DEN-CA>&nbsp; /lib/arm-linux-gnueabi/libgcc_s.so<=
o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-CA>&nbsp; /lib/ar=
m-linux-gnueabi/libmudflap.so.0.0.0<o:p></o:p></span></p><p class=3DMsoNorm=
al><span lang=3DEN-CA>&nbsp; /lib/arm-linux-gnueabi/libgcc_s.so.1<o:p></o:p=
></span></p><p class=3DMsoNormal><span lang=3DEN-CA>&nbsp; /lib/arm-linux-g=
nueabi/libssp.so.0<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DE=
N-CA>&nbsp; /lib/arm-linux-gnueabi/libmudflap.a<o:p></o:p></span></p><p cla=
ss=3DMsoNormal><span lang=3DEN-CA>&nbsp; /lib/arm-linux-gnueabi/libitm.so.1=
.0.0<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-CA>&nbsp; /l=
ib/arm-linux-gnueabi/libmudflapth.so<o:p></o:p></span></p><p class=3DMsoNor=
mal><span lang=3DEN-CA>&nbsp; /lib/arm-linux-gnueabi/libgfortran.so.3.0.0<o=
:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-CA>&nbsp; /lib/arm=
-linux-gnueabi/libmudflap.so.0<o:p></o:p></span></p><p class=3DMsoNormal><s=
pan lang=3DEN-CA>&nbsp; /lib/arm-linux-gnueabi/libmudflapth.so.0<o:p></o:p>=
</span></p><p class=3DMsoNormal><span lang=3DEN-CA>&nbsp; /lib/arm-linux-gn=
ueabi/libssp.a<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-CA=
>&nbsp; /lib/arm-linux-gnueabi/libsupc++.a<o:p></o:p></span></p><p class=3D=
MsoNormal><span lang=3DEN-CA>&nbsp; /lib/arm-linux-gnueabi/libstdc++.so.6.0=
.17<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-CA>&nbsp; /li=
b/arm-linux-gnueabi/libitm.so.1<o:p></o:p></span></p><p class=3DMsoNormal><=
span lang=3DEN-CA>&nbsp; /lib/arm-linux-gnueabi/libssp.so.0.0.0<o:p></o:p><=
/span></p><p class=3DMsoNormal><span lang=3DEN-CA>&nbsp; /lib/arm-linux-gnu=
eabi/libgfortran.spec<o:p></o:p></span></p><p class=3DMsoNormal><span lang=
=3DEN-CA>&nbsp; /lib/arm-linux-gnueabi/libssp.so<o:p></o:p></span></p><p cl=
ass=3DMsoNormal><span lang=3DEN-CA>&nbsp; /lib/arm-linux-gnueabi/libgomp.sp=
ec<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-CA>&nbsp; /lib=
/arm-linux-gnueabi/libgfortran.so.3<o:p></o:p></span></p><p class=3DMsoNorm=
al><span lang=3DEN-CA>&nbsp; /lib/arm-linux-gnueabi/.debug<o:p></o:p></span=
></p><p class=3DMsoNormal><span lang=3DEN-CA>&nbsp; /lib/arm-linux-gnueabi/=
.debug/libmudflap.so<o:p></o:p></span></p><p class=3DMsoNormal><span lang=
=3DEN-CA>&nbsp; /lib/arm-linux-gnueabi/.debug/libgfortran.so<o:p></o:p></sp=
an></p><p class=3DMsoNormal><span lang=3DEN-CA>&nbsp; /lib/arm-linux-gnueab=
i/.debug/libstdc++.so<o:p></o:p></span></p><p class=3DMsoNormal><span lang=
=3DEN-CA>&nbsp; /lib/arm-linux-gnueabi/.debug/libgomp.so.1<o:p></o:p></span=
></p><p class=3DMsoNormal><span lang=3DEN-CA>&nbsp; /lib/arm-linux-gnueabi/=
.debug/libmudflapth.so.0.0.0<o:p></o:p></span></p><p class=3DMsoNormal><spa=
n lang=3DEN-CA>&nbsp; /lib/arm-linux-gnueabi/.debug/libstdc++.so.6<o:p></o:=
p></span></p><p class=3DMsoNormal><span lang=3DEN-CA>&nbsp; /lib/arm-linux-=
gnueabi/.debug/libgomp.so.1.0.0<o:p></o:p></span></p><p class=3DMsoNormal><=
span lang=3DEN-CA>&nbsp; /lib/arm-linux-gnueabi/.debug/libitm.so<o:p></o:p>=
</span></p><p class=3DMsoNormal><span lang=3DEN-CA>&nbsp; /lib/arm-linux-gn=
ueabi/.debug/libgomp.so<o:p></o:p></span></p><p class=3DMsoNormal><span lan=
g=3DEN-CA>&nbsp; /lib/arm-linux-gnueabi/.debug/libmudflap.so.0.0.0<o:p></o:=
p></span></p><p class=3DMsoNormal><span lang=3DEN-CA>&nbsp; /lib/arm-linux-=
gnueabi/.debug/libssp.so.0<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-CA>&nbsp; /lib/arm-linux-gnueabi/.debug/libitm.so.1.0.0<o:p></o:p=
></span></p><p class=3DMsoNormal><span lang=3DEN-CA>&nbsp; /lib/arm-linux-g=
nueabi/.debug/libmudflapth.so<o:p></o:p></span></p><p class=3DMsoNormal><sp=
an lang=3DEN-CA>&nbsp; /lib/arm-linux-gnueabi/.debug/libgfortran.so.3.0.0<o=
:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-CA>&nbsp; /lib/arm=
-linux-gnueabi/.debug/libmudflap.so.0<o:p></o:p></span></p><p class=3DMsoNo=
rmal><span lang=3DEN-CA>&nbsp; /lib/arm-linux-gnueabi/.debug/libmudflapth.s=
o.0<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-CA>&nbsp; /li=
b/arm-linux-gnueabi/.debug/libstdc++.so.6.0.17<o:p></o:p></span></p><p clas=
s=3DMsoNormal><span lang=3DEN-CA>&nbsp; /lib/arm-linux-gnueabi/.debug/libit=
m.so.1<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-CA>&nbsp; =
/lib/arm-linux-gnueabi/.debug/libssp.so.0.0.0<o:p></o:p></span></p><p class=
=3DMsoNormal><span lang=3DEN-CA>&nbsp; /lib/arm-linux-gnueabi/.debug/libssp=
.so<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-CA>&nbsp; /li=
b/arm-linux-gnueabi/.debug/libgfortran.so.3<o:p></o:p></span></p><p class=
=3DMsoNormal><span lang=3DEN-CA>&nbsp; /usr/lib/liblzma.so.5.0.0<o:p></o:p>=
</span></p><p class=3DMsoNormal><span lang=3DEN-CA>&nbsp; /usr/lib/liblzma.=
so.5<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-CA>WARNING: =
QA Issue: No GNU_HASH in the elf binary: '/home/ygodin/devel/sc-mcsdk/oe-la=
yersetup-mcsdk/build/arago-tmp-external-linaro-toolchain/work/armv7ahf-vfp-=
neon-oe-linux-gnueabi/external-linaro-toolchain-2013.03-r2-arago3/packages-=
split/external-linaro-toolchain/lib/libmudflapth.so.0.0.0'<o:p></o:p></span=
></p><p class=3DMsoNormal><span lang=3DEN-CA>WARNING: QA Issue: No GNU_HASH=
 in the elf binary: '/home/ygodin/devel/sc-mcsdk/oe-layersetup-mcsdk/build/=
arago-tmp-external-linaro-toolchain/work/armv7ahf-vfp-neon-oe-linux-gnueabi=
/external-linaro-toolchain-2013.03-r2-arago3/packages-split/external-linaro=
-toolchain/lib/libmudflap.so.0.0.0'<o:p></o:p></span></p><p class=3DMsoNorm=
al><span lang=3DEN-CA>WARNING: QA Issue: non -staticdev package contains st=
atic .a library: external-linaro-toolchain-dev path '/work/armv7ahf-vfp-neo=
n-oe-linux-gnueabi/external-linaro-toolchain-2013.03-r2-arago3/packages-spl=
it/external-linaro-toolchain-dev/lib/libmudflapth.a'<o:p></o:p></span></p><=
p class=3DMsoNormal><span lang=3DEN-CA>WARNING: QA Issue: non -staticdev pa=
ckage contains static .a library: external-linaro-toolchain-dev path '/work=
/armv7ahf-vfp-neon-oe-linux-gnueabi/external-linaro-toolchain-2013.03-r2-ar=
ago3/packages-split/external-linaro-toolchain-dev/lib/libgomp.a'<o:p></o:p>=
</span></p><p class=3DMsoNormal><span lang=3DEN-CA>WARNING: QA Issue: non -=
staticdev package contains static .a library: external-linaro-toolchain-dev=
 path '/work/armv7ahf-vfp-neon-oe-linux-gnueabi/external-linaro-toolchain-2=
013.03-r2-arago3/packages-split/external-linaro-toolchain-dev/lib/libitm.a'=
<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-CA>WARNING: QA I=
ssue: non -staticdev package contains static .a library: external-linaro-to=
olchain-dev path '/work/armv7ahf-vfp-neon-oe-linux-gnueabi/external-linaro-=
toolchain-2013.03-r2-arago3/packages-split/external-linaro-toolchain-dev/li=
b/libmudflap.a'<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-C=
A>WARNING: QA Issue: non -staticdev package contains static .a library: ext=
ernal-linaro-toolchain-dev path '/work/armv7ahf-vfp-neon-oe-linux-gnueabi/e=
xternal-linaro-toolchain-2013.03-r2-arago3/packages-split/external-linaro-t=
oolchain-dev/lib/libssp.a'<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-CA>WARNING: QA Issue: non -staticdev package contains static .a l=
ibrary: external-linaro-toolchain-dev path '/work/armv7ahf-vfp-neon-oe-linu=
x-gnueabi/external-linaro-toolchain-2013.03-r2-arago3/packages-split/extern=
al-linaro-toolchain-dev/usr/lib/libutil.a'<o:p></o:p></span></p><p class=3D=
MsoNormal><span lang=3DEN-CA>WARNING: QA Issue: non -staticdev package cont=
ains static .a library: external-linaro-toolchain-dev path '/work/armv7ahf-=
vfp-neon-oe-linux-gnueabi/external-linaro-toolchain-2013.03-r2-arago3/packa=
ges-split/external-linaro-toolchain-dev/usr/lib/libg.a'<o:p></o:p></span></=
p><p class=3DMsoNormal><span lang=3DEN-CA>WARNING: QA Issue: non -staticdev=
 package contains static .a library: external-linaro-toolchain-dev path '/w=
ork/armv7ahf-vfp-neon-oe-linux-gnueabi/external-linaro-toolchain-2013.03-r2=
-arago3/packages-split/external-linaro-toolchain-dev/usr/lib/librpcsvc.a'<o=
:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-CA>WARNING: QA Iss=
ue: non -staticdev package contains static .a library: external-linaro-tool=
chain-dev path '/work/armv7ahf-vfp-neon-oe-linux-gnueabi/external-linaro-to=
olchain-2013.03-r2-arago3/packages-split/external-linaro-toolchain-dev/usr/=
lib/libc.a'<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-CA>WA=
RNING: QA Issue: non -staticdev package contains static .a library: externa=
l-linaro-toolchain-dev path '/work/armv7ahf-vfp-neon-oe-linux-gnueabi/exter=
nal-linaro-toolchain-2013.03-r2-arago3/packages-split/external-linaro-toolc=
hain-dev/usr/lib/libmcheck.a'<o:p></o:p></span></p><p class=3DMsoNormal><sp=
an lang=3DEN-CA>WARNING: QA Issue: non -staticdev package contains static .=
a library: external-linaro-toolchain-dev path '/work/armv7ahf-vfp-neon-oe-l=
inux-gnueabi/external-linaro-toolchain-2013.03-r2-arago3/packages-split/ext=
ernal-linaro-toolchain-dev/usr/lib/libnsl.a'<o:p></o:p></span></p><p class=
=3DMsoNormal><span lang=3DEN-CA>WARNING: QA Issue: non -staticdev package c=
ontains static .a library: external-linaro-toolchain-dev path '/work/armv7a=
hf-vfp-neon-oe-linux-gnueabi/external-linaro-toolchain-2013.03-r2-arago3/pa=
ckages-split/external-linaro-toolchain-dev/usr/lib/librt.a'<o:p></o:p></spa=
n></p><p class=3DMsoNormal><span lang=3DEN-CA>WARNING: QA Issue: non -stati=
cdev package contains static .a library: external-linaro-toolchain-dev path=
 '/work/armv7ahf-vfp-neon-oe-linux-gnueabi/external-linaro-toolchain-2013.0=
3-r2-arago3/packages-split/external-linaro-toolchain-dev/usr/lib/libm.a'<o:=
p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-CA>WARNING: QA Issu=
e: non -staticdev package contains static .a library: external-linaro-toolc=
hain-dev path '/work/armv7ahf-vfp-neon-oe-linux-gnueabi/external-linaro-too=
lchain-2013.03-r2-arago3/packages-split/external-linaro-toolchain-dev/usr/l=
ib/libBrokenLocale.a'<o:p></o:p></span></p><p class=3DMsoNormal><span lang=
=3DEN-CA>WARNING: QA Issue: non -staticdev package contains static .a libra=
ry: external-linaro-toolchain-dev path '/work/armv7ahf-vfp-neon-oe-linux-gn=
ueabi/external-linaro-toolchain-2013.03-r2-arago3/packages-split/external-l=
inaro-toolchain-dev/usr/lib/libpthread.a'<o:p></o:p></span></p><p class=3DM=
soNormal><span lang=3DEN-CA>WARNING: QA Issue: non -staticdev package conta=
ins static .a library: external-linaro-toolchain-dev path '/work/armv7ahf-v=
fp-neon-oe-linux-gnueabi/external-linaro-toolchain-2013.03-r2-arago3/packag=
es-split/external-linaro-toolchain-dev/usr/lib/libresolv.a'<o:p></o:p></spa=
n></p><p class=3DMsoNormal><span lang=3DEN-CA>WARNING: QA Issue: non -stati=
cdev package contains static .a library: external-linaro-toolchain-dev path=
 '/work/armv7ahf-vfp-neon-oe-linux-gnueabi/external-linaro-toolchain-2013.0=
3-r2-arago3/packages-split/external-linaro-toolchain-dev/usr/lib/libbsd-com=
pat.a'<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-CA>WARNING=
: QA Issue: non -staticdev package contains static .a library: external-lin=
aro-toolchain-dev path '/work/armv7ahf-vfp-neon-oe-linux-gnueabi/external-l=
inaro-toolchain-2013.03-r2-arago3/packages-split/external-linaro-toolchain-=
dev/usr/lib/libcrypt.a'<o:p></o:p></span></p><p class=3DMsoNormal><span lan=
g=3DEN-CA>WARNING: QA Issue: non -staticdev package contains static .a libr=
ary: external-linaro-toolchain-dev path '/work/armv7ahf-vfp-neon-oe-linux-g=
nueabi/external-linaro-toolchain-2013.03-r2-arago3/packages-split/external-=
linaro-toolchain-dev/usr/lib/libieee.a'<o:p></o:p></span></p><p class=3DMso=
Normal><span lang=3DEN-CA>WARNING: QA Issue: non -staticdev package contain=
s static .a library: external-linaro-toolchain-dev path '/work/armv7ahf-vfp=
-neon-oe-linux-gnueabi/external-linaro-toolchain-2013.03-r2-arago3/packages=
-split/external-linaro-toolchain-dev/usr/lib/libanl.a'<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-CA>WARNING: QA Issue: non -staticdev =
package contains static .a library: external-linaro-toolchain-dev path '/wo=
rk/armv7ahf-vfp-neon-oe-linux-gnueabi/external-linaro-toolchain-2013.03-r2-=
arago3/packages-split/external-linaro-toolchain-dev/usr/lib/libdl.a'<o:p></=
o:p></span></p><p class=3DMsoNormal><span lang=3DEN-CA>WARNING: QA Issue: N=
o GNU_HASH in the elf binary: '/home/ygodin/devel/sc-mcsdk/oe-layersetup-mc=
sdk/build/arago-tmp-external-linaro-toolchain/work/armv7ahf-vfp-neon-oe-lin=
ux-gnueabi/zip-3.0-r1/packages-split/zip/usr/bin/zip'<o:p></o:p></span></p>=
<p class=3DMsoNormal><span lang=3DEN-CA>WARNING: QA Issue: No GNU_HASH in t=
he elf binary: '/home/ygodin/devel/sc-mcsdk/oe-layersetup-mcsdk/build/arago=
-tmp-external-linaro-toolchain/work/armv7ahf-vfp-neon-oe-linux-gnueabi/zip-=
3.0-r1/packages-split/zip/usr/bin/zipsplit'<o:p></o:p></span></p><p class=
=3DMsoNormal><span lang=3DEN-CA>WARNING: QA Issue: No GNU_HASH in the elf b=
inary: '/home/ygodin/devel/sc-mcsdk/oe-layersetup-mcsdk/build/arago-tmp-ext=
ernal-linaro-toolchain/work/armv7ahf-vfp-neon-oe-linux-gnueabi/zip-3.0-r1/p=
ackages-split/zip/usr/bin/zipcloak'<o:p></o:p></span></p><p class=3DMsoNorm=
al><span lang=3DEN-CA>WARNING: QA Issue: No GNU_HASH in the elf binary: '/h=
ome/ygodin/devel/sc-mcsdk/oe-layersetup-mcsdk/build/arago-tmp-external-lina=
ro-toolchain/work/armv7ahf-vfp-neon-oe-linux-gnueabi/zip-3.0-r1/packages-sp=
lit/zip/usr/bin/zipnote'<o:p></o:p></span></p><p class=3DMsoNormal><span la=
ng=3DEN-CA>WARNING: QA Issue: No GNU_HASH in the elf binary: '/home/ygodin/=
devel/sc-mcsdk/oe-layersetup-mcsdk/build/arago-tmp-external-linaro-toolchai=
n/work/armv7ahf-vfp-neon-oe-linux-gnueabi/gdbm-1.8.3-r4/packages-split/gdbm=
/usr/lib/libgdbm.so.3.0.0'<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-CA>WARNING: The recipe is trying to install files into a shared a=
rea when those files already exist. Those files are:<o:p></o:p></span></p><=
p class=3DMsoNormal><span lang=3DEN-CA>&nbsp;&nbsp; /home/ygodin/devel/sc-m=
csdk/oe-layersetup-mcsdk/build/arago-tmp-external-linaro-toolchain/sysroots=
/tci6614-evm/lib/libattr.so.1.1.0<o:p></o:p></span></p><p class=3DMsoNormal=
><span lang=3DEN-CA>&nbsp;&nbsp; /home/ygodin/devel/sc-mcsdk/oe-layersetup-=
mcsdk/build/arago-tmp-external-linaro-toolchain/sysroots/tci6614-evm/lib/li=
battr.so.1<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-CA>WAR=
NING: The recipe is trying to install files into a shared area when those f=
iles already exist. Those files are:<o:p></o:p></span></p><p class=3DMsoNor=
mal><span lang=3DEN-CA>&nbsp;&nbsp; /home/ygodin/devel/sc-mcsdk/oe-layerset=
up-mcsdk/build/arago-tmp-external-linaro-toolchain/sysroots/tci6614-evm/lib=
/libacl.so.1.1.0<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-=
CA>&nbsp;&nbsp; /home/ygodin/devel/sc-mcsdk/oe-layersetup-mcsdk/build/arago=
-tmp-external-linaro-toolchain/sysroots/tci6614-evm/lib/libacl.so.1<o:p></o=
:p></span></p><p class=3DMsoNormal><span lang=3DEN-CA>WARNING: ti-cuia: No =
generic license file exists for: TI in any provider<o:p></o:p></span></p><p=
 class=3DMsoNormal><span lang=3DEN-CA>WARNING: QA Issue: ti-cuia: Files/dir=
ectories were installed but not shipped<o:p></o:p></span></p><p class=3DMso=
Normal><span lang=3DEN-CA>&nbsp; /usr/lib/gnu.targets.codesourcery.rtsv5T.a=
470MV<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-CA>&nbsp; /=
usr/lib/boot.am3g<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN=
-CA>&nbsp; /usr/lib/syscalls.am3g<o:p></o:p></span></p><p class=3DMsoNormal=
><span lang=3DEN-CA>&nbsp; /usr/lib/syscalls.am4g<o:p></o:p></span></p><p c=
lass=3DMsoNormal><span lang=3DEN-CA>&nbsp; /usr/lib/gnu.targets.arm.rtsv7M.=
am4g<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-CA>&nbsp; /u=
sr/lib/boot.am4g<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-=
CA>&nbsp; /usr/lib/gnu.targets.arm.rtsv6.av6<o:p></o:p></span></p><p class=
=3DMsoNormal><span lang=3DEN-CA>&nbsp; /usr/lib/boot.am4fg<o:p></o:p></span=
></p><p class=3DMsoNormal><span lang=3DEN-CA>&nbsp; /usr/lib/gnu.targets.ar=
m.rtsv5T.av5T<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-CA>=
&nbsp; /usr/lib/syscalls.am4fg<o:p></o:p></span></p><p class=3DMsoNormal><s=
pan lang=3DEN-CA>&nbsp; /usr/lib/gnu.targets.arm.rtsv7M.am3g<o:p></o:p></sp=
an></p><p class=3DMsoNormal><span lang=3DEN-CA>&nbsp; /usr/lib/gnu.targets.=
arm.rtsv7A.av7A<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-C=
A>&nbsp; /usr/lib/gnu.targets.codesourcery.rtsv6.av6<o:p></o:p></span></p><=
p class=3DMsoNormal><span lang=3DEN-CA>&nbsp; /usr/lib/gnu.targets.arm.rtsv=
7M.am4fg<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-CA>WARNI=
NG: Failed to fetch URL http://www.remlab.net/files/ndisc6/ndisc6-0.6.7.tar=
.bz2, attempting MIRRORS if available<o:p></o:p></span></p><p class=3DMsoNo=
rmal><span lang=3DEN-CA>WARNING: Failed to fetch URL ftp://ftp.uni-erlangen=
.de/pub/Linux/LOCAL/dosfstools/dosfstools-2.11.src.tar.gz, attempting MIRRO=
RS if available<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-C=
A>WARNING: Failed to fetch URL http://www.angstrom-distribution.org/unstabl=
e/sources/tinylogin-1.4.tar.bz2, attempting MIRRORS if available<o:p></o:p>=
</span></p><p class=3DMsoNormal><span lang=3DEN-CA>WARNING: ti-transportnet=
lib-ipsecmgr: No generic license file exists for: TI in any provider<o:p></=
o:p></span></p><p class=3DMsoNormal><span lang=3DEN-CA>WARNING: ti-udma: No=
 generic license file exists for: TI in any provider<o:p></o:p></span></p><=
p class=3DMsoNormal><span lang=3DEN-CA>WARNING: ti-trace-framework: No gene=
ric license file exists for: TI in any provider<o:p></o:p></span></p><p cla=
ss=3DMsoNormal><span lang=3DEN-CA>WARNING: QA Issue: udev: /lib/libgudev-1.=
0.so.0.0.1, installed in the base_prefix, requires a shared library under e=
xec_prefix (/usr): libgobject-2.0.so.0 =3D&gt; /usr/lib/libgobject-2.0.so.0=
 (0xdead2000)<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-CA>=
WARNING: QA Issue: udev: /lib/libgudev-1.0.so.0.0.1, installed in the base_=
prefix, requires a shared library under exec_prefix (/usr): libgthread-2.0.=
so.0 =3D&gt; /usr/lib/libgthread-2.0.so.0 (0xdead3000)<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-CA>WARNING: QA Issue: udev: /lib/libg=
udev-1.0.so.0.0.1, installed in the base_prefix, requires a shared library =
under exec_prefix (/usr): libffi.so.6 =3D&gt; /usr/lib/libffi.so.6 (0xdead4=
000)<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-CA>WARNING: =
QA Issue: udev: /lib/libgudev-1.0.so.0.0.1, installed in the base_prefix, r=
equires a shared library under exec_prefix (/usr): libglib-2.0.so.0 =3D&gt;=
 /usr/lib/libglib-2.0.so.0 (0xdead5000)<o:p></o:p></span></p><p class=3DMso=
Normal><span lang=3DEN-CA>WARNING: QA Issue: udev: /lib/udev/udev-acl, inst=
alled in the base_prefix, requires a shared library under exec_prefix (/usr=
): libglib-2.0.so.0 =3D&gt; /usr/lib/libglib-2.0.so.0 (0xdead2000)<o:p></o:=
p></span></p><p class=3DMsoNormal><span lang=3DEN-CA>ERROR: Function failed=
: do_install (see /home/ygodin/devel/sc-mcsdk/oe-layersetup-mcsdk/build/ara=
go-tmp-external-linaro-toolchain/work/armv7ahf-vfp-neon-oe-linux-gnueabi/ll=
dpd-0.5.7-r1/temp/log.do_install.31494 for further information)<o:p></o:p><=
/span></p><p class=3DMsoNormal><span lang=3DEN-CA>ERROR: Logfile of failure=
 stored in: /home/ygodin/devel/sc-mcsdk/oe-layersetup-mcsdk/build/arago-tmp=
-external-linaro-toolchain/work/armv7ahf-vfp-neon-oe-linux-gnueabi/lldpd-0.=
5.7-r1/temp/log.do_install.31494<o:p></o:p></span></p><p class=3DMsoNormal>=
<span lang=3DEN-CA>Log data follows:<o:p></o:p></span></p><p class=3DMsoNor=
mal><span lang=3DEN-CA>| DEBUG: SITE files ['endian-little', 'bit-32', 'arm=
-common', 'common-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi',=
 'common']<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-CA>| D=
EBUG: Executing shell function do_install<o:p></o:p></span></p><p class=3DM=
soNormal><span lang=3DEN-CA>| NOTE: make -j 8 install<o:p></o:p></span></p>=
<p class=3DMsoNormal><span lang=3DEN-CA>| Making install in src<o:p></o:p><=
/span></p><p class=3DMsoNormal><span lang=3DEN-CA>| make[1]: Entering direc=
tory `/home/ygodin/devel/sc-mcsdk/oe-layersetup-mcsdk/build/arago-tmp-exter=
nal-linaro-toolchain/work/armv7ahf-vfp-neon-oe-linux-gnueabi/lldpd-0.5.7-r1=
/lldpd-0.5.7/src'<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN=
-CA>| make[2]: Entering directory `/home/ygodin/devel/sc-mcsdk/oe-layersetu=
p-mcsdk/build/arago-tmp-external-linaro-toolchain/work/armv7ahf-vfp-neon-oe=
-linux-gnueabi/lldpd-0.5.7-r1/lldpd-0.5.7/src'<o:p></o:p></span></p><p clas=
s=3DMsoNormal><span lang=3DEN-CA>| make[2]: Nothing to be done for `install=
-data-am'.<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-CA>| t=
est -z &quot;/usr/sbin&quot; || /bin/mkdir -p &quot;/usr/sbin&quot;<o:p></o=
:p></span></p><p class=3DMsoNormal><span lang=3DEN-CA>|&nbsp;&nbsp; /bin/ba=
sh ../libtool&nbsp;&nbsp; --mode=3Dinstall /usr/bin/install -c lldpd lldpct=
l '/usr/sbin'<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-CA>=
| libtool: install: /usr/bin/install -c lldpd /usr/sbin/lldpd<o:p></o:p></s=
pan></p><p class=3DMsoNormal><span lang=3DEN-CA>| /usr/bin/install: cannot =
create regular file `/usr/sbin/lldpd': Permission denied<o:p></o:p></span><=
/p><p class=3DMsoNormal><span lang=3DEN-CA>| make[2]: *** [install-sbinPROG=
RAMS] Error 1<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-CA>=
| make[2]: Leaving directory `/home/ygodin/devel/sc-mcsdk/oe-layersetup-mcs=
dk/build/arago-tmp-external-linaro-toolchain/work/armv7ahf-vfp-neon-oe-linu=
x-gnueabi/lldpd-0.5.7-r1/lldpd-0.5.7/src'<o:p></o:p></span></p><p class=3DM=
soNormal><span lang=3DEN-CA>| make[1]: *** [install-am] Error 2<o:p></o:p><=
/span></p><p class=3DMsoNormal><span lang=3DEN-CA>| make[1]: Leaving direct=
ory `/home/ygodin/devel/sc-mcsdk/oe-layersetup-mcsdk/build/arago-tmp-extern=
al-linaro-toolchain/work/armv7ahf-vfp-neon-oe-linux-gnueabi/lldpd-0.5.7-r1/=
lldpd-0.5.7/src'<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-=
CA>| make: *** [install-recursive] Error 1<o:p></o:p></span></p><p class=3D=
MsoNormal><span lang=3DEN-CA>| ERROR: oe_runmake failed<o:p></o:p></span></=
p><p class=3DMsoNormal><span lang=3DEN-CA>| ERROR: Function failed: do_inst=
all (see /home/ygodin/devel/sc-mcsdk/oe-layersetup-mcsdk/build/arago-tmp-ex=
ternal-linaro-toolchain/work/armv7ahf-vfp-neon-oe-linux-gnueabi/lldpd-0.5.7=
-r1/temp/log.do_install.31494 for further information)<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-CA>ERROR: Task 1739 (/home/ygodin/dev=
el/sc-mcsdk/oe-layersetup-mcsdk/sources/meta-arago/meta-arago-extras/recipe=
s-bsp/lldpd/lldpd_0.5.7.bb, do_install) failed with exit code '1'<o:p></o:p=
></span></p><p class=3DMsoNormal><span lang=3DEN-CA>NOTE: Tasks Summary: At=
tempted 1772 tasks of which 179 didn't need to be rerun and 1 failed.<o:p><=
/o:p></span></p><p class=3DMsoNormal><span lang=3DEN-CA>Waiting for 0 runni=
ng tasks to finish:<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3D=
EN-CA><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span lang=3DEN-CA>S=
ummary: 1 task failed:<o:p></o:p></span></p><p class=3DMsoNormal><span lang=
=3DEN-CA>&nbsp; /home/ygodin/devel/sc-mcsdk/oe-layersetup-mcsdk/sources/met=
a-arago/meta-arago-extras/recipes-bsp/lldpd/lldpd_0.5.7.bb, do_install<o:p>=
</o:p></span></p><p class=3DMsoNormal><span lang=3DEN-CA>Summary: There wer=
e 53 WARNING messages shown.<o:p></o:p></span></p><p class=3DMsoNormal><spa=
n lang=3DEN-CA>Summary: There was 1 ERROR message shown, returning a non-ze=
ro exit code.<o:p></o:p></span></p></div><br><html>=0D
<body>=0D
<style type=3D"text/css">=0D
=0D
html, body, div, span, applet, object, iframe,=0D
h1, h2, h3, h4, h5, h6, p, blockquote, pre,=0D
a, abbr, acronym, address, big, cite, code,=0D
del, dfn, em, font, img, ins, kbd, q, s, samp,=0D
small, strike, strong, sub, sup, tt, var,=0D
b, u, i, center,=0D
dl, dt, dd, ol, ul, li,=0D
fieldset, form, label, legend,=0D
table, caption, tbody, tfoot, thead, tr, th, td {=0D
	margin: 0;=0D
	padding: 0;=0D
	border: 0;=0D
	outline: 0;=0D
	font-size: 100%;=0D
	background: transparent;=0D
}=0D
body {=0D
	line-height: 1;=0D
}=0D
ol, ul {=0D
	list-style: none;=0D
}=0D
blockquote, q {=0D
	quotes: none;=0D
}=0D
blockquote:before, blockquote:after,=0D
q:before, q:after {=0D
	content: '';=0D
	content: none;=0D
}=0D
=0D
/* remember to define focus styles! */=0D
:focus {=0D
	outline: 0;=0D
}=0D
=0D
/* remember to highlight inserts somehow! */=0D
ins {=0D
	text-decoration: none;=0D
}=0D
del {=0D
	text-decoration: line-through;=0D
}=0D
=0D
/* tables still need 'cellspacing=3D"0"' in the markup */=0D
table {=0D
	border-collapse: collapse;=0D
	border-spacing: 0;=0D
}=0D
=0D
body p {=0D
	font-family: Calibri, Candara, Segoe, "Segoe UI", Optima, Arial, sans-seri=
f;=0D
	color: #808080;=0D
	font-size: 11px;=0D
	line-height: 18px;=0D
	margin-top: 14px;=0D
	margin-bottom: 14px;=0D
}=0D
=0D
body p a {=0D
	text-decoration: none!important;=0D
}=0D
=0D
</style>=0D
=0D
<p style=3D"font-family: Arial, Helvetica, sans-serif; margin-bottom:14px; =
margin-top:14px;"><br />=0D
AVERTISSEMENT CONCERNANT LA CONFIDENTIALIT?<br />=0D
Ce message est strictement r?serv? ? l'usage de l'individu ou de l'entit? ?=
 qui il est adress? et peut contenir de l'information privil?gi?e et confid=
entielle. Toute divulgation, distribution ou copie de ce message est strict=
ement prohib?e. Si vous avez re?u ce document par erreur, veuillez s'il vou=
s pla?t nous t?l?phoner imm?diatement et nous le retourner par courrier ? n=
os frais.<br />=0D
<br />=0D
CONFIDENTIALITY<br />=0D
This present document is strictly reserved to the use of the person to whom=
 it is addressed. This information can be privilege or confidential. Any di=
sclosure, distribution or reproduction is prohibited. If you received this =
communication by mistake, please contact us.<br />=0D
</p>=0D
</body>=0D
</html>=0D

&nbsp;&nbsp;&shy;&shy;&nbsp;&nbsp;</body></html>=

------_=_NextPart_001_01CF1B82.9DEE61B9--
