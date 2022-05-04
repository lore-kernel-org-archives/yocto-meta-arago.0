Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17F10C433EF
	for <webhook@archiver.kernel.org>; Wed,  4 May 2022 12:38:28 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.5865.1651667898452089923
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 04 May 2022 05:38:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=nJ/yn8aN;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: a-limaye@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 244CcGRN000956
	for <meta-arago@lists.yoctoproject.org>; Wed, 4 May 2022 07:38:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1651667896;
	bh=NH/xObE9xM95fp+rhitbJs/50UBE8993cs2lmK/qNHU=;
	h=From:To:CC:Subject:Date;
	b=nJ/yn8aNSupsNwRGVv6fSS9OZjHkODaqJ0VsmBpe8I4pAlmQHBJzeBwuPYhMSau3o
	 duG8hhUHdcA8VQSxhoJtPhFfMsbDlnC7jxmiR2uLrTNPJrVZtIqJAD8q4P1E/v+Mq7
	 /xLOEr8KVXj59aExZMuvku4xbJivvDB9+pe1pvZE=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 244CcGlF028038
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 4 May 2022 07:38:16 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 4
 May 2022 07:38:15 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 4 May 2022 07:38:15 -0500
Received: from edgeaipc1 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 244CcEGA046052;
	Wed, 4 May 2022 07:38:14 -0500
Received: from a0485100 by edgeaipc1 with local (Exim 4.90_1)
	(envelope-from <a-limaye@ti.com>)
	id 1nmEGi-0002tJ-SK; Wed, 04 May 2022 18:08:12 +0530
From: <a-limaye@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <l-weaver@ti.com>, <yogeshs@ti.com>, <praneeth@ti.com>, <a-limaye@ti.com>,
        <reatmon@ti.com>
Subject: [meta-arago][oe-layersetup][PATCH] processor-sdk-linux: Add 08.02.00
 release config
Date: Wed, 4 May 2022 18:07:20 +0530
Message-ID: <20220504123720.10990-1-a-limaye@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 04 May 2022 12:38:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13832

From: Aniket Limaye <a-limaye@ti.com>

Add config file for processor-sdk-linux 08.02.00 release

Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
 .../processor-sdk-linux-08_02_00.txt            | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 configs/processor-sdk-linux/processor-sdk-linux-08_02_00.txt

diff --git a/configs/processor-sdk-linux/processor-sdk-linux-08_02_00.txt b/configs/processor-sdk-linux/processor-sdk-linux-08_02_00.txt
new file mode 100644
index 0000000..fcfe14c
--- /dev/null
+++ b/configs/processor-sdk-linux/processor-sdk-linux-08_02_00.txt
@@ -0,0 +1,17 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,https://git.openembedded.org/bitbake,1.46,be6ecc160ac4a8d9715257b9b955363cecc081ea
+meta-arago,git://git.yoctoproject.org/meta-arago,dunfell,08.02.00.006,layers=meta-arago-distro:meta-arago-extras
+meta-psdkla,git://git.ti.com/jacinto-linux/meta-psdkla.git,master,08ef8ff32c2e3b26efc5b2cbae775f0d1f15e7eb,layers=
+#meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,6bfe29d9e8fdd5c2fd17c736814b6df859b3af50,layers=
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,dunfell,c5f61e547b90aa8058cf816f00902afed9c96f72,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,dunfell,0722ff6f021df91542b5efa1ff5b5f6269f66add,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,08.02.00.006,layers=
+meta-arm,https://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,dunfell,51844f2d60d77fb8cb46ffe460402f76ae216ca5,layers=meta
+meta-aws,https://github.com/aws/meta-aws.git,dunfell,2f72301f5a73279c4d2f12fc6218876629666e06,layers=
+meta-jupyter,https://github.com/Xilinx/meta-jupyter.git,master,82db248e2eca36e52cbeafe599b755dc87720383,layers=
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64.conf.sample
-- 
2.17.1


