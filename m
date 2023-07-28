Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 884BFC41513
	for <webhook@archiver.kernel.org>; Fri, 28 Jul 2023 00:20:43 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.22487.1690503636168498639
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 27 Jul 2023 17:20:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=SDXWlztv;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 36S0KYC3027741;
	Thu, 27 Jul 2023 19:20:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1690503634;
	bh=EvXyQfOejoW09MAUNo59vpoQOGusEVr/UJjMaMtFheA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=SDXWlztvsogDsLH+Xv6uQnYTauej2bD6fG4Z4c0Q1rIGeb9lSDgn3B2nx755BLW1i
	 WgHpNn+5GtudRTje32BaktDpbglGbi5I6ZJv6E47V7LIPQoGdOAS1Cd4tfgzsMkc1x
	 xDpya5M1XECwGD3LJnE7OQkXz6PmD6yVHEmPi+UQ=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 36S0KYWT081118
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 27 Jul 2023 19:20:34 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 27
 Jul 2023 19:20:34 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 27 Jul 2023 19:20:34 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 36S0KYfF025363;
	Thu, 27 Jul 2023 19:20:34 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>
CC: <afd@ti.com>, <nm@ti.com>, <meta-arago@lists.yoctoproject.org>,
        Randolph
 Sapp <rs@ti.com>
Subject: [meta-arago][kirkstone/master][PATCH 3/5] irqbalance: remove append to install systemd script
Date: Thu, 27 Jul 2023 19:20:30 -0500
Message-ID: <20230728002032.853330-4-rs@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14808

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


