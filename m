Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFB3EC4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 09:10:56 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.17983.1702545050044975406
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 14 Dec 2023 01:10:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=wRhDmaaa;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: c-shilwant@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3BE9Allb124967;
	Thu, 14 Dec 2023 03:10:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1702545047;
	bh=O7WPVEU76CJF8Fa2tUChaqk07wPbxAmoaI7YrJZzRAw=;
	h=From:To:CC:Subject:Date;
	b=wRhDmaaaCjHXf4rd5IkvbxsE2lI4CI7j6UytnJCWfJk7sfbcu5Z1Ae8Zv+QOrRYiv
	 OpOzZYKV7FFKCQDDNcTDhCOJsDawziFt7jzg56cP+pnxHC8hylok/z71mM2mfBqH5d
	 jyj2PYb8wMBTTbT173z1Kgdui6x6VU4EemKCs0bY=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3BE9AlXN022982
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 14 Dec 2023 03:10:47 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 14
 Dec 2023 03:10:46 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 14 Dec 2023 03:10:46 -0600
Received: from localhost (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3BE9AjW7084855;
	Thu, 14 Dec 2023 03:10:46 -0600
From: Chirag Shilwant <c-shilwant@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        Ryan Eatmon <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: Sai Sree Kartheek Adivi <s-adivi@ti.com>, Paresh Bhagat <p-bhagat@ti.com>,
        Khasim <khasim@ti.com>, Gyan Gupta <g-gupta@ti.com>
Subject: [meta-arago][oe-layersetup][PATCH] configs: processor-sdk: Add new config for 9.1 Release
Date: Thu, 14 Dec 2023 14:40:43 +0530
Message-ID: <20231214091043.3007056-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 14 Dec 2023 09:10:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15062

- Add processor-sdk-09.01.00-config.txt used for
building AM62x, AM62Px, AM64x, AM62SIP & AM62LP.

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 .../processor-sdk-09.01.00-config.txt          | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 configs/processor-sdk/processor-sdk-09.01.00-config.txt

diff --git a/configs/processor-sdk/processor-sdk-09.01.00-config.txt b/configs/processor-sdk/processor-sdk-09.01.00-config.txt
new file mode 100644
index 0000000..cd560ba
--- /dev/null
+++ b/configs/processor-sdk/processor-sdk-09.01.00-config.txt
@@ -0,0 +1,18 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,https://git.openembedded.org/bitbake,2.0,a7f6c3e67bd9170e93b2b94676e84018faf0df91
+meta-tisdk,https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git,kirkstone,09.01.00.08,layers=
+meta-arago,https://git.yoctoproject.org/meta-arago,kirkstone,09.01.00.008,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,kirkstone,ae8a97f79364bed1abc297636f7933d0e35f22be,layers=
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,kirkstone,67b0ef4256a484851f3556d281ca4caa88374388,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,kirkstone,8a75c61cce2aa1d6e5a3597ab8fc5a7e6aeae1e4,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
+meta-ti,https://git.yoctoproject.org/meta-ti,kirkstone,09.01.00.008,layers=meta-ti-extras:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,kirkstone,b187fb9232ca0a6b5f8f90b4715958546fc41d73,layers=meta-arm:meta-arm-toolchain
+#meta-clang,https://github.com/kraj/meta-clang,kirkstone,59408ccade8843ea051319b6dfb356cc01368063,layers=
+oe-core,https://git.openembedded.org/openembedded-core,kirkstone,11da43b58e19583a9bc16044309610cfb2e86469,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+meta-edgeai,https://git.ti.com/git/edgeai/meta-edgeai.git,kirkstone,87d730d9c1778c7f892b096878f338f36d6877f4,layers=
+OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
+BITBAKE_INCLUSIVE_VARS=yes
-- 
2.34.1


