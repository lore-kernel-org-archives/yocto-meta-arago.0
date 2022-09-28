Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1FE1C04A95
	for <webhook@archiver.kernel.org>; Wed, 28 Sep 2022 15:46:49 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web08.9743.1664380005731007587
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 28 Sep 2022 08:46:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=T/ss3+Zz;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: p-bhagat@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 28SFkin3050616
	for <meta-arago@lists.yoctoproject.org>; Wed, 28 Sep 2022 10:46:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1664380005;
	bh=PHljqNDyjgxuVDHpgk8vesUdEl1PiiNW3b48fw6G6ZE=;
	h=From:To:CC:Subject:Date;
	b=T/ss3+ZzDG3J9bSt4CvWGJFiA2aS7Sq2Mq6eRopucyflaRCcu9z6IAVBHXspCZiQ9
	 WhdjAe/3B1c3kczb8zDEga0hl4pKHFR6W50r+un/6feHsMVRyfbiEqxklT0xYcPpL0
	 xeBmoROPkgARDfokeDXfBSD+xtMqx8qupMeZ+YGY=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 28SFki4x050400
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 28 Sep 2022 10:46:44 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Wed, 28
 Sep 2022 10:46:44 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Wed, 28 Sep 2022 10:46:44 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 28SFkhp1007130;
	Wed, 28 Sep 2022 10:46:44 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>, <reatmon@ti.com>
CC: <c-shilwant@ti.com>, <s-adivi@ti.com>
Subject: [[meta-arago][oe-layersetup][master][PATCH]] configs: processor-sdk:
 add config for 08.04.01.03 and 08.04.01.04
Date: Wed, 28 Sep 2022 21:16:28 +0530
Message-ID: <20220928154628.2416-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 28 Sep 2022 15:46:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14045

- Add AM64x Processor SDK Config for 08.04.01.04 release
- Add AM62x Processor SDK Config for 08.04.01.03 release

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 .../processor-sdk-08.04.01.03-config.txt          | 15 +++++++++++++++
 .../processor-sdk-08.04.01.04-config.txt          | 15 +++++++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 configs/processor-sdk/processor-sdk-08.04.01.03-config.txt
 create mode 100644 configs/processor-sdk/processor-sdk-08.04.01.04-config.txt

diff --git a/configs/processor-sdk/processor-sdk-08.04.01.03-config.txt b/configs/processor-sdk/processor-sdk-08.04.01.03-config.txt
new file mode 100644
index 0000000..2deeb22
--- /dev/null
+++ b/configs/processor-sdk/processor-sdk-08.04.01.03-config.txt
@@ -0,0 +1,15 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,git://git.openembedded.org/bitbake,1.46,0784db7
+meta-processor-sdk,git://git.ti.com/processor-sdk/meta-processor-sdk.git,dunfell,7860b1b97635205ebe7af9d3128e8f6dec50e819,layers=
+meta-arago,git://git.yoctoproject.org/meta-arago,dunfell,08.04.01.005,layers=meta-arago-distro:meta-arago-extras
+# meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,5ef3a0f,layers=
+meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,beea119eb529b4a11f266004aee8b548427aea39,layers=
+meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,6792ebdd966aa0fb662989529193a0940fbfee00,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,08.04.01.005,layers=
+meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
+oe-core,git://git.openembedded.org/openembedded-core,dunfell,ef38f7acee3f0ae400138fa60f4695a86dffc16e,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64.conf.sample
diff --git a/configs/processor-sdk/processor-sdk-08.04.01.04-config.txt b/configs/processor-sdk/processor-sdk-08.04.01.04-config.txt
new file mode 100644
index 0000000..9e466fe
--- /dev/null
+++ b/configs/processor-sdk/processor-sdk-08.04.01.04-config.txt
@@ -0,0 +1,15 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,git://git.openembedded.org/bitbake,1.46,0784db7
+meta-processor-sdk,git://git.ti.com/processor-sdk/meta-processor-sdk.git,dunfell,479b10537b422694df4b9bac9c1b39d8cf9d39c5,layers=
+meta-arago,git://git.yoctoproject.org/meta-arago,dunfell,08.04.01.005,layers=meta-arago-distro:meta-arago-extras
+# meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,5ef3a0f,layers=
+meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,beea119eb529b4a11f266004aee8b548427aea39,layers=
+meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,6792ebdd966aa0fb662989529193a0940fbfee00,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,08.04.01.005,layers=
+meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
+oe-core,git://git.openembedded.org/openembedded-core,dunfell,ef38f7acee3f0ae400138fa60f4695a86dffc16e,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64.conf.sample
-- 
2.17.1


