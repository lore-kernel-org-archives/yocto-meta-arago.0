Return-Path: <karthik.ramanan@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id F13B752A4B
	for <meta-arago@arago-project.org>;
	Wed, 26 Nov 2014 12:25:26 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id sAQCPQb2008818
	for <meta-arago@arago-project.org>; Wed, 26 Nov 2014 06:25:26 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id sAQCPPat027883
	for <meta-arago@arago-project.org>; Wed, 26 Nov 2014 06:25:25 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 26 Nov 2014 06:25:25 -0600
Received: from zubuntu.apr.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	sAQCPLn3028096;	Wed, 26 Nov 2014 06:25:24 -0600
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 26 Nov 2014 17:50:19 +0530
Message-ID: <1417004419-14506-3-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1417004419-14506-1-git-send-email-a0393906@ti.com>
References: <1417004419-14506-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
Subject: [for master PATCH 3/3] gst-plugins-bad: Ability to move Waylandsink window
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
X-List-Received-Date: Wed, 26 Nov 2014 12:25:27 -0000
Content-Type: text/plain

Updated SRCREV to pick up a feature addition for moving
waylandsink window while playing out video.

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../gstreamer/gst-plugins-bad-mm-accel_0.10.23.bb  |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-bad-mm-accel_0.10.23.bb b/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-bad-mm-accel_0.10.23.bb
index 2f3a3a7..6eb7bc1 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-bad-mm-accel_0.10.23.bb
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-bad-mm-accel_0.10.23.bb
@@ -25,7 +25,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 DEPENDS += "omap5-sgx-ddk-um-linux libdce libdrm wayland"
 
-SRCREV = "f2df6f3b684f39500e22115b160191cef6d7dbaf"
+SRCREV = "a9510bef52331fee9a23a5c955dbf76ac210056a"
 SRC_URI = "git://git.ti.com/glsdk/gst-plugins-bad0-10.git;protocol=git"
 
 S = "${WORKDIR}/git"
-- 
1.7.9.5


