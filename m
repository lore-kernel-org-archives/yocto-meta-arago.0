Return-Path: <s-adivi@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65634C64ED6
	for <webhook@archiver.kernel.org>; Sun, 26 Feb 2023 12:50:45 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.64656.1677415835203807071
 for <meta-arago@lists.yoctoproject.org>;
 Sun, 26 Feb 2023 04:50:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=AorlArIQ;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: s-adivi@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 31QCoTDb002873;
	Sun, 26 Feb 2023 06:50:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1677415829;
	bh=l1b36WC3hpNcGpGfMvjslBOTXGU5GkU+yCi8G1+4VpU=;
	h=From:To:CC:Subject:Date;
	b=AorlArIQ/rLTYS1LYo0WO2VU70xbll47BHKdfxuXMyje5DQG6vFUsHw6oplIhNAmQ
	 NcXfldVsGfvmLjL9sPHHZZT2lfgFSAsfW2ReM5odV+NLrvEdzk6rbPswNgG+vOmVO/
	 nGCvNczaaNmySLfJvBnf3ANpIQ7V6oD3kcsrt3CU=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 31QCoTPc130408
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 26 Feb 2023 06:50:29 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Sun, 26
 Feb 2023 06:50:29 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Sun, 26 Feb 2023 06:50:28 -0600
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 31QCoS2X074460;
	Sun, 26 Feb 2023 06:50:28 -0600
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>, <denis@denix.org>,
        <reatmon@ti.com>
CC: <g-gupta@ti.com>, <c-shilwant@ti.com>, <khasim@ti.com>, <p-bhagat@ti.com>
Subject: [oe-layersetup][master][PATCH] configs: processor-sdk: add processor-sdk-08.06.00-config.txt
Date: Sun, 26 Feb 2023 18:20:26 +0530
Message-ID: <20230226125026.2234000-1-s-adivi@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sun, 26 Feb 2023 12:50:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14235

- Add processor-sdk-08.06.00-config.txt for AM62A, AM62x, AM62Q & AM64x

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 .../processor-sdk-08.06.00-config.txt            | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 configs/processor-sdk/processor-sdk-08.06.00-config.txt

diff --git a/configs/processor-sdk/processor-sdk-08.06.00-config.txt b/configs/processor-sdk/processor-sdk-08.06.00-config.txt
new file mode 100644
index 0000000..5c08730
--- /dev/null
+++ b/configs/processor-sdk/processor-sdk-08.06.00-config.txt
@@ -0,0 +1,16 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,https://git.openembedded.org/bitbake,1.46,0784db7
+meta-processor-sdk,https://git.ti.com/cgit/processor-sdk/meta-processor-sdk,dunfell,08.06.00,layers=
+meta-arago,https://git.yoctoproject.org/meta-arago,dunfell,08.06.00.007,layers=meta-arago-distro:meta-arago-extras
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,5ef3a0f,layers=
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,dunfell,beea119eb529b4a11f266004aee8b548427aea39,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,dunfell,87571345059f82fb7599e3aa82e6fdcfbd361098,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
+meta-ti,https://git.yoctoproject.org/meta-ti,dunfell,08.06.00.007,layers=
+meta-arm,https://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,dunfell,daaee6fcb0d201f041678af433d8e1cd6f924d09,layers=meta
+meta-sysrepo,https://github.com/sartura/meta-sysrepo.git,master,8bcc6151897c0e67c2931c78340477bf3a12d8cb,layers=
+meta-jupyter,https://github.com/Xilinx/meta-jupyter.git,master,82db248e2eca36e52cbeafe599b755dc87720383,layers=
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64.conf.sample
-- 
2.34.1


