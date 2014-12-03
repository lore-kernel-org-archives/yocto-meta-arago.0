Return-Path: <sujith.h@gmail.com>
Received: from mail-qa0-f42.google.com (mail-qa0-f42.google.com
	[209.85.216.42])
	by arago-project.org (Postfix) with ESMTPS id E5E955298D
	for <meta-arago@arago-project.org>;
	Wed,  3 Dec 2014 10:09:12 +0000 (UTC)
Received: by mail-qa0-f42.google.com with SMTP id j7so10276566qaq.29
	for <meta-arago@arago-project.org>;
	Wed, 03 Dec 2014 02:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=vbQpYL4NIhrIIOV4Q+Gcr8O5Yyyka2oSGZJCVaZKl/I=;
	b=OYOMDEiNWVB6yAOJ0jI9P/SY/o07rgB5JVDpTK5ghDcEM2R+p0p1RZNXI00eMcpv31
	JdlfTvpeM/j0pF2Cqw4DbvGN2UB1xVedODyQ+eTfgDg7JbzDsZxjhWHNmgjKdUDCHlHc
	VGPNFFtltg8g6Fk344N8vHwbjFvy8XZp+zeLuyHdTRXOtQbqhKSdcz6bt/17DKEjdhCb
	ScZe5Q1GT5jG/Blu+QlFx8mP638VgsrrSxHXcPlSWWYNzRZhSBXCMwgDl3N31+AE1VrP
	gaS1uKTPN2H40pkynzyrmPer6WA8CTQvX5frLWzSDxQuhWCGgpvx3oA2b1eiYWDBWxv3
	w1mA==
X-Received: by 10.224.67.7 with SMTP id p7mr6576472qai.97.1417601352117; Wed,
	03 Dec 2014 02:09:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.18.114 with HTTP; Wed, 3 Dec 2014 02:08:51 -0800 (PST)
From: sujith h <sujith.h@gmail.com>
Date: Wed, 3 Dec 2014 15:38:51 +0530
Message-ID: <CADyYWL=GZC866S5QWnYj-n1orTMjkeZn0YFak_GJ5PPiAiZDyw@mail.gmail.com>
To: meta-arago@arago-project.org
Subject: Problem while building omap3-sgx-modules-x11_4.09.00.01 recipe
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
X-List-Received-Date: Wed, 03 Dec 2014 10:09:13 -0000
Content-Type: multipart/alternative; boundary=001a11c3daa406b48705094d0985

--001a11c3daa406b48705094d0985
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

When I try to build omap3-sgx-modules-x11_4.09.00.01.bb for core-image-sato
image,

I am getting an error:

DEBUG: Executing shell function do_compile
cp: cannot stat
`/home/sujith/MEL7/masterbranch/boneblack-build/tmp/work/mel_am335x_bonebla=
ck-mel-linux-gnueabi/omap3-sgx-modules-x11/4.09.00.01-r22d/Graphics_SDK_4_0=
9_00_01/GFX_Linux_KM/services4/3rdparty/linux_drm/Kbuild_3.3':
No such
file or directory
NOTE: make -j16 -e MAKEFLAGS=3D BUILD=3Drelease TI_PLATFORM=3Dti335x
SUPPORT_XORG=3D1
make -C
/home/sujith/MEL7/masterbranch/boneblack-build/tmp/sysroots/mel-am335x-bone=
black/usr/src/kernel
M=3D`pwd`
make[1]: Entering directory
`/home/sujith/MEL7/masterbranch/boneblack-build/tmp/sysroots/mel-am335x-bon=
eblack/usr/src/kernel'
  LD
/home/sujith/MEL7/masterbranch/boneblack-build/tmp/work/mel_am335x_boneblac=
k-mel-linux-gnueabi/omap3-sgx-modules-x11/4.09.00.01-r22d/Graphics_SDK_4_09=
_00_01/GFX_Linux_KM/services4/3rdparty/bufferclass_ti/built-in.o
  CC [M]
/home/sujith/MEL7/masterbranch/boneblack-build/tmp/work/mel_am335x_boneblac=
k-mel-linux-gnueabi/omap3-sgx-modules-x11/4.09.00.01-r22d/Graphics_SDK_4_09=
_00_01/GFX_Linux_KM/services4/3rdparty/bufferclass_ti/bc_cat.o
  LD [M]
/home/sujith/MEL7/masterbranch/boneblack-build/tmp/work/mel_am335x_boneblac=
k-mel-linux-gnueabi/omap3-sgx-modules-x11/4.09.00.01-r22d/Graphics_SDK_4_09=
_00_01/GFX_Linux_KM/services4/3rdparty/bufferclass_ti/bufferclass_ti.o
  LD
/home/sujith/MEL7/masterbranch/boneblack-build/tmp/work/mel_am335x_boneblac=
k-mel-linux-gnueabi/omap3-sgx-modules-x11/4.09.00.01-r22d/Graphics_SDK_4_09=
_00_01/GFX_Linux_KM/services4/3rdparty/linux_drm/built-in.o
  CC [M]
/home/sujith/MEL7/masterbranch/boneblack-build/tmp/work/mel_am335x_boneblac=
k-mel-linux-gnueabi/omap3-sgx-modules-x11/4.09.00.01-r22d/Graphics_SDK_4_09=
_00_01/GFX_Linux_KM/services4/3rdparty/linux_drm/pvr_drm_stubs.o
  CC [M]
/home/sujith/MEL7/masterbranch/boneblack-build/tmp/work/mel_am335x_boneblac=
k-mel-linux-gnueabi/omap3-sgx-modules-x11/4.09.00.01-r22d/Graphics_SDK_4_09=
_00_01/GFX_Linux_KM/services4/3rdparty/linux_drm/drm_auth.o
  CC [M]
/home/sujith/MEL7/masterbranch/boneblack-build/tmp/work/mel_am335x_boneblac=
k-mel-linux-gnueabi/omap3-sgx-modules-x11/4.09.00.01-r22d/Graphics_SDK_4_09=
_00_01/GFX_Linux_KM/services4/3rdparty/linux_drm/drm_bufs.o
  CC [M]
/home/sujith/MEL7/masterbranch/boneblack-build/tmp/work/mel_am335x_boneblac=
k-mel-linux-gnueabi/omap3-sgx-modules-x11/4.09.00.01-r22d/Graphics_SDK_4_09=
_00_01/GFX_Linux_KM/services4/3rdparty/linux_drm/drm_cache.o
  CC [M]
/home/sujith/MEL7/masterbranch/boneblack-build/tmp/work/mel_am335x_boneblac=
k-mel-linux-gnueabi/omap3-sgx-modules-x11/4.09.00.01-r22d/Graphics_SDK_4_09=
_00_01/GFX_Linux_KM/services4/3rdparty/linux_drm/drm_context.o
  CC [M]
/home/sujith/MEL7/masterbranch/boneblack-build/tmp/work/mel_am335x_boneblac=
k-mel-linux-gnueabi/omap3-sgx-modules-x11/4.09.00.01-r22d/Graphics_SDK_4_09=
_00_01/GFX_Linux_KM/services4/3rdparty/linux_drm/drm_dma.o
  CC [M]
/home/sujith/MEL7/masterbranch/boneblack-build/tmp/work/mel_am335x_boneblac=
k-mel-linux-gnueabi/omap3-sgx-modules-x11/4.09.00.01-r22d/Graphics_SDK_4_09=
_00_01/GFX_Linux_KM/services4/3rdparty/linux_drm/drm_drv.o
  CC [M]
/home/sujith/MEL7/masterbranch/boneblack-build/tmp/work/mel_am335x_boneblac=
k-mel-linux-gnueabi/omap3-sgx-modules-x11/4.09.00.01-r22d/Graphics_SDK_4_09=
_00_01/GFX_Linux_KM/services4/3rdparty/linux_drm/drm_fops.o
  CC [M]
/home/sujith/MEL7/masterbranch/boneblack-build/tmp/work/mel_am335x_boneblac=
k-mel-linux-gnueabi/omap3-sgx-modules-x11/4.09.00.01-r22d/Graphics_SDK_4_09=
_00_01/GFX_Linux_KM/services4/3rdparty/linux_drm/drm_gem.o
  CC [M]
/home/sujith/MEL7/masterbranch/boneblack-build/tmp/work/mel_am335x_boneblac=
k-mel-linux-gnueabi/omap3-sgx-modules-x11/4.09.00.01-r22d/Graphics_SDK_4_09=
_00_01/GFX_Linux_KM/services4/3rdparty/linux_drm/drm_ioctl.o
  CC [M]
/home/sujith/MEL7/masterbranch/boneblack-build/tmp/work/mel_am335x_boneblac=
k-mel-linux-gnueabi/omap3-sgx-modules-x11/4.09.00.01-r22d/Graphics_SDK_4_09=
_00_01/GFX_Linux_KM/services4/3rdparty/linux_drm/drm_irq.o
  CC [M]
/home/sujith/MEL7/masterbranch/boneblack-build/tmp/work/mel_am335x_boneblac=
k-mel-linux-gnueabi/omap3-sgx-modules-x11/4.09.00.01-r22d/Graphics_SDK_4_09=
_00_01/GFX_Linux_KM/services4/3rdparty/linux_drm/drm_lock.o
  CC [M]
/home/sujith/MEL7/masterbranch/boneblack-build/tmp/work/mel_am335x_boneblac=
k-mel-linux-gnueabi/omap3-sgx-modules-x11/4.09.00.01-r22d/Graphics_SDK_4_09=
_00_01/GFX_Linux_KM/services4/3rdparty/linux_drm/drm_memory.o
make[3]: *** No rule to make target
`/home/sujith/MEL7/masterbranch/boneblack-build/tmp/work/mel_am335x_bonebla=
ck-mel-linux-gnueabi/omap3-sgx-modules-x11/4.09.00.01-r22d/Graphics_SDK_4_0=
9_00_01/GFX_Linux_KM/services4/3rdparty/linux_drm/drm_proc.o',
needed by
`/home/sujith/MEL7/masterbranch/boneblack-build/tmp/work/mel_am335x_bonebla=
ck-mel-linux-gnueabi/omap3-sgx-modules-x11/4.09.00.01-r22d/Graphics_SDK_4_0=
9_00_01/GFX_Linux_KM/services4/3rdparty/linux_drm/drm.o'.
Stop.
make[2]: ***
[/home/sujith/MEL7/masterbranch/boneblack-build/tmp/work/mel_am335x_bonebla=
ck-mel-linux-gnueabi/omap3-sgx-modules-x11/4.09.00.01-r22d/Graphics_SDK_4_0=
9_00_01/GFX_Linux_KM/services4/3rdparty/linux_drm]
Error 2
make[1]: ***
[_module_/home/sujith/MEL7/masterbranch/boneblack-build/tmp/work/mel_am335x=
_boneblack-mel-linux-gnueabi/omap3-sgx-modules-x11/4.09.00.01-r22d/Graphics=
_SDK_4_09_00_01/GFX_Linux_KM]
Error 2
make[1]: Leaving directory
`/home/sujith/MEL7/masterbranch/boneblack-build/tmp/sysroots/mel-am335x-bon=
eblack/usr/src/kernel'
make: *** [all] Error 2
ERROR: oe_runmake failed


The kernel version that I use is 3.14.25. Is this recipe valid for kernel
version 3.14? Any helping hand would be much appreciated.

Thanks,
Sujith H

--=20
=E0=B4=B8=E0=B5=81=E0=B4=9C=E0=B4=BF=E0=B4=A4=E0=B5=8D =E0=B4=B9=E0=B4=B0=
=E0=B4=BF=E0=B4=A6=E0=B4=BE=E0=B4=B8=E0=B4=A8=E0=B5=8D
Bangalore
<Project>Contributor to KDE project
http://fci.wikia.com/wiki/Anti-DRM-Campaign
<Blog> http://sujithh.info

--001a11c3daa406b48705094d0985
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hi,<br><br></div>When I try to build <a href=3D"=
http://omap3-sgx-modules-x11_4.09.00.01.bb">omap3-sgx-modules-x11_4.09.00.0=
1.bb</a> for core-image-sato image, <br><br>I am getting an error:<br><br>D=
EBUG: Executing shell function do_compile<br>cp: cannot stat `/home/sujith/=
MEL7/masterbranch/boneblack-build/tmp/work/mel_am335x_boneblack-mel-linux-g=
nueabi/omap3-sgx-modules-x11/4.09.00.01-r22d/Graphics_SDK_4_09_00_01/GFX_Li=
nux_KM/services4/3rdparty/linux_drm/Kbuild_3.3&#39;: No such <br>file or di=
rectory<br>NOTE: make -j16 -e MAKEFLAGS=3D BUILD=3Drelease TI_PLATFORM=3Dti=
335x SUPPORT_XORG=3D1<br>make -C /home/sujith/MEL7/masterbranch/boneblack-b=
uild/tmp/sysroots/mel-am335x-boneblack/usr/src/kernel M=3D`pwd` <br>make[1]=
: Entering directory `/home/sujith/MEL7/masterbranch/boneblack-build/tmp/sy=
sroots/mel-am335x-boneblack/usr/src/kernel&#39;<br>=C2=A0 LD=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 /home/sujith/MEL7/masterbranch/boneblack-build/tmp/work/mel=
_am335x_boneblack-mel-linux-gnueabi/omap3-sgx-modules-x11/4.09.00.01-r22d/G=
raphics_SDK_4_09_00_01/GFX_Linux_KM/services4/3rdparty/bufferclass_ti/built=
-in.o<br>=C2=A0 CC [M]=C2=A0 /home/sujith/MEL7/masterbranch/boneblack-build=
/tmp/work/mel_am335x_boneblack-mel-linux-gnueabi/omap3-sgx-modules-x11/4.09=
.00.01-r22d/Graphics_SDK_4_09_00_01/GFX_Linux_KM/services4/3rdparty/bufferc=
lass_ti/bc_cat.o<br>=C2=A0 LD [M]=C2=A0 /home/sujith/MEL7/masterbranch/bone=
black-build/tmp/work/mel_am335x_boneblack-mel-linux-gnueabi/omap3-sgx-modul=
es-x11/4.09.00.01-r22d/Graphics_SDK_4_09_00_01/GFX_Linux_KM/services4/3rdpa=
rty/bufferclass_ti/bufferclass_ti.o<br>=C2=A0 LD=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 /home/sujith/MEL7/masterbranch/boneblack-build/tmp/work/mel_am335x_bone=
black-mel-linux-gnueabi/omap3-sgx-modules-x11/4.09.00.01-r22d/Graphics_SDK_=
4_09_00_01/GFX_Linux_KM/services4/3rdparty/linux_drm/built-in.o<br>=C2=A0 C=
C [M]=C2=A0 /home/sujith/MEL7/masterbranch/boneblack-build/tmp/work/mel_am3=
35x_boneblack-mel-linux-gnueabi/omap3-sgx-modules-x11/4.09.00.01-r22d/Graph=
ics_SDK_4_09_00_01/GFX_Linux_KM/services4/3rdparty/linux_drm/pvr_drm_stubs.=
o<br>=C2=A0 CC [M]=C2=A0 /home/sujith/MEL7/masterbranch/boneblack-build/tmp=
/work/mel_am335x_boneblack-mel-linux-gnueabi/omap3-sgx-modules-x11/4.09.00.=
01-r22d/Graphics_SDK_4_09_00_01/GFX_Linux_KM/services4/3rdparty/linux_drm/d=
rm_auth.o<br>=C2=A0 CC [M]=C2=A0 /home/sujith/MEL7/masterbranch/boneblack-b=
uild/tmp/work/mel_am335x_boneblack-mel-linux-gnueabi/omap3-sgx-modules-x11/=
4.09.00.01-r22d/Graphics_SDK_4_09_00_01/GFX_Linux_KM/services4/3rdparty/lin=
ux_drm/drm_bufs.o<br>=C2=A0 CC [M]=C2=A0 /home/sujith/MEL7/masterbranch/bon=
eblack-build/tmp/work/mel_am335x_boneblack-mel-linux-gnueabi/omap3-sgx-modu=
les-x11/4.09.00.01-r22d/Graphics_SDK_4_09_00_01/GFX_Linux_KM/services4/3rdp=
arty/linux_drm/drm_cache.o<br>=C2=A0 CC [M]=C2=A0 /home/sujith/MEL7/masterb=
ranch/boneblack-build/tmp/work/mel_am335x_boneblack-mel-linux-gnueabi/omap3=
-sgx-modules-x11/4.09.00.01-r22d/Graphics_SDK_4_09_00_01/GFX_Linux_KM/servi=
ces4/3rdparty/linux_drm/drm_context.o<br>=C2=A0 CC [M]=C2=A0 /home/sujith/M=
EL7/masterbranch/boneblack-build/tmp/work/mel_am335x_boneblack-mel-linux-gn=
ueabi/omap3-sgx-modules-x11/4.09.00.01-r22d/Graphics_SDK_4_09_00_01/GFX_Lin=
ux_KM/services4/3rdparty/linux_drm/drm_dma.o<br>=C2=A0 CC [M]=C2=A0 /home/s=
ujith/MEL7/masterbranch/boneblack-build/tmp/work/mel_am335x_boneblack-mel-l=
inux-gnueabi/omap3-sgx-modules-x11/4.09.00.01-r22d/Graphics_SDK_4_09_00_01/=
GFX_Linux_KM/services4/3rdparty/linux_drm/drm_drv.o<br>=C2=A0 CC [M]=C2=A0 =
/home/sujith/MEL7/masterbranch/boneblack-build/tmp/work/mel_am335x_boneblac=
k-mel-linux-gnueabi/omap3-sgx-modules-x11/4.09.00.01-r22d/Graphics_SDK_4_09=
_00_01/GFX_Linux_KM/services4/3rdparty/linux_drm/drm_fops.o<br>=C2=A0 CC [M=
]=C2=A0 /home/sujith/MEL7/masterbranch/boneblack-build/tmp/work/mel_am335x_=
boneblack-mel-linux-gnueabi/omap3-sgx-modules-x11/4.09.00.01-r22d/Graphics_=
SDK_4_09_00_01/GFX_Linux_KM/services4/3rdparty/linux_drm/drm_gem.o<br>=C2=
=A0 CC [M]=C2=A0 /home/sujith/MEL7/masterbranch/boneblack-build/tmp/work/me=
l_am335x_boneblack-mel-linux-gnueabi/omap3-sgx-modules-x11/4.09.00.01-r22d/=
Graphics_SDK_4_09_00_01/GFX_Linux_KM/services4/3rdparty/linux_drm/drm_ioctl=
.o<br>=C2=A0 CC [M]=C2=A0 /home/sujith/MEL7/masterbranch/boneblack-build/tm=
p/work/mel_am335x_boneblack-mel-linux-gnueabi/omap3-sgx-modules-x11/4.09.00=
.01-r22d/Graphics_SDK_4_09_00_01/GFX_Linux_KM/services4/3rdparty/linux_drm/=
drm_irq.o<br>=C2=A0 CC [M]=C2=A0 /home/sujith/MEL7/masterbranch/boneblack-b=
uild/tmp/work/mel_am335x_boneblack-mel-linux-gnueabi/omap3-sgx-modules-x11/=
4.09.00.01-r22d/Graphics_SDK_4_09_00_01/GFX_Linux_KM/services4/3rdparty/lin=
ux_drm/drm_lock.o<br>=C2=A0 CC [M]=C2=A0 /home/sujith/MEL7/masterbranch/bon=
eblack-build/tmp/work/mel_am335x_boneblack-mel-linux-gnueabi/omap3-sgx-modu=
les-x11/4.09.00.01-r22d/Graphics_SDK_4_09_00_01/GFX_Linux_KM/services4/3rdp=
arty/linux_drm/drm_memory.o<br>make[3]: *** No rule to make target `/home/s=
ujith/MEL7/masterbranch/boneblack-build/tmp/work/mel_am335x_boneblack-mel-l=
inux-gnueabi/omap3-sgx-modules-x11/4.09.00.01-r22d/Graphics_SDK_4_09_00_01/=
GFX_Linux_KM/services4/3rdparty/linux_drm/drm_proc.o&#39;, needed by `/home=
/sujith/MEL7/masterbranch/boneblack-build/tmp/work/mel_am335x_boneblack-mel=
-linux-gnueabi/omap3-sgx-modules-x11/4.09.00.01-r22d/Graphics_SDK_4_09_00_0=
1/GFX_Linux_KM/services4/3rdparty/linux_drm/drm.o&#39;.=C2=A0 Stop.<br>make=
[2]: *** [/home/sujith/MEL7/masterbranch/boneblack-build/tmp/work/mel_am335=
x_boneblack-mel-linux-gnueabi/omap3-sgx-modules-x11/4.09.00.01-r22d/Graphic=
s_SDK_4_09_00_01/GFX_Linux_KM/services4/3rdparty/linux_drm] Error 2<br>make=
[1]: *** [_module_/home/sujith/MEL7/masterbranch/boneblack-build/tmp/work/m=
el_am335x_boneblack-mel-linux-gnueabi/omap3-sgx-modules-x11/4.09.00.01-r22d=
/Graphics_SDK_4_09_00_01/GFX_Linux_KM] Error 2<br>make[1]: Leaving director=
y `/home/sujith/MEL7/masterbranch/boneblack-build/tmp/sysroots/mel-am335x-b=
oneblack/usr/src/kernel&#39;<br>make: *** [all] Error 2<br>ERROR: oe_runmak=
e failed<br><br><br></div>The kernel version that I use is 3.14.25. Is this=
 recipe valid for kernel version 3.14? Any helping hand would be much appre=
ciated.<br><br>Thanks,<br>Sujith H<br clear=3D"all"><div><div><div><br>-- <=
br><div class=3D"gmail_signature">=E0=B4=B8=E0=B5=81=E0=B4=9C=E0=B4=BF=E0=
=B4=A4=E0=B5=8D =E0=B4=B9=E0=B4=B0=E0=B4=BF=E0=B4=A6=E0=B4=BE=E0=B4=B8=E0=
=B4=A8=E0=B5=8D<br>Bangalore<br>&lt;Project&gt;Contributor to KDE project<b=
r><a href=3D"http://fci.wikia.com/wiki/Anti-DRM-Campaign" target=3D"_blank"=
>http://fci.wikia.com/wiki/Anti-DRM-Campaign</a><br>&lt;Blog&gt; <a href=3D=
"http://sujithh.info" target=3D"_blank">http://sujithh.info</a><br></div>
</div></div></div></div>

--001a11c3daa406b48705094d0985--
