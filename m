Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 359B85299C
	for <meta-arago@arago-project.org>;
	Wed, 17 Mar 2021 16:48:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A754440C2C;
	Wed, 17 Mar 2021 16:49:15 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id PnZq7xWswx82; Wed, 17 Mar 2021 16:49:15 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8FAB5409AE;
	Wed, 17 Mar 2021 16:49:14 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id E374B17454D;
	Wed, 17 Mar 2021 12:49:13 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 17 Mar 2021 12:49:06 -0400
Message-Id: <1615999746-23215-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [dunfell/master][PATCH] tisdk-tiny-image: remove packagedata task breaking initramfs packaging
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
X-List-Received-Date: Wed, 17 Mar 2021 16:48:59 -0000

From: Denys Dmytriyenko <denys@konsulko.com>

The way initramfs gets included into other packages causes its packagedata
manifest to be absent in sstate. This used to be a warning and as part of
cleanup and proper fixing in master, became an error. That was inadvertently
backported to dunfell, but will be reverted soon. Regardless, fix it by
removing the unnecessary task in the initramfs image recipe.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb b/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
index 28da0b6..c0ef8f2 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
@@ -13,4 +13,6 @@ IMAGE_INSTALL = " \
 	${ARAGO_TINY_IMAGE_EXTRA_INSTALL} \
 "
 
+deltask do_packagedata
+
 export IMAGE_BASENAME = "tisdk-tiny-image"
-- 
2.7.4


