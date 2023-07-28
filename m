Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8548CC0015E
	for <webhook@archiver.kernel.org>; Fri, 28 Jul 2023 00:20:43 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.22488.1690503636783538920
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 27 Jul 2023 17:20:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=YpZFUQcn;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 36S0KYqO025650;
	Thu, 27 Jul 2023 19:20:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1690503634;
	bh=6TvydyUMsXv1nd8m7key9tTnv+/Zm3sBJ6fHt6LyzO8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=YpZFUQcnMiIN0PqV8kLSGGnusU93qbimEBiRtnhDPKOEzxL4kPZdKA9tpwRvKRFcg
	 1hHkF23wbnFcmgq/LzkFthF7DlBFyMr2kAWKSyAamr9DcRVaxigAA2+a2PbU/PMRq/
	 m3nHcBigNfwGkevb+FlIDInZBozIUoLzGA+/vvpU=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 36S0KYdm081123
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 27 Jul 2023 19:20:34 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 27
 Jul 2023 19:20:34 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 27 Jul 2023 19:20:34 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 36S0KYfE025363;
	Thu, 27 Jul 2023 19:20:34 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>
CC: <afd@ti.com>, <nm@ti.com>, <meta-arago@lists.yoctoproject.org>,
        Randolph
 Sapp <rs@ti.com>
Subject: [meta-arago][kirkstone/master][PATCH 2/5] packagegroup-arago-base: edit the summary to describe current use
Date: Thu, 27 Jul 2023 19:20:29 -0500
Message-ID: <20230728002032.853330-3-rs@ti.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230728002032.853330-1-rs@ti.com>
References: <20230728002032.853330-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 28 Jul 2023 00:20:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14812

From: Randolph Sapp <rs@ti.com>

Edit the summary of this packagegroup to more accurately describe it's
current use in this dependency web.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-base.bb       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
index ff32112a..d3c1997e 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Basic task to get a device booting"
+DESCRIPTION = "Base tools that are recommended for most images"
 LICENSE = "MIT"
 PR = "r9"
 
-- 
2.41.0


