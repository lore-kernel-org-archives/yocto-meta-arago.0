Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.21534.1643242930104591663
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 26 Jan 2022 16:22:10 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D99C440CD2
	for <meta-arago@lists.yoctoproject.org>; Thu, 27 Jan 2022 00:22:08 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dRvieSIN9fcG for <meta-arago@lists.yoctoproject.org>;
	Thu, 27 Jan 2022 00:22:08 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B76C840CC9
	for <meta-arago@lists.yoctoproject.org>; Thu, 27 Jan 2022 00:22:07 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id D3BD117473B
	for <meta-arago@lists.yoctoproject.org>; Wed, 26 Jan 2022 19:22:05 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [master][PATCH 19/23] Update the ltp-ddt to latest
Date: Wed, 26 Jan 2022 19:22:00 -0500
Message-Id: <1643242924-25090-20-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1643242924-25090-1-git-send-email-denis@denix.org>
References: <1643242924-25090-1-git-send-email-denis@denix.org>

From: Praneeth Bajjuri <praneeth@ti.com>

This has the following test fixes from ltp-ddt project

b57f35f47 testcases: ipc: Add support for PRU_ECHO test to be run on AM65 and AM64
31ee44622 Crypto: change logic for interrupt grep for different platforms
87afb0add testcases:ddt:scripts:common:get_active_eth_interfaces.sh
19775282c ti_codecs: modprobe fails to locate the modules
15a7adca3 Crypto: add more channel in arr for interrupt grep

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
index 1b52f32..e943179 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
@@ -11,10 +11,10 @@ PROVIDES += "ltp"
 DEPENDS += "alsa-lib"
 
 PE = "1"
-PR = "r4"
+PR = "r5"
 PV_append = "+git${SRCPV}"
 
-SRCREV = "7e4a343637c217f20b39e9862af6d5c4f696bae2"
+SRCREV = "cfff0a2c889f29c03b9a3ee547a147b1c6727e2c"
 BRANCH ?= "master"
 
 SRC_URI_remove = "git://github.com/linux-test-project/ltp.git;protocol=https;branch=master"
-- 
2.7.4

