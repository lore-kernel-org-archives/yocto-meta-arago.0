Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 4AAE452987
	for <meta-arago@arago-project.org>;
	Tue, 26 Jun 2018 18:59:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5268F20BD9;
	Tue, 26 Jun 2018 18:59:19 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id bg_MEE3qIaxs; Tue, 26 Jun 2018 18:59:19 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3622520174;
	Tue, 26 Jun 2018 18:59:18 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id A600A1634C4;
	Tue, 26 Jun 2018 14:59:17 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Tue, 26 Jun 2018 14:59:17 -0400
Message-Id: <1530039557-5348-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [rocko/master][PATCH] optee-os: also install and deploy ELF version
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
X-List-Received-Date: Tue, 26 Jun 2018 18:59:25 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-security/optee/optee-os_git.bbappend | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
index c85f413..cf643b0 100644
--- a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
+++ b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
@@ -58,6 +58,7 @@ do_compile_aarch64() {
     oe_runmake all PLATFORM=${OPTEEMACHINE} PLATFORM_FLAVOR=${OPTEEFLAVOR}
     ( cd out/arm-plat-${OPTEEOUTPUTMACHINE}/core/; \
         mv tee-pager.bin bl32.bin; \
+        mv tee.elf bl32.elf; \
     )
 }
 
@@ -66,6 +67,7 @@ do_install() {
     install -d ${D}/boot
     install -m 644 ${B}/out/arm-plat-${OPTEEOUTPUTMACHINE}/core/*.optee ${D}/boot || true
     install -m 644 ${B}/out/arm-plat-${OPTEEOUTPUTMACHINE}/core/bl32.bin ${D}/boot || true
+    install -m 644 ${B}/out/arm-plat-${OPTEEOUTPUTMACHINE}/core/bl32.elf ${D}/boot || true
 
     #install TA devkit
     install -d ${D}/usr/include/optee/export-user_ta/
@@ -78,6 +80,7 @@ do_deploy() {
     install -d ${DEPLOYDIR}
     install -m 644 ${B}/out/arm-plat-${OPTEEOUTPUTMACHINE}/core/*.optee ${DEPLOYDIR} || true
     install -m 644 ${B}/out/arm-plat-${OPTEEOUTPUTMACHINE}/core/bl32.bin ${DEPLOYDIR} || true
+    install -m 644 ${B}/out/arm-plat-${OPTEEOUTPUTMACHINE}/core/bl32.elf ${DEPLOYDIR} || true
 }
 
 FILES_${PN} = "/boot"
-- 
2.7.4


