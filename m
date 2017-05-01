Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id CB16652A48
	for <meta-arago@arago-project.org>;
	Mon,  1 May 2017 21:08:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C5AF120B10;
	Mon,  1 May 2017 21:08:42 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id z0ym2MUTrZ9S; Mon,  1 May 2017 21:08:42 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A64C820756;
	Mon,  1 May 2017 21:08:41 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 2415C162487;
	Mon,  1 May 2017 17:08:41 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Mon,  1 May 2017 17:08:40 -0400
Message-Id: <1493672920-71659-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] arago.conf: add k2hk and k2g HS FIT config, bump version
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
X-List-Received-Date: Mon, 01 May 2017 21:08:43 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 0052209..fdce475 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -1,6 +1,6 @@
 # Name and version of the distribution
 DISTRO_NAME = "Arago"
-DISTRO_VERSION = "2017.03"
+DISTRO_VERSION = "2017.05"
 DISTRO_FEED_URI ?= "http://lcpd.gt.design.ti.com"
 BUILD_VARIANT = "${@['prod','rt','systest'][int(d.getVar('ARAGO_RT_ENABLE', True))+int(d.getVar('ARAGO_SYSTEST_ENABLE', True))*2]}"
 FEEDURIPREFIX ?= "packages/${DISTRO}-morty/${BUILD_VARIANT}/"
@@ -50,6 +50,14 @@ KERNEL_IMAGETYPES_k2e-hs-evm = "zImage fitImage"
 INITRAMFS_IMAGE_k2e-hs-evm = "arago-base-tisdk-image"
 INITRAMFS_FSTYPES_k2e-hs-evm = "cpio.xz"
 
+KERNEL_IMAGETYPES_k2hk-hs-evm = "zImage fitImage"
+INITRAMFS_IMAGE_k2hk-hs-evm = "arago-base-tisdk-image"
+INITRAMFS_FSTYPES_k2hk-hs-evm = "cpio.xz"
+
+KERNEL_IMAGETYPES_k2g-hs-evm = "zImage fitImage"
+INITRAMFS_IMAGE_k2g-hs-evm = "arago-base-tisdk-image"
+INITRAMFS_FSTYPES_k2g-hs-evm = "cpio.xz"
+
 # Mask any broken recipes (currently none)
 #BBMASK = ""
 
-- 
2.7.4


