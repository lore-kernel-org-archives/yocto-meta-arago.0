Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 5B2DF52A7C
	for <meta-arago@arago-project.org>;
	Fri,  7 Jun 2013 20:26:12 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r57KQB6D026664
	for <meta-arago@arago-project.org>; Fri, 7 Jun 2013 15:26:11 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r57KQBK5004144
	for <meta-arago@arago-project.org>; Fri, 7 Jun 2013 15:26:11 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 7 Jun 2013 15:26:11 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id r57KQ2sm025009;
	Fri, 7 Jun 2013 15:26:09 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 7 Jun 2013 15:32:56 -0500
Message-ID: <1370637177-13018-3-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1370637177-13018-1-git-send-email-fcooper@ti.com>
References: <1370637177-13018-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 3/4] matrix-gui-clocks: Tweak to support new HTML demo
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
X-List-Received-Date: Fri, 07 Jun 2013 20:26:12 -0000
Content-Type: text/plain

* A new HTML Matrix app exist that replaces all the various set freq demos.
* This uses the HTML demo support recently added by Matrix.
* However, matrix-gui-apps.inc doesn't include proper support so minor
  workarounds had to be made for things to work properly.
* Matrix-gui-apps.inc will need to be updated to properly support this new app
  type.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/matrix/matrix-gui-clocks_2.0.bb   |   47 ++++++-------------
 1 files changed, 15 insertions(+), 32 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-clocks_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-clocks_2.0.bb
index 62028ec..5b80b90 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-clocks_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-clocks_2.0.bb
@@ -4,42 +4,25 @@ LICENSE = "CC-BY-SA"
 
 require matrix-gui-apps-git.inc
 
-PR = "${INC_PR}.3"
+PR = "${INC_PR}.4"
 
 inherit allarch
 
 S = "${WORKDIR}/git/clocks_apps"
 
-# Break out the individual files into separate packages.  That way only the
-# clocks supported for each device can be installed.  Prepend the list so
-# that we can get the files in ${bindir} first
-PACKAGES = "${PN}-275mhz ${PN}-300mhz ${PN}-500mhz ${PN}-600mhz ${PN}-720mhz ${PN}-800mhz ${PN}-1ghz"
+do_install_prepend(){
+   install -d ${D}${MATRIX_BASE_DIR}/html-apps/
 
+   cp -rf ${S}/set_frequency/power-set-frequency ${D}${MATRIX_BASE_DIR}/html-apps/
+
+}
+
+do_install_append(){
+    rm ${D}${MATRIX_APP_DIR}/set_frequency/set-frequency.php
+}
 # Make sure power submenu and app images has been installed
-CLOCK_RDEPENDS = "matrix-gui-apps-images matrix-gui-submenus-power matrix-gui-generic-pm"
-
-RDEPENDS_${PN}-275mhz += "${CLOCK_RDEPENDS}"
-RDEPENDS_${PN}-300mhz += "${CLOCK_RDEPENDS}"
-RDEPENDS_${PN}-500mhz += "${CLOCK_RDEPENDS}"
-RDEPENDS_${PN}-600mhz += "${CLOCK_RDEPENDS}"
-RDEPENDS_${PN}-720mhz += "${CLOCK_RDEPENDS}"
-RDEPENDS_${PN}-800mhz += "${CLOCK_RDEPENDS}"
-RDEPENDS_${PN}-1ghz += "${CLOCK_RDEPENDS}"
-
-# Split the matrix files by clock
-FILES_${PN}-275mhz += "${MATRIX_APP_DIR}/power_set_275mhz/*"
-FILES_${PN}-300mhz += "${MATRIX_APP_DIR}/power_set_300mhz/*"
-FILES_${PN}-500mhz += "${MATRIX_APP_DIR}/power_set_500mhz/*"
-FILES_${PN}-600mhz += "${MATRIX_APP_DIR}/power_set_600mhz/*"
-FILES_${PN}-720mhz += "${MATRIX_APP_DIR}/power_set_720mhz/*"
-FILES_${PN}-800mhz += "${MATRIX_APP_DIR}/power_set_800mhz/*"
-FILES_${PN}-1ghz += "${MATRIX_APP_DIR}/power_set_1ghz/*"
-
-# Split the ${bindir} files by clock
-FILES_${PN}-275mhz += "${bindir}/setclock275MHz.sh"
-FILES_${PN}-300mhz += "${bindir}/setclock300MHz.sh"
-FILES_${PN}-500mhz += "${bindir}/setclock500MHz.sh"
-FILES_${PN}-600mhz += "${bindir}/setclock600MHz.sh"
-FILES_${PN}-720mhz += "${bindir}/setclock720MHz.sh"
-FILES_${PN}-800mhz += "${bindir}/setclock800MHz.sh"
-FILES_${PN}-1ghz += "${bindir}/setclock1GHz.sh"
+RDEPENDS_${PN} += "matrix-gui-apps-images matrix-gui-submenus-power matrix-gui-generic-pm"
+
+FILES_${PN} += "${MATRIX_BASE_DIR}/html-apps/ \
+                ${MATRIX_BASE_DIR}/apps/ \
+"
-- 
1.7.0.4


