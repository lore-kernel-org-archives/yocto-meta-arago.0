Return-Path: <yuanzhao@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 17CA852A2C
	for <meta-arago@arago-project.org>;
	Wed, 22 Apr 2020 17:11:58 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03MH9d3I024290
	for <meta-arago@arago-project.org>; Wed, 22 Apr 2020 12:09:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1587575379;
	bh=f7YukocfW/4WJzhEEX5vuMG+2Knr0Fmmpra0nCc+fl8=;
	h=From:To:CC:Subject:Date;
	b=s/0mmKaVUMNjZqRoI2wb2Nak6q37pE+OpkWWLWRLIpTgDnZcH1dmbmNzH20Ydu5cG
	WHcUC1W8FpTiTVtAi0iThUKM7dq6IWTTcEp3Lu/g3HrtFJ7NVbXCyA0inQaE6w6b9N
	cAAscc81AqvH0otksovy9X1znwaLtu0iEr1hwilc=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03MH9dhJ098829
	for <meta-arago@arago-project.org>; Wed, 22 Apr 2020 12:09:39 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Wed, 22 Apr 2020 12:09:38 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Wed, 22 Apr 2020 12:09:38 -0500
Received: from sdomc-build0.hou.asp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03MH9cd7003243;
	Wed, 22 Apr 2020 12:09:38 -0500
From: Yuan Zhao <yuanzhao@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 22 Apr 2020 12:09:26 -0500
Message-ID: <20200422170926.46149-1-yuanzhao@ti.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] ocl: fix race condition during K2x DSP boot
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
X-List-Received-Date: Wed, 22 Apr 2020 17:11:58 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
---
 ...ondition-during-DSP-firmware-booting.patch | 38 +++++++++++++++++++
 .../recipes-ti/ocl/opencl-monitor_git.bb      |  3 +-
 2 files changed, 40 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-extras/recipes-ti/ocl/files/0002-Fix-K2x-race-condition-during-DSP-firmware-booting.patch

diff --git a/meta-arago-extras/recipes-ti/ocl/files/0002-Fix-K2x-race-condition-during-DSP-firmware-booting.patch b/meta-arago-extras/recipes-ti/ocl/files/0002-Fix-K2x-race-condition-during-DSP-firmware-booting.patch
new file mode 100644
index 00000000..807639da
--- /dev/null
+++ b/meta-arago-extras/recipes-ti/ocl/files/0002-Fix-K2x-race-condition-during-DSP-firmware-booting.patch
@@ -0,0 +1,38 @@
+ocl: Fix K2x race condition during DSP firmware booting
+
+- Race condition during booting of K2x DSP monitor firmware, causes
+  some DSPs not able to create RPMessage object that communicates with
+  the host (Arm A15).
+- The root cause is that one global data in ipc/RPMessage,
+  "RPMessage_module", is placed in global DDR section shared by all cores.
+- The fix is to place "ipc/RPMessage" global data into core-private memory.
+- MCT-1279
+
+Upstream-Status: Submitted
+
+Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
+---
+ monitor/cmds/monitor.cmd | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/monitor/cmds/monitor.cmd b/monitor/cmds/monitor.cmd
+index a6a9fb9..6ec4151 100644
+--- a/monitor/cmds/monitor.cmd
++++ b/monitor/cmds/monitor.cmd
+@@ -164,6 +164,13 @@ SECTIONS
+     } run=DDR3_VIRT, load=DDR3_PER_CORE
+      */
+ 
++    /* ipc (e.g. RPMessage_module) need to be private for each core */
++    .otherlocalfar :
++    {
++                "*.ae66"            (.fardata)
++                "*.ae66"            (.far)
++    } run=DDR3_VIRT, load=DDR3_PER_CORE
++
+     .localddr: run=DDR3_VIRT, load=DDR3_PER_CORE
+     .ctools_core_private: run=DDR3_VIRT, load=DDR3_PER_CORE
+ 
+-- 
+2.17.1
+
diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
index 6689f94b..d2d09bb1 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
@@ -5,8 +5,9 @@ LICENSE = "BSD"
 include ocl.inc
 require recipes-ti/includes/arago-paths.inc
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 SRC_URI += "file://0001-Update-VRING-in-resource-table-for-new-Linux-kernel.patch;patchdir=.."
+SRC_URI += "file://0002-Fix-K2x-race-condition-during-DSP-firmware-booting.patch;patchdir=.."
 
 inherit update-alternatives
 
-- 
2.24.1


