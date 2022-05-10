Return-Path: <devarsht@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDB34C433F5
	for <webhook@archiver.kernel.org>; Tue, 10 May 2022 06:31:01 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.6450.1652164260232618697
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 09 May 2022 23:31:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=wWTh8JjJ;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: devarsht@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 24A6UxX9024785
	for <meta-arago@lists.yoctoproject.org>; Tue, 10 May 2022 01:30:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1652164259;
	bh=VgdTvlukxC3AHCRGP8CLL+XywvO2teWe1e5DN/B4qb0=;
	h=From:To:CC:Subject:Date;
	b=wWTh8JjJ2iIUM0el8iBZDsO4alQnZ6Z3typ6s+FBlzTA8L6hcw0t1FbqilsE5LyRR
	 QAwa/u4S8GB2PIOsTHztctNP88hSCJ6xQp21VuovlL2ZSwhIqavJXOJhZmwbzhDfF4
	 FxU/DRd5yHLNzVitZUIyvFi7Y0iQ9XR29OoSo2sc=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 24A6Ux5O058538
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Tue, 10 May 2022 01:30:59 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 10
 May 2022 01:30:58 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 10 May 2022 01:30:58 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 24A6UvaA090117;
	Tue, 10 May 2022 01:30:58 -0500
From: Devarsh Thakkar <devarsht@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>
CC: <khasim@ti.com>, <nsekhar@ti.com>, <devarsht@ti.com>, <vigneshr@ti.com>,
        Ryan Eatmon <reatmon@ti.com>, <a-m1@ti.com>, <dannenberg@ti.com>
Subject: [meta-arago][oe-layersetup][master][PATCH] configs: processor-sdk:
 Add AM64x 8.2.0.23 config
Date: Tue, 10 May 2022 12:00:42 +0530
Message-ID: <20220510063042.20063-1-devarsht@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 10 May 2022 06:31:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13845

Add 8.2.0.23 AM64 config which is a version update
on 8.2 to :

1) Update DDR configuration for achieving
1600 MT/s on AM64 SK.
2) Fix build failure due to git security update.

Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
---
 .../processor-sdk-08.02.00.23-config.txt          | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 configs/processor-sdk/processor-sdk-08.02.00.23-config.txt

diff --git a/configs/processor-sdk/processor-sdk-08.02.00.23-config.txt b/configs/processor-sdk/processor-sdk-08.02.00.23-config.txt
new file mode 100644
index 0000000..5768254
--- /dev/null
+++ b/configs/processor-sdk/processor-sdk-08.02.00.23-config.txt
@@ -0,0 +1,15 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,git://git.openembedded.org/bitbake,1.46,d22cc1e
+meta-processor-sdk,git://git.ti.com/processor-sdk/meta-processor-sdk.git,dunfell,716008bc1003478d2e6c3e0c741f0fd80dcee5fb,layers=
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


