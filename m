Return-Path: <jake@udd0866934>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id BC47952A86
	for <meta-arago@arago-project.org>;
	Mon, 15 Feb 2016 17:19:36 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u1FHJZ5k001211
	for <meta-arago@arago-project.org>; Mon, 15 Feb 2016 11:19:35 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1FHJZTQ003736
	for <meta-arago@arago-project.org>; Mon, 15 Feb 2016 11:19:35 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 15 Feb 2016 11:19:35 -0600
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1FHJZvV029426;
	Mon, 15 Feb 2016 11:19:35 -0600
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1aVMoB-0000PE-0G; Mon, 15 Feb 2016 12:19:35 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 15 Feb 2016 12:19:29 -0500
Message-ID: <1455556771-1512-4-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1455556771-1512-1-git-send-email-j-stiffler@ti.com>
References: <1455556771-1512-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 3/5] tisdk-server-rootfs-image: Remove test-addons packagegroup
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
X-List-Received-Date: Mon, 15 Feb 2016 17:19:37 -0000
Content-Type: text/plain

* Save space in tisdk-server-rootfs-image ubifs by removing
  test-addons packagegroup
* Also remove the redundant test packagegroup

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb b/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb
index 53ea300..93ecc6f 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb
@@ -10,8 +10,6 @@ IMAGE_INSTALL += "\
     packagegroup-arago-tisdk-crypto \
     packagegroup-arago-tisdk-matrix \
     packagegroup-arago-base-tisdk-server-extra \
-    packagegroup-arago-test \
-    packagegroup-arago-test-addons \
 "
 
 export IMAGE_BASENAME = "tisdk-server-rootfs-image"
-- 
1.9.1


