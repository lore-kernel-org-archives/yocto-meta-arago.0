Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61F77D1BDEA
	for <webhook@archiver.kernel.org>; Mon,  4 Nov 2024 19:49:26 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.692.1730749760766377567
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 04 Nov 2024 11:49:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=fuGlVL82;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4A4JnJMD088424;
	Mon, 4 Nov 2024 13:49:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730749760;
	bh=0DVzi+zEjnJDsmk0TnA0zIMSgmubhuz2dG9khM4wi24=;
	h=From:To:Subject:Date;
	b=fuGlVL82s3YTR1QAFSnA4Sekrpd1eRO+/v7zxDgVWMbHEWcPx4TUo+OcJhSvNykky
	 VLvS5g25kM7qVUnYzh0iBMde7+W24kNRePlyQEu1LpfRqL1vEKbjyFBn5zTsWFU8bp
	 nT/V50arSojw+beCSN8I6NGGr1WsFmKZIpzrwwYo=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4A4JnJtx110912
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 4 Nov 2024 13:49:19 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 4
 Nov 2024 13:49:19 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 4 Nov 2024 13:49:19 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A4JnJ3L120311;
	Mon, 4 Nov 2024 13:49:19 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1t834h-0000QI-HC; Mon, 04 Nov 2024 13:49:19 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/scarthgap][PATCH] conf: Re-enable llvm now that meta-clang is supported
Date: Mon, 4 Nov 2024 13:49:19 -0600
Message-ID: <20241104194919.1578-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 04 Nov 2024 19:49:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15586

Turn the llvm support back on.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index be833c94..2f4f3585 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -104,10 +104,10 @@ PACKAGECONFIG:pn-vulkan-cts = "${@bb.utils.contains("DISTRO_FEATURES", "wayland"
 
 # Use llvmpipe for better performance with software rendering
 # Only available for armv6+ devices
-#MESA_GALLIUM_LLVM_PACKAGECONFIG = "gallium-llvm"
-#MESA_GALLIUM_LLVM_PACKAGECONFIG:omapl138 = ""
-#PACKAGECONFIG:append:pn-mesa = " ${MESA_GALLIUM_LLVM_PACKAGECONFIG}"
-#PACKAGECONFIG:append:pn-mesa-pvr = " ${MESA_GALLIUM_LLVM_PACKAGECONFIG}"
+MESA_GALLIUM_LLVM_PACKAGECONFIG = "gallium-llvm"
+MESA_GALLIUM_LLVM_PACKAGECONFIG:omapl138 = ""
+PACKAGECONFIG:append:pn-mesa = " ${MESA_GALLIUM_LLVM_PACKAGECONFIG}"
+PACKAGECONFIG:append:pn-mesa-pvr = " ${MESA_GALLIUM_LLVM_PACKAGECONFIG}"
 
 # Enable netperf intervals/pacing and histogram
 PACKAGECONFIG:append:pn-netperf = " intervals histogram"
-- 
2.17.1


