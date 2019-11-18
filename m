Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 41DAF529B3
	for <meta-arago@arago-project.org>;
	Mon, 18 Nov 2019 20:43:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8DD7B40C0D;
	Mon, 18 Nov 2019 20:41:57 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id lX6BGeHAcTC2; Mon, 18 Nov 2019 20:41:57 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 73CC140C0C;
	Mon, 18 Nov 2019 20:41:56 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id A670517430D;
	Mon, 18 Nov 2019 15:41:55 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 18 Nov 2019 15:41:55 -0500
Message-Id: <1574109715-8946-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [RFC][PATCH] arago-core-tisdk-bundle, tisdk-rootfs-image: rename back to tisdk-rootfs-image
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
X-List-Received-Date: Mon, 18 Nov 2019 20:43:24 -0000

From: Denys Dmytriyenko <denys@ti.com>

Also, temporarily remove arago-tiny-image from the bundle, as it lacks package
management and fails to generate the software manifest.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-core/images/arago-core-tisdk-bundle.inc       | 2 +-
 .../images/{tisdk-default-image.bb => tisdk-rootfs-image.bb}            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-arago-distro/recipes-core/images/{tisdk-default-image.bb => tisdk-rootfs-image.bb} (96%)

diff --git a/meta-arago-distro/recipes-core/images/arago-core-tisdk-bundle.inc b/meta-arago-distro/recipes-core/images/arago-core-tisdk-bundle.inc
index 1fae775..ca3b694 100644
--- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-bundle.inc
+++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-bundle.inc
@@ -32,7 +32,7 @@ DTB_FILTER_am65xx = "am65"
 DTB_FILTER_j7-evm = "j721e"
 
 # List of target side images to build for the SDK
-TARGET_IMAGES = "arago-base-tisdk-image tisdk-default-image arago-tiny-image"
+TARGET_IMAGES = "arago-base-tisdk-image tisdk-rootfs-image"
 
 # dra71 lcard requires an initramfs with modules for NFS boot
 TARGET_IMAGES_append_dra7xx-evm = " netboot-initrd"
diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb b/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
similarity index 96%
rename from meta-arago-distro/recipes-core/images/tisdk-default-image.bb
rename to meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
index 92f032a..81e6631 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
@@ -26,7 +26,7 @@ IMAGE_INSTALL += "\
     ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-tisdk-hmi','packagegroup-arago-base-tisdk-server-extra',d)} \
 "
 
-export IMAGE_BASENAME = "tisdk-default-image"
+export IMAGE_BASENAME = "tisdk-rootfs-image"
 
 # Disable ubi/ubifs as the filesystem requires more space than is
 # available on the HW.
-- 
2.7.4


