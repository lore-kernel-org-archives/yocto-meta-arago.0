Return-Path: <matti.kaasinen@gmail.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by arago-project.org (Postfix) with ESMTPS id 9125352987
	for <meta-arago@arago-project.org>;
	Tue, 16 Jun 2015 05:40:49 +0000 (UTC)
Received: by igbos3 with SMTP id os3so35935147igb.0
	for <meta-arago@arago-project.org>;
	Mon, 15 Jun 2015 22:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=8bRrbul/f91FAD6XMLg3ontvdOER94Q7s8buSNudow8=;
	b=aSWDzdJkPFGtkSJThvEBb2Cel6wEso6E3A3k0bqiGiFL3+dokKxaoaIky2Tw1Uidx4
	+XgDtgtjbiYggSs+1fxMMBS244eHNQO02uq4grPioOfDzujaN/C3ErjIQTw6JBaLAZ2K
	HwQ1wWASZa4u7u+Z0CSfQpmbWA5HCwPLXi6J8CwZEM8zS99RuGF+2D+HJt89jJzcjtZU
	GItzhpG5XVFXME/8rEesRpIqXn89NugnnjiWnB/ExmDcZmwb6Lxhp7SOqpY8Z1ognyyz
	6oX4wPBdpID65n38TfvMBB8OeJCeGIB5Fjcom3S2qiT1YNW3bZJealWK7QQwVOH2B/t+
	rgSw==
MIME-Version: 1.0
X-Received: by 10.42.72.132 with SMTP id o4mr1087604icj.20.1434433248799; Mon,
	15 Jun 2015 22:40:48 -0700 (PDT)
Received: by 10.36.1.197 with HTTP; Mon, 15 Jun 2015 22:40:48 -0700 (PDT)
Date: Tue, 16 Jun 2015 08:40:48 +0300
Message-ID: <CADnUhn12omPvo_t8L9+bt4H4t1U4q4xkK1N6WwbDiYoAyfXMZw@mail.gmail.com>
From: matti kaasinen <matti.kaasinen@gmail.com>
To: meta-arago@arago-project.org
Subject: Arago/Daisy, systemd_211.bb crashes
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
X-List-Received-Date: Tue, 16 Jun 2015 05:40:50 -0000
Content-Type: multipart/alternative; boundary=90e6ba3fcd553fb0d505189c04b7

--90e6ba3fcd553fb0d505189c04b7
Content-Type: text/plain; charset=UTF-8

Hi!

I get following error listing from systemd_211.bb run:

| arm-linux-gnueabi-libtool: link: arm-linux-gnueabihf-ranlib
.libs/libsystemd-core.a
| arm-linux-gnueabi-libtool: link: rm -fr .libs/libsystemd-core.lax
| arm-linux-gnueabi-libtool: link: ( cd ".libs" && rm -f "libsystemd-core.la"
&& ln -s "../libsystemd-core.la" "libsystemd-core.la" )
| arm-linux-gnueabi-libtool: link: arm-linux-gnueabihf-ranlib
.libs/libsystemd-networkd-core.a
| arm-linux-gnueabi-libtool: link: rm -fr
.libs/libsystemd-networkd-core.lax .libs/libsystemd-networkd-core.lax
| arm-linux-gnueabi-libtool: link: ( cd ".libs" && rm -f "
libsystemd-networkd-core.la" && ln -s "../libsystemd-networkd-core.la" "
libsystemd-networkd-core.la" )
| make[1]: *** [all-recursive] Error 1
| make: *** [all] Error 2
| ERROR: oe_runmake failed
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_compile (log file is located at
/ARAGO/BUILT-external-linaro-toolchain/work/cortexa8t2hf-vfp-neon-linux-gnueabi/systemd/1_211+gitAUTOINC+3a450ec5c6-r0/temp/log.do_compile.13883)

My system configuration is:
Build Configuration:
BB_VERSION        = "1.26.0"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "Ubuntu-14.04"
TARGET_SYS        = "arm-linux-gnueabi"
MACHINE           = "am335x-evm"
DISTRO            = "arago"
DISTRO_VERSION    = "2015.05"
TUNE_FEATURES     = "armv7a vfp thumb neon callconvention-hard cortexa8"
TARGET_FPU        = "vfp-neon"
meta-arago-distro
meta-arago-extras = "daisy:91ff756d1b089f2c6d70a907419550314e2a6a28"
meta-qt5          = "master:9925146ee780e7a1df8bf2bc958619b7cfdae690"
toolchain-layer
meta-networking
meta-ruby
meta-oe
meta-initramfs
meta-webserver    = "daisy:d3d14d3fcca7fcde362cf0b31411dc4eea6d20aa"
meta-ti           = "daisy:b812d89ed4e9a64f60a279f3fd26f91d22d17647"
meta-linaro-toolchain = "daisy:06008235ca752fea678953e85adaa29a491d246b"
meta              = "daisy:5a577ec878a15f3caaf4893b819825ffb8c81266"

Thanks,
Matti

--90e6ba3fcd553fb0d505189c04b7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi!<br><br></div>I get following error listing from <=
a href=3D"http://systemd_211.bb">systemd_211.bb</a> run:<br><div><div><br>|=
 arm-linux-gnueabi-libtool: link: arm-linux-gnueabihf-ranlib .libs/libsyste=
md-core.a<br>| arm-linux-gnueabi-libtool: link: rm -fr .libs/libsystemd-cor=
e.lax<br>| arm-linux-gnueabi-libtool: link: ( cd &quot;.libs&quot; &amp;&am=
p; rm -f &quot;<a href=3D"http://libsystemd-core.la">libsystemd-core.la</a>=
&quot; &amp;&amp; ln -s &quot;../<a href=3D"http://libsystemd-core.la">libs=
ystemd-core.la</a>&quot; &quot;<a href=3D"http://libsystemd-core.la">libsys=
temd-core.la</a>&quot; )<br>| arm-linux-gnueabi-libtool: link: arm-linux-gn=
ueabihf-ranlib .libs/libsystemd-networkd-core.a<br>| arm-linux-gnueabi-libt=
ool: link: rm -fr .libs/libsystemd-networkd-core.lax .libs/libsystemd-netwo=
rkd-core.lax<br>| arm-linux-gnueabi-libtool: link: ( cd &quot;.libs&quot; &=
amp;&amp; rm -f &quot;<a href=3D"http://libsystemd-networkd-core.la">libsys=
temd-networkd-core.la</a>&quot; &amp;&amp; ln -s &quot;../<a href=3D"http:/=
/libsystemd-networkd-core.la">libsystemd-networkd-core.la</a>&quot; &quot;<=
a href=3D"http://libsystemd-networkd-core.la">libsystemd-networkd-core.la</=
a>&quot; )<br>| make[1]: *** [all-recursive] Error 1<br>| make: *** [all] E=
rror 2<br>| ERROR: oe_runmake failed<br>| WARNING: exit code 1 from a shell=
 command.<br>| ERROR: Function failed: do_compile (log file is located at /=
ARAGO/BUILT-external-linaro-toolchain/work/cortexa8t2hf-vfp-neon-linux-gnue=
abi/systemd/1_211+gitAUTOINC+3a450ec5c6-r0/temp/log.do_compile.13883)<br><b=
r></div><div>My system configuration is:<br>Build Configuration:<br>BB_VERS=
ION=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;1.26.0&quot;<br>BUI=
LD_SYS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;x86_64-lin=
ux&quot;<br>NATIVELSBSTRING=C2=A0=C2=A0 =3D &quot;Ubuntu-14.04&quot;<br>TAR=
GET_SYS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;arm-linux-gnuea=
bi&quot;<br>MACHINE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 =3D &quot;am335x-evm&quot;<br>DISTRO=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;arago&quot;<br>DISTRO_VERSIO=
N=C2=A0=C2=A0=C2=A0 =3D &quot;2015.05&quot;<br>TUNE_FEATURES=C2=A0=C2=A0=C2=
=A0=C2=A0 =3D &quot;armv7a vfp thumb neon callconvention-hard cortexa8&quot=
;<br>TARGET_FPU=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;vfp-neo=
n&quot;<br>meta-arago-distro <br>meta-arago-extras =3D &quot;daisy:91ff756d=
1b089f2c6d70a907419550314e2a6a28&quot;<br>meta-qt5=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;master:9925146ee780e7a1df8bf2bc958=
619b7cfdae690&quot;<br>toolchain-layer=C2=A0=C2=A0 <br>meta-networking=C2=
=A0=C2=A0 <br>meta-ruby=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <br=
>meta-oe=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <br>me=
ta-initramfs=C2=A0=C2=A0=C2=A0 <br>meta-webserver=C2=A0=C2=A0=C2=A0 =3D &qu=
ot;daisy:d3d14d3fcca7fcde362cf0b31411dc4eea6d20aa&quot;<br>meta-ti=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;daisy:b812d89=
ed4e9a64f60a279f3fd26f91d22d17647&quot;<br>meta-linaro-toolchain =3D &quot;=
daisy:06008235ca752fea678953e85adaa29a491d246b&quot;<br>meta=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;d=
aisy:5a577ec878a15f3caaf4893b819825ffb8c81266&quot;<br><br></div><div>Thank=
s,<br></div><div>Matti<br></div></div></div>

--90e6ba3fcd553fb0d505189c04b7--
