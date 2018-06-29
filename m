Return-Path: <j-stiffler@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id F0397529A9
	for <meta-arago@arago-project.org>;
	Fri, 29 Jun 2018 18:13:52 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w5TIDkXE058947
	for <meta-arago@arago-project.org>; Fri, 29 Jun 2018 13:13:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1530296026;
	bh=sm9+cNSJv7Ni5cYV5zQJd7PeGvnpR6JSwbwy4kHKfyM=;
	h=From:To:CC:Subject:Date;
	b=ceNQPLPt/gkZQ4MLMcJ56FxE6M/AXe2TeBIzkTepJ8GVkHecR1nGtTEoYfbm0zLk3
	+jVpqEDl/d5Z2GopA145NVdrYcw4YMjY3rIZk6TO6lp3Fgbb100p8udXYY8JzL7z6j
	rU58r4lUHlB/5/mSeEppVf3OjTRtav3iscJtWCvw=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5TIDk4e001424
	for <meta-arago@arago-project.org>; Fri, 29 Jun 2018 13:13:46 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 29 Jun 2018 13:13:46 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 29 Jun 2018 13:13:46 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5TIDkuZ009171;
	Fri, 29 Jun 2018 13:13:46 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 29 Jun 2018 14:02:24 -0400
Message-ID: <1530295345-4640-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH 1/2] tisdk-image: add common method for prebuilt images
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
X-List-Received-Date: Fri, 29 Jun 2018 18:13:53 -0000
Content-Type: text/plain

* TBD: migrate existing methods to use this

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-distro/classes/tisdk-image.bbclass | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta-arago-distro/classes/tisdk-image.bbclass b/meta-arago-distro/classes/tisdk-image.bbclass
index 4ae3a80..d38166d 100644
--- a/meta-arago-distro/classes/tisdk-image.bbclass
+++ b/meta-arago-distro/classes/tisdk-image.bbclass
@@ -52,6 +52,9 @@ EXTRA_TISDK_FILES ?= ""
 # Variable to specify the name of SPL
 DEPLOY_SPL_NAME ?= "MLO-${MACHINE}"
 
+# Add generic method of adding prebuilt-images
+DEPLOY_IMAGES_NAME ?= ""
+
 # Variable to specify the name of SPL/UART
 DEPLOY_SPL_UART_NAME ?= "u-boot-spl.bin-${MACHINE}"
 
@@ -784,6 +787,17 @@ tisdk_image_build () {
         fi
     done
 
+    for image_name in ${DEPLOY_IMAGES_NAME}
+    do
+        if [ -e ${DEPLOY_DIR_IMAGE}/$image_name ]
+        then
+            cp ${DEPLOY_DIR_IMAGE}/$image_name ${prebuilt_dir}/
+        else
+            echo "Could not find image \"$image_name\""
+            return 1
+        fi
+    done
+
     if [ "${DEPLOY_SPL_UART_NAME}" != "" ]
     then
         # Copy the SPL/UART image if it exists
-- 
2.7.4


