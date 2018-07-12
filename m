Return-Path: <h-gou@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 8AABE529DF
	for <meta-arago@arago-project.org>;
	Thu, 12 Jul 2018 19:15:21 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6CJFERP076906
	for <meta-arago@arago-project.org>; Thu, 12 Jul 2018 14:15:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1531422914;
	bh=2lldoRH/XWM1lJFvJTA+yXpYXUUnYtTLyiZFksu3/cw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=QulKhmTPq/0IifjGu8fB7WI6vaaoadkiNlcWrmSfVgz8aJQZfaCvsXLrCXQZSJTky
	dKLnN80K5yhW8Hq781opU4IRbcJPQL7TSXjHrULuYgODdG85DNyshpOWVRApgpyyiY
	VCw90LJLZuTHHtGUDLIacRIJ78oXb8of5fjt7iaA=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6CJFEqR015341
	for <meta-arago@arago-project.org>; Thu, 12 Jul 2018 14:15:14 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 12 Jul 2018 14:15:14 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 12 Jul 2018 14:15:14 -0500
Received: from uda0271529.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6CJFDTR022560;
	Thu, 12 Jul 2018 14:15:14 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 12 Jul 2018 15:14:49 -0400
Message-ID: <1531422891-23069-2-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1531422891-23069-1-git-send-email-a0271529@ti.com>
References: <1531422891-23069-1-git-send-email-a0271529@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>, d-senicic1@ti.com
Subject: [ti2018.01/rocko/master] [PATCH 2/4] matrix-gui-submenus: add tidl submenu
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
X-List-Received-Date: Thu, 12 Jul 2018 19:15:22 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb
index 34bd759..9478618 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb
@@ -7,7 +7,7 @@ require matrix-gui-apps-git.inc
 # reset the LIC_FILES_CHKSUM setting from the matrix-gui-apps-git.inc file
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
 
-PR = "${INC_PR}.18"
+PR = "${INC_PR}.19"
 
 # These packages make submenus in matrix and are not architecture specific
 inherit allarch
@@ -36,6 +36,7 @@ SUBMENUS = " arm_submenu \
              touch_submenu \
              browser_submenu \
 	     hmi_submenu \
+             tidl_submenu \
 "
 
 do_install(){
@@ -70,6 +71,7 @@ PACKAGES += " ${PN}-arm \
               ${PN}-touch \
               ${PN}-browser \
               ${PN}-hmi \
+              ${PN}-tidl \
 "
 
 # Make sure app images has been installed
@@ -99,3 +101,4 @@ FILES_${PN}-machinevision = "${MATRIX_APP_DIR}/machinevision_submenu/*"
 FILES_${PN}-touch = "${MATRIX_APP_DIR}/touch_submenu/*"
 FILES_${PN}-browser = "${MATRIX_APP_DIR}/browser_submenu/*"
 FILES_${PN}-hmi = "${MATRIX_APP_DIR}/hmi_submenu/*"
+FILES_${PN}-tidl = "${MATRIX_APP_DIR}/tidl_submenu/*"
-- 
1.9.1


