Return-Path: <karthik.ramanan@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 04B5B52A62
	for <meta-arago@arago-project.org>;
	Tue,  3 Mar 2015 15:59:38 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t23FxcIS000437
	for <meta-arago@arago-project.org>; Tue, 3 Mar 2015 09:59:38 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t23Fxalo021669
	for <meta-arago@arago-project.org>; Tue, 3 Mar 2015 09:59:36 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 3 Mar 2015 09:59:36 -0600
Received: from swubn01.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t23FxUoL010022;
	Tue, 3 Mar 2015 09:59:36 -0600
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 3 Mar 2015 21:29:25 +0530
Message-ID: <1425398366-6614-5-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1425398366-6614-1-git-send-email-a0393906@ti.com>
References: <1425398366-6614-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
Subject: [meta-arago 4/4] gstreamer1.0-plugins-ti: Add ducati and vpe GST plugins
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
X-List-Received-Date: Tue, 03 Mar 2015 15:59:39 -0000
Content-Type: text/plain

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../gstreamer1.0-plugins-ducati_git.bb             |   10 ++++++++++
 .../gst-plugins-ti/gstreamer1.0-plugins-ti.inc     |   19 +++++++++++++++++++
 .../gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb |   11 +++++++++++
 3 files changed, 40 insertions(+)
 create mode 100644 meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb
 create mode 100644 meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ti.inc
 create mode 100644 meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb

diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb
new file mode 100644
index 0000000..7f65284
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb
@@ -0,0 +1,10 @@
+DESCRIPTION = "GStreamer elements to use the multimedia accelerators available on some TI parts"
+LICENSE = "LGPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
+
+require gstreamer1.0-plugins-ti.inc
+
+PR = "${INC_PR}.1"
+SRCREV = "59fb5be20da72a2f5fb4f25587be668532a90c3b"
+
+SRC_URI = "git://git.ti.com/glsdk/gst-plugin-ducati.git;protocol=git"
diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ti.inc b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ti.inc
new file mode 100644
index 0000000..b5bb501
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ti.inc
@@ -0,0 +1,19 @@
+# Include file for common build settings for TI GStreamer plugins
+DEPENDS += "gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad libdrm libdce"
+
+inherit autotools pkgconfig gettext
+
+INC_PR = "r0"
+
+S = "${WORKDIR}/git"
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
diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb
new file mode 100644
index 0000000..74d5c77
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb
@@ -0,0 +1,11 @@
+DESCRIPTION = "GStreamer elements to use the Video Processing Engine (VPE) found on some TI devices"
+
+LICENSE = "LGPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
+
+require gstreamer1.0-plugins-ti.inc
+
+PR = "${INC_PR}.1"
+SRCREV = "6083aeb7d2caedb57cd62ab34c2ab0cd59664da5"
+
+SRC_URI = "git://git.ti.com/glsdk/gst-plugin-vpe.git;protocol=git"
-- 
1.7.9.5


