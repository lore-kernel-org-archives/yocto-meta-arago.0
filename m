Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id B805D52A74
	for <meta-arago@arago-project.org>;
	Sun, 12 May 2013 23:34:13 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r4CNYC54011685
	for <meta-arago@arago-project.org>; Sun, 12 May 2013 18:34:12 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r4CNYCeE005781
	for <meta-arago@arago-project.org>; Sun, 12 May 2013 18:34:12 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Sun, 12 May 2013 18:34:12 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id r4CNY9dN028905;
	Sun, 12 May 2013 18:34:11 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Sun, 12 May 2013 18:33:55 -0500
Message-ID: <1368401635-6784-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH v3] meta-arago conf files: Use updated recipe names
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
X-List-Received-Date: Sun, 12 May 2013 23:34:14 -0000
Content-Type: text/plain

* Recipes have been moved to meta-ti and are using an updated naming scheme.
* Mimic the name changes.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
Changes since version 1 and version 2:
Moving update to u-boot and graphic's sdk versions into its own patch.

 .../conf/distro/arago-source-ipk.conf              |    6 +++---
 .../conf/distro/include/branding-amsdk.inc         |    4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago-source-ipk.conf b/meta-arago-distro/conf/distro/arago-source-ipk.conf
index f9bb5b7..912ec36 100644
--- a/meta-arago-distro/conf/distro/arago-source-ipk.conf
+++ b/meta-arago-distro/conf/distro/arago-source-ipk.conf
@@ -147,9 +147,9 @@ CREATE_SRCIPK_pn-linux-omap-psp = "1"
 SRCIPK_INSTALL_DIR_pn-linux-omap-psp = "board-support/linux-${KVER}-psp${PSPREL}"
 SRCIPK_PACKAGE_ARCH_pn-linux-omap-psp = "${MACHINE_ARCH}"
 
-CREATE_SRCIPK_pn-linux-am335x = "1"
-SRCIPK_INSTALL_DIR_pn-linux-am335x = "board-support/linux-${KVER}"
-SRCIPK_PACKAGE_ARCH_pn-linux-am335x = "${MACHINE_ARCH}"
+CREATE_SRCIPK_pn-linux-am335x-psp = "1"
+SRCIPK_INSTALL_DIR_pn-linux-am335x-psp = "board-support/linux-${KVER}"
+SRCIPK_PACKAGE_ARCH_pn-linux-am335x-psp = "${MACHINE_ARCH}"
 
 CREATE_SRCIPK_pn-linux-omap = "1"
 SRCIPK_INSTALL_DIR_pn-linux-omap = "board-support/linux-${PV}-${PR}"
diff --git a/meta-arago-distro/conf/distro/include/branding-amsdk.inc b/meta-arago-distro/conf/distro/include/branding-amsdk.inc
index dc3f448..bceea98 100644
--- a/meta-arago-distro/conf/distro/include/branding-amsdk.inc
+++ b/meta-arago-distro/conf/distro/include/branding-amsdk.inc
@@ -1,8 +1,8 @@
 # AM-SDK branding configuration
 
 # Use the SDK supported kernel and kernel version
-PREFERRED_PROVIDER_virtual/kernel_am335x-evm = "linux-am335x"
-PREFERRED_VERSION_linux-am335x = "3.2.0-psp05.06.00.00"
+PREFERRED_PROVIDER_virtual/kernel_am335x-evm = "linux-am335x-psp"
+PREFERRED_VERSION_linux-am335x-psp = "3.2"
 PREFERRED_PROVIDER_ltp-ddt_am335x-evm = "ltp-ddt-legacy"
 PREFERRED_PROVIDER_virtual/bootloader_am335x-evm = "u-boot-am33x"
 PREFERRED_PROVIDER_u-boot_am335x-evm = "u-boot-am33x"
-- 
1.7.0.4


