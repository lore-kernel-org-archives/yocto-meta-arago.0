Return-Path: <a0273011@sdit-build02.dal.design.ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 23F9A52986
	for <meta-arago@arago-project.org>;
	Tue, 14 Aug 2012 21:11:11 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q7ELBAos014351
	for <meta-arago@arago-project.org>; Tue, 14 Aug 2012 16:11:10 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q7ELBAQG032304
	for <meta-arago@arago-project.org>; Tue, 14 Aug 2012 16:11:10 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Tue, 14 Aug 2012 16:11:09 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	q7ELB98S000503;	Tue, 14 Aug 2012 16:11:09 -0500
Received: from a0273011 by sdit-build02.dal.design.ti.com with local (Exim
	4.71)	(envelope-from <a0273011@sdit-build02.dal.design.ti.com>)	id
	1T1OXI-0001N5-Mq; Tue, 14 Aug 2012 16:20:24 -0500
From: Franklin S Cooper Jr <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 14 Aug 2012 16:20:13 -0500
Message-ID: <1344979214-5237-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [PATCH] task-arago-gst: Create a task that includes gstreamer and additional plugins
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
X-List-Received-Date: Tue, 14 Aug 2012 21:11:12 -0000
Content-Type: text/plain

* This task includes gstreamer and additional gstreamer plugins for
  specific machines included in the Arago distribution.

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
 .../recipes-tisdk/tasks/task-arago-gst.bb          |   25 ++++++++++++++++++++
 1 files changed, 25 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-tisdk/tasks/task-arago-gst.bb

diff --git a/meta-arago-distro/recipes-tisdk/tasks/task-arago-gst.bb b/meta-arago-distro/recipes-tisdk/tasks/task-arago-gst.bb
new file mode 100644
index 0000000..b094c4b
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/tasks/task-arago-gst.bb
@@ -0,0 +1,25 @@
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
+    gst-plugins-ugly \
+    gst-plugins-base-meta \
+    gst-plugins-good-meta \
+    gst-plugins-bad-meta \
+    gst-plugins-ugly-meta \
+    "
+
+RDEPENDS_${PN} = "\
+    ${GSTREAMER} \
+    gst-ffmpeg \
+    "
-- 
1.7.0.4


