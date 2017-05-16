Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 05A5A529E1
	for <meta-arago@arago-project.org>;
	Tue, 16 May 2017 00:11:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DD22720BF4;
	Tue, 16 May 2017 00:11:55 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id bU8jqmA9_2Wz; Tue, 16 May 2017 00:11:55 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B660520B87;
	Tue, 16 May 2017 00:11:54 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 3BAC21624C3;
	Mon, 15 May 2017 20:11:54 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Mon, 15 May 2017 20:11:50 -0400
Message-Id: <1494893510-80131-2-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1494893510-80131-1-git-send-email-denys@ti.com>
References: <1494893510-80131-1-git-send-email-denys@ti.com>
Subject: [morty/master][RFC PATCH 2/2] arago.conf: disable unused FIT w/ initramfs and re-use for k2-fw-initrd
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
X-List-Received-Date: Tue, 16 May 2017 00:11:56 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 23 ++++++-----------------
 1 file changed, 6 insertions(+), 17 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 2a8f956..3434969 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -31,32 +31,21 @@ FITIMAGE_TEE_BY_NAME = "1"
 FITIMAGE_CONF_BY_NAME = "1"
 
 KERNEL_IMAGETYPES_dra7xx-hs-evm = "zImage fitImage"
-INITRAMFS_IMAGE_dra7xx-hs-evm = "arago-base-tisdk-image"
-INITRAMFS_FSTYPES_dra7xx-hs-evm = "cpio.xz"
-
 KERNEL_IMAGETYPES_am57xx-hs-evm = "zImage fitImage"
-INITRAMFS_IMAGE_am57xx-hs-evm = "arago-base-tisdk-image"
-INITRAMFS_FSTYPES_am57xx-hs-evm = "cpio.xz"
-
 KERNEL_IMAGETYPES_am437x-hs-evm = "zImage fitImage"
-INITRAMFS_IMAGE_am437x-hs-evm = "arago-base-tisdk-image"
-INITRAMFS_FSTYPES_am437x-hs-evm = "cpio.xz"
-
 KERNEL_IMAGETYPES_am335x-hs-evm = "zImage fitImage"
-INITRAMFS_IMAGE_am335x-hs-evm = "arago-base-tisdk-image"
-INITRAMFS_FSTYPES_am335x-hs-evm = "cpio.xz"
 
 KERNEL_IMAGETYPES_k2e-hs-evm = "zImage fitImage"
-INITRAMFS_IMAGE_k2e-hs-evm = "arago-base-tisdk-image"
-INITRAMFS_FSTYPES_k2e-hs-evm = "cpio.xz"
+INITRAMFS_IMAGE_k2e-hs-evm = "k2-fw-initrd"
+INITRAMFS_FSTYPES_k2e-hs-evm = "cpio.gz"
 
 KERNEL_IMAGETYPES_k2hk-hs-evm = "zImage fitImage"
-INITRAMFS_IMAGE_k2hk-hs-evm = "arago-base-tisdk-image"
-INITRAMFS_FSTYPES_k2hk-hs-evm = "cpio.xz"
+INITRAMFS_IMAGE_k2hk-hs-evm = "k2-fw-initrd"
+INITRAMFS_FSTYPES_k2hk-hs-evm = "cpio.gz"
 
 KERNEL_IMAGETYPES_k2g-hs-evm = "zImage fitImage"
-INITRAMFS_IMAGE_k2g-hs-evm = "arago-base-tisdk-image"
-INITRAMFS_FSTYPES_k2g-hs-evm = "cpio.xz"
+INITRAMFS_IMAGE_k2g-hs-evm = "k2-fw-initrd"
+INITRAMFS_FSTYPES_k2g-hs-evm = "cpio.gz"
 
 # Mask any broken recipes (currently none)
 #BBMASK = ""
-- 
2.7.4


