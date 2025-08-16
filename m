Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A9DFCA0EE4
	for <webhook@archiver.kernel.org>; Sat, 16 Aug 2025 00:36:49 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.25762.1755304603485960165
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 15 Aug 2025 17:36:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=I+82f10Q;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: rs@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57G0aeNa2260729;
	Fri, 15 Aug 2025 19:36:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755304600;
	bh=hw2tTrd7zPQivAPzsaGNGwhI4NAMvmX2ayT69/RQ5YA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=I+82f10QWHp2K3qAwPmqZCWYyA2erGAqUCYpe494ocmbFRrLgaIMBQtchx5cKBgIw
	 SMkgDJLSP7v1fibCUDEoGb4cqAZuoXf9YkHws0k/lybvVWQ/E82ZCmA35VScN/Uv7C
	 A5N0CuLEEEe4vx1BPaYR1OAmWBm1XhKIcrHO4Cj8=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57G0aegh1986710
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 15 Aug 2025 19:36:40 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 15
 Aug 2025 19:36:40 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 15 Aug 2025 19:36:40 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57G0adut1743917;
	Fri, 15 Aug 2025 19:36:40 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>, <jcormier@criticallink.com>
Subject: [oe-layersetup][PATCH 3/5] kas: yamllint: too many blank lines
Date: Fri, 15 Aug 2025 19:36:18 -0500
Message-ID: <20250816003620.2112669-4-rs@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16485

From: Randolph Sapp <rs@ti.com>

There should be no blank lines at the end of the document. This means
whitespace should be added based on anchor elements, such as the
document header.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 src/xslt/kas-templates.xslt | 17 +++++++++--------
 src/xslt/kas.xslt           | 11 +++++------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/src/xslt/kas-templates.xslt b/src/xslt/kas-templates.xslt
index c6d5782..1ec6bf3 100644
--- a/src/xslt/kas-templates.xslt
+++ b/src/xslt/kas-templates.xslt
@@ -12,13 +12,13 @@ header:
 <xsl:template match='bblayers-conf-template'>
 <xsl:text>bblayers_conf_header:
 </xsl:text>
-<xsl:text>  oe-layersetup-bblayers-conf-template: |
-</xsl:text>
+<xsl:text>  oe-layersetup-bblayers-conf-template: |</xsl:text>
 <xsl:for-each select='line'>
+<xsl:text>
+</xsl:text>
 <xsl:variable name='normal-line' select='normalize-space(text())'/>
 <xsl:if test='string-length($normal-line) > 0'>
-<xsl:text>    </xsl:text><xsl:value-of select='text()'/><xsl:text>
-</xsl:text>
+<xsl:text>    </xsl:text><xsl:value-of select='text()'/>
 </xsl:if>
 </xsl:for-each>
 <xsl:text>
@@ -28,13 +28,14 @@ header:
 <xsl:template match='local-conf-template'>
 <xsl:text>local_conf_header:
 </xsl:text>
-<xsl:text>  oe-layersetup-local-conf-template: |
-</xsl:text>
+<xsl:text>  oe-layersetup-local-conf-template: |</xsl:text>
 <xsl:for-each select='line'>
+<xsl:text>
+</xsl:text>
 <xsl:variable name='normal-line' select='normalize-space(text())'/>
 <xsl:if test='string-length($normal-line) > 0'>
-<xsl:text>    </xsl:text><xsl:value-of select='text()'/><xsl:text>
-</xsl:text>
+<xsl:text>    </xsl:text><xsl:value-of select='text()'/>
+</xsl:if>
 </xsl:for-each>
 <xsl:apply-templates select='/config/local-conf'/>
 <xsl:text>
diff --git a/src/xslt/kas.xslt b/src/xslt/kas.xslt
index 6a0b251..cb0b9a4 100644
--- a/src/xslt/kas.xslt
+++ b/src/xslt/kas.xslt
@@ -12,9 +12,9 @@ header:
 </xsl:text>
 <xsl:text>target: </xsl:text><xsl:value-of select='config/targets/default/text()'/><xsl:text>
 </xsl:text>
+<xsl:if test='config/bitbake|config/repos'>
 <xsl:text>
 </xsl:text>
-<xsl:if test='config/bitbake|config/repos'>
 <xsl:call-template name='repos'/>
 </xsl:if>
 <xsl:apply-templates select='config/local-conf'/>
@@ -38,11 +38,11 @@ header:
 </xsl:text>
 <xsl:text>      .: disabled
 </xsl:text>
-<xsl:text>
-</xsl:text>
 </xsl:template>
 
 <xsl:template match='config/repos/repo'>
+<xsl:text>
+</xsl:text>
 <xsl:text>  </xsl:text><xsl:value-of select='@name'/><xsl:text>:
 </xsl:text>
 <xsl:text>    url: "</xsl:text><xsl:value-of select='@url'/><xsl:text>"
@@ -54,8 +54,6 @@ header:
 </xsl:text>
 </xsl:if>
 <xsl:apply-templates select='layers'/>
-<xsl:text>
-</xsl:text>
 </xsl:template>
 
 <xsl:template match='config/repos/repo/layers'>
@@ -79,7 +77,8 @@ header:
 </xsl:template>
 
 <xsl:template match='config/local-conf'>
-<xsl:text>local_conf_header:
+<xsl:text>
+local_conf_header:
   oe-layersetup-local-conf-config-specific: |
 </xsl:text>
 <xsl:for-each select='line'>
-- 
2.50.1


