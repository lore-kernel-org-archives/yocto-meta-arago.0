Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 27856529A5
	for <meta-arago@arago-project.org>;
	Fri, 13 Mar 2020 21:26:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 19ED940C2B;
	Fri, 13 Mar 2020 21:24:28 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id EphCA7Pfy0nx; Fri, 13 Mar 2020 21:24:28 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 025CF40BDF;
	Fri, 13 Mar 2020 21:24:26 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 5EA3816C450;
	Fri, 13 Mar 2020 17:24:25 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 13 Mar 2020 17:24:25 -0400
Message-Id: <1584134665-929-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [zeus/master][PATCH] arago-tiny-image: also produce cpio.xz image
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
X-List-Received-Date: Fri, 13 Mar 2020 21:26:34 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-core/images/arago-tiny-image.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/images/arago-tiny-image.bb b/meta-arago-distro/recipes-core/images/arago-tiny-image.bb
index cac37a5..ae3dc83 100644
--- a/meta-arago-distro/recipes-core/images/arago-tiny-image.bb
+++ b/meta-arago-distro/recipes-core/images/arago-tiny-image.bb
@@ -4,7 +4,7 @@ require arago-image.inc
 
 IMAGE_FEATURES_remove = "package-management splash"
 
-IMAGE_FSTYPES += "cpio"
+IMAGE_FSTYPES += "cpio cpio.xz"
 
 ARAGO_TINY_IMAGE_EXTRA_INSTALL ?= ""
 
-- 
2.7.4


