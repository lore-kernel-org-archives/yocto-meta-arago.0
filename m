Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 293A752988
	for <meta-arago@arago-project.org>;
	Thu, 14 Nov 2019 01:20:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0058340C1C;
	Thu, 14 Nov 2019 01:19:05 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id NTw-waz3BGPm; Thu, 14 Nov 2019 01:19:04 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D521B40BE5;
	Thu, 14 Nov 2019 01:19:03 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 1CE2A1742EA;
	Wed, 13 Nov 2019 20:19:02 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 13 Nov 2019 20:18:54 -0500
Message-Id: <1573694338-30083-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [RFC][PATCH 1/5] arago-tiny-image: make it tinier by removing non essential packages
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
X-List-Received-Date: Thu, 14 Nov 2019 01:20:31 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-core/images/arago-tiny-image.bb | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/arago-tiny-image.bb b/meta-arago-distro/recipes-core/images/arago-tiny-image.bb
index 5d1733e..cac37a5 100644
--- a/meta-arago-distro/recipes-core/images/arago-tiny-image.bb
+++ b/meta-arago-distro/recipes-core/images/arago-tiny-image.bb
@@ -2,17 +2,11 @@ ARAGO_SYSVINIT = "1"
 
 require arago-image.inc
 
+IMAGE_FEATURES_remove = "package-management splash"
+
 IMAGE_FSTYPES += "cpio"
 
-# Install a small set of utils which can be used for diagnostics
-ARAGO_TINY_IMAGE_EXTRA_INSTALL ?= " \
-	parted \
-	util-linux \
-	e2fsprogs \
-	dosfstools \
-	devmem2 \
-	arago-feed-config \
-"
+ARAGO_TINY_IMAGE_EXTRA_INSTALL ?= ""
 
 IMAGE_INSTALL = " \
 	packagegroup-arago-sysvinit-boot \
-- 
2.7.4


