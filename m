Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id 9A4F5529AD
	for <meta-arago@arago-project.org>;
	Mon,  5 Nov 2012 01:54:26 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id lz20so4802582obb.38
	for <meta-arago@arago-project.org>;
	Sun, 04 Nov 2012 17:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=jU3kkmkf6ByyXtVmPEv1qSFqOpswia4fWF04e2DDc98=;
	b=vHVHZsiO6zsFG7UHgwzSw7Zxorr6QOai7qDzdB8RtyNMDXcrmq9c6kPwC6/HCPTHhe
	VVJVp/PDqQmr5uA54LZbRFw0721XLn8gA/u0m+P2CBEZaMVGQHIt2y8fJJH/R4nlF6mm
	t9OlUhpoDOZ2P/xsXwUNXYsLeRxm+SbkiVjJnLY8pVlkRI+ngTaTTWab31FyennYpJAU
	uDQNH8CsiteqOi5J5v4w2c25DdKRvChgbRDY7G3ik7HckEot7/Zt8YzR5Uyru1lriTrp
	wQft3t0x0/Gkzol/dZFnqhntivm1KBDI8qc6jC+UzcM/lxz9DF5Z678O8YdzSw1dINeo
	LpRw==
Received: by 10.182.69.36 with SMTP id b4mr6574278obu.96.1352080466352;
	Sun, 04 Nov 2012 17:54:26 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id v6sm12820300oeh.13.2012.11.04.17.54.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 04 Nov 2012 17:54:25 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Sun,  4 Nov 2012 19:53:30 -0600
Message-Id: <1352080417-9792-33-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1352080417-9792-1-git-send-email-fcooper@ti.com>
References: <1352080417-9792-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 35/42] tisdk-image: Change the filename of the toolchain sdk that should be used
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
X-List-Received-Date: Mon, 05 Nov 2012 01:54:27 -0000

* The TI Arago SDK specific toolchain sdk filename uses tisdk instead of sdk.
* Update the class to reflect this change

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 meta-arago-distro/classes/tisdk-image.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-arago-distro/classes/tisdk-image.bbclass b/meta-arago-distro/classes/tisdk-image.bbclass
index 368a650..3222d0d 100644
--- a/meta-arago-distro/classes/tisdk-image.bbclass
+++ b/meta-arago-distro/classes/tisdk-image.bbclass
@@ -484,7 +484,7 @@ do_sdk_image () {
 
     # Extract the toolchain SDK here so that it will be available when the
     # OPKG_POSTPROCESS_COMMANDS are run
-    tar xjf ${DEPLOY_DIR}/sdk/${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}-sdk-${SDK_ARCH}* -C ${IMAGE_ROOTFS}/
+    tar xjf ${DEPLOY_DIR}/sdk/${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}-tisdk-${SDK_ARCH}* -C ${IMAGE_ROOTFS}/
     mv ${IMAGE_ROOTFS}/${SDK_NAME} ${IMAGE_ROOTFS}/${TISDK_TOOLCHAIN_PATH}
 
     # Creat the base SDK image
-- 
1.7.0.4


