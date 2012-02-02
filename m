Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id B4A2F52A3A
	for <meta-arago@arago-project.org>;
	Thu,  2 Feb 2012 21:01:41 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q12L1cFK012084
	for <meta-arago@arago-project.org>; Thu, 2 Feb 2012 15:01:39 -0600
Received: from DBDE71.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id q12L1bXO000415
	for <meta-arago@arago-project.org>; Fri, 3 Feb 2012 02:31:38 +0530 (IST)
Received: from dbdp31.itg.ti.com (172.24.170.98) by DBDE71.ent.ti.com
	(172.24.170.149) with Microsoft SMTP Server id 14.1.323.3;
	Fri, 3 Feb 2012 02:31:37 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp31.itg.ti.com (8.13.8/8.13.8) with ESMTP id q12L1Yt0001215;
	Fri, 3 Feb 2012 02:31:36 +0530 (IST)
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 2 Feb 2012 15:01:28 -0600
Message-ID: <1328216492-7294-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 1/5] task-arago-base: port from old arago
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
X-List-Received-Date: Thu, 02 Feb 2012 21:01:44 -0000
Content-Type: text/plain

* Ported the base task from old arago overlay
* Updated task license checksum

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../recipes-core/tasks/task-arago-base.bb          |   35 ++++++++++++++++++++
 1 files changed, 35 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-core/tasks/task-arago-base.bb

diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-base.bb b/meta-arago-distro/recipes-core/tasks/task-arago-base.bb
new file mode 100644
index 0000000..d9f7f93
--- /dev/null
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-base.bb
@@ -0,0 +1,35 @@
+DESCRIPTION = "Basic task to get a device booting"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+PR = "r0"
+
+inherit task
+
+ARAGO_ALSA_BASE = "\
+    alsa-lib \
+    alsa-utils-aplay \
+    "
+
+ARAGO_BASE = "\
+    ${ARAGO_ALSA_BASE} \
+    mtd-utils \
+    curl \
+    initscript-telnetd \
+    devmem2 \
+    ethtool \
+    tcpdump \
+    "
+
+# minimal set of packages - needed to boot
+RDEPENDS_${PN} = "\
+    base-files \
+    base-passwd \
+    busybox \
+    initscripts \
+    modutils-initscripts \
+    netbase \
+    update-alternatives \
+    module-init-tools \
+    task-basic \
+    ${ARAGO_BASE} \
+    "
-- 
1.7.0.4


