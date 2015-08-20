Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTPS id CE22952A08
	for <meta-arago@arago-project.org>;
	Thu, 20 Aug 2015 00:36:18 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NTC00GQDUZN41R0@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 19 Aug 2015 19:35:52 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=EdU1O6SC c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=uRRa74qj2VoA:10
	a=sozttTNsAAAA:8 a=e5mUnYsNAAAA:8	a=Yy6pTS9WsM6SsfXejskA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 50E10161B85;	Wed,
	19 Aug 2015 20:35:47 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 19 Aug 2015 20:35:38 -0400
Message-id: <1440030941-20751-5-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1440030941-20751-1-git-send-email-denis@denix.org>
References: <1440030941-20751-1-git-send-email-denis@denix.org>
Subject: [master/fido][PATCH 5/8] gstreamer1.0: overlay 1.2.3 recipes
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
X-List-Received-Date: Thu, 20 Aug 2015 00:36:19 -0000

From: Denys Dmytriyenko <denys@ti.com>

Recipes are taken from oe-core/daisy with very minimal changes.
Own customizations for adding HW acceleration are kept in bbappends.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../gstreamer/gstreamer1.0-libav_1.2.3.bb          | 26 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-bad_1.2.3.bb    | 14 ++++++++++++
 .../gstreamer/gstreamer1.0-plugins-base_1.2.3.bb   |  9 ++++++++
 .../gstreamer/gstreamer1.0-plugins-good_1.2.3.bb   |  9 ++++++++
 .../gstreamer/gstreamer1.0-plugins-ugly_1.2.3.bb   |  8 +++++++
 .../gstreamer/gstreamer1.0_1.2.3.bb                | 15 +++++++++++++
 6 files changed, 81 insertions(+)
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.2.3.bb
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bb
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.2.3.bb
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2.3.bb
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.2.3.bb
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0_1.2.3.bb

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.2.3.bb b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.2.3.bb
new file mode 100644
index 0000000..a05fe2e
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.2.3.bb
@@ -0,0 +1,26 @@
+include recipes-multimedia/gstreamer/gstreamer1.0-libav.inc
+
+FILESEXTRAPATHS_append := ":${THISDIR}/${PN}:${COREBASE}/meta/recipes-multimedia/gstreamer/${PN}"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://COPYING.LIB;md5=6762ed442b3822387a51c92d928ead0d \
+                    file://ext/libav/gstav.h;beginline=1;endline=18;md5=a752c35267d8276fd9ca3db6994fca9c \
+                    file://gst-libs/ext/libav/LICENSE;md5=23a54f59b82572c203a559346e89ed57 \
+                    file://gst-libs/ext/libav/COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://gst-libs/ext/libav/COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://gst-libs/ext/libav/COPYING.LGPLv2.1;md5=bd7a443320af8c812e4c18d1b79df004 \
+                    file://gst-libs/ext/libav/COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
+
+SRC_URI = " \
+    http://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz \
+    file://0001-Disable-yasm-for-libav-when-disable-yasm.patch \
+    "
+SRC_URI[md5sum] = "58c7998a054d8d8ca041fa35738f72b6"
+SRC_URI[sha256sum] = "ebc7fbe10955f40df6ccc4bf689075e7e296205fc7ecd8ff383d43c5cdf5bcd6"
+LIBAV_EXTRA_CONFIGURE_COMMON_ARG = "--target-os=linux \
+  --cc='${CC}' --as='${CC}' --ld='${CC}' --nm='${NM}' --ar='${AR}' \
+  --ranlib='${RANLIB}' \
+  ${GSTREAMER_1_0_DEBUG}"
+
+S = "${WORKDIR}/gst-libav-${PV}"
+
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bb b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bb
new file mode 100644
index 0000000..c9272bc
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bb
@@ -0,0 +1,14 @@
+include recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
+
+SRC_URI_remove = "file://configure-allow-to-disable-libssh2.patch"
+
+FILESEXTRAPATHS_append := ":${THISDIR}/${PN}:${COREBASE}/meta/recipes-multimedia/gstreamer/${PN}"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=73a5855a8119deb017f5f13cf327095d \
+                    file://gst/tta/filters.h;beginline=12;endline=29;md5=8a08270656f2f8ad7bb3655b83138e5a \
+                    file://COPYING.LIB;md5=21682e4e8fea52413fd26c60acb907e5 \
+                    file://gst/tta/crc32.h;beginline=12;endline=29;md5=27db269c575d1e5317fffca2d33b3b50"
+SRC_URI[md5sum] = "cfd6f303c8df2740b27cc63b945decef"
+SRC_URI[sha256sum] = "595d7911a9e6207dea37200587724bdbf841b81a5eb0730118be36976684278c"
+S = "${WORKDIR}/gst-plugins-bad-${PV}"
+
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.2.3.bb b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.2.3.bb
new file mode 100644
index 0000000..0097137
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.2.3.bb
@@ -0,0 +1,9 @@
+include recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=c54ce9345727175ff66d17b67ff51f58 \
+                    file://common/coverage/coverage-report.pl;beginline=2;endline=17;md5=a4e1830fce078028c8f0974161272607 \
+                    file://COPYING.LIB;md5=6762ed442b3822387a51c92d928ead0d \
+                   "
+SRC_URI[md5sum] = "17aeabfbcd232526f50c9bee375f1b97"
+SRC_URI[sha256sum] = "61edec35c270f86928bad434bd059da4efff865d1ef01bcc64ecbd903625dae1"
+S = "${WORKDIR}/gst-plugins-base-${PV}"
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2.3.bb b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2.3.bb
new file mode 100644
index 0000000..c2a7293
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2.3.bb
@@ -0,0 +1,9 @@
+include recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
+                    file://common/coverage/coverage-report.pl;beginline=2;endline=17;md5=a4e1830fce078028c8f0974161272607 \
+                    file://gst/replaygain/rganalysis.c;beginline=1;endline=23;md5=b60ebefd5b2f5a8e0cab6bfee391a5fe"
+SRC_URI[md5sum] = "1a1f96bc27ad446e559474299160a9a8"
+SRC_URI[sha256sum] = "bfb33536a515bdcc34482f64b8d9cc3e47c753878b254923b419bc2f7485e470"
+S = "${WORKDIR}/gst-plugins-good-${PV}"
+
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.2.3.bb b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.2.3.bb
new file mode 100644
index 0000000..c1fc233
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.2.3.bb
@@ -0,0 +1,8 @@
+include recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
+                    file://tests/check/elements/xingmux.c;beginline=1;endline=21;md5=4c771b8af188724855cb99cadd390068 "
+SRC_URI[md5sum] = "7ae60e2f759f58f32af5fcdc3c9193c4"
+SRC_URI[sha256sum] = "537b0a7607eee499026388bb705b5b68985a3fd59fe22ee09accaf8cdf57eb3b"
+S = "${WORKDIR}/gst-plugins-ugly-${PV}"
+
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0_1.2.3.bb b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0_1.2.3.bb
new file mode 100644
index 0000000..045534d
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0_1.2.3.bb
@@ -0,0 +1,15 @@
+include recipes-multimedia/gstreamer/gstreamer1.0.inc
+
+FILESEXTRAPATHS_append := ":${THISDIR}/${PN}:${COREBASE}/meta/recipes-multimedia/gstreamer/${PN}"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
+                    file://gst/gst.h;beginline=1;endline=21;md5=e059138481205ee2c6fc1c079c016d0d"
+
+SRC_URI = " \
+    http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.xz \
+    file://0001-Fix-crash-with-gst-inspect.patch \
+    "
+SRC_URI[md5sum] = "8155b9c7574ccaa361cc504e8e0e72dc"
+SRC_URI[sha256sum] = "0f9a9817a384b3448c368c23345e5122435caef9c00f1c40d7b1953827b0d8eb"
+S = "${WORKDIR}/gstreamer-${PV}"
+
-- 
2.2.0


