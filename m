Return-Path: <a0273011@sdit-build02.dal.design.ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id E19B952986
	for <meta-arago@arago-project.org>;
	Thu, 16 Aug 2012 17:52:52 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q7GHqqJ1030399
	for <meta-arago@arago-project.org>; Thu, 16 Aug 2012 12:52:52 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q7GHqqbe026896
	for <meta-arago@arago-project.org>; Thu, 16 Aug 2012 12:52:52 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Thu, 16 Aug 2012 12:52:51 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	q7GHqq5u025187;	Thu, 16 Aug 2012 12:52:52 -0500
Received: from a0273011 by sdit-build02.dal.design.ti.com with local (Exim
	4.71)	(envelope-from <a0273011@sdit-build02.dal.design.ti.com>)	id
	1T24PA-0007yb-Oy; Thu, 16 Aug 2012 13:02:48 -0500
From: Franklin S Cooper Jr <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 16 Aug 2012 13:02:47 -0500
Message-ID: <1345140167-30539-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [meta-arago-extras][PATCH] matrix-gui-clocks: Add support for 275MHz, 500MHz and 720 MHz
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
X-List-Received-Date: Thu, 16 Aug 2012 17:52:53 -0000
Content-Type: text/plain

* Latest version of the Matrix v2 clock application includes additional
  clock speeds. Update matrix-gui-clocks to properly package these additional
  speeds.
* Change the name of the script to package to match the name of the script
  included in the clocks_apps directory within the latest version of the
  matrix-gui-apps repository.

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/matrix/matrix-gui-clocks_2.0.bb   |   20 +++++++++++++-------
 1 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-clocks_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-clocks_2.0.bb
index bb29f8d..bcb58ac 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-clocks_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-clocks_2.0.bb
@@ -4,28 +4,34 @@ LICENSE = "CC-BY-SA"
 
 require matrix-gui-apps-git.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 inherit allarch
 
 S = "${WORKDIR}/git/clocks_apps"
 
 # Make sure power submenu and app images has been installed
-RDEPENDS += "matrix-gui-apps-images matrix-gui-submenus-power"
+RDEPENDS += "matrix-gui-apps-images matrix-gui-submenus-power matrix-gui-generic-pm"
 
 # Break out the individual files into separate packages.  That way only the
 # clocks supported for each device can be installed.  Prepend the list so
 # that we can get the files in ${bindir} first
-PACKAGES =+ "${PN}-300mhz ${PN}-600mhz ${PN}-800mhz ${PN}-1ghz"
+PACKAGES =+ "${PN}-275mhz ${PN}-300mhz ${PN}-500mhz ${PN}-600mhz ${PN}-720mhz ${PN}-800mhz ${PN}-1ghz"
 
 # Split the matrix files by clock
+FILES_${PN}-275mhz += "${MATRIX_APP_DIR}/power_set_275mhz/*"
 FILES_${PN}-300mhz += "${MATRIX_APP_DIR}/power_set_300mhz/*"
+FILES_${PN}-500mhz += "${MATRIX_APP_DIR}/power_set_500mhz/*"
 FILES_${PN}-600mhz += "${MATRIX_APP_DIR}/power_set_600mhz/*"
+FILES_${PN}-720mhz += "${MATRIX_APP_DIR}/power_set_720mhz/*"
 FILES_${PN}-800mhz += "${MATRIX_APP_DIR}/power_set_800mhz/*"
 FILES_${PN}-1ghz += "${MATRIX_APP_DIR}/power_set_1ghz/*"
 
 # Split the ${bindir} files by clock
-FILES_${PN}-300mhz += "${bindir}/setopp2.sh"
-FILES_${PN}-600mhz += "${bindir}/setopp3.sh"
-FILES_${PN}-800mhz += "${bindir}/setopp4.sh"
-FILES_${PN}-1ghz += "${bindir}/setopp1.sh"
+FILES_${PN}-275mhz += "${bindir}/setclock275MHz.sh"
+FILES_${PN}-300mhz += "${bindir}/setclock300MHz.sh"
+FILES_${PN}-500mhz += "${bindir}/setclock500MHz.sh"
+FILES_${PN}-600mhz += "${bindir}/setclock600MHz.sh"
+FILES_${PN}-720mhz += "${bindir}/setclock720MHz.sh"
+FILES_${PN}-800mhz += "${bindir}/setclock800MHz.sh"
+FILES_${PN}-1ghz += "${bindir}/setclock1GHz.sh"
-- 
1.7.0.4


