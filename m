Return-Path: <jake@udd0866934>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 5F90052976
	for <meta-arago@arago-project.org>;
	Wed, 25 Nov 2015 20:32:25 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id tAPKWMaG032560
	for <meta-arago@arago-project.org>; Wed, 25 Nov 2015 14:32:22 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id tAPKWMXB031036
	for <meta-arago@arago-project.org>; Wed, 25 Nov 2015 14:32:22 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 25 Nov 2015 14:32:22 -0600
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id tAPKWLmu032753;
	Wed, 25 Nov 2015 14:32:22 -0600
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1a1gjl-0006Vj-9S; Wed, 25 Nov 2015 15:32:21 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 25 Nov 2015 15:32:19 -0500
Message-ID: <1448483539-24993-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] tisdk-image.bbclass: Copy pmmc-firmware to prebuilt-images
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
X-List-Received-Date: Wed, 25 Nov 2015 20:32:28 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-distro/classes/tisdk-image.bbclass | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta-arago-distro/classes/tisdk-image.bbclass b/meta-arago-distro/classes/tisdk-image.bbclass
index b78311f..bc9948f 100644
--- a/meta-arago-distro/classes/tisdk-image.bbclass
+++ b/meta-arago-distro/classes/tisdk-image.bbclass
@@ -53,6 +53,9 @@ DEPLOY_SPL_NAME ?= "MLO-${MACHINE}"
 # Variable to specify the name of SPL/UART
 DEPLOY_SPL_UART_NAME ?= "u-boot-spl.bin-${MACHINE}"
 
+# Variable to specify the name of the PMMC firmware
+DEPLOY_PMMC_FW_NAME ?= "pmmc-firmware.bin"
+
 # Manifest file location which will be created as part of the image build
 # process.
 # This manifest follows the TI manifest format requirements which is why
@@ -755,6 +758,15 @@ tisdk_image_build () {
         fi
     fi
 
+    if [ "${DEPLOY_PMMC_FW_NAME}" != "" ]
+    then
+        # Copy pmmc firmware if it exists
+        if [ -e ${DEPLOY_DIR_IMAGE}/${DEPLOY_PMMC_FW_NAME} ]
+        then
+            cp ${DEPLOY_DIR_IMAGE}/${DEPLOY_PMMC_FW_NAME} ${prebuilt_dir}/
+        fi
+    fi
+
     # Add the EXTRA_TISDK_FILES contents if they exist
     # Make sure EXTRA_TISDK_FILES is not empty so we don't accidentaly
     # copy the root directory.
-- 
1.9.1


