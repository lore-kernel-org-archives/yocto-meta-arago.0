Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E7F4C25B74
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 07:03:13 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.14007.1716274985729400196
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 21 May 2024 00:03:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=JkTpF+Lc;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: c-shilwant@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44L734Le072989
	for <meta-arago@lists.yoctoproject.org>; Tue, 21 May 2024 02:03:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1716274984;
	bh=Xin6PGnAzFo+76d+qo+8NeQcuyxkX+bBB1RXFRQVMA4=;
	h=From:To:CC:Subject:Date;
	b=JkTpF+LcJXTC2N1QnFe/M7NicG6VFbWmDwCaB8tbFLTcg9HWIwLbTXget5rN9aPee
	 SgW4gPq0oUcLN4qdJ7oUghRiswaI0sx6nI7pfTKnQvURbQURXldPnvbH+mPTCrWFDv
	 osgDyqzj4qDP6Ihxp0XofvZpclomPfnkXbBYfQn8=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44L734Q5006737
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Tue, 21 May 2024 02:03:04 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 21
 May 2024 02:03:04 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 21 May 2024 02:03:04 -0500
Received: from localhost (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44L733LU074689;
	Tue, 21 May 2024 02:03:04 -0500
From: Chirag Shilwant <c-shilwant@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Gyan Gupta <g-gupta@ti.com>
Subject: [meta-arago][oe-layersetup][master][PATCH] configs: processor-sdk: Add new config for 9.2.1 SDK Release
Date: Tue, 21 May 2024 12:32:55 +0530
Message-ID: <20240521070255.5298-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 21 May 2024 07:03:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15336

- Add processor-sdk-kirkstone-09.02.01.10-config.txt used for
building AM62SIP & AM64x.

- Add processor-sdk-kirkstone-chromium-09.02.01.10-config.txt used
for building AM62P, AM62x & AM62LP.

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 ...cessor-sdk-kirkstone-09.02.01.10-config.txt | 17 +++++++++++++++++
 ...k-kirkstone-chromium-09.02.01.10-config.txt | 18 ++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 configs/processor-sdk/processor-sdk-kirkstone-09.02.01.10-config.txt
 create mode 100644 configs/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.10-config.txt

diff --git a/configs/processor-sdk/processor-sdk-kirkstone-09.02.01.10-config.txt b/configs/processor-sdk/processor-sdk-kirkstone-09.02.01.10-config.txt
new file mode 100644
index 0000000..665b0c6
--- /dev/null
+++ b/configs/processor-sdk/processor-sdk-kirkstone-09.02.01.10-config.txt
@@ -0,0 +1,17 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,https://git.openembedded.org/bitbake,2.0,40fd5f4eef7460ca67f32cfce8e229e67e1ff607
+meta-tisdk,https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git,kirkstone,09.02.01.10,layers=
+meta-arago,https://git.yoctoproject.org/meta-arago,kirkstone,09.02.00.010,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,kirkstone,644ebf220245bdc06e7696ccc90acc97a0dd2566,layers=
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,kirkstone,8f0eb65edaf6d280294c33446a9bb073a50b8c14,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,kirkstone,5a6f7925bd2b885955c942573f70a5594f231563,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,https://git.yoctoproject.org/meta-ti,kirkstone,09.02.00.010,layers=meta-ti-extras:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,kirkstone,260e3adc2bf322f52d81c0642c825088a88bb051,layers=meta-arm:meta-arm-toolchain
+meta-clang,https://github.com/kraj/meta-clang,kirkstone-clang12,c2e89dc7e1dfcc1bbe432afca2dc43d6560cb007,layers=
+oe-core,https://git.openembedded.org/openembedded-core,kirkstone,8a502301209ef144932ef5071c1a9b738db23270,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+meta-edgeai,https://git.ti.com/git/edgeai/meta-edgeai.git,kirkstone,fdb683aa69d4d70aca17c2d53be3f900ae9d5e72,layers=
+OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
+BITBAKE_INCLUSIVE_VARS=yes
diff --git a/configs/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.10-config.txt b/configs/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.10-config.txt
new file mode 100644
index 0000000..f39a317
--- /dev/null
+++ b/configs/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.10-config.txt
@@ -0,0 +1,18 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,https://git.openembedded.org/bitbake,2.0,40fd5f4eef7460ca67f32cfce8e229e67e1ff607
+meta-tisdk,https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git,kirkstone,09.02.01.10,layers=
+meta-arago,https://git.yoctoproject.org/meta-arago,kirkstone,09.02.00.010,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
+meta-browser,https://github.com/OSSystems/meta-browser.git,master,d3d16b47e17dc899e5298cff698dc32e5e639ab4,layers=meta-chromium
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,kirkstone,644ebf220245bdc06e7696ccc90acc97a0dd2566,layers=
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,kirkstone,8f0eb65edaf6d280294c33446a9bb073a50b8c14,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,kirkstone,5a6f7925bd2b885955c942573f70a5594f231563,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,https://git.yoctoproject.org/meta-ti,kirkstone,09.02.00.010,layers=meta-ti-extras:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,kirkstone,260e3adc2bf322f52d81c0642c825088a88bb051,layers=meta-arm:meta-arm-toolchain
+meta-clang,https://github.com/kraj/meta-clang,kirkstone-clang12,c2e89dc7e1dfcc1bbe432afca2dc43d6560cb007,layers=
+oe-core,https://git.openembedded.org/openembedded-core,kirkstone,8a502301209ef144932ef5071c1a9b738db23270,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+meta-edgeai,https://git.ti.com/git/edgeai/meta-edgeai.git,kirkstone,fdb683aa69d4d70aca17c2d53be3f900ae9d5e72,layers=
+OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
+BITBAKE_INCLUSIVE_VARS=yes
-- 
2.34.1


