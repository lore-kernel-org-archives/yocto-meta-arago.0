Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 2A15152A7C
	for <meta-arago@arago-project.org>;
	Tue, 17 Sep 2013 18:32:59 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8HIWw2d021706
	for <meta-arago@arago-project.org>; Tue, 17 Sep 2013 13:32:58 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8HIWwk1013491
	for <meta-arago@arago-project.org>; Tue, 17 Sep 2013 13:32:58 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 17 Sep 2013 13:32:57 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8HIWtRv016554;
	Tue, 17 Sep 2013 13:32:56 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 17 Sep 2013 14:13:21 -0500
Message-ID: <1379445202-31364-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 1/2] tisdk-rootfs-base-image: Rename base file system image
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
X-List-Received-Date: Tue, 17 Sep 2013 18:32:59 -0000
Content-Type: text/plain

* People are frequently confused by the difference in naming between the minimal
  file system and the larger file system.
* Rename the minimal file system to mimic the naming convention of the larger
  file system.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 ...e-tisdk-image.bb => tisdk-rootfs-base-image.bb} |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)
 rename meta-arago-distro/recipes-core/images/{arago-base-tisdk-image.bb => tisdk-rootfs-base-image.bb} (87%)

diff --git a/meta-arago-distro/recipes-core/images/arago-base-tisdk-image.bb b/meta-arago-distro/recipes-core/images/tisdk-rootfs-base-image.bb
similarity index 87%
rename from meta-arago-distro/recipes-core/images/arago-base-tisdk-image.bb
rename to meta-arago-distro/recipes-core/images/tisdk-rootfs-base-image.bb
index 2c0e217..a3a9123 100644
--- a/meta-arago-distro/recipes-core/images/arago-base-tisdk-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-rootfs-base-image.bb
@@ -12,4 +12,4 @@ IMAGE_INSTALL += "\
     packagegroup-arago-base-tisdk \
     "
 
-export IMAGE_BASENAME = "arago-base-tisdk-image"
+export IMAGE_BASENAME = "tisdk-rootfs-base-image"
-- 
1.7.0.4


