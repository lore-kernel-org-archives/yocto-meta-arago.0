Return-Path: <jake@udd0866934>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id B3E9D52007
	for <meta-arago@arago-project.org>;
	Fri, 29 Jan 2016 14:18:17 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u0TEIHh7004075
	for <meta-arago@arago-project.org>; Fri, 29 Jan 2016 08:18:17 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0TEIHcL028298
	for <meta-arago@arago-project.org>; Fri, 29 Jan 2016 08:18:17 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 29 Jan 2016 08:18:16 -0600
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0TEIGtu000519;
	Fri, 29 Jan 2016 08:18:16 -0600
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1aP9sN-0000wN-WC; Fri, 29 Jan 2016 09:18:16 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 29 Jan 2016 09:18:14 -0500
Message-ID: <1454077094-3581-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] matrix-gui-crypto-demos: Add ti-crypto-examples for keystone
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
X-List-Received-Date: Fri, 29 Jan 2016 14:18:18 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb
index 4607c3c..02a4f46 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
 
 require matrix-gui-apps-git.inc
 
-PR = "${INC_PR}.10"
+PR = "${INC_PR}.11"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -11,6 +11,7 @@ S = "${WORKDIR}/git/cryptos_apps_scripts"
 S_ti33x = "${WORKDIR}/git/cryptos_apps_program"
 S_ti43x = "${WORKDIR}/git/cryptos_apps_program"
 S_dra7xx = "${WORKDIR}/git/cryptos_apps_program"
+S_keystone = "${WORKDIR}/git/cryptos_apps_program"
 
 FILES_${PN} += "${MATRIX_BASE_DIR}/*"
 
@@ -20,3 +21,4 @@ RDEPENDS_${PN} += "matrix-gui-apps-images matrix-gui-submenus-cryptos openssl ma
 RDEPENDS_${PN}_append_ti33x = " ti-crypto-examples"
 RDEPENDS_${PN}_append_ti43x = " ti-crypto-examples"
 RDEPENDS_${PN}_append_dra7xx = " ti-crypto-examples"
+RDEPENDS_${PN}_append_keystone = " ti-crypto-examples"
-- 
1.9.1


