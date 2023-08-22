Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E911BEE49AE
	for <webhook@archiver.kernel.org>; Tue, 22 Aug 2023 22:44:46 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.9895.1692744276961378287
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 22 Aug 2023 15:44:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=dwtZmc45;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 37MMiUMg122170;
	Tue, 22 Aug 2023 17:44:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1692744270;
	bh=EvXyQfOejoW09MAUNo59vpoQOGusEVr/UJjMaMtFheA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=dwtZmc45ZJYENWPad6rqCpWSqCjuYdOkCTHvpZaqxMzqS3/UBwbdfHWACJqslf+tt
	 z/9hoR6gk7BK8oSwD4ooIi6ZYUzZgoysTfijeYemJDwZ0uPP2iVGR7z2yw1SR1AiG1
	 Lnosqb+5OvpChHB2jseJc6WJMOBqb1eTNX6/4N5E=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 37MMiUfx048319
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Aug 2023 17:44:30 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 22
 Aug 2023 17:44:30 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 22 Aug 2023 17:44:30 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 37MMiUqa056368;
	Tue, 22 Aug 2023 17:44:30 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-arago][kirkstone/master][PATCHv2 3/3] irqbalance: remove append to install systemd script
Date: Tue, 22 Aug 2023 17:38:31 -0500
Message-ID: <20230822224427.1880115-4-rs@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14864

From: Randolph Sapp <rs@ti.com>

The source recipe that this file appends to already has the
corresponding logic to install both the systemd and sysvinit service and
set them to load on start. No reason to override them.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../recipes-extended/irqbalance/irqbalance_git.bbappend     | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta-arago-distro/recipes-extended/irqbalance/irqbalance_git.bbappend b/meta-arago-distro/recipes-extended/irqbalance/irqbalance_git.bbappend
index ff504150..7c289fc1 100644
--- a/meta-arago-distro/recipes-extended/irqbalance/irqbalance_git.bbappend
+++ b/meta-arago-distro/recipes-extended/irqbalance/irqbalance_git.bbappend
@@ -1,8 +1,4 @@
 SRCREV = "c24ed221e9e82faf1ad22de133c3c97a0117c5d7"
-PV = "1.9.2"
-
-do_install:append () {
-         install -m 0644 ${S}/misc/irqbalance.service ${D}${systemd_unitdir}/system/irqbalanced.service
-}
+PV = "1.9.2+git${SRCPV}"
 
 PR:append = ".arago3"
-- 
2.41.0


