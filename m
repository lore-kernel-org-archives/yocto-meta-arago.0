Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 0B929529F7
	for <meta-arago@arago-project.org>;
	Sat,  8 Feb 2020 00:06:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id ACC0940B37;
	Sat,  8 Feb 2020 00:04:56 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id nv-AHzJKCeB2; Sat,  8 Feb 2020 00:04:56 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7702740C21;
	Sat,  8 Feb 2020 00:04:54 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 59FA21743E6;
	Fri,  7 Feb 2020 19:04:53 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri,  7 Feb 2020 19:04:52 -0500
Message-Id: <1581120292-47024-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1581120292-47024-1-git-send-email-denis@denix.org>
References: <1581120292-47024-1-git-send-email-denis@denix.org>
Subject: [zeus/master][PATCH 3/3] optee-os: update to 3.8.0
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
X-List-Received-Date: Sat, 08 Feb 2020 00:06:51 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Cc: Andrew F. Davis <afd@ti.com>
---
 .../recipes-security/optee/optee-os_git.bbappend             | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
index f8b329c..88af965 100644
--- a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
+++ b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
@@ -2,13 +2,11 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=c1f21c4f72f372ef38a5a4aee55ec173"
 
-inherit python3native
-
-DEPENDS += "python3-pyelftools-native python3-pycrypto-native"
+DEPENDS += "python3-pycryptodomex-native"
 
 PR_append = ".arago0"
 
-PV = "3.7.0+git${SRCPV}"
+PV = "3.8.0+git${SRCPV}"
 
 is_armv7 = "1"
 is_armv7_aarch64 = "0"
@@ -17,7 +15,7 @@ SRC_URI = "git://git.ti.com/optee/ti-optee-os.git;branch=${BRANCH} \
            file://0001-allow-setting-sysroot-for-libgcc-lookup.patch \
 "
 BRANCH = "ti-optee-os"
-SRCREV = "5208e5c1f3743fcde71e150eada2fc9945f749df"
+SRCREV = "199fca17b575d4c748c9c435e908a6ec9618c75a"
 
 ARMCORE = "CFG_ARM32_core=y ta-targets=ta_arm32"
 ARMCORE_aarch64 = "CFG_ARM64_core=y ta-targets=ta_arm64"
@@ -64,7 +62,7 @@ do_compile() {
 do_compile_aarch64() {
     oe_runmake all PLATFORM=${OPTEEMACHINE} PLATFORM_FLAVOR=${OPTEEFLAVOR}
     ( cd out/arm-plat-${OPTEEOUTPUTMACHINE}/core/; \
-        cp tee-pager.bin ${B}/bl32.bin; \
+        cp tee-pager_v2.bin ${B}/bl32.bin; \
         cp tee.elf ${B}/bl32.elf; \
     )
 }
@@ -73,7 +71,7 @@ do_compile_am65xx-hs-evm() {
     export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
     oe_runmake all PLATFORM=${OPTEEMACHINE} PLATFORM_FLAVOR=${OPTEEFLAVOR}
     ( cd out/arm-plat-${OPTEEOUTPUTMACHINE}/core/; \
-        ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh tee-pager.bin tee-pager.bin.signed; \
+        ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh tee-pager_v2.bin tee-pager.bin.signed; \
         mv tee-pager.bin.signed ${B}/bl32.bin; \
         cp tee.elf ${B}/bl32.elf; \
     )
-- 
2.7.4


