Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
	[209.85.208.174])
	by arago-project.org (Postfix) with ESMTPS id 6CE1952092
	for <meta-arago@arago-project.org>;
	Sun, 14 Jul 2019 00:34:23 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id p17so12755774ljg.1
	for <meta-arago@arago-project.org>;
	Sat, 13 Jul 2019 17:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=zb7WLkOYd84C7y/0xyW3uqSeMYO+ta8LGcP6w39jDo0=;
	b=o7MSnOIS5lZ3LSV1LH/h5vIl1Qh+sCPO9xTPA8pIBW2WRzCU+fjmmGxOpyC+pdUCDo
	W3OvjC1x3HIUNPOoOzCM4HeOwW65hcnmtmjjFya1+QQdSn2i6SE13N9T1VUSQ9KM9oXx
	NuJcNrtCAB3AXDF8/dMuBhiGjPzEzoT+lxs6IYH9JgY84zYojNHXwjPJpQdoc65mL948
	Thw8MMZc5BJB1LZa1SkjGrX8R8vWSwEPSUsYBWJn2JExnW1h/VowFTtHzoUb2XrA7rlN
	QKhhoQuq3Je2eB0YwXG7H5MSpnrdBHJhtJDoAju0+844vO6g+bo2S0miBZXMd34TPxIa
	wVQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=zb7WLkOYd84C7y/0xyW3uqSeMYO+ta8LGcP6w39jDo0=;
	b=EwBLX91jfCHmBJarNE5mvisT0aCcb8/nCYtX11LaqIHnAR+IDvVz2396ojRuklEexW
	VyrPqmdG+rWHKSmLFnlqQRg56g592LiJJlnsMU+fWJcgKd065pdHcLSTHoAhdM4HmM0N
	5UktAmCfYFQuT/Kx/8V+qSfi7cu5Fd+d14PS1rsSKScLfoyaDGIxs4f/6FDIAD00w7jC
	GxZlagABRTuNrwk6dad0sSi/DEh+ILhFrsbibV2ev4vfQbiRCMMXCV9VA+A3BdR/8WN/
	KW8ZXIJUBm4y4oEDvykzIbWU4+1HRmqKrkXMiYq3LA4Uqqb/SvjbJCfNVyU6gAKFIz7d
	RJ6A==
X-Gm-Message-State: APjAAAUvCaeXlKXg3qJ77OkCj9/gYUCWXg9VXYFtEx10Nu8g+n09JGez
	Oa2zvN65n3wAKAd6bTAfSDUrhZNjaJtDV7mroQg=
X-Google-Smtp-Source: APXvYqxWsY0P+aIxut70ROWrj3EoViGn8/I+PHWih3efFKkxY7tT2phBK2krxs9Mt1rJF8OwK4A9NRaj2M89QdS/GrU=
X-Received: by 2002:a2e:8613:: with SMTP id a19mr9698645lji.163.1563064413984; 
	Sat, 13 Jul 2019 17:33:33 -0700 (PDT)
MIME-Version: 1.0
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Sun, 14 Jul 2019 12:33:22 +1200
Message-ID: <CADySD0E=Z5Oxk4kTsySokmS+FzakEydwg6eOM8U=tVDt2NCa_g@mail.gmail.com>
To: meta-ti@yoctoproject.org, meta-arago@arago-project.org
Subject: Qt configuration for AM335x-EVM
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
X-List-Received-Date: Sun, 14 Jul 2019 00:34:24 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

I trying to get my head around correct Qt configuration for am335x-evm
without support for X11 and Wayland.

I am trying to build a custom image based upon arago distro, thud branch.

Below is my qtbase package config:
bitbake -e qtbase | grep "^PACKAGECONFIG_CONFARGS="
PACKAGECONFIG_CONFARGS=" -accessibility -no-cups -dbus -no-directfb
-no-eglfs -evdev -nomake examples -no-fontconfig -qt-freetype -gbm
-no-feature-getentropy -gif -opengl es2 -eglfs -no-glib -no-gtk
-qt-harfbuzz -no-ico -no-iconv -no-icu -no-journald -system-libjpeg
-kms -libinput -system-libpng -no-libproxy -make libs -no-linuxfb
-no-mtdev -openssl -qt-pcre -release -no-sm -no-sql-db2 -no-sql-ibase
-no-sql-mysql -no-sql-oci -no-sql-odbc -no-sql-psql -no-sql-sqlite
-no-sql-sqlite2 -no-sql-tds -shared -nomake tests -make tools
-no-tslib -libudev -no-widgets -no-xcb -no-xinput2 -no-xkb
-no-xkbcommon -no-xkbcommon-evdev -system-zlib"

Is this correct? Do I have to add "kms gbm"  even if QPA backend is EGLFS?

Below is the configuration summary from configure task:

Configure summary:

Building on: linux-oe-g++ (arm, CPU features: neon)
Building for: linux-oe-g++ (arm, CPU features: neon)
Configuration: cross_compile compile_examples enable_new_dtags
largefile neon silent shared release c++11 c++14 c++1z concurrent dbus
reduce_exports stl no-widgets
Build options:
  Mode ................................... release
  Optimize release build for size ........ no
  Building shared libraries .............. yes
  Using C++ standard ..................... C++1z
  Using ccache ........................... no
  Using gold linker ...................... no
  Using new DTAGS ........................ yes
  Using precompiled headers .............. no
  Using LTCG ............................. no
  Target compiler supports:
    NEON ................................. yes
  Build parts ............................ libs tools
Qt modules and options:
  Qt Concurrent .......................... yes
  Qt D-Bus ............................... yes
  Qt D-Bus directly linked to libdbus .... yes
  Qt Gui ................................. yes
  Qt Network ............................. yes
  Qt Sql ................................. yes
  Qt Testlib ............................. yes
  Qt Widgets ............................. no
  Qt Xml ................................. yes
Support enabled for:
  Using pkg-config ....................... yes
  udev ................................... yes
  Using system zlib ...................... yes
Qt Core:
  DoubleConversion ....................... yes
    Using system DoubleConversion ........ no
  GLib ................................... no
  iconv .................................. no
  ICU .................................... no
  Tracing backend ........................ <none>
  Logging backends:
    journald ............................. no
    syslog ............................... no
    slog2 ................................ no
  Using system PCRE2 ..................... no
Qt Network:
  getifaddrs() ........................... yes
  IPv6 ifname ............................ yes
  libproxy ............................... no
  Linux AF_NETLINK ....................... yes
  OpenSSL ................................ yes
    Qt directly linked to OpenSSL ........ no
  OpenSSL 1.1 ............................ yes
  SCTP ................................... no
  Use system proxies ..................... yes
Qt Gui:
  Accessibility .......................... yes
  FreeType ............................... yes
    Using system FreeType ................ no
  HarfBuzz ............................... yes
    Using system HarfBuzz ................ no
  Fontconfig ............................. no
  Image formats:
    GIF .................................. yes
    ICO .................................. no
    JPEG ................................. yes
      Using system libjpeg ............... yes
    PNG .................................. yes
      Using system libpng ................ yes
  EGL .................................... yes
  OpenVG ................................. no
  OpenGL:
    Desktop OpenGL ....................... no
    OpenGL ES 2.0 ........................ yes
    OpenGL ES 3.0 ........................ no
    OpenGL ES 3.1 ........................ no
    OpenGL ES 3.2 ........................ no
  Vulkan ................................. no
  Session Management ..................... no
Features used by QPA backends:
  evdev .................................. yes
  libinput ............................... yes
  INTEGRITY HID .......................... no
  mtdev .................................. no
  tslib .................................. no
  xkbcommon-evdev ........................ no
QPA backends:
  DirectFB ............................... no
  EGLFS .................................. yes
  EGLFS details:
    EGLFS OpenWFD ........................ no
    EGLFS i.Mx6 .......................... no
    EGLFS i.Mx6 Wayland .................. no
    EGLFS RCAR ........................... no
    EGLFS EGLDevice ...................... no
    EGLFS GBM ............................ yes
    EGLFS VSP2 ........................... no
    EGLFS Mali ........................... no
    EGLFS Raspberry Pi ................... no
    EGL on X11 ........................... no
  LinuxFB ................................ no
  VNC .................................... yes
  Mir client ............................. no
Qt Widgets:
  GTK+ ................................... no
  Styles ................................. Fusion Windows
Qt PrintSupport:
  CUPS ................................... no
Qt Sql:
  DB2 (IBM) .............................. no
  InterBase .............................. no
  MySql .................................. no
  OCI (Oracle) ........................... no
  ODBC ................................... no
  PostgreSQL ............................. no
  SQLite2 ................................ no
  SQLite ................................. no
    Using system provided SQLite ......... no
  TDS (Sybase) ........................... no
Qt Testlib:
  Tester for item models ................. yes


Thanks
Ankur

