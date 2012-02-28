Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 13C9B52A78
	for <meta-arago@arago-project.org>;
	Tue, 28 Feb 2012 21:48:55 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q1SLmrou017413
	for <meta-arago@arago-project.org>; Tue, 28 Feb 2012 15:48:54 -0600
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id q1SLmqda027721
	for <meta-arago@arago-project.org>;
	Wed, 29 Feb 2012 03:18:52 +0530 (IST)
Received: from dbdp31.itg.ti.com (172.24.170.98) by dbde70.ent.ti.com
	(172.24.170.148) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 29 Feb 2012 03:18:52 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp31.itg.ti.com (8.13.8/8.13.8) with ESMTP id q1SLmjQ9017498;
	Wed, 29 Feb 2012 03:18:51 +0530 (IST)
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 28 Feb 2012 15:48:43 -0600
Message-ID: <1330465723-24817-4-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1330465723-24817-1-git-send-email-Chase.Maupin@ti.com>
References: <1330465723-24817-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] matrix-gui-armbenchmarks-demos: update dependencies
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
X-List-Received-Date: Tue, 28 Feb 2012 21:48:55 -0000
Content-Type: text/plain

* Updated to RDEPEND on nbench-byte
* Bump the PR

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../matrix/matrix-gui-armbenchmarks-demos_2.0.bb   |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-armbenchmarks-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-armbenchmarks-demos_2.0.bb
index c4528ae..eec9b1d 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-armbenchmarks-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-armbenchmarks-demos_2.0.bb
@@ -4,13 +4,13 @@ LICENSE = "CC-BY-SA"
 
 require matrix-gui-apps-git.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 inherit allarch
 
 S = ${WORKDIR}/git/arm_apps
 
 # Make sure arm submenu and app images has been installed
-RDEPENDS += matrix-gui-apps-images matrix-gui-submenus-arm arm-benchmarks lmbench
+RDEPENDS += matrix-gui-apps-images matrix-gui-submenus-arm arm-benchmarks lmbench nbench-byte
 
 FILES_${PN} += "${MATRIX_BASE_DIR}/*"
-- 
1.7.0.4


