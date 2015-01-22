Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id B4C3952A36
	for <meta-arago@arago-project.org>;
	Thu, 22 Jan 2015 16:42:54 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0MGgrnF004019
	for <meta-arago@arago-project.org>; Thu, 22 Jan 2015 10:42:53 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0MGgqJv017296
	for <meta-arago@arago-project.org>; Thu, 22 Jan 2015 10:42:52 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 22 Jan 2015 10:42:52 -0600
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t0MGgpIV008329;	Thu, 22 Jan 2015 10:42:52 -0600
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id t0MGgiaG021460;	Thu, 22 Jan 2015 22:12:50 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 22 Jan 2015 10:42:41 -0600
Message-ID: <1421944962-32315-5-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1421944962-32315-1-git-send-email-fcooper@ti.com>
References: <1421944962-32315-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 5/5] matrix-gui-*: Add dependency on matrix-gui-helper-scripts
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
X-List-Received-Date: Thu, 22 Jan 2015 16:42:59 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

* These apps now use the optimize-benchmark script. Therefore, depend on
  matrix-gui-helper-scripts to insure that the script is on the filesystem.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../matrix/matrix-gui-armbenchmarks-demos_2.0.bb   |    4 ++--
 .../matrix/matrix-gui-crypto-demos_2.0.bb          |    4 ++--
 .../matrix/matrix-gui-usb-demos_2.0.bb             |    4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-armbenchmarks-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-armbenchmarks-demos_2.0.bb
index 7aa185d..7ab29fa 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-armbenchmarks-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-armbenchmarks-demos_2.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
 
 require matrix-gui-apps-git.inc
 
-PR = "${INC_PR}.5"
+PR = "${INC_PR}.6"
 
 inherit allarch
 
@@ -13,6 +13,6 @@ S = "${WORKDIR}/git/arm_apps"
 RDEPENDS_${PN} += "matrix-gui-apps-images matrix-gui-submenus-arm"
 
 # Make sure the benchmarks have been installed
-RDEPENDS_${PN} += "arm-benchmarks lmbench nbench-byte"
+RDEPENDS_${PN} += "arm-benchmarks lmbench nbench-byte matrix-gui-helper-scripts"
 
 FILES_${PN} += "${MATRIX_BASE_DIR}/*"
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb
index 04b0825..36e26bc 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
 
 require matrix-gui-apps-git.inc
 
-PR = "${INC_PR}.8"
+PR = "${INC_PR}.9"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -17,7 +17,7 @@ SRC_URI += "file://0001-openssl_perf.sh-remove-module-manipulation.patch;striple
 FILES_${PN} += "${MATRIX_BASE_DIR}/*"
 
 # Make sure crypto submenu and app images has been installed. Also make sure openssl is available
-RDEPENDS_${PN} += "matrix-gui-apps-images matrix-gui-submenus-cryptos openssl"
+RDEPENDS_${PN} += "matrix-gui-apps-images matrix-gui-submenus-cryptos openssl matrix-gui-helper-scripts"
 
 RDEPENDS_${PN}_append_ti33x = " ti-crypto-examples"
 RDEPENDS_${PN}_append_ti43x = " ti-crypto-examples"
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-usb-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-usb-demos_2.0.bb
index 6a1ecc8..80b0b27 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-usb-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-usb-demos_2.0.bb
@@ -3,13 +3,13 @@ HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
 
 require matrix-gui-apps-git.inc
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 inherit allarch
 
 S = "${WORKDIR}/git/usb_apps"
 
 # Make sure usb submenu and app images has been installed
-RDEPENDS_${PN} += "matrix-gui-apps-images matrix-gui-submenus-usb bonnie++"
+RDEPENDS_${PN} += "matrix-gui-apps-images matrix-gui-submenus-usb bonnie++ matrix-gui-helper-scripts"
 
 FILES_${PN} += "${MATRIX_BASE_DIR}/*"
-- 
1.7.9.5


