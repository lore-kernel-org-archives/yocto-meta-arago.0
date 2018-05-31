Return-Path: <yuanzhao@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id C035152987
	for <meta-arago@arago-project.org>;
	Thu, 31 May 2018 15:15:10 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w4VFF5Kb013327
	for <meta-arago@arago-project.org>; Thu, 31 May 2018 10:15:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1527779705;
	bh=Z0P/rjpkweF0+o1Wpqq40/Ik0fmA4vaQRTGkfQDfOJg=;
	h=From:To:CC:Subject:Date;
	b=Jynu6LbfDwHXbPW0c5UqGxZmkXTNgsFXnQ1saH6GIDA5bgmU3uVnaUrRBS3W+dqzD
	vo1fN1m32xsIBRlJGVc1clHNFIlCW8CEEJEpNSe8xL4yAeOAmu0wLtDMdZFebkyHkP
	HBLJavv1UHVTbRwexA3ZgeVYqz/V1TEwiwoAJiM8=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w4VFF5Hj007949
	for <meta-arago@arago-project.org>; Thu, 31 May 2018 10:15:05 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 31 May 2018 10:15:04 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 31 May 2018 10:15:04 -0500
Received: from sdomc-build0.hou.asp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w4VFF4BA027722;
	Thu, 31 May 2018 10:15:04 -0500
From: Yuan Zhao <yuanzhao@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 31 May 2018 10:14:51 -0500
Message-ID: <20180531151451.21291-1-yuanzhao@ti.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] tidl-api: Initial release v01.00.00
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
X-List-Received-Date: Thu, 31 May 2018 15:15:11 -0000
Content-Type: text/plain

- Recipes for building from repository for TI Deep Learning (TIDL) API.
  Repo contains the API, examples, and a TIDL network viewer.
- Recipes: tidl-examples, tidl-viewer, tidl-viewer-native

Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
---
 meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc | 11 +++++
 .../recipes-ti/tidl-api/tidl-examples_git.bb       | 47 ++++++++++++++++++++++
 .../recipes-ti/tidl-api/tidl-viewer_git.bb         | 32 +++++++++++++++
 3 files changed, 90 insertions(+)
 create mode 100644 meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
 create mode 100644 meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb
 create mode 100644 meta-arago-extras/recipes-ti/tidl-api/tidl-viewer_git.bb

diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc b/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
new file mode 100644
index 00000000..d266611c
--- /dev/null
+++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
@@ -0,0 +1,11 @@
+PV = "1.0.0.0"
+INC_PR = "r0"
+
+LIC_FILES_CHKSUM = "file://tidl_api_manifest.html;md5=ae816cc40db02fe06193212437ad00e8"
+
+GIT_URI = "git://git.ti.com/tidl/tidl-api.git"
+GIT_PROTOCOL = "git"
+BRANCH = "master"
+
+SRC_URI = "${GIT_URI};protocol=${GIT_PROTOCOL};branch=${BRANCH}"
+SRCREV = "d6326ad29c9ed4b79ebf3e0f588f247ed2cf3d2e"
diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb b/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb
new file mode 100644
index 00000000..be9bb65f
--- /dev/null
+++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb
@@ -0,0 +1,47 @@
+SUMMARY = "TIDL API and examples"
+DESCRIPTION = "TIDL API and examples of API usage. Refer TIDL API User's Guide for details."
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
+DEPENDS = "opencv opencl opencl-monitor ti-cgt6x-native clocl-native"
+
+RDEPENDS_${PN} += " opencl-runtime opencv"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OEMAKE = " -C ${S}/examples \
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
+do_install() {
+    install -d ${D}${datadir}/ti/tidl-api
+    install -d ${D}${datadir}/ti/tidl-api/examples
+    install -d ${D}${datadir}/ti/tidl-api/tidl_api
+    install -d ${D}${datadir}/ti/tidl-api/viewer
+    cp ${CP_ARGS} ${S}/examples/* ${D}${datadir}/ti/tidl-api/examples/
+    cp ${CP_ARGS} ${S}/tidl_api/* ${D}${datadir}/ti/tidl-api/tidl_api/
+    cp ${CP_ARGS} ${S}/viewer/* ${D}${datadir}/ti/tidl-api/viewer/
+    install ${S}/readme.md ${D}${datadir}/ti/tidl-api/
+}
+
+FILES_${PN} += "\
+    ${datadir}/ti/tidl-api \
+"
+
+
+INSANE_SKIP_${PN} = "arch ldflags textrel staticdev"
diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-viewer_git.bb b/meta-arago-extras/recipes-ti/tidl-api/tidl-viewer_git.bb
new file mode 100644
index 00000000..3c761747
--- /dev/null
+++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-viewer_git.bb
@@ -0,0 +1,32 @@
+SUMMARY = "TIDL Network Viewer"
+DESCRIPTION = "TIDL Network viewer using dot and graphviz"
+HOMEPAGE = "http://software-dl.ti.com/mctools/docs/tidl-api/intro.html"
+LICENSE = "BSD"
+
+include tidl-api.inc
+
+PR = "${INC_PR}.0"
+
+DEPENDS = "boost boost-native ti-cgt6x-native clocl-native"
+
+S = "${WORKDIR}/git"
+
+TARGET_class-target = "arm"
+TARGET_class-native = "x86"
+TARGET_class-nativesdk = "x86"
+
+EXTRA_OEMAKE = " -C ${S}/viewer \
+                 TARGET=${TARGET} \
+                 TARGET_ROOTDIR=${STAGING_DIR_HOST} \
+"
+
+do_compile() {
+  oe_runmake
+}
+
+do_install() {
+  install -d ${D}${bindir}
+  install -m 755 ${S}/viewer/${TARGET}/tidl_viewer ${D}${bindir}
+}
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.14.1


