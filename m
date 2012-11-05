Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id 04DBF5208C
	for <meta-arago@arago-project.org>;
	Mon,  5 Nov 2012 01:54:06 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so4861422oag.38
	for <meta-arago@arago-project.org>;
	Sun, 04 Nov 2012 17:54:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=EKv4wqgZ0VQFMQeWlx9GdU6kxZwwC0wB7Z2/lhlROY8=;
	b=BNGNMxMjUW+32SuOxXpAgh/ls3nIOSysm1m7dagmViGH1mJ7/84T43cCsO7hejO4OS
	aHiN1IoQ2wcQzlC+jfLLAuse5BtruAcRgI4Fa1EMSWzTVIXjj/RIhAaZy1TF752f5VOA
	+gK8q4JEw54za6wSQNL6b79I5NRfDee5V/FmbhQHLRyLPGkAScGHbUrt82E3Qm5UxiWS
	TV0uB7nekZiWeeKcFnTdfw44dS+6YlJnrHvGkhAjNbMy9oirYipTna7X9lf0aaTXgdiR
	u7qezZmTLKqrkravxKXEbP8lsOBierkD7Celhwh2hZBoo+PLGe3vtQ5tAOe65smlMpJB
	VIPA==
Received: by 10.182.17.72 with SMTP id m8mr6597177obd.55.1352080446724;
	Sun, 04 Nov 2012 17:54:06 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id v6sm12820300oeh.13.2012.11.04.17.54.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 04 Nov 2012 17:54:06 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Sun,  4 Nov 2012 19:53:11 -0600
Message-Id: <1352080417-9792-14-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1352080417-9792-1-git-send-email-fcooper@ti.com>
References: <1352080417-9792-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 16/42] arago-tisdk-image: Rename recipe to tisdk-rootfs-image
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
X-List-Received-Date: Mon, 05 Nov 2012 01:54:07 -0000

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


