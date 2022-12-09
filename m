Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE3C5C4332F
	for <webhook@archiver.kernel.org>; Fri,  9 Dec 2022 13:40:13 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.1283.1670593213164317882
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 09 Dec 2022 05:40:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=p16X3Qa2;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: p-bhagat@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2B9DeCnU048114
	for <meta-arago@lists.yoctoproject.org>; Fri, 9 Dec 2022 07:40:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1670593212;
	bh=rhzw/9tsjIb3wxHICY1S1DN1kS6yG2j/7mV4wwza3pw=;
	h=From:To:CC:Subject:Date;
	b=p16X3Qa29f83yrA7LZLlvmzV/mcJyrg1lQlY9w/VuUWLdx/V6DciuqwGKHZaqsk61
	 bsrviYoyWnPle9omW9RxyW5WcO7/52HGjLzVxIWkLcaTJGm8ol+EfS2D85PfVdAgm9
	 tCk0z+hWotSJVnNyA1VUbeQIAgFThJdKXS12qPnM=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2B9DeCj8025647
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Fri, 9 Dec 2022 07:40:12 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 9
 Dec 2022 07:40:11 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 9 Dec 2022 07:40:11 -0600
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2B9DeBv4045034;
	Fri, 9 Dec 2022 07:40:11 -0600
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>, <reatmon@ti.com>
CC: <c-shilwant@ti.com>, <s-adivi@ti.com>, <g-gupta@ti.com>
Subject: [oe-layersetup][master][PATCH] configs: processor-sdk: add config for 08.05.00.13 and 08.05.00.14
Date: Fri, 9 Dec 2022 19:09:55 +0530
Message-ID: <20221209133955.21000-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 09 Dec 2022 13:40:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14132

- Add AM64x Processor SDK Config for 08.05.00.13 release
- Add AM62x Processor SDK Config for 08.05.00.14 release

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 .../processor-sdk-08.05.00.13-config.txt          | 15 +++++++++++++++
 .../processor-sdk-08.05.00.14-config.txt          | 15 +++++++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 configs/processor-sdk/processor-sdk-08.05.00.13-config.txt
 create mode 100644 configs/processor-sdk/processor-sdk-08.05.00.14-config.txt

diff --git a/configs/processor-sdk/processor-sdk-08.05.00.13-config.txt b/configs/processor-sdk/processor-sdk-08.05.00.13-config.txt
new file mode 100644
index 0000000..cdd31cd
--- /dev/null
+++ b/configs/processor-sdk/processor-sdk-08.05.00.13-config.txt
@@ -0,0 +1,15 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,https://git.openembedded.org/bitbake,1.46,0784db7
+meta-processor-sdk,https://git.ti.com/cgit/processor-sdk/meta-processor-sdk,dunfell,702abbc518cad8412f9451adf25a2ca8edb24726,layers=
+meta-arago,https://git.yoctoproject.org/meta-arago,dunfell,08.05.00.007,layers=meta-arago-distro:meta-arago-extras
+# meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,5ef3a0f,layers=
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,dunfell,beea119eb529b4a11f266004aee8b548427aea39,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,dunfell,7203130ed8b58c0df75cb72222ac2bcf546bce44,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
+meta-ti,https://git.yoctoproject.org/meta-ti,dunfell,08.05.00.007,layers=
+meta-arm,https://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,dunfell,408bf1b4bb4f4ed126c17fb3676f9fa0513065ba,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64.conf.sample
diff --git a/configs/processor-sdk/processor-sdk-08.05.00.14-config.txt b/configs/processor-sdk/processor-sdk-08.05.00.14-config.txt
new file mode 100644
index 0000000..f852396
--- /dev/null
+++ b/configs/processor-sdk/processor-sdk-08.05.00.14-config.txt
@@ -0,0 +1,15 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,https://git.openembedded.org/bitbake,1.46,0784db7
+meta-processor-sdk,https://git.ti.com/cgit/processor-sdk/meta-processor-sdk,dunfell,8d8d2240ac45f964575ae7fe4af09bf4d2efcfaf,layers=
+meta-arago,https://git.yoctoproject.org/meta-arago,dunfell,08.05.00.007,layers=meta-arago-distro:meta-arago-extras
+# meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,5ef3a0f,layers=
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,dunfell,beea119eb529b4a11f266004aee8b548427aea39,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,dunfell,7203130ed8b58c0df75cb72222ac2bcf546bce44,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
+meta-ti,https://git.yoctoproject.org/meta-ti,dunfell,08.05.00.007,layers=
+meta-arm,https://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,dunfell,408bf1b4bb4f4ed126c17fb3676f9fa0513065ba,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64.conf.sample
-- 
2.17.1


