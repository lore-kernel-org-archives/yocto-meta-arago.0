Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80A74C54E67
	for <webhook@archiver.kernel.org>; Wed, 27 Mar 2024 10:02:25 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.33506.1711533737986141483
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 27 Mar 2024 03:02:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=HBV5utvJ;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: c-shilwant@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42RA2H8K129093
	for <meta-arago@lists.yoctoproject.org>; Wed, 27 Mar 2024 05:02:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1711533737;
	bh=G50KvgbkDwINLhMk6O+wWgoW1xiNxpMCYHP3XUss0V0=;
	h=From:To:CC:Subject:Date;
	b=HBV5utvJst+2eZ18vpOMZP2ssst2Rp1+r2LYYudtYN/Zr5z9MP+TEKJPCNWlAUIZi
	 1DAO+5QhL5xf9ze/uqsL42DDXGTBNyYBcjfd60pet+49Egj6mZmOGQZcUzq4qFDVIX
	 pwBU4ANTuLZKN1ABLHb6yIJJJUKj4sRE24ZrisWc=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42RA2HfJ119836
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 27 Mar 2024 05:02:17 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 27
 Mar 2024 05:02:16 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 27 Mar 2024 05:02:16 -0500
Received: from localhost (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 42RA2G4v111507;
	Wed, 27 Mar 2024 05:02:16 -0500
From: Chirag Shilwant <c-shilwant@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Khasim <khasim@ti.com>,
        Ryan Eatmon
	<reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: Sai Sree Kartheek Adivi <s-adivi@ti.com>, Paresh Bhagat <p-bhagat@ti.com>,
        Gyan Gupta <g-gupta@ti.com>
Subject: [meta-arago][oe-layersetup][PATCH] configs: processor-sdk: Add new config for 9.2 SDK Release
Date: Wed, 27 Mar 2024 15:31:58 +0530
Message-ID: <20240327100158.1273082-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 27 Mar 2024 10:02:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15250

- Add processor-sdk-kirkstone-09.02.01.09-config.txt used for
building AM62SIP & AM64x.

- Add processor-sdk-kirkstone-chromium-09.02.01.09-config.txt used
for building AM62P, AM62x & AM62LP.

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 ...cessor-sdk-kirkstone-09.02.01.09-config.txt | 17 +++++++++++++++++
 ...k-kirkstone-chromium-09.02.01.09-config.txt | 18 ++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 configs/processor-sdk/processor-sdk-kirkstone-09.02.01.09-config.txt
 create mode 100644 configs/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.09-config.txt

diff --git a/configs/processor-sdk/processor-sdk-kirkstone-09.02.01.09-config.txt b/configs/processor-sdk/processor-sdk-kirkstone-09.02.01.09-config.txt
new file mode 100644
index 0000000..6ad6324
--- /dev/null
+++ b/configs/processor-sdk/processor-sdk-kirkstone-09.02.01.09-config.txt
@@ -0,0 +1,17 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,https://git.openembedded.org/bitbake,2.0,40fd5f4eef7460ca67f32cfce8e229e67e1ff607
+meta-tisdk,https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git,kirkstone,09.02.01.09,layers=
+meta-arago,https://git.yoctoproject.org/meta-arago,kirkstone,09.02.00.009,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,kirkstone,fe0bf7f0e5408aac6cc89ff3b19b1b1941df4f64,layers=
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,kirkstone,cb2bc17e96552cdfc141d27bd9f4dbd95a872846,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,kirkstone,fda737ec0cc1d2a5217548a560074a8e4d5ec580,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,https://git.yoctoproject.org/meta-ti,kirkstone,09.02.00.009,layers=meta-ti-extras:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,kirkstone,b187fb9232ca0a6b5f8f90b4715958546fc41d73,layers=meta-arm:meta-arm-toolchain
+meta-clang,https://github.com/kraj/meta-clang,kirkstone-clang12,c2e89dc7e1dfcc1bbe432afca2dc43d6560cb007,layers=
+oe-core,https://git.openembedded.org/openembedded-core,kirkstone,2501534c9581c6c3439f525d630be11554a57d24,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+meta-edgeai,https://git.ti.com/git/edgeai/meta-edgeai.git,kirkstone,09.02.00.03,layers=
+OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
+BITBAKE_INCLUSIVE_VARS=yes
diff --git a/configs/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.09-config.txt b/configs/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.09-config.txt
new file mode 100644
index 0000000..0ac1e7f
--- /dev/null
+++ b/configs/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.09-config.txt
@@ -0,0 +1,18 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,https://git.openembedded.org/bitbake,2.0,40fd5f4eef7460ca67f32cfce8e229e67e1ff607
+meta-tisdk,https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git,kirkstone,09.02.01.09,layers=
+meta-arago,https://git.yoctoproject.org/meta-arago,kirkstone,09.02.00.009,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
+meta-browser,https://github.com/OSSystems/meta-browser.git,master,d3d16b47e17dc899e5298cff698dc32e5e639ab4,layers=meta-chromium
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,kirkstone,fe0bf7f0e5408aac6cc89ff3b19b1b1941df4f64,layers=
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,kirkstone,cb2bc17e96552cdfc141d27bd9f4dbd95a872846,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,kirkstone,fda737ec0cc1d2a5217548a560074a8e4d5ec580,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,https://git.yoctoproject.org/meta-ti,kirkstone,09.02.00.009,layers=meta-ti-extras:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,kirkstone,b187fb9232ca0a6b5f8f90b4715958546fc41d73,layers=meta-arm:meta-arm-toolchain
+meta-clang,https://github.com/kraj/meta-clang,kirkstone-clang12,c2e89dc7e1dfcc1bbe432afca2dc43d6560cb007,layers=
+oe-core,https://git.openembedded.org/openembedded-core,kirkstone,2501534c9581c6c3439f525d630be11554a57d24,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+meta-edgeai,https://git.ti.com/git/edgeai/meta-edgeai.git,kirkstone,09.02.00.03,layers=
+OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
+BITBAKE_INCLUSIVE_VARS=yes
-- 
2.34.1


