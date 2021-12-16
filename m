Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.64.1639687853135052604
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 16 Dec 2021 12:50:53 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9E7D440C4E;
	Thu, 16 Dec 2021 20:50:51 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5ey0aozSVb5f; Thu, 16 Dec 2021 20:50:51 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8541640B05;
	Thu, 16 Dec 2021 20:50:50 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id E6B36174715;
	Thu, 16 Dec 2021 15:50:49 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [dunfell/master][PATCH] linux-ti-staging: move docker.cfg to be accessible by rt/systest variants
Date: Thu, 16 Dec 2021 15:50:46 -0500
Message-Id: <1639687846-43304-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@konsulko.com>

Move docker.cfg config fragment to common files/ directory to be accessible by
rt/systest variants of the linux-ti-staging kernel.

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

