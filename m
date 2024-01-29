Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94452C47DA9
	for <webhook@archiver.kernel.org>; Mon, 29 Jan 2024 09:58:55 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.11008.1706522325354158889
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 29 Jan 2024 01:58:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=yhPj86F1;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: c-shilwant@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 40T9webE009032;
	Mon, 29 Jan 2024 03:58:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1706522320;
	bh=Mta2cCnJc0whiJYFpEbpbXoQy0+ePl2XGK96pNB1JmA=;
	h=From:To:CC:Subject:Date;
	b=yhPj86F1QIKU7z5zqy32J8mjM7TBu/sxH++Yr2hAi86D26jxLKjCjPzNYii+AIlml
	 Q8o/wzSvKU1h5DdIipYIJeiVLbWB7cCBbDu8qR+XaXIddK3Xs8Dm1nZy2lpJot8r0c
	 nkG3cSduK+rZIkYuqFlr8YOkuSASpmb4bnDb4SPQ=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 40T9wefZ004177
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 29 Jan 2024 03:58:40 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 29
 Jan 2024 03:58:39 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 29 Jan 2024 03:58:39 -0600
Received: from localhost (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 40T9wdJw026215;
	Mon, 29 Jan 2024 03:58:39 -0600
From: Chirag Shilwant <c-shilwant@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        Ryan Eatmon <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: Sai Sree Kartheek Adivi <s-adivi@ti.com>, Paresh Bhagat <p-bhagat@ti.com>,
        Khasim <khasim@ti.com>, Gyan Gupta <g-gupta@ti.com>
Subject: [meta-arago][kirkstone][PATCH] recipes-devtools: mtd-utils: Switch to infraroot.at for https over git protocol
Date: Mon, 29 Jan 2024 15:28:34 +0530
Message-ID: <20240129095834.77985-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 29 Jan 2024 09:58:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15098

- In past, there have been issues in do_fetch from infradead.org over git protocol in proxy based network [1].

- As per the latest release announcement from mtd-utils, infraroot.at is the official mirror for infradead.org [2].

- Since infradead.org has fetch failures over git, start using infraroot.at over https in SRC_URI.

Reference
---------
[1] https://e2e.ti.com/support/processors-group/processors/f/processors-forum/962170/processor-sdk-am65x-how-to-resolve-the-fetch-error-that-occurs-when-executing-bitbake
[2] https://lists.infradead.org/pipermail/linux-mtd/2023-August/100922.html

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 .../recipes-devtools/mtd/mtd-utils_git.bbappend           | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta-arago-test/recipes-devtools/mtd/mtd-utils_git.bbappend b/meta-arago-test/recipes-devtools/mtd/mtd-utils_git.bbappend
index aec6a1ac..341d0600 100644
--- a/meta-arago-test/recipes-devtools/mtd/mtd-utils_git.bbappend
+++ b/meta-arago-test/recipes-devtools/mtd/mtd-utils_git.bbappend
@@ -1,4 +1,10 @@
-PR:append = ".arago1"
+PR:append = ".arago2"
+
+SRC_URI:remove = "git://git.infradead.org/mtd-utils.git;branch=master \
+"
+
+SRC_URI:prepend = "git://git.infraroot.at/mtd-utils.git;branch=master;protocol=https \
+"
 
 BBCLASSEXTEND += "nativesdk"
 
-- 
2.34.1


