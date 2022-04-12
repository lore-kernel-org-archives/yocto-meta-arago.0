Return-Path: <devarsht@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7091BC54F3D
	for <webhook@archiver.kernel.org>; Tue, 12 Apr 2022 16:46:43 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web09.9970.1649766043598726430
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 12 Apr 2022 05:20:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Xun/JGtZ;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: devarsht@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23CCKgau011380
	for <meta-arago@lists.yoctoproject.org>; Tue, 12 Apr 2022 07:20:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1649766042;
	bh=DiuxKoM3EVJUM5Nu2j4ectaHg/lc8/yf2WXhxufGofo=;
	h=From:To:CC:Subject:Date;
	b=Xun/JGtZY33E8PeX/J/X9mqFOnvH4ZDW4UreIeYKcMdOtYncDaOezLS3RXvBE3dCf
	 0jwrHhhCVZQ75omKqBSzQkMijporLTWDnrUzCyEJITlMXyYCGWa94452wrpES8ul8Q
	 r0ctku5nrNV4o3woVXR5bOT8hNP/wBSXKsHAw/d4=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23CCKg5h109572
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Tue, 12 Apr 2022 07:20:42 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 12
 Apr 2022 07:20:41 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 12 Apr 2022 07:20:41 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23CCKftt113262;
	Tue, 12 Apr 2022 07:20:41 -0500
From: Devarsh Thakkar <devarsht@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>
CC: <nikhil.nd@ti.com>, <nsekhar@ti.com>, <devarsht@ti.com>,
 <vigneshr@ti.com>,
        Ryan Eatmon <reatmon@ti.com>, <a-m1@ti.com>
Subject: [meta-arago][oe-layersetup][master][PATCH] configs: processor-sdk:
 Add AM64x 8.2 config
Date: Tue, 12 Apr 2022 17:50:40 +0530
Message-ID: <20220412122040.5108-1-devarsht@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 12 Apr 2022 16:46:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13778

Add 8.2 release config for AM64x.

Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
---
 .../processor-sdk-08.02.00.14-config.txt          | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 configs/processor-sdk/processor-sdk-08.02.00.14-config.txt

diff --git a/configs/processor-sdk/processor-sdk-08.02.00.14-config.txt b/configs/processor-sdk/processor-sdk-08.02.00.14-config.txt
new file mode 100644
index 0000000..313d90c
--- /dev/null
+++ b/configs/processor-sdk/processor-sdk-08.02.00.14-config.txt
@@ -0,0 +1,15 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,git://git.openembedded.org/bitbake,1.46,d22cc1e
+meta-processor-sdk,git://git.ti.com/processor-sdk/meta-processor-sdk.git,dunfell,5ad52b6a1e1e5ee7b436dd1c863a4a545d43d2bf,layers=
+meta-arago,git://git.yoctoproject.org/meta-arago,dunfell,08.02.00.006,layers=meta-arago-distro:meta-arago-extras
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,6bfe29d,layers=
+meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,c5f61e5,layers=
+meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,0722ff6,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,08.02.00.006,layers=
+meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,c4f04f3,layers=meta-arm:meta-arm-toolchain
+oe-core,git://git.openembedded.org/openembedded-core,dunfell,51844f2,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64.conf.sample
-- 
2.17.1


