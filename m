Return-Path: <r-ravikumar@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8356FE7AD57
	for <webhook@archiver.kernel.org>; Tue,  3 Oct 2023 14:05:00 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.108810.1696341891087436032
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 03 Oct 2023 07:04:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Afs6QCuB;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: r-ravikumar@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 393E4ocF102132
	for <meta-arago@lists.yoctoproject.org>; Tue, 3 Oct 2023 09:04:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1696341890;
	bh=EnMaIiPOzBd5R9rT9tModLW0omc6XESCJOgJYafIXQA=;
	h=From:To:CC:Subject:Date;
	b=Afs6QCuBJooZDYyG5yEgJb92wZZadDFRaNP/YIkVlGDmB+/W88TUcLw5sCLUV7EQW
	 c2RdcUKeZI5vzz0WndQA1ZXue9n8pN3of1p4aKxHvIVAUjJdZmtoDST6IRX8hR/Bjz
	 0YEg1wuV4oW1Xzezg0isURVCbRevr0vE64W4LRas=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 393E4obb072078
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Tue, 3 Oct 2023 09:04:50 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 3
 Oct 2023 09:04:49 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 3 Oct 2023 09:04:49 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 393E4nK7033236;
	Tue, 3 Oct 2023 09:04:49 -0500
From: Rahul T R <r-ravikumar@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, Rahul T R <r-ravikumar@ti.com>
Subject: [meta-arago][oe-layersetup][PATCH v2] configs: processor-sdk-analytics: Add 9.0.1 release config
Date: Tue, 3 Oct 2023 19:34:47 +0530
Message-ID: <20231003140447.405606-1-r-ravikumar@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 03 Oct 2023 14:05:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14911

Signed-off-by: Rahul T R <r-ravikumar@ti.com>
---

Notes:
    v2:
        Fixed the commit for meta-edgeai

 .../processor-sdk-analytics-09.00.01-config.txt  | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 configs/processor-sdk-analytics/processor-sdk-analytics-09.00.01-config.txt

diff --git a/configs/processor-sdk-analytics/processor-sdk-analytics-09.00.01-config.txt b/configs/processor-sdk-analytics/processor-sdk-analytics-09.00.01-config.txt
new file mode 100644
index 0000000..9166190
--- /dev/null
+++ b/configs/processor-sdk-analytics/processor-sdk-analytics-09.00.01-config.txt
@@ -0,0 +1,16 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,https://git.openembedded.org/bitbake,2.0,907416ee1062f87f5844ab0638b54616abfc1a22
+meta-arago,https://git.yoctoproject.org/meta-arago,kirkstone,9c11eab21e7abe564f4c9f0821e830dd7298b365,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,kirkstone,bff5bd937f0776166e81a63f3dd39ede348ef758,layers=
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,kirkstone,b3b3dbc67504e8cd498d6db202ddcf5a9dd26a9d,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,kirkstone,346753705e49a2486867dc150181a1c7f4d69377,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,https://git.yoctoproject.org/meta-ti,kirkstone,c3916324a01fe96c68a78ef9ed0070d6b1fc8f2f,layers=meta-ti-extras:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,kirkstone,c39bb4ce3b60b73d35c5fb06af012432e70d6b38,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,kirkstone,cef730284b8616ba07c1b062c992c36af730580e,layers=meta
+meta-psdkla,https://git.ti.com/git/jacinto-linux/meta-psdkla.git,kirkstone,9c754ecda6f1019d0126dd4dc163e0ae01772eb0,layers=
+meta-edgeai,https://git.ti.com/git/edgeai/meta-edgeai.git,kirkstone,5ad5799ae51dfd335b6dc4a87200fb96e8b86d7e,layers=
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
+BITBAKE_INCLUSIVE_VARS=yes
-- 
2.34.1


