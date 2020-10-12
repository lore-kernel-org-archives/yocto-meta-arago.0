Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id B80A652968
	for <meta-arago@arago-project.org>;
	Mon, 12 Oct 2020 23:45:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 542FF40BD9;
	Mon, 12 Oct 2020 23:42:40 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id r86E5VntqS6Z; Mon, 12 Oct 2020 23:42:40 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3C81940AB7;
	Mon, 12 Oct 2020 23:42:39 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id DBE9B174296;
	Mon, 12 Oct 2020 19:42:38 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 12 Oct 2020 19:42:32 -0400
Message-Id: <1602546152-2139-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1602545596-898-1-git-send-email-denis@denix.org>
References: <1602545596-898-1-git-send-email-denis@denix.org>
Subject: [dunfell/master][PATCH v2] branding-mainline: build mainline kernel/u-boot with ARAGO_BRAND="mainline"
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
X-List-Received-Date: Mon, 12 Oct 2020 23:45:43 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
v2 - always AUTOREV ti-upstream-tools for mainline

 meta-arago-distro/conf/distro/include/branding-mainline.inc | 4 ++++
 1 file changed, 4 insertions(+)
 create mode 100644 meta-arago-distro/conf/distro/include/branding-mainline.inc

diff --git a/meta-arago-distro/conf/distro/include/branding-mainline.inc b/meta-arago-distro/conf/distro/include/branding-mainline.inc
new file mode 100644
index 0000000..e6d8574
--- /dev/null
+++ b/meta-arago-distro/conf/distro/include/branding-mainline.inc
@@ -0,0 +1,4 @@
+PREFERRED_PROVIDER_virtual/kernel = "linux-ti-mainline"
+PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-mainline"
+PREFERRED_PROVIDER_u-boot = "u-boot-ti-mainline"
+SRCREV_ti-upstream-tools_pn-linux-ti-mainline = "${AUTOREV}"
-- 
2.7.4


