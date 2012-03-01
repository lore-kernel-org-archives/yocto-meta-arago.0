Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 42CE8529BA
	for <meta-arago@arago-project.org>;
	Thu,  1 Mar 2012 23:09:26 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q21N9OJ2029613
	for <meta-arago@arago-project.org>; Thu, 1 Mar 2012 17:09:24 -0600
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id q21N9Mp0015475
	for <meta-arago@arago-project.org>; Fri, 2 Mar 2012 04:39:23 +0530 (IST)
Received: from dbdp31.itg.ti.com (172.24.170.98) by dbde70.ent.ti.com
	(172.24.170.148) with Microsoft SMTP Server id 14.1.323.3;
	Fri, 2 Mar 2012 04:39:22 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp31.itg.ti.com (8.13.8/8.13.8) with ESMTP id q21N9JVa015091;
	Fri, 2 Mar 2012 04:39:21 +0530 (IST)
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 1 Mar 2012 17:09:17 -0600
Message-ID: <1330643357-7307-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH] matrix-gui-armbenchmarks-demo: add nbench-byte RDEPENDS
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
X-List-Received-Date: Thu, 01 Mar 2012 23:09:27 -0000
Content-Type: text/plain

* nbench-byte is not available in meta-openembedded so this
  RDEPENDS can be added back in.
* Bump the PR

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../matrix/matrix-gui-armbenchmarks-demos_2.0.bb   |    7 ++-----
 1 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-armbenchmarks-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-armbenchmarks-demos_2.0.bb
index a5cc474..fe85a0b 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-armbenchmarks-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-armbenchmarks-demos_2.0.bb
@@ -4,7 +4,7 @@ LICENSE = "CC-BY-SA"
 
 require matrix-gui-apps-git.inc
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 inherit allarch
 
@@ -14,9 +14,6 @@ S = "${WORKDIR}/git/arm_apps"
 RDEPENDS += "matrix-gui-apps-images matrix-gui-submenus-arm"
 
 # Make sure the benchmarks have been installed
-RDEPENDS += "arm-benchmarks lmbench"
-
-# Uncomment when nbench-byte (BYTEmark) is available in OE-Core
-#RDEPENDS += "nbench-byte"
+RDEPENDS += "arm-benchmarks lmbench nbench-byte"
 
 FILES_${PN} += "${MATRIX_BASE_DIR}/*"
-- 
1.7.0.4


