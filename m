Return-Path: <karthik.ramanan@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 085765209D
	for <meta-arago@arago-project.org>;
	Mon, 27 Jun 2016 15:12:14 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u5RFBDmI018632
	for <meta-arago@arago-project.org>; Mon, 27 Jun 2016 10:11:13 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u5RFCE4Y004955
	for <meta-arago@arago-project.org>; Mon, 27 Jun 2016 10:12:14 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 27 Jun 2016 10:12:14 -0500
Received: from sditapps09.india.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u5RFCDgn028296;	Mon, 27 Jun 2016 10:12:13 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 27 Jun 2016 20:42:09 +0530
Message-ID: <1467040331-32223-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH V2 1/3] gstreamer1.0-plugins-bad: Upgrade to 1.6.3
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
X-List-Received-Date: Mon, 27 Jun 2016 15:12:15 -0000
Content-Type: text/plain

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../gstreamer1.0-plugins-bad_1.6.3.bbappend        | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend
new file mode 100644
index 0000000..fbc614a
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend
@@ -0,0 +1,42 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+PACKAGECONFIG = "faad"
+
+# gstreamer is now also included on Keystone, be mindful of any Graphics dependencies
+PACKAGECONFIG_append_omap-a15 = " ${@bb.utils.contains('DISTRO_FEATURES','wayland','wayland','',d)}"
+PACKAGECONFIG_append_ti43x = " ${@bb.utils.contains('DISTRO_FEATURES','wayland','wayland','',d)}"
+PACKAGECONFIG_append_ti33x = " ${@bb.utils.contains('DISTRO_FEATURES','wayland','wayland','',d)}"
+
+DEPENDS_append_omap-a15 = " \
+    libdce \
+    libdrm \
+"
+
+DEPENDS_append_ti43x = " \
+    libdrm \
+"
+
+DEPENDS_append_ti33x = " \
+    libdrm \
+"
+
+SRC_URI_append_ti43x = " \
+"
+
+SRC_URI_append_ti33x = " \
+"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+BRANCH ?= "master"
+
+SRC_URI = "git://git.ti.com/glsdk/gstreamer1-0-plugins-bad.git;protocol=git;branch=${BRANCH} \
+          "
+
+S = "${WORKDIR}/git"
+
+SRCREV = "6c0aa1c20dae00ecfe8b4ca382274db3ea42f1e0"
+SRCREV_ti43x = "d0160ca810be30bf2b2e7681f5047933402efb52"
+SRCREV_ti33x = "d0160ca810be30bf2b2e7681f5047933402efb52"
+
+PR = "r11"
-- 
1.9.1


