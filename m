Return-Path: <e-ruei1@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 214D352A63
	for <meta-arago@arago-project.org>;
	Tue,  1 Aug 2017 19:54:22 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v71JsMfK001368
	for <meta-arago@arago-project.org>; Tue, 1 Aug 2017 14:54:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1501617262;
	bh=yrUZccCYzWSPw82uAZjOC2OTn2Vjst90LxVrJenAqN0=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=OGLmHVfuQIvB6H5njRvRDsZzLmiSwOPWcw3a2E4PB3azCly47EvBz1o3vIKpFsAJs
	tJnz6ROEGj0Q+Lce3iYS5oNIafgigZhCMALHKhUC47DmHYF/7HHtkS0G1H4zp9WKE8
	Wl0KPB20l/E1NQgtMCsPr42TITAT/mIt5h42rVUo=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v71JsMjx019546
	for <meta-arago@arago-project.org>; Tue, 1 Aug 2017 14:54:22 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 1 Aug 2017 14:54:21 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v71JsAQf012102	for <meta-arago@arago-project.org>;
	Tue, 1 Aug 2017 14:54:21 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 1 Aug 2017 15:54:07 -0400
Message-ID: <1501617248-46185-4-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1501617248-46185-1-git-send-email-e-ruei1@ti.com>
References: <1501617248-46185-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
Subject: [morty/master][PATCH v2 3/4] matrix-gui-submenu: add browser submenu
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
X-List-Received-Date: Tue, 01 Aug 2017 19:54:22 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb
index 7e1f7d1..f592f7a 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb
@@ -7,7 +7,7 @@ require matrix-gui-apps-git.inc
 # reset the LIC_FILES_CHKSUM setting from the matrix-gui-apps-git.inc file
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
 
-PR = "${INC_PR}.17"
+PR = "${INC_PR}.18"
 
 # These packages make submenus in matrix and are not architecture specific
 inherit allarch
@@ -34,6 +34,7 @@ SUBMENUS = " arm_submenu \
              videoanalytics_submenu \
              machinevision_submenu \
              touch_submenu \
+             browser_submenu \
 "
 
 do_install(){
@@ -66,6 +67,7 @@ PACKAGES += " ${PN}-arm \
               ${PN}-videoanalytics \
               ${PN}-machinevision \
               ${PN}-touch \
+              ${PN}-browser \
 "
 
 # Make sure app images has been installed
@@ -93,3 +95,4 @@ FILES_${PN}-opencl = "${MATRIX_APP_DIR}/opencl_submenu/*"
 FILES_${PN}-videoanalytics = "${MATRIX_APP_DIR}/videoanalytics_submenu/*"
 FILES_${PN}-machinevision = "${MATRIX_APP_DIR}/machinevision_submenu/*"
 FILES_${PN}-touch = "${MATRIX_APP_DIR}/touch_submenu/*"
+FILES_${PN}-browser = "${MATRIX_APP_DIR}/browser_submenu/*"
-- 
1.9.1


