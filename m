Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id E0D0752A43
	for <meta-arago@arago-project.org>;
	Mon, 11 Dec 2017 22:19:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 60A0220ADA;
	Mon, 11 Dec 2017 22:19:44 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id m84NdsKnzeDi; Mon, 11 Dec 2017 22:19:44 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 390072086C;
	Mon, 11 Dec 2017 22:19:43 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 99F34162752;
	Mon, 11 Dec 2017 17:19:42 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Mon, 11 Dec 2017 17:19:41 -0500
Message-Id: <1513030782-22973-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [morty/master][PATCH 1/2] opencl-examples-rtos: move CM and SRCIPK stuff to meta-arago-distro
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
X-List-Received-Date: Mon, 11 Dec 2017 22:19:45 -0000

Breaks parsing of meta-arago-extras when used independently of Arago distro.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../ocl-rtos/opencl-examples-rtos_git.bbappend         | 13 +++++++++++++
 .../recipes-ti/ocl-rtos/opencl-examples-rtos_git.bb    | 18 ++----------------
 2 files changed, 15 insertions(+), 16 deletions(-)
 create mode 100644 meta-arago-distro/recipes-tisdk/ocl-rtos/opencl-examples-rtos_git.bbappend

diff --git a/meta-arago-distro/recipes-tisdk/ocl-rtos/opencl-examples-rtos_git.bbappend b/meta-arago-distro/recipes-tisdk/ocl-rtos/opencl-examples-rtos_git.bbappend
new file mode 100644
index 0000000..831aba0
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/ocl-rtos/opencl-examples-rtos_git.bbappend
@@ -0,0 +1,13 @@
+PR_append = ".arago0"
+
+CM_NAME = "OpenCL"
+CM_VERSION = "${PV}"
+CM_ROOT_DIR = "opencl_rtos_${RELEASE_TARGET}_${@'${PV}'.replace('.', '_')}"
+CM_DESCRIPTION = "OpenCL is a framework for writing programs that execute across heterogeneous systems"
+
+deltask do_create_srcipk
+addtask create_srcipk after do_install before do_package
+
+CREATE_SRCIPK = "1"
+SRCIPK_SRC_DIR = "${DESTDIR}"
+SRCIPK_INSTALL_DIR = "${CM_ROOT_DIR}"
diff --git a/meta-arago-extras/recipes-ti/ocl-rtos/opencl-examples-rtos_git.bb b/meta-arago-extras/recipes-ti/ocl-rtos/opencl-examples-rtos_git.bb
index 531fc2f..8496749 100644
--- a/meta-arago-extras/recipes-ti/ocl-rtos/opencl-examples-rtos_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl-rtos/opencl-examples-rtos_git.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD"
 require recipes-ti/ocl/ocl.inc
 require recipes-ti/includes/arago-paths.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 COMPATIBLE_MACHINE = "omap-a15"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -33,7 +33,7 @@ OCL_EXAMPLE_LIST = " abort_exit \
                      sgemm \
                      edmamgr \
                      vecadd_openmp \
-		     vecadd_openmp_t \
+                     vecadd_openmp_t \
 "
 
 RELEASE_TARGET = ""
@@ -43,7 +43,6 @@ export BIOS_INSTALL_DIR = "${SYSBIOS_INSTALL_DIR}"
 export DESTDIR="${OCL_RTOS_INSTALL_DIR}/ti-opencl-rtos-${RELEASE_TARGET}-${PV}"
 export TI_OCL_INSTALL = "${DESTDIR}/packages/ti/opencl"
 
-
 python do_unpack_append() {
     import shutil
 
@@ -59,7 +58,6 @@ python do_unpack_append() {
         shutil.copytree(os.path.join(git_dir,example), os.path.join(s,example))
 }
 
-
 EXTRA_OEMAKE = "BUILD_OS=SYS_BIOS \
                 TI_OCL_CGT_INSTALL=${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x \
 "
@@ -83,15 +81,3 @@ do_install() {
         cp -rv ${B}/${ocl_example}/* ${DESTDIR}/examples/${ocl_example}
     done
 }
-
-CM_NAME = "OpenCL"
-CM_VERSION = "${PV}"
-CM_ROOT_DIR = "opencl_rtos_${RELEASE_TARGET}_${@'${PV}'.replace('.', '_')}"
-CM_DESCRIPTION = "OpenCL is a framework for writing programs that execute across heterogeneous systems"
-
-deltask do_create_srcipk
-addtask create_srcipk after do_install before do_package
-
-CREATE_SRCIPK = "1"
-SRCIPK_SRC_DIR = "${DESTDIR}"
-SRCIPK_INSTALL_DIR = "${CM_ROOT_DIR}"
-- 
2.7.4


