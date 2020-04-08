Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 4536B529E5
	for <meta-arago@arago-project.org>;
	Wed,  8 Apr 2020 19:34:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 02A1F40C1D;
	Wed,  8 Apr 2020 19:32:06 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id u43Rd2t1O-fj; Wed,  8 Apr 2020 19:32:05 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8FEC1409DE;
	Wed,  8 Apr 2020 19:32:04 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 46F62171900;
	Wed,  8 Apr 2020 15:32:04 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed,  8 Apr 2020 15:32:03 -0400
Message-Id: <1586374323-29718-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] optee-os: simplify and cleanup against upstream 3.8.0
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
X-List-Received-Date: Wed, 08 Apr 2020 19:34:20 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-security/optee/optee-os_git.bbappend   | 33 ++--------------------
 1 file changed, 3 insertions(+), 30 deletions(-)

diff --git a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
index da70fe7..2fb3e27 100644
--- a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
+++ b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
@@ -1,41 +1,11 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-DEPENDS += "python3-pycryptodomex-native"
-
 PR_append = ".arago0"
 
-PV = "3.8.0+git${SRCPV}"
-
-is_armv7 = "1"
-is_armv7_aarch64 = "0"
-
 SRC_URI = "git://git.ti.com/optee/ti-optee-os.git;branch=${BRANCH} \
            file://0001-allow-setting-sysroot-for-libgcc-lookup.patch \
 "
 BRANCH = "ti-optee-os"
 SRCREV = "199fca17b575d4c748c9c435e908a6ec9618c75a"
 
-ARMCORE = "CFG_ARM32_core=y ta-targets=ta_arm32"
-ARMCORE_aarch64 = "CFG_ARM64_core=y ta-targets=ta_arm64"
-
-EXTRA_OEMAKE = "CROSS_COMPILE_core=${HOST_PREFIX} \
-                CROSS_COMPILE_ta_arm32=${HOST_PREFIX} \
-                CROSS_COMPILE_ta_arm64=${HOST_PREFIX} \
-                NOWERROR=1 V=1 \
-                LIBGCC_LOCATE_CFLAGS=--sysroot=${STAGING_DIR_HOST} \
-                CFG_TEE_TA_LOG_LEVEL=0 \
-                CFG_TEE_CORE_LOG_LEVEL=2 \
-                ${ARMCORE} \
-"
-
-CFLAGS[unexport] = "1"
-LDFLAGS[unexport] = "1"
-CPPFLAGS[unexport] = "1"
-AS[unexport] = "1"
-LD[unexport] = "1"
-
-do_configure[noexec] = "1"
-
 do_compile() {
     export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
     oe_runmake all PLATFORM=${OPTEEMACHINE} PLATFORM_FLAVOR=${OPTEEFLAVOR}
@@ -98,3 +68,6 @@ do_deploy() {
 
 FILES_${PN} = "/boot"
 SYSROOT_DIRS += "/boot"
+
+# This is needed for bl32.elf
+INSANE_SKIP_${PN} += "textrel"
-- 
2.7.4


