Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B52AC4167B
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 09:20:52 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.4542.1702286447954840579
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 11 Dec 2023 01:20:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=mrnBnNZP;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: c-shilwant@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3BB9Kiq6004649;
	Mon, 11 Dec 2023 03:20:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1702286444;
	bh=D+l6g3eO1sJYrOwp7e6PtyW3ypokISU1OaVpckcasnA=;
	h=From:To:CC:Subject:Date;
	b=mrnBnNZP9ypjtEBfndmr6FgCGvTcE1PCpoU9GoSP1ZZxtL9QISi4w4lXFSWxd8PN4
	 O/iD4x0CZEYXCxR2NSdJOsujkh/bfXxIjR/mCXYlzUsnUy+nxaezycCraFCzM0Cs/K
	 G2i2q/xixMYTWrQ0igO+NB6kYbwLtOc9ZVEGa5co=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3BB9Kin4104417
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 11 Dec 2023 03:20:44 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 11
 Dec 2023 03:20:44 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 11 Dec 2023 03:20:44 -0600
Received: from localhost (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3BB9KhxC056695;
	Mon, 11 Dec 2023 03:20:44 -0600
From: Chirag Shilwant <c-shilwant@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        Ryan Eatmon <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: Sai Sree Kartheek Adivi <s-adivi@ti.com>, Paresh Bhagat <p-bhagat@ti.com>,
        Khasim <khasim@ti.com>, Gyan Gupta <g-gupta@ti.com>
Subject: [meta-arago][oe-layersetup][PATCH] configs: processor-sdk: Add new config for AM65x
Date: Mon, 11 Dec 2023 14:50:35 +0530
Message-ID: <20231211092035.3271382-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 11 Dec 2023 09:20:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15052

- Add processor-sdk-09.01.00-am65xx-config.txt used for building AM65x.

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 .../processor-sdk-09.01.00-am65xx-config.txt      | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 configs/processor-sdk/processor-sdk-09.01.00-am65xx-config.txt

diff --git a/configs/processor-sdk/processor-sdk-09.01.00-am65xx-config.txt b/configs/processor-sdk/processor-sdk-09.01.00-am65xx-config.txt
new file mode 100644
index 0000000..74d349e
--- /dev/null
+++ b/configs/processor-sdk/processor-sdk-09.01.00-am65xx-config.txt
@@ -0,0 +1,15 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,https://git.openembedded.org/bitbake,2.0,a7f6c3e67bd9170e93b2b94676e84018faf0df91
+meta-processor-sdk,https://git.ti.com/git/processor-sdk/meta-processor-sdk.git,kirkstone,09.01.00.007-AM65X,layers=
+meta-arago,https://git.yoctoproject.org/meta-arago,kirkstone,09.01.00.007,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,kirkstone,ae8a97f79364bed1abc297636f7933d0e35f22be,layers=
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,kirkstone,67b0ef4256a484851f3556d281ca4caa88374388,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,kirkstone,8a75c61cce2aa1d6e5a3597ab8fc5a7e6aeae1e4,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
+meta-ti,https://git.yoctoproject.org/meta-ti,kirkstone,09.01.00.007,layers=meta-ti-extras:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,kirkstone,b187fb9232ca0a6b5f8f90b4715958546fc41d73,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,kirkstone,8726ae02d760270f9e7fe7ef5715d8f7553371ce,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
+BITBAKE_INCLUSIVE_VARS=yes
-- 
2.34.1


