Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-vk0-f46.google.com (mail-vk0-f46.google.com
	[209.85.213.46])
	by arago-project.org (Postfix) with ESMTPS id E0F1452A22
	for <meta-arago@arago-project.org>;
	Fri, 20 Nov 2015 22:14:35 +0000 (UTC)
Received: by vkha189 with SMTP id a189so6945416vkh.2
	for <meta-arago@arago-project.org>;
	Fri, 20 Nov 2015 14:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=wUFXWd3DcjPAMyjbVo5Y9Yz5sz8AQVrQuNQjbdjjBhI=;
	b=N7tUVom46pqFdtXD+UxHhLHdkOb71kmhzWO2uI6AJ0bjiLp+13/+kA1A6Dp0N+U/sI
	aTSd7VnO9s+eIJy0VGlo/KQqyQjClf0/C/+/0Kbn54DH7HJcVFKeFfduVhMIyl0Ab8xf
	Qv8ccz0tXbXxe68MJXwvZQWA2KrLlV7QKeSBAALaqvUgpn9qohO7QMvkLiZ/3uSPx3tr
	FsfGQ5cpJJe0IX1Hed7WMYzGyMy3CP4wfaksKZc+UZWYbiN98cBlPdJ1rYixVWuBpQ/F
	Nrv5mY62RdifTy+GZSvcisSzsjHB68WXfb2iY8LGpeX0F1iTfO1XawUXU2XcS294oAw5
	Mcug==
MIME-Version: 1.0
X-Received: by 10.31.183.208 with SMTP id h199mr1805700vkf.44.1448057674957;
	Fri, 20 Nov 2015 14:14:34 -0800 (PST)
Received: by 10.31.166.17 with HTTP; Fri, 20 Nov 2015 14:14:34 -0800 (PST)
Received: by 10.31.166.17 with HTTP; Fri, 20 Nov 2015 14:14:34 -0800 (PST)
In-Reply-To: <CADySD0H0u8_vE6nC4pcuHPcEGDSZCtbTm6RKy+s5u2S1ff3mYg@mail.gmail.com>
References: <CADySD0H0u8_vE6nC4pcuHPcEGDSZCtbTm6RKy+s5u2S1ff3mYg@mail.gmail.com>
Date: Sat, 21 Nov 2015 11:14:34 +1300
Message-ID: <CADySD0H-0W2LxedCqMoofin7RXd5dwDy40MLZUa312cUQ_-2GQ@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: meta-arago@arago-project.org
Subject: Re: QT5.4.1 combobox error when running on AM335x-EVM
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
X-List-Received-Date: Fri, 20 Nov 2015 22:14:36 -0000
Content-Type: multipart/alternative; boundary=001a114394c45493c9052500336c

--001a114394c45493c9052500336c
Content-Type: text/plain; charset=UTF-8

Hi,

Can someone please respond, I am blocked in my project because of this
combobox error.

Thanks
Ankur
On 18-Nov-2015 4:38 pm, "Ankur Tyagi" <ankur.tyagi85@gmail.com> wrote:

> Hi,
>
> When running QT5.4.1 based app, I get following error when I try to use a
> combobox:
>
> QEGLPlatformContext::makeCurrent: eglError: 3002, this: 0x3f5b58
> QEGLPlatformContext::makeCurrent: eglError: 3009, this: 0x3f5b58
>
> I am using meta-arago daisy branch on TI AM335x-EVM. I have also removed
> "x11 and wayland" from distro features.
>
> Any help is appreciated.
>
> My environment is following:
>
> Build Configuration:
> BB_VERSION        = "1.26.0"
> BUILD_SYS         = "i686-linux"
> NATIVELSBSTRING   = "Ubuntu-14.04"
> TARGET_SYS        = "arm-linux-gnueabi"
> MACHINE           = "am335x-evm"
> DISTRO            = "arago"
> DISTRO_VERSION    = "2015.05"
> TUNE_FEATURES     = "armv7a vfp thumb neon callconvention-hard cortexa8"
> TARGET_FPU        = "vfp-neon"
> meta-arago-distro
> meta-arago-extras = "daisy:d607cf64048994eaf2e8bb1687092c65febb27f2"
> meta-qt5          =
> "(detachedfrom17eb158):c6d3e94ff294f39994de85b3fd12ffde8b3f8372"
> toolchain-layer
> meta-networking
> meta-ruby
> meta-oe           = "daisy:d3d14d3fcca7fcde362cf0b31411dc4eea6d20aa"
> meta-ti           = "daisy:70cdadbfb48ef3e7a2596320cdfc626078c1ac34"
> meta-linaro-toolchain = "daisy:06008235ca752fea678953e85adaa29a491d246b"
> meta              = "daisy:e1a2540227250d854d5bba278634bcc9e7572cda"
>
> Following is QT build configuration:
>
>    Configure summary
>
> Building on:
> /home/nws/yocto-daisy-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/i686-linux/usr/lib/qt5/mkspecs/linux-oe-g++
> (arm, CPU features: neon)
> Building for:  linux-oe-g++ (arm, CPU features: neon)
>
> qmake vars .......... OE_QMAKE_AR = arm-linux-gnueabihf-ar OE_QMAKE_CC =
> arm-linux-gnueabihf-gcc  -march=armv7-a -marm -mthumb-interwork
> -mfloat-abi=hard -mfpu=neon -mtune=cortex-a8
> --sysroot=/home/nws/yocto-daisy-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm
> OE_QMAKE_CFLAGS =
>  -isystem/home/nws/gcc-4.7.3/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/arm-linux-gnueabihf/include
>  -fstack-protector -O2 -pipe -g -feliminate-unused-debug-types
> OE_QMAKE_COMPILER = arm-linux-gnueabihf-gcc  -march=armv7-a -marm
> -mthumb-interwork -mfloat-abi=hard -mfpu=neon -mtune=cortex-a8
> --sysroot=/home/nws/yocto-daisy-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm
> OE_QMAKE_CXX = arm-linux-gnueabihf-g++  -march=armv7-a -marm
> -mthumb-interwork -mfloat-abi=hard -mfpu=neon -mtune=cortex-a8
> --sysroot=/home/nws/yocto-daisy-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm
> OE_QMAKE_CXXFLAGS =
>  -isystem/home/nws/gcc-4.7.3/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/arm-linux-gnueabihf/include
>  -fstack-protector -O2 -pipe -g -feliminate-unused-debug-types
> OE_QMAKE_LDFLAGS =
>  -L/home/nws/gcc-4.7.3/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/arm-linux-gnueabihf/lib
> -Wl,-rpath-link,/home/nws/gcc-4.7.3/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/arm-linux-gnueabihf/lib
> -Wl,-O1 -Wl,--hash-style=gnu OE_QMAKE_LINK = arm-linux-gnueabihf-g++
>  -march=armv7-a -marm -mthumb-interwork -mfloat-abi=hard -mfpu=neon
> -mtune=cortex-a8
> --sysroot=/home/nws/yocto-daisy-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm
> OE_QMAKE_STRIP = echo styles += mac fusion windows DEFINES += QT_NO_MTDEV
> QT_CFLAGS_PULSEAUDIO = -D_REENTRANT
> -I/home/nws/yocto-daisy-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/include/glib-2.0
> -I/home/nws/yocto-daisy-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/lib/glib-2.0/include
>  QT_LIBS_PULSEAUDIO = -lpulse-mainloop-glib -lpulse -lglib-2.0
>  QMAKE_INCDIR_LIBUDEV =  QMAKE_LIBS_LIBUDEV = -ludev -lrt  sql-drivers =
>  sql-plugins =  qmake switches .........
>
> Build options:
>   Configuration .......... accessibility audio-backend c++11 clock-gettime
> clock-monotonic compile_examples concurrent cross_compile dbus egl eglfs
> evdev eventfd freetype full-config getaddrinfo getifaddrs harfbuzz inotify
> ipv6ifname large-config largefile libudev linuxfb medium-config
> minimal-config mremap neon opengl opengles2 openssl-linked pcre png
> posix_fallocate pulseaudio qpa qpa reduce_exports release shared silent
> small-config system-jpeg system-png system-zlib
>   Build parts ............  libs tools
>   Mode ................... release
>   Using C++11 ............ yes
>   Using gold linker....... no
>   Using PCH .............. no
>   Target compiler supports:
>     Neon ................. yes
>
> Qt modules and options:
>   Qt D-Bus ............... yes (loading dbus-1 at runtime)
>   Qt Concurrent .......... yes
>   Qt GUI ................. yes
>   Qt Widgets ............. yes
>   Large File ............. yes
>   QML debugging .......... yes
>   Use system proxies ..... no
>
> Support enabled for:
>   Accessibility .......... yes
>   ALSA ................... no
>   CUPS ................... no
>   Evdev .................. yes
>   FontConfig ............. no
>   FreeType ............... qt
>   Glib ................... no
>   GTK theme .............. no
>   HarfBuzz ............... yes (bundled copy)
>   Iconv .................. no
>   ICU .................... no
>   Image formats:
>     GIF .................. yes (plugin, using bundled copy)
>     JPEG ................. yes (plugin, using system library)
>     PNG .................. yes (in QtGui, using system library)
>   journald ............... no
>   mtdev .................. no
>   Networking:
>     getaddrinfo .......... yes
>     getifaddrs ........... yes
>     IPv6 ifname .......... yes
>     OpenSSL .............. yes (linked to the libraries)
>   NIS .................... no
>   OpenGL / OpenVG:
>     EGL .................. yes
>     OpenGL ............... yes (OpenGL ES 2.0+)
>     OpenVG ............... no
>   PCRE ................... yes (bundled copy)
>   pkg-config ............. yes
>   PulseAudio ............. yes
>   QPA backends:
>     DirectFB ............. no
>     EGLFS ................ yes
>     KMS .................. no
>     LinuxFB .............. yes
>     XCB .................. no
>   Session management ..... no
>   SQL drivers:
>     DB2 .................. no
>     InterBase ............ no
>     MySQL ................ no
>     OCI .................. no
>     ODBC ................. no
>     PostgreSQL ........... no
>     SQLite 2 ............. no
>     SQLite ............... no
>     TDS .................. no
>   udev ................... yes
>   xkbcommon .............. no
>   zlib ................... yes (system library)
>
> regards
> Ankur
>

--001a114394c45493c9052500336c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Hi,</p>
<p dir=3D"ltr">Can someone please respond, I am blocked in my project becau=
se of this combobox error.</p>
<p dir=3D"ltr">Thanks<br>
Ankur</p>
<div class=3D"gmail_quote">On 18-Nov-2015 4:38 pm, &quot;Ankur Tyagi&quot; =
&lt;<a href=3D"mailto:ankur.tyagi85@gmail.com">ankur.tyagi85@gmail.com</a>&=
gt; wrote:<br type=3D"attribution"><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=
=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small"><font color=
=3D"#000000" face=3D"verdana, sans-serif">Hi,</font></div><div class=3D"gma=
il_default" style=3D"font-size:small"><font color=3D"#000000" face=3D"verda=
na, sans-serif"><br></font></div><div class=3D"gmail_default" style=3D"font=
-size:small"><font color=3D"#000000" face=3D"verdana, sans-serif">When runn=
ing QT5.4.1 based app, I get following error when I try to use a combobox:<=
/font></div><div class=3D"gmail_default" style=3D"font-size:small"><font co=
lor=3D"#000000" face=3D"verdana, sans-serif"><br></font></div><div class=3D=
"gmail_default" style=3D"font-size:small"><div class=3D"gmail_default" styl=
e=3D"color:rgb(0,0,0);font-family:verdana,sans-serif">QEGLPlatformContext::=
makeCurrent: eglError: 3002, this: 0x3f5b58</div><div class=3D"gmail_defaul=
t" style=3D"color:rgb(0,0,0);font-family:verdana,sans-serif">QEGLPlatformCo=
ntext::makeCurrent: eglError: 3009, this: 0x3f5b58</div><div class=3D"gmail=
_default" style=3D"color:rgb(0,0,0);font-family:verdana,sans-serif"><br></d=
iv><div class=3D"gmail_default" style=3D"color:rgb(0,0,0);font-family:verda=
na,sans-serif">I am using meta-arago daisy branch on TI AM335x-EVM. I have =
also removed &quot;x11 and wayland&quot; from distro features.</div><div cl=
ass=3D"gmail_default" style=3D"color:rgb(0,0,0);font-family:verdana,sans-se=
rif"><br></div><div class=3D"gmail_default" style=3D"color:rgb(0,0,0);font-=
family:verdana,sans-serif">Any help is appreciated.</div><div class=3D"gmai=
l_default" style=3D"color:rgb(0,0,0);font-family:verdana,sans-serif"><br></=
div></div><div class=3D"gmail_default" style=3D"font-size:small"><font colo=
r=3D"#000000" face=3D"verdana, sans-serif">My environment is following:=C2=
=A0</font></div><div class=3D"gmail_default"><font color=3D"#000000" face=
=3D"verdana, sans-serif"><div class=3D"gmail_default" style=3D"font-size:sm=
all"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Build=
 Configuration:</div><div class=3D"gmail_default" style=3D"font-size:small"=
>BB_VERSION =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;1.26.0&quot;</div><div cla=
ss=3D"gmail_default" style=3D"font-size:small">BUILD_SYS =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =3D &quot;i686-linux&quot;</div><div class=3D"gmail_default" sty=
le=3D"font-size:small">NATIVELSBSTRING =C2=A0 =3D &quot;Ubuntu-14.04&quot;<=
/div><div class=3D"gmail_default" style=3D"font-size:small">TARGET_SYS =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;arm-linux-gnueabi&quot;</div><div class=
=3D"gmail_default" style=3D"font-size:small">MACHINE =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =3D &quot;am335x-evm&quot;</div><div class=3D"gmail_default" =
style=3D"font-size:small">DISTRO =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D &quot;arago&quot;</div><div class=3D"gmail_default" style=3D"font-size:=
small">DISTRO_VERSION =C2=A0 =C2=A0=3D &quot;2015.05&quot;</div><div class=
=3D"gmail_default" style=3D"font-size:small">TUNE_FEATURES =C2=A0 =C2=A0 =
=3D &quot;armv7a vfp thumb neon callconvention-hard cortexa8&quot;</div><di=
v class=3D"gmail_default" style=3D"font-size:small">TARGET_FPU =C2=A0 =C2=
=A0 =C2=A0 =C2=A0=3D &quot;vfp-neon&quot;</div><div class=3D"gmail_default"=
 style=3D"font-size:small">meta-arago-distro=C2=A0</div><div class=3D"gmail=
_default" style=3D"font-size:small">meta-arago-extras =3D &quot;daisy:d607c=
f64048994eaf2e8bb1687092c65febb27f2&quot;</div><div class=3D"gmail_default"=
 style=3D"font-size:small">meta-qt5 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &=
quot;(detachedfrom17eb158):c6d3e94ff294f39994de85b3fd12ffde8b3f8372&quot;</=
div><div class=3D"gmail_default" style=3D"font-size:small">toolchain-layer =
=C2=A0=C2=A0</div><div class=3D"gmail_default" style=3D"font-size:small">me=
ta-networking =C2=A0=C2=A0</div><div class=3D"gmail_default" style=3D"font-=
size:small">meta-ruby =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0</div><div class=3D"=
gmail_default" style=3D"font-size:small">meta-oe =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =3D &quot;daisy:d3d14d3fcca7fcde362cf0b31411dc4eea6d20aa&quot;</=
div><div class=3D"gmail_default" style=3D"font-size:small">meta-ti =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;daisy:70cdadbfb48ef3e7a2596320cdfc626=
078c1ac34&quot;</div><div class=3D"gmail_default" style=3D"font-size:small"=
>meta-linaro-toolchain =3D &quot;daisy:06008235ca752fea678953e85adaa29a491d=
246b&quot;</div><div class=3D"gmail_default" style=3D"font-size:small">meta=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;daisy:e1a2540227=
250d854d5bba278634bcc9e7572cda&quot;</div><div style=3D"font-size:small"><b=
r></div><div style=3D"font-size:small">Following is QT build configuration:=
</div><div style=3D"font-size:small"><br></div><div><div>=C2=A0 =C2=A0Confi=
gure summary</div><div><br></div><div>Building on: =C2=A0 /home/nws/yocto-d=
aisy-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/i=
686-linux/usr/lib/qt5/mkspecs/linux-oe-g++ (arm, CPU features: neon)</div><=
div>Building for: =C2=A0linux-oe-g++ (arm, CPU features: neon)</div><div><b=
r></div><div>qmake vars .......... OE_QMAKE_AR =3D arm-linux-gnueabihf-ar O=
E_QMAKE_CC =3D arm-linux-gnueabihf-gcc =C2=A0-march=3Darmv7-a -marm -mthumb=
-interwork -mfloat-abi=3Dhard -mfpu=3Dneon -mtune=3Dcortex-a8 --sysroot=3D/=
home/nws/yocto-daisy-dev/oe-layersetup/build/arago-tmp-external-linaro-tool=
chain/sysroots/am335x-evm OE_QMAKE_CFLAGS =3D =C2=A0-isystem/home/nws/gcc-4=
.7.3/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/arm-linux-gn=
ueabihf/include =C2=A0-fstack-protector -O2 -pipe -g -feliminate-unused-deb=
ug-types OE_QMAKE_COMPILER =3D arm-linux-gnueabihf-gcc =C2=A0-march=3Darmv7=
-a -marm -mthumb-interwork -mfloat-abi=3Dhard -mfpu=3Dneon -mtune=3Dcortex-=
a8 --sysroot=3D/home/nws/yocto-daisy-dev/oe-layersetup/build/arago-tmp-exte=
rnal-linaro-toolchain/sysroots/am335x-evm OE_QMAKE_CXX =3D arm-linux-gnueab=
ihf-g++ =C2=A0-march=3Darmv7-a -marm -mthumb-interwork -mfloat-abi=3Dhard -=
mfpu=3Dneon -mtune=3Dcortex-a8 --sysroot=3D/home/nws/yocto-daisy-dev/oe-lay=
ersetup/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm OE_QM=
AKE_CXXFLAGS =3D =C2=A0-isystem/home/nws/gcc-4.7.3/gcc-linaro-arm-linux-gnu=
eabihf-4.7-2013.03-20130313_linux/arm-linux-gnueabihf/include =C2=A0-fstack=
-protector -O2 -pipe -g -feliminate-unused-debug-types OE_QMAKE_LDFLAGS =3D=
 =C2=A0-L/home/nws/gcc-4.7.3/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-201=
30313_linux/arm-linux-gnueabihf/lib -Wl,-rpath-link,/home/nws/gcc-4.7.3/gcc=
-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/arm-linux-gnueabihf/=
lib -Wl,-O1 -Wl,--hash-style=3Dgnu OE_QMAKE_LINK =3D arm-linux-gnueabihf-g+=
+ =C2=A0-march=3Darmv7-a -marm -mthumb-interwork -mfloat-abi=3Dhard -mfpu=
=3Dneon -mtune=3Dcortex-a8 --sysroot=3D/home/nws/yocto-daisy-dev/oe-layerse=
tup/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm OE_QMAKE_=
STRIP =3D echo styles +=3D mac fusion windows DEFINES +=3D QT_NO_MTDEV QT_C=
FLAGS_PULSEAUDIO =3D -D_REENTRANT -I/home/nws/yocto-daisy-dev/oe-layersetup=
/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/include/=
glib-2.0 -I/home/nws/yocto-daisy-dev/oe-layersetup/build/arago-tmp-external=
-linaro-toolchain/sysroots/am335x-evm/usr/lib/glib-2.0/include =C2=A0QT_LIB=
S_PULSEAUDIO =3D -lpulse-mainloop-glib -lpulse -lglib-2.0 =C2=A0QMAKE_INCDI=
R_LIBUDEV =3D =C2=A0QMAKE_LIBS_LIBUDEV =3D -ludev -lrt =C2=A0sql-drivers =
=3D =C2=A0sql-plugins =3D =C2=A0qmake switches .........=C2=A0</div><div><b=
r></div></div><div><div>Build options:</div><div>=C2=A0 Configuration .....=
..... accessibility audio-backend c++11 clock-gettime clock-monotonic compi=
le_examples concurrent cross_compile dbus egl eglfs evdev eventfd freetype =
full-config getaddrinfo getifaddrs harfbuzz inotify ipv6ifname large-config=
 largefile libudev linuxfb medium-config minimal-config mremap neon opengl =
opengles2 openssl-linked pcre png posix_fallocate pulseaudio qpa qpa reduce=
_exports release shared silent small-config system-jpeg system-png system-z=
lib=C2=A0</div><div>=C2=A0 Build parts ............ =C2=A0libs tools</div><=
div>=C2=A0 Mode ................... release</div><div>=C2=A0 Using C++11 ..=
.......... yes</div><div>=C2=A0 Using gold linker....... no</div><div>=C2=
=A0 Using PCH .............. no</div><div>=C2=A0 Target compiler supports:<=
/div><div>=C2=A0 =C2=A0 Neon ................. yes</div><div><br></div><div=
>Qt modules and options:</div><div>=C2=A0 Qt D-Bus ............... yes (loa=
ding dbus-1 at runtime)</div><div>=C2=A0 Qt Concurrent .......... yes</div>=
<div>=C2=A0 Qt GUI ................. yes</div><div>=C2=A0 Qt Widgets ......=
....... yes</div><div>=C2=A0 Large File ............. yes</div><div>=C2=A0 =
QML debugging .......... yes</div><div>=C2=A0 Use system proxies ..... no</=
div><div><br></div><div>Support enabled for:</div><div>=C2=A0 Accessibility=
 .......... yes</div><div>=C2=A0 ALSA ................... no</div><div>=C2=
=A0 CUPS ................... no</div><div>=C2=A0 Evdev .................. y=
es</div><div>=C2=A0 FontConfig ............. no</div><div>=C2=A0 FreeType .=
.............. qt</div><div>=C2=A0 Glib ................... no</div><div>=
=C2=A0 GTK theme .............. no</div><div>=C2=A0 HarfBuzz ..............=
. yes (bundled copy)</div><div>=C2=A0 Iconv .................. no</div><div=
>=C2=A0 ICU .................... no</div><div>=C2=A0 Image formats:=C2=A0</=
div><div>=C2=A0 =C2=A0 GIF .................. yes (plugin, using bundled co=
py)</div><div>=C2=A0 =C2=A0 JPEG ................. yes (plugin, using syste=
m library)</div><div>=C2=A0 =C2=A0 PNG .................. yes (in QtGui, us=
ing system library)</div><div>=C2=A0 journald ............... no</div><div>=
=C2=A0 mtdev .................. no</div><div>=C2=A0 Networking:=C2=A0</div>=
<div>=C2=A0 =C2=A0 getaddrinfo .......... yes</div><div>=C2=A0 =C2=A0 getif=
addrs ........... yes</div><div>=C2=A0 =C2=A0 IPv6 ifname .......... yes</d=
iv><div>=C2=A0 =C2=A0 OpenSSL .............. yes (linked to the libraries)<=
/div><div>=C2=A0 NIS .................... no</div><div>=C2=A0 OpenGL / Open=
VG:=C2=A0</div><div>=C2=A0 =C2=A0 EGL .................. yes</div><div>=C2=
=A0 =C2=A0 OpenGL ............... yes (OpenGL ES 2.0+)</div><div>=C2=A0 =C2=
=A0 OpenVG ............... no</div><div>=C2=A0 PCRE ................... yes=
 (bundled copy)</div><div>=C2=A0 pkg-config ............. yes=C2=A0</div><d=
iv>=C2=A0 PulseAudio ............. yes</div><div>=C2=A0 QPA backends:=C2=A0=
</div><div>=C2=A0 =C2=A0 DirectFB ............. no</div><div>=C2=A0 =C2=A0 =
EGLFS ................ yes</div><div>=C2=A0 =C2=A0 KMS .................. n=
o</div><div>=C2=A0 =C2=A0 LinuxFB .............. yes</div><div>=C2=A0 =C2=
=A0 XCB .................. no</div><div>=C2=A0 Session management ..... no<=
/div><div>=C2=A0 SQL drivers:=C2=A0</div><div>=C2=A0 =C2=A0 DB2 ...........=
....... no</div><div>=C2=A0 =C2=A0 InterBase ............ no</div><div>=C2=
=A0 =C2=A0 MySQL ................ no</div><div>=C2=A0 =C2=A0 OCI ..........=
........ no</div><div>=C2=A0 =C2=A0 ODBC ................. no</div><div>=C2=
=A0 =C2=A0 PostgreSQL ........... no</div><div>=C2=A0 =C2=A0 SQLite 2 .....=
........ no</div><div>=C2=A0 =C2=A0 SQLite ............... no</div><div>=C2=
=A0 =C2=A0 TDS .................. no</div><div>=C2=A0 udev ................=
... yes</div><div>=C2=A0 xkbcommon .............. no</div><div>=C2=A0 zlib =
................... yes (system library)</div></div><div style=3D"font-size=
:small"><br></div></font></div><div class=3D"gmail_default"><font color=3D"=
#000000" face=3D"verdana, sans-serif"><div class=3D"gmail_default">regards<=
/div><div class=3D"gmail_default">Ankur</div></font></div>
</div>
</blockquote></div>

--001a114394c45493c9052500336c--
