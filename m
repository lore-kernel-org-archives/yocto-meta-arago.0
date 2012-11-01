Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id 453CE529B8
	for <meta-arago@arago-project.org>;
	Thu,  1 Nov 2012 18:34:46 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id lz20so2625921obb.38
	for <meta-arago@arago-project.org>;
	Thu, 01 Nov 2012 11:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=cNgVtO61WeuzOuGwTBLGG2ipHea1N2gcpib49opZo90=;
	b=Fo6yx7ZeDWOn2SsSBHo2ZGtEka4AOFBFLzqq8uoS9O4lrlFT8p1uxO8H3aCMt7utmp
	RIw8Et8PArkqmZ3bmhea3ikkotml5gbVZWnbeXdBc/EJLi8yVA2sFF2SOAWZthpno8Z2
	N/n8McD5vQQMczMrM7BBRnt7QvccVFhenhfxshf+3Sqza+ZjhvZGDkec4Mh24XE16O0C
	KYk6uysh0vMqIhyORa9THIoVm2Z4tBWMI42KVLIGrSsIERoqGst3hXlZyqcDaQnXp6Cr
	xeR+BooGdFjTKpZkR9PjMEjrD3fA7gB6twgIoCQelL38BxO4pU6Mz5UbUTuyAmFcqhuu
	1MkA==
Received: by 10.182.31.13 with SMTP id w13mr34332093obh.29.1351794885020;
	Thu, 01 Nov 2012 11:34:45 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id m9sm5448329oem.4.2012.11.01.11.34.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Nov 2012 11:34:44 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Thu,  1 Nov 2012 13:34:39 -0500
Message-Id: <1351794879-4247-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH] task-arago-tisdk-amsdk: Add a new SDK related task
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
X-List-Received-Date: Thu, 01 Nov 2012 18:34:46 -0000

* Add a task to pull in amsdk related recipes. This includes applications and
  scripts installed in the SDK and scripts installed in the filesystem for the
  SDK's out of box experience (OOBE).

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../tasks/task-arago-tisdk-amsdk-sdk-host.bb       |   13 ++++++++++++
 .../recipes-core/tasks/task-arago-tisdk-amsdk.bb   |   21 ++++++++++++++++++++
 2 files changed, 34 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-core/tasks/task-arago-tisdk-amsdk-sdk-host.bb
 create mode 100644 meta-arago-distro/recipes-core/tasks/task-arago-tisdk-amsdk.bb

diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-amsdk-sdk-host.bb b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-amsdk-sdk-host.bb
new file mode 100644
index 0000000..37d0441
--- /dev/null
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-amsdk-sdk-host.bb
@@ -0,0 +1,13 @@
+DESCRIPTION = "Task to install additional scripts and applications into the SDK"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+PR = "r0"
+
+inherit task
+
+RDEPENDS_${PN} = "\
+    pinmux-utility \
+    ti-tisdk-setup \
+    board-port-labs-src \
+    ti-tisdk-makefile \
+"
diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-amsdk.bb b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-amsdk.bb
new file mode 100644
index 0000000..1351030
--- /dev/null
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-amsdk.bb
@@ -0,0 +1,21 @@
+DESCRIPTION = "Task to install additional packages only used in the Arago SDK"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+PR = "r0"
+
+inherit task
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+ALLOW_EMPTY = "1"
+
+# Out of Box Experience (OOBE)
+OOBE = ""
+
+OOBE_ti33x += "\
+    gadget-init \
+    parse-ip \
+"
+
+RDEPENDS_${PN} = "\
+    ${OOBE} \
+"
-- 
1.7.0.4


