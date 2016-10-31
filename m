Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 7ABA852996
	for <meta-arago@arago-project.org>;
	Mon, 31 Oct 2016 19:02:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8DD73209CD;
	Mon, 31 Oct 2016 19:02:45 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Z6qiDMdORo6w; Mon, 31 Oct 2016 19:02:45 +0000 (UTC)
Received: from gandalf.denix.org (pool-100-15-106-107.washdc.fios.verizon.net
	[100.15.106.107])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 557F5208FD;
	Mon, 31 Oct 2016 19:02:44 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by gandalf.denix.org (Postfix) with ESMTP id 35243162185;
	Mon, 31 Oct 2016 15:02:43 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 31 Oct 2016 15:02:41 -0400
Message-Id: <1477940561-17265-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1477940561-17265-1-git-send-email-denis@denix.org>
References: <1477940561-17265-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/2] arago.conf: add DRA71x OPTEE to FIT image
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
X-List-Received-Date: Mon, 31 Oct 2016 19:02:50 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 4133a11..9497172 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -32,7 +32,7 @@ FITIMAGE_CONF_BY_NAME = "1"
 KERNEL_IMAGETYPES_dra7xx-hs-evm = "zImage fitImage"
 INITRAMFS_IMAGE_dra7xx-hs-evm = "arago-base-tisdk-image"
 INITRAMFS_FSTYPES_dra7xx-hs-evm = "cpio.xz"
-FITIMAGE_TEE_dra7xx-hs-evm = "dra7-evm.optee dra72-evm-revc.optee"
+FITIMAGE_TEE_dra7xx-hs-evm = "dra7-evm.optee dra72-evm-revc.optee dra71-evm.optee"
 
 KERNEL_IMAGETYPES_am57xx-hs-evm = "zImage fitImage"
 INITRAMFS_IMAGE_am57xx-hs-evm = "arago-base-tisdk-image"
-- 
2.7.4


