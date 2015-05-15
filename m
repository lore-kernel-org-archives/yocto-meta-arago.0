Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTPS id 29A3F529AF
	for <meta-arago@arago-project.org>;
	Fri, 15 May 2015 15:15:36 +0000 (UTC)
Received: from gandalf.denix.org ([108.28.31.169]) by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NOE00KVQD1J0N80@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 15 May 2015 10:15:20 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=B/MOC1ok c=1 sm=1 tr=0	a=fMO+sUsoiA3cqMJ/JkSOnA==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=h1PgugrvaO0A:10
	a=sozttTNsAAAA:8	a=qgI-uSC91JOvHJcTXCoA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id D6EAF20091;	Fri,
	15 May 2015 11:15:19 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 15 May 2015 11:15:19 -0400
Message-id: <1431702919-28761-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] gstreamer1.0-plugins-bad: fix breakage in omap5 machine
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
X-List-Received-Date: Fri, 15 May 2015 15:15:37 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend             | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend
index f2a38df..2e91320 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend
@@ -2,13 +2,15 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 PACKAGECONFIG = "faad"
 
-PACKAGECONFIG_append_dra7xx = " ${@base_contains('DISTRO_FEATURES','wayland','wayland','',d)}"
+PACKAGECONFIG_append_omap-a15 = " ${@base_contains('DISTRO_FEATURES','wayland','wayland','',d)}"
 
-DEPENDS_append_dra7xx = " \
+DEPENDS_append_omap-a15 = " \
     libdce \
     libdrm \
 "
 
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
 SRC_URI_append = " \
         file://0001-Added-GstDRMBufferPool-support.patch \
         file://0002-Modified-waylandsink-to-accept-NV12-format.patch \
@@ -18,4 +20,4 @@ SRC_URI_append = " \
         file://0006-GstDRMBufferPool-support-fix.patch \
 "
 
-PR_append = "-arago2"
+PR_append = "-arago3"
-- 
2.2.0


