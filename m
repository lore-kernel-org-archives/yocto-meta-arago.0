Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 34CAB529AB
	for <meta-arago@arago-project.org>;
	Mon,  7 Aug 2017 22:24:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 67B7F208E0;
	Mon,  7 Aug 2017 22:24:39 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 3ZeKXvRtv8XF; Mon,  7 Aug 2017 22:24:39 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4DE6A207BB;
	Mon,  7 Aug 2017 22:24:38 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 0B056162551;
	Mon,  7 Aug 2017 18:24:38 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Mon,  7 Aug 2017 18:24:37 -0400
Message-Id: <1502144677-78025-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [morty/master][PATCH] arago-armv8: disable rtc feature for generic armv8 platform
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
X-List-Received-Date: Mon, 07 Aug 2017 22:24:39 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/machine/arago-armv8.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/conf/machine/arago-armv8.conf b/meta-arago-distro/conf/machine/arago-armv8.conf
index e953985..7296347 100644
--- a/meta-arago-distro/conf/machine/arago-armv8.conf
+++ b/meta-arago-distro/conf/machine/arago-armv8.conf
@@ -16,5 +16,6 @@ SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 #PREFERRED_PROVIDER_virtual/kernel = "linux-dummy"
 
 MACHINE_FEATURES = ""
+MACHINE_FEATURES_BACKFILL_CONSIDERED = "rtc"
 
 RDEPENDS_kernel-base = ""
-- 
2.7.4


