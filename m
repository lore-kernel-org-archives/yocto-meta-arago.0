Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 004D4529F0
	for <meta-arago@arago-project.org>;
	Wed,  3 Apr 2013 16:48:36 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r33GmYhx030395
	for <meta-arago@arago-project.org>; Wed, 3 Apr 2013 11:48:35 -0500
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r33GmXFB027783
	for <meta-arago@arago-project.org>; Wed, 3 Apr 2013 22:18:34 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by dbde70.ent.ti.com
	(172.24.170.148) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 3 Apr 2013 22:18:33 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r33GmVoE024147;
	Wed, 3 Apr 2013 22:18:32 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 3 Apr 2013 11:48:30 -0500
Message-ID: <1365007710-12866-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH] tisdk-image: add support for DTB files
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
X-List-Received-Date: Wed, 03 Apr 2013 16:48:37 -0000
Content-Type: text/plain

* If DTB files exist add support for copying those files into
  the SDK prebuilt-images directory.
* The files to be copied can be controlled using the DTB_FILTER
  variable.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 meta-arago-distro/classes/tisdk-image.bbclass |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/meta-arago-distro/classes/tisdk-image.bbclass b/meta-arago-distro/classes/tisdk-image.bbclass
index a1ce1ad..4e3ed52 100644
--- a/meta-arago-distro/classes/tisdk-image.bbclass
+++ b/meta-arago-distro/classes/tisdk-image.bbclass
@@ -528,6 +528,16 @@ do_sdk_image () {
         return 1
     fi
 
+    # Copy the DTB files if they exist.
+    # NOTE: For simplicity remove the uImage- prefix on the dtb files.  Get just the symlink
+    #       files for a cleaner name.  Use the DTB_FILTER variable to allow finding the
+    #       dtb files for only that MACHINE type
+    for f in `find ${DEPLOY_DIR_IMAGE} -type l -name "*${DTB_FILTER}*.dtb"`
+    do
+        dtb_file=`basename $f | sed s/uImage-//`
+        cp $f ${prebuilt_dir}/${dtb_file}
+    done
+
     if [ "${SECONDARY_BOOTLOADER_NAME}" != "" ]
     then
         # Copy the secondary bootloader image if it exists
-- 
1.7.0.4


