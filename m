Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19EC4C4332F
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 09:07:50 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.182250.1698743260096487545
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 31 Oct 2023 02:07:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=KnG6XTQn;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: c-shilwant@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39V97XCQ022059;
	Tue, 31 Oct 2023 04:07:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1698743253;
	bh=xRZqUIFxMdFow4TDaPxVHLArtwvs1gaOPnbIo5AHJ9k=;
	h=From:To:CC:Subject:Date;
	b=KnG6XTQnJnf2ObOQkCMshLyBLG5l016txuYN9+KXWMNkhp6aUFInCFDQjBsSK/U8M
	 iAXLzCbHzQeWwsOZxXBBGpxLERAak6v5ifPs+vDSsBqCxBXfwoTP16jU7vMjQ1Iljh
	 d2QEAkxjmK4eBUx41QdQKBbjZixMUGD332wA8+mE=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39V97XoU086246
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 31 Oct 2023 04:07:33 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 31
 Oct 2023 04:07:32 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 31 Oct 2023 04:07:32 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39V97Wfc017553;
	Tue, 31 Oct 2023 04:07:32 -0500
From: Chirag Shilwant <c-shilwant@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        Ryan Eatmon <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: Sai Sree Kartheek Adivi <s-adivi@ti.com>, Paresh Bhagat <p-bhagat@ti.com>,
        Khasim <khasim@ti.com>, Gyan Gupta <g-gupta@ti.com>
Subject: [meta-arago][oe-layersetup][PATCH] configs: processor-sdk: Add new config for AM33x, AM43x
Date: Tue, 31 Oct 2023 14:37:03 +0530
Message-ID: <20231031090703.2510347-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 31 Oct 2023 09:07:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14975

- Add processor-sdk-09.01.00-legacy-config.txt used for building AM33x, AM43x.

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 .../processor-sdk-09.01.00-legacy-config.txt      | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 configs/processor-sdk/processor-sdk-09.01.00-legacy-config.txt

diff --git a/configs/processor-sdk/processor-sdk-09.01.00-legacy-config.txt b/configs/processor-sdk/processor-sdk-09.01.00-legacy-config.txt
new file mode 100644
index 0000000..66a47e3
--- /dev/null
+++ b/configs/processor-sdk/processor-sdk-09.01.00-legacy-config.txt
@@ -0,0 +1,15 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,https://git.openembedded.org/bitbake,2.0,9993a89e5b97dda5f3657e5a7cc3a4fa94ff7111
+meta-processor-sdk,https://git.ti.com/git/processor-sdk/meta-processor-sdk.git,kirkstone,09.01.00.001,layers=
+meta-arago,https://git.yoctoproject.org/meta-arago,kirkstone,09.01.00.001,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,kirkstone,ae8a97f79364bed1abc297636f7933d0e35f22be,layers=
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,kirkstone,2d8b3cba8ff27c9ec2187a52b6a551fe1dcfaa07,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,kirkstone,9c5541f7e18a1fac3b8dea71e1ebb8398d58e6ff,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
+meta-ti,https://git.yoctoproject.org/meta-ti,kirkstone,09.01.00.001,layers=meta-ti-extras:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,kirkstone,b187fb9232ca0a6b5f8f90b4715958546fc41d73,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,kirkstone,2572b32e729831762790ebfbf930a1140657faea,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
+BITBAKE_INCLUSIVE_VARS=yes
-- 
2.34.1


