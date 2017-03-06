Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 3AA6A52970
	for <meta-arago@arago-project.org>;
	Mon,  6 Mar 2017 16:31:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 277C320BCD;
	Mon,  6 Mar 2017 16:31:49 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id XeCTp2CNOmLk; Mon,  6 Mar 2017 16:31:49 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0701B20BCA;
	Mon,  6 Mar 2017 16:31:47 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 926E5162395;
	Mon,  6 Mar 2017 11:31:47 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon,  6 Mar 2017 11:31:47 -0500
Message-Id: <1488817907-127721-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] arago.conf: append fitimage to KERNEL_CLASSES, don't overwrite
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
X-List-Received-Date: Mon, 06 Mar 2017 16:31:50 -0000

From: Denys Dmytriyenko <denys@ti.com>

If machine already sets it for other types, like uImage, don't clear it.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 24fe63a..d0e7a8b 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -24,7 +24,7 @@ IMAGE_CLASSES += "image_types_md5"
 IMAGE_FSTYPES += "tar.xz.md5"
 
 # FIT image for secure devices
-KERNEL_CLASSES = "kernel-fitimage"
+KERNEL_CLASSES += "kernel-fitimage"
 FITIMAGE_HASH_ALGO = ""
 FITIMAGE_DTB_BY_NAME = "1"
 FITIMAGE_TEE_BY_NAME = "1"
-- 
2.7.4


