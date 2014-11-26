Return-Path: <karthik.ramanan@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 18FB852A4B
	for <meta-arago@arago-project.org>;
	Wed, 26 Nov 2014 12:25:24 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id sAQCPN37002418
	for <meta-arago@arago-project.org>; Wed, 26 Nov 2014 06:25:23 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id sAQCPNRx027859
	for <meta-arago@arago-project.org>; Wed, 26 Nov 2014 06:25:23 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 26 Nov 2014 06:25:23 -0600
Received: from zubuntu.apr.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	sAQCPLn1028096;	Wed, 26 Nov 2014 06:25:22 -0600
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 26 Nov 2014 17:50:17 +0530
Message-ID: <1417004419-14506-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [for master PATCH 1/3] gst-plugins-base: Updated SRCREV to include bug fixes
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
X-List-Received-Date: Wed, 26 Nov 2014 12:25:24 -0000
Content-Type: text/plain

Fix issue with parse_sami error
This is a minor bug fix to resolve the WARNING that
was thrown up when running gst for the first time.

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../gstreamer/gst-plugins-base-mm-accel_0.10.36.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-base-mm-accel_0.10.36.bb b/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-base-mm-accel_0.10.36.bb
index bfd6b52..1de5e6c 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-base-mm-accel_0.10.36.bb
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-base-mm-accel_0.10.36.bb
@@ -24,7 +24,7 @@ RCONFLICTS_${PN}-meta += "gst-plugins-base-meta"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 SRC_URI = "git://git.ti.com/glsdk/gst-plugins-base0-10.git;protocol=git"
-SRCREV = "21305017f6095ad6e9b1a8f1006ee5be780b21f8"
+SRCREV = "3427e885daa749275e07339d3633b83c717aa419"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.9.5


