Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 796A9EB64DC
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 11:32:36 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.5941.1689593549380489422
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 17 Jul 2023 04:32:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=lYf4ahtl;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: c-shilwant@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 36HBWPZZ106132;
	Mon, 17 Jul 2023 06:32:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1689593545;
	bh=6Btjr53EePKMEl9sumEZqeSXAQv5nTJDOj3Ae5LxWYw=;
	h=From:To:CC:Subject:Date;
	b=lYf4ahtlgHkBEIyIfZti4XOmn5fU/vWJPSyNVteMSRmEt24Gisvil1FezaA5U0/BB
	 gUbcHPbsstwYuGUCR5hQjDwCxcfc/lsUzgOzIoyZMzQLIrcL+H6O7q0enhBUwH/jEX
	 YRfNziSLCugntb8dE4HS87k55PmbxRT9QHYnhOmg=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 36HBWPem003569
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 17 Jul 2023 06:32:25 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 17
 Jul 2023 06:32:25 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 17 Jul 2023 06:32:25 -0500
Received: from SHIELD01.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 36HBWMFO003673;
	Mon, 17 Jul 2023 06:32:23 -0500
From: Chirag Shilwant <c-shilwant@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        Ryan Eatmon <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: Sai Sree Kartheek Adivi <s-adivi@ti.com>, Paresh Bhagat <p-bhagat@ti.com>,
        Gyan Gupta <g-gupta@ti.com>
Subject: [meta-arago][oe-layersetup][PATCH] configs: processor-sdk: add processor-sdk-09.00.00-config.txt
Date: Mon, 17 Jul 2023 17:02:20 +0530
Message-ID: <20230717113220.1004684-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 17 Jul 2023 11:32:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14804

- Add processor-sdk-09.00.00-config.txt for AM62x & AM64x

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 .../processor-sdk-09.00.00-config.txt           | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 configs/processor-sdk/processor-sdk-09.00.00-config.txt

diff --git a/configs/processor-sdk/processor-sdk-09.00.00-config.txt b/configs/processor-sdk/processor-sdk-09.00.00-config.txt
new file mode 100644
index 0000000..8d7d1ff
--- /dev/null
+++ b/configs/processor-sdk/processor-sdk-09.00.00-config.txt
@@ -0,0 +1,17 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,https://git.openembedded.org/bitbake,2.0,0c6f86b60cfba67c20733516957c0a654eb2b44c
+meta-edgeai,https://git.ti.com/git/edgeai/meta-edgeai.git,kirkstone,a1d9091cd914ce0bc69958891628a4cf86ed3e96,layers=
+meta-processor-sdk,https://git.ti.com/git/processor-sdk/meta-processor-sdk.git,kirkstone,9dad5765d33783f940ba3c32f4fc431e2b308621,layers=
+meta-arago,https://git.yoctoproject.org/meta-arago,kirkstone,09.00.00.006,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,kirkstone,bff5bd937f0776166e81a63f3dd39ede348ef758,layers=
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,kirkstone,b3b3dbc67504e8cd498d6db202ddcf5a9dd26a9d,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,kirkstone,346753705e49a2486867dc150181a1c7f4d69377,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
+meta-ti,https://git.yoctoproject.org/meta-ti,kirkstone,09.00.00.006,layers=meta-ti-extras:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,kirkstone,96aad3b29aa7a5ee4df5cf617a6336e5218fa9bd,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,kirkstone,f20a12ead2d5890e88e7f4ce149a777de47edc48,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
+BITBAKE_INCLUSIVE_VARS=yes
+
-- 
2.34.1


