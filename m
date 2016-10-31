Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id BAACF52996
	for <meta-arago@arago-project.org>;
	Mon, 31 Oct 2016 19:02:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9B91C208FD;
	Mon, 31 Oct 2016 19:02:45 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id zfMKMf8lfxNP; Mon, 31 Oct 2016 19:02:45 +0000 (UTC)
Received: from gandalf.denix.org (pool-100-15-106-107.washdc.fios.verizon.net
	[100.15.106.107])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 57D702099C;
	Mon, 31 Oct 2016 19:02:44 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by gandalf.denix.org (Postfix) with ESMTP id 2D26A16217F;
	Mon, 31 Oct 2016 15:02:43 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 31 Oct 2016 15:02:40 -0400
Message-Id: <1477940561-17265-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/2] optee-os: update TI patches and add DRA71x flavor
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
X-List-Received-Date: Mon, 31 Oct 2016 19:02:46 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...itor-update-to-support-platform-services.patch} | 65 +++++++++++-----------
 ...001-plat-ti-Fixed-issues-with-MMU-mapping.patch | 41 --------------
 ...-load-address-to-the-end-of-DRAM-and-inc.patch} | 14 ++---
 ... 0003-plat-ti-Add-DRA72x-platform-flavor.patch} | 16 +++---
 ...4-plat-ti-Add-DRA71x-EVM-platform-flavor.patch} | 30 +++++-----
 ...05-plat-ti-Add-AM57xx-EVM-platform-flavor.patch | 10 ++--
 .../recipes-security/optee/optee-os_git.bbappend   | 10 ++--
 7 files changed, 72 insertions(+), 114 deletions(-)
 rename meta-arago-distro/recipes-security/optee/optee-os/{0002-monitor-update-to-support-platform-services.patch => 0001-monitor-update-to-support-platform-services.patch} (82%)
 delete mode 100644 meta-arago-distro/recipes-security/optee/optee-os/0001-plat-ti-Fixed-issues-with-MMU-mapping.patch
 rename meta-arago-distro/recipes-security/optee/optee-os/{0003-plat-ti-Move-load-address-to-the-end-of-DRAM-and-inc.patch => 0002-plat-ti-Move-load-address-to-the-end-of-DRAM-and-inc.patch} (85%)
 rename meta-arago-distro/recipes-security/optee/optee-os/{0004-plat-ti-Add-DRA72x-platform-flavor.patch => 0003-plat-ti-Add-DRA72x-platform-flavor.patch} (88%)
 copy meta-arago-distro/recipes-security/optee/optee-os/{0005-plat-ti-Add-AM57xx-EVM-platform-flavor.patch => 0004-plat-ti-Add-DRA71x-EVM-platform-flavor.patch} (58%)

diff --git a/meta-arago-distro/recipes-security/optee/optee-os/0002-monitor-update-to-support-platform-services.patch b/meta-arago-distro/recipes-security/optee/optee-os/0001-monitor-update-to-support-platform-services.patch
similarity index 82%
rename from meta-arago-distro/recipes-security/optee/optee-os/0002-monitor-update-to-support-platform-services.patch
rename to meta-arago-distro/recipes-security/optee/optee-os/0001-monitor-update-to-support-platform-services.patch
index 1267eca..04e8f3e 100644
--- a/meta-arago-distro/recipes-security/optee/optee-os/0002-monitor-update-to-support-platform-services.patch
+++ b/meta-arago-distro/recipes-security/optee/optee-os/0001-monitor-update-to-support-platform-services.patch
@@ -1,11 +1,10 @@
-From 0cfabf5d6c20c8d91db026561db6c4624a1e7c3a Mon Sep 17 00:00:00 2001
+From c8b358a0870c4cd63039d40a4cd68a632c18c9d6 Mon Sep 17 00:00:00 2001
 From: Daniel Allred <d-allred@ti.com>
 Date: Wed, 19 Aug 2015 16:01:26 -0500
-Subject: [PATCH 2/5] monitor: update to support platform services
+Subject: [PATCH 1/5] monitor: update to support platform services
 
-Added the capability for a platform to plugin
-its own services, often legacy services for
-compatibility purposes. Added these services
+Added the capability for a platform to plugin its own services,
+often legacy services for compatibility purposes. Added these services
 for the dra7xx platform.
 
 Signed-off-by: Daniel Allred <d-allred@ti.com>
@@ -22,7 +21,7 @@ Signed-off-by: Daniel Allred <d-allred@ti.com>
 
 diff --git a/core/arch/arm/plat-ti/api_monitor_index.h b/core/arch/arm/plat-ti/api_monitor_index.h
 new file mode 100644
-index 0000000..b06fb2c
+index 0000000..bc93a62
 --- /dev/null
 +++ b/core/arch/arm/plat-ti/api_monitor_index.h
 @@ -0,0 +1,54 @@
@@ -56,33 +55,33 @@ index 0000000..b06fb2c
 +#ifndef __API_MONITOR_INDEX_H__
 +#define __API_MONITOR_INDEX_H__
 +
-+// Number of APIs
-+#define NB_MAX_API_MONITOR    10
-+
-+// Base Index of APIs
-+#define API_MONITOR_BASE_INDEX    0x00000100
-+
-+// HyperVisor Start
-+#define API_MONITOR_HYP_STARTHYPERVISOR_INDEX      API_MONITOR_BASE_INDEX + 0x00000002
-+// Caches cleaning
-+#define API_MONITOR_CACHES_CLEAN_INDEX             API_MONITOR_BASE_INDEX + 0x00000003
-+// Write the L2 Cache Controller Auxiliary Control
-+#define API_MONITOR_L2ACTLR_SETREGISTER_INDEX      API_MONITOR_BASE_INDEX + 0x00000004
-+// Set the Data and Tag RAM Latency
-+#define API_MONITOR_L2CACHE_SETLATENCY_INDEX       API_MONITOR_BASE_INDEX + 0x00000005
-+// L2 Cache Prefetch Control Register
-+#define API_MONITOR_L2PFR_SETREGISTER_INDEX        API_MONITOR_BASE_INDEX + 0x00000006
-+// Set Auxiliary Control Register
-+#define API_MONITOR_ACTLR_SETREGISTER_INDEX        API_MONITOR_BASE_INDEX + 0x00000007
-+// AMBA IF mode
-+#define API_MONITOR_WUGEN_MPU_SETAMBAIF_INDEX      API_MONITOR_BASE_INDEX + 0x00000008
-+// Timer CNTFRQ register set
-+#define API_MONITOR_TIMER_SETCNTFRQ_INDEX          API_MONITOR_BASE_INDEX + 0x00000009
-+
-+#endif // __API_MONITOR_INDEX_H__
++/* Number of APIs */
++#define NB_MAX_API_MONITOR 10
++
++/* Base Index of APIs */
++#define API_MONITOR_BASE_INDEX 0x00000100
++
++/* HyperVisor Start */
++#define API_MONITOR_HYP_STARTHYPERVISOR_INDEX      (API_MONITOR_BASE_INDEX + 0x00000002)
++/* Caches cleaning */
++#define API_MONITOR_CACHES_CLEAN_INDEX             (API_MONITOR_BASE_INDEX + 0x00000003)
++/* Write the L2 Cache Controller Auxiliary Control */
++#define API_MONITOR_L2ACTLR_SETREGISTER_INDEX      (API_MONITOR_BASE_INDEX + 0x00000004)
++/* Set the Data and Tag RAM Latency */
++#define API_MONITOR_L2CACHE_SETLATENCY_INDEX       (API_MONITOR_BASE_INDEX + 0x00000005)
++/* L2 Cache Prefetch Control Register */
++#define API_MONITOR_L2PFR_SETREGISTER_INDEX        (API_MONITOR_BASE_INDEX + 0x00000006)
++/* Set Auxiliary Control Register */
++#define API_MONITOR_ACTLR_SETREGISTER_INDEX        (API_MONITOR_BASE_INDEX + 0x00000007)
++/* AMBA IF mode */
++#define API_MONITOR_WUGEN_MPU_SETAMBAIF_INDEX      (API_MONITOR_BASE_INDEX + 0x00000008)
++/* Timer CNTFRQ register set */
++#define API_MONITOR_TIMER_SETCNTFRQ_INDEX          (API_MONITOR_BASE_INDEX + 0x00000009)
++
++#endif /* __API_MONITOR_INDEX_H__ */
 diff --git a/core/arch/arm/plat-ti/sm_platform_handler.S b/core/arch/arm/plat-ti/sm_platform_handler.S
 new file mode 100644
-index 0000000..ffaeae4
+index 0000000..da5921a
 --- /dev/null
 +++ b/core/arch/arm/plat-ti/sm_platform_handler.S
 @@ -0,0 +1,79 @@
@@ -143,7 +142,7 @@ index 0000000..ffaeae4
 +	cmp	r12, #0x200
 +	bxhs	lr
 +
-+	/* Pop the complete stack, not going back to the calling fuction */
++	/* Pop the complete stack, not going back to the calling function */
 +	pop	{lr}
 +	pop	{r0-r3}
 +
@@ -228,5 +227,5 @@ index 7de8434..ddfb97a 100644
  #endif /*SM_PRIVATE_H*/
  
 -- 
-2.9.3
+2.7.4
 
diff --git a/meta-arago-distro/recipes-security/optee/optee-os/0001-plat-ti-Fixed-issues-with-MMU-mapping.patch b/meta-arago-distro/recipes-security/optee/optee-os/0001-plat-ti-Fixed-issues-with-MMU-mapping.patch
deleted file mode 100644
index 8be9623..0000000
--- a/meta-arago-distro/recipes-security/optee/optee-os/0001-plat-ti-Fixed-issues-with-MMU-mapping.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 60914b0195e17e25c8cf7abf4a125f48699681b2 Mon Sep 17 00:00:00 2001
-From: Harinarayan Bhatta <harinarayan@ti.com>
-Date: Wed, 10 Aug 2016 11:13:53 +0530
-Subject: [PATCH 1/5] plat-ti: Fixed issues with MMU mapping
-
-Signed-off-by: Harinarayan Bhatta <harinarayan@ti.com>
----
- core/arch/arm/plat-ti/main.c | 7 ++++---
- 1 file changed, 4 insertions(+), 3 deletions(-)
-
-diff --git a/core/arch/arm/plat-ti/main.c b/core/arch/arm/plat-ti/main.c
-index fe2a1d2..0935b1c 100644
---- a/core/arch/arm/plat-ti/main.c
-+++ b/core/arch/arm/plat-ti/main.c
-@@ -77,7 +77,7 @@ static vaddr_t console_base(void)
- 
- 	if (cpu_mmu_enabled()) {
- 		if (!va)
--			va = phys_to_virt(CONSOLE_UART_BASE, MEM_AREA_IO_SEC);
-+			va = phys_to_virt(CONSOLE_UART_BASE, MEM_AREA_IO_NSEC);
- 		return (vaddr_t)va;
- 	}
- 	return CONSOLE_UART_BASE;
-@@ -130,11 +130,12 @@ struct plat_nsec_ctx {
- 
- void init_sec_mon(unsigned long nsec_entry)
- {
--	struct plat_nsec_ctx *plat_ctx = (struct plat_nsec_ctx *)nsec_entry;
-+	struct plat_nsec_ctx *plat_ctx = (struct plat_nsec_ctx *)
-+		(phys_to_virt(nsec_entry,MEM_AREA_IO_SEC));
- 	struct sm_nsec_ctx *nsec_ctx;
- 
- 	/* Invalidate cache to fetch data from external memory */
--	cache_maintenance_l1(DCACHE_AREA_INVALIDATE, (void *)nsec_entry,
-+	cache_maintenance_l1(DCACHE_AREA_INVALIDATE, (void *)plat_ctx,
- 		sizeof(struct plat_nsec_ctx));
- 
- 	/* Initialize secure monitor */
--- 
-2.9.3
-
diff --git a/meta-arago-distro/recipes-security/optee/optee-os/0003-plat-ti-Move-load-address-to-the-end-of-DRAM-and-inc.patch b/meta-arago-distro/recipes-security/optee/optee-os/0002-plat-ti-Move-load-address-to-the-end-of-DRAM-and-inc.patch
similarity index 85%
rename from meta-arago-distro/recipes-security/optee/optee-os/0003-plat-ti-Move-load-address-to-the-end-of-DRAM-and-inc.patch
rename to meta-arago-distro/recipes-security/optee/optee-os/0002-plat-ti-Move-load-address-to-the-end-of-DRAM-and-inc.patch
index 2300d2e..df440bc 100644
--- a/meta-arago-distro/recipes-security/optee/optee-os/0003-plat-ti-Move-load-address-to-the-end-of-DRAM-and-inc.patch
+++ b/meta-arago-distro/recipes-security/optee/optee-os/0002-plat-ti-Move-load-address-to-the-end-of-DRAM-and-inc.patch
@@ -1,7 +1,7 @@
-From 4bcc24cc6761851b8c4d397165f7e55f99771029 Mon Sep 17 00:00:00 2001
+From 21a2e48797bebfe4feb5cbeeb10257687ac30d76 Mon Sep 17 00:00:00 2001
 From: "Andrew F. Davis" <afd@ti.com>
 Date: Fri, 9 Sep 2016 08:13:48 -0500
-Subject: [PATCH 3/5] plat-ti: Move load address to the end of DRAM and
+Subject: [PATCH 2/5] plat-ti: Move load address to the end of DRAM and
  increase SHMEM
 
 The load address of OPTEE is, by default in U-Boot, the end of DRAM.
@@ -16,7 +16,7 @@ Signed-off-by: Andrew F. Davis <afd@ti.com>
  1 file changed, 6 insertions(+), 6 deletions(-)
 
 diff --git a/core/arch/arm/plat-ti/platform_config.h b/core/arch/arm/plat-ti/platform_config.h
-index 107219f..606aab3 100644
+index c557fc9..ea456db 100644
 --- a/core/arch/arm/plat-ti/platform_config.h
 +++ b/core/arch/arm/plat-ti/platform_config.h
 @@ -30,16 +30,16 @@
@@ -26,7 +26,7 @@ index 107219f..606aab3 100644
 -#define DRAM0_BASE		0x94C00000
 -#define DRAM0_SIZE		0x00800000
 +#define DRAM0_BASE		0xde900000
-+#define DRAM0_SIZE		0x01500000
++#define DRAM0_SIZE		0x01700000
  
  #ifdef CFG_WITH_PAGER
  #error Pager not supported on this platform
@@ -40,8 +40,8 @@ index 107219f..606aab3 100644
  
  #define CFG_TEE_CORE_NB_CORE	2
  
-@@ -61,8 +61,8 @@
- #define HEAP_SIZE		(24 * 1024)
+@@ -59,8 +59,8 @@
+ #define STACK_ALIGNMENT		64
  
  /* Full GlobalPlatform test suite requires CFG_SHMEM_SIZE to be at least 2MB */
 -#define CFG_SHMEM_START		(DRAM0_BASE)
@@ -52,5 +52,5 @@ index 107219f..606aab3 100644
  #define CFG_TEE_RAM_VA_SIZE	(1024 * 1024)
  
 -- 
-2.9.3
+2.7.4
 
diff --git a/meta-arago-distro/recipes-security/optee/optee-os/0004-plat-ti-Add-DRA72x-platform-flavor.patch b/meta-arago-distro/recipes-security/optee/optee-os/0003-plat-ti-Add-DRA72x-platform-flavor.patch
similarity index 88%
rename from meta-arago-distro/recipes-security/optee/optee-os/0004-plat-ti-Add-DRA72x-platform-flavor.patch
rename to meta-arago-distro/recipes-security/optee/optee-os/0003-plat-ti-Add-DRA72x-platform-flavor.patch
index 4e16bc2..a43daea 100644
--- a/meta-arago-distro/recipes-security/optee/optee-os/0004-plat-ti-Add-DRA72x-platform-flavor.patch
+++ b/meta-arago-distro/recipes-security/optee/optee-os/0003-plat-ti-Add-DRA72x-platform-flavor.patch
@@ -1,7 +1,7 @@
-From 8ca27cab5a89eeaa35050d838af08efd9a25c668 Mon Sep 17 00:00:00 2001
+From 35e2a7332239b143a1e9331bad10b2a908c483b4 Mon Sep 17 00:00:00 2001
 From: "Andrew F. Davis" <afd@ti.com>
 Date: Fri, 9 Sep 2016 09:54:57 -0500
-Subject: [PATCH 4/5] plat-ti: Add DRA72x platform flavor
+Subject: [PATCH 3/5] plat-ti: Add DRA72x platform flavor
 
 The DRA72x EVM is based on the single core variant of the DRA7xx
 platform. Add this EVM here. We also change the flavor name to
@@ -26,7 +26,7 @@ index 7ac154f..b6ee1d3 100644
  # 32-bit flags
  arm32-platform-cpuarch		:= cortex-a15
 diff --git a/core/arch/arm/plat-ti/platform_config.h b/core/arch/arm/plat-ti/platform_config.h
-index 606aab3..3c4f6d5 100644
+index ea456db..fdfe3ac 100644
 --- a/core/arch/arm/plat-ti/platform_config.h
 +++ b/core/arch/arm/plat-ti/platform_config.h
 @@ -28,7 +28,7 @@
@@ -37,7 +37,7 @@ index 606aab3..3c4f6d5 100644
 +#if defined(PLATFORM_FLAVOR_dra7_evm)
  
  #define DRAM0_BASE		0xde900000
- #define DRAM0_SIZE		0x01500000
+ #define DRAM0_SIZE		0x01700000
 @@ -37,7 +37,7 @@
  #error Pager not supported on this platform
  #endif /*CFG_WITH_PAGER*/
@@ -53,15 +53,15 @@ index 606aab3..3c4f6d5 100644
  
 +#elif defined(PLATFORM_FLAVOR_dra72_evm_revc)
 +
-+#define DRAM0_BASE		0xfe900000
-+#define DRAM0_SIZE		0x01500000
++#define DRAM0_BASE		0xfd900000
++#define DRAM0_SIZE		0x01700000
 +
 +#ifdef CFG_WITH_PAGER
 +#error Pager not supported on this platform
 +#endif /*CFG_WITH_PAGER*/
 +
 +/* Location of protected DDR on the DRA72x EVM rev. C */
-+#define TZDRAM_BASE		0xfe900000
++#define TZDRAM_BASE		0xfd900000
 +#define TZDRAM_SIZE		0x01300000
 +
 +#define CFG_TEE_CORE_NB_CORE	1
@@ -78,5 +78,5 @@ index 606aab3..3c4f6d5 100644
  #error "Unknown platform flavor"
  #endif
 -- 
-2.9.3
+2.7.4
 
diff --git a/meta-arago-distro/recipes-security/optee/optee-os/0005-plat-ti-Add-AM57xx-EVM-platform-flavor.patch b/meta-arago-distro/recipes-security/optee/optee-os/0004-plat-ti-Add-DRA71x-EVM-platform-flavor.patch
similarity index 58%
copy from meta-arago-distro/recipes-security/optee/optee-os/0005-plat-ti-Add-AM57xx-EVM-platform-flavor.patch
copy to meta-arago-distro/recipes-security/optee/optee-os/0004-plat-ti-Add-DRA71x-EVM-platform-flavor.patch
index dffd6c1..6110201 100644
--- a/meta-arago-distro/recipes-security/optee/optee-os/0005-plat-ti-Add-AM57xx-EVM-platform-flavor.patch
+++ b/meta-arago-distro/recipes-security/optee/optee-os/0004-plat-ti-Add-DRA71x-EVM-platform-flavor.patch
@@ -1,10 +1,10 @@
-From c66ebf13c8756bd770b0977fe7c52a693bf706a1 Mon Sep 17 00:00:00 2001
+From b647852a366191836e27e75810d968fad0e4a0ca Mon Sep 17 00:00:00 2001
 From: "Andrew F. Davis" <afd@ti.com>
-Date: Fri, 9 Sep 2016 10:00:57 -0500
-Subject: [PATCH 5/5] plat-ti: Add AM57xx EVM platform flavor
+Date: Tue, 11 Oct 2016 11:22:53 -0500
+Subject: [PATCH 4/5] plat-ti: Add DRA71x EVM platform flavor
 
-The AM57xx EVM flavor is based on the DRA7x EVM exept that is has more
-memory and uses a different UART port. Add this EVM here.
+The DRA71x EVM flavor is based on the DRA72x EVM exept that is uses
+the DRA71x SoC. Add this EVM here.
 
 Signed-off-by: Andrew F. Davis <afd@ti.com>
 ---
@@ -12,30 +12,30 @@ Signed-off-by: Andrew F. Davis <afd@ti.com>
  1 file changed, 23 insertions(+)
 
 diff --git a/core/arch/arm/plat-ti/platform_config.h b/core/arch/arm/plat-ti/platform_config.h
-index 3c4f6d5..4a57466 100644
+index fdfe3ac..045cb1a 100644
 --- a/core/arch/arm/plat-ti/platform_config.h
 +++ b/core/arch/arm/plat-ti/platform_config.h
 @@ -74,6 +74,29 @@
  #define GIC_BASE            0x48211000
  #define SECRAM_BASE         0x40200000
  
-+#elif defined(PLATFORM_FLAVOR_am57xx_evm)
++#elif defined(PLATFORM_FLAVOR_dra71_evm)
 +
-+#define DRAM0_BASE		0xfe900000
-+#define DRAM0_SIZE		0x01500000
++#define DRAM0_BASE		0xfd900000
++#define DRAM0_SIZE		0x01700000
 +
 +#ifdef CFG_WITH_PAGER
 +#error Pager not supported on this platform
 +#endif /*CFG_WITH_PAGER*/
 +
-+/* Location of protected DDR on the AM57xx EVM */
-+#define TZDRAM_BASE		0xfe900000
++/* Location of protected DDR on the DRA71x EVM */
++#define TZDRAM_BASE		0xfd900000
 +#define TZDRAM_SIZE		0x01300000
 +
-+#define CFG_TEE_CORE_NB_CORE	2
++#define CFG_TEE_CORE_NB_CORE	1
 +
-+/* UART3 */
-+#define CONSOLE_UART_BASE		0x48020000
++/* UART1 */
++#define CONSOLE_UART_BASE		0x4806A000
 +#define CONSOLE_UART_CLK_IN_HZ	48000000
 +#define UART_BAUDRATE			115200
 +
@@ -46,5 +46,5 @@ index 3c4f6d5..4a57466 100644
  #error "Unknown platform flavor"
  #endif
 -- 
-2.9.3
+2.7.4
 
diff --git a/meta-arago-distro/recipes-security/optee/optee-os/0005-plat-ti-Add-AM57xx-EVM-platform-flavor.patch b/meta-arago-distro/recipes-security/optee/optee-os/0005-plat-ti-Add-AM57xx-EVM-platform-flavor.patch
index dffd6c1..4286343 100644
--- a/meta-arago-distro/recipes-security/optee/optee-os/0005-plat-ti-Add-AM57xx-EVM-platform-flavor.patch
+++ b/meta-arago-distro/recipes-security/optee/optee-os/0005-plat-ti-Add-AM57xx-EVM-platform-flavor.patch
@@ -1,4 +1,4 @@
-From c66ebf13c8756bd770b0977fe7c52a693bf706a1 Mon Sep 17 00:00:00 2001
+From 7f02156690e01573ae1ffe27593cd2031cb8ce77 Mon Sep 17 00:00:00 2001
 From: "Andrew F. Davis" <afd@ti.com>
 Date: Fri, 9 Sep 2016 10:00:57 -0500
 Subject: [PATCH 5/5] plat-ti: Add AM57xx EVM platform flavor
@@ -12,17 +12,17 @@ Signed-off-by: Andrew F. Davis <afd@ti.com>
  1 file changed, 23 insertions(+)
 
 diff --git a/core/arch/arm/plat-ti/platform_config.h b/core/arch/arm/plat-ti/platform_config.h
-index 3c4f6d5..4a57466 100644
+index 045cb1a..559cd9e 100644
 --- a/core/arch/arm/plat-ti/platform_config.h
 +++ b/core/arch/arm/plat-ti/platform_config.h
-@@ -74,6 +74,29 @@
+@@ -97,6 +97,29 @@
  #define GIC_BASE            0x48211000
  #define SECRAM_BASE         0x40200000
  
 +#elif defined(PLATFORM_FLAVOR_am57xx_evm)
 +
 +#define DRAM0_BASE		0xfe900000
-+#define DRAM0_SIZE		0x01500000
++#define DRAM0_SIZE		0x01700000
 +
 +#ifdef CFG_WITH_PAGER
 +#error Pager not supported on this platform
@@ -46,5 +46,5 @@ index 3c4f6d5..4a57466 100644
  #error "Unknown platform flavor"
  #endif
 -- 
-2.9.3
+2.7.4
 
diff --git a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
index c44eaa0..fe3a575 100644
--- a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
+++ b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
@@ -1,6 +1,6 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PR_append = ".arago1"
+PR_append = ".arago2"
 
 is_armv7 = "1"
 
@@ -14,10 +14,10 @@ EXTRA_OEMAKE = "CROSS_COMPILE_core=${HOST_PREFIX}  \
 "
 
 SRC_URI += " \
-    file://0001-plat-ti-Fixed-issues-with-MMU-mapping.patch \
-    file://0002-monitor-update-to-support-platform-services.patch \
-    file://0003-plat-ti-Move-load-address-to-the-end-of-DRAM-and-inc.patch \
-    file://0004-plat-ti-Add-DRA72x-platform-flavor.patch \
+    file://0001-monitor-update-to-support-platform-services.patch \
+    file://0002-plat-ti-Move-load-address-to-the-end-of-DRAM-and-inc.patch \
+    file://0003-plat-ti-Add-DRA72x-platform-flavor.patch \
+    file://0004-plat-ti-Add-DRA71x-EVM-platform-flavor.patch \
     file://0005-plat-ti-Add-AM57xx-EVM-platform-flavor.patch \
 "
 
-- 
2.7.4


