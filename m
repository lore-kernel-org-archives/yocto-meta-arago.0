Return-Path: <denis@denix.org>
Received: from vms173007pub.verizon.net (vms173007pub.verizon.net
	[206.46.173.7])
	by arago-project.org (Postfix) with ESMTP id DB31152992
	for <meta-arago@arago-project.org>;
	Tue, 25 Jun 2013 01:54:58 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MOX00190EN1N8Z3@vms173007.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 24 Jun 2013 20:54:43 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id BBC9F2004C; Mon,
	24 Jun 2013 21:54:37 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 24 Jun 2013 21:54:30 -0400
Message-id: <1372125270-6534-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.2.1
Subject: [PATCH] tisdk-image: add handling for SPL/UART version of the bootloader, if exists
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
X-List-Received-Date: Tue, 25 Jun 2013 01:54:59 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/classes/tisdk-image.bbclass      | 26 ++++++++++++++++------
 .../recipes-core/images/arago-amsdk-image.bb       |  2 +-
 .../recipes-core/images/arago-core-tisdk-image.bb  |  2 +-
 3 files changed, 21 insertions(+), 9 deletions(-)

diff --git a/meta-arago-distro/classes/tisdk-image.bbclass b/meta-arago-distro/classes/tisdk-image.bbclass
index f533a90..d3b97ee 100644
--- a/meta-arago-distro/classes/tisdk-image.bbclass
+++ b/meta-arago-distro/classes/tisdk-image.bbclass
@@ -46,8 +46,11 @@ TARGET_IMAGE_TYPES ?= "tar.bz2 tar.gz ubi"
 # the variable is in the BB_ENV_EXTRAWHITE list.
 EXTRA_TISDK_FILES ?= ""
 
-# Variable to specify the name of the secondary bootloader
-SECONDARY_BOOTLOADER_NAME ?= "MLO-${MACHINE}"
+# Variable to specify the name of SPL
+DEPLOY_SPL_NAME ?= "MLO-${MACHINE}"
+
+# Variable to specify the name of SPL/UART
+DEPLOY_SPL_UART_NAME ?= "u-boot-spl.bin-${MACHINE}"
 
 # Manifest file location which will be created as part of the image build
 # process.
@@ -541,18 +544,27 @@ do_sdk_image () {
         done
     fi
 
-    if [ "${SECONDARY_BOOTLOADER_NAME}" != "" ]
+    if [ "${DEPLOY_SPL_NAME}" != "" ]
     then
-        # Copy the secondary bootloader image if it exists
-        if [ -e ${DEPLOY_DIR_IMAGE}/${SECONDARY_BOOTLOADER_NAME} ]
+        # Copy the SPL image if it exists
+        if [ -e ${DEPLOY_DIR_IMAGE}/${DEPLOY_SPL_NAME} ]
         then
-            cp ${DEPLOY_DIR_IMAGE}/${SECONDARY_BOOTLOADER_NAME} ${prebuilt_dir}/
+            cp ${DEPLOY_DIR_IMAGE}/${DEPLOY_SPL_NAME} ${prebuilt_dir}/
         else
-            echo "Could not find the secondary bootloader image"
+            echo "Could not find the SPL image"
             return 1
         fi
     fi
 
+    if [ "${DEPLOY_SPL_UART_NAME}" != "" ]
+    then
+        # Copy the SPL/UART image if it exists
+        if [ -e ${DEPLOY_DIR_IMAGE}/${DEPLOY_SPL_UART_NAME} ]
+        then
+            cp ${DEPLOY_DIR_IMAGE}/${DEPLOY_SPL_UART_NAME} ${prebuilt_dir}/
+        fi
+    fi
+
     # Add the EXTRA_TISDK_FILES contents if they exist
     # Make sure EXTRA_TISDK_FILES is not empty so we don't accidentaly
     # copy the root directory.
diff --git a/meta-arago-distro/recipes-core/images/arago-amsdk-image.bb b/meta-arago-distro/recipes-core/images/arago-amsdk-image.bb
index 5cb2bc5..5995507 100644
--- a/meta-arago-distro/recipes-core/images/arago-amsdk-image.bb
+++ b/meta-arago-distro/recipes-core/images/arago-amsdk-image.bb
@@ -1,5 +1,5 @@
 require arago-core-tisdk-image.inc
 
-SECONDARY_BOOTLOADER_NAME_omapl138 = ""
+DEPLOY_SPL_NAME_omapl138 = ""
 
 export IMAGE_BASENAME = "arago-amsdk-image"
diff --git a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb
index 608386f..33bfc11 100644
--- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb
+++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb
@@ -1,5 +1,5 @@
 require arago-core-tisdk-image.inc
 
-SECONDARY_BOOTLOADER_NAME_omapl138 = ""
+DEPLOY_SPL_NAME_omapl138 = ""
 
 export IMAGE_BASENAME = "arago-core-tisdk-image"
-- 
1.8.2.1


