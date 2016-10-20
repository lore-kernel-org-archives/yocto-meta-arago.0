Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 84B4C52A9D
	for <meta-arago@arago-project.org>;
	Thu, 20 Oct 2016 02:48:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 071B1209B5;
	Thu, 20 Oct 2016 02:48:04 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id SqMs_7ZHWF6e; Thu, 20 Oct 2016 02:48:03 +0000 (UTC)
Received: from gandalf.denix.org (pool-100-15-106-107.washdc.fios.verizon.net
	[100.15.106.107])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D589B20058;
	Thu, 20 Oct 2016 02:48:02 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by gandalf.denix.org (Postfix) with ESMTP id E29AE16215C;
	Wed, 19 Oct 2016 22:48:01 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 19 Oct 2016 22:47:52 -0400
Message-Id: <1476931679-4689-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH 1/8] gstreamer: remove outdated 1.2.3 version
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
X-List-Received-Date: Thu, 20 Oct 2016 02:48:05 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../gstreamer/gstreamer1.0-libav_1.2.3.bbappend    |  1 -
 .../gstreamer/gstreamer1.0-libav_1.2.3.bb          | 25 -------------
 .../gstreamer/gstreamer1.0-plugins-bad_1.2.3.bb    | 13 -------
 .../gstreamer1.0-plugins-bad_1.2.3.bbappend        | 42 ----------------------
 .../gstreamer/gstreamer1.0-plugins-base_1.2.3.bb   |  9 -----
 .../gstreamer1.0-plugins-base_1.2.3.bbappend       |  8 -----
 .../gstreamer/gstreamer1.0-plugins-good_1.2.3.bb   |  8 -----
 .../gstreamer1.0-plugins-good_1.2.3.bbappend       |  7 ----
 .../gstreamer/gstreamer1.0-plugins-ugly_1.2.3.bb   |  7 ----
 .../gstreamer/gstreamer1.0_1.2.3.bb                | 14 --------
 10 files changed, 134 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.2.3.bbappend
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.2.3.bb
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bb
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.2.3.bb
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.2.3.bbappend
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2.3.bb
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2.3.bbappend
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.2.3.bb
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0_1.2.3.bb

diff --git a/meta-arago-distro/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.2.3.bbappend b/meta-arago-distro/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.2.3.bbappend
deleted file mode 100644
index f32ed69..0000000
--- a/meta-arago-distro/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.2.3.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-LIBAV_EXTRA_CONFIGURE_COMMON_ARG += "--cross-prefix='${HOST_PREFIX}'"
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.2.3.bb b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.2.3.bb
deleted file mode 100644
index 3e99273..0000000
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.2.3.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-include recipes-multimedia/gstreamer/gstreamer1.0-libav.inc
-
-FILESEXTRAPATHS_append := ":${THISDIR}/${PN}:${COREBASE}/meta/recipes-multimedia/gstreamer/${PN}"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://COPYING.LIB;md5=6762ed442b3822387a51c92d928ead0d \
-                    file://ext/libav/gstav.h;beginline=1;endline=18;md5=a752c35267d8276fd9ca3db6994fca9c \
-                    file://gst-libs/ext/libav/LICENSE;md5=23a54f59b82572c203a559346e89ed57 \
-                    file://gst-libs/ext/libav/COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://gst-libs/ext/libav/COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://gst-libs/ext/libav/COPYING.LGPLv2.1;md5=bd7a443320af8c812e4c18d1b79df004 \
-                    file://gst-libs/ext/libav/COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
-
-SRC_URI = " \
-    http://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz \
-    file://0001-Disable-yasm-for-libav-when-disable-yasm.patch \
-    "
-SRC_URI[md5sum] = "58c7998a054d8d8ca041fa35738f72b6"
-SRC_URI[sha256sum] = "ebc7fbe10955f40df6ccc4bf689075e7e296205fc7ecd8ff383d43c5cdf5bcd6"
-LIBAV_EXTRA_CONFIGURE_COMMON_ARG = "--target-os=linux \
-  --cc='${CC}' --as='${CC}' --ld='${CC}' --nm='${NM}' --ar='${AR}' \
-  --ranlib='${RANLIB}' \
-  ${GSTREAMER_1_0_DEBUG}"
-
-S = "${WORKDIR}/gst-libav-${PV}"
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bb b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bb
deleted file mode 100644
index 6dc8a3c..0000000
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-include recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
-
-SRC_URI_remove = "file://configure-allow-to-disable-libssh2.patch"
-
-FILESEXTRAPATHS_append := ":${THISDIR}/${PN}:${COREBASE}/meta/recipes-multimedia/gstreamer/${PN}"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=73a5855a8119deb017f5f13cf327095d \
-                    file://gst/tta/filters.h;beginline=12;endline=29;md5=8a08270656f2f8ad7bb3655b83138e5a \
-                    file://COPYING.LIB;md5=21682e4e8fea52413fd26c60acb907e5 \
-                    file://gst/tta/crc32.h;beginline=12;endline=29;md5=27db269c575d1e5317fffca2d33b3b50"
-SRC_URI[md5sum] = "cfd6f303c8df2740b27cc63b945decef"
-SRC_URI[sha256sum] = "595d7911a9e6207dea37200587724bdbf841b81a5eb0730118be36976684278c"
-S = "${WORKDIR}/gst-plugins-bad-${PV}"
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend
deleted file mode 100644
index 3580bde..0000000
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend
+++ /dev/null
@@ -1,42 +0,0 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-PACKAGECONFIG = "faad"
-
-# gstreamer is now also included on Keystone, be mindful of any Graphics dependencies
-PACKAGECONFIG_append_omap-a15 = " ${@bb.utils.contains('DISTRO_FEATURES','wayland','wayland','',d)}"
-PACKAGECONFIG_append_ti43x = " ${@bb.utils.contains('DISTRO_FEATURES','wayland','wayland','',d)}"
-PACKAGECONFIG_append_ti33x = " ${@bb.utils.contains('DISTRO_FEATURES','wayland','wayland','',d)}"
-
-DEPENDS_append_omap-a15 = " \
-    libdce \
-    libdrm \
-"
-
-DEPENDS_append_ti43x = " \
-    libdrm \
-"
-
-DEPENDS_append_ti33x = " \
-    libdrm \
-"
-
-SRC_URI_append_ti43x = " \
-        file://0001-Enable-mouse-movement-for-videos-on-waylandsink.patch \
-"
-
-SRC_URI_append_ti33x = " \
-        file://0001-Enable-mouse-movement-for-videos-on-waylandsink.patch \
-"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-SRC_URI = "git://git.ti.com/glsdk/gstreamer1-0-plugins-bad.git;protocol=git \
-          "
-
-S = "${WORKDIR}/git"
-
-SRCREV = "3a7dce1011d2ad002f9341c8f0be2e409d73ea7b"
-SRCREV_ti43x = "a536c9e8d9cfaf47759dc194449a1887e0aee15d"
-SRCREV_ti33x = "a536c9e8d9cfaf47759dc194449a1887e0aee15d"
-
-PR_append = ".arago10"
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.2.3.bb b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.2.3.bb
deleted file mode 100644
index 0097137..0000000
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.2.3.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-include recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=c54ce9345727175ff66d17b67ff51f58 \
-                    file://common/coverage/coverage-report.pl;beginline=2;endline=17;md5=a4e1830fce078028c8f0974161272607 \
-                    file://COPYING.LIB;md5=6762ed442b3822387a51c92d928ead0d \
-                   "
-SRC_URI[md5sum] = "17aeabfbcd232526f50c9bee375f1b97"
-SRC_URI[sha256sum] = "61edec35c270f86928bad434bd059da4efff865d1ef01bcc64ecbd903625dae1"
-S = "${WORKDIR}/gst-plugins-base-${PV}"
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.2.3.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.2.3.bbappend
deleted file mode 100644
index ca675bd..0000000
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.2.3.bbappend
+++ /dev/null
@@ -1,8 +0,0 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-SRC_URI_append = " \
-        file://0001-Added-GstMetaDmaBuf-features.patch \
-        file://0002-videoconvert-use-videoconvert-from-version-1.3.1-to-.patch \
-"
-
-PR_append = ".arago1"
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2.3.bb b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2.3.bb
deleted file mode 100644
index 52e4542..0000000
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2.3.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-include recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
-                    file://common/coverage/coverage-report.pl;beginline=2;endline=17;md5=a4e1830fce078028c8f0974161272607 \
-                    file://gst/replaygain/rganalysis.c;beginline=1;endline=23;md5=b60ebefd5b2f5a8e0cab6bfee391a5fe"
-SRC_URI[md5sum] = "1a1f96bc27ad446e559474299160a9a8"
-SRC_URI[sha256sum] = "bfb33536a515bdcc34482f64b8d9cc3e47c753878b254923b419bc2f7485e470"
-S = "${WORKDIR}/gst-plugins-good-${PV}"
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2.3.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2.3.bbappend
deleted file mode 100644
index 90ba547..0000000
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2.3.bbappend
+++ /dev/null
@@ -1,7 +0,0 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-SRC_URI_append = " \
-        file://0001-Adds-GST_V4L2_IO_DMABUF-mode-support-in-capture.patch \
-        file://0002-gstv4l2src-Optimize-delay-in-capture.patch"
-
-PR_append = ".arago1"
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.2.3.bb b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.2.3.bb
deleted file mode 100644
index ed48039..0000000
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.2.3.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-include recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
-                    file://tests/check/elements/xingmux.c;beginline=1;endline=21;md5=4c771b8af188724855cb99cadd390068 "
-SRC_URI[md5sum] = "7ae60e2f759f58f32af5fcdc3c9193c4"
-SRC_URI[sha256sum] = "537b0a7607eee499026388bb705b5b68985a3fd59fe22ee09accaf8cdf57eb3b"
-S = "${WORKDIR}/gst-plugins-ugly-${PV}"
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0_1.2.3.bb b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0_1.2.3.bb
deleted file mode 100644
index 75a42eb..0000000
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0_1.2.3.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-include recipes-multimedia/gstreamer/gstreamer1.0.inc
-
-FILESEXTRAPATHS_append := ":${THISDIR}/${PN}:${COREBASE}/meta/recipes-multimedia/gstreamer/${PN}"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
-                    file://gst/gst.h;beginline=1;endline=21;md5=e059138481205ee2c6fc1c079c016d0d"
-
-SRC_URI = " \
-    http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.xz \
-    file://0001-Fix-crash-with-gst-inspect.patch \
-    "
-SRC_URI[md5sum] = "8155b9c7574ccaa361cc504e8e0e72dc"
-SRC_URI[sha256sum] = "0f9a9817a384b3448c368c23345e5122435caef9c00f1c40d7b1953827b0d8eb"
-S = "${WORKDIR}/gstreamer-${PV}"
-- 
2.7.4


