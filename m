Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 3324E529B3
	for <meta-arago@arago-project.org>;
	Fri, 22 Jun 2018 18:55:00 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w5MIss2Q080663
	for <meta-arago@arago-project.org>; Fri, 22 Jun 2018 13:54:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1529693694;
	bh=q/6ZQM1jD2ykDOud5wanSED74SAtFGsjE7nIT34Mj20=;
	h=From:To:CC:Subject:Date;
	b=eNq4XQNCr6I92Hkovzc+LDXmZLPjLGdjVnhgIe88mJwvQH+t9/1rPmr2tYIPV9PQc
	cEf1U/vbvhMNLyJSRqXsmnvpyt3FIfOCkclnLLhgBm3jumX+fORyaAp64sx2UKcSJz
	M77lsmAkwzy6lhqOy8NYTk9Z8XbrL+FFaP9WkTUM=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5MIssOW017429
	for <meta-arago@arago-project.org>; Fri, 22 Jun 2018 13:54:54 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 22 Jun 2018 13:54:53 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 22 Jun 2018 13:54:53 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5MIsrDE016014;
	Fri, 22 Jun 2018 13:54:53 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 22 Jun 2018 14:43:25 -0400
Message-ID: <1529693010-26382-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: ajayj@ti.com
Subject: [meta-processor-sdk][PATCH v2 1/6] tidl-api: various updates
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
X-List-Received-Date: Fri, 22 Jun 2018 18:55:00 -0000
Content-Type: text/plain

* Bump SRCREV for nativesdk-tidl-viewer fix
* Rename tidl-examples installation directory.
* Enable creation of tidl-examples sourceipk.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
v2 changes: changed TIDL_INSTALL_PATH

 recipes-ti/tidl-api/tidl-api.inc         |  2 +-
 recipes-ti/tidl-api/tidl-examples_git.bb | 23 ++++++++++++++---------
 2 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/recipes-ti/tidl-api/tidl-api.inc b/recipes-ti/tidl-api/tidl-api.inc
index d266611..ed38516 100644
--- a/recipes-ti/tidl-api/tidl-api.inc
+++ b/recipes-ti/tidl-api/tidl-api.inc
@@ -8,4 +8,4 @@ GIT_PROTOCOL = "git"
 BRANCH = "master"
 
 SRC_URI = "${GIT_URI};protocol=${GIT_PROTOCOL};branch=${BRANCH}"
-SRCREV = "d6326ad29c9ed4b79ebf3e0f588f247ed2cf3d2e"
+SRCREV = "1ea871c6aed97f5891a04e0cf479b64cbbb7bb2c"
diff --git a/recipes-ti/tidl-api/tidl-examples_git.bb b/recipes-ti/tidl-api/tidl-examples_git.bb
index be9bb65..f6c3020 100644
--- a/recipes-ti/tidl-api/tidl-examples_git.bb
+++ b/recipes-ti/tidl-api/tidl-examples_git.bb
@@ -28,20 +28,25 @@ do_compile() {
 
 CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
 
+TIDL_INSTALL_DIR = "${datadir}/ti/tidl"
+
 do_install() {
-    install -d ${D}${datadir}/ti/tidl-api
-    install -d ${D}${datadir}/ti/tidl-api/examples
-    install -d ${D}${datadir}/ti/tidl-api/tidl_api
-    install -d ${D}${datadir}/ti/tidl-api/viewer
-    cp ${CP_ARGS} ${S}/examples/* ${D}${datadir}/ti/tidl-api/examples/
-    cp ${CP_ARGS} ${S}/tidl_api/* ${D}${datadir}/ti/tidl-api/tidl_api/
-    cp ${CP_ARGS} ${S}/viewer/* ${D}${datadir}/ti/tidl-api/viewer/
-    install ${S}/readme.md ${D}${datadir}/ti/tidl-api/
+    install -d ${D}${TIDL_INSTALL_DIR}
+    install -d ${D}${TIDL_INSTALL_DIR}/examples
+    install -d ${D}${TIDL_INSTALL_DIR}/tidl_api
+    install -d ${D}${TIDL_INSTALL_DIR}/viewer
+    cp ${CP_ARGS} ${S}/examples/* ${D}${TIDL_INSTALL_DIR}/examples/
+    cp ${CP_ARGS} ${S}/tidl_api/* ${D}${TIDL_INSTALL_DIR}/tidl_api/
+    cp ${CP_ARGS} ${S}/viewer/* ${D}${TIDL_INSTALL_DIR}/viewer/
+    install ${S}/readme.md ${D}${TIDL_INSTALL_DIR}/
 }
 
 FILES_${PN} += "\
-    ${datadir}/ti/tidl-api \
+    ${TIDL_INSTALL_DIR} \
 "
 
 
 INSANE_SKIP_${PN} = "arch ldflags textrel staticdev"
+
+CREATE_SRCIPK = "1"
+SRCIPK_INSTALL_DIR = "example-applications/tidl-api-${PV}"
-- 
2.7.4


