Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AF38CA0EEB
	for <webhook@archiver.kernel.org>; Sat, 16 Aug 2025 00:36:49 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.25763.1755304603784152842
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 15 Aug 2025 17:36:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=p0b61VoD;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: rs@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57G0aeIi2628267;
	Fri, 15 Aug 2025 19:36:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755304600;
	bh=Q0t5mVwhQy/WGBLv1H0ghxLQECG5cpPRksH9lt4n/Yk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=p0b61VoDxnyTsi1WdKf2QIMnxwGue60cbus0D/xowEVYQKQli7NOS4nGk9lJX/AN7
	 X+sGhXy5kjD51F3sAteZ2CZNf2nAKXs7NCKybnoeRxm3JRCGBUoRywSfRP+lAhlI7v
	 evXfx0gWnL3xLsEgGnfP/MHr/wEXp4+o+vWH5lPI=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57G0aeBT1986707
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 15 Aug 2025 19:36:40 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 15
 Aug 2025 19:36:40 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 15 Aug 2025 19:36:39 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57G0aduu1743917;
	Fri, 15 Aug 2025 19:36:40 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>, <jcormier@criticallink.com>
Subject: [oe-layersetup][PATCH 4/5] kas: do not add a default target if one is not given
Date: Fri, 15 Aug 2025 19:36:19 -0500
Message-ID: <20250816003620.2112669-5-rs@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16487

From: Randolph Sapp <rs@ti.com>

There are configs, such as the distroless configs, that may not specify
a default target. In those cases we should not have a "target" key in
our kas config. An unspecified target is fine, but an empty target is a
violation of their schema.

Detected through the use of yamllint's trailing whitespace check.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 src/xslt/kas.xslt | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/src/xslt/kas.xslt b/src/xslt/kas.xslt
index cb0b9a4..4a9fe62 100644
--- a/src/xslt/kas.xslt
+++ b/src/xslt/kas.xslt
@@ -8,10 +8,7 @@ header:
 </xsl:text>
 <xsl:apply-templates select='config/bblayers-conf-template'/>
 <xsl:apply-templates select='config/local-conf-template'/>
-<xsl:text>
-</xsl:text>
-<xsl:text>target: </xsl:text><xsl:value-of select='config/targets/default/text()'/><xsl:text>
-</xsl:text>
+<xsl:apply-templates select='config/targets/default'/>
 <xsl:if test='config/bitbake|config/repos'>
 <xsl:text>
 </xsl:text>
@@ -20,6 +17,12 @@ header:
 <xsl:apply-templates select='config/local-conf'/>
 </xsl:template>
 
+<xsl:template match='config/targets/default'>
+<xsl:text>
+target: </xsl:text><xsl:value-of select='text()'/><xsl:text>
+</xsl:text>
+</xsl:template>
+
 <xsl:template name='repos'>repos:
 <xsl:apply-templates select='config/bitbake'/>
 <xsl:apply-templates select='config/repos/repo[not(@disabled) or @disabled="no"]'/>
-- 
2.50.1


