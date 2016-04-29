Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTPS id 434F652AD9
	for <meta-arago@arago-project.org>;
	Fri, 29 Apr 2016 18:33:02 +0000 (UTC)
Received: from vz-proxy-l004.mx.aol.com ([64.236.82.151])
	by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O6E008ZARIK5M50@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 29 Apr 2016 13:32:44 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=EdU1O6SC c=1 sm=1 tr=0	a=eaPqxu9IKnv3tbb7QsXVMw==:117
	a=kziv93cY1bsA:10 a=sozttTNsAAAA:8	a=3jNaARZ3aO80Mh_KfUcA:9
Received: by 100.15.86.14 with SMTP id 7792520a; Fri, 29 Apr 2016 18:32:44 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 06070161FCE;	Fri,
	29 Apr 2016 14:32:44 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 29 Apr 2016 14:32:43 -0400
Message-id: <1461954763-16712-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] gstreamer1.0-plugins-bad: keystone lacks graphics, adjust dependencies accordingly
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
X-List-Received-Date: Fri, 29 Apr 2016 18:33:04 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../gstreamer1.0-plugins-bad_1.2.3.bbappend        | 26 ++++++++++++++--------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend
index d2f8264..bb0180f 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend
@@ -2,22 +2,30 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 PACKAGECONFIG = "faad"
 
-PACKAGECONFIG_append = " ${@base_contains('DISTRO_FEATURES','wayland','wayland','',d)}"
+# gstreamer is now also included on Keystone, be mindful of any Graphics dependencies
+PACKAGECONFIG_append_omap-a15 = " ${@base_contains('DISTRO_FEATURES','wayland','wayland','',d)}"
+PACKAGECONFIG_append_ti43x = " ${@base_contains('DISTRO_FEATURES','wayland','wayland','',d)}"
+PACKAGECONFIG_append_ti33x = " ${@base_contains('DISTRO_FEATURES','wayland','wayland','',d)}"
 
-SRC_URI_append_ti43x = " \
-        file://0001-Enable-mouse-movement-for-videos-on-waylandsink.patch \
+DEPENDS_append_omap-a15 = " \
+    libdce \
+    libdrm \
 "
 
-SRC_URI_append_ti33x = " \
-        file://0001-Enable-mouse-movement-for-videos-on-waylandsink.patch \
+DEPENDS_append_ti43x = " \
+    libdrm \
 "
 
-DEPENDS_append = " \
+DEPENDS_append_ti33x = " \
     libdrm \
 "
 
-DEPENDS_append_omap-a15 = " \
-    libdce \
+SRC_URI_append_ti43x = " \
+        file://0001-Enable-mouse-movement-for-videos-on-waylandsink.patch \
+"
+
+SRC_URI_append_ti33x = " \
+        file://0001-Enable-mouse-movement-for-videos-on-waylandsink.patch \
 "
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -31,4 +39,4 @@ SRCREV = "9396248f2daf0b28b83ab0f01c4d17a8af46b1ca"
 SRCREV_ti43x = "a536c9e8d9cfaf47759dc194449a1887e0aee15d"
 SRCREV_ti33x = "a536c9e8d9cfaf47759dc194449a1887e0aee15d"
 
-PR_append = "-arago8"
+PR_append = "-arago9"
-- 
2.2.0


