Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id 04E8D529A1
	for <meta-arago@arago-project.org>;
	Wed, 19 Sep 2012 05:17:30 +0000 (UTC)
Received: by oagl20 with SMTP id l20so635754oag.38
	for <meta-arago@arago-project.org>;
	Tue, 18 Sep 2012 22:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=4GGFkvynd8NFKEYyC/98GmK3uLnt1Wy8BbsL1KMCHd4=;
	b=yeMZsl5WG5LZe1OFTb3AdUgx1W3tVf8PwOVj2ha86QPP8f8kuaxXQkn+ZpCEHvHGb1
	gS7GrgobORqIuzDtBfh+byWVjScHddlFLT/UKHzEljLMP/UhBPe5jJZI9aOwaDQUQX5L
	HT64K0gR6V5QJKHeG3tMSUEismY8DXZ/O5LCzuLUS3JTCmQkPKH/GvUiOUb6sP9nLJs/
	bAbYwIAHJVcg1QezqBfu16YufwS1ipHvx33PyoFaajC7AIwXyvBpIX4ailqMlEBXqwIw
	1MFdwuTlBNjLVgsC0EdyynIi+DoU3NIfSjwGkUSeHTGYfSGa8OvCTeFDrxXtXg3fN03J
	8HOw==
Received: by 10.182.75.33 with SMTP id z1mr2271338obv.9.1348031850431;
	Tue, 18 Sep 2012 22:17:30 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id 2sm1713831obi.20.2012.09.18.22.17.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Sep 2012 22:17:29 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Wed, 19 Sep 2012 00:39:51 -0500
Message-Id: <1348033191-2732-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [meta-arago-distro][PATCH] task-arago-tisdk-addons: Port task-arago-tisdk-addons-sdk-host from arago
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
X-List-Received-Date: Wed, 19 Sep 2012 05:17:31 -0000

From: Franklin S Cooper Jr <fcooper@ti.com>

* This is a initial port of task-arago-tisdk-addons-sdk-host from arago to
  meta-arago. In arago, this task was originally called
  task-arago-toolchain-tisdk-addons-host.
* Remove references to Matrix applications since the new Matrix task should
  handle Matrix related applications
* Add additional recipes to this task.

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
Version 3 addresses the following issues:
 Using new naming convention.
 Update commit message to reflect naming convention changes.

 .../tasks/task-arago-tisdk-addons-sdk-host.bb      |   21 ++++++++++++++++++++
 .../recipes-core/tasks/task-arago-tisdk-addons.bb  |   19 +++++++++++------
 2 files changed, 33 insertions(+), 7 deletions(-)
 create mode 100644 meta-arago-distro/recipes-core/tasks/task-arago-tisdk-addons-sdk-host.bb

diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-addons-sdk-host.bb
new file mode 100644
index 0000000..3856197
--- /dev/null
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-addons-sdk-host.bb
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
index 789700d..d8eec2b 100644
--- a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-addons.bb
@@ -1,22 +1,27 @@
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
+    dropbear \
+    openssh-sftp-server \
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


