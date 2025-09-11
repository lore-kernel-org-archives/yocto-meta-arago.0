Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 710BACAC587
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 20:06:34 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.7173.1757621192786550327
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 11 Sep 2025 13:06:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=YKciRIL6;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58BK6UcO820852;
	Thu, 11 Sep 2025 15:06:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757621191;
	bh=SUhRzeBRLhPCxgt4sjk4sTbNsbWqUyjisu3vDCh8IQg=;
	h=From:To:Subject:Date;
	b=YKciRIL6Ok3e7Tq/BV/yr5m2BZeev2bAO2TzKqFtRWaWEkC1D931xM+3RFosvpNxl
	 EKhn/dNU1vabfVpVf29oZs11+1DCt1qhMmp815we5LzJgtzQS1kw/P81u66u5Lfgj8
	 46CROrngkYkxLcpNqusZVsHkMnPhTt6b5RldYQO8=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58BK6Uie781831
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 11 Sep 2025 15:06:30 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 11
 Sep 2025 15:06:30 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 11 Sep 2025 15:06:30 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58BK6Ufu2484161;
	Thu, 11 Sep 2025 15:06:30 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1uwnYs-0000c6-Dq; Thu, 11 Sep 2025 15:06:30 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [oe-layersetup][master][PATCH] conf/layer: Add required BBFILE_PATTERN
Date: Thu, 11 Sep 2025 15:06:30 -0500
Message-ID: <20250911200630.2315-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 11 Sep 2025 20:06:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16566

The BBFILE_PATTERN-oe-layersetup variable is required for this is be a
correct layer.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 conf/layer.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/conf/layer.conf b/conf/layer.conf
index 9c6c9aa..7545d89 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -1,3 +1,4 @@
 BBFILE_COLLECTIONS += "oe-layersetup"
+BBFILE_PATTERN_oe-layersetup := "^${LAYERDIR}/"
 LAYERVERSION_oe-layersetup = "1"
 LAYERSERIES_COMPAT_oe-layersetup = "kirkstone scarthgap styhead walnascar whinlatter"
-- 
2.17.1


