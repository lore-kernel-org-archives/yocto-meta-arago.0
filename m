Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 8B0D952AB7
	for <meta-arago@arago-project.org>;
	Wed, 24 Oct 2012 21:18:28 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q9OLIQr6003948
	for <meta-arago@arago-project.org>; Wed, 24 Oct 2012 16:18:27 -0500
Received: from DBDE71.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9OLIPok009605
	for <meta-arago@arago-project.org>;
	Thu, 25 Oct 2012 02:48:26 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by DBDE71.ent.ti.com
	(172.24.170.149) with Microsoft SMTP Server id 14.1.323.3;
	Thu, 25 Oct 2012 02:48:25 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9OLIMYP016932;
	Thu, 25 Oct 2012 02:48:24 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 24 Oct 2012 16:18:20 -0500
Message-ID: <1351113500-16655-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCHv2] remove-net-rules: Add a class to remove net rules from images
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
X-List-Received-Date: Wed, 24 Oct 2012 21:18:28 -0000
Content-Type: text/plain

* Inherit the remove-net-rules class in the TISDK images to remove
  the utility that creates the persistent net rules file.
* This allows moving SD cards between EVMs.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
* Updated in version 2
    * Added a semicolon to the end of the ROOTFS_POSTPROCESS_COMMAND
      list to properly terminate the command.
---
 meta-arago-distro/classes/remove-net-rules.bbclass |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/classes/remove-net-rules.bbclass

diff --git a/meta-arago-distro/classes/remove-net-rules.bbclass b/meta-arago-distro/classes/remove-net-rules.bbclass
new file mode 100644
index 0000000..fcad9c7
--- /dev/null
+++ b/meta-arago-distro/classes/remove-net-rules.bbclass
@@ -0,0 +1,15 @@
+# Add a ROOTFS_POSTPROCESS_COMMAND that will strip the write_net_rules
+# executable from the file system.  This will prevent the
+# 70-persistent-net.rules from being created.  Not having this file
+# will allow moving SD cards between EVMs and similar boards such as
+# beaglebone and the EVM.
+
+ROOTFS_POSTPROCESS_COMMAND += "rootfs_remove_net_rules;"
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


