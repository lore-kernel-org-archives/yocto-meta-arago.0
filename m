Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EFF2CD1283
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 07:09:00 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.32410.1711955337925425990
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 01 Apr 2024 00:08:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=R8TXbMeu;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: a-limaye@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43178vh8039415
	for <meta-arago@lists.yoctoproject.org>; Mon, 1 Apr 2024 02:08:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1711955337;
	bh=8cS0U6uyYizgILgi6yus8MxLHmlvpNjccDwRJemo9Rg=;
	h=From:To:CC:Subject:Date;
	b=R8TXbMeubxMaZUqI2NVouhVWbIDzbKhqJEZ6ynczzeiCCKH5iIj9jAtXxQ1IhhJ2k
	 L1xjhc/sXgcFpoWNcBWShtC4+aaeOrz/KnblHTLW/nPRBu5KA8YGcqS6KwjGsDU9Zn
	 Yr+e8Nu9ngBrL6491WtP8u7Xz1gXYuzrnfVSSiHg=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43178vv1046277
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Mon, 1 Apr 2024 02:08:57 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 1
 Apr 2024 02:08:56 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 1 Apr 2024 02:08:56 -0500
Received: from PSDKL-Workstation0.dhcp.ti.com (psdkl-workstation0.dhcp.ti.com [172.24.227.91])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 43178tL5040508;
	Mon, 1 Apr 2024 02:08:55 -0500
From: Aniket Limaye <a-limaye@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, Aniket Limaye <a-limaye@ti.com>
Subject: [meta-arago][oe-layersetup][PATCH] configs: processor-sdk-linux: Adding 9.2 configs for AM67/AM68/AM69
Date: Mon, 1 Apr 2024 12:38:50 +0530
Message-ID: <20240401070850.2204425-1-a-limaye@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 01 Apr 2024 07:09:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15254

AM67/AM68: processor-sdk-linux-09_02_00_04.txt
AM69: processor-sdk-linux-09_02_00_05.txt

Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
 .../processor-sdk-linux-09_02_00_04.txt       | 20 +++++++++++++++++++
 .../processor-sdk-linux-09_02_00_05.txt       | 20 +++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 configs/processor-sdk-linux/processor-sdk-linux-09_02_00_04.txt
 create mode 100644 configs/processor-sdk-linux/processor-sdk-linux-09_02_00_05.txt

diff --git a/configs/processor-sdk-linux/processor-sdk-linux-09_02_00_04.txt b/configs/processor-sdk-linux/processor-sdk-linux-09_02_00_04.txt
new file mode 100644
index 0000000..14f5872
--- /dev/null
+++ b/configs/processor-sdk-linux/processor-sdk-linux-09_02_00_04.txt
@@ -0,0 +1,20 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,https://git.openembedded.org/bitbake,2.0,40fd5f4eef7460ca67f32cfce8e229e67e1ff607
+meta-arago,https://git.yoctoproject.org/meta-arago,kirkstone,d38c98d22ad3f3b29f9cce402202cd95214c58cc,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
+meta-browser,https://github.com/OSSystems/meta-browser.git,master,d3d16b47e17dc899e5298cff698dc32e5e639ab4,layers=meta-chromium
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,kirkstone,fe0bf7f0e5408aac6cc89ff3b19b1b1941df4f64,layers=
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,kirkstone,7902664f89678164b7fc90d421cee74cbec51cdf,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,kirkstone,fda737ec0cc1d2a5217548a560074a8e4d5ec580,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,https://git.yoctoproject.org/meta-ti,kirkstone,2f3de17c1e623d276811d13d3eb11e5734566acd,layers=meta-ti-extras:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,kirkstone,b187fb9232ca0a6b5f8f90b4715958546fc41d73,layers=meta-arm:meta-arm-toolchain
+meta-clang,https://github.com/kraj/meta-clang,kirkstone-clang12,c2e89dc7e1dfcc1bbe432afca2dc43d6560cb007,layers=
+oe-core,https://git.openembedded.org/openembedded-core,kirkstone,2501534c9581c6c3439f525d630be11554a57d24,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
+BITBAKE_INCLUSIVE_VARS=yes
+meta-tisdk,https://git.ti.com/cgit/ti-sdk-linux/meta-tisdk,kirkstone,REL.J7.09.02.00.04,layers=
+LOCALCONF:DISTRO_FEATURES:append = " virtualization"
+LOCALCONF:ARAGO_BRAND = "foundational_sdk"
+
diff --git a/configs/processor-sdk-linux/processor-sdk-linux-09_02_00_05.txt b/configs/processor-sdk-linux/processor-sdk-linux-09_02_00_05.txt
new file mode 100644
index 0000000..e8fe408
--- /dev/null
+++ b/configs/processor-sdk-linux/processor-sdk-linux-09_02_00_05.txt
@@ -0,0 +1,20 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,https://git.openembedded.org/bitbake,2.0,40fd5f4eef7460ca67f32cfce8e229e67e1ff607
+meta-arago,https://git.yoctoproject.org/meta-arago,kirkstone,98f178314931635c8641d1394dfd4341b86b6be2,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
+meta-browser,https://github.com/OSSystems/meta-browser.git,master,d3d16b47e17dc899e5298cff698dc32e5e639ab4,layers=meta-chromium
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,kirkstone,fe0bf7f0e5408aac6cc89ff3b19b1b1941df4f64,layers=
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,kirkstone,cb2bc17e96552cdfc141d27bd9f4dbd95a872846,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,kirkstone,fda737ec0cc1d2a5217548a560074a8e4d5ec580,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,https://git.yoctoproject.org/meta-ti,kirkstone,376a2143533c6497b4e79304eccca2a630784436,layers=meta-ti-extras:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,kirkstone,b187fb9232ca0a6b5f8f90b4715958546fc41d73,layers=meta-arm:meta-arm-toolchain
+meta-clang,https://github.com/kraj/meta-clang,kirkstone-clang12,c2e89dc7e1dfcc1bbe432afca2dc43d6560cb007,layers=
+oe-core,https://git.openembedded.org/openembedded-core,kirkstone,2501534c9581c6c3439f525d630be11554a57d24,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
+BITBAKE_INCLUSIVE_VARS=yes
+meta-tisdk,https://git.ti.com/cgit/ti-sdk-linux/meta-tisdk,kirkstone,REL.J7.09.02.00.05,layers=
+LOCALCONF:DISTRO_FEATURES:append = " virtualization"
+LOCALCONF:ARAGO_BRAND = "foundational_sdk"
+
-- 
2.34.1


