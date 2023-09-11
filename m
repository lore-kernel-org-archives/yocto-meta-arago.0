Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD4B0EE7FF4
	for <webhook@archiver.kernel.org>; Mon, 11 Sep 2023 13:36:01 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.58524.1694439356050434344
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 11 Sep 2023 06:35:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=eo/rW2kl;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: c-shilwant@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 38BDZqt3031273;
	Mon, 11 Sep 2023 08:35:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1694439352;
	bh=By8TBN1jX0nU5rB/6v9ubF+PhfUpdCtTnYFN7tarnCk=;
	h=From:To:CC:Subject:Date;
	b=eo/rW2klzvoV1Ez2Rx2vW/WWebcXAqSqVKan9XkKW3yS/Nh0gBkrsk9shvn/adni7
	 Rc0dMcBCZ62Wm77TfzlqRY5vuAUVP0K5nNxkYmtPyaCSJjDx9jJZRo1GXQv2h2zYdR
	 P3lHblpUyDa2r2YoB7TVxdXktBYkH3j/NO4aq7Fo=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 38BDZqdJ111629
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 11 Sep 2023 08:35:52 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 11
 Sep 2023 08:35:51 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 11 Sep 2023 08:35:51 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 38BDZpaA032301;
	Mon, 11 Sep 2023 08:35:51 -0500
From: Chirag Shilwant <c-shilwant@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        Ryan Eatmon <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: Sai Sree Kartheek Adivi <s-adivi@ti.com>, Paresh Bhagat <p-bhagat@ti.com>,
        Khasim <khasim@ti.com>, Gyan Gupta <g-gupta@ti.com>
Subject: [meta-arago][oe-layersetup][PATCH] configs: processor-sdk: Update processor-sdk-09.00.00-config.txt
Date: Mon, 11 Sep 2023 19:05:40 +0530
Message-ID: <20230911133540.1775039-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 11 Sep 2023 13:36:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14894

- Update processor-sdk-09.00.00-config.txt for AM62x & AM64x

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 .../processor-sdk-09.00.00-config.txt         | 21 ++++++++++---------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/configs/processor-sdk/processor-sdk-09.00.00-config.txt b/configs/processor-sdk/processor-sdk-09.00.00-config.txt
index d3a00b0..7671d81 100644
--- a/configs/processor-sdk/processor-sdk-09.00.00-config.txt
+++ b/configs/processor-sdk/processor-sdk-09.00.00-config.txt
@@ -1,16 +1,17 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,https://git.openembedded.org/bitbake,2.0,0c6f86b60cfba67c20733516957c0a654eb2b44c
-meta-edgeai,https://git.ti.com/git/edgeai/meta-edgeai.git,kirkstone,a1d9091cd914ce0bc69958891628a4cf86ed3e96,layers=
-meta-processor-sdk,https://git.ti.com/git/processor-sdk/meta-processor-sdk.git,kirkstone,9dad5765d33783f940ba3c32f4fc431e2b308621,layers=
-meta-arago,https://git.yoctoproject.org/meta-arago,kirkstone,09.00.00.006,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos
-meta-qt5,https://github.com/meta-qt5/meta-qt5.git,kirkstone,bff5bd937f0776166e81a63f3dd39ede348ef758,layers=
-meta-virtualization,https://git.yoctoproject.org/meta-virtualization,kirkstone,b3b3dbc67504e8cd498d6db202ddcf5a9dd26a9d,layers=
-meta-openembedded,https://git.openembedded.org/meta-openembedded,kirkstone,346753705e49a2486867dc150181a1c7f4d69377,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
-meta-ti,https://git.yoctoproject.org/meta-ti,kirkstone,09.00.00.006,layers=meta-ti-extras:meta-ti-bsp
-meta-arm,https://git.yoctoproject.org/meta-arm,kirkstone,96aad3b29aa7a5ee4df5cf617a6336e5218fa9bd,layers=meta-arm:meta-arm-toolchain
-oe-core,https://git.openembedded.org/openembedded-core,kirkstone,f20a12ead2d5890e88e7f4ce149a777de47edc48,layers=meta
+bitbake,https://git.openembedded.org/bitbake,2.0,41b6684489d0261753344956042be2cc4adb0159
+meta-edgeai,https://git.ti.com/git/edgeai/meta-edgeai.git,kirkstone,dc78e4f3906774ac281dbb89fab258bef4efd2f4,layers=
+meta-processor-sdk,https://git.ti.com/git/processor-sdk/meta-processor-sdk.git,kirkstone,d62bb16a9490216371b0ccf0a11e967582d7a681,layers=
+meta-arago,https://git.yoctoproject.org/meta-arago,kirkstone,09.00.00.009,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,kirkstone,31930afca79b74e0c788452d71356c1f045e7979,layers=
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,kirkstone,e60f59f3567b78286ea34337dbae468a5f18f1c6,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,kirkstone,529620141e773080a6a7be4615fb7993204af883,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,https://git.yoctoproject.org/meta-ti,kirkstone,09.00.00.009,layers=meta-ti-extras:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,kirkstone,b187fb9232ca0a6b5f8f90b4715958546fc41d73,layers=meta-arm:meta-arm-toolchain
+meta-clang,https://github.com/kraj/meta-clang,kirkstone,2d08d6bf376a1e06c53164fd6283b03ec2309da4,layers=
+oe-core,https://git.openembedded.org/openembedded-core,kirkstone,8ceaeff90023e51c7e874464f026b30d24035bda,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
 BITBAKE_INCLUSIVE_VARS=yes
-- 
2.34.1


