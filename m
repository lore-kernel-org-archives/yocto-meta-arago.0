Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53205C3DA6E
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 15:37:08 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.21089.1703078639999987340
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 20 Dec 2023 05:24:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=vBVN7mS0;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: s-alam@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3BKDNxgZ094638
	for <meta-arago@lists.yoctoproject.org>; Wed, 20 Dec 2023 07:23:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1703078639;
	bh=izarp/CP2IrAUtmctEp70Ig2hir7UXwa5mDaTZfD3+o=;
	h=From:To:CC:Subject:Date;
	b=vBVN7mS0GA/DFgbBYZlq+IyDNUsGZtszsjRAwmtnS7AIyWHHU5AZRhJRkYZe5UN3T
	 7W1H7YiOE88FT4mwVOqAhUZeglYbO+RXil6nxXlfv1aDC3AvBBaSbMazk9T9wcPCWD
	 vW2ZEuQ6C5ZrBWnMmdIFYc5jUJOroUDh4lU3FJVg=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3BKDNxLU029754
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 20 Dec 2023 07:23:59 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 20
 Dec 2023 07:23:58 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 20 Dec 2023 07:23:58 -0600
Received: from sonu-hp-ws.dhcp.ti.com (sonu-hp-ws.dhcp.ti.com [10.24.68.220])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3BKDNvg4065665;
	Wed, 20 Dec 2023 07:23:57 -0600
From: <s-alam@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, Sonu Alam <s-alam@ti.com>
Subject: [meta-arago][oe-layersetup][PATCH] configs: processor-sdk-linux: Adding 9.1 release config for J7200
Date: Wed, 20 Dec 2023 18:53:52 +0530
Message-ID: <20231220132352.117039-1-s-alam@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 20 Dec 2023 15:37:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15068

From: Sonu Alam <s-alam@ti.com>

Signed-off-by: Sonu Alam <s-alam@ti.com>
---
 .../processor-sdk-linux-09_01_00_07.txt       | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 configs/processor-sdk-linux/processor-sdk-linux-09_01_00_07.txt

diff --git a/configs/processor-sdk-linux/processor-sdk-linux-09_01_00_07.txt b/configs/processor-sdk-linux/processor-sdk-linux-09_01_00_07.txt
new file mode 100644
index 0000000..e469c37
--- /dev/null
+++ b/configs/processor-sdk-linux/processor-sdk-linux-09_01_00_07.txt
@@ -0,0 +1,19 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,https://git.openembedded.org/bitbake,2.0,a7f6c3e67bd9170e93b2b94676e84018faf0df91
+meta-arago,https://git.yoctoproject.org/meta-arago,kirkstone,09.01.00.006,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,kirkstone,ae8a97f79364bed1abc297636f7933d0e35f22be,layers=
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,kirkstone,67b0ef4256a484851f3556d281ca4caa88374388,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,kirkstone,7da6cb848bc42b3e6bd5d2b37b52ba75510a6ca0,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,https://git.yoctoproject.org/meta-ti,kirkstone,09.01.00.006,layers=meta-ti-extras:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,kirkstone,b187fb9232ca0a6b5f8f90b4715958546fc41d73,layers=meta-arm:meta-arm-toolchain
+#meta-clang,https://github.com/kraj/meta-clang,kirkstone,HEAD,layers=
+oe-core,https://git.openembedded.org/openembedded-core,kirkstone,4bb6373e5f4a1330a063d1afe855d6c24d5461e7,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
+BITBAKE_INCLUSIVE_VARS=yes
+meta-tisdk,https://git.ti.com/cgit/ti-sdk-linux/meta-tisdk,kirkstone,09.01.00.07,layers=
+LOCALCONF:DISTRO_FEATURES:append = " virtualization"
+
-- 
2.34.1


