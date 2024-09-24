Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78C1BCF9C6B
	for <webhook@archiver.kernel.org>; Tue, 24 Sep 2024 14:17:14 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.15165.1727187427667854979
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 24 Sep 2024 07:17:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=mBfR14Qa;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 48OEH6ns091739;
	Tue, 24 Sep 2024 09:17:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1727187426;
	bh=F9FsAGDJsGK4QP9WXbcC4jmPuit+vHn6H4t1bT5cnMg=;
	h=From:To:Subject:Date;
	b=mBfR14Qa/AcEc02twjNBaBquja3ILyszdXT4kNSUz9kcUVN9GXxRsNve3q9aIEFbc
	 31rpnMIm11Majc77ZF70Uhm+7Wu86m5aXAztf56IsgYACVstbRiTQ2k6JBhnhzPWi4
	 WUT86WP5IJpYTZf6sjE+y5TFzxQiocuTo1AwzrPY=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 48OEH624006329
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 24 Sep 2024 09:17:06 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 24
 Sep 2024 09:17:06 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 24 Sep 2024 09:17:06 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 48OEH511046009;
	Tue, 24 Sep 2024 09:17:05 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1st6Lh-0002NG-HY; Tue, 24 Sep 2024 09:17:05 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [oe-layersetup][master][PATCH] configs: Add missing scarthgap configs
Date: Tue, 24 Sep 2024 09:17:05 -0500
Message-ID: <20240924141705.9085-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 24 Sep 2024 14:17:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15560

Two configs were missed when scarthgap was setup in April.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 configs/distroless-scarthgap-config.txt |  9 +++++++++
 configs/poky-scarthgap-config.txt       | 14 ++++++++++++++
 2 files changed, 23 insertions(+)
 create mode 100644 configs/distroless-scarthgap-config.txt
 create mode 100644 configs/poky-scarthgap-config.txt

diff --git a/configs/distroless-scarthgap-config.txt b/configs/distroless-scarthgap-config.txt
new file mode 100644
index 0000000..b31fecb
--- /dev/null
+++ b/configs/distroless-scarthgap-config.txt
@@ -0,0 +1,9 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+bitbake,https://git.openembedded.org/bitbake,2.8,HEAD
+meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,HEAD,layers=meta-ti-extras:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,HEAD,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,scarthgap,HEAD,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-v2.conf.sample
+BITBAKE_INCLUSIVE_VARS=yes
diff --git a/configs/poky-scarthgap-config.txt b/configs/poky-scarthgap-config.txt
new file mode 100644
index 0000000..15bb088
--- /dev/null
+++ b/configs/poky-scarthgap-config.txt
@@ -0,0 +1,14 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,https://git.openembedded.org/bitbake,2.8,HEAD
+meta-yocto,https://git.yoctoproject.org/meta-yocto,scarthgap,HEAD,layers=meta-poky:meta-yocto-bsp
+meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,HEAD,layers=meta-ti-extras:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,HEAD,layers=meta-arm:meta-arm-toolchain
+#meta-clang,https://github.com/kraj/meta-clang,scarthgap,HEAD,layers=
+oe-core,https://git.openembedded.org/openembedded-core,scarthgap,HEAD,layers=meta
+meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,HEAD,layers=meta-arago-extras:meta-arago-test
+
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-poky-v2.conf.sample
+BITBAKE_INCLUSIVE_VARS=yes
-- 
2.17.1


