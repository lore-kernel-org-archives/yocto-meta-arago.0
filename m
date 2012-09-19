Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id 72BDE529A1
	for <meta-arago@arago-project.org>;
	Wed, 19 Sep 2012 05:18:58 +0000 (UTC)
Received: by obbeh20 with SMTP id eh20so654116obb.38
	for <meta-arago@arago-project.org>;
	Tue, 18 Sep 2012 22:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=4GGFkvynd8NFKEYyC/98GmK3uLnt1Wy8BbsL1KMCHd4=;
	b=FE0yVMFiDBbprTr9srxrZkZ6QlS4l4TCGRJzEbUwTDzzEECGnf3ZSaRsYI3VIXUJDr
	FU3X9ZNeUx/hk0JyaNTd2kroGCITs49bHoESy7ELOnAwCJi7Mn96gwtrxXxX7gkelMxH
	IwFSx2snMDRkjmzBxKfYY8juUHwYP3HtcExhWJIss90u1UeFXd9r0mpZttcXKNcE+qtR
	zEjzU+B4hSaZiqJgb7f1iDzDuMpe0NB8VPOK1SFSkz5ITYHD2S/7qVG4Oz2tUZHwKcgv
	7Fd8yyYO4CnES1ii1oi4EM7sikHv9Ob5h8omyB/t5YR4xb8gFk1mv1my4LDXyQGiyunT
	6LJA==
Received: by 10.182.124.102 with SMTP id mh6mr2124561obb.48.1348031937868;
	Tue, 18 Sep 2012 22:18:57 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id kc5sm1707299obb.21.2012.09.18.22.18.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Sep 2012 22:18:57 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Wed, 19 Sep 2012 00:41:19 -0500
Message-Id: <1348033279-2846-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [meta-arago-distro][PATCH v3] task-arago-tisdk-addons: Port task-arago-tisdk-addons-sdk-host from arago
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
X-List-Received-Date: Wed, 19 Sep 2012 05:18:58 -0000

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


