Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 91B9052A66
	for <meta-arago@arago-project.org>;
	Wed, 15 May 2013 03:54:58 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r4F3svQp019956
	for <meta-arago@arago-project.org>; Tue, 14 May 2013 22:54:57 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r4F3svWx014633
	for <meta-arago@arago-project.org>; Tue, 14 May 2013 22:54:57 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 14 May 2013 22:54:57 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id r4F3sXkW004084;
	Tue, 14 May 2013 22:54:55 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 14 May 2013 22:54:29 -0500
Message-ID: <1368590069-6700-9-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1368590069-6700-1-git-send-email-fcooper@ti.com>
References: <1368590069-6700-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 9/9] Revert "packagegroup-*-matrix: disable battleship demos for now"
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
X-List-Received-Date: Wed, 15 May 2013 03:54:58 -0000
Content-Type: text/plain

This reverts commit 974e04b7db9cf587fc8702374651503dcaa180e2.

Conflicts:

	meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
---
 .../packagegroup-arago-tisdk-matrix.bb             |   14 ++++----------
 1 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index 318d561..8ff69cb 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to include Matrix v2"
 LICENSE = "MIT"
-PR = "r15"
+PR = "r16"
 
 inherit packagegroup
 
@@ -69,11 +69,9 @@ MATRIX_APPS_append_ti33x = "        \
     matrix-gui-wifi-demos           \
     matrix-gui-bluetooth-demos      \
     matrix-gui-wifi-direct-demo     \
+    matrix-gui-wifi-battleship-demo \
 "
 
-# Won't build with new gcc-4.7, needs to include <unistd.h>
-#    matrix-gui-wifi-battleship-demo
-
 MATRIX_APPS_append_omap-a15 = "     \
     matrix-multimedia-demo-aac      \
     matrix-multimedia-demo-h264dec  \
@@ -110,23 +108,19 @@ MATRIX_APPS_append_am37x-evm = "    \
     matrix-gui-wifi-demos           \
     matrix-gui-bluetooth-demos      \
     matrix-gui-wifi-direct-demo     \
+    matrix-gui-wifi-battleship-demo \
                                     \
     matrix-multimedia-demo-audiocapture \
 "
 
-# Won't build with new gcc-4.7, needs to include <unistd.h>
-#    matrix-gui-wifi-battleship-demo
-
 MATRIX_APPS_append_am180x-evm = "   \
     matrix-gui-wifi-demos           \
     matrix-gui-bluetooth-demos      \
     matrix-gui-wifi-direct-demo     \
+    matrix-gui-wifi-battleship-demo \
     matrix-gui-pru-demos            \
 "
 
-# Won't build with new gcc-4.7, needs to include <unistd.h>
-#    matrix-gui-wifi-battleship-demo
-
 RDEPENDS_${PN} = "        \
     ${MATRIX_ESSENTIALS}  \
     ${MATRIX_GUI}         \
-- 
1.7.0.4


