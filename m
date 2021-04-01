Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 829DF52CB9
	for <meta-arago@arago-project.org>;
	Thu,  1 Apr 2021 21:23:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1374140C93;
	Thu,  1 Apr 2021 21:24:14 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id b71brVeviClW; Thu,  1 Apr 2021 21:24:14 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E626540C56;
	Thu,  1 Apr 2021 21:24:11 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 4CDCD174569;
	Thu,  1 Apr 2021 17:24:10 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu,  1 Apr 2021 17:23:32 -0400
Message-Id: <1617312217-14991-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617312217-14991-1-git-send-email-denis@denix.org>
References: <1617312217-14991-1-git-send-email-denis@denix.org>
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [dunfell/master][PATCH 2/7] branding-mainline: remove gpu machine feature
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
X-List-Received-Date: Thu, 01 Apr 2021 21:23:54 -0000

From: Denys Dmytriyenko <denys@konsulko.com>

GPU support requires out-of-tree SGX and RGX drivers not available in mainline.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-arago-distro/conf/distro/include/branding-mainline.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arago-distro/conf/distro/include/branding-mainline.inc b/meta-arago-distro/conf/distro/include/branding-mainline.inc
index e6d8574..786508d 100644
--- a/meta-arago-distro/conf/distro/include/branding-mainline.inc
+++ b/meta-arago-distro/conf/distro/include/branding-mainline.inc
@@ -2,3 +2,6 @@ PREFERRED_PROVIDER_virtual/kernel = "linux-ti-mainline"
 PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-mainline"
 PREFERRED_PROVIDER_u-boot = "u-boot-ti-mainline"
 SRCREV_ti-upstream-tools_pn-linux-ti-mainline = "${AUTOREV}"
+
+# GPU support requires out-of-tree SGX and RGX drivers not available in mainline
+MACHINE_FEATURES_remove = "gpu"
-- 
2.7.4


