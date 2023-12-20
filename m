Return-Path: <r-ravikumar@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4561FC3DA6E
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 12:57:07 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.20620.1703077018183924113
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 20 Dec 2023 04:56:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=jszDweHe;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: r-ravikumar@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3BKCuv2k048594
	for <meta-arago@lists.yoctoproject.org>; Wed, 20 Dec 2023 06:56:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1703077017;
	bh=zuoK48HIS+P2W+nKLuRwI4dyvRRN0L33xGLIItc3jfw=;
	h=From:To:CC:Subject:Date;
	b=jszDweHeGvS2SBNSFQZTVF/jwfXD1DLk9U3ATJPdeIgppbr1gpS6XJI+nXGtV4Azv
	 9+9OJqsUnByzK8GqQsNBp9dsxFe+En3JJkOGDvGHbyL+5fqVi1WrhKkQY50Heo0TIG
	 LASY/4BYCV0s+tL4QMDWM4xLs8OQWaCtr4lXK/8A=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3BKCuvE7016676
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 20 Dec 2023 06:56:57 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 20
 Dec 2023 06:56:57 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 20 Dec 2023 06:56:57 -0600
Received: from localhost (edgeaisrv1.dhcp.ti.com [10.24.69.154])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3BKCuuv8069249;
	Wed, 20 Dec 2023 06:56:56 -0600
From: Rahul T R <r-ravikumar@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, Rahul T R <r-ravikumar@ti.com>
Subject: [meta-arago][oe-layersetup][PATCH v2] configs: processor-sdk-analytics: Add 9.1 release config
Date: Wed, 20 Dec 2023 18:26:54 +0530
Message-ID: <20231220125654.1023083-1-r-ravikumar@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 20 Dec 2023 12:57:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15065

Signed-off-by: Rahul T R <r-ravikumar@ti.com>
---
 .../processor-sdk-analytics-09.01.00-config.txt  | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 configs/processor-sdk-analytics/processor-sdk-analytics-09.01.00-config.txt

diff --git a/configs/processor-sdk-analytics/processor-sdk-analytics-09.01.00-config.txt b/configs/processor-sdk-analytics/processor-sdk-analytics-09.01.00-config.txt
new file mode 100644
index 0000000..fa57171
--- /dev/null
+++ b/configs/processor-sdk-analytics/processor-sdk-analytics-09.01.00-config.txt
@@ -0,0 +1,16 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,https://git.openembedded.org/bitbake,2.0,42a1c9fe698a03feb34c5bba223c6e6e0350925b
+meta-arago,https://git.yoctoproject.org/meta-arago,kirkstone,190e2b58fb6c1e3c658fe2f7afc40a2863007bbc,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,kirkstone,ae8a97f79364bed1abc297636f7933d0e35f22be,layers=
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,kirkstone,67b0ef4256a484851f3556d281ca4caa88374388,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,kirkstone,402affcc073db39f782c1ebfd718edd5f11eed4c,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,https://git.yoctoproject.org/meta-ti,kirkstone,6ad91a192fa1ab33775a22894a413aefd0b67106,layers=meta-ti-extras:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,kirkstone,b187fb9232ca0a6b5f8f90b4715958546fc41d73,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,kirkstone,b77cd331199fa62e3b162f37efca3b927c68d8e5,layers=meta
+meta-tisdk,https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git,kirkstone,d0a92bc0a53276a3faad16ed52084451f4d1b3bf,layers=
+meta-edgeai,https://git.ti.com/git/edgeai/meta-edgeai.git,kirkstone,02ce7e60b449c72def00f26afc549034cbd82ba9,layers=
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
+BITBAKE_INCLUSIVE_VARS=yes
-- 
2.34.1


