Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 5493D52A76
	for <meta-arago@arago-project.org>;
	Mon, 19 May 2014 19:20:30 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4JJKTOR028453
	for <meta-arago@arago-project.org>; Mon, 19 May 2014 14:20:29 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4JJKTt4020724
	for <meta-arago@arago-project.org>; Mon, 19 May 2014 14:20:29 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 19 May 2014 14:20:29 -0500
Received: from sdit-build04.dal.design.ti.com (dbdp20.itg.ti.com
	[172.24.170.38])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s4JJK8C1001355;	Mon, 19 May 2014 14:20:27 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 19 May 2014 14:19:54 -0500
Message-ID: <1400527207-17021-7-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1400527207-17021-1-git-send-email-Chase.Maupin@ti.com>
References: <1400527207-17021-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 06/19] gst-plugins-ducati: Add GStreamer elements that use ducati
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
X-List-Received-Date: Mon, 19 May 2014 19:20:30 -0000
Content-Type: text/plain

From: Mrinmayee Hingolikar <mrinmayee@ti.com>

* Added the gstreamer plugins recipe from meta-arago-glsdk that
  uses the MM accelerators.  Preserved authorship for Mrinmayee
* Made the following modifications for upstreaming:
    * Abstracted out common settings used between gst-plugins-ducati
      and the gst-plugins-vpe recipes (next patch) into the
      gst-plugins-ti.inc file to avoid code duplication
    * Moved to gst-plugins-ti directory to group these similar
      plugins that share this .inc file together.
    * Removed unused FILESEXTRAPATHS setting
    * Added DESCRIPTION field

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../gst-plugins-ti/gst-plugins-ducati_git.bb       |   10 ++++++++++
 .../gst-plugins-ti/gst-plugins-ti.inc              |   19 +++++++++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 meta-arago-extras/recipes-multimedia/gst-plugins-ti/gst-plugins-ducati_git.bb
 create mode 100644 meta-arago-extras/recipes-multimedia/gst-plugins-ti/gst-plugins-ti.inc

diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gst-plugins-ducati_git.bb b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gst-plugins-ducati_git.bb
new file mode 100644
index 0000000..c8fb576
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gst-plugins-ducati_git.bb
@@ -0,0 +1,10 @@
+DESCRIPTION = "GStreamer elements to use the multimedia accelerators available on some TI parts"
+LICENSE = "LGPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
+
+require gst-plugins-ti.inc
+
+PR = "${INC_PR}.0"
+SRCREV = "c50cc9132010bde7f4cb9efc04ca3eba536d26f9"
+
+SRC_URI = "git://git.ti.com/glsdk/gst-plugin-ducati.git;protocol=git"
diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gst-plugins-ti.inc b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gst-plugins-ti.inc
new file mode 100644
index 0000000..e0c2c78
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gst-plugins-ti.inc
@@ -0,0 +1,19 @@
+# Include file for common build settings for TI GStreamer plugins
+DEPENDS += "gstreamer gst-plugins-base gst-plugins-bad libdrm libdce"
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
+FILES_${PN} += "${libdir}/gstreamer-0.10/*"
-- 
1.7.9.5


