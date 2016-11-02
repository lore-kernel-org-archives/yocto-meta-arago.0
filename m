Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id DAD26529F2
	for <meta-arago@arago-project.org>;
	Wed,  2 Nov 2016 21:44:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E1E4D20AB4;
	Wed,  2 Nov 2016 21:44:40 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id mmVQaUZdBM6f; Wed,  2 Nov 2016 21:44:40 +0000 (UTC)
Received: from gandalf.denix.org (pool-100-15-106-107.washdc.fios.verizon.net
	[100.15.106.107])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A7C5C209DE;
	Wed,  2 Nov 2016 21:44:38 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by gandalf.denix.org (Postfix) with ESMTP id ADDBF162197;
	Wed,  2 Nov 2016 17:44:37 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed,  2 Nov 2016 17:44:32 -0400
Message-Id: <1478123072-32733-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Cc: "Andrew F . Davis" <afd@ti.com>
Subject: [PATCH] optee-os: one of the patches got lost in last update
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
X-List-Received-Date: Wed, 02 Nov 2016 21:44:41 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Cc: Andrew F. Davis <afd@ti.com>
---
 ...001-plat-ti-Fixed-issues-with-MMU-mapping.patch | 43 ++++++++++++++++++++++
 ...itor-update-to-support-platform-services.patch} |  2 +-
 ...-load-address-to-the-end-of-DRAM-and-inc.patch} |  2 +-
 ... 0004-plat-ti-Add-DRA72x-platform-flavor.patch} |  2 +-
 ...5-plat-ti-Add-DRA71x-EVM-platform-flavor.patch} |  2 +-
 ...6-plat-ti-Add-AM57xx-EVM-platform-flavor.patch} |  2 +-
 .../recipes-security/optee/optee-os_git.bbappend   | 13 ++++---
 7 files changed, 55 insertions(+), 11 deletions(-)
 create mode 100644 meta-arago-distro/recipes-security/optee/optee-os/0001-plat-ti-Fixed-issues-with-MMU-mapping.patch
 rename meta-arago-distro/recipes-security/optee/optee-os/{0001-monitor-update-to-support-platform-services.patch => 0002-monitor-update-to-support-platform-services.patch} (99%)
 rename meta-arago-distro/recipes-security/optee/optee-os/{0002-plat-ti-Move-load-address-to-the-end-of-DRAM-and-inc.patch => 0003-plat-ti-Move-load-address-to-the-end-of-DRAM-and-inc.patch} (96%)
 rename meta-arago-distro/recipes-security/optee/optee-os/{0003-plat-ti-Add-DRA72x-platform-flavor.patch => 0004-plat-ti-Add-DRA72x-platform-flavor.patch} (97%)
 rename meta-arago-distro/recipes-security/optee/optee-os/{0004-plat-ti-Add-DRA71x-EVM-platform-flavor.patch => 0005-plat-ti-Add-DRA71x-EVM-platform-flavor.patch} (95%)
 rename meta-arago-distro/recipes-security/optee/optee-os/{0005-plat-ti-Add-AM57xx-EVM-platform-flavor.patch => 0006-plat-ti-Add-AM57xx-EVM-platform-flavor.patch} (95%)

diff --git a/meta-arago-distro/recipes-security/optee/optee-os/0001-plat-ti-Fixed-issues-with-MMU-mapping.patch b/meta-arago-distro/recipes-security/optee/optee-os/0001-plat-ti-Fixed-issues-with-MMU-mapping.patch
new file mode 100644
index 0000000..89cd5a9
--- /dev/null
+++ b/meta-arago-distro/recipes-security/optee/optee-os/0001-plat-ti-Fixed-issues-with-MMU-mapping.patch
@@ -0,0 +1,43 @@
+From 15be5bf09e5a0a979a926806ca8591500783482b Mon Sep 17 00:00:00 2001
+From: Harinarayan Bhatta <harinarayan@ti.com>
+Date: Wed, 10 Aug 2016 11:13:53 +0530
+Subject: [PATCH 1/6] plat-ti: Fixed issues with MMU mapping
+
+Signed-off-by: Harinarayan Bhatta <harinarayan@ti.com>
+---
+ core/arch/arm/plat-ti/main.c | 9 +++++----
+ 1 file changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/core/arch/arm/plat-ti/main.c b/core/arch/arm/plat-ti/main.c
+index fe2a1d2..8c26503 100644
+--- a/core/arch/arm/plat-ti/main.c
++++ b/core/arch/arm/plat-ti/main.c
+@@ -77,7 +77,7 @@ static vaddr_t console_base(void)
+ 
+ 	if (cpu_mmu_enabled()) {
+ 		if (!va)
+-			va = phys_to_virt(CONSOLE_UART_BASE, MEM_AREA_IO_SEC);
++			va = phys_to_virt(CONSOLE_UART_BASE, MEM_AREA_IO_NSEC);
+ 		return (vaddr_t)va;
+ 	}
+ 	return CONSOLE_UART_BASE;
+@@ -130,12 +130,13 @@ struct plat_nsec_ctx {
+ 
+ void init_sec_mon(unsigned long nsec_entry)
+ {
+-	struct plat_nsec_ctx *plat_ctx = (struct plat_nsec_ctx *)nsec_entry;
++	struct plat_nsec_ctx *plat_ctx = (struct plat_nsec_ctx *)
++		(phys_to_virt(nsec_entry, MEM_AREA_IO_SEC));
+ 	struct sm_nsec_ctx *nsec_ctx;
+ 
+ 	/* Invalidate cache to fetch data from external memory */
+-	cache_maintenance_l1(DCACHE_AREA_INVALIDATE, (void *)nsec_entry,
+-		sizeof(struct plat_nsec_ctx));
++	cache_maintenance_l1(DCACHE_AREA_INVALIDATE, (void *)plat_ctx,
++		sizeof(*plat_ctx));
+ 
+ 	/* Initialize secure monitor */
+ 	nsec_ctx = sm_get_nsec_ctx();
+-- 
+2.7.4
+
diff --git a/meta-arago-distro/recipes-security/optee/optee-os/0001-monitor-update-to-support-platform-services.patch b/meta-arago-distro/recipes-security/optee/optee-os/0002-monitor-update-to-support-platform-services.patch
similarity index 99%
rename from meta-arago-distro/recipes-security/optee/optee-os/0001-monitor-update-to-support-platform-services.patch
rename to meta-arago-distro/recipes-security/optee/optee-os/0002-monitor-update-to-support-platform-services.patch
index 04e8f3e..d9986c6 100644
--- a/meta-arago-distro/recipes-security/optee/optee-os/0001-monitor-update-to-support-platform-services.patch
+++ b/meta-arago-distro/recipes-security/optee/optee-os/0002-monitor-update-to-support-platform-services.patch
@@ -1,7 +1,7 @@
 From c8b358a0870c4cd63039d40a4cd68a632c18c9d6 Mon Sep 17 00:00:00 2001
 From: Daniel Allred <d-allred@ti.com>
 Date: Wed, 19 Aug 2015 16:01:26 -0500
-Subject: [PATCH 1/5] monitor: update to support platform services
+Subject: [PATCH 2/6] monitor: update to support platform services
 
 Added the capability for a platform to plugin its own services,
 often legacy services for compatibility purposes. Added these services
diff --git a/meta-arago-distro/recipes-security/optee/optee-os/0002-plat-ti-Move-load-address-to-the-end-of-DRAM-and-inc.patch b/meta-arago-distro/recipes-security/optee/optee-os/0003-plat-ti-Move-load-address-to-the-end-of-DRAM-and-inc.patch
similarity index 96%
rename from meta-arago-distro/recipes-security/optee/optee-os/0002-plat-ti-Move-load-address-to-the-end-of-DRAM-and-inc.patch
rename to meta-arago-distro/recipes-security/optee/optee-os/0003-plat-ti-Move-load-address-to-the-end-of-DRAM-and-inc.patch
index df440bc..258e821 100644
--- a/meta-arago-distro/recipes-security/optee/optee-os/0002-plat-ti-Move-load-address-to-the-end-of-DRAM-and-inc.patch
+++ b/meta-arago-distro/recipes-security/optee/optee-os/0003-plat-ti-Move-load-address-to-the-end-of-DRAM-and-inc.patch
@@ -1,7 +1,7 @@
 From 21a2e48797bebfe4feb5cbeeb10257687ac30d76 Mon Sep 17 00:00:00 2001
 From: "Andrew F. Davis" <afd@ti.com>
 Date: Fri, 9 Sep 2016 08:13:48 -0500
-Subject: [PATCH 2/5] plat-ti: Move load address to the end of DRAM and
+Subject: [PATCH 3/6] plat-ti: Move load address to the end of DRAM and
  increase SHMEM
 
 The load address of OPTEE is, by default in U-Boot, the end of DRAM.
diff --git a/meta-arago-distro/recipes-security/optee/optee-os/0003-plat-ti-Add-DRA72x-platform-flavor.patch b/meta-arago-distro/recipes-security/optee/optee-os/0004-plat-ti-Add-DRA72x-platform-flavor.patch
similarity index 97%
rename from meta-arago-distro/recipes-security/optee/optee-os/0003-plat-ti-Add-DRA72x-platform-flavor.patch
rename to meta-arago-distro/recipes-security/optee/optee-os/0004-plat-ti-Add-DRA72x-platform-flavor.patch
index a43daea..bbdd362 100644
--- a/meta-arago-distro/recipes-security/optee/optee-os/0003-plat-ti-Add-DRA72x-platform-flavor.patch
+++ b/meta-arago-distro/recipes-security/optee/optee-os/0004-plat-ti-Add-DRA72x-platform-flavor.patch
@@ -1,7 +1,7 @@
 From 35e2a7332239b143a1e9331bad10b2a908c483b4 Mon Sep 17 00:00:00 2001
 From: "Andrew F. Davis" <afd@ti.com>
 Date: Fri, 9 Sep 2016 09:54:57 -0500
-Subject: [PATCH 3/5] plat-ti: Add DRA72x platform flavor
+Subject: [PATCH 4/6] plat-ti: Add DRA72x platform flavor
 
 The DRA72x EVM is based on the single core variant of the DRA7xx
 platform. Add this EVM here. We also change the flavor name to
diff --git a/meta-arago-distro/recipes-security/optee/optee-os/0004-plat-ti-Add-DRA71x-EVM-platform-flavor.patch b/meta-arago-distro/recipes-security/optee/optee-os/0005-plat-ti-Add-DRA71x-EVM-platform-flavor.patch
similarity index 95%
rename from meta-arago-distro/recipes-security/optee/optee-os/0004-plat-ti-Add-DRA71x-EVM-platform-flavor.patch
rename to meta-arago-distro/recipes-security/optee/optee-os/0005-plat-ti-Add-DRA71x-EVM-platform-flavor.patch
index 6110201..c738da6 100644
--- a/meta-arago-distro/recipes-security/optee/optee-os/0004-plat-ti-Add-DRA71x-EVM-platform-flavor.patch
+++ b/meta-arago-distro/recipes-security/optee/optee-os/0005-plat-ti-Add-DRA71x-EVM-platform-flavor.patch
@@ -1,7 +1,7 @@
 From b647852a366191836e27e75810d968fad0e4a0ca Mon Sep 17 00:00:00 2001
 From: "Andrew F. Davis" <afd@ti.com>
 Date: Tue, 11 Oct 2016 11:22:53 -0500
-Subject: [PATCH 4/5] plat-ti: Add DRA71x EVM platform flavor
+Subject: [PATCH 5/6] plat-ti: Add DRA71x EVM platform flavor
 
 The DRA71x EVM flavor is based on the DRA72x EVM exept that is uses
 the DRA71x SoC. Add this EVM here.
diff --git a/meta-arago-distro/recipes-security/optee/optee-os/0005-plat-ti-Add-AM57xx-EVM-platform-flavor.patch b/meta-arago-distro/recipes-security/optee/optee-os/0006-plat-ti-Add-AM57xx-EVM-platform-flavor.patch
similarity index 95%
rename from meta-arago-distro/recipes-security/optee/optee-os/0005-plat-ti-Add-AM57xx-EVM-platform-flavor.patch
rename to meta-arago-distro/recipes-security/optee/optee-os/0006-plat-ti-Add-AM57xx-EVM-platform-flavor.patch
index 4286343..ee28f54 100644
--- a/meta-arago-distro/recipes-security/optee/optee-os/0005-plat-ti-Add-AM57xx-EVM-platform-flavor.patch
+++ b/meta-arago-distro/recipes-security/optee/optee-os/0006-plat-ti-Add-AM57xx-EVM-platform-flavor.patch
@@ -1,7 +1,7 @@
 From 7f02156690e01573ae1ffe27593cd2031cb8ce77 Mon Sep 17 00:00:00 2001
 From: "Andrew F. Davis" <afd@ti.com>
 Date: Fri, 9 Sep 2016 10:00:57 -0500
-Subject: [PATCH 5/5] plat-ti: Add AM57xx EVM platform flavor
+Subject: [PATCH 6/6] plat-ti: Add AM57xx EVM platform flavor
 
 The AM57xx EVM flavor is based on the DRA7x EVM exept that is has more
 memory and uses a different UART port. Add this EVM here.
diff --git a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
index b31b55a..71f412b 100644
--- a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
+++ b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
@@ -1,6 +1,6 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PR_append = ".arago3"
+PR_append = ".arago4"
 
 is_armv7 = "1"
 
@@ -14,11 +14,12 @@ EXTRA_OEMAKE = "CROSS_COMPILE_core=${HOST_PREFIX}  \
 "
 
 SRC_URI += " \
-    file://0001-monitor-update-to-support-platform-services.patch \
-    file://0002-plat-ti-Move-load-address-to-the-end-of-DRAM-and-inc.patch \
-    file://0003-plat-ti-Add-DRA72x-platform-flavor.patch \
-    file://0004-plat-ti-Add-DRA71x-EVM-platform-flavor.patch \
-    file://0005-plat-ti-Add-AM57xx-EVM-platform-flavor.patch \
+    file://0001-plat-ti-Fixed-issues-with-MMU-mapping.patch \
+    file://0002-monitor-update-to-support-platform-services.patch \
+    file://0003-plat-ti-Move-load-address-to-the-end-of-DRAM-and-inc.patch \
+    file://0004-plat-ti-Add-DRA72x-platform-flavor.patch \
+    file://0005-plat-ti-Add-DRA71x-EVM-platform-flavor.patch \
+    file://0006-plat-ti-Add-AM57xx-EVM-platform-flavor.patch \
 "
 
 do_compile() {
-- 
2.7.4


