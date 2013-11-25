Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id B9ED352AB9
	for <meta-arago@arago-project.org>;
	Mon, 25 Nov 2013 15:51:15 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id rAPFpFo0016588
	for <meta-arago@arago-project.org>; Mon, 25 Nov 2013 09:51:15 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAPFpFi2010249
	for <meta-arago@arago-project.org>; Mon, 25 Nov 2013 09:51:15 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 25 Nov 2013 09:51:14 -0600
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAPFouk3009147;
	Mon, 25 Nov 2013 09:51:13 -0600
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 25 Nov 2013 10:54:02 -0600
Message-ID: <1385398442-24668-7-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1385398442-24668-1-git-send-email-fcooper@ti.com>
References: <1385398442-24668-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 7/7] images: Update images to reflect packagegroup renaming
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
X-List-Received-Date: Mon, 25 Nov 2013 15:51:16 -0000
Content-Type: text/plain

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/images/arago-core-tisdk-image.inc |    2 +-
 .../recipes-core/images/tisdk-rootfs-image.bb      |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
index 74c2b87..30e1da5 100644
--- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
@@ -33,6 +33,6 @@ IMAGE_INSTALL = "\
     packagegroup-arago-tisdk-crypto-sdk-host \
     packagegroup-arago-tisdk-matrix-sdk-host \
     packagegroup-arago-tisdk-multimedia-sdk-host \
-    packagegroup-arago-tisdk-qte-sdk-host \
+    packagegroup-arago-tisdk-qt-sdk-host \
     packagegroup-arago-tisdk-amsdk-sdk-host \
 "
diff --git a/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb b/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
index 1bc6a36..2c3210f 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
@@ -5,7 +5,7 @@ require arago-base-tisdk-image.bb
 IMAGE_INSTALL += "\
     packagegroup-arago-test \
     ${@base_contains('MACHINE_FEATURES','sgx','packagegroup-arago-tisdk-graphics','',d)} \
-    packagegroup-arago-tisdk-qte \
+    packagegroup-arago-tisdk-qt \
     packagegroup-arago-tisdk-addons \
     packagegroup-arago-tisdk-connectivity \
     packagegroup-arago-tisdk-crypto \
-- 
1.7.0.4


