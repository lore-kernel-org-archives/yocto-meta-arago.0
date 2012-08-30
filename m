Return-Path: <a0273011@sdit-build02.dal.design.ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 38B1752960
	for <meta-arago@arago-project.org>;
	Thu, 30 Aug 2012 01:38:25 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q7U1cOFQ006149
	for <meta-arago@arago-project.org>; Wed, 29 Aug 2012 20:38:24 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q7U1cOpN024195
	for <meta-arago@arago-project.org>; Wed, 29 Aug 2012 20:38:24 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 29 Aug 2012 20:38:24 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	q7U1cOMU004077;	Wed, 29 Aug 2012 20:38:24 -0500
Received: from a0273011 by sdit-build02.dal.design.ti.com with local (Exim
	4.71)	(envelope-from <a0273011@sdit-build02.dal.design.ti.com>)	id
	1T6twd-0002Zd-D8; Wed, 29 Aug 2012 20:53:19 -0500
From: Franklin S Cooper Jr <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 29 Aug 2012 20:53:18 -0500
Message-ID: <1346291598-9859-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [meta-arago-distro][PATCH] task-arago-gst-target: Add task to install gstreamer related dev packages
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
X-List-Received-Date: Thu, 30 Aug 2012 01:38:25 -0000
Content-Type: text/plain

* This task is used to install gstreamer and gstreamer plugins dev packages

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/tasks/task-arago-gst-target.bb    |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-core/tasks/task-arago-gst-target.bb

diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-gst-target.bb b/meta-arago-distro/recipes-core/tasks/task-arago-gst-target.bb
new file mode 100644
index 0000000..feba1ee
--- /dev/null
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-gst-target.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "Task to build and install header and libs in sdk"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+COMPATIBLE_MACHINE = "(am335x-evm|am3517-evm|am37x-evm|omap3evm|beagleboard|beaglebone)"
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
+    "
-- 
1.7.0.4


