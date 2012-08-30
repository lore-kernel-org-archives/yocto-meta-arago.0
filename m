Return-Path: <a0273011@sdit-build02.dal.design.ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id A425E52960
	for <meta-arago@arago-project.org>;
	Thu, 30 Aug 2012 19:13:26 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q7UJDPmT012144
	for <meta-arago@arago-project.org>; Thu, 30 Aug 2012 14:13:25 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q7UJDPRl001960
	for <meta-arago@arago-project.org>; Thu, 30 Aug 2012 14:13:25 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Thu, 30 Aug 2012 14:13:25 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	q7UJDPsw012728;	Thu, 30 Aug 2012 14:13:25 -0500
Received: from a0273011 by sdit-build02.dal.design.ti.com with local (Exim
	4.71)	(envelope-from <a0273011@sdit-build02.dal.design.ti.com>)	id
	1T7APt-0005nu-24; Thu, 30 Aug 2012 14:28:37 -0500
From: Franklin S Cooper Jr <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 30 Aug 2012 14:28:35 -0500
Message-ID: <1346354915-22274-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [meta-arago-distro][PATCH] task-arago-tisdk-multimedia: Port multimedia task from arago to meta-arago
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
X-List-Received-Date: Thu, 30 Aug 2012 19:13:26 -0000
Content-Type: text/plain

* Port task-arago-tisdk-multimedia from arago to meta-arago.

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
 .../tasks/task-arago-tisdk-multimedia-host.bb      |   21 ++++++++++++++
 .../tasks/task-arago-tisdk-multimedia-target.bb    |   11 +++++++
 .../tasks/task-arago-tisdk-multimedia.bb           |   30 ++++++++++++++++++++
 3 files changed, 62 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-core/tasks/task-arago-tisdk-multimedia-host.bb
 create mode 100644 meta-arago-distro/recipes-core/tasks/task-arago-tisdk-multimedia-target.bb
 create mode 100644 meta-arago-distro/recipes-core/tasks/task-arago-tisdk-multimedia.bb

diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-multimedia-host.bb b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-multimedia-host.bb
new file mode 100644
index 0000000..17defc2
--- /dev/null
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-multimedia-host.bb
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
diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-multimedia-target.bb b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-multimedia-target.bb
new file mode 100644
index 0000000..72cb0f8
--- /dev/null
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-multimedia-target.bb
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
+    task-arago-gst-target \
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


