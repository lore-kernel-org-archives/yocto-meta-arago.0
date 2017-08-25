Return-Path: <manishalocal@uda0393239>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 4B770529CD
	for <meta-arago@arago-project.org>;
	Fri, 25 Aug 2017 16:02:56 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v7PG2uej025457
	for <meta-arago@arago-project.org>; Fri, 25 Aug 2017 11:02:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1503676976;
	bh=VI6M3jLKlDflsvzq5NN+zZ1+ycILTqxt9ab5mUzPqBM=;
	h=From:To:CC:Subject:Date;
	b=zMAGezaks3Gnrqz9j9tyoBPo7YjPuuWzRiEEY6zhxYNbsY4n1l9beHLSChG8qxa2g
	IHnME3LPEnnTpK5mLEqPfe2Ic50iVRe4kJyw0Ot7Ee5MbSWyYDlfQtfAl6w68Ip3sS
	MtgkVciz4U9LCOE0On/SQ1yZIsGcGtC+5TnVW2dc=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7PG2uom005683
	for <meta-arago@arago-project.org>; Fri, 25 Aug 2017 11:02:56 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 25 Aug 2017 11:02:55 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 25 Aug 2017 11:02:55 -0500
Received: from uda0393239 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7PG2tsV025489;
	Fri, 25 Aug 2017 11:02:55 -0500
Received: from manishalocal by uda0393239 with local (Exim 4.82)
	(envelope-from <manishalocal@uda0393239>)
	id 1dlH4M-000366-LV; Fri, 25 Aug 2017 11:02:52 -0500
From: Manisha Agrawal <manisha.agrawal@ti.com>
To: <meta-arago@arago-project.org>, <j-stiffler@ti.com>, <denys@ti.com>
Date: Fri, 25 Aug 2017 11:02:43 -0500
Message-ID: <20170825160245.11812-1-manisha.agrawal@ti.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty]PATCH 1/3] matrix : add new EVSE HMI demo
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
X-List-Received-Date: Fri, 25 Aug 2017 16:02:56 -0000
Content-Type: text/plain

Create sub menu for HMI
Update the matrix revision for matrix-gui-upadte-v2

Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
---
 meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc    | 4 ++--
 meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb | 3 +++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
index b805f5e..551416d 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
@@ -4,9 +4,9 @@ LICENSE_CHECKSUM = "LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
 LIC_FILES_CHKSUM := "file://../${LICENSE_CHECKSUM}"
 
 SRC_URI = "git://git.ti.com/matrix-gui-v2/matrix-gui-v2-apps.git;protocol=git;branch=${BRANCH}"
-SRCREV = "38afccb5335216ececa874cf4cf72a67c4164fc3"
+SRCREV = "50a2f2ec7043e17bc7af72186e3d0a8d7773ec0a"
 BRANCH = "master"
-INC_PR = "r47"
+INC_PR = "r48"
 
 # Pull in the base package for installing matrix applications
 require matrix-gui-apps.inc
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb
index f592f7a..b9973dd 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb
@@ -35,6 +35,7 @@ SUBMENUS = " arm_submenu \
              machinevision_submenu \
              touch_submenu \
              browser_submenu \
+	     hmi_submenu \
 "
 
 do_install(){
@@ -68,6 +69,7 @@ PACKAGES += " ${PN}-arm \
               ${PN}-machinevision \
               ${PN}-touch \
               ${PN}-browser \
+              ${PN}-hmi \
 "
 
 # Make sure app images has been installed
@@ -96,3 +98,4 @@ FILES_${PN}-videoanalytics = "${MATRIX_APP_DIR}/videoanalytics_submenu/*"
 FILES_${PN}-machinevision = "${MATRIX_APP_DIR}/machinevision_submenu/*"
 FILES_${PN}-touch = "${MATRIX_APP_DIR}/touch_submenu/*"
 FILES_${PN}-browser = "${MATRIX_APP_DIR}/browser_submenu/*"
+FILES_${PN}-hmi = "${MATRIX_APP_DIR}/hmi_submenu/*"
-- 
2.13.0


