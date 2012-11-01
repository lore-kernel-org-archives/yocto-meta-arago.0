Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id BDB73529A5
	for <meta-arago@arago-project.org>;
	Thu,  1 Nov 2012 18:40:48 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so2653368oag.38
	for <meta-arago@arago-project.org>;
	Thu, 01 Nov 2012 11:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=EKv4wqgZ0VQFMQeWlx9GdU6kxZwwC0wB7Z2/lhlROY8=;
	b=XtNgk1hANz4qgJSdGSdVRpUHbXrPMjorOTRm/fnNc/5BShEZhX2/pv/KGv94wqgyAI
	yqc0bXjAYJm9jD5kb7eoW4hII3SvsbI8QIB9sMBEAW1+/pyGs0r2jhp5lVaFZ0XeuxRy
	L03wkERvRX2tGEOn9vYtQvfRP4R6vaIAVjXDkwnEGzwoY8NxPXIIUbN4M17gBBjaj1bl
	FykuSuzIr3JQxTTnpICTIE+tc92evD2ZM9xjuN7DWIMz+iTmkuC3jA6RhWEfAw938HB3
	mykzwUBvP2CI5GEPcdImilmuARLNLeKwBbMjJVkLcf3qjkHQTp/xROteTyN95w4+iBde
	e2JQ==
Received: by 10.60.31.135 with SMTP id a7mr34086011oei.26.1351795248260;
	Thu, 01 Nov 2012 11:40:48 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id k8sm5450933oee.11.2012.11.01.11.40.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Nov 2012 11:40:47 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Thu,  1 Nov 2012 13:40:44 -0500
Message-Id: <1351795244-4846-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH] arago-tisdk-image: Rename recipe to tisdk-rootfs-image
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
X-List-Received-Date: Thu, 01 Nov 2012 18:40:48 -0000

* The class tisdk-image had issues with an image having a name that is
  different than the recipe name.
* Renaming the image recipe to match the name of the image that is created.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 ...{arago-tisdk-image.bb => tisdk-rootfs-image.bb} |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)
 rename meta-arago-distro/recipes-core/images/{arago-tisdk-image.bb => tisdk-rootfs-image.bb} (90%)

diff --git a/meta-arago-distro/recipes-core/images/arago-tisdk-image.bb b/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
similarity index 90%
rename from meta-arago-distro/recipes-core/images/arago-tisdk-image.bb
rename to meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
index 970e7a9..fc5d39e 100644
--- a/meta-arago-distro/recipes-core/images/arago-tisdk-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
@@ -17,4 +17,4 @@ IMAGE_INSTALL += "\
     task-arago-tisdk-amsdk \
 "
 
-export IMAGE_BASENAME = "tisdk-rootfs"
+export IMAGE_BASENAME = "tisdk-rootfs-image"
-- 
1.7.0.4


