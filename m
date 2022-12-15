Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D8B3C4332F
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 06:50:10 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.127917.1671087009205975535
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 14 Dec 2022 22:50:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ROocz9/V;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: p-bhagat@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2BF6o8Gs130859
	for <meta-arago@lists.yoctoproject.org>; Thu, 15 Dec 2022 00:50:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1671087008;
	bh=7+fIcEFVTc4zzLJSKrHt21ON/F2tVWJFVfneD4Qb1NM=;
	h=From:To:CC:Subject:Date;
	b=ROocz9/V7HmiX/6DkVO6tfPbDsZ1xm0sisfvhjAh476qVSVE3q9SbtaYDBY5ROKHz
	 WgvnnCZ0Gm87b+A3vGK3QWJvix1XWciUDA5wsd1c/IDRiXA7+KFs/hc+fRgCJZtfHz
	 HYWjdo+zs2vgsogZZlhi4Wmd2WWanPOvUanuLDEk=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2BF6o8CZ125190
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Thu, 15 Dec 2022 00:50:08 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Thu, 15
 Dec 2022 00:50:07 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Thu, 15 Dec 2022 00:50:08 -0600
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2BF6o72Y128429;
	Thu, 15 Dec 2022 00:50:07 -0600
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>, <reatmon@ti.com>
CC: <c-shilwant@ti.com>, <s-adivi@ti.com>, <g-gupta@ti.com>
Subject: [oe-layersetup][master][PATCH] configs: processor-sdk: add config for 8.05 release
Date: Thu, 15 Dec 2022 12:19:35 +0530
Message-ID: <20221215064935.21681-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 15 Dec 2022 06:50:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14134

Add config file (version-08.05.00.21) for 8.05 relase for AM64X and AM62X

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 .../processor-sdk-08.05.00.21-config.txt          | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 configs/processor-sdk/processor-sdk-08.05.00.21-config.txt

diff --git a/configs/processor-sdk/processor-sdk-08.05.00.21-config.txt b/configs/processor-sdk/processor-sdk-08.05.00.21-config.txt
new file mode 100644
index 0000000..6cc05ff
--- /dev/null
+++ b/configs/processor-sdk/processor-sdk-08.05.00.21-config.txt
@@ -0,0 +1,15 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,https://git.openembedded.org/bitbake,1.46,0784db7
+meta-processor-sdk,https://git.ti.com/cgit/processor-sdk/meta-processor-sdk,dunfell,4d3a4e5f476b257405946c5aa222c02fc7565cfb,layers=
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


