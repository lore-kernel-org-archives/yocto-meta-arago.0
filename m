Return-Path: <jake@udc0866934>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 0850C52A08
	for <meta-arago@arago-project.org>;
	Tue,  4 Aug 2015 15:32:50 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t74FWmWV021736
	for <meta-arago@arago-project.org>; Tue, 4 Aug 2015 10:32:48 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t74FWmnP026424
	for <meta-arago@arago-project.org>; Tue, 4 Aug 2015 10:32:48 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 4 Aug 2015 10:32:48 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t74FWlCK020008;
	Tue, 4 Aug 2015 10:32:48 -0500
Received: from jake by udc0866934 with local (Exim 4.82)	(envelope-from
	<jake@udc0866934>)	id 1ZMeCt-0001Wr-I1; Tue, 04 Aug 2015 11:32:47 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 4 Aug 2015 11:32:44 -0400
Message-ID: <1438702364-5844-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] gstreamer1.0-plugins-hevc: Add GStreamer HEVC/H265 decoder plugin
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
X-List-Received-Date: Tue, 04 Aug 2015 15:32:53 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../gstreamer1.0-plugins-hevc_git.bb               | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-hevc_git.bb

diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-hevc_git.bb b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-hevc_git.bb
new file mode 100644
index 0000000..4d4abd2
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-hevc_git.bb
@@ -0,0 +1,31 @@
+DESCRIPTION = "GStreamer plugin for ARM HEVC decoder"
+HOMEPAGE = "https://git.ti.com/processor-sdk/gst-plugin-hevc"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://COPYING;md5=2827f94fc0a1adeff4d9702e97ce2979"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+COMPATIBLE_MACHINE = "dra7xx"
+
+SRC_URI = "git://git.ti.com/processor-sdk/gst-plugin-hevc.git;protocol=git"
+SRCREV = "2f17d5c50f7376c0489ae1a2f571f1e749f5f72e"
+
+S = "${WORKDIR}/git"
+
+DEPENDS += "gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad hevc-arm-decoder"
+
+inherit autotools pkgconfig gettext
+
+PR = "r3"
+
+do_configure() {
+        cd ${S}
+        chmod +x autogen.sh
+        ./autogen.sh --host=arm-linux --with-libtool-sysroot=${STAGING_DIR_TARGET} --prefix=/usr
+}
+
+EXTRA_OECONF += "--enable-maintainer-mode"
+EXTRA_OEMAKE += "'ERROR_CFLAGS=-Wno-deprecated-declarations'"
+
+FILES_${PN} += "${libdir}/gstreamer-1.0/*.so"
+FILES_${PN}-dbg += "${libdir}/gstreamer-1.0/.debug"
+FILES_${PN}-dev += "${libdir}/gstreamer-1.0/*.la"
-- 
1.9.1


