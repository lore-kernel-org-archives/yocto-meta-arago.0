Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF404C4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 03:18:54 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.13981.1702523932634036873
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Dec 2023 19:18:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=GNMiuYd0;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: a-limaye@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3BE3Ipbc031406
	for <meta-arago@lists.yoctoproject.org>; Wed, 13 Dec 2023 21:18:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1702523931;
	bh=U7nBUfDob9OLG6ljB899IVsPJuE2FheX+Iy5slM1zF4=;
	h=From:To:CC:Subject:Date;
	b=GNMiuYd0zgB1ygasZefjhYtWFuyrabAb9buXwW1ihPmZ6uUsrNyXH6XMomJOGCF5q
	 +7WLDALEf/k9IxPFPb4V0yJgy1hwEzqdeHWYQ62abwNyX1HX70litO3fKQPE8Brcnf
	 oqDnE8xRSUABeQyQ5xvbYQVmHrTWCoUF9DhmzA6Y=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3BE3IphE122744
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 13 Dec 2023 21:18:51 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 13
 Dec 2023 21:18:51 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 13 Dec 2023 21:18:51 -0600
Received: from PSDKL-Workstation0.dhcp.ti.com (psdkl-workstation0.dhcp.ti.com [10.24.68.161])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3BE3In1W040952;
	Wed, 13 Dec 2023 21:18:50 -0600
From: <a-limaye@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <a-limaye@ti.com>, <reatmon@ti.com>
Subject: [meta-arago][oe-layersetup][PATCH] configs: processor-sdk-linux: Adding 9.1 release config for AM68/AM69
Date: Thu, 14 Dec 2023 08:48:43 +0530
Message-ID: <20231214031843.400116-1-a-limaye@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 14 Dec 2023 03:18:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15061

From: Aniket Limaye <a-limaye@ti.com>

Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
 .../processor-sdk-linux-09_01_00_06.txt       | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 configs/processor-sdk-linux/processor-sdk-linux-09_01_00_06.txt

diff --git a/configs/processor-sdk-linux/processor-sdk-linux-09_01_00_06.txt b/configs/processor-sdk-linux/processor-sdk-linux-09_01_00_06.txt
new file mode 100644
index 0000000..807032f
--- /dev/null
+++ b/configs/processor-sdk-linux/processor-sdk-linux-09_01_00_06.txt
@@ -0,0 +1,20 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,https://git.openembedded.org/bitbake,2.0,6c1ffa9091d0c53a100e8c8c15122d28642034bd
+meta-arago,https://git.yoctoproject.org/meta-arago,kirkstone,09.01.00.003,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,kirkstone,ae8a97f79364bed1abc297636f7933d0e35f22be,layers=
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,kirkstone,2d8b3cba8ff27c9ec2187a52b6a551fe1dcfaa07,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,kirkstone,79a6f60dabad9e5b0e041efa91379447ef030482,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,https://git.yoctoproject.org/meta-ti,kirkstone,09.01.00.003,layers=meta-ti-extras:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,kirkstone,b187fb9232ca0a6b5f8f90b4715958546fc41d73,layers=meta-arm:meta-arm-toolchain
+#meta-clang,https://github.com/kraj/meta-clang,kirkstone,HEAD,layers=
+oe-core,https://git.openembedded.org/openembedded-core,kirkstone,56503e3e80603de3b69acef2f6d32836bc9e5e5d,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
+BITBAKE_INCLUSIVE_VARS=yes
+meta-tisdk,https://git.ti.com/cgit/ti-sdk-linux/meta-tisdk,kirkstone,09.01.00.06,layers=
+LOCALCONF:DISTRO_FEATURES:append = " virtualization"
+LOCALCONF:ARAGO_BRAND = "foundational_sdk"
+
-- 
2.34.1


