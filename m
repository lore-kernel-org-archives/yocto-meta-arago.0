Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBEECC7EE45
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 20:48:06 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.5190.1686257278208511988
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 08 Jun 2023 13:47:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=NykArFh6;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 358KlrrZ032096;
	Thu, 8 Jun 2023 15:47:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686257273;
	bh=qj48xEYT1RPMX8rde1JQyb/inU4bz2loEv0GeoTs44Y=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=NykArFh6pRUWCfWJyAcNosKz4//LylBPC8yEneXfnJKAbw+F2fzFSthZZCv7qZUo1
	 3okHYbMaw6cGTGVPZAz2fRt9T8b6sK+rKPDoV/7yc9Tm/G+1q9B9YR+Pnv9bCT7Slr
	 SL6wpabNhiNr7JeqCsqpWjfUmwAiLumYcPYoZROg=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 358KlreM016401
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 Jun 2023 15:47:53 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 Jun 2023 15:47:53 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 Jun 2023 15:47:53 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 358KlrJx007568;
	Thu, 8 Jun 2023 15:47:53 -0500
From: <rs@ti.com>
To: <afd@ti.com>, <reatmon@ti.com>, <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-arago][master/kirkstone][PATCH 1/2] systemd: drop the useradd params
Date: Thu, 8 Jun 2023 15:47:51 -0500
Message-ID: <20230608204752.2060719-2-rs@ti.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230608204752.2060719-1-rs@ti.com>
References: <20230608204752.2060719-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 08 Jun 2023 20:48:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14558

From: Randolph Sapp <rs@ti.com>

These were incorrect and OE-Core has been carrying the equivalent patch
since 42344347be2.

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


