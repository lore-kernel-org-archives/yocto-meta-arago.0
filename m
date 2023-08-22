Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE7AAEE49AB
	for <webhook@archiver.kernel.org>; Tue, 22 Aug 2023 22:44:46 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.9913.1692744277196231964
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 22 Aug 2023 15:44:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=XKRejj3g;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 37MMiUZ8023648;
	Tue, 22 Aug 2023 17:44:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1692744270;
	bh=m3ELbS8ElsP71He8ZL+TuSE56X9+lNAXV7Lle8ntTFM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=XKRejj3g9uHUJfDpio/Kjg1hiXSkG9CXxQm14futhQjQr+JLMAAreTt2nA0aEClqW
	 1KyGT/qjm5nP/uiND/0jofqpV8h2F7xHsiXEH5AiAAF4koF3lsm5hYf0tv6DQwhhCC
	 OXwh+pimRyDB/+0Aiqpd+abMT5MMUVSCJCC3fmFA=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 37MMiUn9130869
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Aug 2023 17:44:30 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 22
 Aug 2023 17:44:30 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 22 Aug 2023 17:44:30 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 37MMiUqZ056368;
	Tue, 22 Aug 2023 17:44:30 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-arago][kirkstone/master][PATCHv2 2/3] packagegroup-arago-base: edit the description to describe current use
Date: Tue, 22 Aug 2023 17:38:30 -0500
Message-ID: <20230822224427.1880115-3-rs@ti.com>
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
 <meta-arago@lists.yoctoproject.org>; Tue, 22 Aug 2023 22:44:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14865

From: Randolph Sapp <rs@ti.com>

Edit the description of this packagegroup to more accurately describe
it's current use in this dependency web. Additionally convert the
DESCRIPTION to SUMMARY, since this is under 72 characters and not full,
long description.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-base.bb       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
index ff32112a..1f63a7d0 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Basic task to get a device booting"
+SUMMARY = "Base tools that are recommended for most images"
 LICENSE = "MIT"
 PR = "r9"
 
-- 
2.41.0


