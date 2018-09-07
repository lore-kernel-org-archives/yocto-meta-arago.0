Return-Path: <yuanzhao@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 6F6BD52982
	for <meta-arago@arago-project.org>;
	Fri,  7 Sep 2018 20:41:20 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w87KfCkM076740
	for <meta-arago@arago-project.org>; Fri, 7 Sep 2018 15:41:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536352872;
	bh=cgSlTyf3n6RCd6AKPtrw4X1mK2BChLy7Lf8sdW2iv2E=;
	h=From:To:CC:Subject:Date;
	b=L84zVsxtzmhwpO3ozQCwYa3is/9j3TkTzMim4VrBwkhOrBPTy6SJWNoT+6yzZxpRM
	sy0BzE+r/0uFMuUh6AY/hGoypIS0pEuo6uLjdk3Md8+cUzrNPUnpMgYM8q69Iff//a
	moajjnX+i34qjVUDsO7j9vk09L+VY9FcOQhlAcfU=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w87KfCqa013456
	for <meta-arago@arago-project.org>; Fri, 7 Sep 2018 15:41:12 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 7 Sep 2018 15:41:11 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 7 Sep 2018 15:41:11 -0500
Received: from sdomc-build0.hou.asp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w87KfB7d003504;
	Fri, 7 Sep 2018 15:41:11 -0500
From: Yuan Zhao <yuanzhao@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 7 Sep 2018 15:41:05 -0500
Message-ID: <20180907204105.84328-1-yuanzhao@ti.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] ocl: update version to 01.01.16.00
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
X-List-Received-Date: Fri, 07 Sep 2018 20:41:21 -0000
Content-Type: text/plain

Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
---
 meta-arago-extras/recipes-ti/ocl/clocl_git.bb              | 2 +-
 meta-arago-extras/recipes-ti/ocl/ocl.inc                   | 4 ++--
 meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb    | 2 +-
 meta-arago-extras/recipes-ti/ocl/opencl-monitor-ipu_git.bb | 2 +-
 meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb     | 2 +-
 meta-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb     | 5 +++--
 meta-arago-extras/recipes-ti/ocl/opencl_git.bb             | 2 +-
 7 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/meta-arago-extras/recipes-ti/ocl/clocl_git.bb b/meta-arago-extras/recipes-ti/ocl/clocl_git.bb
index bf00267b..c7f467f5 100644
--- a/meta-arago-extras/recipes-ti/ocl/clocl_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/clocl_git.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "TI OpenCL offline C compiler for compute devices"
-HOMEPAGE = "http://software-dl.ti.com/mctools/docs/opencl/intro.html"
+HOMEPAGE = "https://downloads.ti.com/mctools/esd/docs/opencl/index.html"
 LICENSE = "BSD"
 
 include ocl.inc
diff --git a/meta-arago-extras/recipes-ti/ocl/ocl.inc b/meta-arago-extras/recipes-ti/ocl/ocl.inc
index ec7af4d4..b4883c26 100644
--- a/meta-arago-extras/recipes-ti/ocl/ocl.inc
+++ b/meta-arago-extras/recipes-ti/ocl/ocl.inc
@@ -1,4 +1,4 @@
-PV = "1.1.15.6"
+PV = "1.1.16.0"
 INC_PR = "r0"
 
 LIC_FILES_CHKSUM = "file://../debian/copyright;md5=2e3965a73a8a49c23836467266120dff"
@@ -9,7 +9,7 @@ OCL_GIT_URI = "git://git.ti.com/opencl/ti-opencl.git"
 OCL_GIT_PROTOCOL = "git"
 OCL_GIT_BRANCH = "master"
 
-OCL_SRCREV = "7f6a93c96e4a4dfd8c1a19078f6a8d0c15d531d5"
+OCL_SRCREV = "3e9d6af770888b3e8f1d693df419c0d5edd70f14"
 
 BRANCH = "${OCL_GIT_BRANCH}"
 SRC_URI = "${OCL_GIT_URI};protocol=${OCL_GIT_PROTOCOL};branch=${BRANCH}"
diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
index f5de598d..cbc35ce5 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
@@ -1,5 +1,5 @@
 SUMMARY = "TI OpenCL example applications"
-HOMEPAGE = "http://software-dl.ti.com/mctools/docs/opencl/intro.html"
+HOMEPAGE = "https://downloads.ti.com/mctools/esd/docs/opencl/index.html"
 LICENSE = "BSD"
 
 include ocl.inc
diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-monitor-ipu_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl-monitor-ipu_git.bb
index 61d5cad0..72855665 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl-monitor-ipu_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl-monitor-ipu_git.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "TI OpenCL M4/IPU device firmware for AM57x"
-HOMEPAGE = "http://software-dl.ti.com/mctools/docs/opencl/intro.html"
+HOMEPAGE = "https://downloads.ti.com/mctools/esd/docs/opencl/index.html"
 LICENSE = "BSD"
 
 include ocl.inc
diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
index b2f9d988..3cc6572b 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "TI OpenCL compute device firmware"
-HOMEPAGE = "http://software-dl.ti.com/mctools/docs/opencl/intro.html"
+HOMEPAGE = "https://downloads.ti.com/mctools/esd/docs/opencl/index.html"
 LICENSE = "BSD"
 
 include ocl.inc
diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb
index 80c7021a..221e0d62 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb
@@ -3,7 +3,7 @@ SUMMARY = "OpenCL TIDL firmware for AM57xx"
 LICENSE = "TI-TFL"
 LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=082a028431c455252c1e1d3d1021d382"
 
-PV = "01.00.00.02"
+PV = "01.01.16.00"
 PR = "r0"
 
 require recipes-ti/includes/arago-paths.inc
@@ -15,7 +15,8 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 GIT_URI      = "git://git.ti.com/opencl/opencl-firmware.git"
 GIT_PROTOCOL = "git"
 BRANCH       = "master"
-SRCREV       = "3b2dca5cb5718db93f7742186839591188c46b25"
+SRCREV       = "185e13d273fbbbbdb007111f87855f43c03535fa"
+
 SRC_URI      = "${GIT_URI};protocol=${GIT_PROTOCOL};branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
diff --git a/meta-arago-extras/recipes-ti/ocl/opencl_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
index 1c0e2e71..1cf2e626 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "TI OpenCL host runtime and development packages"
-HOMEPAGE = "http://software-dl.ti.com/mctools/docs/opencl/intro.html"
+HOMEPAGE = "https://downloads.ti.com/mctools/esd/docs/opencl/index.html"
 LICENSE = "BSD"
 
 include ocl.inc
-- 
2.14.1


