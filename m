Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [198.47.19.12])
	by arago-project.org (Postfix) with ESMTPS id 07F6B52AA3
	for <meta-arago@arago-project.org>;
	Wed, 29 Jun 2016 22:00:57 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u5TM0v4b012046;
	Wed, 29 Jun 2016 17:00:57 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u5TM0v2a004743;
	Wed, 29 Jun 2016 17:00:57 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 29 Jun 2016 17:00:57 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u5TM0vgt026810;
	Wed, 29 Jun 2016 17:00:57 -0500
Date: Wed, 29 Jun 2016 18:00:56 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Ankur Tyagi <ankur.tyagi85@gmail.com>
Message-ID: <20160629220056.GA27055@edge>
References: <CADySD0EZ+BLv5pZ9N9Ju_4uKpbdjwrQFZoAVvWiOCkdqQv5Xyg@mail.gmail.com>
	<CADySD0E3zcHM1EPKv1dyEvxVmR+woMLbsbrvRvG4Kbna1QMWvg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADySD0E3zcHM1EPKv1dyEvxVmR+woMLbsbrvRvG4Kbna1QMWvg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
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
X-List-Received-Date: Wed, 29 Jun 2016 22:00:58 -0000
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Wasn't there a recent QML-related fix in SGX GLES code that might affect this?

http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/commit/?id=32077fb8f0b06258c9e3994c0649f49409eff41b

-- 
Denys


On Tue, Jun 28, 2016 at 09:10:54PM +1200, Ankur Tyagi wrote:
> Hi,
> 
> Is this the right mailing list for below query?
> 
> Thanks
> Ankur
> On 27-Jun-2016 6:26 pm, "Ankur Tyagi" <ankur.tyagi85@gmail.com> wrote:
> 
> > Hi,
> >
> > ​​
> > I am using daisy branch for development on AM335x based product.
> > Recently I updated Qt version from 5.4.1 (daisy) -> 5.6.1 (krogoth) as
> > Qt5.6.1 is declared as LTS.
> >
> > So I only updated meta-qt5 as I want rest of layers to be at daisy.
> >
> > My application is having runtime problems with Qt5.6.1. It is loading very
> > slowly and I can see UI changes like transparency on button getting set,
> > sliders moving in etc which were kind of spontaneous with Qt5.4.1
> >
> > It feels weird as if I am debugging through all the Qt qml code.
> > But if I run SGX demos, they all run fine which is expected as I only
> > update meta-qt5 layer
> > ​.​
> >
> > Is there a reason for observing this ? Or is there something I missed in
> > recipes ?
> >
> > Here are the changes that I did to upgrade Qt:
> > - updated meta-qt5 layer to krogoth branch
> > - copied recipes-qt from meta-arago krogoth branch into my meta-arago
> > daisy branch
> > - updated my qtbase_%.bbappend for customization's
> >
> > Here is my qtbase_%.bbappend:
> >
> > GLES_EXTRA_DEPS = ""
> > PACKAGECONFIG[gles2] = "-opengl es2 -eglfs,,virtual/libgles2 virtual/egl
> > ${GLES_EXTRA_DEPS}"
> >
> > PACKAGECONFIG += "accessibility icu"
> >
> > QT_CONFIG_FLAGS += " \
> >     -qpa eglfs \
> >     -freetype \
> >     -no-iconv \
> >     -no-linuxfb \
> >     -no-directfb \
> >     -nomake examples \
> >     -no-fontconfig \
> >     -no-tslib \
> >     -no-sql-sqlite \
> >     -no-sql-sqlite2 \
> >     -no-xcb \
> >     -no-alsa \
> >     -no-pulseaudio \
> > "
> >
> > I also have removed "x11 wayland" from DISTRO_FEATURES as MACHINE_FEATURES
> > have "sgx"
> >
> > Here is the Qt configuration log:
> >
> > Build options:
> >   Configuration .......... accessibility audio-backend c++11 clock-gettime
> > clock-monotonic compile_examples concurrent cross_compile dbus dbus-linked
> > egl eglfs evdev eventfd freetype full-config getaddrinfo getifaddrs glib
> > harfbuzz icu inotify ipv6ifname kms large-config largefile libudev
> > medium-config minimal-config mremap neon nis no-widgets opengl opengles2
> > openssl pcre png posix_fallocate qpa qpa reduce_exports release shared
> > silent small-config system-jpeg system-png system-zlib threadsafe-cloexec
> >   Build parts ............ libs
> >   Mode ................... release
> >   Using sanitizer(s)...... none
> >   Using C++ standard ..... c++11
> >   Using gold linker....... no
> >   Using new DTAGS ........ no
> >   Using PCH .............. no
> >   Using LTCG ............. no
> >   Target compiler supports:
> >     Neon ................. yes
> >
> > Qt modules and options:
> >   Qt D-Bus ............... yes (linked to dbus-1)
> >   Qt Concurrent .......... yes
> >   Qt GUI ................. yes
> >   Qt Widgets ............. no
> >   Large File ............. yes
> >   QML debugging .......... yes
> >   Use system proxies ..... no
> >
> > Support enabled for:
> >   Accessibility .......... yes
> >   ALSA ................... no
> >   CUPS ................... no
> >   Evdev .................. yes
> >   FontConfig ............. no
> >   FreeType ............... qt
> >   Glib ................... yes
> >   GStreamer .............. no
> >   GTK theme .............. no
> >   HarfBuzz ............... yes (bundled copy)
> >   Iconv .................. no
> >   ICU .................... yes
> >   Image formats:
> >     GIF .................. yes (plugin, using bundled copy)
> >     JPEG ................. yes (plugin, using system library)
> >     PNG .................. yes (in QtGui, using system library)
> >   libinput................ no
> >   Logging backends:
> >     journald ............... no
> >     syslog   ............... no
> >   mtdev .................. no
> >   Networking:
> >     getaddrinfo .......... yes
> >     getifaddrs ........... yes
> >     IPv6 ifname .......... yes
> >     libproxy.............. no
> >     OpenSSL .............. yes (loading libraries at run-time)
> >   NIS .................... yes
> >   OpenGL / OpenVG:
> >     EGL .................. yes
> >     OpenGL ............... yes (OpenGL ES 2.0+)
> >     OpenVG ............... no
> >   PCRE ................... yes (bundled copy)
> >   pkg-config ............. yes
> >   PulseAudio ............. no
> >   QPA backends:
> >     DirectFB ............. no
> >     EGLFS ................ yes
> >       EGLFS i.MX6 ........ no
> >       EGLFS i.MX6 Wayland. no
> >       EGLFS EGLDevice .... no
> >       EGLFS GBM .......... no
> >       EGLFS Mali ......... no
> >       EGLFS Raspberry Pi . no
> >       EGLFS X11 .......... no
> >     LinuxFB .............. no
> >     Mir client............ no
> >     XCB .................. no
> >   Session management ..... yes
> >   SQL drivers:
> >     DB2 .................. no
> >     InterBase ............ no
> >     MySQL ................ no
> >     OCI .................. no
> >     ODBC ................. no
> >     PostgreSQL ........... no
> >     SQLite 2 ............. no
> >     SQLite ............... no
> >     TDS .................. no
> >   tslib .................. no
> >   udev ................... yes
> >   xkbcommon-x11........... no
> >   xkbcommon-evdev......... no
> >   zlib ................... yes (system library)
> > ​
> >
> > ​
> > ​
> > Any help in investigating this is appreciated as I would really like to
> > upgrade to Qt LTS.​
> >
> > thanks
> > Ankur
> >

> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


