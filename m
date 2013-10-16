Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id DE6425297F
	for <meta-arago@arago-project.org>;
	Wed, 16 Oct 2013 15:19:43 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9GFJgs9002620
	for <meta-arago@arago-project.org>; Wed, 16 Oct 2013 10:19:42 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9GFJgSE019096
	for <meta-arago@arago-project.org>; Wed, 16 Oct 2013 10:19:42 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 16 Oct 2013 10:19:42 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9GFJdJL003224;
	Wed, 16 Oct 2013 10:19:40 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 16 Oct 2013 11:09:36 -0500
Message-ID: <1381939776-29042-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH] matrix-gui-crypto-demos: Add am437x support
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
X-List-Received-Date: Wed, 16 Oct 2013 15:19:44 -0000
Content-Type: text/plain

* Add support for the AM437x to use the C based crypto demos
  which provide the wrapper scripts so don't install the
  wrapper scripts with this recipe.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../matrix/matrix-gui-crypto-demos_2.0.bb          |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb
index 328d503..7cd9f2f 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb
@@ -4,12 +4,13 @@ LICENSE = "CC-BY-SA"
 
 require matrix-gui-apps-git.inc
 
-PR = "${INC_PR}.5"
+PR = "${INC_PR}.6"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 S = "${WORKDIR}/git/cryptos_apps_scripts"
 S_ti33x = "${WORKDIR}/git/cryptos_apps_program"
+S_ti43x = "${WORKDIR}/git/cryptos_apps_program"
 
 FILES_${PN} += "${MATRIX_BASE_DIR}/*"
 
@@ -17,3 +18,4 @@ FILES_${PN} += "${MATRIX_BASE_DIR}/*"
 RDEPENDS_${PN} += "matrix-gui-apps-images matrix-gui-submenus-cryptos openssl"
 
 RDEPENDS_${PN}_append_ti33x = " ti-crypto-examples"
+RDEPENDS_${PN}_append_ti43x = " ti-crypto-examples"
-- 
1.7.0.4


