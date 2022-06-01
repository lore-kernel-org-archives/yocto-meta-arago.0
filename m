Return-Path: <s-adivi@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC814C433EF
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 05:34:53 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web08.3979.1654061681403646150
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 31 May 2022 22:34:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Pqe+pUiw;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: s-adivi@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2515Yd1u019354
	for <meta-arago@lists.yoctoproject.org>; Wed, 1 Jun 2022 00:34:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1654061679;
	bh=VsEDqLNSUtXHTAnllRcGI6yQqlGdksGQNJxQP7LMPIg=;
	h=From:To:CC:Subject:Date;
	b=Pqe+pUiwbpyUh3iwqMpRmX/dZwcOZGDPXgSM0RIakP4ct3HQ+A099my/kzjLhqIBd
	 KtZvizmz5TMK3FYDI5tPMbX1xmcVkkU+fKJPBckaKZws7OC2p+PDCvpa92SEEA4oOC
	 OoZAJAR4eNT0/wfgftTmUGADbyCphrwhTRy3LIFA=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2515YdGB099738
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 1 Jun 2022 00:34:39 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 1
 Jun 2022 00:34:39 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 1 Jun 2022 00:34:39 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2515Ycap029587;
	Wed, 1 Jun 2022 00:34:39 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>
CC: <khasim@ti.com>, <nsekhar@ti.com>, <devarsht@ti.com>, <vigneshr@ti.com>,
        Ryan Eatmon <reatmon@ti.com>, <a-m1@ti.com>, <dannenberg@ti.com>,
        <s-adivi@ti.com>
Subject: [meta-arago][oe-layersetup][master][PATCH] configs: processor-sdk:
 add config for 08.03.00.19
Date: Wed, 1 Jun 2022 11:04:38 +0530
Message-ID: <20220601053438.14521-1-s-adivi@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 01 Jun 2022 05:34:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13884

Add AM62x Processor SDK Config for 08.03.00.19 release

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 .../processor-sdk-08.03.00.19-config.txt          | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 configs/processor-sdk/processor-sdk-08.03.00.19-config.txt

diff --git a/configs/processor-sdk/processor-sdk-08.03.00.19-config.txt b/configs/processor-sdk/processor-sdk-08.03.00.19-config.txt
new file mode 100644
index 0000000..82f1410
--- /dev/null
+++ b/configs/processor-sdk/processor-sdk-08.03.00.19-config.txt
@@ -0,0 +1,15 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,git://git.openembedded.org/bitbake,1.46,0784db7
+meta-processor-sdk,git://git.ti.com/processor-sdk/meta-processor-sdk.git,dunfell,b39d454b1622e53a23a08c5470ba6de2162264df,layers=
+meta-arago,git://git.yoctoproject.org/meta-arago,dunfell,08.03.00.005,layers=meta-arago-distro:meta-arago-extras
+# meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,5ef3a0f,layers=
+meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,f6b88c1,layers=
+meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,8ff12bf,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,08.03.00.005,layers=
+meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
+oe-core,git://git.openembedded.org/openembedded-core,dunfell,48ce924,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64.conf.sample
-- 
2.17.1


