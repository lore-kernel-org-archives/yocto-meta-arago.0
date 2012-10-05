Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id D45BB529A1
	for <meta-arago@arago-project.org>;
	Fri,  5 Oct 2012 06:16:21 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so1318323oag.38
	for <meta-arago@arago-project.org>;
	Thu, 04 Oct 2012 23:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=+Bszy4l14kVREnwDUU0M30qkNPRZawxdCFYP+A6AbJQ=;
	b=wSnbera7EE8PhsVwLA22gdpkVJYy47pCeYasJ3RCRK9tBug+mxxH1qEg0vvLKy1XhX
	gGR5XRME/rlE7e8eu2yr5szxQJ8UenGGR3kNYWQ2kNkgnZy11eZVFol/BUq9/gpWOwes
	lmFWRo4OY7xv8noXSUebY7H8iZQfnJdx2KUvWLydanrK2YXdzTK5SwhHdcY8H6P8jtrY
	RH0qlO0CenHfyvGiXBoiOQJv/uLQBOYnfKdfmFkU+RjcYgP7e+74qTa3Z6/j0srtJFP/
	QiKNJJ2rkoRzGFMsNoV5FnNS84C7MEOb9psYR7r6xqNgI2XPJ4fJwWfIzw7ffD/MJneO
	IAvA==
Received: by 10.182.192.101 with SMTP id hf5mr6204103obc.96.1349417781422;
	Thu, 04 Oct 2012 23:16:21 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id n7sm945251obd.16.2012.10.04.23.16.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 04 Oct 2012 23:16:20 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Fri,  5 Oct 2012 01:44:40 -0500
Message-Id: <1349419480-21560-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH v2] task-arago-tisdk-multimedia: Port multimedia task from arago to meta-arago
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
X-List-Received-Date: Fri, 05 Oct 2012 06:16:22 -0000

From: Franklin S Cooper Jr <fcooper@ti.com>

* Port task-arago-tisdk-multimedia from arago to meta-arago.

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
Version 2 changes:
Use new task naming convention

 .../tasks/task-arago-tisdk-multimedia-sdk-host.bb  |   21 ++++++++++++++
 .../task-arago-tisdk-multimedia-sdk-target.bb      |   11 +++++++
 .../tasks/task-arago-tisdk-multimedia.bb           |   30 ++++++++++++++++++++
 3 files changed, 62 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-core/tasks/task-arago-tisdk-multimedia-sdk-host.bb
 create mode 100644 meta-arago-distro/recipes-core/tasks/task-arago-tisdk-multimedia-sdk-target.bb
 create mode 100644 meta-arago-distro/recipes-core/tasks/task-arago-tisdk-multimedia.bb

diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-multimedia-sdk-host.bb b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-multimedia-sdk-host.bb
new file mode 100644
index 0000000..17defc2
--- /dev/null
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-multimedia-sdk-host.bb
@@ -0,0 +1,21 @@
+DESCRIPTION = "Task to add multimedia related sources into the SDK"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+PR = "r0"
+
+inherit task
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+MULTIMEDIA = ""
+
+MULTIMEDIA_append_am37x-evm = " \
+    av-examples-src \
+"
+
+MULTIMEDIA_append_am3517-evm = " \
+    av-examples-src \
+"
+
+RDEPENDS_${PN} = "\
+    ${MULTIMEDIA} \
+"
diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-multimedia-sdk-target.bb b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-multimedia-sdk-target.bb
new file mode 100644
index 0000000..1f17f87
--- /dev/null
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-multimedia-sdk-target.bb
@@ -0,0 +1,11 @@
+DESCRIPTION = "Task to build and install header and libs into sdk"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+PR = "r0"
+
+inherit task
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+RDEPENDS_${PN} = "\
+    task-arago-gst-sdk-target \
+"
diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-multimedia.bb b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-multimedia.bb
new file mode 100644
index 0000000..8cd0d2a
--- /dev/null
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-multimedia.bb
@@ -0,0 +1,30 @@
+DESCRIPTION = "Task to add multimedia related packages"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+PR = "r0"
+
+inherit task
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+MULTIMEDIA = ""
+
+MULTIMEDIA_append_omap3 = " \
+    amsdk-av-files \
+"
+
+MULTIMEDIA_append_ti33x = " \
+    amsdk-av-files \
+"
+
+MULTIMEDIA_append_am37x-evm = " \
+    av-examples \
+"
+
+MULTIMEDIA_append_am3517-evm = " \
+    av-examples \
+"
+
+RDEPENDS_${PN} = "\
+    task-arago-gst \
+    ${MULTIMEDIA} \
+"
-- 
1.7.0.4


