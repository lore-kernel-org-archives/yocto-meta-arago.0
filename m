Return-Path: <a0273011@sdit-build02.dal.design.ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 63AE9529D8
	for <meta-arago@arago-project.org>;
	Thu, 30 Aug 2012 00:48:47 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q7U0mkgv005351
	for <meta-arago@arago-project.org>; Wed, 29 Aug 2012 19:48:46 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q7U0mklv011920
	for <meta-arago@arago-project.org>; Wed, 29 Aug 2012 19:48:46 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 29 Aug 2012 19:48:46 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	q7U0mk8e029979;	Wed, 29 Aug 2012 19:48:46 -0500
Received: from a0273011 by sdit-build02.dal.design.ti.com with local (Exim
	4.71)	(envelope-from <a0273011@sdit-build02.dal.design.ti.com>)	id
	1T6tAa-0005aB-HC; Wed, 29 Aug 2012 20:03:40 -0500
From: Franklin S Cooper Jr <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 29 Aug 2012 20:03:38 -0500
Message-ID: <1346288619-21223-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [meta-arago-distro][PATCH] task-arago-tisdk-addons: Port task-arago-tisdk-addons-host from arago to meta-arago
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
X-List-Received-Date: Thu, 30 Aug 2012 00:48:47 -0000
Content-Type: text/plain

* This is a initial port of task-arago-tisdk-addons-host from arago to meta-arago.
  In arago, this task was originally called task-arago-toolchain-tisdk-addons-host.
* Remove references to Matrix applications since the new Matrix task should
  handle Matrix related applications

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
 .../tasks/task-arago-tisdk-addons-host.bb          |   21 ++++++++++++++++++++
 .../recipes-core/tasks/task-arago-tisdk-addons.bb  |   17 +++++++++------
 2 files changed, 31 insertions(+), 7 deletions(-)
 create mode 100644 meta-arago-distro/recipes-core/tasks/task-arago-tisdk-addons-host.bb

diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-addons-host.bb b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-addons-host.bb
new file mode 100644
index 0000000..3856197
--- /dev/null
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-addons-host.bb
@@ -0,0 +1,21 @@
+DESCRIPTION = "Task to install sources for additional utilities/demos for SDKs"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+PR = "r0"
+
+inherit task
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+UTILS = " \
+    am-sysinfo-src \
+    arm-benchmarks-src \
+"
+
+# Add pru and profibus sources for omapl138 devices
+UTILS_append_am180x-evm = " \
+    ti-pru-sw-examples-src \
+"
+
+RDEPENDS_${PN} = "\
+    ${UTILS} \
+"
diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-addons.bb
index 789700d..167df12 100644
--- a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-addons.bb
@@ -1,22 +1,25 @@
 DESCRIPTION = "Task to install additional utilities/demos for SDKs"
-PR = "r0"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+PR = "r1"
 
 inherit task
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 UTILS = " \
-    matrix-gui-settings-demos \
-    matrix-gui-armbenchmarks-demos \
+    am-sysinfo \
+    dt \
     task-arago-test \
     gdbserver \
-    matrix-gui-oprofile-demos \
-    "
+    oprofile \
+    nbench-byte \
+    trace-cmd \
+    arm-benchmarks \
+"
 
 # Add PRU examples for am180x-evm devices
-# UTILS_append_am180x-evm = " ti-pru-sw-examples"
+UTILS_append_am180x-evm = " ti-pru-sw-examples"
 
 RDEPENDS_${PN} = "\
     ${UTILS} \
-    "
+"
-- 
1.7.0.4


