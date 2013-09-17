Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id B2E4D52A7C
	for <meta-arago@arago-project.org>;
	Tue, 17 Sep 2013 18:33:01 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8HIX18Z001132
	for <meta-arago@arago-project.org>; Tue, 17 Sep 2013 13:33:01 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8HIX1GN013566
	for <meta-arago@arago-project.org>; Tue, 17 Sep 2013 13:33:01 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 17 Sep 2013 13:33:01 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8HIWtRw016554;
	Tue, 17 Sep 2013 13:32:59 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 17 Sep 2013 14:13:22 -0500
Message-ID: <1379445202-31364-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1379445202-31364-1-git-send-email-fcooper@ti.com>
References: <1379445202-31364-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 2/2] Use updated base image name
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
X-List-Received-Date: Tue, 17 Sep 2013 18:33:01 -0000
Content-Type: text/plain

* Change references from arago-base-tisdk-image to tisdk-rootfs-base-image to
  match updated image name.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 meta-arago-distro/classes/tisdk-image.bbclass      |    2 +-
 .../recipes-core/images/arago-core-tisdk-image.inc |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

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
 
-- 
1.7.0.4


