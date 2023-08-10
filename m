Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5E98C001DE
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 10:17:55 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.13987.1691662674866491542
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 10 Aug 2023 03:17:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=EALUNu+w;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: a-limaye@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 37AAHswY021722
	for <meta-arago@lists.yoctoproject.org>; Thu, 10 Aug 2023 05:17:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1691662674;
	bh=t5aQ8N0opG5SHZD/6YOiwb9gzyaLAwUhkIgIx7cMPW8=;
	h=From:To:CC:Subject:Date;
	b=EALUNu+woSqZeogX6wHref3qLOdj+2i/8lFPXSgiKfc7rFd6Ev3lgxE3qg5vpzH4T
	 m2EuUIhG/K7NdxKi81w/JFIDYOWDwCjvCI38BA8yP/VINDyZyn1pcN47BvLbMBEuCq
	 3ap4t8MYmTV1TJZde6rli8+4Sej5T6Ck5ZKB92Jg=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 37AAHsqW021468
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Thu, 10 Aug 2023 05:17:54 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 10
 Aug 2023 05:17:54 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 10 Aug 2023 05:17:53 -0500
Received: from PSDKL-Workstation0.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 37AAHqN5030784;
	Thu, 10 Aug 2023 05:17:52 -0500
From: Aniket Limaye <a-limaye@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, Aniket Limaye <a-limaye@ti.com>
Subject: [meta-arago][oe-layersetup][PATCH] configs: processor-sdk-linux: Adding 9.0 release config for J7200
Date: Thu, 10 Aug 2023 15:47:48 +0530
Message-ID: <20230810101748.1517517-1-a-limaye@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 10 Aug 2023 10:17:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14832

Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
 .../processor-sdk-linux-09_00_00_07.txt       | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 configs/processor-sdk-linux/processor-sdk-linux-09_00_00_07.txt

diff --git a/configs/processor-sdk-linux/processor-sdk-linux-09_00_00_07.txt b/configs/processor-sdk-linux/processor-sdk-linux-09_00_00_07.txt
new file mode 100644
index 0000000..06f2fd4
--- /dev/null
+++ b/configs/processor-sdk-linux/processor-sdk-linux-09_00_00_07.txt
@@ -0,0 +1,19 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,https://git.openembedded.org/bitbake,2.0,907416ee1062f87f5844ab0638b54616abfc1a22
+meta-arago,https://git.yoctoproject.org/meta-arago,kirkstone,09.00.00.007,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,kirkstone,bff5bd937f0776166e81a63f3dd39ede348ef758,layers=
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,kirkstone,b3b3dbc67504e8cd498d6db202ddcf5a9dd26a9d,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,kirkstone,346753705e49a2486867dc150181a1c7f4d69377,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,https://git.yoctoproject.org/meta-ti,kirkstone,09.00.00.007,layers=meta-ti-extras:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,kirkstone,c39bb4ce3b60b73d35c5fb06af012432e70d6b38,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,kirkstone,200c2783b3f8546f561382fff6bd5268680d403a,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
+BITBAKE_INCLUSIVE_VARS=yes
+meta-aws,https://github.com/aws/meta-aws.git,kirkstone,b72cb364f79aa055242e703e284900b23e61facd,layers=
+meta-psdkla,https://git.ti.com/git/jacinto-linux/meta-psdkla.git,kirkstone,09.00.00.07,layers=
+LOCALCONF:DISTRO_FEATURES:append = " virtualization"
+
-- 
2.34.1


