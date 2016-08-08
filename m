Return-Path: <h-gou@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 445EB5209D
	for <meta-arago@arago-project.org>;
	Mon,  8 Aug 2016 16:49:55 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u78GntVv031567
	for <meta-arago@arago-project.org>; Mon, 8 Aug 2016 11:49:55 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u78Gns82019554
	for <meta-arago@arago-project.org>; Mon, 8 Aug 2016 11:49:54 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 8 Aug 2016 11:49:53 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u78Gnk6V011145;	Mon, 8 Aug 2016 11:49:53 -0500
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 8 Aug 2016 12:49:43 -0400
Message-ID: <1470674983-6925-3-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1470674983-6925-1-git-send-email-h-gou@ti.com>
References: <1470674983-6925-1-git-send-email-h-gou@ti.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] packagegroup-arago-tisdk-matrix: add machine vision DLP 3D scanner demo
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
X-List-Received-Date: Mon, 08 Aug 2016 16:49:55 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb      | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index cc60c8e..4027889 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to include Matrix v2"
 LICENSE = "MIT"
-PR = "r58"
+PR = "r59"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -103,6 +103,7 @@ MATRIX_APPS_append_omap-a15 = "     \
 
 MATRIX_APPS_append_dra7xx += " \
     matrix-multimedia-demo-dsp66imgproc \
+    matrix-machinevision-demo-dlp3dscanner \
 "
 
 MATRIX_APPS_append_keystone = " \
-- 
1.9.1


