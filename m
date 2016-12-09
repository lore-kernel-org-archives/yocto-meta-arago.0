Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 5274052A0E
	for <meta-arago@arago-project.org>;
	Fri,  9 Dec 2016 17:06:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3CC9F20AAE;
	Fri,  9 Dec 2016 17:06:09 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id EXRlYxZpIADd; Fri,  9 Dec 2016 17:06:09 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id EDF21209D7;
	Fri,  9 Dec 2016 17:06:07 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by mail.denix.org (Postfix) with ESMTP id 19BEE1621C7;
	Fri,  9 Dec 2016 12:06:07 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri,  9 Dec 2016 12:06:03 -0500
Message-Id: <1481303165-23702-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/3] optee-os: use own pre-patched git repo, simplify flavor handling
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
X-List-Received-Date: Fri, 09 Dec 2016 17:06:10 -0000

From: Denys Dmytriyenko <denys@ti.com>

Since optee support for dra7/dra72/dra71 got unified and merged, no need for
multiple flavors per platform for now.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/classes/kernel-fitimage.bbclass  |  16 +-
 meta-arago-distro/conf/distro/arago.conf           |   2 -
 ...001-plat-ti-Fixed-issues-with-MMU-mapping.patch |  43 ----
 ...nitor-update-to-support-platform-services.patch | 231 ---------------------
 ...e-load-address-to-the-end-of-DRAM-and-inc.patch |  56 -----
 .../0004-plat-ti-Add-DRA72x-platform-flavor.patch  |  82 --------
 ...05-plat-ti-Add-DRA71x-EVM-platform-flavor.patch |  50 -----
 ...06-plat-ti-Add-AM57xx-EVM-platform-flavor.patch |  50 -----
 .../recipes-security/optee/optee-os_git.bbappend   |  32 ++-
 9 files changed, 15 insertions(+), 547 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-security/optee/optee-os/0001-plat-ti-Fixed-issues-with-MMU-mapping.patch
 delete mode 100644 meta-arago-distro/recipes-security/optee/optee-os/0002-monitor-update-to-support-platform-services.patch
 delete mode 100644 meta-arago-distro/recipes-security/optee/optee-os/0003-plat-ti-Move-load-address-to-the-end-of-DRAM-and-inc.patch
 delete mode 100644 meta-arago-distro/recipes-security/optee/optee-os/0004-plat-ti-Add-DRA72x-platform-flavor.patch
 delete mode 100644 meta-arago-distro/recipes-security/optee/optee-os/0005-plat-ti-Add-DRA71x-EVM-platform-flavor.patch
 delete mode 100644 meta-arago-distro/recipes-security/optee/optee-os/0006-plat-ti-Add-AM57xx-EVM-platform-flavor.patch

diff --git a/meta-arago-distro/classes/kernel-fitimage.bbclass b/meta-arago-distro/classes/kernel-fitimage.bbclass
index 773c254..4810dc0 100644
--- a/meta-arago-distro/classes/kernel-fitimage.bbclass
+++ b/meta-arago-distro/classes/kernel-fitimage.bbclass
@@ -332,19 +332,9 @@ fitimage_emit_section_config() {
 EOF
 		fi
 
-		if test -n "${FITIMAGE_TEE}"; then
-			teecount=1
-			for TEE in ${FITIMAGE_TEE}; do
-				teename=`basename ${TEE} ".optee"`
-				loadables_line=""
-				final_conf_desc="${conf_desc}"
-				if [ "${DTB#$teename}" != "${DTB}" ]; then
-					loadables_line="loadables = \"${TEE}\";"
-					final_conf_desc="${conf_desc}, OPTEE OS Image"
-					break
-				fi
-				teecount=`expr ${teecount} + 1`
-			done
+		if test -n "${OPTEEFLAVOR}"; then
+			loadables_line="loadables = \"${OPTEEFLAVOR}.optee\";"
+			final_conf_desc="${conf_desc}, OPTEE OS Image"
 		else
 			loadables_line=""
 			final_conf_desc="${conf_desc}"
diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 9497172..9a92099 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -32,12 +32,10 @@ FITIMAGE_CONF_BY_NAME = "1"
 KERNEL_IMAGETYPES_dra7xx-hs-evm = "zImage fitImage"
 INITRAMFS_IMAGE_dra7xx-hs-evm = "arago-base-tisdk-image"
 INITRAMFS_FSTYPES_dra7xx-hs-evm = "cpio.xz"
-FITIMAGE_TEE_dra7xx-hs-evm = "dra7-evm.optee dra72-evm-revc.optee dra71-evm.optee"
 
 KERNEL_IMAGETYPES_am57xx-hs-evm = "zImage fitImage"
 INITRAMFS_IMAGE_am57xx-hs-evm = "arago-base-tisdk-image"
 INITRAMFS_FSTYPES_am57xx-hs-evm = "cpio.xz"
-FITIMAGE_TEE_am57xx-hs-evm = "am57xx-evm.optee"
 
 KERNEL_IMAGETYPES_am437x-hs-evm = "zImage fitImage"
 INITRAMFS_IMAGE_am437x-hs-evm = "arago-base-tisdk-image"
diff --git a/meta-arago-distro/recipes-security/optee/optee-os/0001-plat-ti-Fixed-issues-with-MMU-mapping.patch b/meta-arago-distro/recipes-security/optee/optee-os/0001-plat-ti-Fixed-issues-with-MMU-mapping.patch
deleted file mode 100644
index 89cd5a9..0000000
--- a/meta-arago-distro/recipes-security/optee/optee-os/0001-plat-ti-Fixed-issues-with-MMU-mapping.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 15be5bf09e5a0a979a926806ca8591500783482b Mon Sep 17 00:00:00 2001
-From: Harinarayan Bhatta <harinarayan@ti.com>
-Date: Wed, 10 Aug 2016 11:13:53 +0530
-Subject: [PATCH 1/6] plat-ti: Fixed issues with MMU mapping
-
-Signed-off-by: Harinarayan Bhatta <harinarayan@ti.com>
----
- core/arch/arm/plat-ti/main.c | 9 +++++----
- 1 file changed, 5 insertions(+), 4 deletions(-)
-
-diff --git a/core/arch/arm/plat-ti/main.c b/core/arch/arm/plat-ti/main.c
-index fe2a1d2..8c26503 100644
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
-@@ -130,12 +130,13 @@ struct plat_nsec_ctx {
- 
- void init_sec_mon(unsigned long nsec_entry)
- {
--	struct plat_nsec_ctx *plat_ctx = (struct plat_nsec_ctx *)nsec_entry;
-+	struct plat_nsec_ctx *plat_ctx = (struct plat_nsec_ctx *)
-+		(phys_to_virt(nsec_entry, MEM_AREA_IO_SEC));
- 	struct sm_nsec_ctx *nsec_ctx;
- 
- 	/* Invalidate cache to fetch data from external memory */
--	cache_maintenance_l1(DCACHE_AREA_INVALIDATE, (void *)nsec_entry,
--		sizeof(struct plat_nsec_ctx));
-+	cache_maintenance_l1(DCACHE_AREA_INVALIDATE, (void *)plat_ctx,
-+		sizeof(*plat_ctx));
- 
- 	/* Initialize secure monitor */
- 	nsec_ctx = sm_get_nsec_ctx();
--- 
-2.7.4
-
diff --git a/meta-arago-distro/recipes-security/optee/optee-os/0002-monitor-update-to-support-platform-services.patch b/meta-arago-distro/recipes-security/optee/optee-os/0002-monitor-update-to-support-platform-services.patch
deleted file mode 100644
index d9986c6..0000000
--- a/meta-arago-distro/recipes-security/optee/optee-os/0002-monitor-update-to-support-platform-services.patch
+++ /dev/null
@@ -1,231 +0,0 @@
-From c8b358a0870c4cd63039d40a4cd68a632c18c9d6 Mon Sep 17 00:00:00 2001
-From: Daniel Allred <d-allred@ti.com>
-Date: Wed, 19 Aug 2015 16:01:26 -0500
-Subject: [PATCH 2/6] monitor: update to support platform services
-
-Added the capability for a platform to plugin its own services,
-often legacy services for compatibility purposes. Added these services
-for the dra7xx platform.
-
-Signed-off-by: Daniel Allred <d-allred@ti.com>
----
- core/arch/arm/plat-ti/api_monitor_index.h   | 54 ++++++++++++++++++++
- core/arch/arm/plat-ti/sm_platform_handler.S | 79 +++++++++++++++++++++++++++++
- core/arch/arm/plat-ti/sub.mk                |  1 +
- core/arch/arm/sm/sm.c                       |  5 ++
- core/arch/arm/sm/sm_a32.S                   | 14 +++++
- core/arch/arm/sm/sm_private.h               |  3 ++
- 6 files changed, 156 insertions(+)
- create mode 100644 core/arch/arm/plat-ti/api_monitor_index.h
- create mode 100644 core/arch/arm/plat-ti/sm_platform_handler.S
-
-diff --git a/core/arch/arm/plat-ti/api_monitor_index.h b/core/arch/arm/plat-ti/api_monitor_index.h
-new file mode 100644
-index 0000000..bc93a62
---- /dev/null
-+++ b/core/arch/arm/plat-ti/api_monitor_index.h
-@@ -0,0 +1,54 @@
-+/*
-+ * Copyright (c) 2015, Texas Instruments
-+ * All rights reserved.
-+ *
-+ * Redistribution and use in source and binary forms, with or without
-+ * modification, are permitted provided that the following conditions are met:
-+ *
-+ * 1. Redistributions of source code must retain the above copyright notice,
-+ * this list of conditions and the following disclaimer.
-+ *
-+ * 2. Redistributions in binary form must reproduce the above copyright notice,
-+ * this list of conditions and the following disclaimer in the documentation
-+ * and/or other materials provided with the distribution.
-+ *
-+ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
-+ * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
-+ * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
-+ * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
-+ * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
-+ * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
-+ * SUBSTITUTE GOODS OR SERVICES// LOSS OF USE, DATA, OR PROFITS// OR BUSINESS
-+ * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
-+ * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
-+ * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
-+ * POSSIBILITY OF SUCH DAMAGE.
-+ */
-+
-+#ifndef __API_MONITOR_INDEX_H__
-+#define __API_MONITOR_INDEX_H__
-+
-+/* Number of APIs */
-+#define NB_MAX_API_MONITOR 10
-+
-+/* Base Index of APIs */
-+#define API_MONITOR_BASE_INDEX 0x00000100
-+
-+/* HyperVisor Start */
-+#define API_MONITOR_HYP_STARTHYPERVISOR_INDEX      (API_MONITOR_BASE_INDEX + 0x00000002)
-+/* Caches cleaning */
-+#define API_MONITOR_CACHES_CLEAN_INDEX             (API_MONITOR_BASE_INDEX + 0x00000003)
-+/* Write the L2 Cache Controller Auxiliary Control */
-+#define API_MONITOR_L2ACTLR_SETREGISTER_INDEX      (API_MONITOR_BASE_INDEX + 0x00000004)
-+/* Set the Data and Tag RAM Latency */
-+#define API_MONITOR_L2CACHE_SETLATENCY_INDEX       (API_MONITOR_BASE_INDEX + 0x00000005)
-+/* L2 Cache Prefetch Control Register */
-+#define API_MONITOR_L2PFR_SETREGISTER_INDEX        (API_MONITOR_BASE_INDEX + 0x00000006)
-+/* Set Auxiliary Control Register */
-+#define API_MONITOR_ACTLR_SETREGISTER_INDEX        (API_MONITOR_BASE_INDEX + 0x00000007)
-+/* AMBA IF mode */
-+#define API_MONITOR_WUGEN_MPU_SETAMBAIF_INDEX      (API_MONITOR_BASE_INDEX + 0x00000008)
-+/* Timer CNTFRQ register set */
-+#define API_MONITOR_TIMER_SETCNTFRQ_INDEX          (API_MONITOR_BASE_INDEX + 0x00000009)
-+
-+#endif /* __API_MONITOR_INDEX_H__ */
-diff --git a/core/arch/arm/plat-ti/sm_platform_handler.S b/core/arch/arm/plat-ti/sm_platform_handler.S
-new file mode 100644
-index 0000000..da5921a
---- /dev/null
-+++ b/core/arch/arm/plat-ti/sm_platform_handler.S
-@@ -0,0 +1,79 @@
-+/*
-+ * Copyright (c) 2015, Texas Instruments
-+ * All rights reserved.
-+ *
-+ * Redistribution and use in source and binary forms, with or without
-+ * modification, are permitted provided that the following conditions are met:
-+ *
-+ * 1. Redistributions of source code must retain the above copyright notice,
-+ * this list of conditions and the following disclaimer.
-+ *
-+ * 2. Redistributions in binary form must reproduce the above copyright notice,
-+ * this list of conditions and the following disclaimer in the documentation
-+ * and/or other materials provided with the distribution.
-+ *
-+ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
-+ * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
-+ * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
-+ * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
-+ * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
-+ * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
-+ * SUBSTITUTE GOODS OR SERVICES// LOSS OF USE, DATA, OR PROFITS// OR BUSINESS
-+ * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
-+ * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
-+ * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
-+ * POSSIBILITY OF SUCH DAMAGE.
-+ */
-+
-+#include <asm.S>
-+#include <arm.h>
-+#include <arm32_macros.S>
-+#include "api_monitor_index.h"
-+
-+.global sm_platform_handler
-+
-+/*******************************************************************************
-+ *  FUNCTION: sm_platform_handler
-+ *
-+ *  DESCRIPTION: This function is called when a particular Monitor function is
-+ *               called by the NS environment. The service doesn't need to enter
-+ *               the secure kernel but need to be executed in SE. Hence Monitor
-+ *               is the appropriate environment
-+ *
-+ *  INPUTS: R0-R2 are the Secure Entry parameters, R12 the SMI Code Secure
-+ *          Service
-+ *          lr value is the Non-Secure return value
-+ *
-+ *  RETURN: API_HAL_RET_VALUE_SERVICE_UNKNWON if service is unknown.
-+ *
-+ *  NOTE: There are no secure information in the registers on exit, don't erase
-+ *        them.
-+ *        r3 is used to get the MMU Enable bit
-+ ******************************************************************************/
-+FUNC sm_platform_handler , :
-+    /* Check if this is a monitor mode API or not */
-+	cmp	r12, #0x200
-+	bxhs	lr
-+
-+	/* Pop the complete stack, not going back to the calling function */
-+	pop	{lr}
-+	pop	{r0-r3}
-+
-+	ldr	r3, =API_MONITOR_ACTLR_SETREGISTER_INDEX
-+	cmp	r12, r3
-+	bne	monapi_MonitorDispatcher_TIMER_SetCntFrq
-+	mcr	p15, 0, r0, c1, c0, 1
-+	isb
-+	b	monapi_MonitorDispatcher_Exit
-+
-+monapi_MonitorDispatcher_TIMER_SetCntFrq:
-+	ldr	r3, =API_MONITOR_TIMER_SETCNTFRQ_INDEX
-+	cmp	r12, r3
-+	bne	monapi_MonitorDispatcher_Exit
-+	mcr	p15, 0, r0, c14, c0, 0
-+	isb
-+
-+monapi_MonitorDispatcher_Exit:
-+	rfefd	sp!
-+
-+END_FUNC sm_platform_handler
-diff --git a/core/arch/arm/plat-ti/sub.mk b/core/arch/arm/plat-ti/sub.mk
-index 8ddc2fd..090ae86 100644
---- a/core/arch/arm/plat-ti/sub.mk
-+++ b/core/arch/arm/plat-ti/sub.mk
-@@ -1,2 +1,3 @@
- global-incdirs-y += .
- srcs-y += main.c
-+srcs-y += sm_platform_handler.S
-diff --git a/core/arch/arm/sm/sm.c b/core/arch/arm/sm/sm.c
-index ca30f35..b2656fd 100644
---- a/core/arch/arm/sm/sm.c
-+++ b/core/arch/arm/sm/sm.c
-@@ -111,3 +111,8 @@ void sm_set_entry_vector(void *entry_vector)
- {
- 	sm_entry_vector = entry_vector;
- }
-+
-+/* May be overridden in platform specific code */
-+__weak void sm_platform_handler(void)
-+{
-+}
-diff --git a/core/arch/arm/sm/sm_a32.S b/core/arch/arm/sm/sm_a32.S
-index 9cdd43a..c310025 100644
---- a/core/arch/arm/sm/sm_a32.S
-+++ b/core/arch/arm/sm/sm_a32.S
-@@ -139,9 +139,23 @@ UNWIND(	.cantunwind)
- 	orr	r0, r0, #(SCR_NS | SCR_FIQ) /* Set NS and FIQ bit in SCR */
- 	write_scr r0
- 
-+	dsb
-+	isb
-+
- 	b	.smc_exit
- 
- .smc_ret_to_sec:
-+	/*
-+	 * Make a call for implementing any platform specific monitor
-+	 * mode functionality. We should only return here if the
-+	 * platform doesn't recognize or implement the service. Therefore
-+	 * the platform specific handler should return to the non-secure
-+	 * world when complete.
-+	 */
-+	push	{lr}
-+	bl	sm_platform_handler
-+	pop	{lr}
-+
- 	bic	r1, r1, #(SCR_NS | SCR_FIQ)/* Clear NS and FIQ bit in SCR */
- 	write_scr r1
- 
-diff --git a/core/arch/arm/sm/sm_private.h b/core/arch/arm/sm/sm_private.h
-index 7de8434..ddfb97a 100644
---- a/core/arch/arm/sm/sm_private.h
-+++ b/core/arch/arm/sm/sm_private.h
-@@ -43,5 +43,8 @@ void sm_set_sec_fiq_entry(void);
- /* Sets return values for return to normal world */
- void sm_set_nsec_ret_vals(struct sm_reg_r0_to_r3 *regs, uint32_t r4);
- 
-+/* Weak symbol for platform specific monitor service handling */
-+void sm_platform_handler(void);
-+
- #endif /*SM_PRIVATE_H*/
- 
--- 
-2.7.4
-
diff --git a/meta-arago-distro/recipes-security/optee/optee-os/0003-plat-ti-Move-load-address-to-the-end-of-DRAM-and-inc.patch b/meta-arago-distro/recipes-security/optee/optee-os/0003-plat-ti-Move-load-address-to-the-end-of-DRAM-and-inc.patch
deleted file mode 100644
index 258e821..0000000
--- a/meta-arago-distro/recipes-security/optee/optee-os/0003-plat-ti-Move-load-address-to-the-end-of-DRAM-and-inc.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 21a2e48797bebfe4feb5cbeeb10257687ac30d76 Mon Sep 17 00:00:00 2001
-From: "Andrew F. Davis" <afd@ti.com>
-Date: Fri, 9 Sep 2016 08:13:48 -0500
-Subject: [PATCH 3/6] plat-ti: Move load address to the end of DRAM and
- increase SHMEM
-
-The load address of OPTEE is, by default in U-Boot, the end of DRAM.
-For DRA7xx EVM this is 0xe0000000. Make this change here.
-
-We also move and expand the shared memory allocation as suggested
-by the comment above the definition.
-
-Signed-off-by: Andrew F. Davis <afd@ti.com>
----
- core/arch/arm/plat-ti/platform_config.h | 12 ++++++------
- 1 file changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/core/arch/arm/plat-ti/platform_config.h b/core/arch/arm/plat-ti/platform_config.h
-index c557fc9..ea456db 100644
---- a/core/arch/arm/plat-ti/platform_config.h
-+++ b/core/arch/arm/plat-ti/platform_config.h
-@@ -30,16 +30,16 @@
- 
- #if defined(PLATFORM_FLAVOR_dra7xx)
- 
--#define DRAM0_BASE		0x94C00000
--#define DRAM0_SIZE		0x00800000
-+#define DRAM0_BASE		0xde900000
-+#define DRAM0_SIZE		0x01700000
- 
- #ifdef CFG_WITH_PAGER
- #error Pager not supported on this platform
- #endif /*CFG_WITH_PAGER*/
- 
- /* Location of protected DDR on the DRA7xx platform */
--#define TZDRAM_BASE		0x94D00000
--#define TZDRAM_SIZE		0x00700000
-+#define TZDRAM_BASE		0xde900000
-+#define TZDRAM_SIZE		0x01300000
- 
- #define CFG_TEE_CORE_NB_CORE	2
- 
-@@ -59,8 +59,8 @@
- #define STACK_ALIGNMENT		64
- 
- /* Full GlobalPlatform test suite requires CFG_SHMEM_SIZE to be at least 2MB */
--#define CFG_SHMEM_START		(DRAM0_BASE)
--#define CFG_SHMEM_SIZE		0x100000
-+#define CFG_SHMEM_START		(DRAM0_BASE + 0x01300000)
-+#define CFG_SHMEM_SIZE		0x400000
- 
- #define CFG_TEE_RAM_VA_SIZE	(1024 * 1024)
- 
--- 
-2.7.4
-
diff --git a/meta-arago-distro/recipes-security/optee/optee-os/0004-plat-ti-Add-DRA72x-platform-flavor.patch b/meta-arago-distro/recipes-security/optee/optee-os/0004-plat-ti-Add-DRA72x-platform-flavor.patch
deleted file mode 100644
index bbdd362..0000000
--- a/meta-arago-distro/recipes-security/optee/optee-os/0004-plat-ti-Add-DRA72x-platform-flavor.patch
+++ /dev/null
@@ -1,82 +0,0 @@
-From 35e2a7332239b143a1e9331bad10b2a908c483b4 Mon Sep 17 00:00:00 2001
-From: "Andrew F. Davis" <afd@ti.com>
-Date: Fri, 9 Sep 2016 09:54:57 -0500
-Subject: [PATCH 4/6] plat-ti: Add DRA72x platform flavor
-
-The DRA72x EVM is based on the single core variant of the DRA7xx
-platform. Add this EVM here. We also change the flavor name to
-be the full EVM name as changes to the EVM may change values
-for OPTEE, for instance with the revision C of this EVM the
-memory size and default OPTEE load address change.
-
-Signed-off-by: Andrew F. Davis <afd@ti.com>
----
- core/arch/arm/plat-ti/conf.mk           |  2 +-
- core/arch/arm/plat-ti/platform_config.h | 27 +++++++++++++++++++++++++--
- 2 files changed, 26 insertions(+), 3 deletions(-)
-
-diff --git a/core/arch/arm/plat-ti/conf.mk b/core/arch/arm/plat-ti/conf.mk
-index 7ac154f..b6ee1d3 100644
---- a/core/arch/arm/plat-ti/conf.mk
-+++ b/core/arch/arm/plat-ti/conf.mk
-@@ -1,4 +1,4 @@
--PLATFORM_FLAVOR ?= dra7xx
-+PLATFORM_FLAVOR ?= dra7_evm
- 
- # 32-bit flags
- arm32-platform-cpuarch		:= cortex-a15
-diff --git a/core/arch/arm/plat-ti/platform_config.h b/core/arch/arm/plat-ti/platform_config.h
-index ea456db..fdfe3ac 100644
---- a/core/arch/arm/plat-ti/platform_config.h
-+++ b/core/arch/arm/plat-ti/platform_config.h
-@@ -28,7 +28,7 @@
- #ifndef PLATFORM_CONFIG_H
- #define PLATFORM_CONFIG_H
- 
--#if defined(PLATFORM_FLAVOR_dra7xx)
-+#if defined(PLATFORM_FLAVOR_dra7_evm)
- 
- #define DRAM0_BASE		0xde900000
- #define DRAM0_SIZE		0x01700000
-@@ -37,7 +37,7 @@
- #error Pager not supported on this platform
- #endif /*CFG_WITH_PAGER*/
- 
--/* Location of protected DDR on the DRA7xx platform */
-+/* Location of protected DDR on the DRA7xx EVM */
- #define TZDRAM_BASE		0xde900000
- #define TZDRAM_SIZE		0x01300000
- 
-@@ -51,6 +51,29 @@
- #define GIC_BASE            0x48211000
- #define SECRAM_BASE         0x40200000
- 
-+#elif defined(PLATFORM_FLAVOR_dra72_evm_revc)
-+
-+#define DRAM0_BASE		0xfd900000
-+#define DRAM0_SIZE		0x01700000
-+
-+#ifdef CFG_WITH_PAGER
-+#error Pager not supported on this platform
-+#endif /*CFG_WITH_PAGER*/
-+
-+/* Location of protected DDR on the DRA72x EVM rev. C */
-+#define TZDRAM_BASE		0xfd900000
-+#define TZDRAM_SIZE		0x01300000
-+
-+#define CFG_TEE_CORE_NB_CORE	1
-+
-+/* UART1 */
-+#define CONSOLE_UART_BASE		0x4806A000
-+#define CONSOLE_UART_CLK_IN_HZ	48000000
-+#define UART_BAUDRATE			115200
-+
-+#define GIC_BASE            0x48211000
-+#define SECRAM_BASE         0x40200000
-+
- #else
- #error "Unknown platform flavor"
- #endif
--- 
-2.7.4
-
diff --git a/meta-arago-distro/recipes-security/optee/optee-os/0005-plat-ti-Add-DRA71x-EVM-platform-flavor.patch b/meta-arago-distro/recipes-security/optee/optee-os/0005-plat-ti-Add-DRA71x-EVM-platform-flavor.patch
deleted file mode 100644
index c738da6..0000000
--- a/meta-arago-distro/recipes-security/optee/optee-os/0005-plat-ti-Add-DRA71x-EVM-platform-flavor.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From b647852a366191836e27e75810d968fad0e4a0ca Mon Sep 17 00:00:00 2001
-From: "Andrew F. Davis" <afd@ti.com>
-Date: Tue, 11 Oct 2016 11:22:53 -0500
-Subject: [PATCH 5/6] plat-ti: Add DRA71x EVM platform flavor
-
-The DRA71x EVM flavor is based on the DRA72x EVM exept that is uses
-the DRA71x SoC. Add this EVM here.
-
-Signed-off-by: Andrew F. Davis <afd@ti.com>
----
- core/arch/arm/plat-ti/platform_config.h | 23 +++++++++++++++++++++++
- 1 file changed, 23 insertions(+)
-
-diff --git a/core/arch/arm/plat-ti/platform_config.h b/core/arch/arm/plat-ti/platform_config.h
-index fdfe3ac..045cb1a 100644
---- a/core/arch/arm/plat-ti/platform_config.h
-+++ b/core/arch/arm/plat-ti/platform_config.h
-@@ -74,6 +74,29 @@
- #define GIC_BASE            0x48211000
- #define SECRAM_BASE         0x40200000
- 
-+#elif defined(PLATFORM_FLAVOR_dra71_evm)
-+
-+#define DRAM0_BASE		0xfd900000
-+#define DRAM0_SIZE		0x01700000
-+
-+#ifdef CFG_WITH_PAGER
-+#error Pager not supported on this platform
-+#endif /*CFG_WITH_PAGER*/
-+
-+/* Location of protected DDR on the DRA71x EVM */
-+#define TZDRAM_BASE		0xfd900000
-+#define TZDRAM_SIZE		0x01300000
-+
-+#define CFG_TEE_CORE_NB_CORE	1
-+
-+/* UART1 */
-+#define CONSOLE_UART_BASE		0x4806A000
-+#define CONSOLE_UART_CLK_IN_HZ	48000000
-+#define UART_BAUDRATE			115200
-+
-+#define GIC_BASE            0x48211000
-+#define SECRAM_BASE         0x40200000
-+
- #else
- #error "Unknown platform flavor"
- #endif
--- 
-2.7.4
-
diff --git a/meta-arago-distro/recipes-security/optee/optee-os/0006-plat-ti-Add-AM57xx-EVM-platform-flavor.patch b/meta-arago-distro/recipes-security/optee/optee-os/0006-plat-ti-Add-AM57xx-EVM-platform-flavor.patch
deleted file mode 100644
index ee28f54..0000000
--- a/meta-arago-distro/recipes-security/optee/optee-os/0006-plat-ti-Add-AM57xx-EVM-platform-flavor.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 7f02156690e01573ae1ffe27593cd2031cb8ce77 Mon Sep 17 00:00:00 2001
-From: "Andrew F. Davis" <afd@ti.com>
-Date: Fri, 9 Sep 2016 10:00:57 -0500
-Subject: [PATCH 6/6] plat-ti: Add AM57xx EVM platform flavor
-
-The AM57xx EVM flavor is based on the DRA7x EVM exept that is has more
-memory and uses a different UART port. Add this EVM here.
-
-Signed-off-by: Andrew F. Davis <afd@ti.com>
----
- core/arch/arm/plat-ti/platform_config.h | 23 +++++++++++++++++++++++
- 1 file changed, 23 insertions(+)
-
-diff --git a/core/arch/arm/plat-ti/platform_config.h b/core/arch/arm/plat-ti/platform_config.h
-index 045cb1a..559cd9e 100644
---- a/core/arch/arm/plat-ti/platform_config.h
-+++ b/core/arch/arm/plat-ti/platform_config.h
-@@ -97,6 +97,29 @@
- #define GIC_BASE            0x48211000
- #define SECRAM_BASE         0x40200000
- 
-+#elif defined(PLATFORM_FLAVOR_am57xx_evm)
-+
-+#define DRAM0_BASE		0xfe900000
-+#define DRAM0_SIZE		0x01700000
-+
-+#ifdef CFG_WITH_PAGER
-+#error Pager not supported on this platform
-+#endif /*CFG_WITH_PAGER*/
-+
-+/* Location of protected DDR on the AM57xx EVM */
-+#define TZDRAM_BASE		0xfe900000
-+#define TZDRAM_SIZE		0x01300000
-+
-+#define CFG_TEE_CORE_NB_CORE	2
-+
-+/* UART3 */
-+#define CONSOLE_UART_BASE		0x48020000
-+#define CONSOLE_UART_CLK_IN_HZ	48000000
-+#define UART_BAUDRATE			115200
-+
-+#define GIC_BASE            0x48211000
-+#define SECRAM_BASE         0x40200000
-+
- #else
- #error "Unknown platform flavor"
- #endif
--- 
-2.7.4
-
diff --git a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
index 71f412b..b305ef9 100644
--- a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
+++ b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
@@ -1,10 +1,14 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PR_append = ".arago4"
+PR_append = ".arago5"
 
 is_armv7 = "1"
 
-SRCREV = "8dceff9b18e7c2e0cb879ea458e85a1806dff447"
+SRC_URI = "git://git.ti.com/optee/ti-optee-os.git;branch=${BRANCH} \
+           file://0001-allow-setting-sysroot-for-libgcc-lookup.patch \
+"
+BRANCH = "ti_optee_os"
+SRCREV = "f41d1cfddf3cba6eb3ff91c399bf6059eaa6297e"
 
 EXTRA_OEMAKE = "CROSS_COMPILE_core=${HOST_PREFIX}  \
                 CROSS_COMPILE_ta_arm32=${HOST_PREFIX}  \
@@ -13,27 +17,15 @@ EXTRA_OEMAKE = "CROSS_COMPILE_core=${HOST_PREFIX}  \
                 CFG_TEE_TA_LOG_LEVEL=0 \
 "
 
-SRC_URI += " \
-    file://0001-plat-ti-Fixed-issues-with-MMU-mapping.patch \
-    file://0002-monitor-update-to-support-platform-services.patch \
-    file://0003-plat-ti-Move-load-address-to-the-end-of-DRAM-and-inc.patch \
-    file://0004-plat-ti-Add-DRA72x-platform-flavor.patch \
-    file://0005-plat-ti-Add-DRA71x-EVM-platform-flavor.patch \
-    file://0006-plat-ti-Add-AM57xx-EVM-platform-flavor.patch \
-"
-
 do_compile() {
     unset LDFLAGS
     export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
-    for flavor in ${OPTEEFLAVOR}; do
-        oe_runmake clean PLATFORM=${OPTEEMACHINE} PLATFORM_FLAVOR=$flavor
-        oe_runmake all PLATFORM=${OPTEEMACHINE} PLATFORM_FLAVOR=$flavor
-        ( cd out/arm-plat-${OPTEEOUTPUTMACHINE}/core/; \
-            ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh tee.bin tee.bin.signed; \
-            normfl=`echo $flavor | tr "_" "-"`
-            mv tee.bin.signed $normfl.optee; \
-        )
-    done
+    oe_runmake all PLATFORM=${OPTEEMACHINE} PLATFORM_FLAVOR=${OPTEEFLAVOR}
+    ( cd out/arm-plat-${OPTEEOUTPUTMACHINE}/core/; \
+        ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh tee.bin tee.bin.signed; \
+        normfl=`echo ${OPTEEFLAVOR} | tr "_" "-"`
+        mv tee.bin.signed $normfl.optee; \
+    )
 }
 
 do_install() {
-- 
2.7.4


