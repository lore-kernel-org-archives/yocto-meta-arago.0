Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 29EBF52A20
	for <meta-arago@arago-project.org>;
	Thu,  9 May 2019 04:16:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 58C7B40BB2;
	Thu,  9 May 2019 04:15:36 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id gfNAGCrSIgBx; Thu,  9 May 2019 04:15:36 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2EAEB40BB3;
	Thu,  9 May 2019 04:15:35 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id F1A2216EAFA;
	Thu,  9 May 2019 00:15:33 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu,  9 May 2019 00:15:31 -0400
Message-Id: <1557375331-41998-9-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557375331-41998-1-git-send-email-denys@ti.com>
References: <1557375331-41998-1-git-send-email-denys@ti.com>
Subject: [thud/master][PATCH 9/9] arago.conf: enable FIT image generation for am65xx-hs-evm
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
X-List-Received-Date: Thu, 09 May 2019 04:16:10 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 1a8263d..ee2080f 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -48,6 +48,7 @@ KERNEL_IMAGETYPES_dra7xx-hs-evm = "zImage fitImage"
 KERNEL_IMAGETYPES_am57xx-hs-evm = "zImage fitImage"
 KERNEL_IMAGETYPES_am437x-hs-evm = "zImage fitImage"
 KERNEL_IMAGETYPES_am335x-hs-evm = "zImage fitImage"
+KERNEL_IMAGETYPES_am65xx-hs-evm = "Image fitImage"
 
 KERNEL_IMAGETYPES_k2e-hs-evm = "zImage fitImage"
 INITRAMFS_IMAGE_k2e-hs-evm = "k2-fw-initrd"
-- 
2.7.4


