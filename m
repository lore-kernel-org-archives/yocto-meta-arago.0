Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 5CC3652A4B
	for <meta-arago@arago-project.org>;
	Tue, 15 Nov 2016 17:41:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4C2342099C;
	Tue, 15 Nov 2016 17:41:30 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id zeXRWEdnwPR7; Tue, 15 Nov 2016 17:41:30 +0000 (UTC)
Received: from gandalf.denix.org (pool-100-15-106-107.washdc.fios.verizon.net
	[100.15.106.107])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1F9242091B;
	Tue, 15 Nov 2016 17:41:29 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by gandalf.denix.org (Postfix) with ESMTP id 6B1E9162199;
	Tue, 15 Nov 2016 12:41:28 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 15 Nov 2016 12:41:28 -0500
Message-Id: <1479231688-8605-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] gstreamer: remove remaining old .inc files, leave plugins-bad bbappend for 1.6.3
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
X-List-Received-Date: Tue, 15 Nov 2016 17:41:30 -0000

From: Denys Dmytriyenko <denys@ti.com>

Changes from 1.6.3 bbappend break plugins-bad 1.8.3 due to new introspection support.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../gstreamer/gst-plugins-package.inc              |  57 ---------
 .../gstreamer/gstreamer1.0-libav.inc               |  31 -----
 .../gstreamer/gstreamer1.0-plugins-bad.inc         | 135 ---------------------
 ...end => gstreamer1.0-plugins-bad_1.6.3.bbappend} |   0
 .../gstreamer/gstreamer1.0-plugins-base.inc        |  40 ------
 .../gstreamer/gstreamer1.0-plugins-good.inc        |  58 ---------
 .../gstreamer/gstreamer1.0-plugins-ugly.inc        |  30 -----
 .../gstreamer/gstreamer1.0-plugins.inc             |  56 ---------
 .../recipes-multimedia/gstreamer/gstreamer1.0.inc  |  27 -----
 9 files changed, 434 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-package.inc
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
 rename meta-arago-extras/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.8.3.bbappend => gstreamer1.0-plugins-bad_1.6.3.bbappend} (100%)
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly.inc
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0.inc

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-package.inc b/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-package.inc
deleted file mode 100644
index 617a735..0000000
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-package.inc
+++ /dev/null
@@ -1,57 +0,0 @@
-PACKAGESPLITFUNCS_prepend = " split_gstreamer10_packages "
-PACKAGESPLITFUNCS_append = " set_metapkg_rdepends "
-
-python split_gstreamer10_packages () {
-    gst_libdir = d.expand('${libdir}/gstreamer-${LIBV}')
-    postinst = d.getVar('plugin_postinst', True)
-    glibdir = d.getVar('libdir', True)
-
-    do_split_packages(d, glibdir, '^lib(.*)\.so\.*', 'lib%s', 'gstreamer %s library', extra_depends='', allow_links=True)
-    do_split_packages(d, gst_libdir, 'libgst(.*)\.so$', d.expand('${PN}-%s'), 'GStreamer plugin for %s', postinst=postinst, extra_depends='')
-    do_split_packages(d, gst_libdir, 'libgst(.*)\.la$', d.expand('${PN}-%s-dev'), 'GStreamer plugin for %s (development files)', extra_depends=d.expand('${PN}-dev'))
-    do_split_packages(d, gst_libdir, 'libgst(.*)\.a$', d.expand('${PN}-%s-staticdev'), 'GStreamer plugin for %s (static development files)', extra_depends=d.expand('${PN}-staticdev'))
-}
-
-python set_metapkg_rdepends () {
-    import os
-
-    pn = d.getVar('PN', True)
-    metapkg =  pn + '-meta'
-    d.setVar('ALLOW_EMPTY_' + metapkg, "1")
-    d.setVar('FILES_' + metapkg, "")
-    blacklist = [ pn, pn + '-locale', pn + '-dev', pn + '-dbg', pn + '-doc', pn + '-meta' ]
-    metapkg_rdepends = []
-    packages = d.getVar('PACKAGES', True).split()
-    pkgdest = d.getVar('PKGDEST', True)
-    for pkg in packages[1:]:
-        if not pkg in blacklist and not pkg in metapkg_rdepends and not pkg.endswith('-dev') and not pkg.endswith('-dbg') and not pkg.count('locale') and not pkg.count('-staticdev'):
-            # See if the package is empty by looking at the contents of its PKGDEST subdirectory. 
-            # If this subdirectory is empty, then the package is.
-            # Empty packages do not get added to the meta package's RDEPENDS
-            pkgdir = os.path.join(pkgdest, pkg)
-            if os.path.exists(pkgdir):
-                dir_contents = os.listdir(pkgdir) or []
-            else:
-                dir_contents = []
-            is_empty = len(dir_contents) == 0
-            if not is_empty:
-                metapkg_rdepends.append(pkg)
-    d.setVar('RDEPENDS_' + metapkg, ' '.join(metapkg_rdepends))
-    d.setVar('DESCRIPTION_' + metapkg, pn + ' meta package')
-}
-
-# each plugin-dev depends on PN-dev, plugin-staticdev on PN-staticdev
-# so we need them even when empty (like in gst-plugins-good case)
-ALLOW_EMPTY_${PN} = "1"
-ALLOW_EMPTY_${PN}-dev = "1"
-ALLOW_EMPTY_${PN}-staticdev = "1"
-
-PACKAGES += "${PN}-apps ${PN}-meta ${PN}-glib"
-FILES_${PN}-apps = "${bindir}"
-
-RDEPENDS_${PN}-apps += "perl"
-RRECOMMENDS_${PN} += "${PN}-meta"
-
-FILES_${PN} = ""
-FILES_${PN}-dbg += "${libdir}/gstreamer-${LIBV}/.debug"
-FILES_${PN}-glib = "${datadir}/glib-2.0"
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc
deleted file mode 100644
index 6c8bc95..0000000
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc
+++ /dev/null
@@ -1,31 +0,0 @@
-SUMMARY = "Libav-based GStreamer 1.x plugin"
-SECTION = "multimedia"
-LICENSE = "GPLv2+ & LGPLv2+ & ( (GPLv2+ & LGPLv2.1+) | (GPLv3+ & LGPLv3+) )"
-LICENSE_FLAGS = "commercial"
-HOMEPAGE = "http://www.gstreamer.net/"
-DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base zlib bzip2"
-
-inherit autotools pkgconfig
-
-# CAUTION: Using the system libav is not recommended. Since the libav API is changing all the time,
-# compilation errors (and other, more subtle bugs) can happen. It is usually better to rely on the
-# libav copy included in the gst-libav package.
-PACKAGECONFIG ??= " orc yasm "
-PACKAGECONFIG[libav] = "--with-system-libav,,libav"
-PACKAGECONFIG[lgpl]  = "--enable-lgpl,,"
-PACKAGECONFIG[yasm]  = "--enable-yasm,--disable-yasm,yasm-native"
-PACKAGECONFIG[orc]  = "--enable-orc,--disable-orc,orc"
-
-
-GSTREAMER_1_0_DEBUG ?= "--disable-debug"
-
-LIBAV_EXTRA_CONFIGURE = "--with-libav-extra-configure"
-LIBAV_EXTRA_CONFIGURE_COMMON = \
-'${LIBAV_EXTRA_CONFIGURE}="${LIBAV_EXTRA_CONFIGURE_COMMON_ARG}"'
-
-EXTRA_OECONF = "${LIBAV_EXTRA_CONFIGURE_COMMON}"
-
-FILES_${PN} += "${libdir}/gstreamer-1.0/*.so"
-FILES_${PN}-dbg += "${libdir}/gstreamer-1.0/.debug"
-FILES_${PN}-dev += "${libdir}/gstreamer-1.0/*.la"
-FILES_${PN}-staticdev += "${libdir}/gstreamer-1.0/*.a"
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
deleted file mode 100644
index 85ef6ce..0000000
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
+++ /dev/null
@@ -1,135 +0,0 @@
-require gstreamer1.0-plugins.inc
-
-LICENSE = "GPLv2+ & LGPLv2+ & LGPLv2.1+ "
-
-DEPENDS += "gstreamer1.0-plugins-base bzip2 libpng jpeg"
-
-S = "${WORKDIR}/gst-plugins-bad-${PV}"
-
-SRC_URI += "file://configure-allow-to-disable-libssh2.patch \
-           "
-
-inherit gettext bluetooth
-
-# opengl packageconfig factored out to make it easy for distros
-# and BSP layers to pick either (desktop) opengl, gles2, or no GL
-PACKAGECONFIG_GL ?= "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gles2', '', d)}"
-
-PACKAGECONFIG ??= " \
-    ${PACKAGECONFIG_GL} \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)} \
-    orc curl uvch264 neon sndfile \
-    hls sbc dash bz2 smoothstreaming \
-    "
-
-# dash = Dynamic Adaptive Streaming over HTTP
-PACKAGECONFIG[assrender]       = "--enable-assrender,--disable-assrender,libass"
-PACKAGECONFIG[curl]            = "--enable-curl,--disable-curl,curl"
-PACKAGECONFIG[gles2]           = "--enable-gles2,--disable-gles2,virtual/libgles2"
-PACKAGECONFIG[opengl]          = "--enable-opengl,--disable-opengl,virtual/libgl libglu"
-PACKAGECONFIG[faac]            = "--enable-faac,--disable-faac,faac"
-PACKAGECONFIG[faad]            = "--enable-faad,--disable-faad,faad2"
-PACKAGECONFIG[libmms]          = "--enable-libmms,--disable-libmms,libmms"
-PACKAGECONFIG[modplug]         = "--enable-modplug,--disable-modplug,libmodplug"
-PACKAGECONFIG[mpg123]          = "--enable-mpg123,--disable-mpg123,mpg123"
-PACKAGECONFIG[opus]            = "--enable-opus,--disable-opus,libopus"
-PACKAGECONFIG[flite]           = "--enable-flite,--disable-flite,flite-alsa"
-PACKAGECONFIG[opencv]          = "--enable-opencv,--disable-opencv,opencv"
-PACKAGECONFIG[wayland]         = "--enable-wayland --enable-egl,--disable-wayland --disable-egl,wayland virtual/egl"
-PACKAGECONFIG[uvch264]         = "--enable-uvch264,--disable-uvch264,libusb1 udev"
-PACKAGECONFIG[directfb]        = "--enable-directfb,--disable-directfb,directfb"
-PACKAGECONFIG[neon]            = "--enable-neon,--disable-neon,neon"
-PACKAGECONFIG[openal]          = "--enable-openal,--disable-openal,openal-soft"
-PACKAGECONFIG[hls]             = "--enable-hls,--disable-hls,gnutls"
-PACKAGECONFIG[sbc]             = "--enable-sbc,--disable-sbc,sbc"
-PACKAGECONFIG[dash]            = "--enable-dash,--disable-dash,libxml2"
-PACKAGECONFIG[bz2]             = "--enable-bz2,--disable-bz2,bzip2"
-PACKAGECONFIG[fluidsynth]      = "--enable-fluidsynth,--disable-fluidsynth,fluidsynth"
-PACKAGECONFIG[schroedinger]    = "--enable-schro,--disable-schro,schroedinger"
-PACKAGECONFIG[smoothstreaming] = "--enable-smoothstreaming,--disable-smoothstreaming,libxml2"
-PACKAGECONFIG[bluez]          = "--enable-bluez,--disable-bluez,${BLUEZ}"
-PACKAGECONFIG[rsvg]            = "--enable-rsvg,--disable-rsvg,librsvg"
-PACKAGECONFIG[sndfile]         = "--enable-sndfile,--disable-sndfile,libsndfile1"
-PACKAGECONFIG[webp]            = "--enable-webp,--disable-webp,libwebp"
-PACKAGECONFIG[rtmp]            = "--enable-rtmp,--disable-rtmp,rtmpdump"
-PACKAGECONFIG[libssh2]         = "--enable-libssh2,--disable-libssh2,libssh2"
-
-# these plugins have not been ported to 1.0 (yet):
-#   directdraw vcd apexsink dc1394 lv2 linsys musepack mythtv
-#   nas timidity teletextdec sdl xvid wininet acm gsettings
-#   sndio qtwrapper cdxaparse dccp faceoverlay hdvparse tta
-#   mve nuvdemux osx_video patchdetect quicktime real sdi
-#   videomeasure gsettings
-
-# these plugins have no corresponding library in OE-core or meta-openembedded:
-#   openni2 winks direct3d directdraw directsound winscreencap osx_video
-#   apple_media android_media avc chromaprint daala dts gme gsm kate ladspa mimic
-#   mpeg2enc mplex ofa openjpeg opensles pvr resindvd rtmp soundtouch spandsp spc
-#   srtp vdpau voaacenc voamrwbenc wasapi zbar
-
-EXTRA_OECONF += " \
-    --enable-dvb \
-    --enable-shm \
-    --enable-fbdev \
-    --enable-decklink \
-    --disable-acm \
-    --disable-android_media \
-    --disable-apexsink \
-    --disable-apple_media \
-    --disable-avc \
-    --disable-chromaprint \
-    --disable-cocoa \
-    --disable-daala \
-    --disable-dc1394 \
-    --disable-direct3d \
-    --disable-directdraw \
-    --disable-directsound \
-    --disable-dts \
-    --disable-gme \
-    --disable-gsettings \
-    --disable-gsm \
-    --disable-kate \
-    --disable-ladspa \
-    --disable-linsys \
-    --disable-lv2 \
-    --disable-mimic \
-    --disable-mpeg2enc \
-    --disable-mplex \
-    --disable-musepack \
-    --disable-mythtv \
-    --disable-nas \
-    --disable-ofa \
-    --disable-openjpeg \
-    --disable-opensles \
-    --disable-osx_video \
-    --disable-pvr \
-    --disable-quicktime \
-    --disable-resindvd \
-    --disable-sdl \
-    --disable-sdltest \
-    --disable-sndio \
-    --disable-soundtouch \
-    --disable-spandsp \
-    --disable-spc \
-    --disable-srtp \
-    --disable-teletextdec \
-    --disable-timidity \
-    --disable-vcd \
-    --disable-vdpau \
-    --disable-voaacenc \
-    --disable-voamrwbenc \
-    --disable-wasapi \
-    --disable-wildmidi \
-    --disable-wininet \
-    --disable-winscreencap \
-    --disable-xvid \
-    --disable-zbar \
-    ${GSTREAMER_1_0_ORC} \
-    ${@bb.utils.contains("TUNE_FEATURES", "mx32", "--disable-yadif", "", d)} \
-    "
-
-ARM_INSTRUCTION_SET = "arm"
-
-FILES_gstreamer1.0-plugins-bad-opencv += "${datadir}/gst-plugins-bad/1.0/opencv*"
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.3.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend
similarity index 100%
rename from meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.3.bbappend
rename to meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
deleted file mode 100644
index 06eac67..0000000
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
+++ /dev/null
@@ -1,40 +0,0 @@
-require gstreamer1.0-plugins.inc
-
-LICENSE = "GPLv2+ & LGPLv2+"
-
-DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 libxv', '', d)}"
-DEPENDS += "freetype liboil util-linux"
-
-inherit gettext
-
-PACKAGES_DYNAMIC =+ "^libgst.*"
-
-PACKAGECONFIG ??= " \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)} \
-    orc ivorbis ogg theora vorbis \
-    "
-
-X11DEPENDS = "virtual/libx11 libsm libxrender"
-X11ENABLEOPTS = "--enable-x --enable-xvideo --enable-xshm"
-X11DISABLEOPTS = "--disable-x --disable-xvideo --disable-xshm"
-PACKAGECONFIG[x11]     = "${X11ENABLEOPTS},${X11DISABLEOPTS},${X11DEPENDS}"
-PACKAGECONFIG[alsa]    = "--enable-alsa,--disable-alsa,alsa-lib"
-PACKAGECONFIG[ivorbis] = "--enable-ivorbis,--disable-ivorbis,tremor"
-PACKAGECONFIG[ogg]     = "--enable-ogg,--disable-ogg,libogg"
-PACKAGECONFIG[theora]  = "--enable-theora,--disable-theora,libtheora"
-PACKAGECONFIG[vorbis]  = "--enable-vorbis,--disable-vorbis,libvorbis"
-PACKAGECONFIG[pango]   = "--enable-pango,--disable-pango,pango"
-
-
-# cdparanoia and libvisual do not seem to exist anywhere in OE
-EXTRA_OECONF += " \
-    --disable-freetypetest \
-    --disable-cdparanoia \
-    --disable-libvisual \
-    ${GSTREAMER_1_0_ORC} \
-"
-
-FILES_${MLPREFIX}libgsttag-1.0 += "${datadir}/gst-plugins-base/1.0/license-translations.dict"
-
-CACHED_CONFIGUREVARS_append_i586 = " ac_cv_header_emmintrin_h=no ac_cv_header_xmmintrin_h=no"
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
deleted file mode 100644
index 37217f0..0000000
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
+++ /dev/null
@@ -1,58 +0,0 @@
-require gstreamer1.0-plugins.inc
-
-LICENSE = "GPLv2+ & LGPLv2.1+"
-
-# libid3tag
-DEPENDS += "gstreamer1.0-plugins-base zlib bzip2 libcap"
-
-inherit gettext
-
-
-PACKAGECONFIG ??= " \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)} \
-    orc cairo flac gdk-pixbuf gudev jpeg libpng soup speex taglib \
-    "
-
-X11DEPENDS = "virtual/libx11 libsm libxrender libxfixes libxdamage"
-X11ENABLEOPTS = "--enable-x --enable-xshm"
-X11DISABLEOPTS = "--disable-x --disable-xshm"
-PACKAGECONFIG[x11]        = "${X11ENABLEOPTS},${X11DISABLEOPTS},${X11DEPENDS}"
-PACKAGECONFIG[pulseaudio] = "--enable-pulse,--disable-pulse,pulseaudio"
-PACKAGECONFIG[cairo]      = "--enable-cairo,--disable-cairo,cairo"
-PACKAGECONFIG[flac]       = "--enable-flac,--disable-flac,flac"
-PACKAGECONFIG[gdk-pixbuf] = "--enable-gdk_pixbuf,--disable-gdk_pixbuf,gdk-pixbuf"
-PACKAGECONFIG[gudev]      = "--with-gudev,--without-gudev,udev"
-PACKAGECONFIG[jack]       = "--enable-jack,--disable-jack,jack"
-PACKAGECONFIG[jpeg]       = "--enable-jpeg,--disable-jpeg,jpeg"
-PACKAGECONFIG[libpng]     = "--enable-libpng,--disable-libpng,libpng"
-PACKAGECONFIG[soup]       = "--enable-soup,--disable-soup,libsoup-2.4"
-PACKAGECONFIG[speex]      = "--enable-speex,--disable-speex,speex"
-PACKAGECONFIG[taglib]     = "--enable-taglib,--disable-taglib,taglib"
-PACKAGECONFIG[vpx]        = "--enable-vpx,--disable-vpx,libvpx"
-PACKAGECONFIG[wavpack]    = "--enable-wavpack,--disable-wavpack,wavpack"
-
-# the 1394 plugins require both libraw1394 and libiec61883
-# the former is included in meta-oe, the latter isn't
-# -> disabled
-
-EXTRA_OECONF += " \
-    --enable-oss \
-    --enable-gst_v4l2 \
-    --without-libv4l2 \
-    --disable-directsound \
-    --disable-waveform \
-    --disable-oss4 \
-    --disable-sunaudio \
-    --disable-osx_audio \
-    --disable-osx_video \
-    --disable-aalib \
-    --disable-libcaca \
-    --disable-libdv \
-    --disable-shout2 \
-    --disable-examples \
-    --disable-dv1394 \
-    ${GSTREAMER_1_0_ORC} \
-"
-
-FILES_${PN}-equalizer += "${datadir}/gstreamer-1.0/presets/*.prs"
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly.inc b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly.inc
deleted file mode 100644
index 2dd8ea5..0000000
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly.inc
+++ /dev/null
@@ -1,30 +0,0 @@
-require gstreamer1.0-plugins.inc
-
-LICENSE = "GPLv2+ & LGPLv2.1+ & LGPLv2+"
-LICENSE_FLAGS = "commercial"
-
-DEPENDS += "gstreamer1.0-plugins-base libid3tag"
-
-inherit gettext
-
-
-PACKAGECONFIG ??= " \
-    orc a52dec lame mad mpeg2dec \
-    "
-
-PACKAGECONFIG[a52dec]   = "--enable-a52dec,--disable-a52dec,liba52"
-PACKAGECONFIG[cdio]     = "--enable-cdio,--disable-cdio,libcdio"
-PACKAGECONFIG[dvdread]  = "--enable-dvdread,--disable-dvdread,libdvdread"
-PACKAGECONFIG[lame]     = "--enable-lame,--disable-lame,lame"
-PACKAGECONFIG[mad]      = "--enable-mad,--disable-mad,libmad"
-PACKAGECONFIG[mpeg2dec] = "--enable-mpeg2dec,--disable-mpeg2dec,mpeg2dec"
-PACKAGECONFIG[x264]     = "--enable-x264,--disable-x264,x264"
-
-
-EXTRA_OECONF += " \
-    --disable-amrnb \
-    --disable-amrwb \
-    --disable-sidplay \
-    --disable-twolame \
-    ${GSTREAMER_1_0_ORC} \
-    "
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
deleted file mode 100644
index c3a2db1..0000000
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
+++ /dev/null
@@ -1,56 +0,0 @@
-SUMMARY = "Plugins for the GStreamer multimedia framework 1.x"
-HOMEPAGE = "http://gstreamer.freedesktop.org/"
-BUGTRACKER = "https://bugzilla.gnome.org/enter_bug.cgi?product=Gstreamer"
-SECTION = "multimedia"
-DEPENDS = "gstreamer1.0"
-
-inherit autotools pkgconfig
-
-GSTREAMER_1_0_DEBUG ?= "--disable-debug"
-GSTREAMER_1_0_GIT_BRANCH ?= "master"
-EXTRA_OECONF = "--disable-valgrind ${GSTREAMER_1_0_DEBUG} --disable-examples --disable-introspection"
-
-acpaths = "-I ${S}/common/m4 -I ${S}/m4"
-
-LIBV = "1.0"
-require gst-plugins-package.inc
-
-PACKAGECONFIG[orc] = "--enable-orc,--disable-orc,orc"
-
-PACKAGES_DYNAMIC = "^${PN}-.*"
-
-# apply gstreamer hack after Makefile.in.in in source is replaced by our version from
-# ${STAGING_DATADIR_NATIVE}/gettext/po/Makefile.in.in, but before configure is executed 
-# http://lists.linuxtogo.org/pipermail/openembedded-core/2012-November/032233.html
-oe_runconf_prepend() {
-	if [ -e ${S}/po/Makefile.in.in ]; then
-		sed -i -e "1a\\" -e 'GETTEXT_PACKAGE = @GETTEXT_PACKAGE@' ${S}/po/Makefile.in.in
-	fi
-}
-
-SRC_URI = "${@get_gst_srcuri(d)}"
-
-def get_gst_srcuri(d):
-    # check if expected prefix is present
-    prefix = "gstreamer1.0-"
-    bpn = d.getVar("BPN", True)
-    if not bpn.startswith(prefix):
-        bb.fatal('Invalid GStreamer 1.0 plugin package name "%s" : must start with "%s"' % (bpn, prefix))
-
-    # replaced prefix with "gst-", which is what is used for the tarball and repository filenames
-    gstpkg_basename = "gst-" + bpn[len(prefix):]
-    pv = d.getVar("PV", True)
-    branch = d.getVar("GSTREAMER_1_0_GIT_BRANCH", True)
-
-    if pv == "git":
-        s = "git://anongit.freedesktop.org/gstreamer/%s;branch=%s" % (gstpkg_basename, branch)
-    else:
-        s = "http://gstreamer.freedesktop.org/src/%s/%s-%s.tar.xz" % (gstpkg_basename, gstpkg_basename, pv)
-    return s
-
-delete_liblink_m4_file() {
-	# This m4 file contains nastiness which conflicts with libtool 2.2.2
-	rm "${S}/m4/lib-link.m4" || true
-}
-
-do_configure[prefuncs] += " delete_liblink_m4_file "
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0.inc b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0.inc
deleted file mode 100644
index 7eff2aa..0000000
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0.inc
+++ /dev/null
@@ -1,27 +0,0 @@
-SUMMARY = "GStreamer 1.0 multimedia framework"
-DESCRIPTION = "GStreamer is a multimedia framework for encoding and decoding video and sound. \
-It supports a wide range of formats including mp3, ogg, avi, mpeg and quicktime."
-HOMEPAGE = "http://gstreamer.freedesktop.org/"
-BUGTRACKER = "https://bugzilla.gnome.org/enter_bug.cgi?product=Gstreamer"
-SECTION = "multimedia"
-LICENSE = "LGPLv2+"
-DEPENDS = "glib-2.0 libxml2 bison-native flex-native"
-
-inherit autotools pkgconfig gettext
-
-GSTREAMER_1_DEBUG ?= "--disable-debug"
-EXTRA_OECONF = "--disable-docbook --disable-gtk-doc \
-                --disable-dependency-tracking --disable-check \
-                --disable-examples --disable-tests \
-                --disable-valgrind ${GSTREAMER_1_DEBUG} \
-                --disable-introspection \
-                "
-
-RRECOMMENDS_${PN}_qemux86    += "kernel-module-snd-ens1370 kernel-module-snd-rawmidi"
-RRECOMMENDS_${PN}_qemux86-64 += "kernel-module-snd-ens1370 kernel-module-snd-rawmidi"
-
-CACHED_CONFIGUREVARS += "ac_cv_header_valgrind_valgrind_h=no"
-
-FILES_${PN} += " ${libdir}/gstreamer-1.0/*.so"
-FILES_${PN}-dev += " ${libdir}/gstreamer-1.0/*.la ${libdir}/gstreamer-1.0/*.a"
-FILES_${PN}-dbg += " ${libdir}/gstreamer-1.0/.debug/ ${libexecdir}/gstreamer-1.0/.debug/"
-- 
2.7.4


