Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTPS id 7FC225297F
	for <meta-arago@arago-project.org>;
	Thu, 21 May 2015 23:40:40 +0000 (UTC)
Received: from gandalf.denix.org ([108.28.31.169]) by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NOQ00DB34FM45P0@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 21 May 2015 18:40:39 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=XqdN4uAV c=1 sm=1 tr=0	a=fMO+sUsoiA3cqMJ/JkSOnA==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=h1PgugrvaO0A:10
	a=sozttTNsAAAA:8	a=wMiIW3sDbuvcTR6c-1UA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id C0F7620030;	Thu,
	21 May 2015 19:40:34 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 21 May 2015 19:40:34 -0400
Message-id: <1432251634-4051-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] gstreamer1.0-plugins-ti: package additional files
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
X-List-Received-Date: Thu, 21 May 2015 23:40:40 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ti.inc     | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ti.inc b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ti.inc
index b5bb501..46d7fae 100644
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ti.inc
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ti.inc
@@ -3,7 +3,7 @@ DEPENDS += "gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad libd
 
 inherit autotools pkgconfig gettext
 
-INC_PR = "r0"
+INC_PR = "r1"
 
 S = "${WORKDIR}/git"
 
@@ -17,3 +17,5 @@ EXTRA_OECONF += "--enable-maintainer-mode"
 EXTRA_OEMAKE += "'ERROR_CFLAGS=-Wno-deprecated-declarations'"
 
 FILES_${PN} += "${libdir}/gstreamer-1.0/*.so"
+FILES_${PN}-dbg += "${libdir}/gstreamer-1.0/.debug"
+FILES_${PN}-dev += "${libdir}/gstreamer-1.0/*.la"
-- 
2.2.0


