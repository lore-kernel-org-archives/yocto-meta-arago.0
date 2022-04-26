Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CD47C433F5
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 20:02:57 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.2326.1651003374129788800
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 26 Apr 2022 13:02:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=tr76GEie;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23QK2qIK007726;
	Tue, 26 Apr 2022 15:02:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1651003372;
	bh=AWAHqenuzDcSjbocCCo6QJZBP11V8ENaL0PJKH3h6FY=;
	h=From:To:CC:Subject:Date;
	b=tr76GEieHvuHW/iuHY9/NdpF8N0Am9LkqSSLiUpdWUAq/PYqv3TtewRkPRBmyCJ5S
	 jPlvSqBByqVTHJGcJTxzVUzA6SOsR2bITCBa8qSyLHKHa3GzfIa9YD4Kyua/LRksCx
	 m+1Gg66G13giDRhQ1Mq0fXZiWN3aUCktKSh5K/NM=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23QK2qk9030018
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 26 Apr 2022 15:02:52 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 26
 Apr 2022 15:02:52 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 26 Apr 2022 15:02:52 -0500
Received: from ula0226330.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23QK2pgX099348;
	Tue, 26 Apr 2022 15:02:51 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][oe-layersetup PATCH 1/6] Remove unused sample-file
 bblayers-zeus-browser.conf.sample
Date: Tue, 26 Apr 2022 15:02:46 -0500
Message-ID: <20220426200251.19417-1-afd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 26 Apr 2022 20:02:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13793

Signed-off-by: Andrew Davis <afd@ti.com>
---
 sample-files/bblayers-zeus-browser.conf.sample | 12 ------------
 1 file changed, 12 deletions(-)
 delete mode 100644 sample-files/bblayers-zeus-browser.conf.sample

diff --git a/sample-files/bblayers-zeus-browser.conf.sample b/sample-files/bblayers-zeus-browser.conf.sample
deleted file mode 100644
index bb83fac..0000000
--- a/sample-files/bblayers-zeus-browser.conf.sample
+++ /dev/null
@@ -1,12 +0,0 @@
-# This template file was created by taking the oe-core/meta/conf/bblayers.conf
-# file and removing the BBLAYERS section at the end.
-
-# LAYER_CONF_VERSION is increased each time build/conf/bblayers.conf
-# changes incompatibly
-LCONF_VERSION = "6"
-
-BBPATH = "${TOPDIR}"
-BBFILES ?= ""
-
-OVERRIDES = "forcevariable"
-LAYERSERIES_COMPAT_browser-layer_forcevariable = "zeus"
-- 
2.17.1


