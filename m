Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-oi0-f48.google.com (mail-oi0-f48.google.com
	[209.85.218.48])
	by arago-project.org (Postfix) with ESMTPS id 2F54A52990
	for <meta-arago@arago-project.org>;
	Thu, 30 Jun 2016 09:40:28 +0000 (UTC)
Received: by mail-oi0-f48.google.com with SMTP id f189so56958432oig.3
	for <meta-arago@arago-project.org>;
	Thu, 30 Jun 2016 02:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=mkEnE/8ckXNZkKuOdEYN0WdzKE/kXS7cE/bnseyZw+w=;
	b=tmfyCT5KY9MTsE9JWXiEvlIYYAQEcXFYZp9yvim61bgQSbSvXU/blkk51iniEbehDz
	z2xomqxlkCqs4QuNH/JO6Ah6EOBeJRFDqTHRqad4xLj/k6Xf2Mg9iTHxo/WudzpTHFYe
	WAkibrC9zm0uEUXz3palon/2H00vmk1hElhfKkaMzS8as8h7S3hdIV+ACKZQm8DPpMkz
	5wrqil2bejmKEr8SnrfaMXuq4vlbAzoCU4PL+w9Pqpfzp0IXc2HOuWZH0yomjEQ3ju6Q
	nZjkHnjiQqT/u/e5yOCTANgiftduWaW5qxSk4dQbA39rt2yALgfemPm4plFoBb79aJOD
	QJmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=mkEnE/8ckXNZkKuOdEYN0WdzKE/kXS7cE/bnseyZw+w=;
	b=E1fOSJs3kJiOCx3nxp2Pktu4jXAgcH0fUlSMEt77jdHFj4mqdsL999Mt2QZ/DB1UAR
	xthN9Pl2OCmpanJOWQ2YzJugXoWxGmApeDIMHk/imHuKYv8268QiIT1/0EAJbKluXUJd
	1U7hP6tdG98sXILCXKYpHFvzbL9U3AWLDf9qQUowiLq7Q7oiF8MjFb5JnUeHd1OiYL9u
	j/ctLSyV/aRyK2l7jW+Bdm8FFRANWYz4jI6UF1BP4sHOFrxUFAbFOwVtr5njYpGHH3qT
	pPW+ZeAsa/XrOBrnBlLDhayZx9BNiH+p1MTq1Ce4Vngs/e+mEJxrghcGjBbQLvdTjP4Y
	4MrA==
X-Gm-Message-State: ALyK8tLBFD9gHj6kSYmS2CXi//QavPlzCBuU7OYHSSlXech1AFGN4ywezf+fgDoPvz/BXRqPGhdcsH5GndL26g==
MIME-Version: 1.0
X-Received: by 10.202.189.198 with SMTP id n189mr9043348oif.111.1467279627995; 
	Thu, 30 Jun 2016 02:40:27 -0700 (PDT)
Received: by 10.202.80.80 with HTTP; Thu, 30 Jun 2016 02:40:27 -0700 (PDT)
Received: by 10.202.80.80 with HTTP; Thu, 30 Jun 2016 02:40:27 -0700 (PDT)
In-Reply-To: <20160629220056.GA27055@edge>
References: <CADySD0EZ+BLv5pZ9N9Ju_4uKpbdjwrQFZoAVvWiOCkdqQv5Xyg@mail.gmail.com>
	<CADySD0E3zcHM1EPKv1dyEvxVmR+woMLbsbrvRvG4Kbna1QMWvg@mail.gmail.com>
	<20160629220056.GA27055@edge>
Date: Thu, 30 Jun 2016 21:40:27 +1200
Message-ID: <CADySD0G_JoFbBqb2BkQvtyOj8x85SyNjgw9uHkvWoyHaM4yPXQ@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-arago@arago-project.org
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
X-List-Received-Date: Thu, 30 Jun 2016 09:40:29 -0000
Content-Type: multipart/alternative; boundary=001a113d693a0350fc05367ba919

--001a113d693a0350fc05367ba919
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Denis,

But I only updated meta-qt5 to krogoth, rest all layers are still at Daisy.

So omap3-sgx is being used, the below mentioned commit would not have any
impact

Regards
Ankur
On 30-Jun-2016 10:00 am, "Denys Dmytriyenko" <denys@ti.com> wrote:

> Wasn't there a recent QML-related fix in SGX GLES code that might affect
> this?
>
>
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/commit/?id=3D32077fb8f0=
b06258c9e3994c0649f49409eff41b
>
> --
> Denys
>
>
> On Tue, Jun 28, 2016 at 09:10:54PM +1200, Ankur Tyagi wrote:
> > Hi,
> >
> > Is this the right mailing list for below query?
> >
> > Thanks
> > Ankur
> > On 27-Jun-2016 6:26 pm, "Ankur Tyagi" <ankur.tyagi85@gmail.com> wrote:
> >
> > > Hi,
> > >
> > > =E2=80=8B=E2=80=8B
> > > I am using daisy branch for development on AM335x based product.
> > > Recently I updated Qt version from 5.4.1 (daisy) -> 5.6.1 (krogoth) a=
s
> > > Qt5.6.1 is declared as LTS.
> > >
> > > So I only updated meta-qt5 as I want rest of layers to be at daisy.
> > >
> > > My application is having runtime problems with Qt5.6.1. It is loading
> very
> > > slowly and I can see UI changes like transparency on button getting
> set,
> > > sliders moving in etc which were kind of spontaneous with Qt5.4.1
> > >
> > > It feels weird as if I am debugging through all the Qt qml code.
> > > But if I run SGX demos, they all run fine which is expected as I only
> > > update meta-qt5 layer
> > > =E2=80=8B.=E2=80=8B
> > >
> > > Is there a reason for observing this ? Or is there something I missed
> in
> > > recipes ?
> > >
> > > Here are the changes that I did to upgrade Qt:
> > > - updated meta-qt5 layer to krogoth branch
> > > - copied recipes-qt from meta-arago krogoth branch into my meta-arago
> > > daisy branch
> > > - updated my qtbase_%.bbappend for customization's
> > >
> > > Here is my qtbase_%.bbappend:
> > >
> > > GLES_EXTRA_DEPS =3D ""
> > > PACKAGECONFIG[gles2] =3D "-opengl es2 -eglfs,,virtual/libgles2
> virtual/egl
> > > ${GLES_EXTRA_DEPS}"
> > >
> > > PACKAGECONFIG +=3D "accessibility icu"
> > >
> > > QT_CONFIG_FLAGS +=3D " \
> > >     -qpa eglfs \
> > >     -freetype \
> > >     -no-iconv \
> > >     -no-linuxfb \
> > >     -no-directfb \
> > >     -nomake examples \
> > >     -no-fontconfig \
> > >     -no-tslib \
> > >     -no-sql-sqlite \
> > >     -no-sql-sqlite2 \
> > >     -no-xcb \
> > >     -no-alsa \
> > >     -no-pulseaudio \
> > > "
> > >
> > > I also have removed "x11 wayland" from DISTRO_FEATURES as
> MACHINE_FEATURES
> > > have "sgx"
> > >
> > > Here is the Qt configuration log:
> > >
> > > Build options:
> > >   Configuration .......... accessibility audio-backend c++11
> clock-gettime
> > > clock-monotonic compile_examples concurrent cross_compile dbus
> dbus-linked
> > > egl eglfs evdev eventfd freetype full-config getaddrinfo getifaddrs
> glib
> > > harfbuzz icu inotify ipv6ifname kms large-config largefile libudev
> > > medium-config minimal-config mremap neon nis no-widgets opengl
> opengles2
> > > openssl pcre png posix_fallocate qpa qpa reduce_exports release share=
d
> > > silent small-config system-jpeg system-png system-zlib
> threadsafe-cloexec
> > >   Build parts ............ libs
> > >   Mode ................... release
> > >   Using sanitizer(s)...... none
> > >   Using C++ standard ..... c++11
> > >   Using gold linker....... no
> > >   Using new DTAGS ........ no
> > >   Using PCH .............. no
> > >   Using LTCG ............. no
> > >   Target compiler supports:
> > >     Neon ................. yes
> > >
> > > Qt modules and options:
> > >   Qt D-Bus ............... yes (linked to dbus-1)
> > >   Qt Concurrent .......... yes
> > >   Qt GUI ................. yes
> > >   Qt Widgets ............. no
> > >   Large File ............. yes
> > >   QML debugging .......... yes
> > >   Use system proxies ..... no
> > >
> > > Support enabled for:
> > >   Accessibility .......... yes
> > >   ALSA ................... no
> > >   CUPS ................... no
> > >   Evdev .................. yes
> > >   FontConfig ............. no
> > >   FreeType ............... qt
> > >   Glib ................... yes
> > >   GStreamer .............. no
> > >   GTK theme .............. no
> > >   HarfBuzz ............... yes (bundled copy)
> > >   Iconv .................. no
> > >   ICU .................... yes
> > >   Image formats:
> > >     GIF .................. yes (plugin, using bundled copy)
> > >     JPEG ................. yes (plugin, using system library)
> > >     PNG .................. yes (in QtGui, using system library)
> > >   libinput................ no
> > >   Logging backends:
> > >     journald ............... no
> > >     syslog   ............... no
> > >   mtdev .................. no
> > >   Networking:
> > >     getaddrinfo .......... yes
> > >     getifaddrs ........... yes
> > >     IPv6 ifname .......... yes
> > >     libproxy.............. no
> > >     OpenSSL .............. yes (loading libraries at run-time)
> > >   NIS .................... yes
> > >   OpenGL / OpenVG:
> > >     EGL .................. yes
> > >     OpenGL ............... yes (OpenGL ES 2.0+)
> > >     OpenVG ............... no
> > >   PCRE ................... yes (bundled copy)
> > >   pkg-config ............. yes
> > >   PulseAudio ............. no
> > >   QPA backends:
> > >     DirectFB ............. no
> > >     EGLFS ................ yes
> > >       EGLFS i.MX6 ........ no
> > >       EGLFS i.MX6 Wayland. no
> > >       EGLFS EGLDevice .... no
> > >       EGLFS GBM .......... no
> > >       EGLFS Mali ......... no
> > >       EGLFS Raspberry Pi . no
> > >       EGLFS X11 .......... no
> > >     LinuxFB .............. no
> > >     Mir client............ no
> > >     XCB .................. no
> > >   Session management ..... yes
> > >   SQL drivers:
> > >     DB2 .................. no
> > >     InterBase ............ no
> > >     MySQL ................ no
> > >     OCI .................. no
> > >     ODBC ................. no
> > >     PostgreSQL ........... no
> > >     SQLite 2 ............. no
> > >     SQLite ............... no
> > >     TDS .................. no
> > >   tslib .................. no
> > >   udev ................... yes
> > >   xkbcommon-x11........... no
> > >   xkbcommon-evdev......... no
> > >   zlib ................... yes (system library)
> > > =E2=80=8B
> > >
> > > =E2=80=8B
> > > =E2=80=8B
> > > Any help in investigating this is appreciated as I would really like =
to
> > > upgrade to Qt LTS.=E2=80=8B
> > >
> > > thanks
> > > Ankur
> > >
>
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>
>

--001a113d693a0350fc05367ba919
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Hi Denis,</p>
<p dir=3D"ltr">But I only updated meta-qt5 to krogoth, rest all layers are =
still at Daisy.</p>
<p dir=3D"ltr">So omap3-sgx is being used, the below mentioned commit would=
 not have any impact</p>
<p dir=3D"ltr">Regards <br>
Ankur</p>
<div class=3D"gmail_quote">On 30-Jun-2016 10:00 am, &quot;Denys Dmytriyenko=
&quot; &lt;<a href=3D"mailto:denys@ti.com">denys@ti.com</a>&gt; wrote:<br t=
ype=3D"attribution"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">Wasn&#39;t there a recen=
t QML-related fix in SGX GLES code that might affect this?<br>
<br>
<a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/commit/?id=3D3=
2077fb8f0b06258c9e3994c0649f49409eff41b" rel=3D"noreferrer" target=3D"_blan=
k">http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/commit/?id=3D32077fb8f=
0b06258c9e3994c0649f49409eff41b</a><br>
<br>
--<br>
Denys<br>
<br>
<br>
On Tue, Jun 28, 2016 at 09:10:54PM +1200, Ankur Tyagi wrote:<br>
&gt; Hi,<br>
&gt;<br>
&gt; Is this the right mailing list for below query?<br>
&gt;<br>
&gt; Thanks<br>
&gt; Ankur<br>
&gt; On 27-Jun-2016 6:26 pm, &quot;Ankur Tyagi&quot; &lt;<a href=3D"mailto:=
ankur.tyagi85@gmail.com">ankur.tyagi85@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; &gt; Hi,<br>
&gt; &gt;<br>
&gt; &gt; =E2=80=8B=E2=80=8B<br>
&gt; &gt; I am using daisy branch for development on AM335x based product.<=
br>
&gt; &gt; Recently I updated Qt version from 5.4.1 (daisy) -&gt; 5.6.1 (kro=
goth) as<br>
&gt; &gt; Qt5.6.1 is declared as LTS.<br>
&gt; &gt;<br>
&gt; &gt; So I only updated meta-qt5 as I want rest of layers to be at dais=
y.<br>
&gt; &gt;<br>
&gt; &gt; My application is having runtime problems with Qt5.6.1. It is loa=
ding very<br>
&gt; &gt; slowly and I can see UI changes like transparency on button getti=
ng set,<br>
&gt; &gt; sliders moving in etc which were kind of spontaneous with Qt5.4.1=
<br>
&gt; &gt;<br>
&gt; &gt; It feels weird as if I am debugging through all the Qt qml code.<=
br>
&gt; &gt; But if I run SGX demos, they all run fine which is expected as I =
only<br>
&gt; &gt; update meta-qt5 layer<br>
&gt; &gt; =E2=80=8B.=E2=80=8B<br>
&gt; &gt;<br>
&gt; &gt; Is there a reason for observing this ? Or is there something I mi=
ssed in<br>
&gt; &gt; recipes ?<br>
&gt; &gt;<br>
&gt; &gt; Here are the changes that I did to upgrade Qt:<br>
&gt; &gt; - updated meta-qt5 layer to krogoth branch<br>
&gt; &gt; - copied recipes-qt from meta-arago krogoth branch into my meta-a=
rago<br>
&gt; &gt; daisy branch<br>
&gt; &gt; - updated my qtbase_%.bbappend for customization&#39;s<br>
&gt; &gt;<br>
&gt; &gt; Here is my qtbase_%.bbappend:<br>
&gt; &gt;<br>
&gt; &gt; GLES_EXTRA_DEPS =3D &quot;&quot;<br>
&gt; &gt; PACKAGECONFIG[gles2] =3D &quot;-opengl es2 -eglfs,,virtual/libgle=
s2 virtual/egl<br>
&gt; &gt; ${GLES_EXTRA_DEPS}&quot;<br>
&gt; &gt;<br>
&gt; &gt; PACKAGECONFIG +=3D &quot;accessibility icu&quot;<br>
&gt; &gt;<br>
&gt; &gt; QT_CONFIG_FLAGS +=3D &quot; \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0-qpa eglfs \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0-freetype \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0-no-iconv \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0-no-linuxfb \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0-no-directfb \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0-nomake examples \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0-no-fontconfig \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0-no-tslib \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0-no-sql-sqlite \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0-no-sql-sqlite2 \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0-no-xcb \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0-no-alsa \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0-no-pulseaudio \<br>
&gt; &gt; &quot;<br>
&gt; &gt;<br>
&gt; &gt; I also have removed &quot;x11 wayland&quot; from DISTRO_FEATURES =
as MACHINE_FEATURES<br>
&gt; &gt; have &quot;sgx&quot;<br>
&gt; &gt;<br>
&gt; &gt; Here is the Qt configuration log:<br>
&gt; &gt;<br>
&gt; &gt; Build options:<br>
&gt; &gt;=C2=A0 =C2=A0Configuration .......... accessibility audio-backend =
c++11 clock-gettime<br>
&gt; &gt; clock-monotonic compile_examples concurrent cross_compile dbus db=
us-linked<br>
&gt; &gt; egl eglfs evdev eventfd freetype full-config getaddrinfo getifadd=
rs glib<br>
&gt; &gt; harfbuzz icu inotify ipv6ifname kms large-config largefile libude=
v<br>
&gt; &gt; medium-config minimal-config mremap neon nis no-widgets opengl op=
engles2<br>
&gt; &gt; openssl pcre png posix_fallocate qpa qpa reduce_exports release s=
hared<br>
&gt; &gt; silent small-config system-jpeg system-png system-zlib threadsafe=
-cloexec<br>
&gt; &gt;=C2=A0 =C2=A0Build parts ............ libs<br>
&gt; &gt;=C2=A0 =C2=A0Mode ................... release<br>
&gt; &gt;=C2=A0 =C2=A0Using sanitizer(s)...... none<br>
&gt; &gt;=C2=A0 =C2=A0Using C++ standard ..... c++11<br>
&gt; &gt;=C2=A0 =C2=A0Using gold linker....... no<br>
&gt; &gt;=C2=A0 =C2=A0Using new DTAGS ........ no<br>
&gt; &gt;=C2=A0 =C2=A0Using PCH .............. no<br>
&gt; &gt;=C2=A0 =C2=A0Using LTCG ............. no<br>
&gt; &gt;=C2=A0 =C2=A0Target compiler supports:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Neon ................. yes<br>
&gt; &gt;<br>
&gt; &gt; Qt modules and options:<br>
&gt; &gt;=C2=A0 =C2=A0Qt D-Bus ............... yes (linked to dbus-1)<br>
&gt; &gt;=C2=A0 =C2=A0Qt Concurrent .......... yes<br>
&gt; &gt;=C2=A0 =C2=A0Qt GUI ................. yes<br>
&gt; &gt;=C2=A0 =C2=A0Qt Widgets ............. no<br>
&gt; &gt;=C2=A0 =C2=A0Large File ............. yes<br>
&gt; &gt;=C2=A0 =C2=A0QML debugging .......... yes<br>
&gt; &gt;=C2=A0 =C2=A0Use system proxies ..... no<br>
&gt; &gt;<br>
&gt; &gt; Support enabled for:<br>
&gt; &gt;=C2=A0 =C2=A0Accessibility .......... yes<br>
&gt; &gt;=C2=A0 =C2=A0ALSA ................... no<br>
&gt; &gt;=C2=A0 =C2=A0CUPS ................... no<br>
&gt; &gt;=C2=A0 =C2=A0Evdev .................. yes<br>
&gt; &gt;=C2=A0 =C2=A0FontConfig ............. no<br>
&gt; &gt;=C2=A0 =C2=A0FreeType ............... qt<br>
&gt; &gt;=C2=A0 =C2=A0Glib ................... yes<br>
&gt; &gt;=C2=A0 =C2=A0GStreamer .............. no<br>
&gt; &gt;=C2=A0 =C2=A0GTK theme .............. no<br>
&gt; &gt;=C2=A0 =C2=A0HarfBuzz ............... yes (bundled copy)<br>
&gt; &gt;=C2=A0 =C2=A0Iconv .................. no<br>
&gt; &gt;=C2=A0 =C2=A0ICU .................... yes<br>
&gt; &gt;=C2=A0 =C2=A0Image formats:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0GIF .................. yes (plugin, using bund=
led copy)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0JPEG ................. yes (plugin, using syst=
em library)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0PNG .................. yes (in QtGui, using sy=
stem library)<br>
&gt; &gt;=C2=A0 =C2=A0libinput................ no<br>
&gt; &gt;=C2=A0 =C2=A0Logging backends:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0journald ............... no<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0syslog=C2=A0 =C2=A0............... no<br>
&gt; &gt;=C2=A0 =C2=A0mtdev .................. no<br>
&gt; &gt;=C2=A0 =C2=A0Networking:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0getaddrinfo .......... yes<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0getifaddrs ........... yes<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0IPv6 ifname .......... yes<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0libproxy.............. no<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0OpenSSL .............. yes (loading libraries =
at run-time)<br>
&gt; &gt;=C2=A0 =C2=A0NIS .................... yes<br>
&gt; &gt;=C2=A0 =C2=A0OpenGL / OpenVG:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0EGL .................. yes<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0OpenGL ............... yes (OpenGL ES 2.0+)<br=
>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0OpenVG ............... no<br>
&gt; &gt;=C2=A0 =C2=A0PCRE ................... yes (bundled copy)<br>
&gt; &gt;=C2=A0 =C2=A0pkg-config ............. yes<br>
&gt; &gt;=C2=A0 =C2=A0PulseAudio ............. no<br>
&gt; &gt;=C2=A0 =C2=A0QPA backends:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0DirectFB ............. no<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0EGLFS ................ yes<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0EGLFS i.MX6 ........ no<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0EGLFS i.MX6 Wayland. no<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0EGLFS EGLDevice .... no<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0EGLFS GBM .......... no<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0EGLFS Mali ......... no<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0EGLFS Raspberry Pi . no<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0EGLFS X11 .......... no<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0LinuxFB .............. no<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Mir client............ no<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0XCB .................. no<br>
&gt; &gt;=C2=A0 =C2=A0Session management ..... yes<br>
&gt; &gt;=C2=A0 =C2=A0SQL drivers:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0DB2 .................. no<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0InterBase ............ no<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0MySQL ................ no<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0OCI .................. no<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0ODBC ................. no<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0PostgreSQL ........... no<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0SQLite 2 ............. no<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0SQLite ............... no<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0TDS .................. no<br>
&gt; &gt;=C2=A0 =C2=A0tslib .................. no<br>
&gt; &gt;=C2=A0 =C2=A0udev ................... yes<br>
&gt; &gt;=C2=A0 =C2=A0xkbcommon-x11........... no<br>
&gt; &gt;=C2=A0 =C2=A0xkbcommon-evdev......... no<br>
&gt; &gt;=C2=A0 =C2=A0zlib ................... yes (system library)<br>
&gt; &gt; =E2=80=8B<br>
&gt; &gt;<br>
&gt; &gt; =E2=80=8B<br>
&gt; &gt; =E2=80=8B<br>
&gt; &gt; Any help in investigating this is appreciated as I would really l=
ike to<br>
&gt; &gt; upgrade to Qt LTS.=E2=80=8B<br>
&gt; &gt;<br>
&gt; &gt; thanks<br>
&gt; &gt; Ankur<br>
&gt; &gt;<br>
<br>
&gt; _______________________________________________<br>
&gt; meta-arago mailing list<br>
&gt; <a href=3D"mailto:meta-arago@arago-project.org">meta-arago@arago-proje=
ct.org</a><br>
&gt; <a href=3D"http://arago-project.org/cgi-bin/mailman/listinfo/meta-arag=
o" rel=3D"noreferrer" target=3D"_blank">http://arago-project.org/cgi-bin/ma=
ilman/listinfo/meta-arago</a><br>
<br>
</blockquote></div>

--001a113d693a0350fc05367ba919--
