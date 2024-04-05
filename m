Return-Path: <r-ravikumar@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED6C9CD1284
	for <webhook@archiver.kernel.org>; Fri,  5 Apr 2024 07:21:15 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.5658.1712301675212128367
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 05 Apr 2024 00:21:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=f5nFuSpB;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: r-ravikumar@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4357LE7h058306
	for <meta-arago@lists.yoctoproject.org>; Fri, 5 Apr 2024 02:21:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1712301674;
	bh=djriWCYg1HBLIxhmr/2c9xdBoi9GjNuZoLkC91/UWcc=;
	h=From:To:CC:Subject:Date;
	b=f5nFuSpBERLkklB7PUD4olpSMN7MzECNEvJDZrX3vgqMYOJasnWLIag6AJw9ujuDM
	 SjB5BDEyDZmxMtj6kmhnpLbbcRjGVQUKFMjwno7WSYl49qRmX28j/W1Qk/eyjL2mOa
	 lBYTfRd+CUB+mk+JzaYAcqcO/Lpds6ybmVydmiEw=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4357LEDE014502
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Fri, 5 Apr 2024 02:21:14 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 5
 Apr 2024 02:21:13 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 5 Apr 2024 02:21:13 -0500
Received: from localhost (edgeaisrv1.dhcp.ti.com [10.24.69.154])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4357LCBc005234;
	Fri, 5 Apr 2024 02:21:13 -0500
From: Rahul T R <r-ravikumar@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, Rahul T R <r-ravikumar@ti.com>
Subject: [meta-arago][oe-layersetup][PATCH] configs: processor-sdk-analytics: Add 9.2 release config
Date: Fri, 5 Apr 2024 12:51:10 +0530
Message-ID: <20240405072110.2314079-1-r-ravikumar@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 05 Apr 2024 07:21:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15258

Also update meta-edgeai commit of 9.1 config to get a fix related
to tisdk-uenv

Signed-off-by: Rahul T R <r-ravikumar@ti.com>
---
 .../processor-sdk-analytics-09.01.00-config.txt  |  2 +-
 .../processor-sdk-analytics-09.02.00-config.txt  | 16 ++++++++++++++++
 2 files changed, 17 insertions(+), 1 deletion(-)
 create mode 100644 configs/processor-sdk-analytics/processor-sdk-analytics-09.02.00-config.txt

diff --git a/configs/processor-sdk-analytics/processor-sdk-analytics-09.01.00-config.txt b/configs/processor-sdk-analytics/processor-sdk-analytics-09.01.00-config.txt
index fa57171..3a302a9 100644
--- a/configs/processor-sdk-analytics/processor-sdk-analytics-09.01.00-config.txt
+++ b/configs/processor-sdk-analytics/processor-sdk-analytics-09.01.00-config.txt
@@ -10,7 +10,7 @@ meta-ti,https://git.yoctoproject.org/meta-ti,kirkstone,6ad91a192fa1ab33775a22894
 meta-arm,https://git.yoctoproject.org/meta-arm,kirkstone,b187fb9232ca0a6b5f8f90b4715958546fc41d73,layers=meta-arm:meta-arm-toolchain
 oe-core,https://git.openembedded.org/openembedded-core,kirkstone,b77cd331199fa62e3b162f37efca3b927c68d8e5,layers=meta
 meta-tisdk,https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git,kirkstone,d0a92bc0a53276a3faad16ed52084451f4d1b3bf,layers=
-meta-edgeai,https://git.ti.com/git/edgeai/meta-edgeai.git,kirkstone,02ce7e60b449c72def00f26afc549034cbd82ba9,layers=
+meta-edgeai,https://git.ti.com/git/edgeai/meta-edgeai.git,kirkstone,fa42c52098a72461921dd3fb848ff1271bdb7425,layers=
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
 BITBAKE_INCLUSIVE_VARS=yes
diff --git a/configs/processor-sdk-analytics/processor-sdk-analytics-09.02.00-config.txt b/configs/processor-sdk-analytics/processor-sdk-analytics-09.02.00-config.txt
new file mode 100644
index 0000000..5ec39e5
--- /dev/null
+++ b/configs/processor-sdk-analytics/processor-sdk-analytics-09.02.00-config.txt
@@ -0,0 +1,16 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,https://git.openembedded.org/bitbake,2.0,40fd5f4eef7460ca67f32cfce8e229e67e1ff607
+meta-arago,https://git.yoctoproject.org/meta-arago,kirkstone,98f178314931635c8641d1394dfd4341b86b6be2,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,kirkstone,ae8a97f79364bed1abc297636f7933d0e35f22be,layers=
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,kirkstone,cb2bc17e96552cdfc141d27bd9f4dbd95a872846,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,kirkstone,8bb16533532b6abc2eded7d9961ab2a108fd7a5b,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,https://git.yoctoproject.org/meta-ti,kirkstone,376a2143533c6497b4e79304eccca2a630784436,layers=meta-ti-extras:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,kirkstone,d7b7b6fb6c7c5545e718e44f38853d1718ce5446,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,kirkstone,1b5405955c7c2579ed1f52522e2e177d0281fa33,layers=meta
+meta-tisdk,https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git,kirkstone,b127f5f2a16fdc092a339939cf04c2fc92f15a34,layers=
+meta-edgeai,https://git.ti.com/git/edgeai/meta-edgeai.git,kirkstone,0de8484d01ea85a7c366e6b56b1119613321dddb,layers=
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
+BITBAKE_INCLUSIVE_VARS=yes
-- 
2.34.1


