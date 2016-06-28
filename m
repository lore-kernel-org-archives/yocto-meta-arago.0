Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by arago-project.org (Postfix) with ESMTPS id 8FD4752960
	for <meta-arago@arago-project.org>;
	Tue, 28 Jun 2016 09:10:54 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id s17so1691231oih.1
	for <meta-arago@arago-project.org>;
	Tue, 28 Jun 2016 02:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to; 
	bh=w0U/jhXg53IR752fH/20A9DSH11u5mbSHVd5gXfByCQ=;
	b=p0F9yueJqlphWIGdrZIA9QnoCf4h4NLj7Iv5pgtxmpYeMocvko+qqK1iFmSk8g92ZN
	UTGA+MHzSWtNJWExTiRnvLlQbA1Vkm20MAPX1MIhBFtiFYuXuiKqs/6u2dlpjH0Rben+
	R2lMMuQLnL9KHN73FRKZS7eXzE0r/GqdH1m9+uUqUQdqf4FYsERAWMPhAqKJ42nWeEZL
	CeVGSmNMiG4I/Oyo+SqXDFgaHQ+hNKBEmjdCkI+S3enJ9Cb5m2WFWIkz4Xa/wFS2oB/V
	YvLzbzCF9T2Z4tYVUXWAc3caSYXblddNdTm5Qnp1iqywuoZiwVSBqVxOAGpDYkRuP64b
	bFQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to;
	bh=w0U/jhXg53IR752fH/20A9DSH11u5mbSHVd5gXfByCQ=;
	b=XOnwGIsx8c5oWLjGsVKlqilB/7FEsh/X1t5OgiA/95NRabq3xTFRMVACegKhfg9UBV
	k4xuJgqqUxb6Eo3HLjZIYEvje7rrcN7zyvL8DMMPw8jClWeHAzqg0GhfsPOH+/yo1+2V
	DWAn7FqVno2JVfRa4m78AzQVh7e7pOOmALfu7BmeFoVz61eF/W0odVwgQtbVvJ0ERFp5
	n+uytzWlEZCc+zwLXjlYEgcJHAL1LDrC/O20aGjXiT9uDkEawbbOaWxzhwaw/hy1aK4S
	IDrkJYmSb+6crZ6vTXsbPjvBXxpd4fYkWox5RgblOza829tIHYkfgLCkQ0TgxmFtr4C+
	9vLQ==
X-Gm-Message-State: ALyK8tJy6+0d65VFQJ1Fwx+5oWQ7kh/txvL5J0C3U2G4CUKgnQK1cvEO99whEw/nFdPLCNNrI/DDfKH/ZUS8PA==
MIME-Version: 1.0
X-Received: by 10.157.17.5 with SMTP id g5mr1183120ote.135.1467105054363; Tue,
	28 Jun 2016 02:10:54 -0700 (PDT)
Received: by 10.202.80.80 with HTTP; Tue, 28 Jun 2016 02:10:54 -0700 (PDT)
Received: by 10.202.80.80 with HTTP; Tue, 28 Jun 2016 02:10:54 -0700 (PDT)
In-Reply-To: <CADySD0EZ+BLv5pZ9N9Ju_4uKpbdjwrQFZoAVvWiOCkdqQv5Xyg@mail.gmail.com>
References: <CADySD0EZ+BLv5pZ9N9Ju_4uKpbdjwrQFZoAVvWiOCkdqQv5Xyg@mail.gmail.com>
Date: Tue, 28 Jun 2016 21:10:54 +1200
Message-ID: <CADySD0E3zcHM1EPKv1dyEvxVmR+woMLbsbrvRvG4Kbna1QMWvg@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: meta-arago@arago-project.org
Subject: Re: Application run time problem when upgraded to Qt5.6.1 on AM335x
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
X-List-Received-Date: Tue, 28 Jun 2016 09:10:54 -0000
Content-Type: multipart/alternative; boundary=001a1145009e9d14600536530365

--001a1145009e9d14600536530365
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

Is this the right mailing list for below query?

Thanks
Ankur
On 27-Jun-2016 6:26 pm, "Ankur Tyagi" <ankur.tyagi85@gmail.com> wrote:

> Hi,
>
> =E2=80=8B=E2=80=8B
> I am using daisy branch for development on AM335x based product.
> Recently I updated Qt version from 5.4.1 (daisy) -> 5.6.1 (krogoth) as
> Qt5.6.1 is declared as LTS.
>
> So I only updated meta-qt5 as I want rest of layers to be at daisy.
>
> My application is having runtime problems with Qt5.6.1. It is loading ver=
y
> slowly and I can see UI changes like transparency on button getting set,
> sliders moving in etc which were kind of spontaneous with Qt5.4.1
>
> It feels weird as if I am debugging through all the Qt qml code.
> But if I run SGX demos, they all run fine which is expected as I only
> update meta-qt5 layer
> =E2=80=8B.=E2=80=8B
>
> Is there a reason for observing this ? Or is there something I missed in
> recipes ?
>
> Here are the changes that I did to upgrade Qt:
> - updated meta-qt5 layer to krogoth branch
> - copied recipes-qt from meta-arago krogoth branch into my meta-arago
> daisy branch
> - updated my qtbase_%.bbappend for customization's
>
> Here is my qtbase_%.bbappend:
>
> GLES_EXTRA_DEPS =3D ""
> PACKAGECONFIG[gles2] =3D "-opengl es2 -eglfs,,virtual/libgles2 virtual/eg=
l
> ${GLES_EXTRA_DEPS}"
>
> PACKAGECONFIG +=3D "accessibility icu"
>
> QT_CONFIG_FLAGS +=3D " \
>     -qpa eglfs \
>     -freetype \
>     -no-iconv \
>     -no-linuxfb \
>     -no-directfb \
>     -nomake examples \
>     -no-fontconfig \
>     -no-tslib \
>     -no-sql-sqlite \
>     -no-sql-sqlite2 \
>     -no-xcb \
>     -no-alsa \
>     -no-pulseaudio \
> "
>
> I also have removed "x11 wayland" from DISTRO_FEATURES as MACHINE_FEATURE=
S
> have "sgx"
>
> Here is the Qt configuration log:
>
> Build options:
>   Configuration .......... accessibility audio-backend c++11 clock-gettim=
e
> clock-monotonic compile_examples concurrent cross_compile dbus dbus-linke=
d
> egl eglfs evdev eventfd freetype full-config getaddrinfo getifaddrs glib
> harfbuzz icu inotify ipv6ifname kms large-config largefile libudev
> medium-config minimal-config mremap neon nis no-widgets opengl opengles2
> openssl pcre png posix_fallocate qpa qpa reduce_exports release shared
> silent small-config system-jpeg system-png system-zlib threadsafe-cloexec
>   Build parts ............ libs
>   Mode ................... release
>   Using sanitizer(s)...... none
>   Using C++ standard ..... c++11
>   Using gold linker....... no
>   Using new DTAGS ........ no
>   Using PCH .............. no
>   Using LTCG ............. no
>   Target compiler supports:
>     Neon ................. yes
>
> Qt modules and options:
>   Qt D-Bus ............... yes (linked to dbus-1)
>   Qt Concurrent .......... yes
>   Qt GUI ................. yes
>   Qt Widgets ............. no
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
>   Glib ................... yes
>   GStreamer .............. no
>   GTK theme .............. no
>   HarfBuzz ............... yes (bundled copy)
>   Iconv .................. no
>   ICU .................... yes
>   Image formats:
>     GIF .................. yes (plugin, using bundled copy)
>     JPEG ................. yes (plugin, using system library)
>     PNG .................. yes (in QtGui, using system library)
>   libinput................ no
>   Logging backends:
>     journald ............... no
>     syslog   ............... no
>   mtdev .................. no
>   Networking:
>     getaddrinfo .......... yes
>     getifaddrs ........... yes
>     IPv6 ifname .......... yes
>     libproxy.............. no
>     OpenSSL .............. yes (loading libraries at run-time)
>   NIS .................... yes
>   OpenGL / OpenVG:
>     EGL .................. yes
>     OpenGL ............... yes (OpenGL ES 2.0+)
>     OpenVG ............... no
>   PCRE ................... yes (bundled copy)
>   pkg-config ............. yes
>   PulseAudio ............. no
>   QPA backends:
>     DirectFB ............. no
>     EGLFS ................ yes
>       EGLFS i.MX6 ........ no
>       EGLFS i.MX6 Wayland. no
>       EGLFS EGLDevice .... no
>       EGLFS GBM .......... no
>       EGLFS Mali ......... no
>       EGLFS Raspberry Pi . no
>       EGLFS X11 .......... no
>     LinuxFB .............. no
>     Mir client............ no
>     XCB .................. no
>   Session management ..... yes
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
>   tslib .................. no
>   udev ................... yes
>   xkbcommon-x11........... no
>   xkbcommon-evdev......... no
>   zlib ................... yes (system library)
> =E2=80=8B
>
> =E2=80=8B
> =E2=80=8B
> Any help in investigating this is appreciated as I would really like to
> upgrade to Qt LTS.=E2=80=8B
>
> thanks
> Ankur
>

--001a1145009e9d14600536530365
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Hi,</p>
<p dir=3D"ltr">Is this the right mailing list for below query? </p>
<p dir=3D"ltr">Thanks <br>
Ankur</p>
<div class=3D"gmail_quote">On 27-Jun-2016 6:26 pm, &quot;Ankur Tyagi&quot; =
&lt;<a href=3D"mailto:ankur.tyagi85@gmail.com">ankur.tyagi85@gmail.com</a>&=
gt; wrote:<br type=3D"attribution"><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=
=3D"ltr">Hi,<br><br><div class=3D"gmail_default" style=3D"font-family:georg=
ia,serif;font-size:small;color:rgb(51,51,153);display:inline">=E2=80=8B=E2=
=80=8B</div>I am using daisy branch for development on AM335x based product=
.<br>Recently I updated Qt version from 5.4.1 (daisy) -&gt; 5.6.1 (krogoth)=
 as Qt5.6.1 is declared as LTS.<br><br>So I only updated meta-qt5 as I want=
 rest of layers to be at daisy.<br><br>My application is having runtime pro=
blems with Qt5.6.1. It is loading very slowly and I can see UI changes like=
 transparency on button getting set, sliders moving in etc which were kind =
of spontaneous with Qt5.4.1<br><br>It feels weird as if I am debugging thro=
ugh all the Qt qml code.<br>But if I run SGX demos, they all run fine which=
 is expected as I only update meta-qt5 layer<div class=3D"gmail_default" st=
yle=3D"font-family:georgia,serif;font-size:small;color:rgb(51,51,153);displ=
ay:inline">=E2=80=8B.=E2=80=8B</div><div><br>Is there a reason for observin=
g this ? Or is there something I missed in recipes ?<br><br>Here are the ch=
anges that I did to upgrade Qt:<br>- updated meta-qt5 layer to krogoth bran=
ch<br>- copied recipes-qt from meta-arago krogoth branch into my meta-arago=
 daisy branch<br>- updated my qtbase_%.bbappend for customization&#39;s<br>=
<br>Here is my qtbase_%.bbappend:<br><br>GLES_EXTRA_DEPS =3D &quot;&quot;<b=
r>PACKAGECONFIG[gles2] =3D &quot;-opengl es2 -eglfs,,virtual/libgles2 virtu=
al/egl ${GLES_EXTRA_DEPS}&quot;<br><br>PACKAGECONFIG +=3D &quot;accessibili=
ty icu&quot;<br><br>QT_CONFIG_FLAGS +=3D &quot; \<br>=C2=A0 =C2=A0 -qpa egl=
fs \<br>=C2=A0 =C2=A0 -freetype \<br>=C2=A0 =C2=A0 -no-iconv \<br>=C2=A0 =
=C2=A0 -no-linuxfb \<br>=C2=A0 =C2=A0 -no-directfb \<br>=C2=A0 =C2=A0 -noma=
ke examples \<br>=C2=A0 =C2=A0 -no-fontconfig \<br>=C2=A0 =C2=A0 -no-tslib =
\<br>=C2=A0 =C2=A0 -no-sql-sqlite \<br>=C2=A0 =C2=A0 -no-sql-sqlite2 \<br>=
=C2=A0 =C2=A0 -no-xcb \<br>=C2=A0 =C2=A0 -no-alsa \<br>=C2=A0 =C2=A0 -no-pu=
lseaudio \<br>&quot;<br><div class=3D"gmail_default" style=3D"font-family:g=
eorgia,serif;font-size:small;color:rgb(51,51,153)"><br></div>I also have re=
moved &quot;x11 wayland&quot; from DISTRO_FEATURES as MACHINE_FEATURES have=
 &quot;sgx&quot;<br><br>Here is the Qt configuration log:<br><br>Build opti=
ons:<br>=C2=A0 Configuration .......... accessibility audio-backend c++11 c=
lock-gettime clock-monotonic compile_examples concurrent cross_compile dbus=
 dbus-linked egl eglfs evdev eventfd freetype full-config getaddrinfo getif=
addrs glib harfbuzz icu inotify ipv6ifname kms large-config largefile libud=
ev medium-config minimal-config mremap neon nis no-widgets opengl opengles2=
 openssl pcre png posix_fallocate qpa qpa reduce_exports release shared sil=
ent small-config system-jpeg system-png system-zlib threadsafe-cloexec <br>=
=C2=A0 Build parts ............ libs<br>=C2=A0 Mode ................... rel=
ease<br>=C2=A0 Using sanitizer(s)...... none<br>=C2=A0 Using C++ standard .=
.... c++11<br>=C2=A0 Using gold linker....... no<br>=C2=A0 Using new DTAGS =
........ no<br>=C2=A0 Using PCH .............. no<br>=C2=A0 Using LTCG ....=
......... no<br>=C2=A0 Target compiler supports:<br>=C2=A0 =C2=A0 Neon ....=
............. yes<br><br>Qt modules and options:<br>=C2=A0 Qt D-Bus .......=
........ yes (linked to dbus-1)<br>=C2=A0 Qt Concurrent .......... yes<br>=
=C2=A0 Qt GUI ................. yes<br>=C2=A0 Qt Widgets ............. no<b=
r>=C2=A0 Large File ............. yes<br>=C2=A0 QML debugging .......... ye=
s<br>=C2=A0 Use system proxies ..... no<br><br>Support enabled for:<br>=C2=
=A0 Accessibility .......... yes<br>=C2=A0 ALSA ................... no<br>=
=C2=A0 CUPS ................... no<br>=C2=A0 Evdev .................. yes<b=
r>=C2=A0 FontConfig ............. no<br>=C2=A0 FreeType ............... qt<=
br>=C2=A0 Glib ................... yes<br>=C2=A0 GStreamer .............. n=
o<br>=C2=A0 GTK theme .............. no<br>=C2=A0 HarfBuzz ............... =
yes (bundled copy)<br>=C2=A0 Iconv .................. no<br>=C2=A0 ICU ....=
................ yes<br>=C2=A0 Image formats: <br>=C2=A0 =C2=A0 GIF .......=
........... yes (plugin, using bundled copy)<br>=C2=A0 =C2=A0 JPEG ........=
......... yes (plugin, using system library)<br>=C2=A0 =C2=A0 PNG .........=
......... yes (in QtGui, using system library)<br>=C2=A0 libinput..........=
...... no<br>=C2=A0 Logging backends: <br>=C2=A0 =C2=A0 journald ..........=
..... no<br>=C2=A0 =C2=A0 syslog =C2=A0 ............... no<br>=C2=A0 mtdev =
.................. no<br>=C2=A0 Networking: <br>=C2=A0 =C2=A0 getaddrinfo .=
......... yes<br>=C2=A0 =C2=A0 getifaddrs ........... yes<br>=C2=A0 =C2=A0 =
IPv6 ifname .......... yes<br>=C2=A0 =C2=A0 libproxy.............. no<br>=
=C2=A0 =C2=A0 OpenSSL .............. yes (loading libraries at run-time)<br=
>=C2=A0 NIS .................... yes<br>=C2=A0 OpenGL / OpenVG: <br>=C2=A0 =
=C2=A0 EGL .................. yes<br>=C2=A0 =C2=A0 OpenGL ............... y=
es (OpenGL ES 2.0+)<br>=C2=A0 =C2=A0 OpenVG ............... no<br>=C2=A0 PC=
RE ................... yes (bundled copy)<br>=C2=A0 pkg-config ............=
. yes <br>=C2=A0 PulseAudio ............. no<br>=C2=A0 QPA backends: <br>=
=C2=A0 =C2=A0 DirectFB ............. no<br>=C2=A0 =C2=A0 EGLFS ............=
.... yes<br>=C2=A0 =C2=A0 =C2=A0 EGLFS i.MX6 ........ no<br>=C2=A0 =C2=A0 =
=C2=A0 EGLFS i.MX6 Wayland. no<br>=C2=A0 =C2=A0 =C2=A0 EGLFS EGLDevice ....=
 no<br>=C2=A0 =C2=A0 =C2=A0 EGLFS GBM .......... no<br>=C2=A0 =C2=A0 =C2=A0=
 EGLFS Mali ......... no<br>=C2=A0 =C2=A0 =C2=A0 EGLFS Raspberry Pi . no<br=
>=C2=A0 =C2=A0 =C2=A0 EGLFS X11 .......... no<br>=C2=A0 =C2=A0 LinuxFB ....=
.......... no<br>=C2=A0 =C2=A0 Mir client............ no<br>=C2=A0 =C2=A0 X=
CB .................. no<br>=C2=A0 Session management ..... yes<br>=C2=A0 S=
QL drivers: <br>=C2=A0 =C2=A0 DB2 .................. no<br>=C2=A0 =C2=A0 In=
terBase ............ no<br>=C2=A0 =C2=A0 MySQL ................ no<br>=C2=
=A0 =C2=A0 OCI .................. no<br>=C2=A0 =C2=A0 ODBC ................=
. no<br>=C2=A0 =C2=A0 PostgreSQL ........... no<br>=C2=A0 =C2=A0 SQLite 2 .=
............ no<br>=C2=A0 =C2=A0 SQLite ............... no<br>=C2=A0 =C2=A0=
 TDS .................. no<br>=C2=A0 tslib .................. no<br>=C2=A0 =
udev ................... yes<br>=C2=A0 xkbcommon-x11........... no<br>=C2=
=A0 xkbcommon-evdev......... no<br>=C2=A0 zlib ................... yes (sys=
tem library)<br><div class=3D"gmail_default" style=3D"font-family:georgia,s=
erif;font-size:small;color:rgb(51,51,153)">=E2=80=8B</div><br><div class=3D=
"gmail_default" style=3D"font-family:georgia,serif;font-size:small;color:rg=
b(51,51,153)">=E2=80=8B<div class=3D"gmail_default" style=3D"display:inline=
">=E2=80=8B</div><span style=3D"font-family:arial,sans-serif;color:rgb(34,3=
4,34)">Any help in investigating this is appreciated as I would really like=
 to upgrade to Qt LTS.</span>=E2=80=8B</div><br>thanks<br>Ankur
</div></div>
</blockquote></div>

--001a1145009e9d14600536530365--
