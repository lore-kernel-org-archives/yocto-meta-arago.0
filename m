Return-Path: <karthik.ramanan@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 7C66E52A43
	for <meta-arago@arago-project.org>;
	Mon, 23 Feb 2015 13:18:39 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1NDIcSm032742
	for <meta-arago@arago-project.org>; Mon, 23 Feb 2015 07:18:38 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1NDIbYM004106
	for <meta-arago@arago-project.org>; Mon, 23 Feb 2015 07:18:37 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 23 Feb 2015 07:18:37 -0600
Received: from swubn01.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1NDIZqH016006;
	Mon, 23 Feb 2015 07:18:36 -0600
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 23 Feb 2015 18:48:33 +0530
Message-ID: <1424697513-22767-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [meta-arago 1/1] glsdk-example-apps: Update SRCREV for GLSDK 7.00 EA
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
X-List-Received-Date: Mon, 23 Feb 2015 13:18:39 -0000
Content-Type: text/plain

 * Also update dependency to gstreamer 1.0

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../glsdk-example-apps/glsdk-example-apps.bb       |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb b/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb
index a6b45b8..6598d7d 100644
--- a/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb
+++ b/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://git.ti.com/glsdk"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=10a9abb9c5bb19edd83a8cf66eef7148"
 
-DEPENDS = "gstreamer libdrm ti-ipc"
+DEPENDS = "gstreamer1.0 libdrm ti-ipc"
 
 COMPATIBLE_MACHINE = "dra7xx-evm"
 
@@ -12,6 +12,7 @@ S = "${WORKDIR}/git"
 inherit autotools pkgconfig
 
 SRC_URI = "git://git.ti.com/glsdk/example-applications.git;protocol=git"
-SRCREV = "a21dd98d5686a6c4563f89966cb459158085dd1b"
+SRCREV = "ac71e62ec2bd4c94cd73f24fcf0fc8f4f2876dc8"
+
+PR = "r2"
 
-PR = "r1"
-- 
1.7.9.5


