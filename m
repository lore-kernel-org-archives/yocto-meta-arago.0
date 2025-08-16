Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 551B3CA0EED
	for <webhook@archiver.kernel.org>; Sat, 16 Aug 2025 00:36:49 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.25578.1755304603893986771
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 15 Aug 2025 17:36:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=qJXNFzK7;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: rs@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57G0aef72204830;
	Fri, 15 Aug 2025 19:36:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755304600;
	bh=Q7+9LMvtqfJl3l3rQ56ryBBxCnkSVz5GqvBd0ZaTqtg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=qJXNFzK7rW3ZJ0ul1lq0II5/XX9JRGKppF3u2YdVHF5GeUPflnEj3ey75g4yFhRDR
	 k5oBl3vrG3UrJqywJZPO8rlDR59pL78VzkQu2UYbMqb2GyRp2PkIb+MkKhOzAHNBkI
	 RUXKoh05k4k8g7fNoAfOkGzdEplxYGwwBDRIRLwA=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57G0aeGA2949993
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 15 Aug 2025 19:36:40 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 15
 Aug 2025 19:36:40 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 15 Aug 2025 19:36:40 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57G0adur1743917;
	Fri, 15 Aug 2025 19:36:39 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>, <jcormier@criticallink.com>
Subject: [oe-layersetup][PATCH 1/5] kas: yamllint: documents should have an explicit start
Date: Fri, 15 Aug 2025 19:36:16 -0500
Message-ID: <20250816003620.2112669-2-rs@ti.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250816003620.2112669-1-rs@ti.com>
References: <20250816003620.2112669-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sat, 16 Aug 2025 00:36:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16489

From: Randolph Sapp <rs@ti.com>

YAML files should start with '---'. This is optional, but usually
recommended and yamllint checks for it by default.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 src/xslt/kas-templates.xslt | 3 ++-
 src/xslt/kas.xslt           | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/src/xslt/kas-templates.xslt b/src/xslt/kas-templates.xslt
index 57277f1..f7aa24c 100644
--- a/src/xslt/kas-templates.xslt
+++ b/src/xslt/kas-templates.xslt
@@ -1,7 +1,8 @@
 <xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 <xsl:output method="text" omit-xml-declaration="yes" indent="no"/>
 
-<xsl:template match="/">header:
+<xsl:template match="/">---
+header:
   version: 17
 
 <xsl:apply-templates select='bblayers-conf-template'/>
diff --git a/src/xslt/kas.xslt b/src/xslt/kas.xslt
index 17c9f1d..6a0b251 100644
--- a/src/xslt/kas.xslt
+++ b/src/xslt/kas.xslt
@@ -1,7 +1,8 @@
 <xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 <xsl:output method="text" omit-xml-declaration="yes" indent="no"/>
 <xsl:template match="/">
-<xsl:text>header:
+<xsl:text>---
+header:
   version: 17
   includes:
 </xsl:text>
-- 
2.50.1


