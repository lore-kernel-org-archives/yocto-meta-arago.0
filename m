Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id 584CE5208C
	for <meta-arago@arago-project.org>;
	Mon,  5 Nov 2012 01:54:13 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id lz20so4802582obb.38
	for <meta-arago@arago-project.org>;
	Sun, 04 Nov 2012 17:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=8jdnSrEHeP8i5qnhz4WnGWIUGHPD3UY+zC6fJIcYtrM=;
	b=OP97Q3XfuE5rg8Vo1KSe18LVKg88kkSCouw1UB/IVOVN0IjGUpyXvJyloUuqN+padl
	8yspxH5Ylc38h/WHNXsHOWssIFnu8kitGsBtkQpzcYRXQ3uDzd4nbTiUu3rBYSgAy/gU
	M6/GTqkGS7Wmrkz/u9RfldTOSr4IldUFyLro47Va52DiRwobqfzjSQLMuuedfSHgSnwx
	Nh1w+J45w5OA/XZMuO4/AFg/uy/+dUIH7IMPXpDXokFt12wrv5fqvMlg4BhAfoc+GJ/7
	vpe8mxbDa3k8UdZZJtJ5nPgxFB/+QrIObOKamFOjmcfMB+yRDgaZdLLiP6TX7iKaxUtl
	RZlA==
Received: by 10.60.170.43 with SMTP id aj11mr6911772oec.71.1352080453056;
	Sun, 04 Nov 2012 17:54:13 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id v6sm12820300oeh.13.2012.11.04.17.54.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 04 Nov 2012 17:54:12 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Sun,  4 Nov 2012 19:53:17 -0600
Message-Id: <1352080417-9792-20-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1352080417-9792-1-git-send-email-fcooper@ti.com>
References: <1352080417-9792-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 22/42] arago-amsdk-image: Change the meta toolchain recipe used
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
X-List-Received-Date: Mon, 05 Nov 2012 01:54:13 -0000

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


