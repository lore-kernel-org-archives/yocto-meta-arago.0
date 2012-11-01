Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id CE459529A5
	for <meta-arago@arago-project.org>;
	Thu,  1 Nov 2012 18:44:05 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so2656821oag.38
	for <meta-arago@arago-project.org>;
	Thu, 01 Nov 2012 11:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=8jdnSrEHeP8i5qnhz4WnGWIUGHPD3UY+zC6fJIcYtrM=;
	b=XJELF4262Vw5dpmUMXnGwP9TV2BQKgQ/YUrdECTsGWQv+9I8vGu2GYAmjqxjxtWjfk
	hKEC4V9oaRS65iif1LGr3bFo98ap0QZ3irw2enm4JtcP0djwU1GUYfAnlb6gyBXLgfQI
	2oLnTgpKpE7WAheEWA18iI+6gLr5AKJ751rpmA6TPLAF3SksGAjS6TiSV9lbc6s/RTbe
	XKKmSWb+/xFjBHmj/dxaSiKqHUN/5z1AYjyc1Cybkd4c54yeKXTct6pHv7SgG9fRZ2+r
	Hq468g+QTYo+VXyVSTx5FYxGTkOArY0EbaoF4PcROsfUbwv5gzaAHZe3xiag/Y+U9zzq
	w42A==
Received: by 10.60.1.40 with SMTP id 8mr35882590oej.55.1351795445330;
	Thu, 01 Nov 2012 11:44:05 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id t1sm5461576oee.7.2012.11.01.11.44.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Nov 2012 11:44:04 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Thu,  1 Nov 2012 13:44:01 -0500
Message-Id: <1351795441-5212-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH] arago-amsdk-image: Change the meta toolchain recipe used
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
X-List-Received-Date: Thu, 01 Nov 2012 18:44:06 -0000

* Update the meta toolchain recipe that is used to an Arago SDK specific
  version.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/images/arago-amsdk-image.bb       |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/arago-amsdk-image.bb b/meta-arago-distro/recipes-core/images/arago-amsdk-image.bb
index 05778dd..ccb25b1 100644
--- a/meta-arago-distro/recipes-core/images/arago-amsdk-image.bb
+++ b/meta-arago-distro/recipes-core/images/arago-amsdk-image.bb
@@ -15,6 +15,8 @@ TOOLCHAIN_CLEANUP_PACKAGES = ""
 # List of target side images to build for the SDK
 TARGET_IMAGES = "arago-base-tisdk-image tisdk-rootfs-image"
 
+TISDK_TOOLCHAIN = "meta-toolchain-arago-tisdk"
+
 IMAGE_INSTALL = "\
     task-arago-tisdk-addons-sdk-host \
     task-arago-tisdk-connectivity-sdk-host \
-- 
1.7.0.4


