Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id 64F15529D2
	for <meta-arago@arago-project.org>;
	Fri,  5 Oct 2012 06:33:08 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id lz20so1308660obb.38
	for <meta-arago@arago-project.org>;
	Thu, 04 Oct 2012 23:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=m1zDcVI59wjDpVAt9B5b3eT/N/1i9P0LTzUwwuvD5Mg=;
	b=KCDn4Ha+P6mTP9IZRyrcTFlIRKqJxmkHBur8nt+o30L/LYWrAOwoW9aYubzb0+0Mu0
	+WlawGSm2yhngQ4Xy3dR2h6OrKP6uAWPDPagJPtpehHhx/4bhcXG0d4sNFuk6EEQiVAw
	Odam3+LG4dKjyP7dq4bIiqDmbSKi7MRX1k8dqKRL4Kt5YrRWmFk+SX5ou3RqYsSbpOwC
	qiyZRw+uUILZi0xVIC4JybpoCRe4LmrHsX0Zl8J2oF1/gwJU+aq6zlXfuxxBndKTu2h3
	l3IFqd2ohiCQYaaK0nO4QNPa+uWq6pyoLmvLDU74SiN0k7NUk7nf8tokELskhq/mbvl/
	gzNQ==
Received: by 10.60.4.199 with SMTP id m7mr4500152oem.106.1349418787845;
	Thu, 04 Oct 2012 23:33:07 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id hz6sm8752498obb.1.2012.10.04.23.33.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 04 Oct 2012 23:33:07 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Fri,  5 Oct 2012 02:01:29 -0500
Message-Id: <1349420489-22513-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH v2] task-arago-tisdk-matrix: Add task to install Matrix related sources
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
X-List-Received-Date: Fri, 05 Oct 2012 06:33:08 -0000

From: Franklin S Cooper Jr <fcooper@ti.com>

* Rename task-arago-matrix to use new naming convention.
* task-arago-tisdk-matrix-sdk-host is used to install Matrix v2 and
  associated applications sources.
* In arago, this was originally done in the task-arago-toolchain-tisdk-graphics-host
  task.
* Add several Matrix demos

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
Version 2 changes:
Use updated task naming convention.
Add additional demos.

 .../tasks/task-arago-tisdk-matrix-sdk-host.bb      |   13 +++++++++++++
 ...-arago-matrix.bb => task-arago-tisdk-matrix.bb} |   17 ++++++++++++-----
 2 files changed, 25 insertions(+), 5 deletions(-)
 create mode 100644 meta-arago-distro/recipes-core/tasks/task-arago-tisdk-matrix-sdk-host.bb
 rename meta-arago-distro/recipes-core/tasks/{task-arago-matrix.bb => task-arago-tisdk-matrix.bb} (83%)

diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-matrix-sdk-host.bb b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-matrix-sdk-host.bb
new file mode 100644
index 0000000..3ed39b3
--- /dev/null
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-matrix-sdk-host.bb
@@ -0,0 +1,13 @@
+DESCRIPTION = "Task to install Matrix v2 and associated applications sources in the SDK"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+PR = "r0"
+
+inherit task
+
+RDEPENDS_${PN} = "\
+    matrix-gui-src \
+    matrix-gui-browser-src \
+    refresh-screen-src \
+"
diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-matrix.bb b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-matrix.bb
similarity index 83%
rename from meta-arago-distro/recipes-core/tasks/task-arago-matrix.bb
rename to meta-arago-distro/recipes-core/tasks/task-arago-tisdk-matrix.bb
index 13c555a..f4feef3 100644
--- a/meta-arago-distro/recipes-core/tasks/task-arago-matrix.bb
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-matrix.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Task to include Matrix v2"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r0"
+PR = "r1"
 
 inherit task
 
@@ -30,10 +30,10 @@ MATRIX_APPS_append_omap3 = "        \
 "
 
 MATRIX_APPS_append_ti33x = "        \
+    matrix-gui-ethernet-demos       \
     matrix-gui-3d-demos             \
     matrix-gui-multimedia-demos     \
                                     \
-    matrix-gui-clocks               \
     matrix-gui-clocks-275mhz        \
     matrix-gui-clocks-500mhz        \
     matrix-gui-clocks-600mhz        \
@@ -41,7 +41,10 @@ MATRIX_APPS_append_ti33x = "        \
                                     \
     matrix-gui-generic-pm           \
     matrix-gui-pm-demos-suspend     \
+                                    \
     matrix-gui-wifi-demos           \
+    matrix-gui-bluetooth-demos      \
+    matrix-gui-wifi-direct-demo     \
 "
 
 MATRIX_APPS_append_beagleboard = "  \
@@ -53,7 +56,6 @@ MATRIX_APPS_append_am3517-evm = "   \
 "
 
 MATRIX_APPS_append_am37x-evm = "    \
-    matrix-gui-clocks               \
     matrix-gui-clocks-300mhz        \
     matrix-gui-clocks-600mhz        \
     matrix-gui-clocks-800mhz        \
@@ -67,14 +69,19 @@ MATRIX_APPS_append_am37x-evm = "    \
     matrix-gui-pm-demos-suspend     \
                                     \
     matrix-gui-wifi-demos           \
+    matrix-gui-wifi-direct-demo     \
+    matrix-gui-bluetooth-demos      \
+                                    \
     matrix-gui-display-control      \
     matrix-gui-camera-loopback      \
     matrix-gui-v4l2-demos           \
     matrix-gui-display-control      \
 "
 
-RDEPENDS_append_am180x-evm = "  \
-    matrix-gui-wifi-demos       \
+RDEPENDS_append_am180x-evm = "      \
+    matrix-gui-wifi-demos           \
+    matrix-gui-bluetooth-demos      \
+    matrix-gui-wifi-direct-demo     \
 "
 
 RDEPENDS_${PN} = "        \
-- 
1.7.0.4


