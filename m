Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id EE7245298B
	for <meta-arago@arago-project.org>;
	Tue,  5 May 2020 22:42:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 43CD940C20;
	Tue,  5 May 2020 22:39:46 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id abZ_mrxh7j3x; Tue,  5 May 2020 22:39:46 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2495240ADE;
	Tue,  5 May 2020 22:39:45 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id D4EE216EC83;
	Tue,  5 May 2020 18:39:44 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue,  5 May 2020 18:39:43 -0400
Message-Id: <1588718383-21937-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] conf, classes, images: cleanup/unify image names
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
X-List-Received-Date: Tue, 05 May 2020 22:42:09 -0000

From: Denys Dmytriyenko <denys@ti.com>

arago-tiny-image > tisdk-tiny-image
arago-base-tisdk-image -> tisdk-base-image
tisdk-rootfs-image -> tisdk-default-image
arago-core-tisdk-bundle -> tisdk-core-bundle

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/classes/tisdk-bundle.bbclass                        | 2 +-
 meta-arago-distro/conf/distro/arago.conf                              | 2 +-
 meta-arago-distro/conf/distro/include/branding-bleeding.inc           | 2 +-
 .../images/{arago-base-tisdk-image.bb => tisdk-base-image.bb}         | 2 +-
 .../images/{arago-core-tisdk-bundle.bb => tisdk-core-bundle.bb}       | 4 ++--
 .../images/{arago-core-tisdk-bundle.inc => tisdk-core-bundle.inc}     | 2 +-
 .../images/{tisdk-rootfs-image.bb => tisdk-default-image.bb}          | 2 +-
 .../recipes-core/images/{arago-tiny-image.bb => tisdk-tiny-image.bb}  | 2 +-
 8 files changed, 9 insertions(+), 9 deletions(-)
 rename meta-arago-distro/recipes-core/images/{arago-base-tisdk-image.bb => tisdk-base-image.bb} (86%)
 rename meta-arago-distro/recipes-core/images/{arago-core-tisdk-bundle.bb => tisdk-core-bundle.bb} (85%)
 rename meta-arago-distro/recipes-core/images/{arago-core-tisdk-bundle.inc => tisdk-core-bundle.inc} (97%)
 rename meta-arago-distro/recipes-core/images/{tisdk-rootfs-image.bb => tisdk-default-image.bb} (96%)
 rename meta-arago-distro/recipes-core/images/{arago-tiny-image.bb => tisdk-tiny-image.bb} (86%)

diff --git a/meta-arago-distro/classes/tisdk-bundle.bbclass b/meta-arago-distro/classes/tisdk-bundle.bbclass
index 40a81a2..45de5fc 100644
--- a/meta-arago-distro/classes/tisdk-bundle.bbclass
+++ b/meta-arago-distro/classes/tisdk-bundle.bbclass
@@ -30,7 +30,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 # List of target side images to be built and packaged.  By default take
 # the base image but this can be modified if desired to package
 # additional images.
-TARGET_IMAGES ?= "arago-base-tisdk-image"
+TARGET_IMAGES ?= "tisdk-base-image"
 
 # path to install the meta-toolchain package in the SDK
 TISDK_TOOLCHAIN_PATH ?= "linux-devkit"
diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index a0dbadb..ee1bb10 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -152,7 +152,7 @@ PACKAGECONFIG_remove_pn-alsa-plugins = "pulseaudio"
 RDEPENDS_pulseaudio-server_remove = "alsa-plugins-pulseaudio-conf"
 
 # Configure RAMFS for jailhouse linux-demo
-JH_RAMFS_IMAGE = "arago-tiny-image"
+JH_RAMFS_IMAGE = "tisdk-tiny-image"
 
 # Enable UI and scripting for perf
 PERF_FEATURES_ENABLE ?= "perf-scripting perf-tui"
diff --git a/meta-arago-distro/conf/distro/include/branding-bleeding.inc b/meta-arago-distro/conf/distro/include/branding-bleeding.inc
index f68df6d..28c6247 100644
--- a/meta-arago-distro/conf/distro/include/branding-bleeding.inc
+++ b/meta-arago-distro/conf/distro/include/branding-bleeding.inc
@@ -15,4 +15,4 @@ SRCREV_pn-optee-os = "${AUTOREV}"
 SRCREV_pn-arm-trusted-firmware = "${AUTOREV}"
 
 # Build and assemble TI-SDK, but don't package it
-IMAGE_FSTYPES_pn-arago-core-tisdk-bundle = ""
+IMAGE_FSTYPES_pn-tisdk-core-bundle = ""
diff --git a/meta-arago-distro/recipes-core/images/arago-base-tisdk-image.bb b/meta-arago-distro/recipes-core/images/tisdk-base-image.bb
similarity index 86%
rename from meta-arago-distro/recipes-core/images/arago-base-tisdk-image.bb
rename to meta-arago-distro/recipes-core/images/tisdk-base-image.bb
index ebb1d42..167833a 100644
--- a/meta-arago-distro/recipes-core/images/arago-base-tisdk-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-base-image.bb
@@ -13,4 +13,4 @@ IMAGE_INSTALL += "\
     ${VIRTUAL-RUNTIME_initramfs} \
     "
 
-export IMAGE_BASENAME = "arago-base-tisdk-image"
+export IMAGE_BASENAME = "tisdk-base-image"
diff --git a/meta-arago-distro/recipes-core/images/arago-core-tisdk-bundle.bb b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
similarity index 85%
rename from meta-arago-distro/recipes-core/images/arago-core-tisdk-bundle.bb
rename to meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
index 2fffe1a..64ee906 100644
--- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-bundle.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
@@ -1,4 +1,4 @@
-require arago-core-tisdk-bundle.inc
+require tisdk-core-bundle.inc
 
 DEPLOY_SPL_NAME_omapl138 = ""
 DEPLOY_SPL_NAME_k2hk = ""
@@ -12,5 +12,5 @@ DEPLOY_IMAGES_NAME_k3 = "bl31.bin bl32.bin sysfw.itb"
 DEPLOY_IMAGES_NAME_append_am65xx-evm = " ti-sci-firmware-am65x-gp.bin"
 DEPLOY_IMAGES_NAME_append_j7-evm = " ti-sci-firmware-j721e-gp.bin"
 
-ARAGO_TISDK_IMAGE ?= "arago-core-tisdk-bundle"
+ARAGO_TISDK_IMAGE ?= "tisdk-core-bundle"
 export IMAGE_BASENAME = "${ARAGO_TISDK_IMAGE}"
diff --git a/meta-arago-distro/recipes-core/images/arago-core-tisdk-bundle.inc b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
similarity index 97%
rename from meta-arago-distro/recipes-core/images/arago-core-tisdk-bundle.inc
rename to meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
index 016a4ef..1c35829 100644
--- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-bundle.inc
+++ b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
@@ -32,7 +32,7 @@ DTB_FILTER_am65xx = "am65"
 DTB_FILTER_j7 = "j721e"
 
 # List of target side images to build for the SDK
-TARGET_IMAGES = "arago-base-tisdk-image tisdk-rootfs-image"
+TARGET_IMAGES = "tisdk-base-image tisdk-default-image"
 
 # dra71 lcard requires an initramfs with modules for NFS boot
 TARGET_IMAGES_append_dra7xx-evm = " netboot-initrd"
diff --git a/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
similarity index 96%
rename from meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
rename to meta-arago-distro/recipes-core/images/tisdk-default-image.bb
index 9049ada..ce4287a 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
@@ -26,7 +26,7 @@ IMAGE_INSTALL += "\
     ti-demos \
 "
 
-export IMAGE_BASENAME = "tisdk-rootfs-image"
+export IMAGE_BASENAME = "tisdk-default-image"
 
 # Disable ubi/ubifs as the filesystem requires more space than is
 # available on the HW.
diff --git a/meta-arago-distro/recipes-core/images/arago-tiny-image.bb b/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
similarity index 86%
rename from meta-arago-distro/recipes-core/images/arago-tiny-image.bb
rename to meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
index ae3dc83..28da0b6 100644
--- a/meta-arago-distro/recipes-core/images/arago-tiny-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
@@ -13,4 +13,4 @@ IMAGE_INSTALL = " \
 	${ARAGO_TINY_IMAGE_EXTRA_INSTALL} \
 "
 
-export IMAGE_BASENAME = "arago-tiny-image"
+export IMAGE_BASENAME = "tisdk-tiny-image"
-- 
2.7.4


