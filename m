Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id E68C1529A1
	for <meta-arago@arago-project.org>;
	Fri,  5 Oct 2012 06:15:15 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id lz20so1299440obb.38
	for <meta-arago@arago-project.org>;
	Thu, 04 Oct 2012 23:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=Cr432TTwnIZFBXIlawjqAcrektfnv8TORaYJgI2sz7U=;
	b=Ha2KrqaqUKi+O6DywqN3TJ2G2AsVzbLDBimVMw94EapVjZLbg5lin+iP+iliLz9URr
	lC9s6aGOJq9OpwJfW0AMaaKgumLG25AvqgTcv7dXuqvK7kspTzBk+3aIwhLEyynRUJ1z
	fUU+cAlQ4e4MSW2odQAMdhND0gpArlj7+EqxuekeTT7IvSsJQ/YsfZk1TYIm/rZUwvy+
	Y9Xe5DineUupZL5PhK9idsdvAyY0cCe57pmwOhLw6RGVvpHoXElaQO2dUNEQWEgs86wb
	vcFCNva9qP+OUr1UdO/1TUnaMgjVdumBgLM1xG6FB7Gnwoelu1M0BJMRJ5Niq1vYuK9q
	5+Vw==
Received: by 10.60.25.104 with SMTP id b8mr6199193oeg.140.1349417715409;
	Thu, 04 Oct 2012 23:15:15 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id ea6sm8713044obc.9.2012.10.04.23.15.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 04 Oct 2012 23:15:15 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Fri,  5 Oct 2012 01:43:35 -0500
Message-Id: <1349419415-21517-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH v2] task-arago-gst-sdk-target: Add task to install gstreamer related dev packages
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
X-List-Received-Date: Fri, 05 Oct 2012 06:15:16 -0000

From: Franklin S Cooper Jr <fcooper@ti.com>

* This task is used to install gstreamer and gstreamer plugins dev packages
* Remove COMPATIBLE_MACHINE restriction
Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
Version 2 changes:
Use new task naming convention

 .../tasks/task-arago-gst-sdk-target.bb             |   14 ++++++++++++++
 .../recipes-core/tasks/task-arago-gst.bb           |    3 +--
 2 files changed, 15 insertions(+), 2 deletions(-)
 create mode 100644 meta-arago-distro/recipes-core/tasks/task-arago-gst-sdk-target.bb

diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-gst-sdk-target.bb b/meta-arago-distro/recipes-core/tasks/task-arago-gst-sdk-target.bb
new file mode 100644
index 0000000..655cd20
--- /dev/null
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-gst-sdk-target.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "Task to build and install header and libs in sdk"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+PR = "r0"
+
+inherit task
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+RDEPENDS_${PN} = "\
+    gstreamer-dev \
+    gst-plugins-base-dev \
+    gst-plugins-good-dev \
+    gst-plugins-bad-dev \
+"
diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-gst.bb b/meta-arago-distro/recipes-core/tasks/task-arago-gst.bb
index d34402a..da9e41c 100644
--- a/meta-arago-distro/recipes-core/tasks/task-arago-gst.bb
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-gst.bb
@@ -1,8 +1,7 @@
 DESCRIPTION = "Task to add gstreamer and gstreamer plugins"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-COMPATIBLE_MACHINE = "(am335x-evm|am3517-evm|am37x-evm|omap3evm|beagleboard|beaglebone)"
-PR = "r0"
+PR = "r1"
 
 inherit task
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
1.7.0.4


