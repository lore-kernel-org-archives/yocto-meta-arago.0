Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54E5FCA0EEC
	for <webhook@archiver.kernel.org>; Sat, 16 Aug 2025 00:36:49 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.25577.1755304603882937773
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 15 Aug 2025 17:36:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=BtuO5y0p;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: rs@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57G0aehD2628271;
	Fri, 15 Aug 2025 19:36:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755304600;
	bh=HyYRDScR/+dEXzH5cvjExh3MIFYCZ6ZgBSEnQtOAlS8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=BtuO5y0pzxBu8ymLuNW5Pj60AIWF4E74720eqq8N3kLyuMYLri8JiEXJowcVlKFpv
	 h57MitwnHOhRj8h485OAPd7AVG4n2nHOsHLk4/Z4ka7RVlMyg0YnFeoJYS72DkHLzy
	 tbHweCeShatjBmNzhdX7ZH4OsQog8n2Gjr1VZJ0s=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57G0aemc2264638
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 15 Aug 2025 19:36:40 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 15
 Aug 2025 19:36:40 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 15 Aug 2025 19:36:40 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57G0adus1743917;
	Fri, 15 Aug 2025 19:36:40 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>, <jcormier@criticallink.com>
Subject: [oe-layersetup][PATCH 2/5] kas: yamllint: trailing whitespace
Date: Fri, 15 Aug 2025 19:36:17 -0500
Message-ID: <20250816003620.2112669-3-rs@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16488

From: Randolph Sapp <rs@ti.com>

Lines should not have trailing whitespace. Currently the only trailing
whitespace we have is the result of for-each loops processing empty
lines.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 src/xslt/kas-templates.xslt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/src/xslt/kas-templates.xslt b/src/xslt/kas-templates.xslt
index f7aa24c..c6d5782 100644
--- a/src/xslt/kas-templates.xslt
+++ b/src/xslt/kas-templates.xslt
@@ -15,8 +15,11 @@ header:
 <xsl:text>  oe-layersetup-bblayers-conf-template: |
 </xsl:text>
 <xsl:for-each select='line'>
+<xsl:variable name='normal-line' select='normalize-space(text())'/>
+<xsl:if test='string-length($normal-line) > 0'>
 <xsl:text>    </xsl:text><xsl:value-of select='text()'/><xsl:text>
 </xsl:text>
+</xsl:if>
 </xsl:for-each>
 <xsl:text>
 </xsl:text>
@@ -28,6 +31,8 @@ header:
 <xsl:text>  oe-layersetup-local-conf-template: |
 </xsl:text>
 <xsl:for-each select='line'>
+<xsl:variable name='normal-line' select='normalize-space(text())'/>
+<xsl:if test='string-length($normal-line) > 0'>
 <xsl:text>    </xsl:text><xsl:value-of select='text()'/><xsl:text>
 </xsl:text>
 </xsl:for-each>
-- 
2.50.1


