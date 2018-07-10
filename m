Return-Path: <yuanzhao@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id D8E21529BF
	for <meta-arago@arago-project.org>;
	Tue, 10 Jul 2018 17:07:30 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6AH7OWd089146
	for <meta-arago@arago-project.org>; Tue, 10 Jul 2018 12:07:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1531242444;
	bh=VRg6AbKXs5dxvj34TmsbG+e5S5NrWzNHgtlCQwPum6U=;
	h=From:To:CC:Subject:Date;
	b=dLBl43rGQnnEkjDwb3uIIu+Ceqq5e6x2LtK/Gajsfc4D+tomKeGffef3jd1m3iPS2
	i6NGoKB+P2LIR3i+WvlcFCdTNETal5Z/gk/3HcoiqbCWnnono9hT9cIB59GxZ7jf1m
	JBAmBk+Jq8l4LU66DsPZ8cfbsEhejJczg4jr2y6s=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6AH7OjQ010015
	for <meta-arago@arago-project.org>; Tue, 10 Jul 2018 12:07:24 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 10 Jul 2018 12:07:23 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 10 Jul 2018 12:07:24 -0500
Received: from sdomc-build0.hou.asp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6AH7Nl2000354;
	Tue, 10 Jul 2018 12:07:23 -0500
From: Yuan Zhao <yuanzhao@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 10 Jul 2018 12:07:04 -0500
Message-ID: <20180710170704.139418-1-yuanzhao@ti.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] tidl-api: update to version 01.00.00.02
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
X-List-Received-Date: Tue, 10 Jul 2018 17:07:31 -0000
Content-Type: text/plain

Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
---
 meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc | 13 +++---
 .../recipes-ti/tidl-api/tidl-api_git.bb            | 54 ++++++++++++++++++++++
 .../recipes-ti/tidl-api/tidl-examples_git.bb       | 34 ++++++++------
 3 files changed, 82 insertions(+), 19 deletions(-)
 create mode 100644 meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb

diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc b/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
index d266611c..ca9131d9 100644
--- a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
+++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
@@ -1,11 +1,12 @@
-PV = "1.0.0.0"
+PV = "1.0.0.2"
 INC_PR = "r0"
 
 LIC_FILES_CHKSUM = "file://tidl_api_manifest.html;md5=ae816cc40db02fe06193212437ad00e8"
 
-GIT_URI = "git://git.ti.com/tidl/tidl-api.git"
-GIT_PROTOCOL = "git"
-BRANCH = "master"
+TIDL_API_GIT_URI = "git://git.ti.com/tidl/tidl-api.git"
+TIDL_API_GIT_PROTOCOL = "git"
+TIDL_API_GIT_BRANCH = "master"
+TIDL_API_GIT_SRCREV = "8bad8d86fd89fd8c482aa10ab89f3049337a9ca2"
 
-SRC_URI = "${GIT_URI};protocol=${GIT_PROTOCOL};branch=${BRANCH}"
-SRCREV = "d6326ad29c9ed4b79ebf3e0f588f247ed2cf3d2e"
+SRC_URI = "${TIDL_API_GIT_URI};protocol=${TIDL_API_GIT_PROTOCOL};branch=${TIDL_API_GIT_BRANCH}"
+SRCREV = "${TIDL_API_GIT_SRCREV}"
diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb b/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
new file mode 100644
index 00000000..9c41ef11
--- /dev/null
+++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
@@ -0,0 +1,54 @@
+SUMMARY = "TIDL API"
+DESCRIPTION = "TIDL API header and library. Refer TIDL API User's Guide for details."
+HOMEPAGE = "http://software-dl.ti.com/mctools/docs/tidl-api/intro.html"
+LICENSE = "BSD"
+
+include tidl-api.inc
+require recipes-ti/includes/ti-paths.inc
+
+PR = "${INC_PR}.0"
+
+COMPATIBLE_MACHINE = "am57xx-evm|am57xx-hs-evm"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+DEPENDS = "opencv \
+           opencl \
+           opencl-monitor \
+           ti-cgt6x-native \
+           clocl-native \
+"
+
+RDEPENDS_${PN} += "opencl-runtime \
+                   opencv \
+"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OEMAKE = " -C ${S}/tidl_api \
+                 TARGET_ROOTDIR=${STAGING_DIR_HOST} \
+                 TI_OCL_CGT_INSTALL=${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x \
+"
+
+do_compile() {
+  oe_runmake
+}
+
+CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
+
+TIDL_INSTALL_DIR = "${datadir}/ti/tidl"
+
+do_install() {
+    install -d ${D}${TIDL_INSTALL_DIR}
+    install -d ${D}${TIDL_INSTALL_DIR}/tidl_api
+    install -d ${D}${TIDL_INSTALL_DIR}/viewer
+    cp ${CP_ARGS} ${S}/tidl_api/* ${D}${TIDL_INSTALL_DIR}/tidl_api/
+    cp ${CP_ARGS} ${S}/viewer/* ${D}${TIDL_INSTALL_DIR}/viewer/
+    install ${S}/readme.md ${D}${TIDL_INSTALL_DIR}/
+}
+
+FILES_${PN} += "\
+    ${TIDL_INSTALL_DIR} \
+"
+
+
+INSANE_SKIP_${PN} = "arch ldflags textrel staticdev"
diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb b/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb
index be9bb65f..3e4514fe 100644
--- a/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb
+++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb
@@ -1,5 +1,5 @@
-SUMMARY = "TIDL API and examples"
-DESCRIPTION = "TIDL API and examples of API usage. Refer TIDL API User's Guide for details."
+SUMMARY = "TIDL API examples"
+DESCRIPTION = "Examples of TIDL API. Refer TIDL API User's Guide for details."
 HOMEPAGE = "http://software-dl.ti.com/mctools/docs/tidl-api/intro.html"
 LICENSE = "BSD"
 
@@ -11,9 +11,16 @@ PR = "${INC_PR}.0"
 COMPATIBLE_MACHINE = "am57xx-evm|am57xx-hs-evm"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-DEPENDS = "opencv opencl opencl-monitor ti-cgt6x-native clocl-native"
+DEPENDS = "opencv \
+           clocl-native \
+           ti-cgt6x-native \
+           tidl-api \
+"
 
-RDEPENDS_${PN} += " opencl-runtime opencv"
+RDEPENDS_${PN} += "tidl-api \
+                   opencl-runtime \
+                   opencv \
+"
 
 S = "${WORKDIR}/git"
 
@@ -28,20 +35,21 @@ do_compile() {
 
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
+    cp ${CP_ARGS} ${S}/examples/* ${D}${TIDL_INSTALL_DIR}/examples/
 }
 
 FILES_${PN} += "\
-    ${datadir}/ti/tidl-api \
+    ${TIDL_INSTALL_DIR} \
 "
 
 
 INSANE_SKIP_${PN} = "arch ldflags textrel staticdev"
+
+CREATE_SRCIPK = "1"
+SRCIPK_SRC_DIR = "${S}/examples"
+SRCIPK_INSTALL_DIR = "example-applications/${PN}-${PV}"
-- 
2.14.1


