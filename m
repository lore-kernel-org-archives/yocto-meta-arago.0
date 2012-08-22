Return-Path: <a0273011@sdit-build02.dal.design.ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 0FED452A00
	for <meta-arago@arago-project.org>;
	Wed, 22 Aug 2012 15:20:30 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q7MFKTet003021
	for <meta-arago@arago-project.org>; Wed, 22 Aug 2012 10:20:29 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q7MFKTUw016581
	for <meta-arago@arago-project.org>; Wed, 22 Aug 2012 10:20:29 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 22 Aug 2012 10:20:28 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	q7MFKSup028424;	Wed, 22 Aug 2012 10:20:28 -0500
Received: from a0273011 by sdit-build02.dal.design.ti.com with local (Exim
	4.71)	(envelope-from <a0273011@sdit-build02.dal.design.ti.com>)	id
	1T4Cv7-0000Y7-Fh; Wed, 22 Aug 2012 10:32:37 -0500
From: Franklin S Cooper Jr <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 22 Aug 2012 10:32:36 -0500
Message-ID: <1345649556-2071-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [meta-arago-distro][PATCH] task-arago-matrix: Create new Arago task
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
X-List-Received-Date: Wed, 22 Aug 2012 15:20:30 -0000
Content-Type: text/plain

* First pass at creating a new Matrix task that contains the related
  Matrix v2 files and applications that are supported by each platform/machine

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/tasks/task-arago-matrix.bb        |   84 ++++++++++++++++++++
 1 files changed, 84 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-core/tasks/task-arago-matrix.bb

diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-matrix.bb b/meta-arago-distro/recipes-core/tasks/task-arago-matrix.bb
new file mode 100644
index 0000000..13c555a
--- /dev/null
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-matrix.bb
@@ -0,0 +1,84 @@
+DESCRIPTION = "Task to include Matrix v2"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+PR = "r0"
+
+inherit task
+
+MATRIX_ESSENTIALS = "        \
+    matrix-gui               \
+    refresh-screen           \
+    matrix-lighttpd-config   \
+    matrix-gui-browser       \
+"
+
+MATRIX_COMMON_APPS = "              \
+    matrix-gui-armbenchmarks-demos  \
+    matrix-gui-crypto-demos         \
+    matrix-gui-oprofile-demos       \
+    matrix-gui-qt4-demos            \
+    matrix-gui-settings-demos       \
+    matrix-gui-usb-demos            \
+    matrix-gui-submenus-ethernet    \
+"
+
+MATRIX_APPS = ""
+
+MATRIX_APPS_append_omap3 = "        \
+    matrix-gui-3d-demos             \
+    matrix-gui-multimedia-demos     \
+"
+
+MATRIX_APPS_append_ti33x = "        \
+    matrix-gui-3d-demos             \
+    matrix-gui-multimedia-demos     \
+                                    \
+    matrix-gui-clocks               \
+    matrix-gui-clocks-275mhz        \
+    matrix-gui-clocks-500mhz        \
+    matrix-gui-clocks-600mhz        \
+    matrix-gui-clocks-720mhz        \
+                                    \
+    matrix-gui-generic-pm           \
+    matrix-gui-pm-demos-suspend     \
+    matrix-gui-wifi-demos           \
+"
+
+MATRIX_APPS_append_beagleboard = "  \
+    matrix-gui-display-control      \
+"
+
+MATRIX_APPS_append_am3517-evm = "   \
+    matrix-gui-v4l2-demos           \
+"
+
+MATRIX_APPS_append_am37x-evm = "    \
+    matrix-gui-clocks               \
+    matrix-gui-clocks-300mhz        \
+    matrix-gui-clocks-600mhz        \
+    matrix-gui-clocks-800mhz        \
+    matrix-gui-clocks-1ghz          \
+                                    \
+    matrix-gui-generic-pm           \
+    matrix-gui-pm-demos-count       \
+    matrix-gui-pm-demos-dump-reg    \
+    matrix-gui-pm-demos-snapshot1   \
+    matrix-gui-pm-demos-snapshot2   \
+    matrix-gui-pm-demos-suspend     \
+                                    \
+    matrix-gui-wifi-demos           \
+    matrix-gui-display-control      \
+    matrix-gui-camera-loopback      \
+    matrix-gui-v4l2-demos           \
+    matrix-gui-display-control      \
+"
+
+RDEPENDS_append_am180x-evm = "  \
+    matrix-gui-wifi-demos       \
+"
+
+RDEPENDS_${PN} = "        \
+    ${MATRIX_ESSENTIALS}  \
+    ${MATRIX_COMMON_APPS} \
+    ${MATRIX_APPS}        \
+"
-- 
1.7.0.4


