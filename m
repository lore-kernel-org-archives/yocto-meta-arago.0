Return-Path: <jake@udd0866934>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id DF99552AA7
	for <meta-arago@arago-project.org>;
	Tue, 15 Mar 2016 19:54:16 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u2FJsGNc027480
	for <meta-arago@arago-project.org>; Tue, 15 Mar 2016 14:54:16 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u2FJsGT7025377
	for <meta-arago@arago-project.org>; Tue, 15 Mar 2016 14:54:16 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 15 Mar 2016 14:54:16 -0500
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u2FJsGSD016532;
	Tue, 15 Mar 2016 14:54:16 -0500
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1afv2m-0004Zy-6m; Tue, 15 Mar 2016 15:54:16 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 15 Mar 2016 15:54:09 -0400
Message-ID: <1458071653-17553-5-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1458071653-17553-1-git-send-email-j-stiffler@ti.com>
References: <1458071653-17553-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Cc: xuj@ti.com
Subject: [PATCH 4/8] linalg: Add Linear Algebra Library version 1.2.0.0
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
X-List-Received-Date: Tue, 15 Mar 2016 19:54:18 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-ti/includes/arago-paths.inc            |  2 +
 meta-arago-extras/recipes-ti/linalg/linalg.inc     | 43 ++++++++++++++++++++++
 meta-arago-extras/recipes-ti/linalg/linalg_git.bb  | 23 ++++++++++++
 3 files changed, 68 insertions(+)
 create mode 100644 meta-arago-extras/recipes-ti/linalg/linalg.inc
 create mode 100644 meta-arago-extras/recipes-ti/linalg/linalg_git.bb

diff --git a/meta-arago-extras/recipes-ti/includes/arago-paths.inc b/meta-arago-extras/recipes-ti/includes/arago-paths.inc
index ae3f304..6867406 100644
--- a/meta-arago-extras/recipes-ti/includes/arago-paths.inc
+++ b/meta-arago-extras/recipes-ti/includes/arago-paths.inc
@@ -1,5 +1,7 @@
 require recipes-ti/includes/ti-paths.inc
 
 export LIBARCH_INSTALL_DIR_RECIPE    = "${installdir}/ti-libarch-tree"
+export LINALG_INSTALL_DIR_RECIPE     = "${installdir}/ti-linalg-tree"
 
 export LIBARCH_INSTALL_DIR    = "${STAGING_DIR_TARGET}${LIBARCH_INSTALL_DIR_RECIPE}"
+export LINALG_INSTALL_DIR     = "${STAGING_DIR_TARGET}${LINALG_INSTALL_DIR_RECIPE}"
diff --git a/meta-arago-extras/recipes-ti/linalg/linalg.inc b/meta-arago-extras/recipes-ti/linalg/linalg.inc
new file mode 100644
index 0000000..7c197b6
--- /dev/null
+++ b/meta-arago-extras/recipes-ti/linalg/linalg.inc
@@ -0,0 +1,43 @@
+HOMEPAGE = "git://git.ti.com/dense-linear-algebra-libraries/linalg.git"
+LICENSE = "BSD-3-Clause"
+
+PV = "1_2_0_0"
+INC_PR = "r0"
+
+S = "${WORKDIR}/git"
+
+require recipes-ti/includes/arago-paths.inc
+require recipes-ti/includes/ti-staging.inc
+
+BRANCH = "master"
+SRC_URI = "git://git.ti.com/dense-linear-algebra-libraries/linalg.git;protocol=git;branch=${BRANCH}"
+LIC_FILES_CHKSUM = "file://docs/LINALG_1.2.0_manifest.html;md5=f30895e41e5947c3439b1ad4cf4c8555"
+SRCREV = "4de29dac3c6fbd16df1b19876593de0afdbcb30f"
+
+DEPENDS = "common-csl-ip \
+           libarch \
+           ti-xdctools \
+           ti-ipc-rtos \
+           ti-sysbios \
+           ti-cgt6x-native \
+           ti-xdais \
+           ti-framework-components \
+           libulm \
+           openmp-rtos \
+           opencl \
+           clocl-native \
+"
+
+export TI_OCL_INSTALL_DIR = "${STAGING_DIR_TARGET}/usr/share/ti/opencl"
+export CGTROOT = "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
+export TI_OCL_CGT_INSTALL = "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
+export XDC_DIR = "${XDC_INSTALL_DIR}"
+export BIOS_DIR= "${SYSBIOS_INSTALL_DIR}"
+export XDAIS_DIR = "${XDAIS_INSTALL_DIR}"
+export FC_DIR = "${FC_INSTALL_DIR}"
+export PDK_DIR = "${PDK_INSTALL_DIR}"
+export OMP_DIR ="${OMP_INSTALL_DIR}"
+export LIBARCH_DIR = "${LIBARCH_INSTALL_DIR}"
+export TARGET_ROOTDIR="${STAGING_DIR_TARGET}"
+
+COMPATIBLE_MACHINE = "k2hk-evm"
diff --git a/meta-arago-extras/recipes-ti/linalg/linalg_git.bb b/meta-arago-extras/recipes-ti/linalg/linalg_git.bb
new file mode 100644
index 0000000..4d7a5a4
--- /dev/null
+++ b/meta-arago-extras/recipes-ti/linalg/linalg_git.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "TI Linear Algebra Library"
+
+include linalg.inc
+PR = "${INC_PR}.0"
+
+TARGET_k2hk-evm = "SOC_K2H"
+MEM_MODEL_k2hk-evm = "Large"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+do_compile() {
+   make ARMplusDSP MEM_MODEL=${MEM_MODEL} TARGET=${TARGET} LIBOS=LIB_OPENCL
+   make docs
+}
+
+do_install() {
+   make installARMplusDSPlib DESTDIR=${D}${LINALG_INSTALL_DIR_RECIPE}
+}
+
+# to create a package for LINALG
+FILES_${PN}-dev += "${LINALG_INSTALL_DIR_RECIPE}"
+
+INSANE_SKIP_${PN}-dev = "arch staticdev"
+ALLOW_EMPTY_${PN} = "1"
-- 
1.9.1


