Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 00A46529AA
	for <meta-arago@arago-project.org>;
	Mon, 22 Oct 2012 21:46:29 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q9MLkSJa014478
	for <meta-arago@arago-project.org>; Mon, 22 Oct 2012 16:46:28 -0500
Received: from DBDE71.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9MLkRVw016836
	for <meta-arago@arago-project.org>;
	Tue, 23 Oct 2012 03:16:27 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by DBDE71.ent.ti.com
	(172.24.170.149) with Microsoft SMTP Server id 14.1.323.3;
	Tue, 23 Oct 2012 03:16:27 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9MLkPiQ027983;
	Tue, 23 Oct 2012 03:16:26 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 22 Oct 2012 16:46:23 -0500
Message-ID: <1350942384-27039-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 1/2] remove-net-rules: Add a class to remove net rules from images
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
X-List-Received-Date: Mon, 22 Oct 2012 21:46:30 -0000
Content-Type: text/plain

* Inherit the remove-net-rules class in the TISDK images to remove
  the utility that creates the persistent net rules file.
* This allows moving SD cards between EVMs.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 meta-arago-distro/classes/remove-net-rules.bbclass |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/classes/remove-net-rules.bbclass

diff --git a/meta-arago-distro/classes/remove-net-rules.bbclass b/meta-arago-distro/classes/remove-net-rules.bbclass
new file mode 100644
index 0000000..3227221
--- /dev/null
+++ b/meta-arago-distro/classes/remove-net-rules.bbclass
@@ -0,0 +1,15 @@
+# Add a ROOTFS_POSTPROCESS_COMMAND that will strip the write_net_rules
+# executable from the file system.  This will prevent the
+# 70-persistent-net.rules from being created.  Not having this file
+# will allow moving SD cards between EVMs and similar boards such as
+# beaglebone and the EVM.
+
+ROOTFS_POSTPROCESS_COMMAND += "rootfs_remove_net_rules"
+
+rootfs_remove_net_rules () {
+    if [ -e ${IMAGE_ROOTFS}/lib/udev/write_net_rules ]
+    then
+        rm ${IMAGE_ROOTFS}/lib/udev/write_net_rules
+    fi
+}
+
-- 
1.7.0.4


