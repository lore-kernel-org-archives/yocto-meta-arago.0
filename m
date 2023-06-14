Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E765C3DA40
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 17:35:27 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.19075.1686764119460915578
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 14 Jun 2023 10:35:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ygaJ7IJC;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35EHZ7XK102522;
	Wed, 14 Jun 2023 12:35:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686764107;
	bh=CZm8HYPSx6IE29znDddLM70bGX3MEKZiuU3W+WBq2SI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ygaJ7IJCObPHykE2ZTWdFi0OqExZIT9SLY4PCXcgzRSNv36v8KozwIoPxlNMsZLuM
	 rNWZfWCfZjOE6ZogJO+ANpv4sorwDY45HsEZ10pnx9J2jloU4QkJUVYxa2VeDU+PlZ
	 fAaau3Gr8G1K77wtf3STMKutHRmdiv9VX9Yx8/+o=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35EHZ7u6127659
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 14 Jun 2023 12:35:07 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 14
 Jun 2023 12:35:06 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 14 Jun 2023 12:35:06 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35EHZ6S7032184;
	Wed, 14 Jun 2023 12:35:06 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <afd@ti.com>, <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-arago][master/kirkstone][PATCHv3 2/4] systemd: drop the useradd params
Date: Wed, 14 Jun 2023 12:35:00 -0500
Message-ID: <20230614173502.4007809-3-rs@ti.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230614173502.4007809-1-rs@ti.com>
References: <20230614173502.4007809-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 14 Jun 2023 17:35:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14628

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


