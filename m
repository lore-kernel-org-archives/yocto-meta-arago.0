Return-Path: <karthik.ramanan@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 25FE4529D1
	for <meta-arago@arago-project.org>;
	Thu,  6 Nov 2014 08:30:09 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id sA68U8Im021030
	for <meta-arago@arago-project.org>; Thu, 6 Nov 2014 02:30:08 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id sA68U7JP018915
	for <meta-arago@arago-project.org>; Thu, 6 Nov 2014 02:30:08 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 6 Nov 2014 02:30:05 -0600
Received: from zubuntu.apr.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	sA68U3ER032765;	Thu, 6 Nov 2014 02:30:03 -0600
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 6 Nov 2014 13:55:06 +0530
Message-ID: <1415262306-10083-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [for master PATCH] glsdk-example-apps: Fixed license check failure
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
X-List-Received-Date: Thu, 06 Nov 2014 08:30:09 -0000
Content-Type: text/plain

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../glsdk-example-apps/glsdk-example-apps.bb       |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb b/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb
index c7470bf..a6b45b8 100644
--- a/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb
+++ b/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb
@@ -7,9 +7,11 @@ DEPENDS = "gstreamer libdrm ti-ipc"
 
 COMPATIBLE_MACHINE = "dra7xx-evm"
 
+S = "${WORKDIR}/git"
+
 inherit autotools pkgconfig
 
 SRC_URI = "git://git.ti.com/glsdk/example-applications.git;protocol=git"
 SRCREV = "a21dd98d5686a6c4563f89966cb459158085dd1b"
 
-PR = "r0"
+PR = "r1"
-- 
1.7.9.5


