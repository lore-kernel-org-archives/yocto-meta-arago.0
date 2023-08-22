Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E6D1EE49AB
	for <webhook@archiver.kernel.org>; Tue, 22 Aug 2023 22:44:37 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.9910.1692744274587472258
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 22 Aug 2023 15:44:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=OL1ATkK8;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 37MMiUO4119763;
	Tue, 22 Aug 2023 17:44:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1692744270;
	bh=rV0S+4DzZoWiWdsFtpCXZ0FWGSvtsZyWo7tncILy/Ak=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=OL1ATkK8+QcK4Dx3WJpHVCw1fb7O2ervUiD6sD3HrFP8oss7bINTdKKsQkmPhkfsf
	 KRjSL/6i4iaanAYS18tRJZ3sBG0ECwoQm8hHMPwalx73c0prssT/Uopt3nWe4BHpou
	 drU1pm0fZhaK4S/ffTr8piM6eXUDIiHSozywntHo=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 37MMiU7k082845
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Aug 2023 17:44:30 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 22
 Aug 2023 17:44:30 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 22 Aug 2023 17:44:30 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 37MMiUqY056368;
	Tue, 22 Aug 2023 17:44:30 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-arago][kirkstone/master][PATCHv2 1/3]  packagegroup-arago-bootstrap: fix RDEPENDS notation
Date: Tue, 22 Aug 2023 17:38:29 -0500
Message-ID: <20230822224427.1880115-2-rs@ti.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230822224427.1880115-1-rs@ti.com>
References: <20230822224427.1880115-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 22 Aug 2023 22:44:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14863

From: Randolph Sapp <rs@ti.com>

The RDEPENDS for this packagegroup was still using the legacy format so
it was being evaluated as a do-nothing group. Enable it.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-bootstrap.bb  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-bootstrap.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-bootstrap.bb
index b0ec64b0..50f759be 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-bootstrap.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-bootstrap.bb
@@ -47,6 +47,6 @@ UTILS:append:k3 = " \
     k3conf \
 "
 
-RDEPENDS_${PN} = "\
+RDEPENDS:${PN} = "\
     ${UTILS} \
 "
-- 
2.41.0


