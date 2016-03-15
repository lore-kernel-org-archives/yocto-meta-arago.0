Return-Path: <jake@udd0866934>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 08D0F52AB8
	for <meta-arago@arago-project.org>;
	Tue, 15 Mar 2016 19:54:16 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u2FJsGom021039
	for <meta-arago@arago-project.org>; Tue, 15 Mar 2016 14:54:16 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u2FJsG6I015899
	for <meta-arago@arago-project.org>; Tue, 15 Mar 2016 14:54:16 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 15 Mar 2016 14:54:16 -0500
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u2FJsGhE032696;
	Tue, 15 Mar 2016 14:54:16 -0500
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1afv2l-0004Zm-O9; Tue, 15 Mar 2016 15:54:15 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 15 Mar 2016 15:54:06 -0400
Message-ID: <1458071653-17553-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1458071653-17553-1-git-send-email-j-stiffler@ti.com>
References: <1458071653-17553-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Cc: xuj@ti.com
Subject: [PATCH 1/8] libarch: Add version 1.0.0.0
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
X-List-Received-Date: Tue, 15 Mar 2016 19:54:19 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-ti/includes/arago-paths.inc            |  5 ++++
 meta-arago-extras/recipes-ti/libarch/libarch.inc   | 32 ++++++++++++++++++++++
 .../recipes-ti/libarch/libarch_git.bb              | 25 +++++++++++++++++
 3 files changed, 62 insertions(+)
 create mode 100644 meta-arago-extras/recipes-ti/includes/arago-paths.inc
 create mode 100644 meta-arago-extras/recipes-ti/libarch/libarch.inc
 create mode 100644 meta-arago-extras/recipes-ti/libarch/libarch_git.bb

diff --git a/meta-arago-extras/recipes-ti/includes/arago-paths.inc b/meta-arago-extras/recipes-ti/includes/arago-paths.inc
new file mode 100644
index 0000000..ae3f304
--- /dev/null
+++ b/meta-arago-extras/recipes-ti/includes/arago-paths.inc
@@ -0,0 +1,5 @@
+require recipes-ti/includes/ti-paths.inc
+
+export LIBARCH_INSTALL_DIR_RECIPE    = "${installdir}/ti-libarch-tree"
+
+export LIBARCH_INSTALL_DIR    = "${STAGING_DIR_TARGET}${LIBARCH_INSTALL_DIR_RECIPE}"
diff --git a/meta-arago-extras/recipes-ti/libarch/libarch.inc b/meta-arago-extras/recipes-ti/libarch/libarch.inc
new file mode 100644
index 0000000..83e147c
--- /dev/null
+++ b/meta-arago-extras/recipes-ti/libarch/libarch.inc
@@ -0,0 +1,32 @@
+HOMEPAGE = "https://git.ti.com/library-architecture/libarch"
+LICENSE = "BSD-3-Clause"
+
+PV = "1_0_0_0"
+INC_PR = "r0"
+
+require recipes-ti/includes/arago-paths.inc
+require recipes-ti/includes/ti-staging.inc
+
+BRANCH = "master"
+LIC_FILES_CHKSUM = "file://docs/LibArch_1.0.0_manifest.html;md5=bb48cacb8827ec8d8e5a94c4f2425ee3"
+SRC_URI = "git://git.ti.com/library-architecture/libarch.git;protocol=git;branch=${BRANCH}"
+SRCREV = "c4bc65775bdb6bd8574e43d3cb7148c6bbdc8de6"
+
+COMPATIBLE_MACHINE = "k2hk-evm|am57xx"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+S = "${WORKDIR}/git"
+
+DEPENDS = "common-csl-ip-rtos ti-xdctools ti-sysbios ti-cgt6x-native ti-xdais ti-framework-components opencl opencl-monitor"
+
+export CGTROOT = "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
+export TI_OCL_CGT_INSTALL = "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
+export TI_OCL_INSTALL_DIR = "${STAGING_DIR_TARGET}/usr/share/ti/opencl"
+export XDC_DIR = "${XDC_INSTALL_DIR}"
+export BIOS_DIR= "${SYSBIOS_INSTALL_DIR}"
+export XDAIS_DIR = "${XDAIS_INSTALL_DIR}"
+export FC_DIR = "${FC_INSTALL_DIR}"
+export PDK_DIR = "${PDK_INSTALL_DIR}"
+
+TARGET_am57xx-evm = "SOC_AM572x"
+TARGET_k2hk-evm   = "SOC_K2H"
diff --git a/meta-arago-extras/recipes-ti/libarch/libarch_git.bb b/meta-arago-extras/recipes-ti/libarch/libarch_git.bb
new file mode 100644
index 0000000..18c998a
--- /dev/null
+++ b/meta-arago-extras/recipes-ti/libarch/libarch_git.bb
@@ -0,0 +1,25 @@
+DESCRIPTION = "TI Library Architecture"
+
+include libarch.inc
+
+PR = "${INC_PR}.0"
+
+do_compile() {
+    make lib TARGET=${TARGET} LIBOS=LIB_OPENCL
+    make docs
+
+    # Delete .obj files before installing
+    rm src/*.obj
+}
+
+do_install() {
+    install -d ${D}${LIBARCH_INSTALL_DIR_RECIPE}
+    cp -r docs lib include src ${D}${LIBARCH_INSTALL_DIR_RECIPE}
+    cp Makefile ${D}${LIBARCH_INSTALL_DIR_RECIPE}
+}
+
+FILES_${PN}-dev += "${LIBARCH_INSTALL_DIR_RECIPE}"
+
+# skip checking binary against ARM architecture
+INSANE_SKIP_${PN}-dev = "arch"
+ALLOW_EMPTY_${PN} = "1"
-- 
1.9.1


