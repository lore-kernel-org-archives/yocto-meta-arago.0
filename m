Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-ob0-f173.google.com (mail-ob0-f173.google.com
	[209.85.214.173])
	by arago-project.org (Postfix) with ESMTPS id 148885297D
	for <meta-arago@arago-project.org>;
	Thu, 30 Jul 2015 04:15:38 +0000 (UTC)
Received: by obdeg2 with SMTP id eg2so22623027obd.0
	for <meta-arago@arago-project.org>;
	Wed, 29 Jul 2015 21:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=+JJanErGxjcHYkq0KwyMzLBCugYeB6O52HeMeqggdLE=;
	b=PChPJzdV/EBi3mLdVoKCssrSqJQtQhOoHkm1AiqrexJMFGa1jLpr/gvn/FNvG/swSF
	htqChilRc+LVIRdldzcDPIb3IKCM+UvtMO9P5HreC8kTZk/OZYzy9taoafnW9Uto/VpE
	Lv/X1p9XHv9ZYfwNyt/ZW013+BaDxvV3Wi4IbcYEkhQiFWR5MfwKfj9pWOmO76lyXZVx
	XOoapQgwbYkHJhumsCcADUqId/JWJAf5SXIvn+zU2tKF7C9gutcGEXRzuODs800QZUiT
	1NJCjzT8VeWmo/PpV+ISWl3MxE9ZFwMm6TTHjeqxWX7qZwmh01citUVNC0MXiLSNnKP9
	dz2g==
X-Received: by 10.183.1.10 with SMTP id bc10mr45400822obd.2.1438229737455;
	Wed, 29 Jul 2015 21:15:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.197.148 with HTTP; Wed, 29 Jul 2015 21:15:18 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Thu, 30 Jul 2015 16:15:18 +1200
Message-ID: <CADySD0FMoMZwtM2_oKNbEfobgXxXcOYdK+cqpkgy9WQRZd3Lfw@mail.gmail.com>
To: meta-arago@arago-project.org
Subject: gcc_linaro-4.9.bb do_install error
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
X-List-Received-Date: Thu, 30 Jul 2015 04:15:38 -0000
Content-Type: multipart/alternative; boundary=001a1134af409b5416051c0ff48c

--001a1134af409b5416051c0ff48c
Content-Type: text/plain; charset=UTF-8

Hi,

I am trying to build tisdk-rootfs-image using "arago-fido-config.txt" and
 I get following error :

| make[1]: Leaving directory
`/home/ankur/arago-fido/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa8hf-vfp-neon-linux-gnueabi/gcc/linaro-4.9-r2015.03/gcc-linaro-4.9-2015.03/build.arm-linux-gnueabi.arm-linux-gnueabi/gcc'
| install: cannot stat
'/home/ankur/arago-fido/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/i686-linux/usr/lib/arm-linux-gnueabi/gcc/arm-linux-gnueabi/4.9.3/include/unwind.h':
No such file or directory
| WARNING:
/home/ankur/arago-fido/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa8hf-vfp-neon-linux-gnueabi/gcc/linaro-4.9-r2015.03/temp/run.do_install.3588:1
exit 1 from
|   install
/home/ankur/arago-fido/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/i686-linux/usr/lib/arm-linux-gnueabi/gcc/arm-linux-gnueabi/4.9.3/include/unwind.h
/home/ankur/arago-fido/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa8hf-vfp-neon-linux-gnueabi/gcc/linaro-4.9-r2015.03/image/usr/lib/gcc/arm-linux-gnueabi/4.9.3/include/
| ERROR: Function failed: do_install (log file is located at
/home/ankur/arago-fido/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa8hf-vfp-neon-linux-gnueabi/gcc/linaro-4.9-r2015.03/temp/log.do_install.3588)
ERROR: Task 4107
(/home/ankur/arago-fido/oe-layersetup/sources/meta-linaro/meta-linaro-toolchain/recipes-devtools/gcc/
gcc_linaro-4.9.bb, do_install) failed with exit code '1'

My build configuration is :

BB_VERSION        = "1.26.0"
BUILD_SYS         = "i686-linux"
NATIVELSBSTRING   = "Ubuntu-14.04"
TARGET_SYS        = "arm-linux-gnueabi"
MACHINE           = "am335x-evm"
DISTRO            = "arago"
DISTRO_VERSION    = "2015.07"
TUNE_FEATURES     = "arm armv7a vfp thumb neon callconvention-hard cortexa8"
TARGET_FPU        = "vfp-neon"
meta-arago-distro
meta-arago-extras = "master:5159e5f692d6faf08be8599d77479af885b78228"
meta-qt5          = "master:bafd17e3515b4dc892c7c4c386abf2247e61f090"
meta-networking
meta-ruby
meta-python
meta-oe           = "fido:10d3c8f85280a0bf867a8e4f84bcda81c290d28e"
meta-ti           = "fido:3e4278b4ecf66355c3d34e4a160f33b6a6e4352c"
meta-linaro-toolchain = "fido:ad600ee417d1ff6c266fb9cb7aee32d724533f98"
meta              = "fido:1c916ddebc3009d3817359144b02745c3ecbd5c4"


thanks
Ankur

--001a1134af409b5416051c0ff48c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:georgia,=
serif;font-size:small;color:#333399">Hi,</div><div class=3D"gmail_default" =
style=3D"font-family:georgia,serif;font-size:small;color:#333399"><br></div=
><div class=3D"gmail_default" style=3D"font-family:georgia,serif;font-size:=
small;color:#333399">I am trying to build tisdk-rootfs-image using &quot;ar=
ago-fido-config.txt&quot; and =C2=A0I get following error :</div><div class=
=3D"gmail_default" style=3D"font-family:georgia,serif;font-size:small;color=
:#333399"><br></div><div class=3D"gmail_default" style=3D"font-family:georg=
ia,serif;font-size:small;color:#333399"><div class=3D"gmail_default">| make=
[1]: Leaving directory `/home/ankur/arago-fido/oe-layersetup/build/arago-tm=
p-external-linaro-toolchain/work/cortexa8hf-vfp-neon-linux-gnueabi/gcc/lina=
ro-4.9-r2015.03/gcc-linaro-4.9-2015.03/build.arm-linux-gnueabi.arm-linux-gn=
ueabi/gcc&#39;</div><div class=3D"gmail_default">| install: cannot stat &#3=
9;/home/ankur/arago-fido/oe-layersetup/build/arago-tmp-external-linaro-tool=
chain/sysroots/i686-linux/usr/lib/arm-linux-gnueabi/gcc/arm-linux-gnueabi/4=
.9.3/include/unwind.h&#39;: No such file or directory</div><div class=3D"gm=
ail_default">| WARNING: /home/ankur/arago-fido/oe-layersetup/build/arago-tm=
p-external-linaro-toolchain/work/cortexa8hf-vfp-neon-linux-gnueabi/gcc/lina=
ro-4.9-r2015.03/temp/run.do_install.3588:1 exit 1 from</div><div class=3D"g=
mail_default">| =C2=A0 install /home/ankur/arago-fido/oe-layersetup/build/a=
rago-tmp-external-linaro-toolchain/sysroots/i686-linux/usr/lib/arm-linux-gn=
ueabi/gcc/arm-linux-gnueabi/4.9.3/include/unwind.h /home/ankur/arago-fido/o=
e-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa8hf-vfp-=
neon-linux-gnueabi/gcc/linaro-4.9-r2015.03/image/usr/lib/gcc/arm-linux-gnue=
abi/4.9.3/include/</div><div class=3D"gmail_default">| ERROR: Function fail=
ed: do_install (log file is located at /home/ankur/arago-fido/oe-layersetup=
/build/arago-tmp-external-linaro-toolchain/work/cortexa8hf-vfp-neon-linux-g=
nueabi/gcc/linaro-4.9-r2015.03/temp/log.do_install.3588)</div><div class=3D=
"gmail_default">ERROR: Task 4107 (/home/ankur/arago-fido/oe-layersetup/sour=
ces/meta-linaro/meta-linaro-toolchain/recipes-devtools/gcc/<a href=3D"http:=
//gcc_linaro-4.9.bb">gcc_linaro-4.9.bb</a>, do_install) failed with exit co=
de &#39;1&#39;</div><div class=3D"gmail_default"><br></div><div class=3D"gm=
ail_default">My build configuration is :</div><div class=3D"gmail_default">=
<br></div><div class=3D"gmail_default"><div class=3D"gmail_default">BB_VERS=
ION =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;1.26.0&quot;</div><div class=3D"gm=
ail_default">BUILD_SYS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;i686-linux&quo=
t;</div><div class=3D"gmail_default">NATIVELSBSTRING =C2=A0 =3D &quot;Ubunt=
u-14.04&quot;</div><div class=3D"gmail_default">TARGET_SYS =C2=A0 =C2=A0 =
=C2=A0 =C2=A0=3D &quot;arm-linux-gnueabi&quot;</div><div class=3D"gmail_def=
ault">MACHINE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;am335x-evm&quot;=
</div><div class=3D"gmail_default">DISTRO =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0=3D &quot;arago&quot;</div><div class=3D"gmail_default">DISTRO_VE=
RSION =C2=A0 =C2=A0=3D &quot;2015.07&quot;</div><div class=3D"gmail_default=
">TUNE_FEATURES =C2=A0 =C2=A0 =3D &quot;arm armv7a vfp thumb neon callconve=
ntion-hard cortexa8&quot;</div><div class=3D"gmail_default">TARGET_FPU =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;vfp-neon&quot;</div><div class=3D"gmail_d=
efault">meta-arago-distro=C2=A0</div><div class=3D"gmail_default">meta-arag=
o-extras =3D &quot;master:5159e5f692d6faf08be8599d77479af885b78228&quot;</d=
iv><div class=3D"gmail_default">meta-qt5 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D &quot;master:bafd17e3515b4dc892c7c4c386abf2247e61f090&quot;</div><div c=
lass=3D"gmail_default">meta-networking =C2=A0=C2=A0</div><div class=3D"gmai=
l_default">meta-ruby =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0</div><div class=3D"g=
mail_default">meta-python =C2=A0 =C2=A0 =C2=A0=C2=A0</div><div class=3D"gma=
il_default">meta-oe =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;fido:10d3c=
8f85280a0bf867a8e4f84bcda81c290d28e&quot;</div><div class=3D"gmail_default"=
>meta-ti =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;fido:3e4278b4ecf66355=
c3d34e4a160f33b6a6e4352c&quot;</div><div class=3D"gmail_default">meta-linar=
o-toolchain =3D &quot;fido:ad600ee417d1ff6c266fb9cb7aee32d724533f98&quot;</=
div><div class=3D"gmail_default">meta =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0=3D &quot;fido:1c916ddebc3009d3817359144b02745c3ecbd5c4&quot;<=
/div><div class=3D"gmail_default"><br></div><div class=3D"gmail_default"><b=
r></div><div class=3D"gmail_default">thanks</div><div class=3D"gmail_defaul=
t">Ankur</div></div></div>
</div>

--001a1134af409b5416051c0ff48c--
