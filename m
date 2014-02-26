Return-Path: <sam.nelson@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 8C6CF52A79
	for <meta-arago@arago-project.org>;
	Wed, 26 Feb 2014 16:47:15 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s1QGlEKD028239
	for <meta-arago@arago-project.org>; Wed, 26 Feb 2014 10:47:14 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1QGlErB013475
	for <meta-arago@arago-project.org>; Wed, 26 Feb 2014 10:47:14 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 26 Feb 2014 10:47:14 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s1QGlEsg023866;	Wed, 26 Feb 2014 10:47:14 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 26 Feb 2014 11:47:12 -0500
Message-ID: <1393433232-24478-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] ti-edma3: Add recipes for EDMA3 user space low level driver
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
X-List-Received-Date: Wed, 26 Feb 2014 16:47:15 -0000
Content-Type: text/plain

- Low level user space driver and test code for TI EDMA3

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 .../recipes-bsp/ti-edma3/ti-edma3-bin_git.bb       |   28 ++++++++++++
 .../recipes-bsp/ti-edma3/ti-edma3-lib_git.bb       |   45 ++++++++++++++++++++
 .../recipes-bsp/ti-edma3/ti-edma3.inc              |    5 +++
 3 files changed, 78 insertions(+)
 create mode 100755 meta-arago-extras/recipes-bsp/ti-edma3/ti-edma3-bin_git.bb
 create mode 100755 meta-arago-extras/recipes-bsp/ti-edma3/ti-edma3-lib_git.bb
 create mode 100644 meta-arago-extras/recipes-bsp/ti-edma3/ti-edma3.inc

diff --git a/meta-arago-extras/recipes-bsp/ti-edma3/ti-edma3-bin_git.bb b/meta-arago-extras/recipes-bsp/ti-edma3/ti-edma3-bin_git.bb
new file mode 100755
index 0000000..f61b8cc
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/ti-edma3/ti-edma3-bin_git.bb
@@ -0,0 +1,28 @@
+DESCRIPTION = "TI EDMA3 low level driver test code"
+LICENSE = "TI BSD"
+
+COMPATIBLE_MACHINE = "keystone-evm"
+
+PR = "r0"
+DEPENDS="ti-csl"
+
+include ti-edma3.inc
+
+S = "${WORKDIR}/git"
+
+do_compile () {
+	cd ${S}/packages
+	ROOTDIR=${S} CROSSCC="${TARGET_PREFIX}gcc" CROSSAR="${TARGET_PREFIX}ar" INTERNAL_SW_ROOT=${S} make PLATFORM=tci6636k2h-evm TARGET=a15 TOOLCHAIN_a15=GCC FORMAT=ELF
+	ROOTDIR=${S} CROSSCC="${TARGET_PREFIX}gcc" CROSSAR="${TARGET_PREFIX}ar" INTERNAL_SW_ROOT=${S} make PLATFORM=tci6638k2k-evm TARGET=a15 TOOLCHAIN_a15=GCC FORMAT=ELF
+	ROOTDIR=${S} CROSSCC="${TARGET_PREFIX}gcc" CROSSAR="${TARGET_PREFIX}ar" INTERNAL_SW_ROOT=${S} make PLATFORM=tci6630k2l-evm TARGET=a15 TOOLCHAIN_a15=GCC FORMAT=ELF
+	ROOTDIR=${S} CROSSCC="${TARGET_PREFIX}gcc" CROSSAR="${TARGET_PREFIX}ar" INTERNAL_SW_ROOT=${S} make PLATFORM=c66ak2e-evm TARGET=a15 TOOLCHAIN_a15=GCC FORMAT=ELF
+}
+
+do_install () {
+	install -d ${D}/${bindir}
+	install -c -m 755 ${S}/examples/edma3_user_space_driver/evmTCI6636K2H/bin/tci6636k2h-evm/edma3_drv_6636k2h_a15_sample_a15host_release.xa15fg ${D}/${bindir}/edma3_drv_6636k2h_a15_sample_a15host_release.xa15fg
+	install -c -m 755 ${S}/examples/edma3_user_space_driver/evmTCI6638K2K/bin/tci6638k2k-evm/edma3_drv_6638k2k_a15_sample_a15host_release.xa15fg ${D}/${bindir}/edma3_drv_6638k2k_a15_sample_a15host_release.xa15fg
+	install -c -m 755 ${S}/examples/edma3_user_space_driver/evmTCI6630K2L/bin/tci6630k2l-evm/edma3_drv_6630k2l_a15_sample_a15host_release.xa15fg ${D}/${bindir}/edma3_drv_6630k2l_a15_sample_a15host_release.xa15fg
+	install -c -m 755 ${S}/examples/edma3_user_space_driver/evmC66AK2E/bin/c66ak2e-evm/edma3_drv_c66ak2e_a15_sample_a15host_release.xa15fg ${D}/${bindir}/edma3_drv_c66ak2e_a15_sample_a15host_release.xa15fg
+}
+
diff --git a/meta-arago-extras/recipes-bsp/ti-edma3/ti-edma3-lib_git.bb b/meta-arago-extras/recipes-bsp/ti-edma3/ti-edma3-lib_git.bb
new file mode 100755
index 0000000..8da7e38
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/ti-edma3/ti-edma3-lib_git.bb
@@ -0,0 +1,45 @@
+DESCRIPTION = "TI EDMA3 low level driver"
+LICENSE = "TI BSD"
+
+COMPATIBLE_MACHINE = "keystone"
+
+PR = "r0"
+DEPENDS="ti-csl"
+
+include ti-edma3.inc
+
+S = "${WORKDIR}/git"
+
+do_compile () {
+	cd ${S}/packages
+	ROOTDIR=${S} CROSSCC="${TARGET_PREFIX}gcc" CROSSAR="${TARGET_PREFIX}ar" CROSSLNK="${TARGET_PREFIX}gcc" INTERNAL_SW_ROOT=${S} make PLATFORM=tci6636k2h-evm TARGET=a15 TOOLCHAIN_a15=GCC FORMAT=ELF SONAME=libedma3.so libs
+	ROOTDIR=${S} CROSSCC="${TARGET_PREFIX}gcc" CROSSAR="${TARGET_PREFIX}ar" CROSSLNK="${TARGET_PREFIX}gcc" INTERNAL_SW_ROOT=${S} make PLATFORM=tci6638k2k-evm TARGET=a15 TOOLCHAIN_a15=GCC FORMAT=ELF SONAME=libedma3.so libs
+	ROOTDIR=${S} CROSSCC="${TARGET_PREFIX}gcc" CROSSAR="${TARGET_PREFIX}ar" CROSSLNK="${TARGET_PREFIX}gcc" INTERNAL_SW_ROOT=${S} make PLATFORM=tci6630k2l-evm TARGET=a15 TOOLCHAIN_a15=GCC FORMAT=ELF SONAME=libedma3.so libs
+	ROOTDIR=${S} CROSSCC="${TARGET_PREFIX}gcc" CROSSAR="${TARGET_PREFIX}ar" CROSSLNK="${TARGET_PREFIX}gcc" INTERNAL_SW_ROOT=${S} make PLATFORM=c66ak2e-evm TARGET=a15 TOOLCHAIN_a15=GCC FORMAT=ELF SONAME=libedma3.so libs
+}
+
+do_install () {
+	install -d ${D}/${libdir}
+
+	# Static Libraries
+	cp ${S}/packages/ti/sdo/edma3/drv/lib/a15/release/edma3_lld_drv.aa15fg ${D}/${libdir}/libedma3.a
+	cp ${S}/packages/ti/sdo/edma3/rm/lib/tci6636k2h-evm/a15/release/edma3_lld_rm.aa15fg ${D}/${libdir}/libedma3rm.a
+
+	# Shared Libraries
+	cp -a ${S}/packages/ti/sdo/edma3/drv/lib/a15/release/libedma* ${D}/${libdir}
+	cp -a ${S}/packages/ti/sdo/edma3/rm/lib/tci6636k2h-evm/a15/release/libedma* ${D}/${libdir}
+
+	# Copy Headers
+	install -d ${D}/${includedir}/ti/sdo/edma3/drv/
+	install -d ${D}/${includedir}/ti/sdo/edma3/rm
+	cp ${S}/packages/ti/sdo/edma3/drv/*.h ${D}/${includedir}/ti/sdo/edma3/drv/
+	cp ${S}/packages/ti/sdo/edma3/rm/*.h ${D}/${includedir}/ti/sdo/edma3/rm/
+
+	# Copy Sample Config
+	install -d ${D}/${includedir}/ti/sdo/edma3/drv/sample/src/platforms
+	cp ${S}/examples/edma3_user_space_driver/evmTCI6636K2H/evmTCI6636K2HSample.c ${D}/${includedir}/ti/sdo/edma3/drv/sample/src/platforms
+	cp ${S}/examples/edma3_user_space_driver/evmTCI6638K2K/evmTCI6638K2KSample.c ${D}/${includedir}/ti/sdo/edma3/drv/sample/src/platforms
+	cp ${S}/examples/edma3_user_space_driver/evmTCI6630K2L/evmTCI6630K2LSample.c ${D}/${includedir}/ti/sdo/edma3/drv/sample/src/platforms
+	cp ${S}/examples/edma3_user_space_driver/evmC66AK2E/evmC66AK2ESample.c ${D}/${includedir}/ti/sdo/edma3/drv/sample/src/platforms
+}
+
diff --git a/meta-arago-extras/recipes-bsp/ti-edma3/ti-edma3.inc b/meta-arago-extras/recipes-bsp/ti-edma3/ti-edma3.inc
new file mode 100644
index 0000000..948e045
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/ti-edma3/ti-edma3.inc
@@ -0,0 +1,5 @@
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=5bdceac872dffdec915b819654ee23ea"
+BRANCH="master"
+SRC_URI = "git://git.ti.com/keystone-rtos/edma3_lld.git"
+# The following commit corresponds to tag DEV_EDMA3_LLD_02_11_11_15_RC01
+SRCREV = "b73a262bf6f6d366e3bf83d0c116be2b61a86dde"
-- 
1.7.9.5


