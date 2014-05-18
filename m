Return-Path: <m.palanchini@itelcobroadcast.com>
Received: from mail-vc0-f178.google.com (mail-vc0-f178.google.com
	[209.85.220.178])
	by arago-project.org (Postfix) with ESMTPS id 1E30D52A6B
	for <meta-arago@arago-project.org>;
	Sun, 18 May 2014 16:34:05 +0000 (UTC)
Received: by mail-vc0-f178.google.com with SMTP id hq16so8470939vcb.37
	for <meta-arago@arago-project.org>;
	Sun, 18 May 2014 09:34:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to
	:content-type;
	bh=6CCRncz5ga4j0B0qhIYPSAEZwtuPyxN+lB/QuTG8Zdc=;
	b=RE+Q18khTJqhDr1G/x1phG9jrf477te+658hNTJMMqJt/IKKUZr45IylixlG7QfM42
	5qWTj/Lv7cCA3nMTjNz0OwuHGSuVFKRpLtcsyZefxMfGl44oqQGVLIeXysgRT5f4KZc7
	OapOkuClD4MpDnAjSSUCM68cKc0sFjiEncYtU8KUfrUIZf5xYdFpPwCUphNldWF8VoUC
	i2rSzaJt6md+wsYwTXDY9QwA4ujXYq5OMtpPFViI0HSUmI1af0/D+pzgb3+z4y+/8qU8
	Pr/5dyCpXdhETRl0A9LQ/ov34ba3Xi/AgEhVlrOfgewqStUxf3rBmdNBHfB+SmqxDyzL
	WpPQ==
X-Gm-Message-State: ALoCoQlS1cbje/Hykv5gnMKONtolgF+AJbac+hgE0nW8bchvpZ2zgLe9eXmz/ZB+jBn6hp0is2ps
MIME-Version: 1.0
X-Received: by 10.58.111.163 with SMTP id ij3mr9958542veb.26.1400430844399;
	Sun, 18 May 2014 09:34:04 -0700 (PDT)
Received: by 10.52.182.135 with HTTP; Sun, 18 May 2014 09:34:04 -0700 (PDT)
X-Originating-IP: [93.39.199.241]
Date: Sun, 18 May 2014 18:34:04 +0200
Message-ID: <CAPPOLyqFuggNtg8bsC3buAR+DwuQTB0vJN6PRd866sSCmtGU_g@mail.gmail.com>
From: Mirko Palanchini <m.palanchini@itelcobroadcast.com>
To: meta-arago@arago-project.org
Subject: Newbie ask support
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
X-List-Received-Date: Sun, 18 May 2014 16:34:05 -0000
Content-Type: multipart/alternative; boundary=047d7b2e548a03642604f9af3740

--047d7b2e548a03642604f9af3740
Content-Type: text/plain; charset=UTF-8

Hi everyone

 I'm developing application for a custom board based on a TI AM3352
processor using TI AMSDK 7.0. Rather than patching an Angstrom distro I'm
trying to obtaing a custom meta-arago distro.

 The basic goal is to obtain a core-image-minimal version with also gcc and
autoconf/automake to be able to add features later and native compiling on
target board, the top goal is to obtain a distro with multimedia features
like alsa driver and gstreamer and in general the most similar possible to
the one obtainable from the SDK.

 I tryed to follow steps read from the page:

"http://arago-project.org/wiki/index.php/Setting_Up_Build_Environment"


Obtaining a "core-image-minimal" version was very easy, but problems quicky
appeared just trying to obtain other images mentioned in that document.

First idea was modifying EXTRA_IMAGE_FEATURES in build/conf/local.conf
setting

EXTRA_IMAGE_FEATURES = "tools-sdk debug-tweaks"

Both re-compiling after a successfull image-core-minimal bitbake and
running all example from beginning deleting all file in tisdk directory,
Bitbake fails the "do_rootfs" task with the following error:

Collected errors:
 * satisfy_dependencies_for: Cannot satisfy the following dependencies for
packagegroup-core-sdk:
 *     ldd *
 * opkg_install_cmd: Cannot install package packagegroup-core-sdk.

Same error if I try to build a tisdk-rootfs (I saw it has almost everything
I need in my distro) bitbake fails task "do_rootfs".

If I try a arago-core-tisdk-image I get lot of errors for unresolved
dependencies, packages unable to be fetched and/or "installed but not
shipped".

 My basic questions are:


   1.

   Is it expected that all the packages fetched/generated during process
   are enough and enough referenced for dependcies to generate a distro or I
   must modify some recipes before running bitbake?
   2.

   To obtains a tisdk distro must I mandatory use the
   configs/amsdk/amsdkXXX.txt file when running oe-layertool-setup.sh?
   3.

   Is it possibile to set the target board's device tree via bitbake or in
   general before flashing the distro to a sdcard? What files must be modified?

I append complete bitbake log of my attempt of image-core-minimal +
tools-sdk

Thank in advice, Mirko.


*** log messages
**************************************************************************************************************************

zuya@HP-ZUYA:~/tisdk/build$ MACHINE=am335x-evm bitbake core-image-minimal
Parsing recipes: 100% |#########################################| Time:
00:02:58
Parsing of 1594 .bb files complete (0 cached, 1594 parsed). 1975 targets,
154 skipped, 0 masked, 0 errors.
WARNING: No recipes available for:

/home/zuya/tisdk/sources/meta-arago/meta-arago-distro/recipes-qt/qt5/qtwebkit_5.2.0.bbappend

/home/zuya/tisdk/sources/meta-arago/meta-arago-distro/recipes-qt/qt5/qtbase_5.2.0.bbappend

Build Configuration:
BB_VERSION        = "1.18.0"
BUILD_SYS         = "i686-linux"
NATIVELSBSTRING   = "Ubuntu-12.04"
TARGET_SYS        = "arm-oe-linux-gnueabi"
MACHINE           = "am335x-evm"
DISTRO            = "arago"
DISTRO_VERSION    = "2013.12"
TUNE_FEATURES     = "armv7a vfp thumb neon callconvention-hard cortexa8"
TARGET_FPU        = "vfp-neon"
meta-arago-distro
meta-arago-extras = "dylan:370ed5e9f68afd0937e01f6cd69863e45ba19c1f"
meta-qt5          = "master:05ed65d22578296d5ef145ec20e6e7bb7b434c9b"
toolchain-layer
meta-networking
meta-ruby
meta-oe           = "dylan:70ebe86f193decd17d6295bcd4d4e5589585c0cc"
meta-ti           = "dylan:61fdfef43ee1aa4e5082923aea5b5a35673c0e30"
meta-linaro-toolchain = "dylan:c9f78d6eff14ada3f2bc960e81883b27a10afecc"
meta              = "dylan:b2d96a966215d90bd2514e2bbe8deabe9eaabea1"

NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
WARNING: Failed to fetch URL
ftp://ftp.gmplib.org/pub/gmp-5.1.0/gmp-5.1.0a.tar.bz2, attempting MIRRORS
if available

ERROR: Function failed: do_rootfs (see
/home/zuya/tisdk/build/arago-tmp-external-linaro-toolchain/work/am335x_evm-oe-linux-gnueabi/core-image-minimal/1.0-r0/temp/log.do_rootfs.29715
for further information)
ERROR: Task 8 (/home/zuya/tisdk/sources/oe-core/meta/recipes-core/images/
core-image-minimal.bb, do_rootfs) failed with exit code '1'
NOTE: Tasks Summary: Attempted 2215 tasks of which 1581 didn't need to be
rerun and 1 failed.
No currently running tasks (2215 of 2216)

Summary: 1 task failed:
  /home/zuya/tisdk/sources/oe-core/meta/recipes-core/images/
core-image-minimal.bb, do_rootfs
Summary: There were 3 WARNING messages shown.
Summary: There was 1 ERROR message shown, returning a non-zero exit code.


Collected errors:
 * satisfy_dependencies_for: Cannot satisfy the following dependencies for
packagegroup-core-sdk:
 *     ldd *
 * opkg_install_cmd: Cannot install package packagegroup-core-sdk.

--047d7b2e548a03642604f9af3740
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">


=09
=09
=09
=09


<p style=3D"margin-bottom:0cm" lang=3D"zxx">Hi everyone</p>
<p style=3D"margin-bottom:0cm" lang=3D"zxx">
</p>
<p style=3D"margin-bottom:0cm" lang=3D"zxx">I&#39;m developing application
for a custom board based on a TI AM3352 processor using TI AMSDK 7.0.
Rather than patching an Angstrom distro I&#39;m trying to obtaing a custom
meta-arago distro.</p>
<p style=3D"margin-bottom:0cm" lang=3D"zxx">
</p>
<p style=3D"margin-bottom:0cm" lang=3D"zxx">The basic goal is to obtain
a core-image-minimal version with also gcc and autoconf/automake to
be able to add features later and native compiling on target board, the top=
 goal is to obtain a distro
with multimedia features like alsa driver and gstreamer and in
general the most similar possible to the one obtainable from the SDK.
</p>
<p style=3D"margin-bottom:0cm" lang=3D"zxx">
</p>
<p style=3D"margin-bottom:0cm" lang=3D"zxx">I tryed to follow steps read
from the page:</p><p style=3D"margin-bottom:0cm" lang=3D"zxx">&quot;<a href=
=3D"http://arago-project.org/wiki/index.php/Setting_Up_Build_Environment">h=
ttp://arago-project.org/wiki/index.php/Setting_Up_Build_Environment</a>&quo=
t;</p>

<p style=3D"margin-bottom:0cm" lang=3D"zxx"><br>
</p>Obtaining a
&quot;core-image-minimal&quot; version was very easy, but problems
quicky appeared just trying to obtain other images mentioned in that
document.
<p style=3D"margin-bottom:0cm" lang=3D"zxx">
First idea was modifying EXTRA_IMAGE_FEATURES in build/conf/local.conf sett=
ing<br></p>
<p style=3D"margin-bottom:0cm" lang=3D"zxx">EXTRA_IMAGE_FEATURES =3D &quot;=
tools-sdk debug-tweaks&quot;</p><p style=3D"margin-bottom:0cm" lang=3D"zxx"=
>Both re-compiling after a successfull image-core-minimal bitbake and runni=
ng all example from beginning deleting all file in tisdk directory, Bitbake=
 fails the &quot;do_rootfs&quot; task with the following error: <br>
</p><p style=3D"margin-bottom:0cm" lang=3D"zxx">Collected errors:<br>=C2=A0=
* satisfy_dependencies_for: Cannot satisfy the following dependencies for p=
ackagegroup-core-sdk:<br>=C2=A0* =C2=A0=C2=A0=C2=A0 ldd * <br>=C2=A0* opkg_=
install_cmd: Cannot install package packagegroup-core-sdk.<br>
<br></p>Same error if I try to build a
tisdk-rootfs (I saw it has almost everything I need in my distro)
bitbake fails task &quot;do_rootfs&quot;.
<p style=3D"margin-bottom:0cm" lang=3D"zxx">If I try a
<code class=3D"">arago-core-tisdk-image</code> I get lot of
errors for unresolved dependencies, packages unable to be fetched
and/or &quot;installed but not shipped&quot;.</p>
<p style=3D"margin-bottom:0cm" lang=3D"zxx">
</p>
<p style=3D"margin-bottom:0cm" lang=3D"zxx">My basic questions are:</p>
<p style=3D"margin-bottom:0cm" lang=3D"zxx">
</p>
<ol><li><p style=3D"margin-bottom:0cm" lang=3D"zxx">Is it expected that all
	the packages fetched/generated during process are enough and enough
	referenced for dependcies to generate a distro or I must modify some
	recipes before running bitbake?</p>
	</li><li><p style=3D"margin-bottom:0cm" lang=3D"zxx">To obtains a tisdk
	distro must I mandatory use the configs/amsdk/amsdkXXX.txt file when
	running oe-layertool-setup.sh?</p>
	</li><li><p style=3D"margin-bottom:0cm" lang=3D"zxx">Is it possibile to se=
t
	the target board&#39;s device tree via bitbake or in general before
	flashing the distro to a sdcard? What files must be modified?</p>
</li></ol>
<p style=3D"margin-bottom:0cm" lang=3D"zxx">I append complete bitbake log o=
f my attempt of image-core-minimal + tools-sdk<br>
</p>
<p style=3D"margin-bottom:0cm" lang=3D"zxx">Thank in advice, Mirko.</p><p s=
tyle=3D"margin-bottom:0cm" lang=3D"zxx"><br></p><p style=3D"margin-bottom:0=
cm" lang=3D"zxx">*** log messages *****************************************=
***************************************************************************=
******</p>
<p style=3D"margin-bottom:0cm" lang=3D"zxx">zuya@HP-ZUYA:~/tisdk/build$ MAC=
HINE=3Dam335x-evm bitbake core-image-minimal<br>Parsing recipes: 100% |####=
#####################################| Time: 00:02:58<br>Parsing of 1594 .b=
b files complete (0 cached, 1594 parsed). 1975 targets, 154 skipped, 0 mask=
ed, 0 errors.<br>
WARNING: No recipes available for:<br>=C2=A0 /home/zuya/tisdk/sources/meta-=
arago/meta-arago-distro/recipes-qt/qt5/qtwebkit_5.2.0.bbappend<br>=C2=A0 /h=
ome/zuya/tisdk/sources/meta-arago/meta-arago-distro/recipes-qt/qt5/qtbase_5=
.2.0.bbappend<br>
<br>Build Configuration:<br>BB_VERSION=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 =3D &quot;1.18.0&quot;<br>BUILD_SYS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 =3D &quot;i686-linux&quot;<br>NATIVELSBSTRING=C2=A0=C2=A0 =
=3D &quot;Ubuntu-12.04&quot;<br>TARGET_SYS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 =3D &quot;arm-oe-linux-gnueabi&quot;<br>MACHINE=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;am335x-evm&quot;<br>
DISTRO=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=3D &quot;arago&quot;<br>DISTRO_VERSION=C2=A0=C2=A0=C2=A0 =3D &quot;2013.12=
&quot;<br>TUNE_FEATURES=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;armv7a vfp thumb =
neon callconvention-hard cortexa8&quot;<br>TARGET_FPU=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 =3D &quot;vfp-neon&quot;<br>meta-arago-distro <br>
meta-arago-extras =3D &quot;dylan:370ed5e9f68afd0937e01f6cd69863e45ba19c1f&=
quot;<br>meta-qt5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=
 &quot;master:05ed65d22578296d5ef145ec20e6e7bb7b434c9b&quot;<br>toolchain-l=
ayer=C2=A0=C2=A0 <br>meta-networking=C2=A0=C2=A0 <br>meta-ruby=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <br>
meta-oe=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &qu=
ot;dylan:70ebe86f193decd17d6295bcd4d4e5589585c0cc&quot;<br>meta-ti=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;dylan:61fdfef=
43ee1aa4e5082923aea5b5a35673c0e30&quot;<br>meta-linaro-toolchain =3D &quot;=
dylan:c9f78d6eff14ada3f2bc960e81883b27a10afecc&quot;<br>
meta=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 =3D &quot;dylan:b2d96a966215d90bd2514e2bbe8deabe9eaabea1&quot;<br=
><br>NOTE: Resolving any missing task queue dependencies<br>NOTE: Preparing=
 runqueue<br>NOTE: Executing SetScene Tasks<br>NOTE: Executing RunQueue Tas=
ks<br>
WARNING: Failed to fetch URL <a href=3D"ftp://ftp.gmplib.org/pub/gmp-5.1.0/=
gmp-5.1.0a.tar.bz2">ftp://ftp.gmplib.org/pub/gmp-5.1.0/gmp-5.1.0a.tar.bz2</=
a>, attempting MIRRORS if available<br><br>ERROR: Function failed: do_rootf=
s (see /home/zuya/tisdk/build/arago-tmp-external-linaro-toolchain/work/am33=
5x_evm-oe-linux-gnueabi/core-image-minimal/1.0-r0/temp/log.do_rootfs.29715 =
for further information)<br>
ERROR: Task 8 (/home/zuya/tisdk/sources/oe-core/meta/recipes-core/images/<a=
 href=3D"http://core-image-minimal.bb">core-image-minimal.bb</a>, do_rootfs=
) failed with exit code &#39;1&#39;<br>NOTE: Tasks Summary: Attempted 2215 =
tasks of which 1581 didn&#39;t need to be rerun and 1 failed.<br>
No currently running tasks (2215 of 2216)<br><br>Summary: 1 task failed:<br=
>=C2=A0 /home/zuya/tisdk/sources/oe-core/meta/recipes-core/images/<a href=
=3D"http://core-image-minimal.bb">core-image-minimal.bb</a>, do_rootfs<br>S=
ummary: There were 3 WARNING messages shown.<br>
Summary: There was 1 ERROR message shown, returning a non-zero exit code.<b=
r><br><br>Collected errors:<br>=C2=A0* satisfy_dependencies_for: Cannot sat=
isfy the following dependencies for packagegroup-core-sdk:<br>=C2=A0* =C2=
=A0=C2=A0=C2=A0 ldd * <br>
=C2=A0* opkg_install_cmd: Cannot install package packagegroup-core-sdk.<br>=
<br></p><p style=3D"margin-bottom:0cm" lang=3D"zxx"><br></p>

</div>

--047d7b2e548a03642604f9af3740--
