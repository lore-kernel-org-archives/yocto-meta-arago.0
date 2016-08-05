Return-Path: <h-gou@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 5131352A05
	for <meta-arago@arago-project.org>;
	Fri,  5 Aug 2016 19:22:35 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u75JIFUb007059
	for <meta-arago@arago-project.org>; Fri, 5 Aug 2016 14:18:15 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u75JMXsG017326
	for <meta-arago@arago-project.org>; Fri, 5 Aug 2016 14:22:33 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 5 Aug 2016 14:22:33 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u75JMXxF027338;	Fri, 5 Aug 2016 14:22:33 -0500
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 5 Aug 2016 15:22:29 -0400
Message-ID: <1470424949-11365-1-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] gstreamer1.0-plugins-dsp66: add gst plugin to dispatch tasks to C66x DSP
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
X-List-Received-Date: Fri, 05 Aug 2016 19:22:36 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
 .../gstreamer1.0-plugins-dsp66_git.bb              | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-dsp66_git.bb

diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-dsp66_git.bb b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-dsp66_git.bb
new file mode 100644
index 0000000..6977a47
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-dsp66_git.bb
@@ -0,0 +1,43 @@
+DESCRIPTION = "GStreamer elements to use the TI DSP C66 in multimedia applications"
+HOMEPAGE = "https://git.ti.com/processor-sdk/gst-plugin-dsp66"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://COPYING;md5=2827f94fc0a1adeff4d9702e97ce2979"
+
+SRC_URI = "git://git.ti.com/processor-sdk/gst-plugin-dsp66.git;protocol=git;branch=master"
+SRCREV = "0db24f44b49ad673bcebce5d25a63ea41551ebec"
+
+S = "${WORKDIR}/git"
+
+COMPATIBLE_MACHINE = "dra7xx|keystone"
+
+DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base opencl ti-cgt6x-native clocl-native imglib-c66x vlib-c66x"
+
+inherit autotools-brokensep pkgconfig gettext
+
+PR = "r0"
+
+RDEPENDS_${PN} += " opencl-runtime"
+
+EXTRA_OEMAKE = " TARGET_ROOTDIR=${STAGING_DIR_HOST} \
+                 TI_OCL_CGT_INSTALL=${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x \
+"
+
+do_configure() {
+	cd ${S}
+	chmod +x autogen.sh
+	./autogen.sh --host=arm-linux --with-libtool-sysroot=${STAGING_DIR_TARGET} --prefix=/usr
+}
+
+EXTRA_OECONF += "--enable-maintainer-mode"
+EXTRA_OEMAKE += "'ERROR_CFLAGS=-Wno-deprecated-declarations'"
+
+FILES_${PN} += "${libdir}/gstreamer-1.0/*.so"
+FILES_${PN}-dbg += "${libdir}/gstreamer-1.0/.debug"
+FILES_${PN}-dev += "${libdir}/gstreamer-1.0/*.la"
+
+FILES_${PN} += "${libdir}/*.so"
+FILES_${PN}-dbg += "${libdir}/.debug"
+FILES_${PN}-dev += "${libdir}/*.la"
+FILES_SOLIBSDEV = ""
+
+INSANE_SKIP_${PN} = "ldflags"
-- 
1.9.1


