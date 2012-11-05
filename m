Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id 31B6F5208C
	for <meta-arago@arago-project.org>;
	Mon,  5 Nov 2012 01:53:54 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so4861422oag.38
	for <meta-arago@arago-project.org>;
	Sun, 04 Nov 2012 17:53:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=SXRGg8eGaBUudrURt5UhAWul1FXMPGsbDTy49OM21OU=;
	b=zWB+TpdXBk3+1KpD1RLS0Oj65RaXG0YMsO9KxC7zmVOOUCdDSpAb+GqowSC1AWwKoc
	9hVwwQLzXpOi9f7/cO6WO3C4ZI3L8v6A/RpMoVEdkcJqKoUfeSFRw6zYZ1rMRHySGRSW
	9i7fZ6cpUqwxByCZplE/sEM+3yyYKv/dCbGyhwLt9HV9jsynbf9FVCNqQgqVy97Ept6c
	fRmrSYStXfgHGGATihEEhoVo0+a0OTXrbEe3O1KQQhn2rT/IAOrLssPVtVmFkazXb1Rq
	/PHzcLoJorluE6viYEiM2DbVUWKlIBIzB4b/ISkhL7vs9aEZXOn2gD5gAX3TjCo6q1bn
	dj0Q==
Received: by 10.60.27.166 with SMTP id u6mr6573182oeg.86.1352080433964;
	Sun, 04 Nov 2012 17:53:53 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id v6sm12820300oeh.13.2012.11.04.17.53.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 04 Nov 2012 17:53:53 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Sun,  4 Nov 2012 19:53:02 -0600
Message-Id: <1352080417-9792-5-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1352080417-9792-1-git-send-email-fcooper@ti.com>
References: <1352080417-9792-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 07/42] arago-amsdk-image: Add additional tasks and image
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
X-List-Received-Date: Mon, 05 Nov 2012 01:53:54 -0000

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


