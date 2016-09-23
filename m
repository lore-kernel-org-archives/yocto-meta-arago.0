Return-Path: <denis@denix.org>
Received: from vms173015pub.verizon.net (vms173015pub.verizon.net
	[206.46.173.15])
	by arago-project.org (Postfix) with ESMTPS id AB14052A60
	for <meta-arago@arago-project.org>;
	Fri, 23 Sep 2016 17:53:46 +0000 (UTC)
Received: from vz-proxy-l005.mx.aol.com ([64.236.82.152])
	by vms173015.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0ODY007THXP7OA60@vms173015.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 23 Sep 2016 12:53:31 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=J+9Xl1TS c=1 sm=1 tr=0	a=a3t/a0oOYlYu/nGe1mf8ZA==:117
	a=GW1xBdLrtEIA:10 a=sozttTNsAAAA:8	a=pWLPaeMjz_0GOfFNYjcA:9
	a=ju9G8d9LirMYgQpn:21 a=a9HzVhsmCG-DoIEr:21
Received: by 100.15.110.130 with SMTP id 5434df73;
	Fri, 23 Sep 2016 17:53:31 GMT
Received: from sam.denix (sam [192.168.0.5])	by gandalf.denix.org (Postfix)
	with ESMTP id 8FE6216212C;	Fri, 23 Sep 2016 13:53:30 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 23 Sep 2016 13:53:29 -0400
Message-id: <1474653209-16121-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] optee-os: update with latest patches and change the output names slightly
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
X-List-Received-Date: Fri, 23 Sep 2016 17:53:47 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...0001-plat-ti-Fixed-issues-with-MMU-mapping.patch} |  2 +-
 ...onitor-update-to-support-platform-services.patch} |  2 +-
 ...ve-load-address-to-the-end-of-DRAM-and-inc.patch} | 12 ++++++------
 ...=> 0004-plat-ti-Add-DRA72x-platform-flavor.patch} | 20 ++++++++++----------
 ...005-plat-ti-Add-AM57xx-EVM-platform-flavor.patch} | 18 +++++++++---------
 .../recipes-security/optee/optee-os_git.bbappend     | 15 ++++++++-------
 6 files changed, 35 insertions(+), 34 deletions(-)
 rename meta-arago-distro/recipes-security/optee/optee-os/{optee2-0001-plat-ti-Fixed-issues-with-MMU-mapping.patch => 0001-plat-ti-Fixed-issues-with-MMU-mapping.patch} (95%)
 rename meta-arago-distro/recipes-security/optee/optee-os/{optee2-0002-monitor-update-to-support-platform-services.patch => 0002-monitor-update-to-support-platform-services.patch} (99%)
 rename meta-arago-distro/recipes-security/optee/optee-os/{optee2-0003-plat-ti-Move-load-address-to-the-end-of-DRAM-and-inc.patch => 0003-plat-ti-Move-load-address-to-the-end-of-DRAM-and-inc.patch} (84%)
 rename meta-arago-distro/recipes-security/optee/optee-os/{optee2-0004-plat-ti-Add-DRA72x-platform-flavor.patch => 0004-plat-ti-Add-DRA72x-platform-flavor.patch} (84%)
 rename meta-arago-distro/recipes-security/optee/optee-os/{optee2-0005-plat-ti-Add-AM572x-EVM-platform-flavor.patch => 0005-plat-ti-Add-AM57xx-EVM-platform-flavor.patch} (69%)

diff --git a/meta-arago-distro/recipes-security/optee/optee-os/optee2-0001-plat-ti-Fixed-issues-with-MMU-mapping.patch b/meta-arago-distro/recipes-security/optee/optee-os/0001-plat-ti-Fixed-issues-with-MMU-mapping.patch
similarity index 95%
rename from meta-arago-distro/recipes-security/optee/optee-os/optee2-0001-plat-ti-Fixed-issues-with-MMU-mapping.patch
rename to meta-arago-distro/recipes-security/optee/optee-os/0001-plat-ti-Fixed-issues-with-MMU-mapping.patch
index 34a1e07..8be9623 100644
--- a/meta-arago-distro/recipes-security/optee/optee-os/optee2-0001-plat-ti-Fixed-issues-with-MMU-mapping.patch
+++ b/meta-arago-distro/recipes-security/optee/optee-os/0001-plat-ti-Fixed-issues-with-MMU-mapping.patch
@@ -1,4 +1,4 @@
-From b5bd9af7136d8ffefc732cf5602eb7927a947f2b Mon Sep 17 00:00:00 2001
+From 60914b0195e17e25c8cf7abf4a125f48699681b2 Mon Sep 17 00:00:00 2001
 From: Harinarayan Bhatta <harinarayan@ti.com>
 Date: Wed, 10 Aug 2016 11:13:53 +0530
 Subject: [PATCH 1/5] plat-ti: Fixed issues with MMU mapping
diff --git a/meta-arago-distro/recipes-security/optee/optee-os/optee2-0002-monitor-update-to-support-platform-services.patch b/meta-arago-distro/recipes-security/optee/optee-os/0002-monitor-update-to-support-platform-services.patch
similarity index 99%
rename from meta-arago-distro/recipes-security/optee/optee-os/optee2-0002-monitor-update-to-support-platform-services.patch
rename to meta-arago-distro/recipes-security/optee/optee-os/0002-monitor-update-to-support-platform-services.patch
index 3da4c2a..1267eca 100644
--- a/meta-arago-distro/recipes-security/optee/optee-os/optee2-0002-monitor-update-to-support-platform-services.patch
+++ b/meta-arago-distro/recipes-security/optee/optee-os/0002-monitor-update-to-support-platform-services.patch
@@ -1,4 +1,4 @@
-From 0b5ff7f704573b19eae4184535045b4f8124956d Mon Sep 17 00:00:00 2001
+From 0cfabf5d6c20c8d91db026561db6c4624a1e7c3a Mon Sep 17 00:00:00 2001
 From: Daniel Allred <d-allred@ti.com>
 Date: Wed, 19 Aug 2015 16:01:26 -0500
 Subject: [PATCH 2/5] monitor: update to support platform services
diff --git a/meta-arago-distro/recipes-security/optee/optee-os/optee2-0003-plat-ti-Move-load-address-to-the-end-of-DRAM-and-inc.patch b/meta-arago-distro/recipes-security/optee/optee-os/0003-plat-ti-Move-load-address-to-the-end-of-DRAM-and-inc.patch
similarity index 84%
rename from meta-arago-distro/recipes-security/optee/optee-os/optee2-0003-plat-ti-Move-load-address-to-the-end-of-DRAM-and-inc.patch
rename to meta-arago-distro/recipes-security/optee/optee-os/0003-plat-ti-Move-load-address-to-the-end-of-DRAM-and-inc.patch
index 9144f59..2300d2e 100644
--- a/meta-arago-distro/recipes-security/optee/optee-os/optee2-0003-plat-ti-Move-load-address-to-the-end-of-DRAM-and-inc.patch
+++ b/meta-arago-distro/recipes-security/optee/optee-os/0003-plat-ti-Move-load-address-to-the-end-of-DRAM-and-inc.patch
@@ -1,4 +1,4 @@
-From 7f5fd58d527534aebbb10e0db96eb8575da6919f Mon Sep 17 00:00:00 2001
+From 4bcc24cc6761851b8c4d397165f7e55f99771029 Mon Sep 17 00:00:00 2001
 From: "Andrew F. Davis" <afd@ti.com>
 Date: Fri, 9 Sep 2016 08:13:48 -0500
 Subject: [PATCH 3/5] plat-ti: Move load address to the end of DRAM and
@@ -7,7 +7,7 @@ Subject: [PATCH 3/5] plat-ti: Move load address to the end of DRAM and
 The load address of OPTEE is, by default in U-Boot, the end of DRAM.
 For DRA7xx EVM this is 0xe0000000. Make this change here.
 
-We also move and expand the shared memory allocation to 2MB as suggested
+We also move and expand the shared memory allocation as suggested
 by the comment above the definition.
 
 Signed-off-by: Andrew F. Davis <afd@ti.com>
@@ -16,7 +16,7 @@ Signed-off-by: Andrew F. Davis <afd@ti.com>
  1 file changed, 6 insertions(+), 6 deletions(-)
 
 diff --git a/core/arch/arm/plat-ti/platform_config.h b/core/arch/arm/plat-ti/platform_config.h
-index 107219f..8b52540 100644
+index 107219f..606aab3 100644
 --- a/core/arch/arm/plat-ti/platform_config.h
 +++ b/core/arch/arm/plat-ti/platform_config.h
 @@ -30,16 +30,16 @@
@@ -25,7 +25,7 @@ index 107219f..8b52540 100644
  
 -#define DRAM0_BASE		0x94C00000
 -#define DRAM0_SIZE		0x00800000
-+#define DRAM0_BASE		0xdeb00000
++#define DRAM0_BASE		0xde900000
 +#define DRAM0_SIZE		0x01500000
  
  #ifdef CFG_WITH_PAGER
@@ -35,7 +35,7 @@ index 107219f..8b52540 100644
  /* Location of protected DDR on the DRA7xx platform */
 -#define TZDRAM_BASE		0x94D00000
 -#define TZDRAM_SIZE		0x00700000
-+#define TZDRAM_BASE		0xdeb00000
++#define TZDRAM_BASE		0xde900000
 +#define TZDRAM_SIZE		0x01300000
  
  #define CFG_TEE_CORE_NB_CORE	2
@@ -47,7 +47,7 @@ index 107219f..8b52540 100644
 -#define CFG_SHMEM_START		(DRAM0_BASE)
 -#define CFG_SHMEM_SIZE		0x100000
 +#define CFG_SHMEM_START		(DRAM0_BASE + 0x01300000)
-+#define CFG_SHMEM_SIZE		0x200000
++#define CFG_SHMEM_SIZE		0x400000
  
  #define CFG_TEE_RAM_VA_SIZE	(1024 * 1024)
  
diff --git a/meta-arago-distro/recipes-security/optee/optee-os/optee2-0004-plat-ti-Add-DRA72x-platform-flavor.patch b/meta-arago-distro/recipes-security/optee/optee-os/0004-plat-ti-Add-DRA72x-platform-flavor.patch
similarity index 84%
rename from meta-arago-distro/recipes-security/optee/optee-os/optee2-0004-plat-ti-Add-DRA72x-platform-flavor.patch
rename to meta-arago-distro/recipes-security/optee/optee-os/0004-plat-ti-Add-DRA72x-platform-flavor.patch
index c047203..4e16bc2 100644
--- a/meta-arago-distro/recipes-security/optee/optee-os/optee2-0004-plat-ti-Add-DRA72x-platform-flavor.patch
+++ b/meta-arago-distro/recipes-security/optee/optee-os/0004-plat-ti-Add-DRA72x-platform-flavor.patch
@@ -1,4 +1,4 @@
-From 0d6b6dbb2e26fa5e0a80e212d0a292575e2a77a3 Mon Sep 17 00:00:00 2001
+From 8ca27cab5a89eeaa35050d838af08efd9a25c668 Mon Sep 17 00:00:00 2001
 From: "Andrew F. Davis" <afd@ti.com>
 Date: Fri, 9 Sep 2016 09:54:57 -0500
 Subject: [PATCH 4/5] plat-ti: Add DRA72x platform flavor
@@ -16,17 +16,17 @@ Signed-off-by: Andrew F. Davis <afd@ti.com>
  2 files changed, 26 insertions(+), 3 deletions(-)
 
 diff --git a/core/arch/arm/plat-ti/conf.mk b/core/arch/arm/plat-ti/conf.mk
-index 7ac154f..7f9cb77 100644
+index 7ac154f..b6ee1d3 100644
 --- a/core/arch/arm/plat-ti/conf.mk
 +++ b/core/arch/arm/plat-ti/conf.mk
 @@ -1,4 +1,4 @@
 -PLATFORM_FLAVOR ?= dra7xx
-+PLATFORM_FLAVOR ?= dra7xx_evm
++PLATFORM_FLAVOR ?= dra7_evm
  
  # 32-bit flags
  arm32-platform-cpuarch		:= cortex-a15
 diff --git a/core/arch/arm/plat-ti/platform_config.h b/core/arch/arm/plat-ti/platform_config.h
-index 8b52540..ae6ff41 100644
+index 606aab3..3c4f6d5 100644
 --- a/core/arch/arm/plat-ti/platform_config.h
 +++ b/core/arch/arm/plat-ti/platform_config.h
 @@ -28,7 +28,7 @@
@@ -34,9 +34,9 @@ index 8b52540..ae6ff41 100644
  #define PLATFORM_CONFIG_H
  
 -#if defined(PLATFORM_FLAVOR_dra7xx)
-+#if defined(PLATFORM_FLAVOR_dra7xx_evm)
++#if defined(PLATFORM_FLAVOR_dra7_evm)
  
- #define DRAM0_BASE		0xdeb00000
+ #define DRAM0_BASE		0xde900000
  #define DRAM0_SIZE		0x01500000
 @@ -37,7 +37,7 @@
  #error Pager not supported on this platform
@@ -44,16 +44,16 @@ index 8b52540..ae6ff41 100644
  
 -/* Location of protected DDR on the DRA7xx platform */
 +/* Location of protected DDR on the DRA7xx EVM */
- #define TZDRAM_BASE		0xdeb00000
+ #define TZDRAM_BASE		0xde900000
  #define TZDRAM_SIZE		0x01300000
  
 @@ -51,6 +51,29 @@
  #define GIC_BASE            0x48211000
  #define SECRAM_BASE         0x40200000
  
-+#elif defined(PLATFORM_FLAVOR_dra72x_evm_revc)
++#elif defined(PLATFORM_FLAVOR_dra72_evm_revc)
 +
-+#define DRAM0_BASE		0xfeb00000
++#define DRAM0_BASE		0xfe900000
 +#define DRAM0_SIZE		0x01500000
 +
 +#ifdef CFG_WITH_PAGER
@@ -61,7 +61,7 @@ index 8b52540..ae6ff41 100644
 +#endif /*CFG_WITH_PAGER*/
 +
 +/* Location of protected DDR on the DRA72x EVM rev. C */
-+#define TZDRAM_BASE		0xfeb00000
++#define TZDRAM_BASE		0xfe900000
 +#define TZDRAM_SIZE		0x01300000
 +
 +#define CFG_TEE_CORE_NB_CORE	1
diff --git a/meta-arago-distro/recipes-security/optee/optee-os/optee2-0005-plat-ti-Add-AM572x-EVM-platform-flavor.patch b/meta-arago-distro/recipes-security/optee/optee-os/0005-plat-ti-Add-AM57xx-EVM-platform-flavor.patch
similarity index 69%
rename from meta-arago-distro/recipes-security/optee/optee-os/optee2-0005-plat-ti-Add-AM572x-EVM-platform-flavor.patch
rename to meta-arago-distro/recipes-security/optee/optee-os/0005-plat-ti-Add-AM57xx-EVM-platform-flavor.patch
index 878a5d7..dffd6c1 100644
--- a/meta-arago-distro/recipes-security/optee/optee-os/optee2-0005-plat-ti-Add-AM572x-EVM-platform-flavor.patch
+++ b/meta-arago-distro/recipes-security/optee/optee-os/0005-plat-ti-Add-AM57xx-EVM-platform-flavor.patch
@@ -1,10 +1,10 @@
-From 2ec4bfae82ff054847c2541f23e89d3c0033eef1 Mon Sep 17 00:00:00 2001
+From c66ebf13c8756bd770b0977fe7c52a693bf706a1 Mon Sep 17 00:00:00 2001
 From: "Andrew F. Davis" <afd@ti.com>
 Date: Fri, 9 Sep 2016 10:00:57 -0500
-Subject: [PATCH 5/5] plat-ti: Add AM572x EVM platform flavor
+Subject: [PATCH 5/5] plat-ti: Add AM57xx EVM platform flavor
 
-The AM572x EVM is based on the DRA7x EVM exept that is has more memory
-and uses a different UART port. Add this EVM here.
+The AM57xx EVM flavor is based on the DRA7x EVM exept that is has more
+memory and uses a different UART port. Add this EVM here.
 
 Signed-off-by: Andrew F. Davis <afd@ti.com>
 ---
@@ -12,24 +12,24 @@ Signed-off-by: Andrew F. Davis <afd@ti.com>
  1 file changed, 23 insertions(+)
 
 diff --git a/core/arch/arm/plat-ti/platform_config.h b/core/arch/arm/plat-ti/platform_config.h
-index ae6ff41..9ae4232 100644
+index 3c4f6d5..4a57466 100644
 --- a/core/arch/arm/plat-ti/platform_config.h
 +++ b/core/arch/arm/plat-ti/platform_config.h
 @@ -74,6 +74,29 @@
  #define GIC_BASE            0x48211000
  #define SECRAM_BASE         0x40200000
  
-+#elif defined(PLATFORM_FLAVOR_am572x_evm)
++#elif defined(PLATFORM_FLAVOR_am57xx_evm)
 +
-+#define DRAM0_BASE		0xfeb00000
++#define DRAM0_BASE		0xfe900000
 +#define DRAM0_SIZE		0x01500000
 +
 +#ifdef CFG_WITH_PAGER
 +#error Pager not supported on this platform
 +#endif /*CFG_WITH_PAGER*/
 +
-+/* Location of protected DDR on the AM572x EVM */
-+#define TZDRAM_BASE		0xfeb00000
++/* Location of protected DDR on the AM57xx EVM */
++#define TZDRAM_BASE		0xfe900000
 +#define TZDRAM_SIZE		0x01300000
 +
 +#define CFG_TEE_CORE_NB_CORE	2
diff --git a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
index c52d4bf..c44eaa0 100644
--- a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
+++ b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
@@ -1,6 +1,6 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PR_append = ".arago0"
+PR_append = ".arago1"
 
 is_armv7 = "1"
 
@@ -14,11 +14,11 @@ EXTRA_OEMAKE = "CROSS_COMPILE_core=${HOST_PREFIX}  \
 "
 
 SRC_URI += " \
-    file://optee2-0001-plat-ti-Fixed-issues-with-MMU-mapping.patch \
-    file://optee2-0002-monitor-update-to-support-platform-services.patch \
-    file://optee2-0003-plat-ti-Move-load-address-to-the-end-of-DRAM-and-inc.patch \
-    file://optee2-0004-plat-ti-Add-DRA72x-platform-flavor.patch \
-    file://optee2-0005-plat-ti-Add-AM572x-EVM-platform-flavor.patch \
+    file://0001-plat-ti-Fixed-issues-with-MMU-mapping.patch \
+    file://0002-monitor-update-to-support-platform-services.patch \
+    file://0003-plat-ti-Move-load-address-to-the-end-of-DRAM-and-inc.patch \
+    file://0004-plat-ti-Add-DRA72x-platform-flavor.patch \
+    file://0005-plat-ti-Add-AM57xx-EVM-platform-flavor.patch \
 "
 
 do_compile() {
@@ -29,7 +29,8 @@ do_compile() {
         oe_runmake all PLATFORM=${OPTEEMACHINE} PLATFORM_FLAVOR=$flavor
         ( cd out/arm-plat-${OPTEEOUTPUTMACHINE}/core/; \
             ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh tee.bin tee.bin.signed; \
-            mv tee.bin.signed $flavor.optee; \
+            normfl=`echo $flavor | tr "_" "-"`
+            mv tee.bin.signed $normfl.optee; \
         )
     done
 }
-- 
2.7.4


