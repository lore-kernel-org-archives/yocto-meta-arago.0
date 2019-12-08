Return-Path: <yuanzhao@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 1058A529B5
	for <meta-arago@arago-project.org>;
	Sun,  8 Dec 2019 05:26:07 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB85OXrr118567
	for <meta-arago@arago-project.org>; Sat, 7 Dec 2019 23:24:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1575782673;
	bh=BDf6BjzGYnHHeitza++lbDSDELmsB/PHWTow61y8jso=;
	h=From:To:CC:Subject:Date;
	b=bEu+6LdkSox50DetQuW1fHn6KuL0vca2ZA7djSsRE08/3b4HZBeLHbYRNIdmhmxvH
	Rv3Bmvnwr+W202jW8CtxkMZL/QeiJwQk+qAs9kfcNkcY7Tu8nEqA3XeDZLO4JxZ2B3
	niVqFX4hIJO1l6tp9MMo7Vo5kiElFkhn5sZMIexk=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xB85OXIp103638
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Sat, 7 Dec 2019 23:24:33 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Sat, 7 Dec 2019 23:24:33 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Sat, 7 Dec 2019 23:24:33 -0600
Received: from sdomc-build0.hou.asp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB85OWnp102511;
	Sat, 7 Dec 2019 23:24:32 -0600
From: Yuan Zhao <yuanzhao@ti.com>
To: <meta-arago@arago-project.org>
Date: Sat, 7 Dec 2019 23:24:25 -0600
Message-ID: <20191208052425.32150-1-yuanzhao@ti.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] ocl: update version to 01.02.00.00
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
X-List-Received-Date: Sun, 08 Dec 2019 05:26:07 -0000
Content-Type: text/plain

- Full OpenCL 1.2 support

Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
---
 ...rveout-block-allocation-in-resource-table.patch | 181 ---------------------
 meta-arago-extras/recipes-ti/ocl/ocl.inc           |   5 +-
 .../recipes-ti/ocl/opencl-monitor-ipu_git.bb       |   3 +-
 .../recipes-ti/ocl/opencl-monitor_git.bb           |   3 +-
 4 files changed, 4 insertions(+), 188 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-ti/ocl/files/0001-Fix-carveout-block-allocation-in-resource-table.patch

diff --git a/meta-arago-extras/recipes-ti/ocl/files/0001-Fix-carveout-block-allocation-in-resource-table.patch b/meta-arago-extras/recipes-ti/ocl/files/0001-Fix-carveout-block-allocation-in-resource-table.patch
deleted file mode 100644
index 54e5b542..00000000
--- a/meta-arago-extras/recipes-ti/ocl/files/0001-Fix-carveout-block-allocation-in-resource-table.patch
+++ /dev/null
@@ -1,181 +0,0 @@
-ocl: Fix carveout block allocation in resource table
-
-Upstream-Status: Submitted
-
-- Carveout blocks in the resource table could be allocated in two different
-  ways.  One is CMA (with reserved memory marked as "reusable"), which will
-  use 1MB alignment.  The other is DMA pool (with reserved memory marked as
-  "no-map"), which will round up block size and alignment to power of 2.
-  In DMA pool case, if not careful, carveout blocks could end up not able
-  to be allocated in the available memory, while CMA succeeds.
-- This commit addresses the possibe carveout block allocation failure
-  in DMA pool case. In particular,
-  - AM57 DSP: 6MB carveout block is split into 4MB and 2MB.
-    - Without this fix, DMA pool allocation actually will fail on DSP2
-      due to its smaller 8MB reserved memory, with its first 1MB being
-      allocated to VRING/IPC.
-  - AM57 IPU1: slight carveout block size adjustment.
-    - Take this opportunity to make code/data blocks tighter, so that
-      unused memory can be returned to Linux in "reusable" allocation.
-- MCT-1225, LCPD-17021, LCPD-17331
-
-Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
----
- monitor/cmds/monitor.am57x.cmd                |  8 ++---
- monitor/platforms/am57x/Platform.xdc          | 14 +++++---
- monitor/src/custom_rsc_table_vayu_dsp.h       | 32 +++++++++++++++----
- .../cfg/mem_segment_definition_linux.xs       |  8 ++---
- 4 files changed, 43 insertions(+), 19 deletions(-)
-
-diff --git a/monitor/cmds/monitor.am57x.cmd b/monitor/cmds/monitor.am57x.cmd
-index 298a5d1..f41f1a8 100644
---- a/monitor/cmds/monitor.am57x.cmd
-+++ b/monitor/cmds/monitor.am57x.cmd
-@@ -181,11 +181,11 @@ SECTIONS
-                 "nullres.ae66"      (.fardata)
-                 "nullres.ae66"      (.far)
-     } > L2SRAM
--    .localddr: load >> DDR3
--    .ctools_core_private: load >> DDR3
-+    .localddr: load >> DDR3_FC
-+    .ctools_core_private: load >> DDR3_FC
- 
--    .fardata: load >> DDR3
--    .far: load >> DDR3
-+    .fardata: load >> DDR3_FC
-+    .far: load >> DDR3_FC
-     .gdb_server: load = L2SRAM, type = NOLOAD, fill = 0x0
- }
- 
-diff --git a/monitor/platforms/am57x/Platform.xdc b/monitor/platforms/am57x/Platform.xdc
-index e2b4c33..e77129f 100644
---- a/monitor/platforms/am57x/Platform.xdc
-+++ b/monitor/platforms/am57x/Platform.xdc
-@@ -36,20 +36,24 @@ config ti.platforms.generic.Platform.Instance CPU =
- 
-       /*-----------------------------------------------------------------------
-       * DDR Related regions
-+      * all text in DDR3, data in DDR3 and DDR3_FC
-+      * Remoteproc Carveout memory block are allocated at 1MB boundary by
-+      * CMA allocator, however, by power of 2 size and boundary by DMA pool
-+      * allocator.  Hence, making blocks of power of 2 sizes to reduce gaps
-       *----------------------------------------------------------------------*/
-       [ "DDR3",         { name: "DDR3", 
-                           base: 0xFEB00000,
--			              len:  0x004f3000,
-+                          len:  0x00400000,
-                           space: "code/data", 
--			              access: "RWX", } ],
-+                          access: "RWX", } ],
- 
-       /* Each DSP core uses its own framework components data structure
-          via remoteproc memory allocation for carveout */
-       [ "DDR3_FC",     { name: "DDR3_FC",
--                         base: 0xFEFF3000,
--			             len:  0x0000D000,
-+                         base: 0xFEF00000,
-+                         len:  0x00100000,
-                          space: "code/data",
--			             access: "RWX", } ],
-+                         access: "RWX", } ],
- 
- 
-       /* DDR3_NC, DDR3_STACK and DDR3_HEAP placed in the first 32MB of
-diff --git a/monitor/src/custom_rsc_table_vayu_dsp.h b/monitor/src/custom_rsc_table_vayu_dsp.h
-index 898026c..4752bea 100644
---- a/monitor/src/custom_rsc_table_vayu_dsp.h
-+++ b/monitor/src/custom_rsc_table_vayu_dsp.h
-@@ -115,6 +115,19 @@
- // DDR3, DDR3_FC and SR_0 regions in platforms/am57/Platform.xdc
- #define DSP_MEM_DDR             0xFEB00000
- #define DSP_MEM_DDR_SIZE        (SZ_1M * 6)
-+/*
-+ * To avoid issues with allocation failures with Linux carveout regions, need
-+ * to use the RSC_CARVEOUT entries with power of 2 page order sizes and aligned
-+ * on the same page order.
-+ * The size and the alignment order of entries in the resource table plays a
-+ * part in avoiding gaps in allocation
-+ */
-+#define DSP_MEM_DDR0            0xFEB00000
-+#define DSP_MEM_DDR0_SIZE       (SZ_1M * 4)
-+#define DSP_MEM_DDR1            0xFEF00000
-+#define DSP_MEM_DDR1_SIZE       (SZ_1M * 2)
-+
-+
- 
- // CMEM buffers mapped by MMU to PHYS_MEM_IOBUFS
- // If DSP_MEM_IOBUFS is modified, corresponding changes must be made
-@@ -157,7 +170,7 @@
- struct my_resource_table {
-     struct resource_table base;
- 
--    UInt32 offset[20];  /* Should match 'num' in actual definition */
-+    UInt32 offset[21];  /* Should match 'num' in actual definition */
- 
-     /* rpmsg vdev entry */
-     struct fw_rsc_vdev rpmsg_vdev;
-@@ -165,7 +178,8 @@ struct my_resource_table {
-     struct fw_rsc_vdev_vring rpmsg_vring1;
- 
-     /* text carveout entry */
--    struct fw_rsc_carveout ddr_cout;
-+    struct fw_rsc_carveout ddr0_cout;
-+    struct fw_rsc_carveout ddr1_cout;
- 
-     /* trace entry */
-     struct fw_rsc_trace trace;
-@@ -224,12 +238,13 @@ extern char ti_trace_SysMin_Module_State_0_outbuf__A;
- 
- struct my_resource_table ti_ipc_remoteproc_ResourceTable = {
-     1,      /* we're the first version that implements this */
--    20,     /* number of entries in the table */
-+    21,     /* number of entries in the table */
-     0, 0,   /* reserved, must be zero */
-     /* offsets to entries */
-     {
-         offsetof(struct my_resource_table, rpmsg_vdev),
--        offsetof(struct my_resource_table, ddr_cout),
-+        offsetof(struct my_resource_table, ddr0_cout),
-+        offsetof(struct my_resource_table, ddr1_cout),
-         offsetof(struct my_resource_table, trace),
-         offsetof(struct my_resource_table, devmem0),
-         offsetof(struct my_resource_table, devmem1),
-@@ -262,8 +277,13 @@ struct my_resource_table ti_ipc_remoteproc_ResourceTable = {
- 
-     {
-         TYPE_CARVEOUT,
--        DSP_MEM_DDR, 0,
--        DSP_MEM_DDR_SIZE, 0, 0, "DSP_MEM_DDR",
-+        DSP_MEM_DDR0, 0,
-+        DSP_MEM_DDR0_SIZE, 0, 0, "DSP_MEM_DDR0",
-+    },
-+    {
-+        TYPE_CARVEOUT,
-+        DSP_MEM_DDR1, 0,
-+        DSP_MEM_DDR1_SIZE, 0, 0, "DSP_MEM_DDR1",
-     },
- 
-     {
-diff --git a/monitor_ipu/cfg/mem_segment_definition_linux.xs b/monitor_ipu/cfg/mem_segment_definition_linux.xs
-index bcaad52..a76b749 100644
---- a/monitor_ipu/cfg/mem_segment_definition_linux.xs
-+++ b/monitor_ipu/cfg/mem_segment_definition_linux.xs
-@@ -112,11 +112,11 @@ EVE4_SRAM_SIZE              = 1*MB;
- 
- /* Allocating virtual addresses for carveouts */
- /* IPU1 code, data, heap,  IPC data: trace buf, exc data, pm data */
--IPU1_CODE_SIZE              = 5*MB;
--IPU1_DATA_SIZE              = 4*MB;
--IPU1_HEAP_SIZE              = 11*MB;
-+IPU1_CODE_SIZE              = 1*MB;
-+IPU1_DATA_SIZE              = 2*MB;
-+IPU1_HEAP_SIZE              = 10*MB;
- 
--IPU1_CODE_ADDR              = 0x9D100000;
-+IPU1_CODE_ADDR              = 0x9D300000;
- IPU1_DATA_ADDR              = IPU1_CODE_ADDR + IPU1_CODE_SIZE;
- IPU1_HEAP_ADDR              = IPU1_DATA_ADDR + IPU1_DATA_SIZE;
- 
--- 
-2.17.1
-
diff --git a/meta-arago-extras/recipes-ti/ocl/ocl.inc b/meta-arago-extras/recipes-ti/ocl/ocl.inc
index 9193c488..0a6dccc4 100644
--- a/meta-arago-extras/recipes-ti/ocl/ocl.inc
+++ b/meta-arago-extras/recipes-ti/ocl/ocl.inc
@@ -1,5 +1,5 @@
 # patch version at the end needs to be in double digits
-PV = "1.1.19.02"
+PV = "1.2.00.00"
 INC_PR = "r0"
 
 LIC_FILES_CHKSUM = "file://../debian/copyright;md5=2e3965a73a8a49c23836467266120dff"
@@ -10,8 +10,7 @@ OCL_GIT_URI = "git://git.ti.com/opencl/ti-opencl.git"
 OCL_GIT_PROTOCOL = "git"
 OCL_GIT_BRANCH = "master"
 
-
-OCL_SRCREV = "b178e67080afff815f8f7cccb123176cf6048322"
+OCL_SRCREV = "301ecd37ac5553a8c94c87a0083b8d929e1d1a1e"
 
 BRANCH = "${OCL_GIT_BRANCH}"
 SRC_URI = "${OCL_GIT_URI};protocol=${OCL_GIT_PROTOCOL};branch=${BRANCH}"
diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-monitor-ipu_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl-monitor-ipu_git.bb
index 7aed8f9e..98103222 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl-monitor-ipu_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl-monitor-ipu_git.bb
@@ -5,8 +5,7 @@ LICENSE = "BSD"
 include ocl.inc
 require recipes-ti/includes/arago-paths.inc
 
-PR = "${INC_PR}.1"
-SRC_URI += "file://0001-Fix-carveout-block-allocation-in-resource-table.patch;patchdir=.."
+PR = "${INC_PR}.0"
 
 inherit update-alternatives
 
diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
index a30ffd38..0ab21a1a 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
@@ -5,8 +5,7 @@ LICENSE = "BSD"
 include ocl.inc
 require recipes-ti/includes/arago-paths.inc
 
-PR = "${INC_PR}.1"
-SRC_URI += "file://0001-Fix-carveout-block-allocation-in-resource-table.patch;patchdir=.."
+PR = "${INC_PR}.0"
 
 inherit update-alternatives
 
-- 
2.14.1


