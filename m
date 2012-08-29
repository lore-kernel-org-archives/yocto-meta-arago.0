Return-Path: <a0273011@sdit-build02.dal.design.ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 1B6C3529CE
	for <meta-arago@arago-project.org>;
	Wed, 29 Aug 2012 20:32:25 +0000 (UTC)
Received: from dlep26.itg.ti.com ([157.170.170.121])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q7TKWOCF032512
	for <meta-arago@arago-project.org>; Wed, 29 Aug 2012 15:32:24 -0500
Received: from DLEE74.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id q7TKWOM5023667
	for <meta-arago@arago-project.org>;
	Wed, 29 Aug 2012 15:32:24 -0500 (CDT)
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 29 Aug 2012 15:32:24 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	q7TKWOfK024867;	Wed, 29 Aug 2012 15:32:24 -0500
Received: from a0273011 by sdit-build02.dal.design.ti.com with local (Exim
	4.71)	(envelope-from <a0273011@sdit-build02.dal.design.ti.com>)	id
	1T6pAQ-000877-Fb; Wed, 29 Aug 2012 15:47:14 -0500
From: Franklin S Cooper Jr <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 29 Aug 2012 15:47:13 -0500
Message-ID: <1346273233-31154-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [meta-arago-distro][PATCH] recipes: Consolidate tasks directory
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
X-List-Received-Date: Wed, 29 Aug 2012 20:32:25 -0000
Content-Type: text/plain

* Both recipes-core and recipes-tisdk contained a tasks directory with a set
  of tasks inside of them. Both directories actually contained a duplicate task
  called task-arago-base-tisdk.
* Consolidating all the tasks into a single directory recipes-core/tasks since
  it is the standard location for tasks.

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/tasks/task-arago-gst.bb           |   23 +++++++++++++++++
 .../recipes-core/tasks/task-arago-tisdk-addons.bb  |   22 ++++++++++++++++
 .../recipes-tisdk/tasks/task-arago-base-tisdk.bb   |   27 --------------------
 .../recipes-tisdk/tasks/task-arago-gst.bb          |   23 -----------------
 .../recipes-tisdk/tasks/task-arago-tisdk-addons.bb |   22 ----------------
 5 files changed, 45 insertions(+), 72 deletions(-)
 create mode 100644 meta-arago-distro/recipes-core/tasks/task-arago-gst.bb
 create mode 100644 meta-arago-distro/recipes-core/tasks/task-arago-tisdk-addons.bb
 delete mode 100644 meta-arago-distro/recipes-tisdk/tasks/task-arago-base-tisdk.bb
 delete mode 100644 meta-arago-distro/recipes-tisdk/tasks/task-arago-gst.bb
 delete mode 100644 meta-arago-distro/recipes-tisdk/tasks/task-arago-tisdk-addons.bb

diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-gst.bb b/meta-arago-distro/recipes-core/tasks/task-arago-gst.bb
new file mode 100644
index 0000000..d34402a
--- /dev/null
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-gst.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "Task to add gstreamer and gstreamer plugins"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+COMPATIBLE_MACHINE = "(am335x-evm|am3517-evm|am37x-evm|omap3evm|beagleboard|beaglebone)"
+PR = "r0"
+
+inherit task
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+GSTREAMER = " \
+    gstreamer \
+    gst-plugins-base \
+    gst-plugins-good \
+    gst-plugins-bad \
+    gst-plugins-base-meta \
+    gst-plugins-good-meta \
+    gst-plugins-bad-meta \
+    "
+
+RDEPENDS_${PN} = "\
+    ${GSTREAMER} \
+    gst-ffmpeg \
+    "
diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-addons.bb
new file mode 100644
index 0000000..789700d
--- /dev/null
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-addons.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "Task to install additional utilities/demos for SDKs"
+PR = "r0"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+inherit task
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+UTILS = " \
+    matrix-gui-settings-demos \
+    matrix-gui-armbenchmarks-demos \
+    task-arago-test \
+    gdbserver \
+    matrix-gui-oprofile-demos \
+    "
+
+# Add PRU examples for am180x-evm devices
+# UTILS_append_am180x-evm = " ti-pru-sw-examples"
+
+RDEPENDS_${PN} = "\
+    ${UTILS} \
+    "
diff --git a/meta-arago-distro/recipes-tisdk/tasks/task-arago-base-tisdk.bb b/meta-arago-distro/recipes-tisdk/tasks/task-arago-base-tisdk.bb
deleted file mode 100644
index 9991b7b..0000000
--- a/meta-arago-distro/recipes-tisdk/tasks/task-arago-base-tisdk.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-DESCRIPTION = "Additional packages beyond console packages shared by TI SDKs"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r0"
-
-inherit task
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-SECONDARY_BOOTLOADER = ""
-SECONDARY_BOOTLOADER_omap3 = "u-boot-spl"
-
-RDEPENDS_${PN} = "\
-    dbus \
-    dbus-x11 \
-    expat \
-    glib-2.0 \
-    libxml2 \
-    libpcre \
-    iptables \
-    iperf \
-    psplash-ti \
-    u-boot \
-    arago-gpl-notice \
-    nfs-utils-client \
-    ${SECONDARY_BOOTLOADER} \
-    "
diff --git a/meta-arago-distro/recipes-tisdk/tasks/task-arago-gst.bb b/meta-arago-distro/recipes-tisdk/tasks/task-arago-gst.bb
deleted file mode 100644
index d34402a..0000000
--- a/meta-arago-distro/recipes-tisdk/tasks/task-arago-gst.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-DESCRIPTION = "Task to add gstreamer and gstreamer plugins"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-COMPATIBLE_MACHINE = "(am335x-evm|am3517-evm|am37x-evm|omap3evm|beagleboard|beaglebone)"
-PR = "r0"
-
-inherit task
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-GSTREAMER = " \
-    gstreamer \
-    gst-plugins-base \
-    gst-plugins-good \
-    gst-plugins-bad \
-    gst-plugins-base-meta \
-    gst-plugins-good-meta \
-    gst-plugins-bad-meta \
-    "
-
-RDEPENDS_${PN} = "\
-    ${GSTREAMER} \
-    gst-ffmpeg \
-    "
diff --git a/meta-arago-distro/recipes-tisdk/tasks/task-arago-tisdk-addons.bb b/meta-arago-distro/recipes-tisdk/tasks/task-arago-tisdk-addons.bb
deleted file mode 100644
index 789700d..0000000
--- a/meta-arago-distro/recipes-tisdk/tasks/task-arago-tisdk-addons.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-DESCRIPTION = "Task to install additional utilities/demos for SDKs"
-PR = "r0"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-
-inherit task
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-UTILS = " \
-    matrix-gui-settings-demos \
-    matrix-gui-armbenchmarks-demos \
-    task-arago-test \
-    gdbserver \
-    matrix-gui-oprofile-demos \
-    "
-
-# Add PRU examples for am180x-evm devices
-# UTILS_append_am180x-evm = " ti-pru-sw-examples"
-
-RDEPENDS_${PN} = "\
-    ${UTILS} \
-    "
-- 
1.7.0.4


