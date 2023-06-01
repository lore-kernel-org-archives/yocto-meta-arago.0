Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E49AC77B7A
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 14:28:01 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.33209.1685629679843785727
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 01 Jun 2023 07:28:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=A/vhk1Y2;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: a-limaye@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 351ERwjv036145
	for <meta-arago@lists.yoctoproject.org>; Thu, 1 Jun 2023 09:27:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1685629678;
	bh=HBxIaVkujPVxkOmJjSPaMD0Jf7MBizJxqchTB6w1wnE=;
	h=From:To:CC:Subject:Date;
	b=A/vhk1Y2ESxXm7SqY3pNu2lghKvpAqB6jd/xOjXQQKd78fV6FnMFzRdbYgFHCiaQ5
	 Czq2fvOVXcd3JDmNmbMcuo0kZRYfQg+l9aGCbKpUry6ViLUgrUrUW8aniC+AwjQ0kZ
	 fHJLbx5aMzzGXq76qpH5EXER4w/OxnVFO/u5TVHg=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 351ERwMu010092
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Thu, 1 Jun 2023 09:27:58 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 1
 Jun 2023 09:27:58 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 1 Jun 2023 09:27:58 -0500
Received: from PSDKL-Workstation0.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 351ERuWt089169;
	Thu, 1 Jun 2023 09:27:56 -0500
From: <a-limaye@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <l-weaver@ti.com>, <a-limaye@ti.com>, <reatmon@ti.com>
Subject: [meta-arago][oe-layersetup][PATCH] processor-sdk-linux: Add 08.06.01 release config
Date: Thu, 1 Jun 2023 19:57:44 +0530
Message-ID: <20230601142744.3618386-1-a-limaye@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 01 Jun 2023 14:28:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14485

From: Aniket Limaye <a-limaye@ti.com>

Add config file for processor-sdk-linux 08.06.01.02 release

Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
 .../processor-sdk-linux-08_06_01.txt          | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 configs/processor-sdk-linux/processor-sdk-linux-08_06_01.txt

diff --git a/configs/processor-sdk-linux/processor-sdk-linux-08_06_01.txt b/configs/processor-sdk-linux/processor-sdk-linux-08_06_01.txt
new file mode 100644
index 0000000..8a49bfb
--- /dev/null
+++ b/configs/processor-sdk-linux/processor-sdk-linux-08_06_01.txt
@@ -0,0 +1,22 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,https://git.openembedded.org/bitbake,1.46,c527976e28165de9606497c48d834872fe68372e
+meta-arago,https://git.yoctoproject.org/meta-arago,dunfell,08.06.00.006,layers=meta-arago-distro:meta-arago-extras
+meta-psdkla,https://git.ti.com/git/jacinto-linux/meta-psdkla.git,master,REL.PSDK.JACINTO.08.06.01.02,layers=
+# meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
+# meta-python2,git://git.openembedded.org/meta-python2,dunfell,HEAD,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,5ef3a0ffd3324937252790266e2b2e64d33ef34f,layers=
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,dunfell,beea119eb529b4a11f266004aee8b548427aea39,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,dunfell,e707e9b7cf5c62bff4fee029965a87b22dd4ccba,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,https://git.yoctoproject.org/meta-ti,dunfell,08.06.00.006,layers=
+meta-arm,https://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,dunfell,daaee6fcb0d201f041678af433d8e1cd6f924d09,layers=meta
+meta-aws,https://github.com/aws/meta-aws.git,dunfell,64455aec341f8bef4d29dbc6638b2e44db36e38d,layers=
+meta-jupyter,https://github.com/Xilinx/meta-jupyter.git,master,82db248e2eca36e52cbeafe599b755dc87720383,layers=
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+# if meta-browser/5f365ef0f842ba4651efe88787cf9c63bc8b6cb3 above is enabled,
+# use below for OECORELAYERCONF to mark it compatible with dunfell
+#OECORELAYERCONF=./sample-files/bblayers-dunfell-browser.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64.conf.sample
+BITBAKE_INCLUSIVE_VARS=no
-- 
2.34.1


