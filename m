Return-Path: <r-ravikumar@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9E29C3DA4A
	for <webhook@archiver.kernel.org>; Mon, 19 Aug 2024 10:51:46 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.207647.1724064702696608001
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 19 Aug 2024 03:51:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=EprWZxs6;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: r-ravikumar@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 47JApf4n130464
	for <meta-arago@lists.yoctoproject.org>; Mon, 19 Aug 2024 05:51:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1724064701;
	bh=muKPnEFcqxN6WGKO7oQdsdk6cLCm9LXuCuS1lb+KiNQ=;
	h=From:To:CC:Subject:Date;
	b=EprWZxs6lkg5ihqzVvk4i+rKpIrCkeDexEut5XgP/BNq/QXQrqeoAd/vr1TiOTAfI
	 gy1GTPvPQmeBW6RskXc5BLuP23lkB2z1JzHIazUgNJdXLtupNbgQ4k16kzPjRnuz1M
	 E858B8Q6zxAVGnWm/wWb6NskOdPhRtRjsQY7A/Yo=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 47JApfB8119351
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Mon, 19 Aug 2024 05:51:41 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 19
 Aug 2024 05:51:40 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 19 Aug 2024 05:51:40 -0500
Received: from localhost (edgeaisrv1.dhcp.ti.com [10.24.69.154])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 47JApd5e021805;
	Mon, 19 Aug 2024 05:51:40 -0500
From: Rahul T R <r-ravikumar@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, Rahul T R <r-ravikumar@ti.com>
Subject: [meta-arago][oe-layersetup][PATCH] configs: processor-sdk-analytics: Add 10.0 release config
Date: Mon, 19 Aug 2024 16:21:37 +0530
Message-ID: <20240819105137.2095596-1-r-ravikumar@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 19 Aug 2024 10:51:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15511

Signed-off-by: Rahul T R <r-ravikumar@ti.com>
---
 .../processor-sdk-analytics-10.00.00-config.txt  | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 configs/processor-sdk-analytics/processor-sdk-analytics-10.00.00-config.txt

diff --git a/configs/processor-sdk-analytics/processor-sdk-analytics-10.00.00-config.txt b/configs/processor-sdk-analytics/processor-sdk-analytics-10.00.00-config.txt
new file mode 100644
index 0000000..8311684
--- /dev/null
+++ b/configs/processor-sdk-analytics/processor-sdk-analytics-10.00.00-config.txt
@@ -0,0 +1,16 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,https://git.openembedded.org/bitbake,2.8,11d83170922a2c6b9db1f6e8c23e533526984b2c
+meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,cbf054c7401af6e1e8bcc4eab07daa9a4996f7f3,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,scarthgap,eb828418264a49b8d00035cb3d7b12fcea3be801,layers=
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scarthgap,54b806b1985f3989722ee308e1073530fe3328c1,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap,80e01188fa822d87d301ee71973c462d7a865493,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
+meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,84328ead40d7e6fcce4d80ab7d07f4dcaf9d777e,layers=meta-ti-extras:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,ecece16871afe6b674d2aafd27e0f18bbaef1966,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,scarthgap,bf3fe8c01c5cc00ada22049f4f0abb485e2a626f,layers=meta
+meta-tisdk,https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git,scarthgap,af81e0d81c5efd005bfc0ef749f690f9748c70f6,layers=
+meta-edgeai,https://git.ti.com/git/edgeai/meta-edgeai.git,scarthgap,a3b8006957fbc31f8375a5989be7c42b2ba2959b,layers=
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
+BITBAKE_INCLUSIVE_VARS=yes
-- 
2.34.1


