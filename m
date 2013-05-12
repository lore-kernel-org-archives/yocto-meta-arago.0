Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id DE28952A38
	for <meta-arago@arago-project.org>;
	Sun, 12 May 2013 23:13:20 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r4CNDK9B010473
	for <meta-arago@arago-project.org>; Sun, 12 May 2013 18:13:20 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r4CNDKjs015951
	for <meta-arago@arago-project.org>; Sun, 12 May 2013 18:13:20 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Sun, 12 May 2013 18:13:19 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id r4CNDBah016294;
	Sun, 12 May 2013 18:13:18 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Sun, 12 May 2013 18:13:08 -0500
Message-ID: <1368400388-28708-3-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1368400388-28708-1-git-send-email-fcooper@ti.com>
References: <1368400388-28708-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 3/3] confs: Use ltp-ddt-legacy recipe for several machines
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
X-List-Received-Date: Sun, 12 May 2013 23:13:21 -0000
Content-Type: text/plain

* Set the ltp-ddt PREFERRED_PROVIDER to ltp-ddt-legacy for several machines that
  are using an older kernel (<3.8).
* Also remove BRANCH setting from append since it is no longer needed.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../conf/distro/include/arago-prefs.inc            |    4 ++++
 .../conf/distro/include/branding-amsdk.inc         |    1 +
 .../ltp-ddt/ltp-ddt_0.0.4.bbappend                 |    6 +-----
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index 611ae6e..d4339d2 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -21,23 +21,27 @@ PREFERRED_PROVIDER_u-boot_am335x-evm = "u-boot-ti-staging"
 
 PREFERRED_PROVIDER_virtual/kernel_am180x-evm = "linux-omapl138-psp"
 PREFERRED_VERSION_linux-omapl138-psp = "2.6.37"
+PREFERRED_PROVIDER_ltp-ddt_am180x = "ltp-ddt-legacy"
 PREFERRED_PROVIDER_virtual/bootloader_am180x-evm = "u-boot-am180x"
 PREFERRED_PROVIDER_u-boot_am180x-evm = "u-boot-am180x"
 PREFERRED_VERSION_u-boot-am180x = "2010.12"
 
 PREFERRED_PROVIDER_virtual/kernel_am37x-evm = "linux-omap-psp"
 PREFERRED_VERSION_linux-omap-psp = "2.6.37"
+PREFERRED_PROVIDER_ltp-ddt_am37x-evm = "ltp-ddt-legacy"
 PREFERRED_PROVIDER_virtual/bootloader_am37x-evm = "u-boot-am37x"
 PREFERRED_PROVIDER_u-boot_am37x-evm = "u-boot-am37x"
 PREFERRED_VERSION_u-boot-am37x_am37x-evm = "2012.04.01"
 
 PREFERRED_PROVIDER_virtual/kernel_am3517-evm = "linux-omap-psp"
 PREFERRED_VERSION_linux-omap-psp_am3517-evm = "2.6.37"
+PREFERRED_PROVIDER_ltp-ddt_am3517-evm = "ltp-ddt-legacy"
 PREFERRED_PROVIDER_virtual/bootloader_am3517-evm = "u-boot-am3517"
 PREFERRED_PROVIDER_u-boot_am3517-evm = "u-boot-am3517"
 
 PREFERRED_PROVIDER_virtual/kernel_beagleboard = "linux"
 PREFERRED_VERSION_linux_beagleboard = "3.3.7"
+PREFERRED_PROVIDER_ltp-ddt_beagleboard = "ltp-ddt-legacy"
 PREFERRED_PROVIDER_virtual/bootloader_beagleboard = "u-boot-am37x"
 PREFERRED_PROVIDER_u-boot_beagleboard = "u-boot-am37x"
 PREFERRED_VERSION_u-boot-am37x_beagleboard = "2012.04.01"
diff --git a/meta-arago-distro/conf/distro/include/branding-amsdk.inc b/meta-arago-distro/conf/distro/include/branding-amsdk.inc
index 9f64cd4..dc3f448 100644
--- a/meta-arago-distro/conf/distro/include/branding-amsdk.inc
+++ b/meta-arago-distro/conf/distro/include/branding-amsdk.inc
@@ -3,6 +3,7 @@
 # Use the SDK supported kernel and kernel version
 PREFERRED_PROVIDER_virtual/kernel_am335x-evm = "linux-am335x"
 PREFERRED_VERSION_linux-am335x = "3.2.0-psp05.06.00.00"
+PREFERRED_PROVIDER_ltp-ddt_am335x-evm = "ltp-ddt-legacy"
 PREFERRED_PROVIDER_virtual/bootloader_am335x-evm = "u-boot-am33x"
 PREFERRED_PROVIDER_u-boot_am335x-evm = "u-boot-am33x"
 PREFERRED_VERSION_u-boot-am33x = "2012.10"
diff --git a/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend
index f8c99d8..7e4a5f6 100644
--- a/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend
+++ b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend
@@ -1,12 +1,8 @@
-PR_append = "-arago0+gitr${SRCPV}"
+PR_append = "-arago1+gitr${SRCPV}"
 
 # Auto rev so we pick up the latest changes
 SRCREV = "${AUTOREV}"
 
-# Use special branch for platforms with older <=3.2 kernel
-BRANCH_am37x-evm = "v3.2"
-BRANCH_am180x-evm = "v3.2"
-
 do_compile_kmodules() {
         unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
         oe_runmake modules
-- 
1.7.0.4


