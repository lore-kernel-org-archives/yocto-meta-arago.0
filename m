Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EDDEC433EF
	for <webhook@archiver.kernel.org>; Tue, 28 Jun 2022 16:04:48 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web12.113.1656432283340314224
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 28 Jun 2022 09:04:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Z0ZaaPX8;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: a-limaye@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 25SG4glR054899
	for <meta-arago@lists.yoctoproject.org>; Tue, 28 Jun 2022 11:04:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1656432282;
	bh=KI8sO2iNt9wCmj+pLNGkcBpSIlMnW0ir/Mldu6SWyoo=;
	h=From:To:CC:Subject:Date;
	b=Z0ZaaPX85x3Dn5RKp1z77s4730QdAPZI2hSwHqOqZ/VSq4xJ9Xu2Fv5ZDACSZ+7Yl
	 7derSNepBx3/KKxsW/R7BuGVCKP5p784wg/mzeXyTv8EViEsavLYbimVSNxmqSzeQU
	 747ArYFrHVzxcZ32+pQpTu+2JNtgi+MtBUFYAQJo=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 25SG4g1n004201
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Tue, 28 Jun 2022 11:04:42 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 28
 Jun 2022 11:04:42 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 28 Jun 2022 11:04:42 -0500
Received: from edgeaipc1 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 25SG4fGH098619;
	Tue, 28 Jun 2022 11:04:41 -0500
Received: from a0485100 by edgeaipc1 with local (Exim 4.90_1)
	(envelope-from <a-limaye@ti.com>)
	id 1o6Dhg-00065S-1C; Tue, 28 Jun 2022 21:34:40 +0530
From: <a-limaye@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <l-weaver@ti.com>, <yogeshs@ti.com>, <praneeth@ti.com>, <a-limaye@ti.com>,
        <reatmon@ti.com>, Sinthu Raja <sinthu.raja@ti.com>
Subject: [meta-arago][oe-layersetup][PATCH] processor-sdk-linux: Add
 08.02.01.00 release config
Date: Tue, 28 Jun 2022 21:34:13 +0530
Message-ID: <20220628160413.22705-1-a-limaye@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 28 Jun 2022 16:04:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13920

From: Sinthu Raja <sinthu.raja@ti.com>

Add config file for processor-sdk-linux 08.02.01.00 release

Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
---
 .../processor-sdk-linux-08_02_01_00.txt          | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 configs/processor-sdk-linux/processor-sdk-linux-08_02_01_00.txt

diff --git a/configs/processor-sdk-linux/processor-sdk-linux-08_02_01_00.txt b/configs/processor-sdk-linux/processor-sdk-linux-08_02_01_00.txt
new file mode 100644
index 0000000..806181a
--- /dev/null
+++ b/configs/processor-sdk-linux/processor-sdk-linux-08_02_01_00.txt
@@ -0,0 +1,16 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,git://git.openembedded.org/bitbake,1.46,d22cc1e587c650fd5f90cda32f5720f8a3105aac
+meta-arago,git://git.yoctoproject.org/meta-arago,dunfell,08.02.00.006,layers=meta-arago-distro:meta-arago-extras
+#meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,6bfe29d9e8fdd5c2fd17c736814b6df859b3af50,layers=
+meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,c5f61e547b90aa8058cf816f00902afed9c96f72,layers=
+meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,0722ff6f021df91542b5efa1ff5b5f6269f66add,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,08.02.00.006,layers=
+meta-arm,git://git.yoctoproject.org/meta-arm,HEAD,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
+oe-core,git://git.openembedded.org/openembedded-core,dunfell,51844f2d60d77fb8cb46ffe460402f76ae216ca5,layers=meta
+meta-psdkla,https://git.ti.com/git/jacinto-linux/meta-psdkla.git,am57xx_8.x,PSDKLA-AM57XX-08_02_01_00,layers=
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64.conf.sample
+
-- 
2.17.1


