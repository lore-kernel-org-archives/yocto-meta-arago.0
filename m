Return-Path: <devarsht@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82368C433EF
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 14:59:28 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.11825.1651157959945435222
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 28 Apr 2022 07:59:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=mPGs79K/;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: devarsht@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23SExIBQ003038
	for <meta-arago@lists.yoctoproject.org>; Thu, 28 Apr 2022 09:59:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1651157958;
	bh=3pbB5FkfGlxwWItzwgpz9DJ5kSrm91IRYiK1jXGKWJ0=;
	h=From:To:CC:Subject:Date;
	b=mPGs79K/vot+OrUlMSZaw9//HN2gdqzQGcey1GsifrH+9xzEYQvM5yPa6+S03FScx
	 7XNWsSan0JqhmyC0jXjGjzpWMuPr1DK404Iag764nl8ACo99QaBLOr7Jj1GDdY68/I
	 CIpLvMXUJZlJxpaCTaGB577YxYIqvkuzozbGxZp8=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23SExIeF105249
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Thu, 28 Apr 2022 09:59:18 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 28
 Apr 2022 09:59:18 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 28 Apr 2022 09:59:18 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23SExHPU081517;
	Thu, 28 Apr 2022 09:59:18 -0500
From: Devarsh Thakkar <devarsht@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>
CC: <nikhil.nd@ti.com>, <nsekhar@ti.com>, <devarsht@ti.com>,
 <vigneshr@ti.com>,
        Ryan Eatmon <reatmon@ti.com>, <a-m1@ti.com>
Subject: [meta-arago][oe-layersetup][master][PATCH] configs: processor-sdk:
 Add AM64x 8.2.0.17 config
Date: Thu, 28 Apr 2022 20:29:17 +0530
Message-ID: <20220428145917.3764-1-devarsht@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 28 Apr 2022 14:59:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13819

Add 8.2.0.17 AM64 config which is a version update
on 8.2 to update DDR configuration for acheiving
1600 MT/s on AM64 SK.

Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
---
 .../processor-sdk-08.02.00.17-config.txt          | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100755 configs/processor-sdk/processor-sdk-08.02.00.17-config.txt

diff --git a/configs/processor-sdk/processor-sdk-08.02.00.17-config.txt b/configs/processor-sdk/processor-sdk-08.02.00.17-config.txt
new file mode 100755
index 0000000..f074bdc
--- /dev/null
+++ b/configs/processor-sdk/processor-sdk-08.02.00.17-config.txt
@@ -0,0 +1,15 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,git://git.openembedded.org/bitbake,1.46,d22cc1e
+meta-processor-sdk,git://git.ti.com/processor-sdk/meta-processor-sdk.git,dunfell,d92e20cbcd624d8d94213f48b467706bc837f38c,layers=
+meta-arago,git://git.yoctoproject.org/meta-arago,dunfell,08.02.00.006,layers=meta-arago-distro:meta-arago-extras
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,6bfe29d,layers=
+meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,c5f61e5,layers=
+meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,0722ff6,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,08.02.00.006,layers=
+meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,c4f04f3,layers=meta-arm:meta-arm-toolchain
+oe-core,git://git.openembedded.org/openembedded-core,dunfell,51844f2,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64.conf.sample
-- 
2.17.1


