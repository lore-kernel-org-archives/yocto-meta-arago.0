Return-Path: <a0273011@sdit-build02.dal.design.ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 3AD43529CF
	for <meta-arago@arago-project.org>;
	Thu, 30 Aug 2012 18:56:53 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q7UIupU2027890
	for <meta-arago@arago-project.org>; Thu, 30 Aug 2012 13:56:51 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q7UIupw1016982
	for <meta-arago@arago-project.org>; Thu, 30 Aug 2012 13:56:51 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Thu, 30 Aug 2012 13:56:51 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	q7UIup0q000329;	Thu, 30 Aug 2012 13:56:51 -0500
Received: from a0273011 by sdit-build02.dal.design.ti.com with local (Exim
	4.71)	(envelope-from <a0273011@sdit-build02.dal.design.ti.com>)	id
	1T7A9q-00059J-0s; Thu, 30 Aug 2012 14:12:02 -0500
From: Franklin S Cooper Jr <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 30 Aug 2012 14:12:00 -0500
Message-ID: <1346353920-19756-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [meta-arago-distro][PATCH] task-arago-gst: Remove COMPATIBLE_MACHINE restrictions
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
X-List-Received-Date: Thu, 30 Aug 2012 18:56:54 -0000
Content-Type: text/plain

* Remove the COMPATIBLE_MACHINE restriction since we include gstreamer
  for all of our current devices.

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/tasks/task-arago-gst-target.bb    |    6 ++----
 .../recipes-core/tasks/task-arago-gst.bb           |    3 +--
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-gst-target.bb b/meta-arago-distro/recipes-core/tasks/task-arago-gst-target.bb
index feba1ee..f8df7ef 100644
--- a/meta-arago-distro/recipes-core/tasks/task-arago-gst-target.bb
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-gst-target.bb
@@ -1,9 +1,7 @@
 DESCRIPTION = "Task to build and install header and libs in sdk"
-
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-COMPATIBLE_MACHINE = "(am335x-evm|am3517-evm|am37x-evm|omap3evm|beagleboard|beaglebone)"
-PR = "r0"
+PR = "r1"
 
 inherit task
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -13,4 +11,4 @@ RDEPENDS_${PN} = "\
     gst-plugins-base-dev \
     gst-plugins-good-dev \
     gst-plugins-bad-dev \
-    "
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


