Return-Path: <manishalocal@uda0393239>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 6E7B852AC5
	for <meta-arago@arago-project.org>;
	Wed, 30 Aug 2017 17:56:50 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v7UHuoof027594
	for <meta-arago@arago-project.org>; Wed, 30 Aug 2017 12:56:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504115810;
	bh=DMtkQX2lqxo4HnWkYPZBByx0iFdx6CbMl+gV397yUM8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=geKD4lBwGgM6MKGXdy7d9kDrxw+GdY6MdZGdp+iIuxXxr2x4cml+dbB13puZxx67U
	MRkgARQoJQLZYelFJVmH8O88EEM/LBT+T+jsnG7grU+4LAsWiJmggrqfSRSfSeNYXe
	M5ky6/560UAUxhdIp90peXS1gzyYh3OKTw0iNNek=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7UHuoAI026782
	for <meta-arago@arago-project.org>; Wed, 30 Aug 2017 12:56:50 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 30 Aug 2017 12:56:50 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 30 Aug 2017 12:56:50 -0500
Received: from uda0393239 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7UHunAr009870;
	Wed, 30 Aug 2017 12:56:50 -0500
Received: from manishalocal by uda0393239 with local (Exim 4.82)
	(envelope-from <manishalocal@uda0393239>)
	id 1dn7EP-0002z1-SU; Wed, 30 Aug 2017 12:56:49 -0500
From: Manisha Agrawal <manisha.agrawal@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 30 Aug 2017 12:56:42 -0500
Message-ID: <20170830175647.11427-2-manisha.agrawal@ti.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170830175647.11427-1-manisha.agrawal@ti.com>
References: <20170830175647.11427-1-manisha.agrawal@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][PATCH v3 2/7] matrix : add new EVSE HMI demo
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
X-List-Received-Date: Wed, 30 Aug 2017 17:56:52 -0000
Content-Type: text/plain

Create sub menu for HMI.
Update the matrix revision for matrix-gui-upadte-v2.

Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
---
 meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc    | 4 ++--
 meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb | 3 +++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
index b805f5e1..551416d9 100644
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
index f592f7aa..b9973dd1 100644
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


