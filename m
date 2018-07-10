Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 5E0DC529C0
	for <meta-arago@arago-project.org>;
	Tue, 10 Jul 2018 20:27:10 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6AKR3HM123112
	for <meta-arago@arago-project.org>; Tue, 10 Jul 2018 15:27:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1531254423;
	bh=Hdh2s/EjPwKYI+AfPF9VY9W1JdwwAlYReuGbyyaoDVI=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=K3wZ1/OtF0fj9ND0suN9CXctyKFoYHwLtPwBOQY9sMWUuS3dIsWRTmFf0gwdPEQJP
	HTSCVNmgSrCtABpZMr7d5F/spQ5jVZLF/UvJwU5AplQqDz8Gw9Ue7r+hxmQgI7AfLH
	ZvIwJ6T5+6aRyQE+RJR5fudEPXa+4wVk6VHoL+jQ=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6AKR3dn021368
	for <meta-arago@arago-project.org>; Tue, 10 Jul 2018 15:27:03 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 10 Jul 2018 15:27:03 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 10 Jul 2018 15:27:03 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6AKR37U028684;
	Tue, 10 Jul 2018 15:27:03 -0500
Date: Tue, 10 Jul 2018 16:26:21 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20180710202621.GL4189@beryl>
References: <20180710200912.146868-1-yuanzhao@ti.com>
	<61c670e8-38ac-30c5-87ff-a789b4c530e4@ti.com>
MIME-Version: 1.0
In-Reply-To: <61c670e8-38ac-30c5-87ff-a789b4c530e4@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [EXTERNAL] [PATCH v4] tidl-api: update to version 01.00.00.02
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
X-List-Received-Date: Tue, 10 Jul 2018 20:27:10 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Would have to go through rocko-next testing first.


On Tue, Jul 10, 2018 at 04:14:30PM -0400, Jacob Stiffler wrote:
> Denys,
> 
> Can you please apply this to the ti2018.01 branch?
> 
> Thank you,
> 
> Jake
> 
> 
> Acked-by: Jacob Stiffler <j-stiffler@ti.com>
> 
> 
> On 7/10/2018 4:09 PM, Yuan Zhao wrote:
> >Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
> >---
> >  .../conf/distro/include/arago-source-ipk.inc       |  4 ++
> >  meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc |  4 +-
> >  .../recipes-ti/tidl-api/tidl-api_git.bb            | 54 ++++++++++++++++++++++
> >  .../recipes-ti/tidl-api/tidl-examples_git.bb       | 30 ++++++------
> >  4 files changed, 77 insertions(+), 15 deletions(-)
> >  create mode 100644 meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
> >
> >diff --git a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
> >index 5e3de4ef..30a4739e 100644
> >--- a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
> >+++ b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
> >@@ -329,6 +329,10 @@ SRCIPK_INSTALL_DIR_pn-opencl-examples = "example-applications/${PN}-${PV}"
> >  CREATE_SRCIPK_pn-openmpacc-examples = "1"
> >  SRCIPK_INSTALL_DIR_pn-openmpacc-examples = "example-applications/${PN}-${PV}"
> >+CREATE_SRCIPK_pn-tidl-examples = "1"
> >+SRCIPK_INSTALL_DIR_pn-tidl-examples = "example-applications/${PN}-${PV}"
> >+SRCIPK_SRC_DIR_pn-tidl-examples = "${S}/examples"
> >+
> >  CREATE_SRCIPK_pn-qt-opencv-opencl-opengl-multithreaded = "1"
> >  SRCIPK_INSTALL_DIR_pn-qt-opencv-opencl-opengl-multithreaded = "example-applications/${PN}-${PV}"
> >diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc b/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
> >index d266611c..d2b570d1 100644
> >--- a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
> >+++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
> >@@ -1,4 +1,4 @@
> >-PV = "1.0.0.0"
> >+PV = "1.0.0.2"
> >  INC_PR = "r0"
> >  LIC_FILES_CHKSUM = "file://tidl_api_manifest.html;md5=ae816cc40db02fe06193212437ad00e8"
> >@@ -8,4 +8,4 @@ GIT_PROTOCOL = "git"
> >  BRANCH = "master"
> >  SRC_URI = "${GIT_URI};protocol=${GIT_PROTOCOL};branch=${BRANCH}"
> >-SRCREV = "d6326ad29c9ed4b79ebf3e0f588f247ed2cf3d2e"
> >+SRCREV = "8bad8d86fd89fd8c482aa10ab89f3049337a9ca2"
> >diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb b/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
> >new file mode 100644
> >index 00000000..9c41ef11
> >--- /dev/null
> >+++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
> >@@ -0,0 +1,54 @@
> >+SUMMARY = "TIDL API"
> >+DESCRIPTION = "TIDL API header and library. Refer TIDL API User's Guide for details."
> >+HOMEPAGE = "http://software-dl.ti.com/mctools/docs/tidl-api/intro.html"
> >+LICENSE = "BSD"
> >+
> >+include tidl-api.inc
> >+require recipes-ti/includes/ti-paths.inc
> >+
> >+PR = "${INC_PR}.0"
> >+
> >+COMPATIBLE_MACHINE = "am57xx-evm|am57xx-hs-evm"
> >+PACKAGE_ARCH = "${MACHINE_ARCH}"
> >+
> >+DEPENDS = "opencv \
> >+           opencl \
> >+           opencl-monitor \
> >+           ti-cgt6x-native \
> >+           clocl-native \
> >+"
> >+
> >+RDEPENDS_${PN} += "opencl-runtime \
> >+                   opencv \
> >+"
> >+
> >+S = "${WORKDIR}/git"
> >+
> >+EXTRA_OEMAKE = " -C ${S}/tidl_api \
> >+                 TARGET_ROOTDIR=${STAGING_DIR_HOST} \
> >+                 TI_OCL_CGT_INSTALL=${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x \
> >+"
> >+
> >+do_compile() {
> >+  oe_runmake
> >+}
> >+
> >+CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
> >+
> >+TIDL_INSTALL_DIR = "${datadir}/ti/tidl"
> >+
> >+do_install() {
> >+    install -d ${D}${TIDL_INSTALL_DIR}
> >+    install -d ${D}${TIDL_INSTALL_DIR}/tidl_api
> >+    install -d ${D}${TIDL_INSTALL_DIR}/viewer
> >+    cp ${CP_ARGS} ${S}/tidl_api/* ${D}${TIDL_INSTALL_DIR}/tidl_api/
> >+    cp ${CP_ARGS} ${S}/viewer/* ${D}${TIDL_INSTALL_DIR}/viewer/
> >+    install ${S}/readme.md ${D}${TIDL_INSTALL_DIR}/
> >+}
> >+
> >+FILES_${PN} += "\
> >+    ${TIDL_INSTALL_DIR} \
> >+"
> >+
> >+
> >+INSANE_SKIP_${PN} = "arch ldflags textrel staticdev"
> >diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb b/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb
> >index be9bb65f..a1f3ea68 100644
> >--- a/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb
> >+++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb
> >@@ -1,5 +1,5 @@
> >-SUMMARY = "TIDL API and examples"
> >-DESCRIPTION = "TIDL API and examples of API usage. Refer TIDL API User's Guide for details."
> >+SUMMARY = "TIDL API examples"
> >+DESCRIPTION = "Examples of TIDL API. Refer TIDL API User's Guide for details."
> >  HOMEPAGE = "http://software-dl.ti.com/mctools/docs/tidl-api/intro.html"
> >  LICENSE = "BSD"
> >@@ -11,9 +11,16 @@ PR = "${INC_PR}.0"
> >  COMPATIBLE_MACHINE = "am57xx-evm|am57xx-hs-evm"
> >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> >-DEPENDS = "opencv opencl opencl-monitor ti-cgt6x-native clocl-native"
> >+DEPENDS = "opencv \
> >+           clocl-native \
> >+           ti-cgt6x-native \
> >+           tidl-api \
> >+"
> >-RDEPENDS_${PN} += " opencl-runtime opencv"
> >+RDEPENDS_${PN} += "tidl-api \
> >+                   opencl-runtime \
> >+                   opencv \
> >+"
> >  S = "${WORKDIR}/git"
> >@@ -28,19 +35,16 @@ do_compile() {
> >  CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
> >+TIDL_INSTALL_DIR = "${datadir}/ti/tidl"
> >+
> >  do_install() {
> >-    install -d ${D}${datadir}/ti/tidl-api
> >-    install -d ${D}${datadir}/ti/tidl-api/examples
> >-    install -d ${D}${datadir}/ti/tidl-api/tidl_api
> >-    install -d ${D}${datadir}/ti/tidl-api/viewer
> >-    cp ${CP_ARGS} ${S}/examples/* ${D}${datadir}/ti/tidl-api/examples/
> >-    cp ${CP_ARGS} ${S}/tidl_api/* ${D}${datadir}/ti/tidl-api/tidl_api/
> >-    cp ${CP_ARGS} ${S}/viewer/* ${D}${datadir}/ti/tidl-api/viewer/
> >-    install ${S}/readme.md ${D}${datadir}/ti/tidl-api/
> >+    install -d ${D}${TIDL_INSTALL_DIR}
> >+    install -d ${D}${TIDL_INSTALL_DIR}/examples
> >+    cp ${CP_ARGS} ${S}/examples/* ${D}${TIDL_INSTALL_DIR}/examples/
> >  }
> >  FILES_${PN} += "\
> >-    ${datadir}/ti/tidl-api \
> >+    ${TIDL_INSTALL_DIR} \
> >  "
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

