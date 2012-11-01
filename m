Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id E8C29529B8
	for <meta-arago@arago-project.org>;
	Thu,  1 Nov 2012 18:35:55 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id lz20so2627119obb.38
	for <meta-arago@arago-project.org>;
	Thu, 01 Nov 2012 11:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=SXRGg8eGaBUudrURt5UhAWul1FXMPGsbDTy49OM21OU=;
	b=ny9Rwtcs7zluycHh+vXD09xZNJySzLxHm7IK8HPizqDEXwuDCEQtQluh5lhAHoXWhO
	F5aXpo5c8+x4TdWcuTz5p2J+4AnBgcZnwFN1bjwtPqAAqEtc7oxGCmwsJTelzjQrMwMr
	OAIHRZVReHml4p0WDe+LzKoDoZ5mglZSVMJ/gOkiT0qPEMSK9F0OVxNxY9DGeOxIvRzW
	98XiKTepf6Y6BldCUhyAUbndkw9YFak+SwadjWyDnpQF3FLxbifC6spE/GP5q0vTj3wv
	kBOMd89jOjMWlb7QDXYNRTc2MUjE8AnHdsiZd1nXzWD/P3yvCabKgoEG7DtFbjQLtzob
	A6/w==
Received: by 10.60.22.104 with SMTP id c8mr4676464oef.78.1351794955439;
	Thu, 01 Nov 2012 11:35:55 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id q1sm5445793oeh.8.2012.11.01.11.35.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Nov 2012 11:35:54 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Thu,  1 Nov 2012 13:35:50 -0500
Message-Id: <1351794950-4321-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH] arago-amsdk-image: Add additional tasks and image
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
X-List-Received-Date: Thu, 01 Nov 2012 18:35:56 -0000

* Add additional sdk-host tasks and target filesystem image

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/images/arago-amsdk-image.bb       |   13 ++++++++++---
 1 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/arago-amsdk-image.bb b/meta-arago-distro/recipes-core/images/arago-amsdk-image.bb
index 82e0527..6ddcb8b 100644
--- a/meta-arago-distro/recipes-core/images/arago-amsdk-image.bb
+++ b/meta-arago-distro/recipes-core/images/arago-amsdk-image.bb
@@ -13,9 +13,16 @@ HOST_CLEANUP_PACKAGES = ""
 TOOLCHAIN_CLEANUP_PACKAGES = ""
 
 # List of target side images to build for the SDK
-TARGET_IMAGES = "arago-base-tisdk-image"
-
-IMAGE_INSTALL = "task-arago-tisdk-addons-sdk-host"
+TARGET_IMAGES = "arago-base-tisdk-image tisdk-rootfs-image"
+
+IMAGE_INSTALL = "\
+    task-arago-tisdk-addons-sdk-host \
+    task-arago-tisdk-connectivity-sdk-host \
+    task-arago-tisdk-crypto-sdk-host \
+    task-arago-tisdk-matrix-sdk-host \
+    task-arago-tisdk-multimedia-sdk-host \
+    task-arago-tisdk-qte-sdk-host \
+"
 
 export IMAGE_BASENAME = "arago-amsdk-image"
 
-- 
1.7.0.4


