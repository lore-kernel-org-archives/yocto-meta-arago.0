Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 7EEE6529A3
	for <meta-arago@arago-project.org>;
	Fri, 12 Apr 2013 20:50:09 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r3CKo7wi025786
	for <meta-arago@arago-project.org>; Fri, 12 Apr 2013 15:50:08 -0500
Received: from DBDE71.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r3CKo7TF018240
	for <meta-arago@arago-project.org>;
	Sat, 13 Apr 2013 02:20:07 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by DBDE71.ent.ti.com
	(172.24.170.149) with Microsoft SMTP Server id 14.1.323.3;
	Sat, 13 Apr 2013 02:20:07 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r3CKo5Wd015974;
	Sat, 13 Apr 2013 02:20:05 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 12 Apr 2013 15:50:03 -0500
Message-ID: <1365799803-24139-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCHv2 1/1] tisdk-image: add support for DTB files
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
X-List-Received-Date: Fri, 12 Apr 2013 20:50:09 -0000
Content-Type: text/plain

* If DTB files exist add support for copying those files into
  the SDK prebuilt-images directory.
* The files to be copied can be controlled using the DTB_FILTER
  variable.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
* Updated in version 2
    * Don't run the for loop to package DTBs if the filter is
      "unknown"
---
 meta-arago-distro/classes/tisdk-image.bbclass |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)

diff --git a/meta-arago-distro/classes/tisdk-image.bbclass b/meta-arago-distro/classes/tisdk-image.bbclass
index a1ce1ad..95cc0ca 100644
--- a/meta-arago-distro/classes/tisdk-image.bbclass
+++ b/meta-arago-distro/classes/tisdk-image.bbclass
@@ -528,6 +528,19 @@ do_sdk_image () {
         return 1
     fi
 
+    # Copy the DTB files if they exist.
+    # NOTE: For simplicity remove the uImage- prefix on the dtb files.  Get just the symlink
+    #       files for a cleaner name.  Use the DTB_FILTER variable to allow finding the
+    #       dtb files for only that MACHINE type
+    if [ "${DTB_FILTER}" != "unknown" ]
+    then
+        for f in `find ${DEPLOY_DIR_IMAGE} -type l -name "*${DTB_FILTER}*.dtb"`
+        do
+            dtb_file=`basename $f | sed s/uImage-//`
+            cp $f ${prebuilt_dir}/${dtb_file}
+        done
+    fi
+
     if [ "${SECONDARY_BOOTLOADER_NAME}" != "" ]
     then
         # Copy the secondary bootloader image if it exists
-- 
1.7.0.4


