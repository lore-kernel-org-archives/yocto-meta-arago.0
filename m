Return-Path: <karthik.ramanan@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id D9351529C2
	for <meta-arago@arago-project.org>;
	Tue, 23 Sep 2014 15:53:51 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s8NFro8L011733
	for <meta-arago@arago-project.org>; Tue, 23 Sep 2014 10:53:51 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s8NFroTJ032380
	for <meta-arago@arago-project.org>; Tue, 23 Sep 2014 10:53:50 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 23 Sep 2014 10:53:50 -0500
Received: from zubuntu.apr.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s8NFrk2G024814;	Tue, 23 Sep 2014 10:53:49 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 23 Sep 2014 21:20:22 +0530
Message-ID: <1411487426-31949-2-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1411487426-31949-1-git-send-email-a0393906@ti.com>
References: <1411487426-31949-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
Subject: [for master 1/5] gst-plugins-vpe: Bug fixes and feature additions
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
X-List-Received-Date: Tue, 23 Sep 2014 15:53:52 -0000
Content-Type: text/plain

* This brings in several updates from meta-glsdk including
  feature additions and bug-fixes.
* Changes to support reverse playback and seek
* Add support for YUYV, and color conversion from/to NV12
* Fix incorrect return value for bufferalloc function

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../gst-plugins-ti/gst-plugins-vpe_git.bb          |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gst-plugins-vpe_git.bb b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gst-plugins-vpe_git.bb
index cd6f0af..85a2ce8 100644
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gst-plugins-vpe_git.bb
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gst-plugins-vpe_git.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 
 require gst-plugins-ti.inc
 
-PR = "${INC_PR}.0"
-SRCREV = "5107007ca1be8ed66f6a9ec3ffbb70ec7eb0b120"
+PR = "${INC_PR}.1"
+SRCREV = "b14e905feee2470952184f570f97deeb8e88b619"
 
 SRC_URI = "git://git.ti.com/glsdk/gst-plugin-vpe.git;protocol=git"
-- 
1.7.9.5


