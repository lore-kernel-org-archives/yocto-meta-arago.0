Return-Path: <jake@ubuntu-quadshannondemopc5>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id F0457529F8
	for <meta-arago@arago-project.org>;
	Tue,  2 Jun 2015 11:42:05 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t52Bg4qG031037
	for <meta-arago@arago-project.org>; Tue, 2 Jun 2015 06:42:04 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t52Bg3tV025509
	for <meta-arago@arago-project.org>; Tue, 2 Jun 2015 06:42:04 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 2 Jun 2015 06:42:03 -0500
Received: from Ubuntu-QuadShannonDemoPC5 (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t52Bg3Kk013019;	Tue, 2 Jun 2015 06:42:03 -0500
Received: from jake by Ubuntu-QuadShannonDemoPC5 with local (Exim 4.76)
	(envelope-from <jake@ubuntu-quadshannondemopc5>)	id 1Yzka3-0007UY-5N;
	Tue, 02 Jun 2015 07:42:03 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 2 Jun 2015 07:42:01 -0400
Message-ID: <1433245321-28768-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] glsdk-example-apps: Extend COMPATIBLE_MACHINEs to dra7xx family.
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
X-List-Received-Date: Tue, 02 Jun 2015 11:42:06 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../glsdk-example-apps/glsdk-example-apps.bb       |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb b/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb
index b23fd13..fb59d6a 100644
--- a/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb
+++ b/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=10a9abb9c5bb19edd83a8cf66eef7148"
 
 DEPENDS = "${@base_conditional('GST_PROVIDER', '0.10', 'gstreamer', 'gstreamer1.0', d)} libdrm ti-ipc"
 
-COMPATIBLE_MACHINE = "dra7xx-evm"
+COMPATIBLE_MACHINE = "dra7xx"
 
 S = "${WORKDIR}/git"
 
@@ -14,4 +14,4 @@ inherit autotools pkgconfig
 SRC_URI = "git://git.ti.com/glsdk/example-applications.git;protocol=git"
 SRCREV = "ac71e62ec2bd4c94cd73f24fcf0fc8f4f2876dc8"
 
-PR = "r2"
+PR = "r3"
-- 
1.7.9.5


