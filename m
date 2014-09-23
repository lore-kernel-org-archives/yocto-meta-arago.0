Return-Path: <karthik.ramanan@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id EF94B529C2
	for <meta-arago@arago-project.org>;
	Tue, 23 Sep 2014 15:53:52 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s8NFrqUc018432
	for <meta-arago@arago-project.org>; Tue, 23 Sep 2014 10:53:52 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s8NFrq1r017708
	for <meta-arago@arago-project.org>; Tue, 23 Sep 2014 10:53:52 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 23 Sep 2014 10:53:51 -0500
Received: from zubuntu.apr.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s8NFrk2H024814;	Tue, 23 Sep 2014 10:53:51 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 23 Sep 2014 21:20:23 +0530
Message-ID: <1411487426-31949-3-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1411487426-31949-1-git-send-email-a0393906@ti.com>
References: <1411487426-31949-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
Subject: [for master 2/5] gst-plugins-ducati: Support encoder and bug fix updates
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
X-List-Received-Date: Tue, 23 Sep 2014 15:53:53 -0000
Content-Type: text/plain

* mpeg4dec: Workaround: Artifacts when frame-drop logic is activated
* vc1dec: Increase Y padding for interlaced streams
* videnc: Change omapbo to dmabuf fd and add dce_buf_lock/unlock
* Fix errors in handling H.264 streams with field coded pictures
* Fix for a dmabuf memory leak
* Changes for reverse playback

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../gst-plugins-ti/gst-plugins-ducati_git.bb       |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gst-plugins-ducati_git.bb b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gst-plugins-ducati_git.bb
index c8fb576..0ecbd6e 100644
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gst-plugins-ducati_git.bb
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gst-plugins-ducati_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 
 require gst-plugins-ti.inc
 
-PR = "${INC_PR}.0"
-SRCREV = "c50cc9132010bde7f4cb9efc04ca3eba536d26f9"
+PR = "${INC_PR}.1"
+SRCREV = "6ca21aa3ec8b88b051013af503ef6b702d3c5477"
 
 SRC_URI = "git://git.ti.com/glsdk/gst-plugin-ducati.git;protocol=git"
-- 
1.7.9.5


