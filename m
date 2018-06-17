Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id AD05B52A3C
	for <meta-arago@arago-project.org>;
	Sun, 17 Jun 2018 19:37:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2A22F20C14;
	Sun, 17 Jun 2018 19:37:43 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id njMzlzf7c7uU; Sun, 17 Jun 2018 19:37:43 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0C749207AB;
	Sun, 17 Jun 2018 19:37:42 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id B94E51634AC;
	Sun, 17 Jun 2018 15:37:41 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Sun, 17 Jun 2018 15:37:33 -0400
Message-Id: <1529264260-41284-2-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1529264260-41284-1-git-send-email-denys@ti.com>
References: <1529264260-41284-1-git-send-email-denys@ti.com>
Subject: [rocko/master][PATCH 2/9] optee-os: update to 3.1.0 with K3 support and enable ARM64 builds
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
X-List-Received-Date: Sun, 17 Jun 2018 19:37:52 -0000

Install resulting tee-pager.bin as bl32.bin

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-security/optee/optee-os_git.bbappend   | 43 +++++++++++++++++-----
 1 file changed, 34 insertions(+), 9 deletions(-)

diff --git a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
index 8b84ca3..3c33645 100644
--- a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
+++ b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
@@ -1,27 +1,42 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PR_append = ".arago7"
+PR_append = ".arago0"
 
-PV="2.6.0+git${SRCPV}"
+PV = "3.1.0+git${SRCPV}"
 
 is_armv7 = "1"
+is_armv7_aarch64 = "0"
 
 SRC_URI = "git://git.ti.com/optee/ti-optee-os.git;branch=${BRANCH} \
            file://0001-allow-setting-sysroot-for-libgcc-lookup.patch \
 "
-BRANCH = "ti_optee_os"
-SRCREV = "f918b24d27744d682e6f2c7fa91828a7b818b5a0"
+BRANCH = "master"
+SRCREV = "940a24375ba5357d34fea7196dba48eadaee9abd"
 
-EXTRA_OEMAKE = "CROSS_COMPILE_core=${HOST_PREFIX}  \
-                CROSS_COMPILE_ta_arm32=${HOST_PREFIX}  \
+EXTRA_OEMAKE = "CROSS_COMPILE_core=${HOST_PREFIX} \
+                CROSS_COMPILE_ta_arm32=${HOST_PREFIX} \
+                NOWERROR=1 \
                 ta-targets=ta_arm32 \
                 LIBGCC_LOCATE_CFLAGS=--sysroot=${STAGING_DIR_HOST} \
                 CFG_TEE_TA_LOG_LEVEL=0 \
                 CFG_TEE_CORE_LOG_LEVEL=2 \
 "
 
+EXTRA_OEMAKE_append_aarch64 = " \
+                CFG_ARM64_core=y \
+                CROSS_COMPILE_ta_arm64=${HOST_PREFIX} \
+                ta-targets=ta_arm64 \
+"
+
+CFLAGS[unexport] = "1"
+LDFLAGS[unexport] = "1"
+CPPFLAGS[unexport] = "1"
+AS[unexport] = "1"
+LD[unexport] = "1"
+
+do_configure[noexec] = "1"
+
 do_compile() {
-    unset LDFLAGS
     export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
     oe_runmake all PLATFORM=${OPTEEMACHINE} PLATFORM_FLAVOR=${OPTEEFLAVOR}
     ( cd out/arm-plat-${OPTEEOUTPUTMACHINE}/core/; \
@@ -41,10 +56,18 @@ do_compile() {
     fi
 }
 
+do_compile_aarch64() {
+    oe_runmake all PLATFORM=${OPTEEMACHINE} PLATFORM_FLAVOR=${OPTEEFLAVOR}
+    ( cd out/arm-plat-${OPTEEOUTPUTMACHINE}/core/; \
+        mv tee-pager.bin bl32.bin; \
+    )
+}
+
 do_install() {
     #install core on boot directory
     install -d ${D}/boot
-    install -m 644 ${B}/out/arm-plat-${OPTEEOUTPUTMACHINE}/core/*.optee ${D}/boot
+    install -m 644 ${B}/out/arm-plat-${OPTEEOUTPUTMACHINE}/core/*.optee ${D}/boot || true
+    install -m 644 ${B}/out/arm-plat-${OPTEEOUTPUTMACHINE}/core/bl32.bin ${D}/boot || true
 
     #install TA devkit
     install -d ${D}/usr/include/optee/export-user_ta/
@@ -55,7 +78,9 @@ do_install() {
 
 do_deploy() {
     install -d ${DEPLOYDIR}
-    install -m 644 ${B}/out/arm-plat-${OPTEEOUTPUTMACHINE}/core/*.optee ${DEPLOYDIR}
+    install -m 644 ${B}/out/arm-plat-${OPTEEOUTPUTMACHINE}/core/*.optee ${DEPLOYDIR} || true
+    install -m 644 ${B}/out/arm-plat-${OPTEEOUTPUTMACHINE}/core/bl32.bin ${DEPLOYDIR} || true
 }
 
 FILES_${PN} = "/boot"
+SYSROOT_DIRS += "/boot"
-- 
2.7.4


