Return-Path: <j-stiffler@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 7C29352A4A
	for <meta-arago@arago-project.org>;
	Wed, 15 Mar 2017 18:03:02 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2FI32CE011716
	for <meta-arago@arago-project.org>; Wed, 15 Mar 2017 13:03:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1489600982;
	bh=5pVi07UK6HWjCFGfdZCakz1vRVa6j/zkxsA6B48WXc8=;
	h=From:To:CC:Subject:Date;
	b=PDPBcJwiJf8cehpN4o7rcIIT/DMfl17wVAEn3xRLuFUmX/vg4Z4u7Ycl0hsduBrIh
	nynxRv/URxNtBVwHSK21xUh4t7l0lJable/Z6i27idSn/yIfGSFmtYT5q87xCfEDh+
	reIOUnEK9S+Uz/auXr9ZnjLd0zLLBBdZCXnSQwzY=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2FI31in031437
	for <meta-arago@arago-project.org>; Wed, 15 Mar 2017 13:03:02 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 15 Mar 2017 13:03:01 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v2FI31l0004088;	Wed, 15 Mar 2017 13:03:01 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 15 Mar 2017 14:00:44 -0400
Message-ID: <1489600845-27595-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [krogoth][PATCH 1/2] ocl: update to version 1.1.12.0
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
X-List-Received-Date: Wed, 15 Mar 2017 18:03:02 -0000
Content-Type: text/plain

* opencl : add systemd service for MCT daemon
* monitor : sources unified between platforms
* examples : add new examples

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-extras/recipes-ti/ocl/ocl.inc                |  4 ++--
 meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb |  2 ++
 meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb  |  2 --
 meta-arago-extras/recipes-ti/ocl/opencl_git.bb          | 12 +++++++++++-
 4 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/meta-arago-extras/recipes-ti/ocl/ocl.inc b/meta-arago-extras/recipes-ti/ocl/ocl.inc
index 38f08b9..94e3dd8 100644
--- a/meta-arago-extras/recipes-ti/ocl/ocl.inc
+++ b/meta-arago-extras/recipes-ti/ocl/ocl.inc
@@ -1,4 +1,4 @@
-PV = "1.1.11.2"
+PV = "1.1.12.0"
 INC_PR = "r0"
 
 LIC_FILES_CHKSUM = "file://../debian/copyright;md5=2e3965a73a8a49c23836467266120dff"
@@ -9,7 +9,7 @@ OCL_GIT_URI = "git://git.ti.com/opencl/ti-opencl.git"
 OCL_GIT_PROTOCOL = "git"
 OCL_GIT_BRANCH = "master"
 
-OCL_SRCREV = "5a8f16bb1809a410b961292ae070d079b89e749a"
+OCL_SRCREV = "8c0ec9c270cafaef0a56c376fc28c1b7714cb09c"
 
 BRANCH = "${OCL_GIT_BRANCH}"
 SRC_URI = "${OCL_GIT_URI};protocol=${OCL_GIT_PROTOCOL};branch=${BRANCH}"
diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
index 2a4b714..f01d5e1 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
@@ -35,6 +35,8 @@ OCL_EXAMPLE_LIST = " buffer \
                      vecadd_openmp \
                      vecadd_openmp_t \
                      dgemm \
+                     abort_exit \
+                     timeout \
 "
 
 python do_unpack_append() {
diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
index 8fc1e81..c0a8a6c 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
@@ -45,8 +45,6 @@ COMPATIBLE_MACHINE = "dra7xx|keystone"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 S = "${WORKDIR}/git/monitor"
-S_dra7xx = "${WORKDIR}/git/monitor_vayu"
-S_k2g = "${WORKDIR}/git/monitor_vayu"
 
 BUILD_TARGET_k2hk-evm = "ARM_K2H"
 BUILD_TARGET_k2l-evm  = "ARM_K2L"
diff --git a/meta-arago-extras/recipes-ti/ocl/opencl_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
index 9676687..1d39274 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
@@ -6,7 +6,7 @@ include ocl.inc
 
 PR = "${INC_PR}.0"
 
-inherit cmake
+inherit cmake systemd
 
 COMPATIBLE_MACHINE = "dra7xx|keystone"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -58,6 +58,16 @@ EXTRA_OECMAKE += " -DBUILD_TARGET=${OCL_BUILD_TARGET} -DBUILD_OUTPUT=lib -DENABL
 EXTRA_OEMAKE += "KERNEL_INSTALL_DIR=${STAGING_KERNEL_DIR} LINUX_DEVKIT_ROOT=${STAGING_DIR_HOST}"
 export KERNEL_INSTALL_DIR = "${STAGING_KERNEL_DIR}"
 
+MCTD = "${S}/mct-daemon/ti-mct-daemon.service.k2x"
+MCTD_dra7xx = "${S}/mct-daemon/ti-mct-daemon.service.am57x"
+
+do_install_append() {
+    install -d ${D}${systemd_system_unitdir}
+    install -m0644 ${MCTD} ${D}${systemd_system_unitdir}/ti-mct-daemon.service
+}
+
+SYSTEMD_SERVICE_${PN} = "ti-mct-daemon.service"
+
 FILES_${PN} += " \
     ${datadir}/ti/opencl/* \
 "
-- 
2.7.4


