Return-Path: <karthik.ramanan@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 1D84452A4B
	for <meta-arago@arago-project.org>;
	Wed, 26 Nov 2014 12:25:25 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id sAQCPODO002421
	for <meta-arago@arago-project.org>; Wed, 26 Nov 2014 06:25:24 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id sAQCPOqE002253
	for <meta-arago@arago-project.org>; Wed, 26 Nov 2014 06:25:24 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 26 Nov 2014 06:25:24 -0600
Received: from zubuntu.apr.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	sAQCPLn2028096;	Wed, 26 Nov 2014 06:25:23 -0600
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 26 Nov 2014 17:50:18 +0530
Message-ID: <1417004419-14506-2-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1417004419-14506-1-git-send-email-a0393906@ti.com>
References: <1417004419-14506-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
Subject: [for master PATCH 2/3] gst-plugins-good: dmabuf support for v4l2src
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
X-List-Received-Date: Wed, 26 Nov 2014 12:25:25 -0000
Content-Type: text/plain

Updated SRCREV to pick up a feature addition for encoder
usecase - Adding support for dmabuf memory for v4l2src

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../gstreamer/gst-plugins-good-mm-accel_0.10.31.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-good-mm-accel_0.10.31.bb b/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-good-mm-accel_0.10.31.bb
index f4f24c6..31456af 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-good-mm-accel_0.10.31.bb
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-good-mm-accel_0.10.31.bb
@@ -24,7 +24,7 @@ RCONFLICTS_${PN}-meta += "gst-plugins-good-meta"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 SRC_URI = "git://git.ti.com/glsdk/gst-plugins-good0-10.git;protocol=git"
-SRCREV = "733289614c50ff4e490d5a37ec4af3a540d1dfb9"
+SRCREV = "a44097d542f2bf219ac9dc3ef2372e58d769a8f9"
 
 # Fix compile errors with recent kernels
 SRC_URI_append = " file://0001-v4l2-fix-build-with-recent-kernels-the-v4l2_buffer-i.patch \
-- 
1.7.9.5


