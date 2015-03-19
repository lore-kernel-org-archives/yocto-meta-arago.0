Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTPS id B1E6D52099
	for <meta-arago@arago-project.org>;
	Thu, 19 Mar 2015 21:30:03 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.236]) by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NLH0046HADE6J80@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 19 Mar 2015 16:29:48 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=NqFmqHZM c=1 sm=1 tr=0	a=SSUdfGXV8XCffJJ8+gLrig==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=emO1SXQWCLwA:10
	a=sozttTNsAAAA:8	a=sQ2Ws5dmUukvGIGbvxQA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 45013200EC;	Thu,
	19 Mar 2015 17:29:38 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 19 Mar 2015 17:29:38 -0400
Message-id: <1426800578-7496-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] gstreamer1.0-plugins-bad: add DEPENDS on libdrm and libdce due to KMSsink
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
X-List-Received-Date: Thu, 19 Mar 2015 21:30:03 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend                 | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend
index b1cacac..bd141a8 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend
@@ -2,6 +2,8 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 PACKAGECONFIG = "faad wayland"
 
+DEPENDS += "libdrm libdce"
+
 SRC_URI_append = " \
         file://0001-Added-GstDRMBufferPool-support.patch \
         file://0002-Modified-waylandsink-to-accept-NV12-format.patch \
@@ -9,4 +11,4 @@ SRC_URI_append = " \
         file://0004-waylandsink-Removed-dependency-on-dri2.patch \
         file://0005-vc1parse-and-jpegparse-Fixes-plugin-ranks.patch"
 
-PR_append = "-arago0"
+PR_append = "-arago1"
-- 
2.2.0


