Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 1F96F52972
	for <meta-arago@arago-project.org>;
	Mon, 29 Apr 2013 13:15:22 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r3TDFKU2001494
	for <meta-arago@arago-project.org>; Mon, 29 Apr 2013 08:15:20 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r3TDFKud011392
	for <meta-arago@arago-project.org>; Mon, 29 Apr 2013 08:15:20 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 29 Apr 2013 08:15:20 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id r3TDFHJP031838;
	Mon, 29 Apr 2013 08:15:18 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 29 Apr 2013 08:15:12 -0500
Message-ID: <1367241314-16498-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 1/3] ltp-ddt-legacy-1.0: Add ltp-ddt recipe that supports 3.2 or older kernels
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
X-List-Received-Date: Mon, 29 Apr 2013 13:15:24 -0000
Content-Type: text/plain

* Ltp-ddt master is now targeting 3.8+ kernels.
* This recipe points to the v3.2 branch meant for legacy kernels.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../conf/distro/include/arago-prefs.inc            |    6 ++++++
 .../conf/distro/include/branding-amsdk.inc         |    1 +
 ..._0.0.4.bbappend => ltp-ddt-legacy_1.0.bbappend} |    4 ----
 .../recipes-devtools/ltp-ddt/ltp-ddt-legacy_1.0.bb |   14 ++++++++++++++
 4 files changed, 21 insertions(+), 4 deletions(-)
 copy meta-arago-distro/recipes-devtools/ltp-ddt/{ltp-ddt_0.0.4.bbappend => ltp-ddt-legacy_1.0.bbappend} (90%)
 create mode 100644 meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt-legacy_1.0.bb

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index 6b8bdb4..c3807e9 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -1,3 +1,6 @@
+# Use the latest version of ltp-ddt for kernel versions 3.8+
+PREFERRED_PROVIDER_ltp-ddt = "ltp-ddt"
+
 PREFERRED_PROVIDER_virtual/gettext = "gettext"
 
 ARAGO_QT_PROVIDER = "${@base_contains('MACHINE_FEATURES','sgx','qt4-embedded-gles','qt4-embedded',d)}"
@@ -19,6 +22,7 @@ PREFERRED_PROVIDER_u-boot_am335x-evm = "u-boot-ti-staging"
 PREFERRED_VERSION_linux-libc-headers_am180x-evm = "2.6.33"
 PREFERRED_PROVIDER_virtual/kernel_am180x-evm = "linux-omapl138-psp"
 PREFERRED_VERSION_linux-omapl138-psp = "2.6.37"
+PREFERRED_PROVIDER_ltp-ddt_am180x = "ltp-ddt-legacy"
 PREFERRED_PROVIDER_virtual/bootloader_am180x-evm = "u-boot-am180x"
 PREFERRED_PROVIDER_u-boot_am180x-evm = "u-boot-am180x"
 PREFERRED_VERSION_u-boot-am180x = "2010.12"
@@ -26,6 +30,7 @@ PREFERRED_VERSION_u-boot-am180x = "2010.12"
 PREFERRED_VERSION_linux-libc-headers_am37x-evm = "2.6.33"
 PREFERRED_PROVIDER_virtual/kernel_am37x-evm = "linux-omap-psp"
 PREFERRED_VERSION_linux-omap-psp = "2.6.37"
+PREFERRED_PROVIDER_ltp-ddt_am37x-evm = "ltp-ddt-legacy"
 PREFERRED_PROVIDER_virtual/bootloader_am37x-evm = "u-boot-am37x"
 PREFERRED_PROVIDER_u-boot_am37x-evm = "u-boot-am37x"
 PREFERRED_VERSION_u-boot-am37x_am37x-evm = "2012.04.01"
@@ -35,6 +40,7 @@ PREFERRED_PROVIDER_virtual/kernel_am3517-evm = "linux-omap-psp"
 PREFERRED_VERSION_linux-omap-psp_am3517-evm = "2.6.37"
 PREFERRED_PROVIDER_virtual/bootloader_am3517-evm = "u-boot-am3517"
 PREFERRED_PROVIDER_u-boot_am3517-evm = "u-boot-am3517"
+PREFERRED_PROVIDER_ltp-ddt_am3517-evm = "ltp-ddt-legacy"
 
 PREFERRED_PROVIDER_virtual/kernel_beagleboard = "linux"
 PREFERRED_VERSION_linux_beagleboard = "3.3.7"
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
diff --git a/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt-legacy_1.0.bbappend
similarity index 90%
copy from meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend
copy to meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt-legacy_1.0.bbappend
index f8c99d8..65a16f9 100644
--- a/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend
+++ b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt-legacy_1.0.bbappend
@@ -3,10 +3,6 @@ PR_append = "-arago0+gitr${SRCPV}"
 # Auto rev so we pick up the latest changes
 SRCREV = "${AUTOREV}"
 
-# Use special branch for platforms with older <=3.2 kernel
-BRANCH_am37x-evm = "v3.2"
-BRANCH_am180x-evm = "v3.2"
-
 do_compile_kmodules() {
         unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
         oe_runmake modules
diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt-legacy_1.0.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt-legacy_1.0.bb
new file mode 100644
index 0000000..2ef4455
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt-legacy_1.0.bb
@@ -0,0 +1,14 @@
+# The master branch is now 3.2+ kernels.
+# This recipe is meant to use the v3.2 that supports 3.2 and older kernels.
+
+require recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bb
+
+PROVIDES += "ltp-ddt"
+RPROVIDES += "ltp-ddt"
+RREPLACES += "ltp-ddt"
+RCONFLICTS += "ltp-ddt"
+
+PR := "${PR}.0"
+
+SRCREV = "1973c7e79f2ad1b595d5d1687db828f3f3998387"
+BRANCH = "v3.2"
-- 
1.7.0.4


