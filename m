Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTPS id F0EC05208B
	for <meta-arago@arago-project.org>;
	Wed,  3 Feb 2016 20:59:23 +0000 (UTC)
Received: from gandalf.denix.org ([100.15.86.14]) by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPSA id <0O1Z007C3OYF6O70@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 03 Feb 2016 14:59:03 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Nc0brD34 c=1 sm=1 tr=0	a=xDJgBcBrK5EN9DJ6g74wNQ==:117
	a=jFJIQSaiL_oA:10 a=sozttTNsAAAA:8	a=ztUL1BmNLBpAi8s-rQgA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 1B35E161E3F;	Wed,
	3 Feb 2016 15:59:03 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 03 Feb 2016 15:59:02 -0500
Message-id: <1454533142-25375-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] tisdk-image: add packaging of skern and k2-fw-initrd to prebuilt-images/
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
X-List-Received-Date: Wed, 03 Feb 2016 20:59:26 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/classes/tisdk-image.bbclass | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/classes/tisdk-image.bbclass b/meta-arago-distro/classes/tisdk-image.bbclass
index e5d5e50..86fbb58 100644
--- a/meta-arago-distro/classes/tisdk-image.bbclass
+++ b/meta-arago-distro/classes/tisdk-image.bbclass
@@ -56,6 +56,12 @@ DEPLOY_SPL_UART_NAME ?= "u-boot-spl.bin-${MACHINE}"
 # Variable to specify the name of the TI SCI firmware
 DEPLOY_TISCI_FW_NAME ?= "ti-sci-firmware-k2g.bin"
 
+# Variable to specify the name of Keystone skern file (it has SOC in the name, not MACHINE)
+DEPLOY_K2_SKERN_NAME ?= "skern-*.bin"
+
+# Variable to specify the name of Keystone initramfs with FW images
+DEPLOY_K2_FW_INITRD_NAME ?= "k2-fw-initrd.cpio.gz"
+
 # Manifest file location which will be created as part of the image build
 # process.
 # This manifest follows the TI manifest format requirements which is why
@@ -758,15 +764,33 @@ tisdk_image_build () {
         fi
     fi
 
+    # Copy TI SCI firmware if it exists
     if [ "${DEPLOY_TISCI_FW_NAME}" != "" ]
     then
-        # Copy TI SCI firmware if it exists
         if [ -e ${DEPLOY_DIR_IMAGE}/${DEPLOY_TISCI_FW_NAME} ]
         then
             cp ${DEPLOY_DIR_IMAGE}/${DEPLOY_TISCI_FW_NAME} ${prebuilt_dir}/
         fi
     fi
 
+    # Copy skern/boot-monitor image if it exists
+    if [ "${DEPLOY_K2_SKERN_NAME}" != "" ]
+    then
+        if [ -e ${DEPLOY_DIR_IMAGE}/${DEPLOY_K2_SKERN_NAME} ]
+        then
+            cp ${DEPLOY_DIR_IMAGE}/${DEPLOY_K2_SKERN_NAME} ${prebuilt_dir}/
+        fi
+    fi
+
+    # Copy Keystone FW initramfs image if it exists
+    if [ "${DEPLOY_K2_FW_INITRD_NAME}" != "" ]
+    then
+        if [ -e ${DEPLOY_DIR_IMAGE}/${DEPLOY_K2_FW_INITRD_NAME} ]
+        then
+            cp ${DEPLOY_DIR_IMAGE}/${DEPLOY_K2_FW_INITRD_NAME} ${prebuilt_dir}/
+        fi
+    fi
+
     # Add the EXTRA_TISDK_FILES contents if they exist
     # Make sure EXTRA_TISDK_FILES is not empty so we don't accidentaly
     # copy the root directory.
-- 
2.2.0


