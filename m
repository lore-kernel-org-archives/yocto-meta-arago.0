Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 737E652968
	for <meta-arago@arago-project.org>;
	Mon, 12 Oct 2020 23:36:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E81AC40BD9;
	Mon, 12 Oct 2020 23:33:17 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id eeqXy3OIeYmN; Mon, 12 Oct 2020 23:33:17 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C8E1840AB7;
	Mon, 12 Oct 2020 23:33:16 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 7FEBD174296;
	Mon, 12 Oct 2020 19:33:16 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 12 Oct 2020 19:33:16 -0400
Message-Id: <1602545596-898-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [dunfell/master][PATCH] branding-mainline: build mainline kernel/u-boot with ARAGO_BRAND="mainline"
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
X-List-Received-Date: Mon, 12 Oct 2020 23:36:20 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/branding-mainline.inc | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 meta-arago-distro/conf/distro/include/branding-mainline.inc

diff --git a/meta-arago-distro/conf/distro/include/branding-mainline.inc b/meta-arago-distro/conf/distro/include/branding-mainline.inc
new file mode 100644
index 0000000..a265666
--- /dev/null
+++ b/meta-arago-distro/conf/distro/include/branding-mainline.inc
@@ -0,0 +1,3 @@
+PREFERRED_PROVIDER_virtual/kernel = "linux-ti-mainline"
+PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-mainline"
+PREFERRED_PROVIDER_u-boot = "u-boot-ti-mainline"
-- 
2.7.4


