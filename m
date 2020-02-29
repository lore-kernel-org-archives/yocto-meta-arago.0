Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 0839B529F2
	for <meta-arago@arago-project.org>;
	Sat, 29 Feb 2020 16:17:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id EED7040A13;
	Sat, 29 Feb 2020 16:15:01 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id hT4lb0H0H_wM; Sat, 29 Feb 2020 16:15:01 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C59C440BCC;
	Sat, 29 Feb 2020 16:15:00 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 5FDCB174426;
	Sat, 29 Feb 2020 11:14:59 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Sat, 29 Feb 2020 11:14:41 -0500
Message-Id: <1582992888-3508-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582992888-3508-1-git-send-email-denis@denix.org>
References: <1582992888-3508-1-git-send-email-denis@denix.org>
Subject: [zeus/master][PATCH 2/9] images: combine tisdk-rootfs-image with "server"
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
X-List-Received-Date: Sat, 29 Feb 2020 16:17:05 -0000

From: Denys Dmytriyenko <denys@ti.com>

Guard some tasks based on MACHINE_FEATURES, like "gpu", "dsp", etc.

Also, temporarily remove arago-tiny-image from the bundle, as it lacks package
management and fails to generate the software manifest.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../images/arago-core-tisdk-bundle.inc             |  6 +-----
 .../recipes-core/images/arago-image.inc            |  1 +
 .../recipes-core/images/tisdk-rootfs-image.bb      | 13 ++++++++---
 .../images/tisdk-server-rootfs-image.bb            | 25 ----------------------
 4 files changed, 12 insertions(+), 33 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb

diff --git a/meta-arago-distro/recipes-core/images/arago-core-tisdk-bundle.inc b/meta-arago-distro/recipes-core/images/arago-core-tisdk-bundle.inc
index 7740467..ca3b694 100644
--- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-bundle.inc
+++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-bundle.inc
@@ -32,15 +32,11 @@ DTB_FILTER_am65xx = "am65"
 DTB_FILTER_j7-evm = "j721e"
 
 # List of target side images to build for the SDK
-TARGET_IMAGES = "arago-base-tisdk-image tisdk-rootfs-image arago-tiny-image"
+TARGET_IMAGES = "arago-base-tisdk-image tisdk-rootfs-image"
 
 # dra71 lcard requires an initramfs with modules for NFS boot
 TARGET_IMAGES_append_dra7xx-evm = " netboot-initrd"
 
-# Some devices do not support display and use a server image instead
-TARGET_IMAGES_keystone = "arago-base-tisdk-image tisdk-server-rootfs-image arago-tiny-image"
-TARGET_IMAGES_omapl138 = "arago-base-tisdk-image tisdk-server-rootfs-image arago-tiny-image"
-
 TISDK_TOOLCHAIN = "meta-toolchain-arago-tisdk"
 TOOLCHAIN_SUFFIX = "-tisdk"
 
diff --git a/meta-arago-distro/recipes-core/images/arago-image.inc b/meta-arago-distro/recipes-core/images/arago-image.inc
index b197dc2..e068287 100644
--- a/meta-arago-distro/recipes-core/images/arago-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-image.inc
@@ -11,6 +11,7 @@ EXTRA_IMAGECMD_ext2.gz += "-i 4096"
 
 IMAGE_INSTALL = " \
 	packagegroup-core-boot \
+	${VIRTUAL-RUNTIME_initramfs} \
 	${CORE_IMAGE_EXTRA_INSTALL} \
 "
 
diff --git a/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb b/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
index bb2515a..54771c1 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
@@ -2,6 +2,8 @@
 
 require arago-image.inc
 
+SPLASH = "${@bb.utils.contains('MACHINE_FEATURES','gpu','psplash','',d)}"
+
 IMAGE_INSTALL += "\
     packagegroup-arago-base \
     packagegroup-arago-console \
@@ -10,7 +12,7 @@ IMAGE_INSTALL += "\
     packagegroup-arago-test-addons \
     ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-tisdk-graphics','',d)} \
     ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-tisdk-gtk','',d)} \
-    packagegroup-arago-tisdk-qte \
+    ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-tisdk-qte','',d)} \
     ${@bb.utils.contains('MACHINE_FEATURES','dsp','packagegroup-arago-tisdk-opencl','',d)} \
     ${@bb.utils.contains('MACHINE_FEATURES','dsp','packagegroup-arago-tisdk-opencl-extra','',d)} \
     packagegroup-arago-tisdk-connectivity \
@@ -21,7 +23,12 @@ IMAGE_INSTALL += "\
     packagegroup-arago-tisdk-amsdk \
     packagegroup-arago-tisdk-addons \
     packagegroup-arago-tisdk-addons-extra \
-    packagegroup-arago-tisdk-hmi \
-    "
+    ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-tisdk-hmi','packagegroup-arago-base-tisdk-server-extra',d)} \
+"
 
 export IMAGE_BASENAME = "tisdk-rootfs-image"
+
+# Disable ubi/ubifs as the filesystem requires more space than is
+# available on the HW.
+IMAGE_FSTYPES_remove_keystone = "ubifs ubi"
+IMAGE_FSTYPES_remove_omapl138 = "ubifs ubi"
diff --git a/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb b/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb
deleted file mode 100644
index 7c52e39..0000000
--- a/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-# Arago TI SDK filesystem image
-
-require arago-base-tisdk-image.bb
-
-SPLASH = ""
-
-IMAGE_INSTALL += "\
-    packagegroup-arago-tisdk-addons \
-    packagegroup-arago-tisdk-addons-extra \
-    ${@bb.utils.contains('MACHINE_FEATURES','dsp','packagegroup-arago-tisdk-opencl','',d)} \
-    ${@bb.utils.contains('MACHINE_FEATURES','dsp','packagegroup-arago-tisdk-opencl-extra','',d)} \
-    packagegroup-arago-tisdk-crypto \
-    packagegroup-arago-tisdk-multimedia \
-    packagegroup-arago-tisdk-matrix \
-    packagegroup-arago-tisdk-matrix-extra \
-    packagegroup-arago-base-tisdk-server-extra \
-    packagegroup-arago-tisdk-connectivity \
-    packagegroup-arago-test-addons \
-"
-
-export IMAGE_BASENAME = "tisdk-server-rootfs-image"
-
-# Disable ubi/ubifs as the filesystem requires more space than is
-# available on the HW.
-IMAGE_FSTYPES_remove = "ubifs ubi"
-- 
2.7.4


