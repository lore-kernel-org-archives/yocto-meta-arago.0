Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 8FE04529A6
	for <meta-arago@arago-project.org>;
	Mon, 19 May 2014 19:20:21 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4JJKLGK028429
	for <meta-arago@arago-project.org>; Mon, 19 May 2014 14:20:21 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4JJKKQh020631
	for <meta-arago@arago-project.org>; Mon, 19 May 2014 14:20:20 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 19 May 2014 14:20:20 -0500
Received: from sdit-build04.dal.design.ti.com (dbdp20.itg.ti.com
	[172.24.170.38])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s4JJK8Bw001355;	Mon, 19 May 2014 14:20:18 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 19 May 2014 14:19:51 -0500
Message-ID: <1400527207-17021-4-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1400527207-17021-1-git-send-email-Chase.Maupin@ti.com>
References: <1400527207-17021-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 03/19] gst-plugins-bad: Append with TI version of plugins
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
X-List-Received-Date: Mon, 19 May 2014 19:20:21 -0000
Content-Type: text/plain

From: Mrinmayee Hingolikar <mrinmayee@ti.com>

* Migrated the bbappend from meta-arago-glsdk and preserved
  authorship for Mrinmayee
* This append pulls the plugin sources from the git.ti.com/glsdk
  repository which has modifications for using gstreamer with TI
  devices.
* Cleaned up the following for upstreaming:
    * Restructured the recipe code to flow better
    * Removed libdri2 dependencies since this was for X11 support
      which was not ported.
    * Removed LICENSE settings since these were over-riding the
      base recipe LICENSE values.
    * Removed unneeded FILESEXTRAPATHS setting
* Make machines specific due to changed SRC_URI

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../gstreamer/gst-plugins-bad_0.10.23.bbappend     |   22 ++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend
new file mode 100644
index 0000000..74cc9ce
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend
@@ -0,0 +1,22 @@
+DEPENDS_append_omap-a15 = " omap5-sgx-ddk-um-linux libdce libdrm wayland "
+
+# Make MACHINE specific since we pull different sources per MACHINE
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+PR_append = "-arago1"
+
+SRCREV = "f2df6f3b684f39500e22115b160191cef6d7dbaf"
+SRC_URI_omap-a15 = "git://git.ti.com/glsdk/gst-plugins-bad0-10.git;protocol=git"
+
+S_omap-a15 = "${WORKDIR}/git"
+
+EXTRA_OECONF += " --disable-pvr"
+
+do_configure_prepend_omap-a15() {
+	git submodule init && git submodule update
+	autopoint -f
+}
+
+FILES_${PN} += "\
+                ${libdir}/*.so \
+                ${libdir}/gstreamer-0.10/*"
-- 
1.7.9.5


