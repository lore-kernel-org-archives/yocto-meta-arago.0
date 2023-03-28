Return-Path: <s-adivi@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08AF6C6FD1D
	for <webhook@archiver.kernel.org>; Tue, 28 Mar 2023 01:01:43 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.55492.1679965294026924864
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 27 Mar 2023 18:01:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=xRm9ST09;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: s-adivi@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 32S11QH0106575;
	Mon, 27 Mar 2023 20:01:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1679965286;
	bh=INNTP2CByUQ0XxmVfdC3qaLJQs8W/bHRnaDf1EJxg2k=;
	h=From:To:CC:Subject:Date;
	b=xRm9ST093Gb+D8ixVfE2zWkPTKAOapcXL7gX1geh+6M3KdvJMREUwhWlC5gOfDMVn
	 wMcsOeYx6CkWOKUy8P46Ou/l+HlSmcRXBnDgARgtVVKrV4FUGObjAb8TYJJxSrvj/6
	 VMk9LN18DdWnQaAWLQsm+PdLEjjx+aXn84KspIao=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 32S11QXu015061
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 27 Mar 2023 20:01:26 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 27
 Mar 2023 20:01:25 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 27 Mar 2023 20:01:26 -0500
Received: from SHIELD01.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 32S11NFZ009259;
	Mon, 27 Mar 2023 20:01:24 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>, <denis@denix.org>,
        <reatmon@ti.com>
CC: <g-gupta@ti.com>, <c-shilwant@ti.com>, <khasim@ti.com>, <p-bhagat@ti.com>
Subject: [oe-layersetup][master][PATCH] configs: Add new oeconfig file for AM65x 08.06 Release
Date: Tue, 28 Mar 2023 06:31:18 +0530
Message-ID: <20230328010118.3930255-1-s-adivi@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 28 Mar 2023 01:01:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14281

Add new oeconfig file processor-sdk-08.06.00-am65xx-config.txt for
am65xx-evm and am65xx-hs-evm

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 .../processor-sdk-08.06.00-am65xx-config.txt     | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 configs/processor-sdk/processor-sdk-08.06.00-am65xx-config.txt

diff --git a/configs/processor-sdk/processor-sdk-08.06.00-am65xx-config.txt b/configs/processor-sdk/processor-sdk-08.06.00-am65xx-config.txt
new file mode 100644
index 0000000..ef7287f
--- /dev/null
+++ b/configs/processor-sdk/processor-sdk-08.06.00-am65xx-config.txt
@@ -0,0 +1,16 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,https://git.openembedded.org/bitbake,1.46,0784db7
+meta-processor-sdk,https://git.ti.com/cgit/processor-sdk/meta-processor-sdk,dunfell,01876dc32daf5a31a643d26f7935d6cd35187d08,layers=
+meta-arago,https://git.yoctoproject.org/meta-arago,dunfell,cicd.dunfell.202303090400,layers=meta-arago-distro:meta-arago-extras
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,5ef3a0f,layers=
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,dunfell,beea119eb529b4a11f266004aee8b548427aea39,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,dunfell,87571345059f82fb7599e3aa82e6fdcfbd361098,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
+meta-ti,https://git.yoctoproject.org/meta-ti,dunfell,cicd.dunfell.202303090400,layers=
+meta-arm,https://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,dunfell,efb1a73a13907bed3acac8e06053aef3e2ef57f5,layers=meta
+meta-sysrepo,https://github.com/sartura/meta-sysrepo.git,master,8bcc6151897c0e67c2931c78340477bf3a12d8cb,layers=
+meta-jupyter,https://github.com/Xilinx/meta-jupyter.git,master,82db248e2eca36e52cbeafe599b755dc87720383,layers=
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64.conf.sample
-- 
2.34.1


