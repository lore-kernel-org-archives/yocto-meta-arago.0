Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8208EB64DB
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 16:38:46 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.17566.1686760719600485754
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 14 Jun 2023 09:38:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=BAWwwBPH;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35EGcQ2x049691;
	Wed, 14 Jun 2023 11:38:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686760706;
	bh=CZm8HYPSx6IE29znDddLM70bGX3MEKZiuU3W+WBq2SI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=BAWwwBPHHOl6NshWEXPbX7yqJ0Uua2alzfhA6rmGhbLsZdfWTUd6xeXc4bLZBfr6F
	 iBh7dmY3+CAkfBQjEOz3hB8TDCb5SXatRvfOeM5rO/M8t4YI/uB0y16zvKLwwfVRZy
	 9mq/jdAByp/8AUQVgEJd0yXS/63wwzErsiiDeF7M=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35EGcQM5025186
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 14 Jun 2023 11:38:26 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 14
 Jun 2023 11:38:26 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 14 Jun 2023 11:38:26 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35EGcPZX060182;
	Wed, 14 Jun 2023 11:38:25 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <afd@ti.com>, <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-arago][master/kirkstone][PATCHv2 2/4] systemd: drop the useradd params
Date: Wed, 14 Jun 2023 11:38:12 -0500
Message-ID: <20230614163814.3562779-3-rs@ti.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230614163814.3562779-1-rs@ti.com>
References: <20230614163814.3562779-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 14 Jun 2023 16:38:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14626

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


