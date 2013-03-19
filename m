Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 133DD52961
	for <meta-arago@arago-project.org>;
	Tue, 19 Mar 2013 15:14:18 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2JFEFHD009719
	for <meta-arago@arago-project.org>; Tue, 19 Mar 2013 10:14:16 -0500
Received: from DBDE71.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2JFEFF0005796
	for <meta-arago@arago-project.org>;
	Tue, 19 Mar 2013 20:44:15 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by DBDE71.ent.ti.com
	(172.24.170.149) with Microsoft SMTP Server id 14.1.323.3;
	Tue, 19 Mar 2013 20:44:15 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2JFE4lT023952;
	Tue, 19 Mar 2013 20:44:14 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 19 Mar 2013 10:14:02 -0500
Message-ID: <1363706042-10182-7-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1363706042-10182-1-git-send-email-Chase.Maupin@ti.com>
References: <1363706042-10182-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 7/7] arago-amsdk-image: Update to use the core SDK image
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
X-List-Received-Date: Tue, 19 Mar 2013 15:14:18 -0000
Content-Type: text/plain

* Update the image to be based on the shared core SDK image.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../recipes-core/images/arago-amsdk-image.bb       |   29 +-------------------
 1 files changed, 1 insertions(+), 28 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/arago-amsdk-image.bb b/meta-arago-distro/recipes-core/images/arago-amsdk-image.bb
index 08b460e..5cb2bc5 100644
--- a/meta-arago-distro/recipes-core/images/arago-amsdk-image.bb
+++ b/meta-arago-distro/recipes-core/images/arago-amsdk-image.bb
@@ -1,32 +1,5 @@
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
-
-IMAGE_FSTYPES = "tar.gz"
-
-inherit tisdk-image
-
-COMPATIBLE_MACHINE = "omap3|omapl138|ti33x"
-
-# List of packages to remove from the host package.  This is usually due to
-# licensing issues and unneeded dependencies.
-HOST_CLEANUP_PACKAGES = ""
-TOOLCHAIN_CLEANUP_PACKAGES = "libgnutls-dev libgnutls-extra26 libgnutls-openssl27 libtasn1-dev"
+require arago-core-tisdk-image.inc
 
 SECONDARY_BOOTLOADER_NAME_omapl138 = ""
 
-# List of target side images to build for the SDK
-TARGET_IMAGES = "arago-base-tisdk-image tisdk-rootfs-image"
-
-TISDK_TOOLCHAIN = "meta-toolchain-arago-tisdk"
-
-IMAGE_INSTALL = "\
-    packagegroup-arago-tisdk-addons-sdk-host \
-    packagegroup-arago-tisdk-connectivity-sdk-host \
-    packagegroup-arago-tisdk-crypto-sdk-host \
-    packagegroup-arago-tisdk-matrix-sdk-host \
-    packagegroup-arago-tisdk-multimedia-sdk-host \
-    packagegroup-arago-tisdk-qte-sdk-host \
-    packagegroup-arago-tisdk-amsdk-sdk-host \
-"
-
 export IMAGE_BASENAME = "arago-amsdk-image"
-- 
1.7.0.4


