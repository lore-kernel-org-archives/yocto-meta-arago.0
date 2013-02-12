Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f43.google.com (mail-oa0-f43.google.com
	[209.85.219.43])
	by arago-project.org (Postfix) with ESMTPS id 4122C52A25
	for <meta-arago@arago-project.org>;
	Tue, 12 Feb 2013 00:46:43 +0000 (UTC)
Received: by mail-oa0-f43.google.com with SMTP id l10so6945125oag.16
	for <meta-arago@arago-project.org>;
	Mon, 11 Feb 2013 16:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=PEkWRyF6WtkuqmHELCjmLctqDIoW1eInkGGWcGdM2IA=;
	b=Wnj4FpigBdWp+nBIvPsS6yWs4VyB5gDCS3t6JqSCvdsf2qsgeTB5KxJvPEZiHo9Xuu
	xW2lUUUJWHZibH0dTwXY8Y2j9yoeZnl397K+9Ahea4ev/chZ8SZkiv+O+R8I070q8Lom
	WTYEu+DPf8IaeueAnVc6ZhtDVUD9nPxemFQyLf6+cJslnC3w3JGREKTSLRrOmD5I6FKF
	TXw62qLl+MMuETJS1CRtPohZPgB/gqvUeVeoygszUi3sQrEwCk5b0FgobTLett+Mn+58
	VFACb+pPf5BkxI1tbQDJUCuXKZ7gOKhc93RWe2LX/1Dteq692P4oGZ/jXxznKu/bFGiP
	dzMg==
X-Received: by 10.182.217.10 with SMTP id ou10mr12076842obc.30.1360630002408; 
	Mon, 11 Feb 2013 16:46:42 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id b6sm52434322oee.3.2013.02.11.16.46.40
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 11 Feb 2013 16:46:41 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Mon, 11 Feb 2013 18:46:10 -0600
Message-Id: <1360629979-24789-9-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1360629979-24789-1-git-send-email-fcooper@ti.com>
References: <1360629979-24789-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 09/18] tisdk-image.bbclass: Create SECONDARY_BOOTLOADER_NAME variable
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
X-List-Received-Date: Tue, 12 Feb 2013 00:46:43 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* Am180x-evm secondary bootloader isn't built as part of OE.
* Tisdk-image.bbclass fails since no MLO is copied as part of the am180x-evm
  SDK.
* Use a user defined variable to specify the secondary bootloader and allow the
  copy step to be skipped if secondary bootloader variable is an empty string.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 meta-arago-distro/classes/tisdk-image.bbclass |   18 ++++++++++++------
 1 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/meta-arago-distro/classes/tisdk-image.bbclass b/meta-arago-distro/classes/tisdk-image.bbclass
index 4434155..adc6359 100644
--- a/meta-arago-distro/classes/tisdk-image.bbclass
+++ b/meta-arago-distro/classes/tisdk-image.bbclass
@@ -46,6 +46,9 @@ TARGET_IMAGE_TYPES ?= "tar.bz2 tar.gz ubi"
 # the variable is in the BB_ENV_EXTRAWHITE list.
 EXTRA_TISDK_FILES ?= ""
 
+# Variable to specify the name of the secondary bootloader
+SECONDARY_BOOTLOADER_NAME ?= "MLO-${MACHINE}"
+
 # Manifest file location which will be created as part of the image build
 # process.
 # This manifest follows the TI manifest format requirements which is why
@@ -552,13 +555,16 @@ do_sdk_image () {
         return 1
     fi
 
-    # Copy the MLO image if it exists
-    if [ -e ${DEPLOY_DIR_IMAGE}/MLO-${MACHINE} ]
+    if [ "${SECONDARY_BOOTLOADER_NAME}" != "" ]
     then
-        cp ${DEPLOY_DIR_IMAGE}/MLO-${MACHINE} ${prebuilt_dir}/
-    else
-        echo "Could not find the MLO image"
-        return 1
+        # Copy the secondary bootloader image if it exists
+        if [ -e ${DEPLOY_DIR_IMAGE}/${SECONDARY_BOOTLOADER_NAME} ]
+        then
+            cp ${DEPLOY_DIR_IMAGE}/${SECONDARY_BOOTLOADER_NAME} ${prebuilt_dir}/
+        else
+            echo "Could not find the secondary bootloader image"
+            return 1
+        fi
     fi
 
     # Add the EXTRA_TISDK_FILES contents if they exist
-- 
1.7.0.4


