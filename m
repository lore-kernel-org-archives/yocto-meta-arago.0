Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73D72CA0EDC
	for <webhook@archiver.kernel.org>; Thu, 14 Aug 2025 23:30:26 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.277.1755214222482430195
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 14 Aug 2025 16:30:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=YgNHQvBQ;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: rs@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57ENUJ2v2485556;
	Thu, 14 Aug 2025 18:30:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755214219;
	bh=PJiLHRirnFAhIIuO0h/rth46vLB2VMSe3rakyaA1v+Y=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=YgNHQvBQ7nl2SifzO5v8bN2DbHUZHAtfJ/nZn+uIPiSvPQeEBEftFd8+a5fsb1Glg
	 g/rr5zUx6x4AwWJ3sje5Tm45iOf1xTcnL+T1pjD6Ms5O0ruU0HnalCw+RKtQ83xiv0
	 TEx6Ps7QUynfowZrpUPj4/kDeEKwThU72RjaB7UA=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57ENUJbw2173936
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 14 Aug 2025 18:30:19 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 14
 Aug 2025 18:30:19 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 14 Aug 2025 18:30:19 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57ENUInc458115;
	Thu, 14 Aug 2025 18:30:19 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>
CC: <a-christidis@ti.com>, <meta-arago@lists.yoctoproject.org>, <nm@ti.com>
Subject: [oe-layersetup][PATCH 1/2] kas: fetch bitbake as part of the setup
Date: Thu, 14 Aug 2025 18:29:54 -0500
Message-ID: <20250814232955.1559040-2-rs@ti.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250814232955.1559040-1-rs@ti.com>
References: <20250814232955.1559040-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 14 Aug 2025 23:30:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16471

From: Randolph Sapp <rs@ti.com>

We can get kas to fetch it's own version of bitbake with a little
coercion. Adjust the template to populate the appropriate repo section
for bitbake.

This behaves like any other repo definition, with the key difference
being it has no enabled layers. This means you must explicitly set the
root layer "." to disabled.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 src/xslt/kas.xslt | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/src/xslt/kas.xslt b/src/xslt/kas.xslt
index 7e1dea4..17c9f1d 100644
--- a/src/xslt/kas.xslt
+++ b/src/xslt/kas.xslt
@@ -13,12 +13,32 @@
 </xsl:text>
 <xsl:text>
 </xsl:text>
-<xsl:apply-templates select='config/repos'/>
+<xsl:if test='config/bitbake|config/repos'>
+<xsl:call-template name='repos'/>
+</xsl:if>
 <xsl:apply-templates select='config/local-conf'/>
 </xsl:template>
 
-<xsl:template match='config/repos'>repos:
-<xsl:apply-templates select='repo[not(@disabled) or @disabled="no"]'/>
+<xsl:template name='repos'>repos:
+<xsl:apply-templates select='config/bitbake'/>
+<xsl:apply-templates select='config/repos/repo[not(@disabled) or @disabled="no"]'/>
+</xsl:template>
+
+<xsl:template match='config/bitbake'>  bitbake:
+<xsl:text>    url: "</xsl:text><xsl:value-of select='@url'/><xsl:text>"
+</xsl:text>
+<xsl:text>    branch: "</xsl:text><xsl:value-of select='@branch'/><xsl:text>"
+</xsl:text>
+<xsl:if test='@commit != "HEAD"'>
+<xsl:text>    commit: "</xsl:text><xsl:value-of select='@commit'/><xsl:text>"
+</xsl:text>
+</xsl:if>
+<xsl:text>    layers:
+</xsl:text>
+<xsl:text>      .: disabled
+</xsl:text>
+<xsl:text>
+</xsl:text>
 </xsl:template>
 
 <xsl:template match='config/repos/repo'>
-- 
2.50.1


