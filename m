Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 7FE2252079
	for <meta-arago@arago-project.org>;
	Mon,  6 Feb 2012 14:24:48 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q16EOhI2019262
	for <meta-arago@arago-project.org>; Mon, 6 Feb 2012 08:24:44 -0600
Received: from DBDE71.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id q16EOh5l005664
	for <meta-arago@arago-project.org>; Mon, 6 Feb 2012 19:54:43 +0530 (IST)
Received: from dbdp31.itg.ti.com (172.24.170.98) by DBDE71.ent.ti.com
	(172.24.170.149) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 6 Feb 2012 19:54:42 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp31.itg.ti.com (8.13.8/8.13.8) with ESMTP id q16EOfYm007282;
	Mon, 6 Feb 2012 19:54:41 +0530 (IST)
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 6 Feb 2012 08:24:39 -0600
Message-ID: <1328538279-23974-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCHv2] task-arago-tisdk-addons: ported from old arago
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
X-List-Received-Date: Mon, 06 Feb 2012 14:24:48 -0000
Content-Type: text/plain

* Ported from old arago overlay and added licensing checksum
* Removed unsupported devices

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
* Updated in version 2
    * Comment out pru examples for am180x until they are ported

---
 .../recipes-tisdk/tasks/task-arago-tisdk-addons.bb |   22 ++++++++++++++++++++
 1 files changed, 22 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-tisdk/tasks/task-arago-tisdk-addons.bb

diff --git a/meta-arago-distro/recipes-tisdk/tasks/task-arago-tisdk-addons.bb b/meta-arago-distro/recipes-tisdk/tasks/task-arago-tisdk-addons.bb
new file mode 100644
index 0000000..789700d
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/tasks/task-arago-tisdk-addons.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "Task to install additional utilities/demos for SDKs"
+PR = "r0"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+inherit task
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+UTILS = " \
+    matrix-gui-settings-demos \
+    matrix-gui-armbenchmarks-demos \
+    task-arago-test \
+    gdbserver \
+    matrix-gui-oprofile-demos \
+    "
+
+# Add PRU examples for am180x-evm devices
+# UTILS_append_am180x-evm = " ti-pru-sw-examples"
+
+RDEPENDS_${PN} = "\
+    ${UTILS} \
+    "
-- 
1.7.0.4


