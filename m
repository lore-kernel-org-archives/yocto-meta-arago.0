Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-oi0-f44.google.com (mail-oi0-f44.google.com
	[209.85.218.44])
	by arago-project.org (Postfix) with ESMTPS id C495F52004
	for <meta-arago@arago-project.org>;
	Mon, 27 Jun 2016 06:26:32 +0000 (UTC)
Received: by mail-oi0-f44.google.com with SMTP id u201so187809089oie.0
	for <meta-arago@arago-project.org>;
	Sun, 26 Jun 2016 23:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to;
	bh=Ckb2TP/fpA0mUjzQPD/xZrl1378lAYbiKZIqYgvklUM=;
	b=tO7omjXXyUXZQ5RFnuBnQj2Eizgj0hoxe5k0qzQz6EJpSq/rm77n4PmEKOU82d1qbo
	60uA64eEk41m0Sx6aCQ9K04l9pm6/XhK6V9W90Ij1evQguByFcmzCy7YpfbdUfVKS57t
	dJ99OFCZuScWVgeDmdBm8ua1xuf5nvpKkg/gNmUVI6qWGsLoTh62pD7ox0R69cMnkgON
	6lAkKCr0qbJi4kGsvY5HaYqOa7C5GaJYvFPtzR3CLT6HQRr6uLWzHuc5aG+esGfSgcrN
	euMIW2+/VJhG3gt/SV67/eXRZakeCnKOa0Tm9KMy+0qMMgyCnWtBfdPS3Dz24nVn5nUo
	eijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=Ckb2TP/fpA0mUjzQPD/xZrl1378lAYbiKZIqYgvklUM=;
	b=fkVg6eLTfhkbjrlbifgRna6X6a+k2wnBjthiEkfN/ULFCYa1HusIE2KG2ete28/r1/
	N+rkOSl2LvGU+CDVeZaXOUaMg65JFPk7hYOI6zoE5hQBS27pqj8/USXIxH94BV4dPlq2
	cAIgEhL3u0fgA2SHLcu85S6Mp9MXIpeN8m7qE4AHpHmxyD66CHq8x4tOEvAqvMbgaHIJ
	h8crHCKbvUzqiiigCNvoWVTU5G43yJw14kKatk1R05jpCKX2NuEjTxenCl7surT43+ir
	oZeES5AHoB23y8QLrjkRSOVukqDzTYZejVeuDUa9xPY48/UpELtOeskCOapq3MMb/fwS
	j+iw==
X-Gm-Message-State: ALyK8tLL07PwtUDl/nVES2amJj6G8jvHsZdEUQsbMUtllbufTktkkFFOhvhXc/TkkPupUwPmPSjDs42gQ/7OIg==
X-Received: by 10.157.3.48 with SMTP id 45mr9426062otv.172.1467008792232; Sun,
	26 Jun 2016 23:26:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.80.80 with HTTP; Sun, 26 Jun 2016 23:26:12 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Mon, 27 Jun 2016 18:26:12 +1200
Message-ID: <CADySD0EZ+BLv5pZ9N9Ju_4uKpbdjwrQFZoAVvWiOCkdqQv5Xyg@mail.gmail.com>
To: meta-arago@arago-project.org
Subject: Application run time problem when upgraded to Qt5.6.1 on AM335x
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
X-List-Received-Date: Mon, 27 Jun 2016 06:26:34 -0000
Content-Type: multipart/alternative; boundary=94eb2c038da8f1918c05363c9986

--94eb2c038da8f1918c05363c9986
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

=E2=80=8B=E2=80=8B
I am using daisy branch for development on AM335x based product.
Recently I updated Qt version from 5.4.1 (daisy) -> 5.6.1 (krogoth) as
Qt5.6.1 is declared as LTS.

So I only updated meta-qt5 as I want rest of layers to be at daisy.

My application is having runtime problems with Qt5.6.1. It is loading very
slowly and I can see UI changes like transparency on button getting set,
sliders moving in etc which were kind of spontaneous with Qt5.4.1

It feels weird as if I am debugging through all the Qt qml code.
But if I run SGX demos, they all run fine which is expected as I only
update meta-qt5 layer
=E2=80=8B.=E2=80=8B

Is there a reason for observing this ? Or is there something I missed in
recipes ?

Here are the changes that I did to upgrade Qt:
- updated meta-qt5 layer to krogoth branch
- copied recipes-qt from meta-arago krogoth branch into my meta-arago daisy
branch
- updated my qtbase_%.bbappend for customization's

Here is my qtbase_%.bbappend:

GLES_EXTRA_DEPS =3D ""
PACKAGECONFIG[gles2] =3D "-opengl es2 -eglfs,,virtual/libgles2 virtual/egl
${GLES_EXTRA_DEPS}"

PACKAGECONFIG +=3D "accessibility icu"

QT_CONFIG_FLAGS +=3D " \
    -qpa eglfs \
    -freetype \
    -no-iconv \
    -no-linuxfb \
    -no-directfb \
    -nomake examples \
    -no-fontconfig \
    -no-tslib \
    -no-sql-sqlite \
    -no-sql-sqlite2 \
    -no-xcb \
    -no-alsa \
    -no-pulseaudio \
"

I also have removed "x11 wayland" from DISTRO_FEATURES as MACHINE_FEATURES
have "sgx"

Here is the Qt configuration log:

Build options:
  Configuration .......... accessibility audio-backend c++11 clock-gettime
clock-monotonic compile_examples concurrent cross_compile dbus dbus-linked
egl eglfs evdev eventfd freetype full-config getaddrinfo getifaddrs glib
harfbuzz icu inotify ipv6ifname kms large-config largefile libudev
medium-config minimal-config mremap neon nis no-widgets opengl opengles2
openssl pcre png posix_fallocate qpa qpa reduce_exports release shared
silent small-config system-jpeg system-png system-zlib threadsafe-cloexec
  Build parts ............ libs
  Mode ................... release
  Using sanitizer(s)...... none
  Using C++ standard ..... c++11
  Using gold linker....... no
  Using new DTAGS ........ no
  Using PCH .............. no
  Using LTCG ............. no
  Target compiler supports:
    Neon ................. yes

Qt modules and options:
  Qt D-Bus ............... yes (linked to dbus-1)
  Qt Concurrent .......... yes
  Qt GUI ................. yes
  Qt Widgets ............. no
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
  Glib ................... yes
  GStreamer .............. no
  GTK theme .............. no
  HarfBuzz ............... yes (bundled copy)
  Iconv .................. no
  ICU .................... yes
  Image formats:
    GIF .................. yes (plugin, using bundled copy)
    JPEG ................. yes (plugin, using system library)
    PNG .................. yes (in QtGui, using system library)
  libinput................ no
  Logging backends:
    journald ............... no
    syslog   ............... no
  mtdev .................. no
  Networking:
    getaddrinfo .......... yes
    getifaddrs ........... yes
    IPv6 ifname .......... yes
    libproxy.............. no
    OpenSSL .............. yes (loading libraries at run-time)
  NIS .................... yes
  OpenGL / OpenVG:
    EGL .................. yes
    OpenGL ............... yes (OpenGL ES 2.0+)
    OpenVG ............... no
  PCRE ................... yes (bundled copy)
  pkg-config ............. yes
  PulseAudio ............. no
  QPA backends:
    DirectFB ............. no
    EGLFS ................ yes
      EGLFS i.MX6 ........ no
      EGLFS i.MX6 Wayland. no
      EGLFS EGLDevice .... no
      EGLFS GBM .......... no
      EGLFS Mali ......... no
      EGLFS Raspberry Pi . no
      EGLFS X11 .......... no
    LinuxFB .............. no
    Mir client............ no
    XCB .................. no
  Session management ..... yes
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
  tslib .................. no
  udev ................... yes
  xkbcommon-x11........... no
  xkbcommon-evdev......... no
  zlib ................... yes (system library)
=E2=80=8B

=E2=80=8B
=E2=80=8B
Any help in investigating this is appreciated as I would really like to
upgrade to Qt LTS.=E2=80=8B

thanks
Ankur

--94eb2c038da8f1918c05363c9986
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br><br><div class=3D"gmail_default" style=3D"font-fami=
ly:georgia,serif;font-size:small;color:rgb(51,51,153);display:inline">=E2=
=80=8B=E2=80=8B</div>I am using daisy branch for development on AM335x base=
d product.<br>Recently I updated Qt version from 5.4.1 (daisy) -&gt; 5.6.1 =
(krogoth) as Qt5.6.1 is declared as LTS.<br><br>So I only updated meta-qt5 =
as I want rest of layers to be at daisy.<br><br>My application is having ru=
ntime problems with Qt5.6.1. It is loading very slowly and I can see UI cha=
nges like transparency on button getting set, sliders moving in etc which w=
ere kind of spontaneous with Qt5.4.1<br><br>It feels weird as if I am debug=
ging through all the Qt qml code.<br>But if I run SGX demos, they all run f=
ine which is expected as I only update meta-qt5 layer<div class=3D"gmail_de=
fault" style=3D"font-family:georgia,serif;font-size:small;color:rgb(51,51,1=
53);display:inline">=E2=80=8B.=E2=80=8B</div><div><br>Is there a reason for=
 observing this ? Or is there something I missed in recipes ?<br><br>Here a=
re the changes that I did to upgrade Qt:<br>- updated meta-qt5 layer to kro=
goth branch<br>- copied recipes-qt from meta-arago krogoth branch into my m=
eta-arago daisy branch<br>- updated my qtbase_%.bbappend for customization&=
#39;s<br><br>Here is my qtbase_%.bbappend:<br><br>GLES_EXTRA_DEPS =3D &quot=
;&quot;<br>PACKAGECONFIG[gles2] =3D &quot;-opengl es2 -eglfs,,virtual/libgl=
es2 virtual/egl ${GLES_EXTRA_DEPS}&quot;<br><br>PACKAGECONFIG +=3D &quot;ac=
cessibility icu&quot;<br><br>QT_CONFIG_FLAGS +=3D &quot; \<br>=C2=A0 =C2=A0=
 -qpa eglfs \<br>=C2=A0 =C2=A0 -freetype \<br>=C2=A0 =C2=A0 -no-iconv \<br>=
=C2=A0 =C2=A0 -no-linuxfb \<br>=C2=A0 =C2=A0 -no-directfb \<br>=C2=A0 =C2=
=A0 -nomake examples \<br>=C2=A0 =C2=A0 -no-fontconfig \<br>=C2=A0 =C2=A0 -=
no-tslib \<br>=C2=A0 =C2=A0 -no-sql-sqlite \<br>=C2=A0 =C2=A0 -no-sql-sqlit=
e2 \<br>=C2=A0 =C2=A0 -no-xcb \<br>=C2=A0 =C2=A0 -no-alsa \<br>=C2=A0 =C2=
=A0 -no-pulseaudio \<br>&quot;<br><div class=3D"gmail_default" style=3D"fon=
t-family:georgia,serif;font-size:small;color:rgb(51,51,153)"><br></div>I al=
so have removed &quot;x11 wayland&quot; from DISTRO_FEATURES as MACHINE_FEA=
TURES have &quot;sgx&quot;<br><br>Here is the Qt configuration log:<br><br>=
Build options:<br>=C2=A0 Configuration .......... accessibility audio-backe=
nd c++11 clock-gettime clock-monotonic compile_examples concurrent cross_co=
mpile dbus dbus-linked egl eglfs evdev eventfd freetype full-config getaddr=
info getifaddrs glib harfbuzz icu inotify ipv6ifname kms large-config large=
file libudev medium-config minimal-config mremap neon nis no-widgets opengl=
 opengles2 openssl pcre png posix_fallocate qpa qpa reduce_exports release =
shared silent small-config system-jpeg system-png system-zlib threadsafe-cl=
oexec <br>=C2=A0 Build parts ............ libs<br>=C2=A0 Mode .............=
...... release<br>=C2=A0 Using sanitizer(s)...... none<br>=C2=A0 Using C++ =
standard ..... c++11<br>=C2=A0 Using gold linker....... no<br>=C2=A0 Using =
new DTAGS ........ no<br>=C2=A0 Using PCH .............. no<br>=C2=A0 Using=
 LTCG ............. no<br>=C2=A0 Target compiler supports:<br>=C2=A0 =C2=A0=
 Neon ................. yes<br><br>Qt modules and options:<br>=C2=A0 Qt D-B=
us ............... yes (linked to dbus-1)<br>=C2=A0 Qt Concurrent .........=
. yes<br>=C2=A0 Qt GUI ................. yes<br>=C2=A0 Qt Widgets .........=
.... no<br>=C2=A0 Large File ............. yes<br>=C2=A0 QML debugging ....=
...... yes<br>=C2=A0 Use system proxies ..... no<br><br>Support enabled for=
:<br>=C2=A0 Accessibility .......... yes<br>=C2=A0 ALSA ...................=
 no<br>=C2=A0 CUPS ................... no<br>=C2=A0 Evdev .................=
. yes<br>=C2=A0 FontConfig ............. no<br>=C2=A0 FreeType ............=
... qt<br>=C2=A0 Glib ................... yes<br>=C2=A0 GStreamer .........=
..... no<br>=C2=A0 GTK theme .............. no<br>=C2=A0 HarfBuzz .........=
...... yes (bundled copy)<br>=C2=A0 Iconv .................. no<br>=C2=A0 I=
CU .................... yes<br>=C2=A0 Image formats: <br>=C2=A0 =C2=A0 GIF =
.................. yes (plugin, using bundled copy)<br>=C2=A0 =C2=A0 JPEG .=
................ yes (plugin, using system library)<br>=C2=A0 =C2=A0 PNG ..=
................ yes (in QtGui, using system library)<br>=C2=A0 libinput...=
............. no<br>=C2=A0 Logging backends: <br>=C2=A0 =C2=A0 journald ...=
............ no<br>=C2=A0 =C2=A0 syslog =C2=A0 ............... no<br>=C2=A0=
 mtdev .................. no<br>=C2=A0 Networking: <br>=C2=A0 =C2=A0 getadd=
rinfo .......... yes<br>=C2=A0 =C2=A0 getifaddrs ........... yes<br>=C2=A0 =
=C2=A0 IPv6 ifname .......... yes<br>=C2=A0 =C2=A0 libproxy.............. n=
o<br>=C2=A0 =C2=A0 OpenSSL .............. yes (loading libraries at run-tim=
e)<br>=C2=A0 NIS .................... yes<br>=C2=A0 OpenGL / OpenVG: <br>=
=C2=A0 =C2=A0 EGL .................. yes<br>=C2=A0 =C2=A0 OpenGL ..........=
..... yes (OpenGL ES 2.0+)<br>=C2=A0 =C2=A0 OpenVG ............... no<br>=
=C2=A0 PCRE ................... yes (bundled copy)<br>=C2=A0 pkg-config ...=
.......... yes <br>=C2=A0 PulseAudio ............. no<br>=C2=A0 QPA backend=
s: <br>=C2=A0 =C2=A0 DirectFB ............. no<br>=C2=A0 =C2=A0 EGLFS .....=
........... yes<br>=C2=A0 =C2=A0 =C2=A0 EGLFS i.MX6 ........ no<br>=C2=A0 =
=C2=A0 =C2=A0 EGLFS i.MX6 Wayland. no<br>=C2=A0 =C2=A0 =C2=A0 EGLFS EGLDevi=
ce .... no<br>=C2=A0 =C2=A0 =C2=A0 EGLFS GBM .......... no<br>=C2=A0 =C2=A0=
 =C2=A0 EGLFS Mali ......... no<br>=C2=A0 =C2=A0 =C2=A0 EGLFS Raspberry Pi =
. no<br>=C2=A0 =C2=A0 =C2=A0 EGLFS X11 .......... no<br>=C2=A0 =C2=A0 Linux=
FB .............. no<br>=C2=A0 =C2=A0 Mir client............ no<br>=C2=A0 =
=C2=A0 XCB .................. no<br>=C2=A0 Session management ..... yes<br>=
=C2=A0 SQL drivers: <br>=C2=A0 =C2=A0 DB2 .................. no<br>=C2=A0 =
=C2=A0 InterBase ............ no<br>=C2=A0 =C2=A0 MySQL ................ no=
<br>=C2=A0 =C2=A0 OCI .................. no<br>=C2=A0 =C2=A0 ODBC .........=
........ no<br>=C2=A0 =C2=A0 PostgreSQL ........... no<br>=C2=A0 =C2=A0 SQL=
ite 2 ............. no<br>=C2=A0 =C2=A0 SQLite ............... no<br>=C2=A0=
 =C2=A0 TDS .................. no<br>=C2=A0 tslib .................. no<br>=
=C2=A0 udev ................... yes<br>=C2=A0 xkbcommon-x11........... no<b=
r>=C2=A0 xkbcommon-evdev......... no<br>=C2=A0 zlib ................... yes=
 (system library)<br><div class=3D"gmail_default" style=3D"font-family:geor=
gia,serif;font-size:small;color:rgb(51,51,153)">=E2=80=8B</div><br><div cla=
ss=3D"gmail_default" style=3D"font-family:georgia,serif;font-size:small;col=
or:rgb(51,51,153)">=E2=80=8B<div class=3D"gmail_default" style=3D"display:i=
nline">=E2=80=8B</div><span style=3D"font-family:arial,sans-serif;color:rgb=
(34,34,34)">Any help in investigating this is appreciated as I would really=
 like to upgrade to Qt LTS.</span>=E2=80=8B</div><br>thanks<br>Ankur
</div></div>

--94eb2c038da8f1918c05363c9986--
