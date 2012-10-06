Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id 7A757529A1
	for <meta-arago@arago-project.org>;
	Sat,  6 Oct 2012 16:11:52 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so2498108oag.38
	for <meta-arago@arago-project.org>;
	Sat, 06 Oct 2012 09:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=K9SVwN86H+bzS+pXbQbd4lgMWrnZII1QDmDSHMPUyus=;
	b=vRkBURxBm9lLNqyEWlPLqey6Pg2+iRoqXm/6cafaoH2DZAtGSEmhsmMW9m3EUy0gG6
	yiWjqBtX9Z8mJajoggYduG90QqABGNU9lmnUPJ8zla1kJF+SS9HOaSISUs0zNqaisZ22
	yknFFu2Xk5TRqoPaC7/ifq+MbgRyPz06/GjXWW9in9TgToSeby4tsRsI1eVEpemplyLX
	7iiFnWIuDWUtk09K4PS8UKA5PO10sq2WYEu0g7i03BYwM88zUKVOpWN4G9yTx9lxzKfd
	MUIB5i7D7/u4+XzSe1UsyGLZ5KsEdKy7fp8+JWWZ5rp3++o34LqRBI/JoiMgrIcrDG8F
	rm/A==
Received: by 10.60.171.109 with SMTP id at13mr9679070oec.79.1349539911862;
	Sat, 06 Oct 2012 09:11:51 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id m3sm11857789obm.21.2012.10.06.09.11.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 06 Oct 2012 09:11:51 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Sat,  6 Oct 2012 11:40:44 -0500
Message-Id: <1349541644-31551-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH v3] task-arago-gst-sdk-target: Add task to install gstreamer related dev packages
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
X-List-Received-Date: Sat, 06 Oct 2012 16:11:52 -0000

From: Franklin S Cooper Jr <fcooper@ti.com>

* This task is used to install gstreamer and gstreamer plugins dev packages
* Remove COMPATIBLE_MACHINE restriction

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
Version 3 changes:
Removed unneeded PACKAGE_ARCH = "${MACHINE_ARCH}"

 .../tasks/task-arago-gst-sdk-target.bb             |   13 +++++++++++++
 .../recipes-core/tasks/task-arago-gst.bb           |    4 +---
 2 files changed, 14 insertions(+), 3 deletions(-)
 create mode 100644 meta-arago-distro/recipes-core/tasks/task-arago-gst-sdk-target.bb

diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-gst-sdk-target.bb b/meta-arago-distro/recipes-core/tasks/task-arago-gst-sdk-target.bb
new file mode 100644
index 0000000..2a9fb27
--- /dev/null
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-gst-sdk-target.bb
@@ -0,0 +1,13 @@
+DESCRIPTION = "Task to build and install header and libs in sdk"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+PR = "r0"
+
+inherit task
+
+RDEPENDS_${PN} = "\
+    gstreamer-dev \
+    gst-plugins-base-dev \
+    gst-plugins-good-dev \
+    gst-plugins-bad-dev \
+"
diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-gst.bb b/meta-arago-distro/recipes-core/tasks/task-arago-gst.bb
index d34402a..8c67881 100644
--- a/meta-arago-distro/recipes-core/tasks/task-arago-gst.bb
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-gst.bb
@@ -1,11 +1,9 @@
 DESCRIPTION = "Task to add gstreamer and gstreamer plugins"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-COMPATIBLE_MACHINE = "(am335x-evm|am3517-evm|am37x-evm|omap3evm|beagleboard|beaglebone)"
-PR = "r0"
+PR = "r1"
 
 inherit task
-PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 GSTREAMER = " \
     gstreamer \
-- 
1.7.0.4


