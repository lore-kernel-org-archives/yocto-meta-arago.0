Return-Path: <matti.kaasinen@gmail.com>
Received: from mail-ie0-f171.google.com (mail-ie0-f171.google.com
	[209.85.223.171])
	by arago-project.org (Postfix) with ESMTPS id 49E6152987
	for <meta-arago@arago-project.org>;
	Tue, 16 Jun 2015 12:42:05 +0000 (UTC)
Received: by iebgx4 with SMTP id gx4so11785373ieb.0
	for <meta-arago@arago-project.org>;
	Tue, 16 Jun 2015 05:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=CyI5Gtyx7cwe9zCgJz6pMto+vOKRkcFB0AszxZO+V/g=;
	b=wlzP9Uq37PBRhqHtbyINMde1hFMKS8LB8FyTrEJc+ef3+36yElIKFVFXYXfXBnZMsT
	zDDsOJRI8IsPnz4TP3BdUcJp89tkJwfDDEiK8vCZ1cqAYtFtc/fXU64lEE8OY0Ji5Jda
	9uITH5r6S21ajsy0nbeo0erkYXrmjDbhdrQASG1/aBnbMPVxVW8IcIIjbUvLGYqjGT97
	7j0Lk88W7xGaK+NV0TOgAjVuURj1JyYZsygQXUuUrRJYFZsDtbo36qwKli2B3Ecidcn+
	u1rCe4wsPzJLqvk3xly1BRboR/+mrhzEVafvjfX7CuKT7RQz/bwKtIRCmM9BtQsHqubO
	K4+A==
MIME-Version: 1.0
X-Received: by 10.50.111.167 with SMTP id ij7mr27211039igb.49.1434458524111;
	Tue, 16 Jun 2015 05:42:04 -0700 (PDT)
Received: by 10.36.1.197 with HTTP; Tue, 16 Jun 2015 05:42:04 -0700 (PDT)
In-Reply-To: <CADnUhn12omPvo_t8L9+bt4H4t1U4q4xkK1N6WwbDiYoAyfXMZw@mail.gmail.com>
References: <CADnUhn12omPvo_t8L9+bt4H4t1U4q4xkK1N6WwbDiYoAyfXMZw@mail.gmail.com>
Date: Tue, 16 Jun 2015 15:42:04 +0300
Message-ID: <CADnUhn3=ToQNxiSZkwkmQD75WpDEUx5p5Q=Vx4h0NC-+guMJ4A@mail.gmail.com>
From: matti kaasinen <matti.kaasinen@gmail.com>
To: meta-arago@arago-project.org
Subject: Re: Arago/Daisy, systemd_211.bb crashes
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
X-List-Received-Date: Tue, 16 Jun 2015 12:42:06 -0000
Content-Type: multipart/alternative; boundary=047d7b414478c65c1d0518a1e655

--047d7b414478c65c1d0518a1e655
Content-Type: text/plain; charset=UTF-8

Some additions:
Error takes place when compiling git/src/udev/udev-builtin-kmod.c with
message:
git/src/udev/udev-builtin-kmod.c:71: error: undefined reference to
'udev_main_log'

Requested symbol is defined both in git/src/udev/udevadm.c,
git/src/udev/udevd.c and git/src/test/test-udev.c. It is also declared in
git/src/udev/udev.h.
udevadm.o, udevd.o and test-udev.o can all be found from build/src/udev
folder. So, most like there is some kind dependency problem in autotools
settings.

Thanks,
Matti

2015-06-16 8:40 GMT+03:00 matti kaasinen <matti.kaasinen@gmail.com>:

> Hi!
>
> I get following error listing from systemd_211.bb run:
>
> | arm-linux-gnueabi-libtool: link: arm-linux-gnueabihf-ranlib
> .libs/libsystemd-core.a
> | arm-linux-gnueabi-libtool: link: rm -fr .libs/libsystemd-core.lax
> | arm-linux-gnueabi-libtool: link: ( cd ".libs" && rm -f "
> libsystemd-core.la" && ln -s "../libsystemd-core.la" "libsystemd-core.la"
> )
> | arm-linux-gnueabi-libtool: link: arm-linux-gnueabihf-ranlib
> .libs/libsystemd-networkd-core.a
> | arm-linux-gnueabi-libtool: link: rm -fr
> .libs/libsystemd-networkd-core.lax .libs/libsystemd-networkd-core.lax
> | arm-linux-gnueabi-libtool: link: ( cd ".libs" && rm -f "
> libsystemd-networkd-core.la" && ln -s "../libsystemd-networkd-core.la" "
> libsystemd-networkd-core.la" )
> | make[1]: *** [all-recursive] Error 1
> | make: *** [all] Error 2
> | ERROR: oe_runmake failed
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_compile (log file is located at
> /ARAGO/BUILT-external-linaro-toolchain/work/cortexa8t2hf-vfp-neon-linux-gnueabi/systemd/1_211+gitAUTOINC+3a450ec5c6-r0/temp/log.do_compile.13883)
>
> My system configuration is:
> Build Configuration:
> BB_VERSION        = "1.26.0"
> BUILD_SYS         = "x86_64-linux"
> NATIVELSBSTRING   = "Ubuntu-14.04"
> TARGET_SYS        = "arm-linux-gnueabi"
> MACHINE           = "am335x-evm"
> DISTRO            = "arago"
> DISTRO_VERSION    = "2015.05"
> TUNE_FEATURES     = "armv7a vfp thumb neon callconvention-hard cortexa8"
> TARGET_FPU        = "vfp-neon"
> meta-arago-distro
> meta-arago-extras = "daisy:91ff756d1b089f2c6d70a907419550314e2a6a28"
> meta-qt5          = "master:9925146ee780e7a1df8bf2bc958619b7cfdae690"
> toolchain-layer
> meta-networking
> meta-ruby
> meta-oe
> meta-initramfs
> meta-webserver    = "daisy:d3d14d3fcca7fcde362cf0b31411dc4eea6d20aa"
> meta-ti           = "daisy:b812d89ed4e9a64f60a279f3fd26f91d22d17647"
> meta-linaro-toolchain = "daisy:06008235ca752fea678953e85adaa29a491d246b"
> meta              = "daisy:5a577ec878a15f3caaf4893b819825ffb8c81266"
>
> Thanks,
> Matti
>

--047d7b414478c65c1d0518a1e655
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div>Some additions:<br></div>Error takes p=
lace when compiling git/src/udev/udev-builtin-kmod.c with message:<br>git/s=
rc/udev/udev-builtin-kmod.c:71: error: undefined reference to &#39;udev_mai=
n_log&#39;<br><br></div>Requested symbol is defined both in git/src/udev/ud=
evadm.c, git/src/udev/udevd.c and git/src/test/test-udev.c. It is also decl=
ared in git/src/udev/udev.h. <br>udevadm.o, udevd.o and test-udev.o can all=
 be found from build/src/udev folder. So, most like there is some kind depe=
ndency problem in autotools settings.<br><br></div>Thanks,<br></div>Matti<b=
r></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">2015-06-1=
6 8:40 GMT+03:00 matti kaasinen <span dir=3D"ltr">&lt;<a href=3D"mailto:mat=
ti.kaasinen@gmail.com" target=3D"_blank">matti.kaasinen@gmail.com</a>&gt;</=
span>:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div>Hi!<br><br><=
/div>I get following error listing from <a href=3D"http://systemd_211.bb" t=
arget=3D"_blank">systemd_211.bb</a> run:<br><div><div><br>| arm-linux-gnuea=
bi-libtool: link: arm-linux-gnueabihf-ranlib .libs/libsystemd-core.a<br>| a=
rm-linux-gnueabi-libtool: link: rm -fr .libs/libsystemd-core.lax<br>| arm-l=
inux-gnueabi-libtool: link: ( cd &quot;.libs&quot; &amp;&amp; rm -f &quot;<=
a href=3D"http://libsystemd-core.la" target=3D"_blank">libsystemd-core.la</=
a>&quot; &amp;&amp; ln -s &quot;../<a href=3D"http://libsystemd-core.la" ta=
rget=3D"_blank">libsystemd-core.la</a>&quot; &quot;<a href=3D"http://libsys=
temd-core.la" target=3D"_blank">libsystemd-core.la</a>&quot; )<br>| arm-lin=
ux-gnueabi-libtool: link: arm-linux-gnueabihf-ranlib .libs/libsystemd-netwo=
rkd-core.a<br>| arm-linux-gnueabi-libtool: link: rm -fr .libs/libsystemd-ne=
tworkd-core.lax .libs/libsystemd-networkd-core.lax<br>| arm-linux-gnueabi-l=
ibtool: link: ( cd &quot;.libs&quot; &amp;&amp; rm -f &quot;<a href=3D"http=
://libsystemd-networkd-core.la" target=3D"_blank">libsystemd-networkd-core.=
la</a>&quot; &amp;&amp; ln -s &quot;../<a href=3D"http://libsystemd-network=
d-core.la" target=3D"_blank">libsystemd-networkd-core.la</a>&quot; &quot;<a=
 href=3D"http://libsystemd-networkd-core.la" target=3D"_blank">libsystemd-n=
etworkd-core.la</a>&quot; )<br>| make[1]: *** [all-recursive] Error 1<br>| =
make: *** [all] Error 2<br>| ERROR: oe_runmake failed<br>| WARNING: exit co=
de 1 from a shell command.<br>| ERROR: Function failed: do_compile (log fil=
e is located at /ARAGO/BUILT-external-linaro-toolchain/work/cortexa8t2hf-vf=
p-neon-linux-gnueabi/systemd/1_211+gitAUTOINC+3a450ec5c6-r0/temp/log.do_com=
pile.13883)<br><br></div><div>My system configuration is:<br>Build Configur=
ation:<br>BB_VERSION=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;1.=
26.0&quot;<br>BUILD_SYS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=
 &quot;x86_64-linux&quot;<br>NATIVELSBSTRING=C2=A0=C2=A0 =3D &quot;Ubuntu-1=
4.04&quot;<br>TARGET_SYS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quo=
t;arm-linux-gnueabi&quot;<br>MACHINE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 =3D &quot;am335x-evm&quot;<br>DISTRO=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;arago&quot;<b=
r>DISTRO_VERSION=C2=A0=C2=A0=C2=A0 =3D &quot;2015.05&quot;<br>TUNE_FEATURES=
=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;armv7a vfp thumb neon callconvention-har=
d cortexa8&quot;<br>TARGET_FPU=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=3D &quot;vfp-neon&quot;<br>meta-arago-distro <br>meta-arago-extras =3D &qu=
ot;daisy:91ff756d1b089f2c6d70a907419550314e2a6a28&quot;<br>meta-qt5=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;master:9925146ee=
780e7a1df8bf2bc958619b7cfdae690&quot;<br>toolchain-layer=C2=A0=C2=A0 <br>me=
ta-networking=C2=A0=C2=A0 <br>meta-ruby=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 <br>meta-oe=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 <br>meta-initramfs=C2=A0=C2=A0=C2=A0 <br>meta-webserver=C2=A0=C2=
=A0=C2=A0 =3D &quot;daisy:d3d14d3fcca7fcde362cf0b31411dc4eea6d20aa&quot;<br=
>meta-ti=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &q=
uot;daisy:b812d89ed4e9a64f60a279f3fd26f91d22d17647&quot;<br>meta-linaro-too=
lchain =3D &quot;daisy:06008235ca752fea678953e85adaa29a491d246b&quot;<br>me=
ta=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 =3D &quot;daisy:5a577ec878a15f3caaf4893b819825ffb8c81266&quot;<br><b=
r></div><div>Thanks,<br></div><div>Matti<br></div></div></div>
</blockquote></div><br></div>

--047d7b414478c65c1d0518a1e655--
