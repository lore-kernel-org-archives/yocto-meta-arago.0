Return-Path: <jake@udd0866934>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id F169D52A34
	for <meta-arago@arago-project.org>;
	Thu, 17 Sep 2015 16:02:24 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t8HG2Ogr025870
	for <meta-arago@arago-project.org>; Thu, 17 Sep 2015 11:02:24 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t8HG2O9v027968
	for <meta-arago@arago-project.org>; Thu, 17 Sep 2015 11:02:24 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 17 Sep 2015 11:02:24 -0500
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t8HG2Nn7003970;
	Thu, 17 Sep 2015 11:02:23 -0500
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1Zcbdf-0002Gf-0p; Thu, 17 Sep 2015 12:02:23 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 17 Sep 2015 12:02:21 -0400
Message-ID: <1442505741-8683-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] HACK: tisdk-server-rootfs-image: Force IMAGE_BASENAME to match recipe name
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
X-List-Received-Date: Thu, 17 Sep 2015 16:02:25 -0000
Content-Type: text/plain

* There is an issue with the tisdk-image.bbclass where for the
  TARGET_IMAGES, the IMAGE_BASENAME must match the image recipe name.
* This works around that issue by setting the IMAGE_BASENAME to the
  recipe name.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb b/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb
index a552ed6..3928948 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb
@@ -13,4 +13,4 @@ IMAGE_INSTALL += "\
     gdb \
 "
 
-export IMAGE_BASENAME = "tisdk-rootfs"
+export IMAGE_BASENAME = "tisdk-server-rootfs-image"
-- 
1.9.1


