Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTPS id 790BD529EF
	for <meta-arago@arago-project.org>;
	Thu, 28 Apr 2016 19:19:08 +0000 (UTC)
Received: from vz-proxy-l001.mx.aol.com ([64.236.82.153])
	by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O6C00IW2YZA8I40@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 28 Apr 2016 14:18:47 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=btqxfxui c=1 sm=1 tr=0	a=FJ1kTJ0/xm5uTekQe8vMdQ==:117
	a=kziv93cY1bsA:10 a=sozttTNsAAAA:8	a=cM9t3XYF_xhhygf9qtQA:9
Received: by 100.15.86.14 with SMTP id 5ed289eb; Thu, 28 Apr 2016 19:18:47 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 916D5161FD0;	Thu,
	28 Apr 2016 15:18:46 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 28 Apr 2016 15:18:46 -0400
Message-id: <1461871126-32469-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] gstreamer1.0-plugins-bad: libdrm is a required dependency for all platforms
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
X-List-Received-Date: Thu, 28 Apr 2016 19:19:08 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend        | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend
index 1a619ac..d2f8264 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend
@@ -2,9 +2,7 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 PACKAGECONFIG = "faad"
 
-PACKAGECONFIG_append_omap-a15 = " ${@base_contains('DISTRO_FEATURES','wayland','wayland','',d)}"
-PACKAGECONFIG_append_ti43x = " ${@base_contains('DISTRO_FEATURES','wayland','wayland','',d)}"
-PACKAGECONFIG_append_ti33x = " ${@base_contains('DISTRO_FEATURES','wayland','wayland','',d)}"
+PACKAGECONFIG_append = " ${@base_contains('DISTRO_FEATURES','wayland','wayland','',d)}"
 
 SRC_URI_append_ti43x = " \
         file://0001-Enable-mouse-movement-for-videos-on-waylandsink.patch \
@@ -14,9 +12,12 @@ SRC_URI_append_ti33x = " \
         file://0001-Enable-mouse-movement-for-videos-on-waylandsink.patch \
 "
 
+DEPENDS_append = " \
+    libdrm \
+"
+
 DEPENDS_append_omap-a15 = " \
     libdce \
-    libdrm \
 "
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -30,5 +31,4 @@ SRCREV = "9396248f2daf0b28b83ab0f01c4d17a8af46b1ca"
 SRCREV_ti43x = "a536c9e8d9cfaf47759dc194449a1887e0aee15d"
 SRCREV_ti33x = "a536c9e8d9cfaf47759dc194449a1887e0aee15d"
 
-PR_append = "-arago7"
-
+PR_append = "-arago8"
-- 
2.2.0


