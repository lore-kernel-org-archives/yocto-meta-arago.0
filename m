Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01018C83005
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 19:24:35 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.3400.1686338666111441888
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 09 Jun 2023 12:24:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=IiN6LnE7;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 359JOLXO111185;
	Fri, 9 Jun 2023 14:24:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686338661;
	bh=CZm8HYPSx6IE29znDddLM70bGX3MEKZiuU3W+WBq2SI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=IiN6LnE7nCAX38ZJnZJ47QO4JUQq8n6BaJBlRrp/E/GgNnOuU291wMyu7zSrd9TgZ
	 vtfuUz4ml0Gja0AXrF+FcgNTzPVzUQN5vkBr2M8RxwPi4xqkz7Jlv4rXjfia8EYh/y
	 72qoL/BqD+uzgGQN+cpMhx5LzNqOmaA3mdYq0Dmg=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 359JOLRh090120
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 9 Jun 2023 14:24:21 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 9
 Jun 2023 14:24:21 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 9 Jun 2023 14:24:21 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 359JOLEQ060690;
	Fri, 9 Jun 2023 14:24:21 -0500
From: <rs@ti.com>
To: <afd@ti.com>, <reatmon@ti.com>, <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-arago][master/kirkstone][PATCHv2 1/3] systemd: drop the useradd params
Date: Fri, 9 Jun 2023 14:24:13 -0500
Message-ID: <20230609192415.3210941-2-rs@ti.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230609192415.3210941-1-rs@ti.com>
References: <20230609192415.3210941-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 09 Jun 2023 19:24:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14587

From: Randolph Sapp <rs@ti.com>

This currently points to an invalid shell (bin -> sbin) and OE-Core has
been carrying the equivalent patch since: d18957925c (systemd: Create
missing sysusers offline, 2016-05-17)

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta-arago-distro/recipes-core/systemd/systemd_%.bbappend | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
index 9e49ac69..a38ca124 100644
--- a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
+++ b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
@@ -3,8 +3,6 @@ PR:append = ".arago6"
 FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
 
 PACKAGECONFIG:append = " networkd resolved"
-USERADD_PARAM:${PN} += "--system -d / -M --shell /bin/nologin systemd-network;"
-USERADD_PARAM:${PN} += "--system -d / -M --shell /bin/nologin systemd-resolve;"
 
 SRC_URI:append = " \
     file://local.rules \
-- 
2.41.0


