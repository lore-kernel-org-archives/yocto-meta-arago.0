Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTPS id 0A27352A4B
	for <meta-arago@arago-project.org>;
	Fri,  3 Jul 2015 03:02:41 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NQW006QL5S4UQH0@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 02 Jul 2015 22:02:29 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=DcDq0aZW c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=zOBTXjUuO1YA:10
	a=sozttTNsAAAA:8	a=8mNPsUGcCVPT3uDMBesA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 3AF51161AE9;	Thu,
	2 Jul 2015 23:02:16 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 02 Jul 2015 23:01:59 -0400
Message-id: <1435892533-6046-41-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1435892533-6046-1-git-send-email-denis@denix.org>
References: <1435892533-6046-1-git-send-email-denis@denix.org>
Subject: [PATCH 40/54] gstreamer: update from 1.2.3 to 1.4.5, disable local patches for now
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
X-List-Received-Date: Fri, 03 Jul 2015 03:02:41 -0000

From: Denys Dmytriyenko <denys@ti.com>

Local patches such as KMSSink, DMABuff etc. for HW acceleration are disabled
for now, need to forward port them to the new APIs.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ..._1.2.3.bbappend => gstreamer1.0-libav_1.4.5.bbappend} |  0
 ....bbappend => gstreamer1.0-plugins-bad_1.4.5.bbappend} | 16 ++++++++--------
 ...bbappend => gstreamer1.0-plugins-base_1.4.5.bbappend} |  0
 ...bbappend => gstreamer1.0-plugins-good_1.4.5.bbappend} |  4 ++--
 4 files changed, 10 insertions(+), 10 deletions(-)
 rename meta-arago-distro/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.2.3.bbappend => gstreamer1.0-libav_1.4.5.bbappend} (100%)
 rename meta-arago-extras/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.2.3.bbappend => gstreamer1.0-plugins-bad_1.4.5.bbappend} (42%)
 rename meta-arago-extras/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.2.3.bbappend => gstreamer1.0-plugins-base_1.4.5.bbappend} (100%)
 rename meta-arago-extras/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.2.3.bbappend => gstreamer1.0-plugins-good_1.4.5.bbappend} (42%)

diff --git a/meta-arago-distro/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.2.3.bbappend b/meta-arago-distro/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.4.5.bbappend
similarity index 100%
rename from meta-arago-distro/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.2.3.bbappend
rename to meta-arago-distro/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.4.5.bbappend
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.4.5.bbappend
similarity index 42%
rename from meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend
rename to meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.4.5.bbappend
index 2e91320..14bf998 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.4.5.bbappend
@@ -11,13 +11,13 @@ DEPENDS_append_omap-a15 = " \
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRC_URI_append = " \
-        file://0001-Added-GstDRMBufferPool-support.patch \
-        file://0002-Modified-waylandsink-to-accept-NV12-format.patch \
-        file://0003-Added-KMSsink-support.patch \
-        file://0004-waylandsink-Removed-dependency-on-dri2.patch \
-        file://0005-vc1parse-and-jpegparse-Fixes-plugin-ranks.patch \
-        file://0006-GstDRMBufferPool-support-fix.patch \
-"
+#SRC_URI_append = " \
+#        file://0001-Added-GstDRMBufferPool-support.patch \
+#        file://0002-Modified-waylandsink-to-accept-NV12-format.patch \
+#        file://0003-Added-KMSsink-support.patch \
+#        file://0004-waylandsink-Removed-dependency-on-dri2.patch \
+#        file://0005-vc1parse-and-jpegparse-Fixes-plugin-ranks.patch \
+#        file://0006-GstDRMBufferPool-support-fix.patch \
+#"
 
 PR_append = "-arago3"
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.2.3.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bbappend
similarity index 100%
rename from meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.2.3.bbappend
rename to meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bbappend
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2.3.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.4.5.bbappend
similarity index 42%
rename from meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2.3.bbappend
rename to meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.4.5.bbappend
index 0548aa9..682ecc8 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2.3.bbappend
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.4.5.bbappend
@@ -1,6 +1,6 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-SRC_URI_append = " \
-        file://0001-Adds-GST_V4L2_IO_DMABUF-mode-support-in-capture.patch"
+#SRC_URI_append = " \
+#        file://0001-Adds-GST_V4L2_IO_DMABUF-mode-support-in-capture.patch"
 
 PR_append = "-arago0"
-- 
2.2.0


