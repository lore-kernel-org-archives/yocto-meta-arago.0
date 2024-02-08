Return-Path: <detheridge@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77581C4828F
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 19:03:07 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.3797.1707418982695964703
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 08 Feb 2024 11:03:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=EqCpmpNd;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: detheridge@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 418J31jW086611;
	Thu, 8 Feb 2024 13:03:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707418981;
	bh=NbD2K27K7cgCFkdVXsUXNullSXESWD+IhuDjdbicgyk=;
	h=From:To:CC:Subject:Date;
	b=EqCpmpNdNYf1vNwRwXiUET9lJ9XAcYvGMndsaEbmMiwuNO5YKznYBjUUrMX9CJKTp
	 yjSZek+onepceX7YXDLTxcMEdaUzzpQ2Qb88YOhx2KISZ96DvF2Ha35fxRZl7vwVuF
	 AL10VcUauFPJnlia3tlS9xrhxrDcEp0hBVeHh30A=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 418J31p8048246
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 Feb 2024 13:03:01 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 Feb 2024 13:03:01 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 Feb 2024 13:03:01 -0600
Received: from uda0867391.dal.design.ti.com (uda0867391.dhcp.ti.com [128.247.81.32])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 418J31uH007235;
	Thu, 8 Feb 2024 13:03:01 -0600
From: <detheridge@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>,
        <denys@konsulko.com>
CC: <rs@ti.com>, <detheridge@ti.com>
Subject: [meta-arago][oe-layersetup][PATCH] oe-layersetup: add a new kirkstone config for chromium support
Date: Thu, 8 Feb 2024 13:02:59 -0600
Message-ID: <20240208190259.6445-1-detheridge@ti.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 08 Feb 2024 19:03:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15137

From: Darren Etheridge <detheridge@ti.com>

Add arago-kirkstone-chromium-config.txt.

If this config is instantiated, chromium v111 and clang12 layers will
be pulled into the yocto build.

Signed-off-by: Darren Etheridge <detheridge@ti.com>
---
 configs/arago-kirkstone-chromium-config.txt | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 configs/arago-kirkstone-chromium-config.txt

diff --git a/configs/arago-kirkstone-chromium-config.txt b/configs/arago-kirkstone-chromium-config.txt
new file mode 100644
index 0000000..97d7849
--- /dev/null
+++ b/configs/arago-kirkstone-chromium-config.txt
@@ -0,0 +1,16 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,https://git.openembedded.org/bitbake,2.0,HEAD
+meta-arago,https://git.yoctoproject.org/meta-arago,kirkstone,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
+meta-browser,https://github.com/OSSystems/meta-browser.git,master,d3d16b47e17dc899e5298cff698dc32e5e639ab4,layers=meta-chromium
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,kirkstone,HEAD,layers=
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,kirkstone,HEAD,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,kirkstone,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,https://git.yoctoproject.org/meta-ti,kirkstone,HEAD,layers=meta-ti-extras:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,kirkstone,HEAD,layers=meta-arm:meta-arm-toolchain
+meta-clang,https://github.com/kraj/meta-clang,kirkstone-clang12,HEAD,layers=
+oe-core,https://git.openembedded.org/openembedded-core,kirkstone,HEAD,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
+BITBAKE_INCLUSIVE_VARS=yes
-- 
2.36.1


