Return-Path: <daniel.lehne@amk-drives.bg>
Received: from mx1.amk-drives.bg (mail1.amk-drives.bg [62.176.121.7])
	by arago-project.org (Postfix) with ESMTPS id 03A3D52B90
	for <meta-arago@arago-project.org>;
	Tue, 28 Sep 2021 08:59:07 +0000 (UTC)
Received: from mx1.amk-drives.bg (localhost [127.0.0.1])
	by mx1.amk-drives.bg (Postfix) with ESMTP id A10DB1B9AF
	for <meta-arago@arago-project.org>;
	Tue, 28 Sep 2021 11:59:44 +0300 (EEST)
Authentication-Results: mx1.amk-drives.bg (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)" header.d=amk-drives.bg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=amk-drives.bg; h=
	content-language:x-mailer:content-type:content-type:mime-version
	:message-id:date:date:subject:subject:to:from:from; s=dkim; t=
	1632819531; x=1635411532; bh=xiuZnxHFLr2KWpaE/hqxxyF/VpKbgTubKvc
	eBQntDf4=; b=qGgbPD5tG5POxAE1pal4+y32GWs+tW+c01OJYaWxCiu28FYg69P
	Zmx+tgb51CnDCpPl44P1LF265WPpQra8qx47NdMQvt/dR3ZMYsMadCeEvK5hxu6H
	ngDYtKp3UYfucdSg7VhXSZUv8ncXvQ7oWRRJWDb88kcYky/dTSIbaDXc=
X-Virus-Scanned: amavisd-new at mx1.amk-drives.bg
Received: from mx1.amk-drives.bg ([127.0.0.1])
	by mx1.amk-drives.bg (mx1.amk-drives.bg [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id rwhPflonzbno for <meta-arago@arago-project.org>;
	Tue, 28 Sep 2021 11:58:51 +0300 (EEST)
Received: from 1032N (unknown [192.168.0.32])
	by mx1.amk-drives.bg (Postfix) with ESMTPSA id 41EFD13D08
	for <meta-arago@arago-project.org>;
	Tue, 28 Sep 2021 11:58:49 +0300 (EEST)
From: <daniel.lehne@amk-drives.bg>
To: <meta-arago@arago-project.org>
Date: Tue, 28 Sep 2021 11:58:48 +0300
Message-ID: <009401d7b447$0e119530$2a34bf90$@amk-drives.bg>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: Ade0RiomgBkdNcOxTSyCAqRpR3wbqg==
X-Mailman-Approved-At: Wed, 06 Oct 2021 22:56:54 +0000
Subject: Patch external-arm-toolchain on meta-arago-extras fails with gcc-arm-9.2-2019.12-x86_64-arm-none-linux-gnueabihf
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
X-List-Received-Date: Tue, 28 Sep 2021 08:59:08 -0000
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0095_01D7B460.33620180"
Content-Language: en-us

------=_NextPart_000_0095_01D7B460.33620180
Content-Type: text/plain;
	charset="koi8-r"
Content-Transfer-Encoding: quoted-printable

Hello,=20

=20

first, thanks for your great support on meta-arago layer and further
enthusiastic developing.

=20

I'm trying to build a project with an external toolchain but failing on =
the
recipe
/meta-arm/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/exte=
rna
l-arm-toolchain.bb:do_install. I'm building in a docker container, with
reduced layers using the ./oe-layertool-setup.sh command with following =
test
config file. I've tried first
gcc-arm-10.3-2021.07-x86_64-arm-none-linux-gnueabihf but it fails also, =
so I
downgraded to gcc-arm-9.2-2019.12-x86_64-arm-none-linux-gnueabihf =
without
success.

=20

I removed the external-arm-toolchain.bb=C1ppend from meta-arago-extra, =
which
solves the problem, but isn't a solution.

=20

This patch may be related to the problem, but I couldn't figure it out, =
how.

https://git.ti.com/cgit/arago-project/meta-arago/commit/meta-arago-extras=
/re
cipes-core/meta/external-arm-toolchain.bbappend?h=3Ddunfell
<https://git.ti.com/cgit/arago-project/meta-arago/commit/meta-arago-extra=
s/r
ecipes-core/meta/external-arm-toolchain.bbappend?h=3Ddunfell&id=3De23dd59=
68c7c8f
096a3bcdbf51effd6c0d5be77d> =
&id=3De23dd5968c7c8f096a3bcdbf51effd6c0d5be77d

=20

The result of building is following:

=20

amk@db5f2ff243cd:/app/build$ MACHINE=3Dam57xx-evm bitbake
external-arm-toolchain

NOTE: Started PRServer with DBfile: /app/build/cache/prserv.sqlite3, IP:
127.0.0.1, PORT: 39041, PID: 368020

Loading cache: 100%
|########################################################################=
###
#########################################################################=
###
##################################################| Time: 0:00:00

Loaded 3971 entries from dependency cache.

WARNING: No recipes available for:

=20
/app/sources/meta-arago/meta-arago-distro/recipes-containers/docker/docke=
r%.
bbappend

NOTE: Resolving any missing task queue dependencies

=20

Build Configuration:

BB_VERSION           =3D "1.46.0"

BUILD_SYS            =3D "x86_64-linux"

NATIVELSBSTRING      =3D "ubuntu-18.04"

TARGET_SYS           =3D "arm-linux-gnueabi"

MACHINE              =3D "am57xx-evm"

DISTRO               =3D "arago"

DISTRO_VERSION       =3D "2020.09"

TUNE_FEATURES        =3D "arm armv7a vfp thumb neon callconvention-hard"

TARGET_FPU           =3D "hard"

meta-arago-distro

meta-arago-extras    =3D =
"dunfell:ccb42fd29643f2c456a0d98633939a77bc11df6b"

meta-qt5             =3D =
"dunfell:b4d24d70aca75791902df5cd59a4f4a54aa4a125"

meta-networking

meta-python

meta-oe

meta-gnome

meta-filesystems     =3D =
"dunfell:2e7e98cd0cb82db214b13224c71134b9335a719b"

meta-ti              =3D =
"dunfell:b2c515a5abd5a2270c54c0e0fec441c7c456c75f"

meta-arm

meta-arm-toolchain   =3D =
"dunfell:ce535dfb96de4d2529f091d7d85a7172c626001c"

meta                 =3D =
"dunfell:c7d2281eb6cda9c1637c20b3540b142073bca235"

=20

Initialising tasks: 100%
|########################################################################=
###
#########################################################################=
###
#############################################| Time: 0:00:00

Sstate summary: Wanted 11 Found 0 Missed 11 Current 41 (0% match, 78%
complete)

NOTE: Executing Tasks

ERROR: external-arm-toolchain-2019.12-r0 do_install: Execution of
'/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnuea=
bi/
external-arm-toolchain/2019.12-r0/temp/run.do_install.373811' failed =
with
exit code 1:

/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueab=
i/e
xternal-arm-toolchain/2019.12-r0/image/lib/libanl.so.1 is a symlink of
/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueab=
i/e
xternal-arm-toolchain/2019.12-r0/image/lib/libanl-2.30.so, keep it

/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueab=
i/e
xternal-arm-toolchain/2019.12-r0/image/lib/libBrokenLocale.so.1 is a =
symlink
of
/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueab=
i/e
xternal-arm-toolchain/2019.12-r0/image/lib/libBrokenLocale-2.30.so, keep =
it

/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueab=
i/e
xternal-arm-toolchain/2019.12-r0/image/lib/libc.so.6 is a symlink of
/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueab=
i/e
xternal-arm-toolchain/2019.12-r0/image/lib/libc-2.30.so, keep it

/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueab=
i/e
xternal-arm-toolchain/2019.12-r0/image/lib/libcrypt.so.1 is a symlink of
/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueab=
i/e
xternal-arm-toolchain/2019.12-r0/image/lib/libcrypt-2.30.so, keep it

/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueab=
i/e
xternal-arm-toolchain/2019.12-r0/image/lib/libdl.so.2 is a symlink of
/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueab=
i/e
xternal-arm-toolchain/2019.12-r0/image/lib/libdl-2.30.so, keep it

/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueab=
i/e
xternal-arm-toolchain/2019.12-r0/image/lib/libm.so.6 is a symlink of
/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueab=
i/e
xternal-arm-toolchain/2019.12-r0/image/lib/libm-2.30.so, keep it

/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueab=
i/e
xternal-arm-toolchain/2019.12-r0/image/lib/libnsl.so.1 is a symlink of
/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueab=
i/e
xternal-arm-toolchain/2019.12-r0/image/lib/libnsl-2.30.so, keep it

/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueab=
i/e
xternal-arm-toolchain/2019.12-r0/image/lib/libnss_compat.so.2 is a =
symlink
of
/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueab=
i/e
xternal-arm-toolchain/2019.12-r0/image/lib/libnss_compat-2.30.so, keep =
it

/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueab=
i/e
xternal-arm-toolchain/2019.12-r0/image/lib/libnss_db.so.2 is a symlink =
of
/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueab=
i/e
xternal-arm-toolchain/2019.12-r0/image/lib/libnss_db-2.30.so, keep it

/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueab=
i/e
xternal-arm-toolchain/2019.12-r0/image/lib/libnss_dns.so.2 is a symlink =
of
/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueab=
i/e
xternal-arm-toolchain/2019.12-r0/image/lib/libnss_dns-2.30.so, keep it

/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueab=
i/e
xternal-arm-toolchain/2019.12-r0/image/lib/libnss_files.so.2 is a =
symlink of
/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueab=
i/e
xternal-arm-toolchain/2019.12-r0/image/lib/libnss_files-2.30.so, keep it

/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueab=
i/e
xternal-arm-toolchain/2019.12-r0/image/lib/libnss_hesiod.so.2 is a =
symlink
of
/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueab=
i/e
xternal-arm-toolchain/2019.12-r0/image/lib/libnss_hesiod-2.30.so, keep =
it

/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueab=
i/e
xternal-arm-toolchain/2019.12-r0/image/lib/libpthread.so.0 is a symlink =
of
/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueab=
i/e
xternal-arm-toolchain/2019.12-r0/image/lib/libpthread-2.30.so, keep it

/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueab=
i/e
xternal-arm-toolchain/2019.12-r0/image/lib/libresolv.so.2 is a symlink =
of
/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueab=
i/e
xternal-arm-toolchain/2019.12-r0/image/lib/libresolv-2.30.so, keep it

/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueab=
i/e
xternal-arm-toolchain/2019.12-r0/image/lib/librt.so.1 is a symlink of
/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueab=
i/e
xternal-arm-toolchain/2019.12-r0/image/lib/librt-2.30.so, keep it

/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueab=
i/e
xternal-arm-toolchain/2019.12-r0/image/lib/libutil.so.1 is a symlink of
/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueab=
i/e
xternal-arm-toolchain/2019.12-r0/image/lib/libutil-2.30.so, keep it

rmdir: failed to remove
'/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnuea=
bi/
external-arm-toolchain/2019.12-r0/image/usr/bin': Directory not empty

rmdir: failed to remove
'/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnuea=
bi/
external-arm-toolchain/2019.12-r0/image/usr/sbin': Directory not empty

rmdir: failed to remove
'/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnuea=
bi/
external-arm-toolchain/2019.12-r0/image/sbin': Directory not empty

  WRAP    arch/arm/include/generated/uapi/asm/bitsperlong.h

:

|   HDRINST usr/include/asm/bitsperlong.h

|   INSTALL
/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueab=
i/e
xternal-arm-toolchain/2019.12-r0/external-arm-toolchain-2019.12/usr/inclu=
de

| mv: cannot stat
'/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnuea=
bi/
external-arm-toolchain/2019.12-r0/image/usr/lib/gcc/arm-none-linux-gnueab=
ihf
': No such file or directory

| WARNING:
/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueab=
i/e
xternal-arm-toolchain/2019.12-r0/temp/run.do_install.347161:1 exit 1 =
from
'mv
/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueab=
i/e
xternal-arm-toolchain/2019.12-r0/image/usr/lib/gcc/arm-none-linux-gnueabi=
hf
/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueab=
i/e
xternal-arm-toolchain/2019.12-r0/image/usr/lib/gcc/arm-linux-gnueabi'

=20

Environment after sourcing conf/setenv:

=20

LC_ALL=3Den_US.UTF-8

LS_COLORS=3Drs=3D0:di=3D01;34:ln=3D01;36:mh=3D00:pi=3D40;33:so=3D01;35:do=
=3D01;35:bd=3D40;33;0
1:cd=3D40;33;01:or=3D40;31;01:mi=3D00:su=3D37;41:sg=3D30;43:ca=3D30;41:tw=
=3D30;42:ow=3D34;42
:st=3D37;44:ex=3D01;32:*.tar=3D01;31:*.tgz=3D01;31:*.arc=3D01;31:*.arj=3D=
01;31:*.taz=3D01;
31:*.lha=3D01;31:*.lz4=3D01;31:*.lzh=3D01;31:*.lzma=3D01;31:*.tlz=3D01;31=
:*.txz=3D01;31:
*.tzo=3D01;31:*.t7z=3D01;31:*.zip=3D01;31:*.z=3D01;31:*.Z=3D01;31:*.dz=3D=
01;31:*.gz=3D01;3
1:*.lrz=3D01;31:*.lz=3D01;31:*.lzo=3D01;31:*.xz=3D01;31:*.zst=3D01;31:*.t=
zst=3D01;31:*.b
z2=3D01;31:*.bz=3D01;31:*.tbz=3D01;31:*.tbz2=3D01;31:*.tz=3D01;31:*.deb=3D=
01;31:*.rpm=3D01
;31:*.jar=3D01;31:*.war=3D01;31:*.ear=3D01;31:*.sar=3D01;31:*.rar=3D01;31=
:*.alz=3D01;31:
*.ace=3D01;31:*.zoo=3D01;31:*.cpio=3D01;31:*.7z=3D01;31:*.rz=3D01;31:*.ca=
b=3D01;31:*.wim
=3D01;31:*.swm=3D01;31:*.dwm=3D01;31:*.esd=3D01;31:*.jpg=3D01;35:*.jpeg=3D=
01;35:*.mjpg=3D0
1;35:*.mjpeg=3D01;35:*.gif=3D01;35:*.bmp=3D01;35:*.pbm=3D01;35:*.pgm=3D01=
;35:*.ppm=3D01;
35:*.tga=3D01;35:*.xbm=3D01;35:*.xpm=3D01;35:*.tif=3D01;35:*.tiff=3D01;35=
:*.png=3D01;35:
*.svg=3D01;35:*.svgz=3D01;35:*.mng=3D01;35:*.pcx=3D01;35:*.mov=3D01;35:*.=
mpg=3D01;35:*.m
peg=3D01;35:*.m2v=3D01;35:*.mkv=3D01;35:*.webm=3D01;35:*.ogm=3D01;35:*.mp=
4=3D01;35:*.m4v
=3D01;35:*.mp4v=3D01;35:*.vob=3D01;35:*.qt=3D01;35:*.nuv=3D01;35:*.wmv=3D=
01;35:*.asf=3D01;
35:*.rm=3D01;35:*.rmvb=3D01;35:*.flc=3D01;35:*.avi=3D01;35:*.fli=3D01;35:=
*.flv=3D01;35:*
.gl=3D01;35:*.dl=3D01;35:*.xcf=3D01;35:*.xwd=3D01;35:*.yuv=3D01;35:*.cgm=3D=
01;35:*.emf=3D0
1;35:*.ogv=3D01;35:*.ogx=3D01;35:*.aac=3D00;36:*.au=3D00;36:*.flac=3D00;3=
6:*.m4a=3D00;36
:*.mid=3D00;36:*.midi=3D00;36:*.mka=3D00;36:*.mp3=3D00;36:*.mpc=3D00;36:*=
.ogg=3D00;36:*.
ra=3D00;36:*.wav=3D00;36:*.oga=3D00;36:*.opus=3D00;36:*.spx=3D00;36:*.xsp=
f=3D00;36:

LESSCLOSE=3D/usr/bin/lesspipe %s %s

OEBASE=3D/app

LANG=3Den_US.UTF-8

HOSTNAME=3Ddb5f2ff243cd

OLDPWD=3D/app

PWD=3D/app/build

HOME=3D/home/amk

BB_ENV_EXTRAWHITE=3DMACHINE DISTRO TCMODE TCLIBC http_proxy ftp_proxy
https_proxy all_proxy ALL_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK
BB_SRCREV_POLICY SDKMACHINE BB_NUMBER_THREADS PARALLEL_MAKE
GIT_PROXY_COMMAND GIT_PROXY_IGNORE SOCKS5_PASSWD SOCKS5_USER OEBASE
META_SDK_PATH TOOLCHAIN_TYPE TOOLCHAIN_BRAND TOOLCHAIN_BASE =
TOOLCHAIN_PATH
TOOLCHAIN_PATH_ARMV5 TOOLCHAIN_PATH_ARMV7 TOOLCHAIN_PATH_ARMV8
EXTRA_TISDK_FILES TISDK_VERSION ARAGO_BRAND ARAGO_RT_ENABLE
ARAGO_SYSTEST_ENABLE ARAGO_KERNEL_SUFFIX TI_SECURE_DEV_PKG_CAT
TI_SECURE_DEV_PKG_AUTO TI_SECURE_DEV_PKG_K3 ARAGO_SYSVINIT SYSFW_FILE

TOOLCHAIN_PATH_ARMV7=3D/opt/gcc-arm-9.2-2019.12-x86_64-arm-none-linux-gnu=
eabih
f

BUILDDIR=3D/app/build

TERM=3Dxterm

SHLVL=3D1

LANGUAGE=3Den_US:en

PATH=3D/app/sources/meta-rauc/scripts:/app/sources/oe-core/scripts:/app/s=
ource
s/bitbake/bin:/app/sources/meta-rauc/scripts:/app/sources/oe-core/scripts=
:/a
pp/sources/bitbake/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:=
/sb
in:/bin

TOOLCHAIN_BASE=3D/opt/gcc-arm-9.2-2019.12-x86_64-arm-none-linux-gnueabihf=


LESSOPEN=3D| /usr/bin/lesspipe %s

_=3D/usr/bin/env

=20

=20

Test config file for setup layers:

=20

amk@db5f2ff243cd:/app$ cat configs/ext-toolchain-config.txt

# This file takes repo entries in the format

# repo name,repo uri,repo branch,repo
commit[,layers=3Dlayer1:layer2...:layern]

=20

bitbake,git://git.openembedded.org/bitbake,1.46,HEAD

meta-arago,git://arago-project.org/git/meta-arago.git,dunfell,HEAD,layers=
=3Dme
ta-arago-distro:meta-arago-extras

meta-qt5,git://github.com/meta-qt5/meta-qt5.git,dunfell,HEAD,layers=3D

meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,HE=
AD,
layers=3Dmeta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems

meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,HEAD,layers=3D

meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,HEAD,layers=3Dmeta-a=
rm:me
ta-arm-toolchain

oe-core,git://git.openembedded.org/openembedded-core,dunfell,HEAD,layers=3D=
met
a

OECORELAYERCONF=3D./sample-files/bblayers.conf.sample

OECORELOCALCONF=3D./sample-files/local.conf.sample

=20

Local conf:

=20

amk@db5f2ff243cd:/app/build$ diff ../sample-files/local.conf.sample
conf/local.conf

13c13

< DL_DIR =3D "${OEBASE}/downloads"

---

> DL_DIR =3D "/app/downloads"

51c51,54

< TMPDIR =3D "${OEBASE}/build/arago-tmp"

---

> TMPDIR =3D "${TOPDIR}/arago-tmp"

>=20

> # By default, DEPLOY_DIR is inside TMPDIR, but can be changed here to =
be
outside

> #DEPLOY_DIR =3D "${TOPDIR}/deploy"

82c85

< SDKMACHINE ?=3D "i686"

---

> SDKMACHINE ?=3D "x86_64"

123c126

< #ENABLE_BINARY_LOCALE_GENERATION =3D "0"

---

> ENABLE_BINARY_LOCALE_GENERATION =3D "0"

138c141

< BB_NUMBER_THREADS =3D "1"

---

> BB_NUMBER_THREADS =3D "24"

143c146

< PARALLEL_MAKE =3D "-j 1"

---

> PARALLEL_MAKE =3D "-j 24"

148,150c151

< # Select a distribution from supported "arago", "angstrom-2010.x" or
"poky"

< # By default, go with the "distroless" configuration, when not set

< #DISTRO   =3D "arago"

---

> DISTRO   =3D "arago"

164a166,174

>=20

> # Enable local PR service for binary feeds

> PRSERV_HOST =3D "localhost:0"

>=20

> # It is recommended to activate "buildhistory" for testing the PR =
service

> INHERIT +=3D "buildhistory"

> BUILDHISTORY_COMMIT =3D "1"

>=20

>
EXTERNAL_TOOLCHAIN=3D"/opt/gcc-arm-10.3-2021.07-x86_64-arm-none-linux-gnu=
eabih
f"

=20

Building in Docker Container with following Docker File:

FROM ubuntu:18.04

=20

RUN apt-get update && \

        DEBIAN_FRONTEND=3Dnoninteractive apt-get -yq install git
build-essential python3 diffstat texinfo gawk chrpath dos2unix wget =
unzip
socat doxygen libc6-i386 libncurses5 libstdc++6 libz1 locales =
openssh-server
cpio sudo python3-distutils

=20

# set bash as default

RUN echo "dash dash/sh boolean false" | debconf-set-selections && \

        DEBIAN_FRONTEND=3Dnoninteractive dpkg-reconfigure dash

=20

# Set the locale

RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && \

    locale-gen

ENV LANG en_US.UTF-8

ENV LANGUAGE en_US:en

ENV LC_ALL en_US.UTF-8

=20

# pythone requirements

=20

RUN useradd -rm -d /home/amk -s /bin/bash -g root -G sudo -u 1001 amk

RUN chown amk:root /opt

USER amk

WORKDIR /app

=20

# Authorize SSH Host

RUN mkdir -p $HOME/.ssh && \

    chmod 0700 $HOME/.ssh && \

    ssh-keyscan gitlab.amk-drives.bg > $HOME/.ssh/known_hosts

RUN ssh-keyscan developer.arm.com > $HOME/.ssh/known_hosts

=20

#install the toolchain

RUN cd /opt && \

        wget --no-check-certificate
https://developer.arm.com/-/media/Files/downloads/gnu-a/9.2-2019.12/binre=
l/g
cc-arm-9.2-2019.12-x86_64-arm-none-linux-gnueabihf.tar.xz && \

        tar -Jxvf =
gcc-arm-9.2-2019.12-x86_64-arm-none-linux-gnueabihf.tar.xz
-C /opt/

=20

ENV
TOOLCHAIN_PATH_ARMV7=3D/opt/gcc-arm-9.2-2019.12-x86_64-arm-none-linux-gnu=
eabih
f

ENV TOOLCHAIN_BASE=3D${TOOLCHAIN_PATH_ARMV7}

=20

I will continue investigation and how to fix this, but for solutions or
hints I'm pleasant.=20

=20

Best regards !

Daniel L.

=20


------=_NextPart_000_0095_01D7B460.33620180
Content-Type: text/html;
	charset="koi8-r"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta =
http-equiv=3DContent-Type content=3D"text/html; charset=3Dkoi8-r"><meta =
name=3DGenerator content=3D"Microsoft Word 15 (filtered =
medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DEN-US =
link=3D"#0563C1" vlink=3D"#954F72" style=3D'word-wrap:break-word'><div =
class=3DWordSection1><p class=3DMsoNormal>Hello, <o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>first, =
thanks for your great support on meta-arago layer and further =
enthusiastic developing.<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>I&#8217;m =
trying to build a project with an external toolchain but failing on the =
recipe =
/meta-arm/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/exte=
rnal-arm-toolchain.bb:do_install. I&#8217;m building in a docker =
container, with reduced layers using the ./oe-layertool-setup.sh command =
with following test config file. I&#8217;ve tried first =
gcc-arm-10.3-2021.07-x86_64-arm-none-linux-gnueabihf but it fails also, =
so I downgraded to gcc-arm-9.2-2019.12-x86_64-arm-none-linux-gnueabihf =
without success.<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>I removed =
the external-arm-toolchain.bb<span lang=3DBG>=C1</span>ppend from =
meta-arago-extra, which solves the problem, but isn&#8217;t a =
solution.<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>This patch may be related to the problem, but I =
couldn&#8217;t figure it out, how.<o:p></o:p></p><p class=3DMsoNormal><a =
href=3D"https://git.ti.com/cgit/arago-project/meta-arago/commit/meta-arag=
o-extras/recipes-core/meta/external-arm-toolchain.bbappend?h=3Ddunfell&am=
p;id=3De23dd5968c7c8f096a3bcdbf51effd6c0d5be77d">https://git.ti.com/cgit/=
arago-project/meta-arago/commit/meta-arago-extras/recipes-core/meta/exter=
nal-arm-toolchain.bbappend?h=3Ddunfell&amp;id=3De23dd5968c7c8f096a3bcdbf5=
1effd6c0d5be77d</a><o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>The result =
of building is following:<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>amk@db5f2ff243cd:/app/build$ MACHINE=3Dam57xx-evm =
bitbake external-arm-toolchain<o:p></o:p></p><p class=3DMsoNormal>NOTE: =
Started PRServer with DBfile: /app/build/cache/prserv.sqlite3, IP: =
127.0.0.1, PORT: 39041, PID: 368020<o:p></o:p></p><p =
class=3DMsoNormal>Loading cache: 100% =
|########################################################################=
#########################################################################=
########################################################| Time: =
0:00:00<o:p></o:p></p><p class=3DMsoNormal>Loaded 3971 entries from =
dependency cache.<o:p></o:p></p><p class=3DMsoNormal>WARNING: No recipes =
available for:<o:p></o:p></p><p class=3DMsoNormal>=9A =
/app/sources/meta-arago/meta-arago-distro/recipes-containers/docker/docke=
r%.bbappend<o:p></o:p></p><p class=3DMsoNormal>NOTE: Resolving any =
missing task queue dependencies<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>Build =
Configuration:<o:p></o:p></p><p =
class=3DMsoNormal>BB_VERSION=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A =3D =
&quot;1.46.0&quot;<o:p></o:p></p><p =
class=3DMsoNormal>BUILD_SYS=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A =3D =
&quot;x86_64-linux&quot;<o:p></o:p></p><p =
class=3DMsoNormal>NATIVELSBSTRING=9A=9A=9A=9A=9A =3D =
&quot;ubuntu-18.04&quot;<o:p></o:p></p><p =
class=3DMsoNormal>TARGET_SYS=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A =3D =
&quot;arm-linux-gnueabi&quot;<o:p></o:p></p><p class=3DMsoNormal><span =
lang=3DDE>MACHINE=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A =3D =
&quot;am57xx-evm&quot;<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DDE>DISTRO=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A =3D =
&quot;arago&quot;<o:p></o:p></span></p><p =
class=3DMsoNormal>DISTRO_VERSION=9A=9A=9A=9A=9A=9A =3D =
&quot;2020.09&quot;<o:p></o:p></p><p =
class=3DMsoNormal>TUNE_FEATURES=9A=9A=9A=9A=9A=9A=9A =3D &quot;arm =
armv7a vfp thumb neon callconvention-hard&quot;<o:p></o:p></p><p =
class=3DMsoNormal>TARGET_FPU=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A =3D =
&quot;hard&quot;<o:p></o:p></p><p =
class=3DMsoNormal>meta-arago-distro<o:p></o:p></p><p =
class=3DMsoNormal>meta-arago-extras=9A=9A=9A =3D =
&quot;dunfell:ccb42fd29643f2c456a0d98633939a77bc11df6b&quot;<o:p></o:p></=
p><p class=3DMsoNormal>meta-qt5=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A =3D =
&quot;dunfell:b4d24d70aca75791902df5cd59a4f4a54aa4a125&quot;<o:p></o:p></=
p><p class=3DMsoNormal>meta-networking<o:p></o:p></p><p =
class=3DMsoNormal><span lang=3DDE>meta-python<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DDE>meta-oe<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DDE>meta-gnome<o:p></o:p></span></p><p =
class=3DMsoNormal>meta-filesystems=9A=9A=9A=9A =3D =
&quot;dunfell:2e7e98cd0cb82db214b13224c71134b9335a719b&quot;<o:p></o:p></=
p><p class=3DMsoNormal>meta-ti=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A =
=3D =
&quot;dunfell:b2c515a5abd5a2270c54c0e0fec441c7c456c75f&quot;<o:p></o:p></=
p><p class=3DMsoNormal>meta-arm<o:p></o:p></p><p =
class=3DMsoNormal>meta-arm-toolchain=9A=9A =3D =
&quot;dunfell:ce535dfb96de4d2529f091d7d85a7172c626001c&quot;<o:p></o:p></=
p><p =
class=3DMsoNormal>meta=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A =
=3D =
&quot;dunfell:c7d2281eb6cda9c1637c20b3540b142073bca235&quot;<o:p></o:p></=
p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>Initialising tasks: 100% =
|########################################################################=
#########################################################################=
###################################################| Time: =
0:00:00<o:p></o:p></p><p class=3DMsoNormal>Sstate summary: Wanted 11 =
Found 0 Missed 11 Current 41 (0% match, 78% complete)<o:p></o:p></p><p =
class=3DMsoNormal>NOTE: Executing Tasks<o:p></o:p></p><p =
class=3DMsoNormal>ERROR: external-arm-toolchain-2019.12-r0 do_install: =
Execution of =
'/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnuea=
bi/external-arm-toolchain/2019.12-r0/temp/run.do_install.373811' failed =
with exit code 1:<o:p></o:p></p><p =
class=3DMsoNormal>/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf=
-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/image/lib/libanl.so=
.1 is a symlink of =
/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueab=
i/external-arm-toolchain/2019.12-r0/image/lib/libanl-2.30.so, keep =
it<o:p></o:p></p><p =
class=3DMsoNormal>/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf=
-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/image/lib/libBroken=
Locale.so.1 is a symlink of =
/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueab=
i/external-arm-toolchain/2019.12-r0/image/lib/libBrokenLocale-2.30.so, =
keep it<o:p></o:p></p><p =
class=3DMsoNormal>/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf=
-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/image/lib/libc.so.6=
 is a symlink of =
/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueab=
i/external-arm-toolchain/2019.12-r0/image/lib/libc-2.30.so, keep =
it<o:p></o:p></p><p =
class=3DMsoNormal>/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf=
-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/image/lib/libcrypt.=
so.1 is a symlink of =
/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueab=
i/external-arm-toolchain/2019.12-r0/image/lib/libcrypt-2.30.so, keep =
it<o:p></o:p></p><p =
class=3DMsoNormal>/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf=
-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/image/lib/libdl.so.=
2 is a symlink of =
/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueab=
i/external-arm-toolchain/2019.12-r0/image/lib/libdl-2.30.so, keep =
it<o:p></o:p></p><p =
class=3DMsoNormal>/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf=
-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/image/lib/libm.so.6=
 is a symlink of =
/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueab=
i/external-arm-toolchain/2019.12-r0/image/lib/libm-2.30.so, keep =
it<o:p></o:p></p><p =
class=3DMsoNormal>/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf=
-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/image/lib/libnsl.so=
.1 is a symlink of =
/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueab=
i/external-arm-toolchain/2019.12-r0/image/lib/libnsl-2.30.so, keep =
it<o:p></o:p></p><p =
class=3DMsoNormal>/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf=
-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/image/lib/libnss_co=
mpat.so.2 is a symlink of =
/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueab=
i/external-arm-toolchain/2019.12-r0/image/lib/libnss_compat-2.30.so, =
keep it<o:p></o:p></p><p =
class=3DMsoNormal>/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf=
-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/image/lib/libnss_db=
.so.2 is a symlink of =
/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueab=
i/external-arm-toolchain/2019.12-r0/image/lib/libnss_db-2.30.so, keep =
it<o:p></o:p></p><p =
class=3DMsoNormal>/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf=
-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/image/lib/libnss_dn=
s.so.2 is a symlink of =
/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueab=
i/external-arm-toolchain/2019.12-r0/image/lib/libnss_dns-2.30.so, keep =
it<o:p></o:p></p><p =
class=3DMsoNormal>/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf=
-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/image/lib/libnss_fi=
les.so.2 is a symlink of =
/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueab=
i/external-arm-toolchain/2019.12-r0/image/lib/libnss_files-2.30.so, keep =
it<o:p></o:p></p><p =
class=3DMsoNormal>/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf=
-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/image/lib/libnss_he=
siod.so.2 is a symlink of =
/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueab=
i/external-arm-toolchain/2019.12-r0/image/lib/libnss_hesiod-2.30.so, =
keep it<o:p></o:p></p><p =
class=3DMsoNormal>/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf=
-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/image/lib/libpthrea=
d.so.0 is a symlink of =
/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueab=
i/external-arm-toolchain/2019.12-r0/image/lib/libpthread-2.30.so, keep =
it<o:p></o:p></p><p =
class=3DMsoNormal>/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf=
-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/image/lib/libresolv=
.so.2 is a symlink of =
/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueab=
i/external-arm-toolchain/2019.12-r0/image/lib/libresolv-2.30.so, keep =
it<o:p></o:p></p><p =
class=3DMsoNormal>/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf=
-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/image/lib/librt.so.=
1 is a symlink of =
/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueab=
i/external-arm-toolchain/2019.12-r0/image/lib/librt-2.30.so, keep =
it<o:p></o:p></p><p =
class=3DMsoNormal>/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf=
-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/image/lib/libutil.s=
o.1 is a symlink of =
/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueab=
i/external-arm-toolchain/2019.12-r0/image/lib/libutil-2.30.so, keep =
it<o:p></o:p></p><p class=3DMsoNormal>rmdir: failed to remove =
'/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnuea=
bi/external-arm-toolchain/2019.12-r0/image/usr/bin': Directory not =
empty<o:p></o:p></p><p class=3DMsoNormal>rmdir: failed to remove =
'/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnuea=
bi/external-arm-toolchain/2019.12-r0/image/usr/sbin': Directory not =
empty<o:p></o:p></p><p class=3DMsoNormal>rmdir: failed to remove =
'/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnuea=
bi/external-arm-toolchain/2019.12-r0/image/sbin': Directory not =
empty<o:p></o:p></p><p class=3DMsoNormal>=9A WRAP=9A=9A=9A =
arch/arm/include/generated/uapi/asm/bitsperlong.h<o:p></o:p></p><p =
class=3DMsoNormal>&#8230;<o:p></o:p></p><p class=3DMsoNormal>|=9A=9A =
HDRINST usr/include/asm/bitsperlong.h<o:p></o:p></p><p =
class=3DMsoNormal>|=9A=9A INSTALL =
/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueab=
i/external-arm-toolchain/2019.12-r0/external-arm-toolchain-2019.12/usr/in=
clude<o:p></o:p></p><p class=3DMsoNormal>| mv: cannot stat =
'/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnuea=
bi/external-arm-toolchain/2019.12-r0/image/usr/lib/gcc/arm-none-linux-gnu=
eabihf': No such file or directory<o:p></o:p></p><p class=3DMsoNormal>| =
WARNING: =
/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueab=
i/external-arm-toolchain/2019.12-r0/temp/run.do_install.347161:1 exit 1 =
from 'mv =
/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueab=
i/external-arm-toolchain/2019.12-r0/image/usr/lib/gcc/arm-none-linux-gnue=
abihf =
/app/build/arago-tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueab=
i/external-arm-toolchain/2019.12-r0/image/usr/lib/gcc/arm-linux-gnueabi'<=
o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>Environment after sourcing =
conf/setenv:<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal><span =
lang=3DDE>LC_ALL=3Den_US.UTF-8<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
lang=3DDE>LS_COLORS=3Drs=3D0:di=3D01;34:ln=3D01;36:mh=3D00:pi=3D40;33:so=3D=
01;35:do=3D01;35:bd=3D40;33;01:cd=3D40;33;01:or=3D40;31;01:mi=3D00:su=3D3=
7;41:sg=3D30;43:ca=3D30;41:tw=3D30;42:ow=3D34;42:st=3D37;44:ex=3D01;32:*.=
tar=3D01;31:*.tgz=3D01;31:*.arc=3D01;31:*.arj=3D01;31:*.taz=3D01;31:*.lha=
=3D01;31:*.lz4=3D01;31:*.lzh=3D01;31:*.lzma=3D01;31:*.tlz=3D01;31:*.txz=3D=
01;31:*.tzo=3D01;31:*.t7z=3D01;31:*.zip=3D01;31:*.z=3D01;31:*.Z=3D01;31:*=
.dz=3D01;31:*.gz=3D01;31:*.lrz=3D01;31:*.lz=3D01;31:*.lzo=3D01;31:*.xz=3D=
01;31:*.zst=3D01;31:*.tzst=3D01;31:*.bz2=3D01;31:*.bz=3D01;31:*.tbz=3D01;=
31:*.tbz2=3D01;31:*.tz=3D01;31:*.deb=3D01;31:*.rpm=3D01;31:*.jar=3D01;31:=
*.war=3D01;31:*.ear=3D01;31:*.sar=3D01;31:*.rar=3D01;31:*.alz=3D01;31:*.a=
ce=3D01;31:*.zoo=3D01;31:*.cpio=3D01;31:*.7z=3D01;31:*.rz=3D01;31:*.cab=3D=
01;31:*.wim=3D01;31:*.swm=3D01;31:*.dwm=3D01;31:*.esd=3D01;31:*.jpg=3D01;=
35:*.jpeg=3D01;35:*.mjpg=3D01;35:*.mjpeg=3D01;35:*.gif=3D01;35:*.bmp=3D01=
;35:*.pbm=3D01;35:*.pgm=3D01;35:*.ppm=3D01;35:*.tga=3D01;35:*.xbm=3D01;35=
:*.xpm=3D01;35:*.tif=3D01;35:*.tiff=3D01;35:*.png=3D01;35:*.svg=3D01;35:*=
.svgz=3D01;35:*.mng=3D01;35:*.pcx=3D01;35:*.mov=3D01;35:*.mpg=3D01;35:*.m=
peg=3D01;35:*.m2v=3D01;35:*.mkv=3D01;35:*.webm=3D01;35:*.ogm=3D01;35:*.mp=
4=3D01;35:*.m4v=3D01;35:*.mp4v=3D01;35:*.vob=3D01;35:*.qt=3D01;35:*.nuv=3D=
01;35:*.wmv=3D01;35:*.asf=3D01;35:*.rm=3D01;35:*.rmvb=3D01;35:*.flc=3D01;=
35:*.avi=3D01;35:*.fli=3D01;35:*.flv=3D01;35:*.gl=3D01;35:*.dl=3D01;35:*.=
xcf=3D01;35:*.xwd=3D01;35:*.yuv=3D01;35:*.cgm=3D01;35:*.emf=3D01;35:*.ogv=
=3D01;35:*.ogx=3D01;35:*.aac=3D00;36:*.au=3D00;36:*.flac=3D00;36:*.m4a=3D=
00;36:*.mid=3D00;36:*.midi=3D00;36:*.mka=3D00;36:*.mp3=3D00;36:*.mpc=3D00=
;36:*.ogg=3D00;36:*.ra=3D00;36:*.wav=3D00;36:*.oga=3D00;36:*.opus=3D00;36=
:*.spx=3D00;36:*.xspf=3D00;36:<o:p></o:p></span></p><p =
class=3DMsoNormal>LESSCLOSE=3D/usr/bin/lesspipe %s %s<o:p></o:p></p><p =
class=3DMsoNormal><span lang=3DDE>OEBASE=3D/app<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
lang=3DDE>LANG=3Den_US.UTF-8<o:p></o:p></span></p><p =
class=3DMsoNormal>HOSTNAME=3Ddb5f2ff243cd<o:p></o:p></p><p =
class=3DMsoNormal>OLDPWD=3D/app<o:p></o:p></p><p =
class=3DMsoNormal>PWD=3D/app/build<o:p></o:p></p><p =
class=3DMsoNormal>HOME=3D/home/amk<o:p></o:p></p><p =
class=3DMsoNormal>BB_ENV_EXTRAWHITE=3DMACHINE DISTRO TCMODE TCLIBC =
http_proxy ftp_proxy https_proxy all_proxy ALL_PROXY no_proxy =
SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY SDKMACHINE =
BB_NUMBER_THREADS PARALLEL_MAKE GIT_PROXY_COMMAND GIT_PROXY_IGNORE =
SOCKS5_PASSWD SOCKS5_USER OEBASE META_SDK_PATH TOOLCHAIN_TYPE =
TOOLCHAIN_BRAND TOOLCHAIN_BASE TOOLCHAIN_PATH TOOLCHAIN_PATH_ARMV5 =
TOOLCHAIN_PATH_ARMV7 TOOLCHAIN_PATH_ARMV8 EXTRA_TISDK_FILES =
TISDK_VERSION ARAGO_BRAND ARAGO_RT_ENABLE ARAGO_SYSTEST_ENABLE =
ARAGO_KERNEL_SUFFIX TI_SECURE_DEV_PKG_CAT TI_SECURE_DEV_PKG_AUTO =
TI_SECURE_DEV_PKG_K3 ARAGO_SYSVINIT SYSFW_FILE<o:p></o:p></p><p =
class=3DMsoNormal>TOOLCHAIN_PATH_ARMV7=3D/opt/gcc-arm-9.2-2019.12-x86_64-=
arm-none-linux-gnueabihf<o:p></o:p></p><p =
class=3DMsoNormal>BUILDDIR=3D/app/build<o:p></o:p></p><p =
class=3DMsoNormal>TERM=3Dxterm<o:p></o:p></p><p =
class=3DMsoNormal>SHLVL=3D1<o:p></o:p></p><p =
class=3DMsoNormal>LANGUAGE=3Den_US:en<o:p></o:p></p><p =
class=3DMsoNormal>PATH=3D/app/sources/meta-rauc/scripts:/app/sources/oe-c=
ore/scripts:/app/sources/bitbake/bin:/app/sources/meta-rauc/scripts:/app/=
sources/oe-core/scripts:/app/sources/bitbake/bin:/usr/local/sbin:/usr/loc=
al/bin:/usr/sbin:/usr/bin:/sbin:/bin<o:p></o:p></p><p =
class=3DMsoNormal>TOOLCHAIN_BASE=3D/opt/gcc-arm-9.2-2019.12-x86_64-arm-no=
ne-linux-gnueabihf<o:p></o:p></p><p class=3DMsoNormal><span =
lang=3DDE>LESSOPEN=3D| /usr/bin/lesspipe %s<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
lang=3DDE>_=3D/usr/bin/env<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DDE><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DDE><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal>Test config file for setup layers:<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>amk@db5f2ff243cd:/app$ cat =
configs/ext-toolchain-config.txt<o:p></o:p></p><p class=3DMsoNormal># =
This file takes repo entries in the format<o:p></o:p></p><p =
class=3DMsoNormal># repo name,repo uri,repo branch,repo =
commit[,layers=3Dlayer1:layer2...:layern]<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>bitbake,git://git.openembedded.org/bitbake,1.46,HEAD<o:=
p></o:p></p><p =
class=3DMsoNormal>meta-arago,git://arago-project.org/git/meta-arago.git,d=
unfell,HEAD,layers=3Dmeta-arago-distro:meta-arago-extras<o:p></o:p></p><p=
 =
class=3DMsoNormal>meta-qt5,git://github.com/meta-qt5/meta-qt5.git,dunfell=
,HEAD,layers=3D<o:p></o:p></p><p =
class=3DMsoNormal>meta-openembedded,git://git.openembedded.org/meta-opene=
mbedded,dunfell,HEAD,layers=3Dmeta-networking:meta-python:meta-oe:meta-gn=
ome:meta-filesystems<o:p></o:p></p><p =
class=3DMsoNormal>meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,HEAD=
,layers=3D<o:p></o:p></p><p =
class=3DMsoNormal>meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,HE=
AD,layers=3Dmeta-arm:meta-arm-toolchain<o:p></o:p></p><p =
class=3DMsoNormal>oe-core,git://git.openembedded.org/openembedded-core,du=
nfell,HEAD,layers=3Dmeta<o:p></o:p></p><p =
class=3DMsoNormal>OECORELAYERCONF=3D./sample-files/bblayers.conf.sample<o=
:p></o:p></p><p =
class=3DMsoNormal>OECORELOCALCONF=3D./sample-files/local.conf.sample<o:p>=
</o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>Local conf:<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>amk@db5f2ff243cd:/app/build$ diff =
../sample-files/local.conf.sample conf/local.conf<o:p></o:p></p><p =
class=3DMsoNormal>13c13<o:p></o:p></p><p class=3DMsoNormal>&lt; DL_DIR =
=3D &quot;${OEBASE}/downloads&quot;<o:p></o:p></p><p =
class=3DMsoNormal>---<o:p></o:p></p><p class=3DMsoNormal>&gt; DL_DIR =3D =
&quot;/app/downloads&quot;<o:p></o:p></p><p =
class=3DMsoNormal>51c51,54<o:p></o:p></p><p class=3DMsoNormal>&lt; =
TMPDIR =3D &quot;${OEBASE}/build/arago-tmp&quot;<o:p></o:p></p><p =
class=3DMsoNormal>---<o:p></o:p></p><p class=3DMsoNormal>&gt; TMPDIR =3D =
&quot;${TOPDIR}/arago-tmp&quot;<o:p></o:p></p><p =
class=3DMsoNormal>&gt;<o:p>&nbsp;</o:p></p><p class=3DMsoNormal>&gt; # =
By default, DEPLOY_DIR is inside TMPDIR, but can be changed here to be =
outside<o:p></o:p></p><p class=3DMsoNormal>&gt; #DEPLOY_DIR =3D =
&quot;${TOPDIR}/deploy&quot;<o:p></o:p></p><p =
class=3DMsoNormal>82c85<o:p></o:p></p><p class=3DMsoNormal>&lt; =
SDKMACHINE ?=3D &quot;i686&quot;<o:p></o:p></p><p =
class=3DMsoNormal>---<o:p></o:p></p><p class=3DMsoNormal>&gt; SDKMACHINE =
?=3D &quot;x86_64&quot;<o:p></o:p></p><p =
class=3DMsoNormal>123c126<o:p></o:p></p><p class=3DMsoNormal>&lt; =
#ENABLE_BINARY_LOCALE_GENERATION =3D &quot;0&quot;<o:p></o:p></p><p =
class=3DMsoNormal>---<o:p></o:p></p><p class=3DMsoNormal>&gt; =
ENABLE_BINARY_LOCALE_GENERATION =3D &quot;0&quot;<o:p></o:p></p><p =
class=3DMsoNormal>138c141<o:p></o:p></p><p class=3DMsoNormal>&lt; =
BB_NUMBER_THREADS =3D &quot;1&quot;<o:p></o:p></p><p =
class=3DMsoNormal>---<o:p></o:p></p><p class=3DMsoNormal>&gt; =
BB_NUMBER_THREADS =3D &quot;24&quot;<o:p></o:p></p><p =
class=3DMsoNormal>143c146<o:p></o:p></p><p class=3DMsoNormal>&lt; =
PARALLEL_MAKE =3D &quot;-j 1&quot;<o:p></o:p></p><p =
class=3DMsoNormal>---<o:p></o:p></p><p class=3DMsoNormal>&gt; =
PARALLEL_MAKE =3D &quot;-j 24&quot;<o:p></o:p></p><p =
class=3DMsoNormal>148,150c151<o:p></o:p></p><p class=3DMsoNormal>&lt; # =
Select a distribution from supported &quot;arago&quot;, =
&quot;angstrom-2010.x&quot; or &quot;poky&quot;<o:p></o:p></p><p =
class=3DMsoNormal>&lt; # By default, go with the &quot;distroless&quot; =
configuration, when not set<o:p></o:p></p><p class=3DMsoNormal>&lt; =
#DISTRO=9A=9A =3D &quot;arago&quot;<o:p></o:p></p><p =
class=3DMsoNormal>---<o:p></o:p></p><p class=3DMsoNormal>&gt; =
DISTRO=9A=9A =3D &quot;arago&quot;<o:p></o:p></p><p =
class=3DMsoNormal>164a166,174<o:p></o:p></p><p =
class=3DMsoNormal>&gt;<o:p>&nbsp;</o:p></p><p class=3DMsoNormal>&gt; # =
Enable local PR service for binary feeds<o:p></o:p></p><p =
class=3DMsoNormal>&gt; PRSERV_HOST =3D =
&quot;localhost:0&quot;<o:p></o:p></p><p =
class=3DMsoNormal>&gt;<o:p>&nbsp;</o:p></p><p class=3DMsoNormal>&gt; # =
It is recommended to activate &quot;buildhistory&quot; for testing the =
PR service<o:p></o:p></p><p class=3DMsoNormal>&gt; INHERIT +=3D =
&quot;buildhistory&quot;<o:p></o:p></p><p class=3DMsoNormal>&gt; =
BUILDHISTORY_COMMIT =3D &quot;1&quot;<o:p></o:p></p><p =
class=3DMsoNormal>&gt;<o:p>&nbsp;</o:p></p><p class=3DMsoNormal>&gt; =
EXTERNAL_TOOLCHAIN=3D&quot;/opt/gcc-arm-10.3-2021.07-x86_64-arm-none-linu=
x-gnueabihf&quot;<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>Building in =
Docker Container with following Docker File:<o:p></o:p></p><p =
class=3DMsoNormal>FROM ubuntu:18.04<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>RUN apt-get =
update &amp;&amp; \<o:p></o:p></p><p =
class=3DMsoNormal>=9A=9A=9A=9A=9A=9A=9A DEBIAN_FRONTEND=3Dnoninteractive =
apt-get -yq install git build-essential python3 diffstat texinfo gawk =
chrpath dos2unix wget unzip socat doxygen libc6-i386 libncurses5 =
libstdc++6 libz1 locales openssh-server cpio sudo =
python3-distutils<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal># set bash =
as default<o:p></o:p></p><p class=3DMsoNormal>RUN echo &quot;dash =
dash/sh boolean false&quot; | debconf-set-selections &amp;&amp; =
\<o:p></o:p></p><p class=3DMsoNormal>=9A=9A=9A=9A=9A=9A=9A =
DEBIAN_FRONTEND=3Dnoninteractive dpkg-reconfigure dash<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal># Set the =
locale<o:p></o:p></p><p class=3DMsoNormal>RUN sed -i '/en_US.UTF-8/s/^# =
//g' /etc/locale.gen &amp;&amp; \<o:p></o:p></p><p =
class=3DMsoNormal>=9A=9A=9A <span =
lang=3DDE>locale-gen<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DDE>ENV LANG en_US.UTF-8<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DDE>ENV LANGUAGE =
en_US:en<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DDE>ENV =
LC_ALL en_US.UTF-8<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DDE><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal># pythone =
requirements<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>RUN useradd -rm -d /home/amk -s /bin/bash -g root -G =
sudo -u 1001 amk<o:p></o:p></p><p class=3DMsoNormal>RUN chown amk:root =
/opt<o:p></o:p></p><p class=3DMsoNormal>USER amk<o:p></o:p></p><p =
class=3DMsoNormal>WORKDIR /app<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal># Authorize =
SSH Host<o:p></o:p></p><p class=3DMsoNormal>RUN mkdir -p $HOME/.ssh =
&amp;&amp; \<o:p></o:p></p><p class=3DMsoNormal>=9A=9A=9A chmod 0700 =
$HOME/.ssh &amp;&amp; \<o:p></o:p></p><p class=3DMsoNormal>=9A=9A=9A =
ssh-keyscan gitlab.amk-drives.bg &gt; =
$HOME/.ssh/known_hosts<o:p></o:p></p><p class=3DMsoNormal>RUN =
ssh-keyscan developer.arm.com &gt; =
$HOME/.ssh/known_hosts<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>#install the =
toolchain<o:p></o:p></p><p class=3DMsoNormal>RUN cd /opt &amp;&amp; =
\<o:p></o:p></p><p class=3DMsoNormal>=9A=9A=9A=9A=9A=9A=9A wget =
--no-check-certificate =
https://developer.arm.com/-/media/Files/downloads/gnu-a/9.2-2019.12/binre=
l/gcc-arm-9.2-2019.12-x86_64-arm-none-linux-gnueabihf.tar.xz &amp;&amp; =
\<o:p></o:p></p><p class=3DMsoNormal>=9A=9A=9A=9A=9A=9A=9A tar -Jxvf =
gcc-arm-9.2-2019.12-x86_64-arm-none-linux-gnueabihf.tar.xz -C =
/opt/<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>ENV =
TOOLCHAIN_PATH_ARMV7=3D/opt/gcc-arm-9.2-2019.12-x86_64-arm-none-linux-gnu=
eabihf<o:p></o:p></p><p class=3DMsoNormal>ENV =
TOOLCHAIN_BASE=3D${TOOLCHAIN_PATH_ARMV7}<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>I will =
continue investigation and how to fix this, but for solutions or hints =
I&#8217;m pleasant. <o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>Best regards =
!<o:p></o:p></p><p class=3DMsoNormal>Daniel L.<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p></div></body></html>

------=_NextPart_000_0095_01D7B460.33620180--
