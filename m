Return-Path: <a0273011@sdit-build02.dal.design.ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id D416B52960
	for <meta-arago@arago-project.org>;
	Thu, 30 Aug 2012 01:17:12 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q7U1HBTR008327
	for <meta-arago@arago-project.org>; Wed, 29 Aug 2012 20:17:11 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q7U1HBPW005108
	for <meta-arago@arago-project.org>; Wed, 29 Aug 2012 20:17:11 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 29 Aug 2012 20:17:11 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	q7U1HB8t020286;	Wed, 29 Aug 2012 20:17:11 -0500
Received: from a0273011 by sdit-build02.dal.design.ti.com with local (Exim
	4.71)	(envelope-from <a0273011@sdit-build02.dal.design.ti.com>)	id
	1T6tc5-0006bK-Rr; Wed, 29 Aug 2012 20:32:05 -0500
From: Franklin S Cooper Jr <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 29 Aug 2012 20:32:04 -0500
Message-ID: <1346290324-25340-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [meta-arago-distro][PATCH] task-arago-matrix-host: Add task to install Matrix related sources
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
X-List-Received-Date: Thu, 30 Aug 2012 01:17:13 -0000
Content-Type: text/plain

* The purpose of this task is to install Matrix v2 and associated applications
  sources.
* In arago, this was originally done in the task-arago-toolchain-tisdk-graphics-host
  task.

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/tasks/task-arago-matrix-host.bb   |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-core/tasks/task-arago-matrix-host.bb

diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-matrix-host.bb b/meta-arago-distro/recipes-core/tasks/task-arago-matrix-host.bb
new file mode 100644
index 0000000..3ed39b3
--- /dev/null
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-matrix-host.bb
@@ -0,0 +1,13 @@
+DESCRIPTION = "Task to install Matrix v2 and associated applications sources in the SDK"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+PR = "r0"
+
+inherit task
+
+RDEPENDS_${PN} = "\
+    matrix-gui-src \
+    matrix-gui-browser-src \
+    refresh-screen-src \
+"
-- 
1.7.0.4


