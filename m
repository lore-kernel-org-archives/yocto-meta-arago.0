Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EA72C47DDF
	for <webhook@archiver.kernel.org>; Wed, 31 Jan 2024 09:20:36 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.10325.1706692828392307940
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 31 Jan 2024 01:20:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=JzFP4KtK;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: c-shilwant@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 40V9KOPg054639;
	Wed, 31 Jan 2024 03:20:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1706692824;
	bh=FKgZrNYf1xPK99982TY/ywGhKbHUuu4bo5xjPCg8+nM=;
	h=From:To:CC:Subject:Date;
	b=JzFP4KtKqoUdG8Z7foWaX1a5Sflrs0Gl6gnnVterHiSnzYgVBy9K3w6zSHM1A20Yv
	 v5hpP5iReKDedCO9BsmIM388PirM9aOMwq+av51MElp+V20NxjttlsQlw0I2X/osHN
	 xi2QHTwm43oCzfR0n7z2dbuOE1NKBZs7PlTtaz/s=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 40V9KOsI026791
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 31 Jan 2024 03:20:24 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 31
 Jan 2024 03:20:22 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 31 Jan 2024 03:20:23 -0600
Received: from localhost (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 40V9KMSX076409;
	Wed, 31 Jan 2024 03:20:22 -0600
From: Chirag Shilwant <c-shilwant@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        Ryan Eatmon <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: Sai Sree Kartheek Adivi <s-adivi@ti.com>, Paresh Bhagat <p-bhagat@ti.com>,
        Khasim <khasim@ti.com>, Gyan Gupta <g-gupta@ti.com>
Subject: [meta-arago][oe-layersetup][PATCH] configs: processor-sdk: Add new config for 9.2 EA Release
Date: Wed, 31 Jan 2024 14:48:59 +0530
Message-ID: <20240131091859.2203698-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 31 Jan 2024 09:20:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15099

- Add processor-sdk-09.02.00.08-am64x-config.txt that will be used for building AM64x.

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 .../processor-sdk-09.02.00.08-am64x-config.txt   | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 configs/processor-sdk/processor-sdk-09.02.00.08-am64x-config.txt

diff --git a/configs/processor-sdk/processor-sdk-09.02.00.08-am64x-config.txt b/configs/processor-sdk/processor-sdk-09.02.00.08-am64x-config.txt
new file mode 100644
index 0000000..650ce65
--- /dev/null
+++ b/configs/processor-sdk/processor-sdk-09.02.00.08-am64x-config.txt
@@ -0,0 +1,16 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,https://git.openembedded.org/bitbake,2.0,2c6183594279e2e9d03f11155ad969448869c863
+meta-tisdk,https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git,kirkstone,09.02.00.08,layers=
+meta-arago,https://git.yoctoproject.org/meta-arago,kirkstone,09.02.00.001,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,kirkstone,ae8a97f79364bed1abc297636f7933d0e35f22be,layers=
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,kirkstone,88327090d26955a678c6f8bd2585aad4d802f6c4,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,kirkstone,402affcc073db39f782c1ebfd718edd5f11eed4c,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
+meta-ti,https://git.yoctoproject.org/meta-ti,kirkstone,09.02.00.001,layers=meta-ti-extras:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,kirkstone,b187fb9232ca0a6b5f8f90b4715958546fc41d73,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,kirkstone,227b3d4edad31b0d0045f41133271693265240b0,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+meta-edgeai,https://git.ti.com/git/edgeai/meta-edgeai.git,kirkstone,02ce7e60b449c72def00f26afc549034cbd82ba9,layers=
+OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
+BITBAKE_INCLUSIVE_VARS=yes
-- 
2.34.1


