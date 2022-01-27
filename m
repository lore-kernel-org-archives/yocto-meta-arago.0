Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.22185.1643242933165403104
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 26 Jan 2022 16:22:13 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 98D6B40CC1
	for <meta-arago@lists.yoctoproject.org>; Thu, 27 Jan 2022 00:22:12 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XHjX6j_DzSQ7 for <meta-arago@lists.yoctoproject.org>;
	Thu, 27 Jan 2022 00:22:12 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E6E8F40CCE
	for <meta-arago@lists.yoctoproject.org>; Thu, 27 Jan 2022 00:22:07 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 02AB017473E
	for <meta-arago@lists.yoctoproject.org>; Wed, 26 Jan 2022 19:22:06 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [master][PATCH 22/23] linux-ti-staging: move docker.cfg to be accessible by rt/systest variants
Date: Wed, 26 Jan 2022 19:22:03 -0500
Message-Id: <1643242924-25090-23-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1643242924-25090-1-git-send-email-denis@denix.org>
References: <1643242924-25090-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@konsulko.com>

Move docker.cfg config fragment to common files/ directory to be accessible by
rt/systest variants of the linux-ti-staging kernel.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-arago-distro/recipes-kernel/linux/docker.inc                       | 2 ++
 .../recipes-kernel/linux/{linux-ti-staging => files}/docker.cfg         | 0
 2 files changed, 2 insertions(+)
 rename meta-arago-distro/recipes-kernel/linux/{linux-ti-staging => files}/docker.cfg (100%)

diff --git a/meta-arago-distro/recipes-kernel/linux/docker.inc b/meta-arago-distro/recipes-kernel/linux/docker.inc
index 63a01ba..51eaf8d 100644
--- a/meta-arago-distro/recipes-kernel/linux/docker.inc
+++ b/meta-arago-distro/recipes-kernel/linux/docker.inc
@@ -1,2 +1,4 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
+
 SRC_URI += "file://docker.cfg"
 KERNEL_CONFIG_FRAGMENTS += "${WORKDIR}/docker.cfg"
diff --git a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging/docker.cfg b/meta-arago-distro/recipes-kernel/linux/files/docker.cfg
similarity index 100%
rename from meta-arago-distro/recipes-kernel/linux/linux-ti-staging/docker.cfg
rename to meta-arago-distro/recipes-kernel/linux/files/docker.cfg
-- 
2.7.4

