Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 7CE5B52A76
	for <meta-arago@arago-project.org>;
	Wed, 24 Apr 2013 14:06:03 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r3OE62Wb004619
	for <meta-arago@arago-project.org>; Wed, 24 Apr 2013 09:06:02 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r3OE62Ds030578
	for <meta-arago@arago-project.org>; Wed, 24 Apr 2013 09:06:02 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 24 Apr 2013 09:06:02 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id r3OE5xsi000444;
	Wed, 24 Apr 2013 09:06:00 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 24 Apr 2013 09:05:53 -0500
Message-ID: <1366812356-29846-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 1/4] u-boot-am3517: Update u-boot recipe for am3517
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
X-List-Received-Date: Wed, 24 Apr 2013 14:06:04 -0000
Content-Type: text/plain

* Update arago-source-ipk.conf for u-boot-am3517.
* Add bbappend to include variable for am3517
* Update u-boot PREFERRED_PROVIDER to point to correct u-boot recipe.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../conf/distro/arago-source-ipk.conf              |    4 ++++
 .../conf/distro/include/arago-prefs.inc            |    5 ++---
 .../u-boot/u-boot-am3517_2011.09.bbappend          |    5 +++++
 3 files changed, 11 insertions(+), 3 deletions(-)
 create mode 100644 meta-arago-distro/recipes-bsp/u-boot/u-boot-am3517_2011.09.bbappend

diff --git a/meta-arago-distro/conf/distro/arago-source-ipk.conf b/meta-arago-distro/conf/distro/arago-source-ipk.conf
index 025dd9e..f9bb5b7 100644
--- a/meta-arago-distro/conf/distro/arago-source-ipk.conf
+++ b/meta-arago-distro/conf/distro/arago-source-ipk.conf
@@ -131,6 +131,10 @@ CREATE_SRCIPK_pn-u-boot-am33x = "1"
 SRCIPK_INSTALL_DIR_pn-u-boot-am33x = "board-support/u-boot-${UVER}-psp${PSPREL}"
 SRCIPK_PACKAGE_ARCH_pn-u-boot-am33x = "${MACHINE_ARCH}"
 
+CREATE_SRCIPK_pn-u-boot-am3517 = "1"
+SRCIPK_INSTALL_DIR_pn-u-boot-am3517 = "board-support/u-boot-${UVER}-psp${PSPREL}"
+SRCIPK_PACKAGE_ARCH_pn-u-boot-am3517 = "${MACHINE_ARCH}"
+
 CREATE_SRCIPK_pn-linux-ti-staging = "1"
 SRCIPK_INSTALL_DIR_pn-linux-ti-staging = "board-support/linux-${PV}"
 SRCIPK_PACKAGE_ARCH_pn-linux-ti-staging = "${MACHINE_ARCH}"
diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index 385b076..6f60a5e 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -30,9 +30,8 @@ PREFERRED_VERSION_u-boot-am37x_am37x-evm = "2012.04.01"
 
 PREFERRED_PROVIDER_virtual/kernel_am3517-evm = "linux-omap-psp"
 PREFERRED_VERSION_linux-omap-psp_am3517-evm = "2.6.37"
-PREFERRED_PROVIDER_virtual/bootloader_am3517-evm = "u-boot"
-PREFERRED_PROVIDER_u-boot_am3517-evm = "u-boot"
-PREFERRED_VERSION_u-boot_am3517-evm = "2011.12"
+PREFERRED_PROVIDER_virtual/bootloader_am3517-evm = "u-boot-am3517"
+PREFERRED_PROVIDER_u-boot_am3517-evm = "u-boot-am3517"
 
 PREFERRED_PROVIDER_virtual/kernel_beagleboard = "linux"
 PREFERRED_VERSION_linux_beagleboard = "3.3.7"
diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot-am3517_2011.09.bbappend b/meta-arago-distro/recipes-bsp/u-boot/u-boot-am3517_2011.09.bbappend
new file mode 100644
index 0000000..9871300
--- /dev/null
+++ b/meta-arago-distro/recipes-bsp/u-boot/u-boot-am3517_2011.09.bbappend
@@ -0,0 +1,5 @@
+PR_append = "-arago0"
+
+# PSPREL and UVER are used by arago-source-ipk.conf
+PSPREL = "04.06.00.08"
+UVER = "2011.09"
-- 
1.7.0.4


