Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2486C54EBC
	for <webhook@archiver.kernel.org>; Tue, 10 Jan 2023 10:28:34 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.100845.1673346513734328014
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 10 Jan 2023 02:28:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=MgBwvNVN;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: a-limaye@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30AASWJ4015792
	for <meta-arago@lists.yoctoproject.org>; Tue, 10 Jan 2023 04:28:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1673346513;
	bh=fdv2YYyBK6L4itcZn3Ouy45Ty98+U0XqBQk+9UykseQ=;
	h=From:To:CC:Subject:Date;
	b=MgBwvNVNu+1ZNmdExGo3LPTJA4CBahOKOMnQDSenT/3SBxYk9K5lDhWVxAwyo1C0a
	 ARzggdPArKzBoF5M6jp5S5gMn9jIUrOP0ufP3X+YeWSD0bePoNgcAK22B/CJMrL9CX
	 ddThqNsQT1Q09vnWZcyf5OSXMDGzgd9Hgigjn1ms=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30AASWie115797
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Tue, 10 Jan 2023 04:28:32 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 10
 Jan 2023 04:28:32 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 10 Jan 2023 04:28:32 -0600
Received: from edgeaipc1 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30AASVfB098758;
	Tue, 10 Jan 2023 04:28:32 -0600
Received: from a0485100 by edgeaipc1 with local (Exim 4.90_1)
	(envelope-from <a-limaye@ti.com>)
	id 1pFBrp-0002EF-JD; Tue, 10 Jan 2023 15:58:29 +0530
From: <a-limaye@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <l-weaver@ti.com>, <yogeshs@ti.com>, <praneeth@ti.com>, <a-limaye@ti.com>,
        <reatmon@ti.com>
Subject: [meta-arago][oe-layersetup][PATCH] processor-sdk-linux: Add 08.05.00 release config
Date: Tue, 10 Jan 2023 15:58:21 +0530
Message-ID: <20230110102821.8208-1-a-limaye@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 10 Jan 2023 10:28:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14164

From: Aniket Limaye <a-limaye@ti.com>

Add config file for processor-sdk-linux 08.05.00 release

Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
 .../processor-sdk-linux-08_05_00.txt          | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 configs/processor-sdk-linux/processor-sdk-linux-08_05_00.txt

diff --git a/configs/processor-sdk-linux/processor-sdk-linux-08_05_00.txt b/configs/processor-sdk-linux/processor-sdk-linux-08_05_00.txt
new file mode 100644
index 0000000..8e99803
--- /dev/null
+++ b/configs/processor-sdk-linux/processor-sdk-linux-08_05_00.txt
@@ -0,0 +1,22 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,https://git.openembedded.org/bitbake,1.46,e3db9c2e9eded3c5cb6040714a6054b44f6b3880
+meta-arago,git://git.yoctoproject.org/meta-arago,dunfell,08.05.00.005,layers=meta-arago-distro:meta-arago-extras
+meta-psdkla,git://git.ti.com/jacinto-linux/meta-psdkla.git,master,06a6260f965ad7765581878c52b0bed894103847,layers=
+#meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
+#meta-python2,git://git.openembedded.org/meta-python2,dunfell,HEAD,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,5ef3a0ffd3324937252790266e2b2e64d33ef34f,layers=
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,dunfell,beea119eb529b4a11f266004aee8b548427aea39,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,dunfell,7203130ed8b58c0df75cb72222ac2bcf546bce44,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,08.05.00.005,layers=
+meta-arm,https://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,dunfell,1ee082e979baaba871bbe1d91181bb04951faf3b,layers=meta
+meta-aws,https://github.com/aws/meta-aws.git,dunfell,49e7a5ffb8799b9eee638a6a5425a13b00c33215,layers=
+meta-jupyter,https://github.com/Xilinx/meta-jupyter.git,master,82db248e2eca36e52cbeafe599b755dc87720383,layers=
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+# if meta-browser/5f365ef0f842ba4651efe88787cf9c63bc8b6cb3 above is enabled,
+# use below for OECORELAYERCONF to mark it compatible with dunfell
+#OECORELAYERCONF=./sample-files/bblayers-dunfell-browser.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64.conf.sample
+BITBAKE_INCLUSIVE_VARS=no
\ No newline at end of file
-- 
2.17.1


