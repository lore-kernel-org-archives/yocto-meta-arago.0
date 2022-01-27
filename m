Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.22186.1643242935453880399
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 26 Jan 2022 16:22:15 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E184640CA5
	for <meta-arago@lists.yoctoproject.org>; Thu, 27 Jan 2022 00:22:14 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nxwDVMSJJHzs for <meta-arago@lists.yoctoproject.org>;
	Thu, 27 Jan 2022 00:22:14 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B488940CC6
	for <meta-arago@lists.yoctoproject.org>; Thu, 27 Jan 2022 00:22:07 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id EC05417473D
	for <meta-arago@lists.yoctoproject.org>; Wed, 26 Jan 2022 19:22:05 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [master][PATCH 21/23] packagegroup-arago-base: add docker runtime to the base and default rootfs
Date: Wed, 26 Jan 2022 19:22:02 -0500
Message-Id: <1643242924-25090-22-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1643242924-25090-1-git-send-email-denis@denix.org>
References: <1643242924-25090-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@konsulko.com>

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
index 2ebe5f9..2284210 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
@@ -36,6 +36,7 @@ ARAGO_EXTRA = "\
     kms++ \
     kms++-python \
     can-utils \
+    docker \
 "
 
 ARAGO_EXTRA_append_keystone = "\
-- 
2.7.4

