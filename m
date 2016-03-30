Return-Path: <karthik.ramanan@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id E094452A81
	for <meta-arago@arago-project.org>;
	Wed, 30 Mar 2016 11:55:41 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u2UBtfvJ029213
	for <meta-arago@arago-project.org>; Wed, 30 Mar 2016 06:55:41 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u2UBtfYn011952
	for <meta-arago@arago-project.org>; Wed, 30 Mar 2016 06:55:41 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 30 Mar 2016 06:55:41 -0500
Received: from swubn01.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u2UBtde0015816;
	Wed, 30 Mar 2016 06:55:40 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 30 Mar 2016 17:25:37 +0530
Message-ID: <1459338937-31044-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [master, fido] gstreamer1.0-plugins-vpe: Update SRCREV
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
X-List-Received-Date: Wed, 30 Mar 2016 11:55:42 -0000
Content-Type: text/plain

This will allow 0/1 framerate in input caps

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb
index 8efa46a..d9f94ba 100644
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 
 require gstreamer1.0-plugins-ti.inc
 
-PR = "${INC_PR}.7"
-SRCREV = "09d74f69f7a32f39e98a9e9c9ae1d84d4858e7d4"
+PR = "${INC_PR}.8"
+SRCREV = "1ba2ca0ae9767290ec09f27f289b66c2c90db3cc"
 
 SRC_URI = "git://git.ti.com/glsdk/gst-plugin-vpe.git;protocol=git \
            file://ti-video.conf \
-- 
1.7.9.5


