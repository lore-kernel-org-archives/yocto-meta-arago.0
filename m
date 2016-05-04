Return-Path: <karthik.ramanan@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id BDE4052A65
	for <meta-arago@arago-project.org>;
	Wed,  4 May 2016 09:48:48 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u449mmNv013123
	for <meta-arago@arago-project.org>; Wed, 4 May 2016 04:48:48 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u449mmCU032319
	for <meta-arago@arago-project.org>; Wed, 4 May 2016 04:48:48 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 4 May 2016 04:48:47 -0500
Received: from sditapps09.india.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u449miGu012593;	Wed, 4 May 2016 04:48:46 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 4 May 2016 15:18:43 +0530
Message-ID: <1462355323-30809-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [master][PATCH] gstreamer1.0-plugins-ducati: Update SRCREV
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
X-List-Received-Date: Wed, 04 May 2016 09:48:49 -0000
Content-Type: text/plain

This fixes the following issues:
 * MPEG4 Video playback not smooth due to skipping of non-VOP coded frames
 * Perform cleanup only during error scenarios such as remoteproc crash

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb
index ae934f3..7092344 100644
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 
 require gstreamer1.0-plugins-ti.inc
 
-PR = "${INC_PR}.2"
-SRCREV = "202da907a87904e0c4f42a44afc6f39f31832406"
+PR = "${INC_PR}.3"
+SRCREV = "0cab49ee483613f053923fd90b7042fe059f1944"
 
 SRC_URI = "git://git.ti.com/glsdk/gst-plugin-ducati.git;protocol=git"
-- 
1.9.1


