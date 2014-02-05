Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 048A4529AA
	for <meta-arago@arago-project.org>;
	Wed,  5 Feb 2014 17:03:17 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s15H3G2x028084
	for <meta-arago@arago-project.org>; Wed, 5 Feb 2014 11:03:16 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s15H300X012948
	for <meta-arago@arago-project.org>; Wed, 5 Feb 2014 11:03:01 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 5 Feb 2014 11:03:00 -0600
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s15H2wG9006340;
	Wed, 5 Feb 2014 11:02:59 -0600
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 5 Feb 2014 12:31:36 -0600
Message-ID: <1391625096-21593-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH] dual-camera-demo: Pull in latest commits of camera demo
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
X-List-Received-Date: Wed, 05 Feb 2014 17:03:18 -0000
Content-Type: text/plain

* This demo is going to be frequently updated for a couple of weeks.
* Set to AUTOREV until this demo stops updating so often.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../dual-camera-demo/dual-camera-demo_1.0.bb       |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb
index 12f42e5..ba891d5 100644
--- a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb
+++ b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb
@@ -6,10 +6,10 @@ LIC_FILES_CHKSUM = "file://main.cpp;beginline=1;endline=18;md5=1e0116b09fc3d8f88
 
 require recipes-core/matrix/matrix-gui-paths.inc
 
-PR = "r0"
+PR = "r1"
 
 BRANCH = "master"
-SRCREV = "af299a206482562ceae8aa690a8b6644a3e0a66e"
+SRCREV = "${AUTOREV}"
 
 SRC_URI = "git://gitorious.org/dual-camera-demo/dual-camera-demo.git;protocol=git;branch=${BRANCH}"
 
-- 
1.7.0.4


