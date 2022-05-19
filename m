Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8417EC433F5
	for <webhook@archiver.kernel.org>; Thu, 19 May 2022 13:58:39 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.7891.1652968716244306324
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 19 May 2022 06:58:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=mNq6WFY2;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 24JDwWgD127266;
	Thu, 19 May 2022 08:58:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1652968713;
	bh=DRfszvfoACpLRGg/Cfcc7fLCp66MYci9fgyaddUnkd4=;
	h=From:To:Subject:Date;
	b=mNq6WFY20gQjrTW5FgscFN70navHT0WJQ82IB+BvlcVUzPlq3a9dl7YSKxPpKX9r6
	 oSyD55we8VQpKUZzoeWLwHNAWQnvtzm7NL53vdKMJUvuHuqmUpMilM75yyxDKyytAo
	 Bmi5cGkQ2e7uVLz/F9zHvr2jtFjciAL7MwLNqVDw=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 24JDwWvu021122
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 19 May 2022 08:58:32 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 19
 May 2022 08:58:32 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 19 May 2022 08:58:32 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 24JDwW4H041601;
	Thu, 19 May 2022 08:58:32 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nrgfg-0001nw-GG; Thu, 19 May 2022 08:58:32 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [oe-layersetup][master][PATCH] configs: add dunfell-wip config
Date: Thu, 19 May 2022 08:58:32 -0500
Message-ID: <20220519135832.6897-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 19 May 2022 13:58:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13869

Add support for building against dunfell-wip for testing.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 configs/arago-dunfell-wip-config.txt | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 configs/arago-dunfell-wip-config.txt

diff --git a/configs/arago-dunfell-wip-config.txt b/configs/arago-dunfell-wip-config.txt
new file mode 100644
index 0000000..60f9f0d
--- /dev/null
+++ b/configs/arago-dunfell-wip-config.txt
@@ -0,0 +1,18 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,git://git.openembedded.org/bitbake,1.46,HEAD
+meta-arago,git://git.yoctoproject.org/meta-arago,dunfell-wip,HEAD,layers=meta-arago-distro:meta-arago-extras
+# meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
+# meta-python2,git://git.openembedded.org/meta-python2,dunfell,HEAD,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,HEAD,layers=
+meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,HEAD,layers=
+meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,git://git.yoctoproject.org/meta-ti,dunfell-wip,HEAD,layers=
+meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
+oe-core,git://git.openembedded.org/openembedded-core,dunfell,HEAD,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+# if meta-browser/5f365ef0f842ba4651efe88787cf9c63bc8b6cb3 above is enabled,
+# use below for OECORELAYERCONF to mark it compatible with dunfell
+#OECORELAYERCONF=./sample-files/bblayers-dunfell-browser.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64.conf.sample
-- 
2.17.1


