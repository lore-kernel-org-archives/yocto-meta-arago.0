Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-yk0-f180.google.com (mail-yk0-f180.google.com
	[209.85.160.180])
	by arago-project.org (Postfix) with ESMTPS id 5BA1152A48
	for <meta-arago@arago-project.org>;
	Wed, 18 Nov 2015 03:38:52 +0000 (UTC)
Received: by ykba77 with SMTP id a77so43359751ykb.2
	for <meta-arago@arago-project.org>;
	Tue, 17 Nov 2015 19:38:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=KXOyVQaEu/ucptLhenDcaicSPmvSKV3qM56a5pdlBrU=;
	b=nzXlAVwf5mHFuObNUCRnUxSYrFduK3tZYij9+KS81GxWjQnKUa9a9GZKj9rf7vaS4l
	s93y9zLSqXNoKh9+Hy6b9eRa0hpQgySXVzHXZB4ZIer3n10Qa85bqloihoZPi2GBkPlT
	59Dt3GYPJmGQxmq79vJYRC7zLz/DPjw7OMDumUiTIdKQKIBrmI0yDTnnjuOku+nKCNyB
	HH/CfTLLf2PvdeHXwLzmYk+4Ug6OIWoInJU3g/X2I7hwh8pWf5BWsC3SbyWKh1q8oPbU
	sjdT0Tvv6oBBu6Z0fsrhOqaBALnkukjUhhaperj1X+SyDIbV4POatY5bx1CRXpgzL50D
	2dqQ==
X-Received: by 10.129.39.216 with SMTP id n207mr44264916ywn.181.1447817930312; 
	Tue, 17 Nov 2015 19:38:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.166.17 with HTTP; Tue, 17 Nov 2015 19:38:30 -0800 (PST)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Wed, 18 Nov 2015 16:38:30 +1300
Message-ID: <CADySD0H0u8_vE6nC4pcuHPcEGDSZCtbTm6RKy+s5u2S1ff3mYg@mail.gmail.com>
To: meta-arago@arago-project.org
Subject: QT5.4.1 combobox error when running on AM335x-EVM
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
X-List-Received-Date: Wed, 18 Nov 2015 03:38:56 -0000
Content-Type: multipart/alternative; boundary=001a113f41e86f95140524c861a5

--001a113f41e86f95140524c861a5
Content-Type: text/plain; charset=UTF-8

Hi,

When running QT5.4.1 based app, I get following error when I try to use a
combobox:

QEGLPlatformContext::makeCurrent: eglError: 3002, this: 0x3f5b58
QEGLPlatformContext::makeCurrent: eglError: 3009, this: 0x3f5b58

I am using meta-arago daisy branch on TI AM335x-EVM. I have also removed
"x11 and wayland" from distro features.

Any help is appreciated.

My environment is following:

Build Configuration:
BB_VERSION        = "1.26.0"
BUILD_SYS         = "i686-linux"
NATIVELSBSTRING   = "Ubuntu-14.04"
TARGET_SYS        = "arm-linux-gnueabi"
MACHINE           = "am335x-evm"
DISTRO            = "arago"
DISTRO_VERSION    = "2015.05"
TUNE_FEATURES     = "armv7a vfp thumb neon callconvention-hard cortexa8"
TARGET_FPU        = "vfp-neon"
meta-arago-distro
meta-arago-extras = "daisy:d607cf64048994eaf2e8bb1687092c65febb27f2"
meta-qt5          =
"(detachedfrom17eb158):c6d3e94ff294f39994de85b3fd12ffde8b3f8372"
toolchain-layer
meta-networking
meta-ruby
meta-oe           = "daisy:d3d14d3fcca7fcde362cf0b31411dc4eea6d20aa"
meta-ti           = "daisy:70cdadbfb48ef3e7a2596320cdfc626078c1ac34"
meta-linaro-toolchain = "daisy:06008235ca752fea678953e85adaa29a491d246b"
meta              = "daisy:e1a2540227250d854d5bba278634bcc9e7572cda"

Following is QT build configuration:

   Configure summary

Building on:
/home/nws/yocto-daisy-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/i686-linux/usr/lib/qt5/mkspecs/linux-oe-g++
(arm, CPU features: neon)
Building for:  linux-oe-g++ (arm, CPU features: neon)

qmake vars .......... OE_QMAKE_AR = arm-linux-gnueabihf-ar OE_QMAKE_CC =
arm-linux-gnueabihf-gcc  -march=armv7-a -marm -mthumb-interwork
-mfloat-abi=hard -mfpu=neon -mtune=cortex-a8
--sysroot=/home/nws/yocto-daisy-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm
OE_QMAKE_CFLAGS =
 -isystem/home/nws/gcc-4.7.3/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/arm-linux-gnueabihf/include
 -fstack-protector -O2 -pipe -g -feliminate-unused-debug-types
OE_QMAKE_COMPILER = arm-linux-gnueabihf-gcc  -march=armv7-a -marm
-mthumb-interwork -mfloat-abi=hard -mfpu=neon -mtune=cortex-a8
--sysroot=/home/nws/yocto-daisy-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm
OE_QMAKE_CXX = arm-linux-gnueabihf-g++  -march=armv7-a -marm
-mthumb-interwork -mfloat-abi=hard -mfpu=neon -mtune=cortex-a8
--sysroot=/home/nws/yocto-daisy-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm
OE_QMAKE_CXXFLAGS =
 -isystem/home/nws/gcc-4.7.3/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/arm-linux-gnueabihf/include
 -fstack-protector -O2 -pipe -g -feliminate-unused-debug-types
OE_QMAKE_LDFLAGS =
 -L/home/nws/gcc-4.7.3/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/arm-linux-gnueabihf/lib
-Wl,-rpath-link,/home/nws/gcc-4.7.3/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/arm-linux-gnueabihf/lib
-Wl,-O1 -Wl,--hash-style=gnu OE_QMAKE_LINK = arm-linux-gnueabihf-g++
 -march=armv7-a -marm -mthumb-interwork -mfloat-abi=hard -mfpu=neon
-mtune=cortex-a8
--sysroot=/home/nws/yocto-daisy-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm
OE_QMAKE_STRIP = echo styles += mac fusion windows DEFINES += QT_NO_MTDEV
QT_CFLAGS_PULSEAUDIO = -D_REENTRANT
-I/home/nws/yocto-daisy-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/include/glib-2.0
-I/home/nws/yocto-daisy-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/lib/glib-2.0/include
 QT_LIBS_PULSEAUDIO = -lpulse-mainloop-glib -lpulse -lglib-2.0
 QMAKE_INCDIR_LIBUDEV =  QMAKE_LIBS_LIBUDEV = -ludev -lrt  sql-drivers =
 sql-plugins =  qmake switches .........

Build options:
  Configuration .......... accessibility audio-backend c++11 clock-gettime
clock-monotonic compile_examples concurrent cross_compile dbus egl eglfs
evdev eventfd freetype full-config getaddrinfo getifaddrs harfbuzz inotify
ipv6ifname large-config largefile libudev linuxfb medium-config
minimal-config mremap neon opengl opengles2 openssl-linked pcre png
posix_fallocate pulseaudio qpa qpa reduce_exports release shared silent
small-config system-jpeg system-png system-zlib
  Build parts ............  libs tools
  Mode ................... release
  Using C++11 ............ yes
  Using gold linker....... no
  Using PCH .............. no
  Target compiler supports:
    Neon ................. yes

Qt modules and options:
  Qt D-Bus ............... yes (loading dbus-1 at runtime)
  Qt Concurrent .......... yes
  Qt GUI ................. yes
  Qt Widgets ............. yes
  Large File ............. yes
  QML debugging .......... yes
  Use system proxies ..... no

Support enabled for:
  Accessibility .......... yes
  ALSA ................... no
  CUPS ................... no
  Evdev .................. yes
  FontConfig ............. no
  FreeType ............... qt
  Glib ................... no
  GTK theme .............. no
  HarfBuzz ............... yes (bundled copy)
  Iconv .................. no
  ICU .................... no
  Image formats:
    GIF .................. yes (plugin, using bundled copy)
    JPEG ................. yes (plugin, using system library)
    PNG .................. yes (in QtGui, using system library)
  journald ............... no
  mtdev .................. no
  Networking:
    getaddrinfo .......... yes
    getifaddrs ........... yes
    IPv6 ifname .......... yes
    OpenSSL .............. yes (linked to the libraries)
  NIS .................... no
  OpenGL / OpenVG:
    EGL .................. yes
    OpenGL ............... yes (OpenGL ES 2.0+)
    OpenVG ............... no
  PCRE ................... yes (bundled copy)
  pkg-config ............. yes
  PulseAudio ............. yes
  QPA backends:
    DirectFB ............. no
    EGLFS ................ yes
    KMS .................. no
    LinuxFB .............. yes
    XCB .................. no
  Session management ..... no
  SQL drivers:
    DB2 .................. no
    InterBase ............ no
    MySQL ................ no
    OCI .................. no
    ODBC ................. no
    PostgreSQL ........... no
    SQLite 2 ............. no
    SQLite ............... no
    TDS .................. no
  udev ................... yes
  xkbcommon .............. no
  zlib ................... yes (system library)

regards
Ankur

--001a113f41e86f95140524c861a5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small"><fo=
nt color=3D"#000000" face=3D"verdana, sans-serif">Hi,</font></div><div clas=
s=3D"gmail_default" style=3D"font-size:small"><font color=3D"#000000" face=
=3D"verdana, sans-serif"><br></font></div><div class=3D"gmail_default" styl=
e=3D"font-size:small"><font color=3D"#000000" face=3D"verdana, sans-serif">=
When running QT5.4.1 based app, I get following error when I try to use a c=
ombobox:</font></div><div class=3D"gmail_default" style=3D"font-size:small"=
><font color=3D"#000000" face=3D"verdana, sans-serif"><br></font></div><div=
 class=3D"gmail_default" style=3D"font-size:small"><div class=3D"gmail_defa=
ult" style=3D"color:rgb(0,0,0);font-family:verdana,sans-serif">QEGLPlatform=
Context::makeCurrent: eglError: 3002, this: 0x3f5b58</div><div class=3D"gma=
il_default" style=3D"color:rgb(0,0,0);font-family:verdana,sans-serif">QEGLP=
latformContext::makeCurrent: eglError: 3009, this: 0x3f5b58</div><div class=
=3D"gmail_default" style=3D"color:rgb(0,0,0);font-family:verdana,sans-serif=
"><br></div><div class=3D"gmail_default" style=3D"color:rgb(0,0,0);font-fam=
ily:verdana,sans-serif">I am using meta-arago daisy branch on TI AM335x-EVM=
. I have also removed &quot;x11 and wayland&quot; from distro features.</di=
v><div class=3D"gmail_default" style=3D"color:rgb(0,0,0);font-family:verdan=
a,sans-serif"><br></div><div class=3D"gmail_default" style=3D"color:rgb(0,0=
,0);font-family:verdana,sans-serif">Any help is appreciated.</div><div clas=
s=3D"gmail_default" style=3D"color:rgb(0,0,0);font-family:verdana,sans-seri=
f"><br></div></div><div class=3D"gmail_default" style=3D"font-size:small"><=
font color=3D"#000000" face=3D"verdana, sans-serif">My environment is follo=
wing:=C2=A0</font></div><div class=3D"gmail_default" style=3D""><font color=
=3D"#000000" face=3D"verdana, sans-serif" style=3D""><div class=3D"gmail_de=
fault" style=3D"font-size:small"><br></div><div class=3D"gmail_default" sty=
le=3D"font-size:small">Build Configuration:</div><div class=3D"gmail_defaul=
t" style=3D"font-size:small">BB_VERSION =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quo=
t;1.26.0&quot;</div><div class=3D"gmail_default" style=3D"font-size:small">=
BUILD_SYS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;i686-linux&quot;</div><div =
class=3D"gmail_default" style=3D"font-size:small">NATIVELSBSTRING =C2=A0 =
=3D &quot;Ubuntu-14.04&quot;</div><div class=3D"gmail_default" style=3D"fon=
t-size:small">TARGET_SYS =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;arm-linux-gnu=
eabi&quot;</div><div class=3D"gmail_default" style=3D"font-size:small">MACH=
INE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;am335x-evm&quot;</div><div=
 class=3D"gmail_default" style=3D"font-size:small">DISTRO =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;arago&quot;</div><div class=3D"gmail_defa=
ult" style=3D"font-size:small">DISTRO_VERSION =C2=A0 =C2=A0=3D &quot;2015.0=
5&quot;</div><div class=3D"gmail_default" style=3D"font-size:small">TUNE_FE=
ATURES =C2=A0 =C2=A0 =3D &quot;armv7a vfp thumb neon callconvention-hard co=
rtexa8&quot;</div><div class=3D"gmail_default" style=3D"font-size:small">TA=
RGET_FPU =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;vfp-neon&quot;</div><div clas=
s=3D"gmail_default" style=3D"font-size:small">meta-arago-distro=C2=A0</div>=
<div class=3D"gmail_default" style=3D"font-size:small">meta-arago-extras =
=3D &quot;daisy:d607cf64048994eaf2e8bb1687092c65febb27f2&quot;</div><div cl=
ass=3D"gmail_default" style=3D"font-size:small">meta-qt5 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0=3D &quot;(detachedfrom17eb158):c6d3e94ff294f39994de85b3fd=
12ffde8b3f8372&quot;</div><div class=3D"gmail_default" style=3D"font-size:s=
mall">toolchain-layer =C2=A0=C2=A0</div><div class=3D"gmail_default" style=
=3D"font-size:small">meta-networking =C2=A0=C2=A0</div><div class=3D"gmail_=
default" style=3D"font-size:small">meta-ruby =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=
=A0</div><div class=3D"gmail_default" style=3D"font-size:small">meta-oe =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;daisy:d3d14d3fcca7fcde362cf0b3141=
1dc4eea6d20aa&quot;</div><div class=3D"gmail_default" style=3D"font-size:sm=
all">meta-ti =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;daisy:70cdadbfb48=
ef3e7a2596320cdfc626078c1ac34&quot;</div><div class=3D"gmail_default" style=
=3D"font-size:small">meta-linaro-toolchain =3D &quot;daisy:06008235ca752fea=
678953e85adaa29a491d246b&quot;</div><div class=3D"gmail_default" style=3D"f=
ont-size:small">meta =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &q=
uot;daisy:e1a2540227250d854d5bba278634bcc9e7572cda&quot;</div><div style=3D=
"font-size:small"><br></div><div style=3D"font-size:small">Following is QT =
build configuration:</div><div style=3D"font-size:small"><br></div><div sty=
le=3D""><div style=3D"">=C2=A0 =C2=A0Configure summary</div><div style=3D""=
><br></div><div style=3D"">Building on: =C2=A0 /home/nws/yocto-daisy-dev/oe=
-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/i686-linux/u=
sr/lib/qt5/mkspecs/linux-oe-g++ (arm, CPU features: neon)</div><div style=
=3D"">Building for: =C2=A0linux-oe-g++ (arm, CPU features: neon)</div><div =
style=3D""><br></div><div style=3D"">qmake vars .......... OE_QMAKE_AR =3D =
arm-linux-gnueabihf-ar OE_QMAKE_CC =3D arm-linux-gnueabihf-gcc =C2=A0-march=
=3Darmv7-a -marm -mthumb-interwork -mfloat-abi=3Dhard -mfpu=3Dneon -mtune=
=3Dcortex-a8 --sysroot=3D/home/nws/yocto-daisy-dev/oe-layersetup/build/arag=
o-tmp-external-linaro-toolchain/sysroots/am335x-evm OE_QMAKE_CFLAGS =3D =C2=
=A0-isystem/home/nws/gcc-4.7.3/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-2=
0130313_linux/arm-linux-gnueabihf/include =C2=A0-fstack-protector -O2 -pipe=
 -g -feliminate-unused-debug-types OE_QMAKE_COMPILER =3D arm-linux-gnueabih=
f-gcc =C2=A0-march=3Darmv7-a -marm -mthumb-interwork -mfloat-abi=3Dhard -mf=
pu=3Dneon -mtune=3Dcortex-a8 --sysroot=3D/home/nws/yocto-daisy-dev/oe-layer=
setup/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm OE_QMAK=
E_CXX =3D arm-linux-gnueabihf-g++ =C2=A0-march=3Darmv7-a -marm -mthumb-inte=
rwork -mfloat-abi=3Dhard -mfpu=3Dneon -mtune=3Dcortex-a8 --sysroot=3D/home/=
nws/yocto-daisy-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain=
/sysroots/am335x-evm OE_QMAKE_CXXFLAGS =3D =C2=A0-isystem/home/nws/gcc-4.7.=
3/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/arm-linux-gnuea=
bihf/include =C2=A0-fstack-protector -O2 -pipe -g -feliminate-unused-debug-=
types OE_QMAKE_LDFLAGS =3D =C2=A0-L/home/nws/gcc-4.7.3/gcc-linaro-arm-linux=
-gnueabihf-4.7-2013.03-20130313_linux/arm-linux-gnueabihf/lib -Wl,-rpath-li=
nk,/home/nws/gcc-4.7.3/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_=
linux/arm-linux-gnueabihf/lib -Wl,-O1 -Wl,--hash-style=3Dgnu OE_QMAKE_LINK =
=3D arm-linux-gnueabihf-g++ =C2=A0-march=3Darmv7-a -marm -mthumb-interwork =
-mfloat-abi=3Dhard -mfpu=3Dneon -mtune=3Dcortex-a8 --sysroot=3D/home/nws/yo=
cto-daisy-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysro=
ots/am335x-evm OE_QMAKE_STRIP =3D echo styles +=3D mac fusion windows DEFIN=
ES +=3D QT_NO_MTDEV QT_CFLAGS_PULSEAUDIO =3D -D_REENTRANT -I/home/nws/yocto=
-daisy-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots=
/am335x-evm/usr/include/glib-2.0 -I/home/nws/yocto-daisy-dev/oe-layersetup/=
build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/lib/glib-=
2.0/include =C2=A0QT_LIBS_PULSEAUDIO =3D -lpulse-mainloop-glib -lpulse -lgl=
ib-2.0 =C2=A0QMAKE_INCDIR_LIBUDEV =3D =C2=A0QMAKE_LIBS_LIBUDEV =3D -ludev -=
lrt =C2=A0sql-drivers =3D =C2=A0sql-plugins =3D =C2=A0qmake switches ......=
...=C2=A0</div><div style=3D""><br></div></div><div style=3D""><div style=
=3D"">Build options:</div><div style=3D"">=C2=A0 Configuration .......... a=
ccessibility audio-backend c++11 clock-gettime clock-monotonic compile_exam=
ples concurrent cross_compile dbus egl eglfs evdev eventfd freetype full-co=
nfig getaddrinfo getifaddrs harfbuzz inotify ipv6ifname large-config largef=
ile libudev linuxfb medium-config minimal-config mremap neon opengl opengle=
s2 openssl-linked pcre png posix_fallocate pulseaudio qpa qpa reduce_export=
s release shared silent small-config system-jpeg system-png system-zlib=C2=
=A0</div><div style=3D"">=C2=A0 Build parts ............ =C2=A0libs tools</=
div><div style=3D"">=C2=A0 Mode ................... release</div><div style=
=3D"">=C2=A0 Using C++11 ............ yes</div><div style=3D"">=C2=A0 Using=
 gold linker....... no</div><div style=3D"">=C2=A0 Using PCH ..............=
 no</div><div style=3D"">=C2=A0 Target compiler supports:</div><div style=
=3D"">=C2=A0 =C2=A0 Neon ................. yes</div><div style=3D""><br></d=
iv><div style=3D"">Qt modules and options:</div><div style=3D"">=C2=A0 Qt D=
-Bus ............... yes (loading dbus-1 at runtime)</div><div style=3D"">=
=C2=A0 Qt Concurrent .......... yes</div><div style=3D"">=C2=A0 Qt GUI ....=
............. yes</div><div style=3D"">=C2=A0 Qt Widgets ............. yes<=
/div><div style=3D"">=C2=A0 Large File ............. yes</div><div style=3D=
"">=C2=A0 QML debugging .......... yes</div><div style=3D"">=C2=A0 Use syst=
em proxies ..... no</div><div style=3D""><br></div><div style=3D"">Support =
enabled for:</div><div style=3D"">=C2=A0 Accessibility .......... yes</div>=
<div style=3D"">=C2=A0 ALSA ................... no</div><div style=3D"">=C2=
=A0 CUPS ................... no</div><div style=3D"">=C2=A0 Evdev .........=
......... yes</div><div style=3D"">=C2=A0 FontConfig ............. no</div>=
<div style=3D"">=C2=A0 FreeType ............... qt</div><div style=3D"">=C2=
=A0 Glib ................... no</div><div style=3D"">=C2=A0 GTK theme .....=
......... no</div><div style=3D"">=C2=A0 HarfBuzz ............... yes (bund=
led copy)</div><div style=3D"">=C2=A0 Iconv .................. no</div><div=
 style=3D"">=C2=A0 ICU .................... no</div><div style=3D"">=C2=A0 =
Image formats:=C2=A0</div><div style=3D"">=C2=A0 =C2=A0 GIF ...............=
... yes (plugin, using bundled copy)</div><div style=3D"">=C2=A0 =C2=A0 JPE=
G ................. yes (plugin, using system library)</div><div style=3D""=
>=C2=A0 =C2=A0 PNG .................. yes (in QtGui, using system library)<=
/div><div style=3D"">=C2=A0 journald ............... no</div><div style=3D"=
">=C2=A0 mtdev .................. no</div><div style=3D"">=C2=A0 Networking=
:=C2=A0</div><div style=3D"">=C2=A0 =C2=A0 getaddrinfo .......... yes</div>=
<div style=3D"">=C2=A0 =C2=A0 getifaddrs ........... yes</div><div style=3D=
"">=C2=A0 =C2=A0 IPv6 ifname .......... yes</div><div style=3D"">=C2=A0 =C2=
=A0 OpenSSL .............. yes (linked to the libraries)</div><div style=3D=
"">=C2=A0 NIS .................... no</div><div style=3D"">=C2=A0 OpenGL / =
OpenVG:=C2=A0</div><div style=3D"">=C2=A0 =C2=A0 EGL .................. yes=
</div><div style=3D"">=C2=A0 =C2=A0 OpenGL ............... yes (OpenGL ES 2=
.0+)</div><div style=3D"">=C2=A0 =C2=A0 OpenVG ............... no</div><div=
 style=3D"">=C2=A0 PCRE ................... yes (bundled copy)</div><div st=
yle=3D"">=C2=A0 pkg-config ............. yes=C2=A0</div><div style=3D"">=C2=
=A0 PulseAudio ............. yes</div><div style=3D"">=C2=A0 QPA backends:=
=C2=A0</div><div style=3D"">=C2=A0 =C2=A0 DirectFB ............. no</div><d=
iv style=3D"">=C2=A0 =C2=A0 EGLFS ................ yes</div><div style=3D""=
>=C2=A0 =C2=A0 KMS .................. no</div><div style=3D"">=C2=A0 =C2=A0=
 LinuxFB .............. yes</div><div style=3D"">=C2=A0 =C2=A0 XCB ........=
.......... no</div><div style=3D"">=C2=A0 Session management ..... no</div>=
<div style=3D"">=C2=A0 SQL drivers:=C2=A0</div><div style=3D"">=C2=A0 =C2=
=A0 DB2 .................. no</div><div style=3D"">=C2=A0 =C2=A0 InterBase =
............ no</div><div style=3D"">=C2=A0 =C2=A0 MySQL ................ n=
o</div><div style=3D"">=C2=A0 =C2=A0 OCI .................. no</div><div st=
yle=3D"">=C2=A0 =C2=A0 ODBC ................. no</div><div style=3D"">=C2=
=A0 =C2=A0 PostgreSQL ........... no</div><div style=3D"">=C2=A0 =C2=A0 SQL=
ite 2 ............. no</div><div style=3D"">=C2=A0 =C2=A0 SQLite ..........=
..... no</div><div style=3D"">=C2=A0 =C2=A0 TDS .................. no</div>=
<div style=3D"">=C2=A0 udev ................... yes</div><div style=3D"">=
=C2=A0 xkbcommon .............. no</div><div style=3D"">=C2=A0 zlib .......=
............ yes (system library)</div></div><div style=3D"font-size:small"=
><br></div></font></div><div class=3D"gmail_default" style=3D""><font color=
=3D"#000000" face=3D"verdana, sans-serif" style=3D""><div class=3D"gmail_de=
fault" style=3D"">regards</div><div class=3D"gmail_default" style=3D"">Anku=
r</div></font></div>
</div>

--001a113f41e86f95140524c861a5--
