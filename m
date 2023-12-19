Return-Path: <r-ravikumar@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 740B1C41535
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 09:32:08 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.8705.1702978319631940721
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 19 Dec 2023 01:31:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=i0coQgVH;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: r-ravikumar@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3BJ9Vwqr028593
	for <meta-arago@lists.yoctoproject.org>; Tue, 19 Dec 2023 03:31:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1702978318;
	bh=jaWX8X7bBqD1SZ0n5HUu5aGm9E0Tw1Bk7wLE4+jeA5U=;
	h=From:To:CC:Subject:Date;
	b=i0coQgVHePq9sgcU59lRklXueNyRks0DymGqUI/dzxt07+/C58N2aa87cNNM56w5X
	 B8Bx06qX7KjLhVODMN6Clit4i5PNBNr7BAJbX+etGgQalHXwNhavqY/35xxbhXK9lx
	 BXoMD+hMXXpRw9Eziho2pMtkBAI1AO08y47XZyIY=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3BJ9Vw3f074444
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Tue, 19 Dec 2023 03:31:58 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 19
 Dec 2023 03:31:58 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 19 Dec 2023 03:31:58 -0600
Received: from localhost (edgeaisrv1.dhcp.ti.com [10.24.69.154])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3BJ9VvxK068228;
	Tue, 19 Dec 2023 03:31:58 -0600
From: Rahul T R <r-ravikumar@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, Rahul T R <r-ravikumar@ti.com>
Subject: [meta-arago][oe-layersetup][PATCH] configs: processor-sdk-analytics: Add 9.1 release config
Date: Tue, 19 Dec 2023 15:01:55 +0530
Message-ID: <20231219093155.186246-1-r-ravikumar@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 19 Dec 2023 09:32:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15063

Signed-off-by: Rahul T R <r-ravikumar@ti.com>
---
 .../processor-sdk-analytics-09.01.00-config.txt  | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 configs/processor-sdk-analytics/processor-sdk-analytics-09.01.00-config.txt

diff --git a/configs/processor-sdk-analytics/processor-sdk-analytics-09.01.00-config.txt b/configs/processor-sdk-analytics/processor-sdk-analytics-09.01.00-config.txt
new file mode 100644
index 0000000..1fe0f1f
--- /dev/null
+++ b/configs/processor-sdk-analytics/processor-sdk-analytics-09.01.00-config.txt
@@ -0,0 +1,16 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,https://git.openembedded.org/bitbake,2.0,42a1c9fe698a03feb34c5bba223c6e6e0350925b
+meta-arago,ssh://git@bitbucket.itg.ti.com/coresdk/meta-arago.git,kirkstone-j722s-wakeup,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,kirkstone,ae8a97f79364bed1abc297636f7933d0e35f22be,layers=
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,kirkstone,67b0ef4256a484851f3556d281ca4caa88374388,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,kirkstone,402affcc073db39f782c1ebfd718edd5f11eed4c,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,ssh://git@bitbucket.itg.ti.com/coresdk/meta-ti.git,kirkstone-j722s-wakeup,HEAD,layers=meta-ti-extras:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,kirkstone,b187fb9232ca0a6b5f8f90b4715958546fc41d73,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,kirkstone,b77cd331199fa62e3b162f37efca3b927c68d8e5,layers=meta
+meta-tisdk,ssh://git@bitbucket.itg.ti.com/ti-sdk-linux/meta-tisdk.git,kirkstone-j722s-wakeup,HEAD,layers=
+meta-edgeai,ssh://git@bitbucket.itg.ti.com/processor-sdk-vision/meta-edgeai.git,kirkstone-j722s-wakeup,HEAD,layers=
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
+BITBAKE_INCLUSIVE_VARS=yes
-- 
2.34.1


