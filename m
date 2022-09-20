Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E10EECAAD8
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 09:33:47 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web08.9712.1663666422106000643
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 20 Sep 2022 02:33:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=F0Tqrbbl;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: a-limaye@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 28K9Xf2i061042
	for <meta-arago@lists.yoctoproject.org>; Tue, 20 Sep 2022 04:33:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1663666421;
	bh=6fGbf+XPZIf1q+cyRM56lknjoqdhjrQN2N+ZRc6xDc0=;
	h=From:To:CC:Subject:Date;
	b=F0Tqrbbl+MM2iHRCrcGYABnqe5uWL1c8Md9ajFUAsxL5SPrIK4vMzGdBn2A8jRRqS
	 NN8uBDTH7wIvku+DwCVoJdH4C2Gq2LRrJL2/JG9mwieHr2ODXpEmKfyFousU38OUTB
	 j5VEo75eB9WQacaOD08JMhmggJ9VioNRfJWfAG3k=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 28K9XfF4017391
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Tue, 20 Sep 2022 04:33:41 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Tue, 20
 Sep 2022 04:33:40 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Tue, 20 Sep 2022 04:33:40 -0500
Received: from edgeaipc1 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 28K9XdGM006426;
	Tue, 20 Sep 2022 04:33:40 -0500
Received: from a0485100 by edgeaipc1 with local (Exim 4.90_1)
	(envelope-from <a-limaye@ti.com>)
	id 1oaZdK-0002uS-FN; Tue, 20 Sep 2022 15:03:38 +0530
From: <a-limaye@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <l-weaver@ti.com>, <yogeshs@ti.com>, <praneeth@ti.com>, <a-limaye@ti.com>,
        <reatmon@ti.com>
Subject: [meta-arago][oe-layersetup][PATCH] processor-sdk-linux: Add 08.04.00
 release config
Date: Tue, 20 Sep 2022 15:03:32 +0530
Message-ID: <20220920093332.6657-1-a-limaye@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 20 Sep 2022 09:33:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14040

From: Aniket Limaye <a-limaye@ti.com>

Add config file for processor-sdk-linux 08.04.00 release

Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
 .../processor-sdk-linux-08_04_00.txt            | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 configs/processor-sdk-linux/processor-sdk-linux-08_04_00.txt

diff --git a/configs/processor-sdk-linux/processor-sdk-linux-08_04_00.txt b/configs/processor-sdk-linux/processor-sdk-linux-08_04_00.txt
new file mode 100644
index 0000000..aad02c5
--- /dev/null
+++ b/configs/processor-sdk-linux/processor-sdk-linux-08_04_00.txt
@@ -0,0 +1,17 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,https://git.openembedded.org/bitbake,1.46,7fc4cffebf5dcc1d050416c0b7f7d58c765c1d69
+meta-arago,git://git.yoctoproject.org/meta-arago,dunfell,08.04.00.005,layers=meta-arago-distro:meta-arago-extras
+meta-psdkla,git://git.ti.com/jacinto-linux/meta-psdkla.git,master,b6dcf3fe96473cf01b19301f95fdca166141bbef,layers=
+#meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,5ef3a0ffd3324937252790266e2b2e64d33ef34f,layers=
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,dunfell,a63a54df3170fed387f810f23cdc2f483ad587df,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,dunfell,52cee67833d1975a5bd52e4556c4cd312425a017,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,08.04.00.005,layers=
+meta-arm,https://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,dunfell,3f40d5f095ceb099b604750db96058df00fcd49e,layers=meta
+meta-aws,https://github.com/aws/meta-aws.git,dunfell,a64c32254c3731e9b3c40231bd60d2b21efa0488,layers=
+meta-jupyter,https://github.com/Xilinx/meta-jupyter.git,master,82db248e2eca36e52cbeafe599b755dc87720383,layers=
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64.conf.sample
-- 
2.17.1


