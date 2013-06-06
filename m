Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id AEE75529A8
	for <meta-arago@arago-project.org>;
	Thu,  6 Jun 2013 21:41:16 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r56LfFZX011448
	for <meta-arago@arago-project.org>; Thu, 6 Jun 2013 16:41:15 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r56LfF2X027151
	for <meta-arago@arago-project.org>; Thu, 6 Jun 2013 16:41:15 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 6 Jun 2013 16:41:15 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id r56LfCIZ004073;
	Thu, 6 Jun 2013 16:41:13 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 6 Jun 2013 16:47:46 -0500
Message-ID: <1370555268-22244-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 1/3] matrix-gui-crypto-demos: Fix syntax
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
X-List-Received-Date: Thu, 06 Jun 2013 21:41:16 -0000
Content-Type: text/plain

* Fix RDEPENDS append syntax mistake.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../matrix/matrix-gui-crypto-demos_2.0.bb          |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb
index e87a773..328d503 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb
@@ -4,7 +4,7 @@ LICENSE = "CC-BY-SA"
 
 require matrix-gui-apps-git.inc
 
-PR = "${INC_PR}.4"
+PR = "${INC_PR}.5"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -16,4 +16,4 @@ FILES_${PN} += "${MATRIX_BASE_DIR}/*"
 # Make sure crypto submenu and app images has been installed. Also make sure openssl is available
 RDEPENDS_${PN} += "matrix-gui-apps-images matrix-gui-submenus-cryptos openssl"
 
-RDEPENDS_${PN}_ti33x_append = " ti-crypto-examples"
+RDEPENDS_${PN}_append_ti33x = " ti-crypto-examples"
-- 
1.7.0.4


