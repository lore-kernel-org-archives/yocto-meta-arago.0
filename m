Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTPS id EDCF152A8B
	for <meta-arago@arago-project.org>;
	Fri,  1 Apr 2016 03:42:07 +0000 (UTC)
Received: from vz-proxy-l003.mx.aol.com ([64.236.82.150])
	by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O4X002JYRLRB290@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 31 Mar 2016 22:41:51 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=EdU1O6SC c=1 sm=1 tr=0	a=0tGySW8maceftNfHUCUfCA==:117
	a=7OsogOcEt9IA:10 a=sozttTNsAAAA:8	a=dn1FlH4IAAAA:8 a=e5mUnYsNAAAA:8
	a=aiIX5UjjAAAA:8 a=22pK5S-mAAAA:8	a=NoPLbS4hOC2LmoQmhlwA:9
	a=W3iLMBH4txUA:10
Received: by 100.15.86.14 with SMTP id 17cdbd4a; Fri, 01 Apr 2016 03:41:51 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id CC4DC161F61;	Thu,
	31 Mar 2016 23:41:49 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 31 Mar 2016 23:41:29 -0400
Message-id: <1459482106-27723-10-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1459482106-27723-1-git-send-email-denis@denix.org>
References: <1459482106-27723-1-git-send-email-denis@denix.org>
Subject: [PATCH 09/26] gstreamer: overlay .inc files from fido and update 1.2.3 recipes
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
X-List-Received-Date: Fri, 01 Apr 2016 03:42:08 -0000

From: Denys Dmytriyenko <denys@ti.com>

Version 1.2.3 is required for now for HW acceleration, until it's ported to 1.6.3

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../gstreamer/gst-plugins-package.inc              |  57 +++++++++
 .../gstreamer/gstreamer1.0-libav.inc               |  31 +++++
 .../gstreamer/gstreamer1.0-libav_1.2.3.bb          |   1 -
 .../gstreamer/gstreamer1.0-plugins-bad.inc         | 135 +++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-bad_1.2.3.bb    |   1 -
 .../gstreamer/gstreamer1.0-plugins-base.inc        |  40 ++++++
 .../gstreamer/gstreamer1.0-plugins-good.inc        |  58 +++++++++
 .../gstreamer/gstreamer1.0-plugins-good_1.2.3.bb   |   1 -
 .../gstreamer/gstreamer1.0-plugins-ugly.inc        |  30 +++++
 .../gstreamer/gstreamer1.0-plugins-ugly_1.2.3.bb   |   1 -
 .../gstreamer/gstreamer1.0-plugins.inc             |  56 +++++++++
 .../recipes-multimedia/gstreamer/gstreamer1.0.inc  |  27 +++++
 .../gstreamer/gstreamer1.0_1.2.3.bb                |   1 -
 13 files changed, 434 insertions(+), 5 deletions(-)
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-package.inc
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly.inc
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0.inc

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-package.inc b/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-package.inc
new file mode 100644
index 0000000..617a735
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-package.inc
@@ -0,0 +1,57 @@
+PACKAGESPLITFUNCS_prepend = " split_gstreamer10_packages "
+PACKAGESPLITFUNCS_append = " set_metapkg_rdepends "
+
+python split_gstreamer10_packages () {
+    gst_libdir = d.expand('${libdir}/gstreamer-${LIBV}')
+    postinst = d.getVar('plugin_postinst', True)
+    glibdir = d.getVar('libdir', True)
+
+    do_split_packages(d, glibdir, '^lib(.*)\.so\.*', 'lib%s', 'gstreamer %s library', extra_depends='', allow_links=True)
+    do_split_packages(d, gst_libdir, 'libgst(.*)\.so$', d.expand('${PN}-%s'), 'GStreamer plugin for %s', postinst=postinst, extra_depends='')
+    do_split_packages(d, gst_libdir, 'libgst(.*)\.la$', d.expand('${PN}-%s-dev'), 'GStreamer plugin for %s (development files)', extra_depends=d.expand('${PN}-dev'))
+    do_split_packages(d, gst_libdir, 'libgst(.*)\.a$', d.expand('${PN}-%s-staticdev'), 'GStreamer plugin for %s (static development files)', extra_depends=d.expand('${PN}-staticdev'))
+}
+
+python set_metapkg_rdepends () {
+    import os
+
+    pn = d.getVar('PN', True)
+    metapkg =  pn + '-meta'
+    d.setVar('ALLOW_EMPTY_' + metapkg, "1")
+    d.setVar('FILES_' + metapkg, "")
+    blacklist = [ pn, pn + '-locale', pn + '-dev', pn + '-dbg', pn + '-doc', pn + '-meta' ]
+    metapkg_rdepends = []
+    packages = d.getVar('PACKAGES', True).split()
+    pkgdest = d.getVar('PKGDEST', True)
+    for pkg in packages[1:]:
+        if not pkg in blacklist and not pkg in metapkg_rdepends and not pkg.endswith('-dev') and not pkg.endswith('-dbg') and not pkg.count('locale') and not pkg.count('-staticdev'):
+            # See if the package is empty by looking at the contents of its PKGDEST subdirectory. 
+            # If this subdirectory is empty, then the package is.
+            # Empty packages do not get added to the meta package's RDEPENDS
+            pkgdir = os.path.join(pkgdest, pkg)
+            if os.path.exists(pkgdir):
+                dir_contents = os.listdir(pkgdir) or []
+            else:
+                dir_contents = []
+            is_empty = len(dir_contents) == 0
+            if not is_empty:
+                metapkg_rdepends.append(pkg)
+    d.setVar('RDEPENDS_' + metapkg, ' '.join(metapkg_rdepends))
+    d.setVar('DESCRIPTION_' + metapkg, pn + ' meta package')
+}
+
+# each plugin-dev depends on PN-dev, plugin-staticdev on PN-staticdev
+# so we need them even when empty (like in gst-plugins-good case)
+ALLOW_EMPTY_${PN} = "1"
+ALLOW_EMPTY_${PN}-dev = "1"
+ALLOW_EMPTY_${PN}-staticdev = "1"
+
+PACKAGES += "${PN}-apps ${PN}-meta ${PN}-glib"
+FILES_${PN}-apps = "${bindir}"
+
+RDEPENDS_${PN}-apps += "perl"
+RRECOMMENDS_${PN} += "${PN}-meta"
+
+FILES_${PN} = ""
+FILES_${PN}-dbg += "${libdir}/gstreamer-${LIBV}/.debug"
+FILES_${PN}-glib = "${datadir}/glib-2.0"
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc
new file mode 100644
index 0000000..6c8bc95
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc
@@ -0,0 +1,31 @@
+SUMMARY = "Libav-based GStreamer 1.x plugin"
+SECTION = "multimedia"
+LICENSE = "GPLv2+ & LGPLv2+ & ( (GPLv2+ & LGPLv2.1+) | (GPLv3+ & LGPLv3+) )"
+LICENSE_FLAGS = "commercial"
+HOMEPAGE = "http://www.gstreamer.net/"
+DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base zlib bzip2"
+
+inherit autotools pkgconfig
+
+# CAUTION: Using the system libav is not recommended. Since the libav API is changing all the time,
+# compilation errors (and other, more subtle bugs) can happen. It is usually better to rely on the
+# libav copy included in the gst-libav package.
+PACKAGECONFIG ??= " orc yasm "
+PACKAGECONFIG[libav] = "--with-system-libav,,libav"
+PACKAGECONFIG[lgpl]  = "--enable-lgpl,,"
+PACKAGECONFIG[yasm]  = "--enable-yasm,--disable-yasm,yasm-native"
+PACKAGECONFIG[orc]  = "--enable-orc,--disable-orc,orc"
+
+
+GSTREAMER_1_0_DEBUG ?= "--disable-debug"
+
+LIBAV_EXTRA_CONFIGURE = "--with-libav-extra-configure"
+LIBAV_EXTRA_CONFIGURE_COMMON = \
+'${LIBAV_EXTRA_CONFIGURE}="${LIBAV_EXTRA_CONFIGURE_COMMON_ARG}"'
+
+EXTRA_OECONF = "${LIBAV_EXTRA_CONFIGURE_COMMON}"
+
+FILES_${PN} += "${libdir}/gstreamer-1.0/*.so"
+FILES_${PN}-dbg += "${libdir}/gstreamer-1.0/.debug"
+FILES_${PN}-dev += "${libdir}/gstreamer-1.0/*.la"
+FILES_${PN}-staticdev += "${libdir}/gstreamer-1.0/*.a"
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.2.3.bb b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.2.3.bb
index a05fe2e..3e99273 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.2.3.bb
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.2.3.bb
@@ -23,4 +23,3 @@ LIBAV_EXTRA_CONFIGURE_COMMON_ARG = "--target-os=linux \
   ${GSTREAMER_1_0_DEBUG}"
 
 S = "${WORKDIR}/gst-libav-${PV}"
-
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
new file mode 100644
index 0000000..85ef6ce
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
@@ -0,0 +1,135 @@
+require gstreamer1.0-plugins.inc
+
+LICENSE = "GPLv2+ & LGPLv2+ & LGPLv2.1+ "
+
+DEPENDS += "gstreamer1.0-plugins-base bzip2 libpng jpeg"
+
+S = "${WORKDIR}/gst-plugins-bad-${PV}"
+
+SRC_URI += "file://configure-allow-to-disable-libssh2.patch \
+           "
+
+inherit gettext bluetooth
+
+# opengl packageconfig factored out to make it easy for distros
+# and BSP layers to pick either (desktop) opengl, gles2, or no GL
+PACKAGECONFIG_GL ?= "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gles2', '', d)}"
+
+PACKAGECONFIG ??= " \
+    ${PACKAGECONFIG_GL} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)} \
+    orc curl uvch264 neon sndfile \
+    hls sbc dash bz2 smoothstreaming \
+    "
+
+# dash = Dynamic Adaptive Streaming over HTTP
+PACKAGECONFIG[assrender]       = "--enable-assrender,--disable-assrender,libass"
+PACKAGECONFIG[curl]            = "--enable-curl,--disable-curl,curl"
+PACKAGECONFIG[gles2]           = "--enable-gles2,--disable-gles2,virtual/libgles2"
+PACKAGECONFIG[opengl]          = "--enable-opengl,--disable-opengl,virtual/libgl libglu"
+PACKAGECONFIG[faac]            = "--enable-faac,--disable-faac,faac"
+PACKAGECONFIG[faad]            = "--enable-faad,--disable-faad,faad2"
+PACKAGECONFIG[libmms]          = "--enable-libmms,--disable-libmms,libmms"
+PACKAGECONFIG[modplug]         = "--enable-modplug,--disable-modplug,libmodplug"
+PACKAGECONFIG[mpg123]          = "--enable-mpg123,--disable-mpg123,mpg123"
+PACKAGECONFIG[opus]            = "--enable-opus,--disable-opus,libopus"
+PACKAGECONFIG[flite]           = "--enable-flite,--disable-flite,flite-alsa"
+PACKAGECONFIG[opencv]          = "--enable-opencv,--disable-opencv,opencv"
+PACKAGECONFIG[wayland]         = "--enable-wayland --enable-egl,--disable-wayland --disable-egl,wayland virtual/egl"
+PACKAGECONFIG[uvch264]         = "--enable-uvch264,--disable-uvch264,libusb1 udev"
+PACKAGECONFIG[directfb]        = "--enable-directfb,--disable-directfb,directfb"
+PACKAGECONFIG[neon]            = "--enable-neon,--disable-neon,neon"
+PACKAGECONFIG[openal]          = "--enable-openal,--disable-openal,openal-soft"
+PACKAGECONFIG[hls]             = "--enable-hls,--disable-hls,gnutls"
+PACKAGECONFIG[sbc]             = "--enable-sbc,--disable-sbc,sbc"
+PACKAGECONFIG[dash]            = "--enable-dash,--disable-dash,libxml2"
+PACKAGECONFIG[bz2]             = "--enable-bz2,--disable-bz2,bzip2"
+PACKAGECONFIG[fluidsynth]      = "--enable-fluidsynth,--disable-fluidsynth,fluidsynth"
+PACKAGECONFIG[schroedinger]    = "--enable-schro,--disable-schro,schroedinger"
+PACKAGECONFIG[smoothstreaming] = "--enable-smoothstreaming,--disable-smoothstreaming,libxml2"
+PACKAGECONFIG[bluez]          = "--enable-bluez,--disable-bluez,${BLUEZ}"
+PACKAGECONFIG[rsvg]            = "--enable-rsvg,--disable-rsvg,librsvg"
+PACKAGECONFIG[sndfile]         = "--enable-sndfile,--disable-sndfile,libsndfile1"
+PACKAGECONFIG[webp]            = "--enable-webp,--disable-webp,libwebp"
+PACKAGECONFIG[rtmp]            = "--enable-rtmp,--disable-rtmp,rtmpdump"
+PACKAGECONFIG[libssh2]         = "--enable-libssh2,--disable-libssh2,libssh2"
+
+# these plugins have not been ported to 1.0 (yet):
+#   directdraw vcd apexsink dc1394 lv2 linsys musepack mythtv
+#   nas timidity teletextdec sdl xvid wininet acm gsettings
+#   sndio qtwrapper cdxaparse dccp faceoverlay hdvparse tta
+#   mve nuvdemux osx_video patchdetect quicktime real sdi
+#   videomeasure gsettings
+
+# these plugins have no corresponding library in OE-core or meta-openembedded:
+#   openni2 winks direct3d directdraw directsound winscreencap osx_video
+#   apple_media android_media avc chromaprint daala dts gme gsm kate ladspa mimic
+#   mpeg2enc mplex ofa openjpeg opensles pvr resindvd rtmp soundtouch spandsp spc
+#   srtp vdpau voaacenc voamrwbenc wasapi zbar
+
+EXTRA_OECONF += " \
+    --enable-dvb \
+    --enable-shm \
+    --enable-fbdev \
+    --enable-decklink \
+    --disable-acm \
+    --disable-android_media \
+    --disable-apexsink \
+    --disable-apple_media \
+    --disable-avc \
+    --disable-chromaprint \
+    --disable-cocoa \
+    --disable-daala \
+    --disable-dc1394 \
+    --disable-direct3d \
+    --disable-directdraw \
+    --disable-directsound \
+    --disable-dts \
+    --disable-gme \
+    --disable-gsettings \
+    --disable-gsm \
+    --disable-kate \
+    --disable-ladspa \
+    --disable-linsys \
+    --disable-lv2 \
+    --disable-mimic \
+    --disable-mpeg2enc \
+    --disable-mplex \
+    --disable-musepack \
+    --disable-mythtv \
+    --disable-nas \
+    --disable-ofa \
+    --disable-openjpeg \
+    --disable-opensles \
+    --disable-osx_video \
+    --disable-pvr \
+    --disable-quicktime \
+    --disable-resindvd \
+    --disable-sdl \
+    --disable-sdltest \
+    --disable-sndio \
+    --disable-soundtouch \
+    --disable-spandsp \
+    --disable-spc \
+    --disable-srtp \
+    --disable-teletextdec \
+    --disable-timidity \
+    --disable-vcd \
+    --disable-vdpau \
+    --disable-voaacenc \
+    --disable-voamrwbenc \
+    --disable-wasapi \
+    --disable-wildmidi \
+    --disable-wininet \
+    --disable-winscreencap \
+    --disable-xvid \
+    --disable-zbar \
+    ${GSTREAMER_1_0_ORC} \
+    ${@bb.utils.contains("TUNE_FEATURES", "mx32", "--disable-yadif", "", d)} \
+    "
+
+ARM_INSTRUCTION_SET = "arm"
+
+FILES_gstreamer1.0-plugins-bad-opencv += "${datadir}/gst-plugins-bad/1.0/opencv*"
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bb b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bb
index c9272bc..6dc8a3c 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bb
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bb
@@ -11,4 +11,3 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=73a5855a8119deb017f5f13cf327095d \
 SRC_URI[md5sum] = "cfd6f303c8df2740b27cc63b945decef"
 SRC_URI[sha256sum] = "595d7911a9e6207dea37200587724bdbf841b81a5eb0730118be36976684278c"
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
-
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
new file mode 100644
index 0000000..06eac67
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
@@ -0,0 +1,40 @@
+require gstreamer1.0-plugins.inc
+
+LICENSE = "GPLv2+ & LGPLv2+"
+
+DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 libxv', '', d)}"
+DEPENDS += "freetype liboil util-linux"
+
+inherit gettext
+
+PACKAGES_DYNAMIC =+ "^libgst.*"
+
+PACKAGECONFIG ??= " \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)} \
+    orc ivorbis ogg theora vorbis \
+    "
+
+X11DEPENDS = "virtual/libx11 libsm libxrender"
+X11ENABLEOPTS = "--enable-x --enable-xvideo --enable-xshm"
+X11DISABLEOPTS = "--disable-x --disable-xvideo --disable-xshm"
+PACKAGECONFIG[x11]     = "${X11ENABLEOPTS},${X11DISABLEOPTS},${X11DEPENDS}"
+PACKAGECONFIG[alsa]    = "--enable-alsa,--disable-alsa,alsa-lib"
+PACKAGECONFIG[ivorbis] = "--enable-ivorbis,--disable-ivorbis,tremor"
+PACKAGECONFIG[ogg]     = "--enable-ogg,--disable-ogg,libogg"
+PACKAGECONFIG[theora]  = "--enable-theora,--disable-theora,libtheora"
+PACKAGECONFIG[vorbis]  = "--enable-vorbis,--disable-vorbis,libvorbis"
+PACKAGECONFIG[pango]   = "--enable-pango,--disable-pango,pango"
+
+
+# cdparanoia and libvisual do not seem to exist anywhere in OE
+EXTRA_OECONF += " \
+    --disable-freetypetest \
+    --disable-cdparanoia \
+    --disable-libvisual \
+    ${GSTREAMER_1_0_ORC} \
+"
+
+FILES_${MLPREFIX}libgsttag-1.0 += "${datadir}/gst-plugins-base/1.0/license-translations.dict"
+
+CACHED_CONFIGUREVARS_append_i586 = " ac_cv_header_emmintrin_h=no ac_cv_header_xmmintrin_h=no"
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
new file mode 100644
index 0000000..37217f0
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
@@ -0,0 +1,58 @@
+require gstreamer1.0-plugins.inc
+
+LICENSE = "GPLv2+ & LGPLv2.1+"
+
+# libid3tag
+DEPENDS += "gstreamer1.0-plugins-base zlib bzip2 libcap"
+
+inherit gettext
+
+
+PACKAGECONFIG ??= " \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)} \
+    orc cairo flac gdk-pixbuf gudev jpeg libpng soup speex taglib \
+    "
+
+X11DEPENDS = "virtual/libx11 libsm libxrender libxfixes libxdamage"
+X11ENABLEOPTS = "--enable-x --enable-xshm"
+X11DISABLEOPTS = "--disable-x --disable-xshm"
+PACKAGECONFIG[x11]        = "${X11ENABLEOPTS},${X11DISABLEOPTS},${X11DEPENDS}"
+PACKAGECONFIG[pulseaudio] = "--enable-pulse,--disable-pulse,pulseaudio"
+PACKAGECONFIG[cairo]      = "--enable-cairo,--disable-cairo,cairo"
+PACKAGECONFIG[flac]       = "--enable-flac,--disable-flac,flac"
+PACKAGECONFIG[gdk-pixbuf] = "--enable-gdk_pixbuf,--disable-gdk_pixbuf,gdk-pixbuf"
+PACKAGECONFIG[gudev]      = "--with-gudev,--without-gudev,udev"
+PACKAGECONFIG[jack]       = "--enable-jack,--disable-jack,jack"
+PACKAGECONFIG[jpeg]       = "--enable-jpeg,--disable-jpeg,jpeg"
+PACKAGECONFIG[libpng]     = "--enable-libpng,--disable-libpng,libpng"
+PACKAGECONFIG[soup]       = "--enable-soup,--disable-soup,libsoup-2.4"
+PACKAGECONFIG[speex]      = "--enable-speex,--disable-speex,speex"
+PACKAGECONFIG[taglib]     = "--enable-taglib,--disable-taglib,taglib"
+PACKAGECONFIG[vpx]        = "--enable-vpx,--disable-vpx,libvpx"
+PACKAGECONFIG[wavpack]    = "--enable-wavpack,--disable-wavpack,wavpack"
+
+# the 1394 plugins require both libraw1394 and libiec61883
+# the former is included in meta-oe, the latter isn't
+# -> disabled
+
+EXTRA_OECONF += " \
+    --enable-oss \
+    --enable-gst_v4l2 \
+    --without-libv4l2 \
+    --disable-directsound \
+    --disable-waveform \
+    --disable-oss4 \
+    --disable-sunaudio \
+    --disable-osx_audio \
+    --disable-osx_video \
+    --disable-aalib \
+    --disable-libcaca \
+    --disable-libdv \
+    --disable-shout2 \
+    --disable-examples \
+    --disable-dv1394 \
+    ${GSTREAMER_1_0_ORC} \
+"
+
+FILES_${PN}-equalizer += "${datadir}/gstreamer-1.0/presets/*.prs"
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2.3.bb b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2.3.bb
index c2a7293..52e4542 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2.3.bb
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2.3.bb
@@ -6,4 +6,3 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
 SRC_URI[md5sum] = "1a1f96bc27ad446e559474299160a9a8"
 SRC_URI[sha256sum] = "bfb33536a515bdcc34482f64b8d9cc3e47c753878b254923b419bc2f7485e470"
 S = "${WORKDIR}/gst-plugins-good-${PV}"
-
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly.inc b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly.inc
new file mode 100644
index 0000000..2dd8ea5
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly.inc
@@ -0,0 +1,30 @@
+require gstreamer1.0-plugins.inc
+
+LICENSE = "GPLv2+ & LGPLv2.1+ & LGPLv2+"
+LICENSE_FLAGS = "commercial"
+
+DEPENDS += "gstreamer1.0-plugins-base libid3tag"
+
+inherit gettext
+
+
+PACKAGECONFIG ??= " \
+    orc a52dec lame mad mpeg2dec \
+    "
+
+PACKAGECONFIG[a52dec]   = "--enable-a52dec,--disable-a52dec,liba52"
+PACKAGECONFIG[cdio]     = "--enable-cdio,--disable-cdio,libcdio"
+PACKAGECONFIG[dvdread]  = "--enable-dvdread,--disable-dvdread,libdvdread"
+PACKAGECONFIG[lame]     = "--enable-lame,--disable-lame,lame"
+PACKAGECONFIG[mad]      = "--enable-mad,--disable-mad,libmad"
+PACKAGECONFIG[mpeg2dec] = "--enable-mpeg2dec,--disable-mpeg2dec,mpeg2dec"
+PACKAGECONFIG[x264]     = "--enable-x264,--disable-x264,x264"
+
+
+EXTRA_OECONF += " \
+    --disable-amrnb \
+    --disable-amrwb \
+    --disable-sidplay \
+    --disable-twolame \
+    ${GSTREAMER_1_0_ORC} \
+    "
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.2.3.bb b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.2.3.bb
index c1fc233..ed48039 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.2.3.bb
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.2.3.bb
@@ -5,4 +5,3 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
 SRC_URI[md5sum] = "7ae60e2f759f58f32af5fcdc3c9193c4"
 SRC_URI[sha256sum] = "537b0a7607eee499026388bb705b5b68985a3fd59fe22ee09accaf8cdf57eb3b"
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
-
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
new file mode 100644
index 0000000..c3a2db1
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
@@ -0,0 +1,56 @@
+SUMMARY = "Plugins for the GStreamer multimedia framework 1.x"
+HOMEPAGE = "http://gstreamer.freedesktop.org/"
+BUGTRACKER = "https://bugzilla.gnome.org/enter_bug.cgi?product=Gstreamer"
+SECTION = "multimedia"
+DEPENDS = "gstreamer1.0"
+
+inherit autotools pkgconfig
+
+GSTREAMER_1_0_DEBUG ?= "--disable-debug"
+GSTREAMER_1_0_GIT_BRANCH ?= "master"
+EXTRA_OECONF = "--disable-valgrind ${GSTREAMER_1_0_DEBUG} --disable-examples --disable-introspection"
+
+acpaths = "-I ${S}/common/m4 -I ${S}/m4"
+
+LIBV = "1.0"
+require gst-plugins-package.inc
+
+PACKAGECONFIG[orc] = "--enable-orc,--disable-orc,orc"
+
+PACKAGES_DYNAMIC = "^${PN}-.*"
+
+# apply gstreamer hack after Makefile.in.in in source is replaced by our version from
+# ${STAGING_DATADIR_NATIVE}/gettext/po/Makefile.in.in, but before configure is executed 
+# http://lists.linuxtogo.org/pipermail/openembedded-core/2012-November/032233.html
+oe_runconf_prepend() {
+	if [ -e ${S}/po/Makefile.in.in ]; then
+		sed -i -e "1a\\" -e 'GETTEXT_PACKAGE = @GETTEXT_PACKAGE@' ${S}/po/Makefile.in.in
+	fi
+}
+
+SRC_URI = "${@get_gst_srcuri(d)}"
+
+def get_gst_srcuri(d):
+    # check if expected prefix is present
+    prefix = "gstreamer1.0-"
+    bpn = d.getVar("BPN", True)
+    if not bpn.startswith(prefix):
+        bb.fatal('Invalid GStreamer 1.0 plugin package name "%s" : must start with "%s"' % (bpn, prefix))
+
+    # replaced prefix with "gst-", which is what is used for the tarball and repository filenames
+    gstpkg_basename = "gst-" + bpn[len(prefix):]
+    pv = d.getVar("PV", True)
+    branch = d.getVar("GSTREAMER_1_0_GIT_BRANCH", True)
+
+    if pv == "git":
+        s = "git://anongit.freedesktop.org/gstreamer/%s;branch=%s" % (gstpkg_basename, branch)
+    else:
+        s = "http://gstreamer.freedesktop.org/src/%s/%s-%s.tar.xz" % (gstpkg_basename, gstpkg_basename, pv)
+    return s
+
+delete_liblink_m4_file() {
+	# This m4 file contains nastiness which conflicts with libtool 2.2.2
+	rm "${S}/m4/lib-link.m4" || true
+}
+
+do_configure[prefuncs] += " delete_liblink_m4_file "
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0.inc b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0.inc
new file mode 100644
index 0000000..7eff2aa
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0.inc
@@ -0,0 +1,27 @@
+SUMMARY = "GStreamer 1.0 multimedia framework"
+DESCRIPTION = "GStreamer is a multimedia framework for encoding and decoding video and sound. \
+It supports a wide range of formats including mp3, ogg, avi, mpeg and quicktime."
+HOMEPAGE = "http://gstreamer.freedesktop.org/"
+BUGTRACKER = "https://bugzilla.gnome.org/enter_bug.cgi?product=Gstreamer"
+SECTION = "multimedia"
+LICENSE = "LGPLv2+"
+DEPENDS = "glib-2.0 libxml2 bison-native flex-native"
+
+inherit autotools pkgconfig gettext
+
+GSTREAMER_1_DEBUG ?= "--disable-debug"
+EXTRA_OECONF = "--disable-docbook --disable-gtk-doc \
+                --disable-dependency-tracking --disable-check \
+                --disable-examples --disable-tests \
+                --disable-valgrind ${GSTREAMER_1_DEBUG} \
+                --disable-introspection \
+                "
+
+RRECOMMENDS_${PN}_qemux86    += "kernel-module-snd-ens1370 kernel-module-snd-rawmidi"
+RRECOMMENDS_${PN}_qemux86-64 += "kernel-module-snd-ens1370 kernel-module-snd-rawmidi"
+
+CACHED_CONFIGUREVARS += "ac_cv_header_valgrind_valgrind_h=no"
+
+FILES_${PN} += " ${libdir}/gstreamer-1.0/*.so"
+FILES_${PN}-dev += " ${libdir}/gstreamer-1.0/*.la ${libdir}/gstreamer-1.0/*.a"
+FILES_${PN}-dbg += " ${libdir}/gstreamer-1.0/.debug/ ${libexecdir}/gstreamer-1.0/.debug/"
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0_1.2.3.bb b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0_1.2.3.bb
index 045534d..75a42eb 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0_1.2.3.bb
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0_1.2.3.bb
@@ -12,4 +12,3 @@ SRC_URI = " \
 SRC_URI[md5sum] = "8155b9c7574ccaa361cc504e8e0e72dc"
 SRC_URI[sha256sum] = "0f9a9817a384b3448c368c23345e5122435caef9c00f1c40d7b1953827b0d8eb"
 S = "${WORKDIR}/gstreamer-${PV}"
-
-- 
2.2.0


