Return-Path: <yuanzhao@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 349BF520E2
	for <meta-arago@arago-project.org>;
	Fri, 14 Feb 2020 15:39:44 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01EFbl3Q069427
	for <meta-arago@arago-project.org>; Fri, 14 Feb 2020 09:37:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1581694667;
	bh=Bi+5EUTjqKx1x/7RzWdDHADNm0kmysxxhxCI+YdfiXM=;
	h=From:To:CC:Subject:Date;
	b=r5yvxsVuDqOkM5V4hy4Rtjdhezi2BuLjn3m7nKh4q7a3xZ4MwFRQWmgXzeGP6xe6G
	FUoRx1znyj8TsaiWDa+Tnrk0b9U4/lbQTYd4Rmtllb4xtSqDg6uJT1H+Z/AGan7HXX
	WSNWIMmkxgun3nwQetoILHVawxWL4ySZwdOV1Jvw=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01EFbl2j120361
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 14 Feb 2020 09:37:47 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Fri, 14 Feb 2020 09:37:46 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Fri, 14 Feb 2020 09:37:47 -0600
Received: from sdomc-build0.hou.asp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01EFbkUS078594;
	Fri, 14 Feb 2020 09:37:46 -0600
From: Yuan Zhao <yuanzhao@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 14 Feb 2020 09:37:34 -0600
Message-ID: <20200214153734.39207-1-yuanzhao@ti.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] ocl: Fix VRING in rsc table for new Linux kernel
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
X-List-Received-Date: Fri, 14 Feb 2020 15:39:44 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

- New linux kernel 4.20 requires VRING device address in the resource
  table be dynamically allocated.

Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
---
 ...-resource-table-for-new-Linux-kernel.patch | 95 +++++++++++++++++++
 .../recipes-ti/ocl/opencl-monitor-ipu_git.bb  |  3 +-
 .../recipes-ti/ocl/opencl-monitor_git.bb      |  3 +-
 3 files changed, 99 insertions(+), 2 deletions(-)
 create mode 100644 meta-arago-extras/recipes-ti/ocl/files/0001-Update-VRING-in-resource-table-for-new-Linux-kernel.patch

diff --git a/meta-arago-extras/recipes-ti/ocl/files/0001-Update-VRING-in-resource-table-for-new-Linux-kernel.patch b/meta-arago-extras/recipes-ti/ocl/files/0001-Update-VRING-in-resource-table-for-new-Linux-kernel.patch
new file mode 100644
index 00000000..fcdb2215
--- /dev/null
+++ b/meta-arago-extras/recipes-ti/ocl/files/0001-Update-VRING-in-resource-table-for-new-Linux-kernel.patch
@@ -0,0 +1,95 @@
+ocl: Update VRING in resource table for new Linux kernel
+
+- Mark the vring device addresses as FW_RSC_ADDR_ANY, so that Linux kernel
+  knows it needs to update these to the actual dynamically allocated
+  memory locations. The virtqueue driver itself will poll for the
+  completion status of this update.
+- The change is backward compatible with 4.19 kernel
+
+Upstream-Status: Submitted
+
+Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
+---
+ monitor/src/custom_rsc_table_tci6638.h       | 7 +++----
+ monitor/src/custom_rsc_table_vayu_dsp.h      | 7 +++----
+ monitor_ipu/src/custom_rsc_table_vayu_ipu1.h | 7 +++----
+ 3 files changed, 9 insertions(+), 12 deletions(-)
+
+diff --git a/monitor/src/custom_rsc_table_tci6638.h b/monitor/src/custom_rsc_table_tci6638.h
+index db6f686..c9f3f49 100644
+--- a/monitor/src/custom_rsc_table_tci6638.h
++++ b/monitor/src/custom_rsc_table_tci6638.h
+@@ -49,8 +49,7 @@
+ /* flip up bits whose indices represent features we support */
+ #define RPMSG_IPU_C0_FEATURES         1
+ 
+-#define RPMSG_VRING0_DA     0xA0000000
+-#define RPMSG_VRING1_DA     0xA0004000
++#define RPMSG_VRING_ADDR_ANY    FW_RSC_ADDR_ANY
+ 
+ /*
+  * sizes of the virtqueues (expressed in number of buffers supported,
+@@ -112,8 +111,8 @@ struct my_resource_table ti_ipc_remoteproc_ResourceTable = {
+         /* no config data */
+     },
+     /* the two vrings */
+-    { RPMSG_VRING0_DA, 4096, RPMSG_VQ0_SIZE, 1, 0 },
+-    { RPMSG_VRING1_DA, 4096, RPMSG_VQ1_SIZE, 2, 0 },
++    { RPMSG_VRING_ADDR_ANY, 4096, RPMSG_VQ0_SIZE, 1, 0 },
++    { RPMSG_VRING_ADDR_ANY, 4096, RPMSG_VQ1_SIZE, 2, 0 },
+ #endif
+ 
+     {
+diff --git a/monitor/src/custom_rsc_table_vayu_dsp.h b/monitor/src/custom_rsc_table_vayu_dsp.h
+index ddcf4a5..f7fe9e7 100644
+--- a/monitor/src/custom_rsc_table_vayu_dsp.h
++++ b/monitor/src/custom_rsc_table_vayu_dsp.h
+@@ -138,8 +138,7 @@
+ 
+ // Must be marked non-cached by monitor
+ #define DSP_MEM_IPC_VRING       0xFFF00000
+-#define DSP_MEM_RPMSG_VRING0    0xFFF00000
+-#define DSP_MEM_RPMSG_VRING1    0xFFF04000
++#define RPMSG_VRING_ADDR_ANY    FW_RSC_ADDR_ANY
+ #define DSP_MEM_VRING_BUFS0     0xFFF40000
+ #define DSP_MEM_VRING_BUFS1     0xFFF80000
+ 
+@@ -272,8 +271,8 @@ struct my_resource_table ti_ipc_remoteproc_ResourceTable = {
+         /* no config data */
+     },
+     /* the two vrings */
+-    { DSP_MEM_RPMSG_VRING0, 4096, DSP_RPMSG_VQ0_SIZE, 1, 0 },
+-    { DSP_MEM_RPMSG_VRING1, 4096, DSP_RPMSG_VQ1_SIZE, 2, 0 },
++    { RPMSG_VRING_ADDR_ANY, 4096, DSP_RPMSG_VQ0_SIZE, 1, 0 },
++    { RPMSG_VRING_ADDR_ANY, 4096, DSP_RPMSG_VQ1_SIZE, 2, 0 },
+ 
+     {
+         TYPE_CARVEOUT,
+diff --git a/monitor_ipu/src/custom_rsc_table_vayu_ipu1.h b/monitor_ipu/src/custom_rsc_table_vayu_ipu1.h
+index b06ab86..ab80089 100644
+--- a/monitor_ipu/src/custom_rsc_table_vayu_ipu1.h
++++ b/monitor_ipu/src/custom_rsc_table_vayu_ipu1.h
+@@ -96,8 +96,7 @@
+ 
+ #define IPU_MEM_IPC_VRING       0x60000000
+ #define IPU_PHYS_MEM_IPC_VRING  0x9D000000
+-#define IPU_MEM_RPMSG_VRING0    0x60000000
+-#define IPU_MEM_RPMSG_VRING1    0x60004000
++#define RPMSG_VRING_ADDR_ANY    FW_RSC_ADDR_ANY
+ 
+ /*
+  * Sizes of the virtqueues (expressed in number of buffers supported,
+@@ -206,8 +205,8 @@ struct my_resource_table ti_ipc_remoteproc_ResourceTable = {
+         /* no config data */
+     },
+     /* the two vrings */
+-    { IPU_MEM_RPMSG_VRING0, 4096, IPU_RPMSG_VQ0_SIZE, 1, 0 },
+-    { IPU_MEM_RPMSG_VRING1, 4096, IPU_RPMSG_VQ1_SIZE, 2, 0 },
++    { RPMSG_VRING_ADDR_ANY, 4096, IPU_RPMSG_VQ0_SIZE, 1, 0 },
++    { RPMSG_VRING_ADDR_ANY, 4096, IPU_RPMSG_VQ1_SIZE, 2, 0 },
+ 
+     {
+         TYPE_CARVEOUT,
+-- 
+2.17.1
+
diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-monitor-ipu_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl-monitor-ipu_git.bb
index 98103222..0e7e4540 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl-monitor-ipu_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl-monitor-ipu_git.bb
@@ -5,7 +5,8 @@ LICENSE = "BSD"
 include ocl.inc
 require recipes-ti/includes/arago-paths.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
+SRC_URI += "file://0001-Update-VRING-in-resource-table-for-new-Linux-kernel.patch;patchdir=.."
 
 inherit update-alternatives
 
diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
index 0ab21a1a..6689f94b 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
@@ -5,7 +5,8 @@ LICENSE = "BSD"
 include ocl.inc
 require recipes-ti/includes/arago-paths.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
+SRC_URI += "file://0001-Update-VRING-in-resource-table-for-new-Linux-kernel.patch;patchdir=.."
 
 inherit update-alternatives
 
-- 
2.24.1


