Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.21599.1643242929326918826
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 26 Jan 2022 16:22:09 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BAE9C40CD0
	for <meta-arago@lists.yoctoproject.org>; Thu, 27 Jan 2022 00:22:08 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ek7ahaL4YCpK for <meta-arago@lists.yoctoproject.org>;
	Thu, 27 Jan 2022 00:22:08 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A24B440C82
	for <meta-arago@lists.yoctoproject.org>; Thu, 27 Jan 2022 00:22:07 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 90BC5174735
	for <meta-arago@lists.yoctoproject.org>; Wed, 26 Jan 2022 19:22:05 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [master][PATCH 13/23] branding-bleeding: Add AUTOREV for K3 Image Gen
Date: Wed, 26 Jan 2022 19:21:54 -0500
Message-Id: <1643242924-25090-14-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1643242924-25090-1-git-send-email-denis@denix.org>
References: <1643242924-25090-1-git-send-email-denis@denix.org>

From: Yogesh Siraswar <yogeshs@ti.com>

This patch adds AUTOREV support for K3 Image gen to be in consistent
with ti-linux-fw

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-arago-distro/conf/distro/include/branding-bleeding.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arago-distro/conf/distro/include/branding-bleeding.inc b/meta-arago-distro/conf/distro/include/branding-bleeding.inc
index f1e0bc5..71b09f7 100644
--- a/meta-arago-distro/conf/distro/include/branding-bleeding.inc
+++ b/meta-arago-distro/conf/distro/include/branding-bleeding.inc
@@ -16,6 +16,9 @@ SRCREV_pn-arm-trusted-firmware = "${AUTOREV}"
 # Point to the latest ti linux firmware
 TI_LINUX_FW_SRCREV = "${AUTOREV}"
 
+# Point to the latest ti k3 image gen
+K3_IMAGE_GEN_SRCREV = "${AUTOREV}"
+
 # Point to latest nightly metadata
 #TI_RTOS_METADATA_URI = "git://git.ti.com/processor-sdk/coresdk_rtos_releases.git"
 #TI_RTOS_METADATA_PROTOCOL = "git"
-- 
2.7.4

