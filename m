Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id CE6CB52A1A
	for <meta-arago@arago-project.org>;
	Sat,  8 Oct 2016 01:00:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CCFA920995;
	Sat,  8 Oct 2016 01:00:38 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id ubCkcPJcUpyZ; Sat,  8 Oct 2016 01:00:38 +0000 (UTC)
Received: from gandalf.denix.org (pool-100-15-106-107.washdc.fios.verizon.net
	[100.15.106.107])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B4BCE204E0;
	Sat,  8 Oct 2016 01:00:37 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by gandalf.denix.org (Postfix) with ESMTP id 2996816216E;
	Fri,  7 Oct 2016 21:00:37 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri,  7 Oct 2016 21:00:36 -0400
Message-Id: <1475888436-14389-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] u-boot-ti-staging: move HS MLO change to meta-ti
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
X-List-Received-Date: Sat, 08 Oct 2016 01:00:40 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../u-boot/u-boot-ti-staging_2016.05.bbappend        | 20 --------------------
 1 file changed, 20 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2016.05.bbappend

diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2016.05.bbappend b/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2016.05.bbappend
deleted file mode 100644
index 2d13b24..0000000
--- a/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2016.05.bbappend
+++ /dev/null
@@ -1,20 +0,0 @@
-# HS MLO
-UBOOT_HS_MLO_BINARY = "u-boot_HS_MLO"
-UBOOT_HS_MLO_IMAGE = "u-boot_HS_MLO-${MACHINE}-${PV}-${PR}"
-UBOOT_HS_MLO_SYMLINK = "u-boot_HS_MLO-${MACHINE}"
-
-do_install_append () {
-	if [ -f ${S}/${UBOOT_HS_MLO_BINARY} ]; then
-		install ${S}/${UBOOT_HS_MLO_BINARY} ${D}/boot/${UBOOT_HS_MLO_IMAGE}
-		ln -sf ${UBOOT_HS_MLO_IMAGE} ${D}/boot/${UBOOT_HS_MLO_BINARY}
-	fi
-}
-
-do_deploy_append () {
-	if [ -f ${S}/${UBOOT_HS_MLO_BINARY} ]; then
-		install ${S}/${UBOOT_HS_MLO_BINARY} ${DEPLOYDIR}/${UBOOT_HS_MLO_IMAGE}
-		rm -f ${UBOOT_HS_MLO_BINARY} ${UBOOT_HS_MLO_SYMLINK}
-		ln -sf ${UBOOT_HS_MLO_IMAGE} ${UBOOT_HS_MLO_SYMLINK}
-		ln -sf ${UBOOT_HS_MLO_IMAGE} ${UBOOT_HS_MLO_BINARY}
-	fi
-}
-- 
2.7.4


