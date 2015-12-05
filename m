Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTPS id 88EB052A34
	for <meta-arago@arago-project.org>;
	Sat,  5 Dec 2015 03:18:09 +0000 (UTC)
Received: from gandalf.denix.org ([100.15.86.14]) by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPSA id <0NYV00HRX7TJE6Q0@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 04 Dec 2015 21:17:53 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=J+9Xl1TS c=1 sm=1 tr=0	a=xDJgBcBrK5EN9DJ6g74wNQ==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=wUQvQvOEmiQA:10 a=sozttTNsAAAA:8
	a=wu2g2PXzGwTBtfXfhPsA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 4A3F4161D37;	Fri,
	4 Dec 2015 22:17:43 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 04 Dec 2015 22:17:42 -0500
Message-id: <1449285462-22582-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] tisdk-image: rename PMMC firmware to new TI SCI name
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
X-List-Received-Date: Sat, 05 Dec 2015 03:18:09 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/classes/tisdk-image.bbclass | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-arago-distro/classes/tisdk-image.bbclass b/meta-arago-distro/classes/tisdk-image.bbclass
index bc9948f..e5d5e50 100644
--- a/meta-arago-distro/classes/tisdk-image.bbclass
+++ b/meta-arago-distro/classes/tisdk-image.bbclass
@@ -53,8 +53,8 @@ DEPLOY_SPL_NAME ?= "MLO-${MACHINE}"
 # Variable to specify the name of SPL/UART
 DEPLOY_SPL_UART_NAME ?= "u-boot-spl.bin-${MACHINE}"
 
-# Variable to specify the name of the PMMC firmware
-DEPLOY_PMMC_FW_NAME ?= "pmmc-firmware.bin"
+# Variable to specify the name of the TI SCI firmware
+DEPLOY_TISCI_FW_NAME ?= "ti-sci-firmware-k2g.bin"
 
 # Manifest file location which will be created as part of the image build
 # process.
@@ -758,12 +758,12 @@ tisdk_image_build () {
         fi
     fi
 
-    if [ "${DEPLOY_PMMC_FW_NAME}" != "" ]
+    if [ "${DEPLOY_TISCI_FW_NAME}" != "" ]
     then
-        # Copy pmmc firmware if it exists
-        if [ -e ${DEPLOY_DIR_IMAGE}/${DEPLOY_PMMC_FW_NAME} ]
+        # Copy TI SCI firmware if it exists
+        if [ -e ${DEPLOY_DIR_IMAGE}/${DEPLOY_TISCI_FW_NAME} ]
         then
-            cp ${DEPLOY_DIR_IMAGE}/${DEPLOY_PMMC_FW_NAME} ${prebuilt_dir}/
+            cp ${DEPLOY_DIR_IMAGE}/${DEPLOY_TISCI_FW_NAME} ${prebuilt_dir}/
         fi
     fi
 
-- 
2.2.0


