Return-Path: <h-gou@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 299DD5299A
	for <meta-arago@arago-project.org>;
	Mon,  3 Jun 2019 21:36:38 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x53La1Xm125298
	for <meta-arago@arago-project.org>; Mon, 3 Jun 2019 16:36:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1559597761;
	bh=8+gzRc8jkXTsw+9NfTLlT9VL/cKaPvm6A20Zt6dtfOA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=oB2JPiZP8sil808PtdIgSCIazxrWGXlbwviGQ6yoQmhoiF0I0vMmYllcUgQ1rrs2I
	YF0q1SrBZU5Hau9tZoLU7RVPkN3KFad5ZUBl4G7Yi5C33p67IAKwBDmk5R1dzv3Qnx
	7Rd9HhJ5rUxN/GPfF6jfL92U0i1khBdS7OxqY5c8=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x53La1cE082779
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 3 Jun 2019 16:36:01 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 3 Jun 2019 16:36:00 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 3 Jun 2019 16:36:01 -0500
Received: from UDA0271529.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x53La0V7022105;
	Mon, 3 Jun 2019 16:36:00 -0500
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 3 Jun 2019 17:34:43 -0400
Message-ID: <20190603213445.13887-3-h-gou@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190603213445.13887-1-h-gou@ti.com>
References: <20190603213445.13887-1-h-gou@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master] [PATCH 2/4] matrix-gui-submenus: add analytics submenu
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
X-List-Received-Date: Mon, 03 Jun 2019 21:36:39 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
 .../recipes-core/matrix/matrix-gui-submenus_2.0.bb           | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb
index 9478618c..082f3a26 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb
@@ -7,7 +7,7 @@ require matrix-gui-apps-git.inc
 # reset the LIC_FILES_CHKSUM setting from the matrix-gui-apps-git.inc file
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
 
-PR = "${INC_PR}.19"
+PR = "${INC_PR}.20"
 
 # These packages make submenus in matrix and are not architecture specific
 inherit allarch
@@ -37,6 +37,7 @@ SUBMENUS = " arm_submenu \
              browser_submenu \
 	     hmi_submenu \
              tidl_submenu \
+             analytics_submenu \
 "
 
 do_install(){
@@ -72,6 +73,7 @@ PACKAGES += " ${PN}-arm \
               ${PN}-browser \
               ${PN}-hmi \
               ${PN}-tidl \
+              ${PN}-analytics \
 "
 
 # Make sure app images has been installed
@@ -102,3 +104,4 @@ FILES_${PN}-touch = "${MATRIX_APP_DIR}/touch_submenu/*"
 FILES_${PN}-browser = "${MATRIX_APP_DIR}/browser_submenu/*"
 FILES_${PN}-hmi = "${MATRIX_APP_DIR}/hmi_submenu/*"
 FILES_${PN}-tidl = "${MATRIX_APP_DIR}/tidl_submenu/*"
+FILES_${PN}-analytics = "${MATRIX_APP_DIR}/analytics_submenu/*"
-- 
2.17.1


