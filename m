Return-Path: <jake@udd0866934>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 0B9D252979
	for <meta-arago@arago-project.org>;
	Tue, 13 Oct 2015 18:46:17 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t9DIkGVB006231
	for <meta-arago@arago-project.org>; Tue, 13 Oct 2015 13:46:16 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9DIkGDg012434
	for <meta-arago@arago-project.org>; Tue, 13 Oct 2015 13:46:16 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 13 Oct 2015 13:46:16 -0500
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9DIkFfU008446;
	Tue, 13 Oct 2015 13:46:16 -0500
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1Zm4aV-0001Oc-Af; Tue, 13 Oct 2015 14:46:15 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 13 Oct 2015 14:46:13 -0400
Message-ID: <1444761973-5332-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] matrix-gui: Bump SRCREV to resolve refresh_screen issue
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
X-List-Received-Date: Tue, 13 Oct 2015 18:46:17 -0000
Content-Type: text/plain

* Since moving to QT5 over EGLFS/nullDRM refresh_screen is no longer
  needed and ends up conflicting with matrix

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
index 251c185..ab9cb85 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a886c9ef769b2d8271115d2502512e5d"
 
 SECTION = "multimedia"
 
-PR = "r29"
+PR = "r30"
 
 INITSCRIPT_NAME = "matrix-gui-2.0"
 INITSCRIPT_PARAMS = "defaults 97"
@@ -16,7 +16,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 inherit update-rc.d
 
 BRANCH ?= "master"
-SRCREV = "35029f8c4a3688ca1b176c9a91febd0e541edd15"
+SRCREV = "621bab39c23ea476ec0b31a7baf86c1bd4f24ec4"
 
 MATRIX_INITSCRIPT = "${@base_conditional('QT_PROVIDER', 'qt5', base_contains('DISTRO_FEATURES', 'wayland', 'init', 'init.eglfs', d), 'init', d)}"
 
-- 
1.9.1


