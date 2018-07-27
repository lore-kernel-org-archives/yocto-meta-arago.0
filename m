Return-Path: <e-ruei1@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 5C17E52A14
	for <meta-arago@arago-project.org>;
	Fri, 27 Jul 2018 16:09:12 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6RG950R129573
	for <meta-arago@arago-project.org>; Fri, 27 Jul 2018 11:09:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1532707745;
	bh=n4bd+Wu4fSsLTWBVrWwpYNXns0nuz+h9a8zggvuL/ao=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=tHHZDG+kCoVXxijmIdjM82RboFH2+LTx9ZhJSX2Tg0eFGO5I+qesI2XYVHxEIOHIk
	ftcsYk4NqVgeZQ0dTBZshXh2aR44Vt/gV4qdiF2O9HauuzBQCucIVREBDfp0t3O6f5
	j53E8VAi+pwvrCO9zDtrkuBQ2yaZxo4apLsjTD2Y=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6RG95AS012085
	for <meta-arago@arago-project.org>; Fri, 27 Jul 2018 11:09:05 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 27 Jul 2018 11:09:04 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 27 Jul 2018 11:09:04 -0500
Received: from uda0850410.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6RG94Ko017026
	for <meta-arago@arago-project.org>; Fri, 27 Jul 2018 11:09:04 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 27 Jul 2018 12:08:57 -0400
Message-ID: <1532707738-28510-4-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1532707738-28510-1-git-send-email-e-ruei1@ti.com>
References: <1532707738-28510-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 3/4] maxtrx-gui: enable k3 support
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
X-List-Received-Date: Fri, 27 Jul 2018 16:09:13 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb | 7 ++++++-
 meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb          | 3 +--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb
index 1e88084..0d4d867 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
 
 require matrix-gui-apps-git.inc
 
-PR = "${INC_PR}.8"
+PR = "${INC_PR}.9"
 
 S = "${WORKDIR}/git/3d_apps"
 
@@ -41,6 +41,10 @@ PACKAGES_append_ti33x = " \
             matrix-3d-demo-kmscube \
 "
 
+PACKAGES_append_k3 = " \
+            matrix-3d-demo-kmscube \
+"
+
 MATRIX_3D_DEMO_SGX_QAF_PARAM = "1000"
 
 do_install_prepend() {
@@ -53,6 +57,7 @@ do_install_prepend() {
 3D_DEMOS_RDEPENDS_omap-a15 = "${3D_DEMOS_RDEPENDS_MATRIX} img-pvr-sdk"
 3D_DEMOS_RDEPENDS_ti43x    = "${3D_DEMOS_RDEPENDS_MATRIX} img-pvr-sdk"
 3D_DEMOS_RDEPENDS_ti33x    = "${3D_DEMOS_RDEPENDS_MATRIX} img-pvr-sdk"
+3D_DEMOS_RDEPENDS_k3       = "${3D_DEMOS_RDEPENDS_MATRIX} img-pvr-sdk"
 
 RDEPENDS_matrix-3d-demo-chameleon = "${3D_DEMOS_RDEPENDS}"
 RDEPENDS_matrix-3d-demo-coverflow = "${3D_DEMOS_RDEPENDS}"
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
index ff57e12..d8aa00b 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a886c9ef769b2d8271115d2502512e5d"
 
 SECTION = "multimedia"
 
-PR = "r34"
+PR = "r35"
 
 INITSCRIPT_NAME = "matrix-gui-2.0"
 INITSCRIPT_PARAMS = "defaults 97"
@@ -55,7 +55,6 @@ do_install(){
 GUIDEPS = "matrix-gui-browser refresh-screen"
 GUIDEPS_keystone = ""
 GUIDEPS_omapl138 = ""
-GUIDEPS_k3 = ""
 
 RDEPENDS_${PN} += "matrix-lighttpd-config lighttpd lighttpd-module-cgi lighttpd-module-compress lighttpd-module-expire php php-cgi php-cli ${GUIDEPS}"
 
-- 
1.9.1


