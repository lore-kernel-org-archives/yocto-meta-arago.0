Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id C0E7A52A24
	for <meta-arago@arago-project.org>;
	Thu, 19 Sep 2013 14:38:48 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8JEclVe007579
	for <meta-arago@arago-project.org>; Thu, 19 Sep 2013 09:38:47 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8JEcldT020501
	for <meta-arago@arago-project.org>; Thu, 19 Sep 2013 09:38:47 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 19 Sep 2013 09:38:46 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8JEchOU025452;
	Thu, 19 Sep 2013 09:38:45 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 19 Sep 2013 10:19:47 -0500
Message-ID: <1379603987-20308-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 2/2 v2] Use updated base image name
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
X-List-Received-Date: Thu, 19 Sep 2013 14:38:49 -0000
Content-Type: text/plain

* Change references from arago-base-tisdk-image to tisdk-rootfs-base-image to
  match updated image name.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
Version 2 changes:
Update image name in tisdk-rootfs-image.bb

 meta-arago-distro/classes/tisdk-image.bbclass      |    2 +-
 .../recipes-core/images/arago-core-tisdk-image.inc |    2 +-
 .../recipes-core/images/tisdk-rootfs-image.bb      |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/classes/tisdk-image.bbclass b/meta-arago-distro/classes/tisdk-image.bbclass
index 4397a70..1ccd2cd 100644
--- a/meta-arago-distro/classes/tisdk-image.bbclass
+++ b/meta-arago-distro/classes/tisdk-image.bbclass
@@ -28,7 +28,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 # List of target side images to be built and packaged.  By default take
 # the base image but this can be modified if desired to package
 # additional images.
-TARGET_IMAGES ?= "arago-base-tisdk-image"
+TARGET_IMAGES ?= "tisdk-rootfs-base-image"
 
 # path to install the meta-toolchain package in the SDK
 TISDK_TOOLCHAIN_PATH ?= "linux-devkit"
diff --git a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
index 1d00117..aaf2742 100644
--- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
@@ -22,7 +22,7 @@ DTB_FILTER_omap5-evm = "omap5"
 DTB_FILTER_dra7xx-evm = "dra7"
 
 # List of target side images to build for the SDK
-TARGET_IMAGES = "arago-base-tisdk-image tisdk-rootfs-image"
+TARGET_IMAGES = "tisdk-rootfs-base-image tisdk-rootfs-image"
 
 TISDK_TOOLCHAIN = "meta-toolchain-arago-tisdk"
 
diff --git a/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb b/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
index 1bc6a36..87267a2 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
@@ -1,6 +1,6 @@
 # Arago TI SDK filesystem image
 
-require arago-base-tisdk-image.bb
+require tisdk-rootfs-base-image.bb
 
 IMAGE_INSTALL += "\
     packagegroup-arago-test \
-- 
1.7.0.4


