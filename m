Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D602FC28B30
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 01:42:16 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.11672.1742521336389639009
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 20 Mar 2025 18:42:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Nq/YTefX;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52L1gCSs788087
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 20 Mar 2025 20:42:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742521332;
	bh=4uB/nWJXN/EtWr8WR3vqamCkIYQcu1yHLGU0xH8MY0c=;
	h=From:To:CC:Subject:Date;
	b=Nq/YTefXJ50Myf8TGi9WFiXZybO+e9MQ3CqV7VLwIGwDKWEMA9kApNI5puYLeohy1
	 sUXGZfT/Z4pLu6Z7mXJMQaalcYcEO4qcgAQSSk8rd9NHOXKoxy46/+8sJP0nDStqgZ
	 HoblrrtXOAl91672Ge8CQIclqOokUoLVBbuWl0Mg=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52L1gCvG019284
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 20 Mar 2025 20:42:12 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 20
 Mar 2025 20:42:12 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 20 Mar 2025 20:42:12 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52L1gCRM082603;
	Thu, 20 Mar 2025 20:42:12 -0500
From: <rs@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>
Subject: [meta-arago][scarthgap][PATCH] emptty: use of append in build flags
Date: Thu, 20 Mar 2025 20:42:05 -0500
Message-ID: <20250321014205.3480034-1-rs@ti.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 21 Mar 2025 01:42:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16140

From: Randolph Sapp <rs@ti.com>

The use of append with GOBUILDFLAGS is mandatory. There is no reasonable
extra buildflags variable to use in this case, and using += will break
argument ordering.

Fixes: 67d7748a (emptty: address feedback around append usage, 2025-03-19)
Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta-arago-distro/recipes-graphics/emptty/emptty_0.13.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-graphics/emptty/emptty_0.13.0.bb b/meta-arago-distro/recipes-graphics/emptty/emptty_0.13.0.bb
index ce84898c..412ad729 100644
--- a/meta-arago-distro/recipes-graphics/emptty/emptty_0.13.0.bb
+++ b/meta-arago-distro/recipes-graphics/emptty/emptty_0.13.0.bb
@@ -28,7 +28,7 @@ GO_TAGS = ""
 GO_TAGS:append = "${@bb.utils.contains('PACKAGECONFIG', 'pam', '', ',nopam', d)}"
 GO_TAGS:append = "${@bb.utils.contains('PACKAGECONFIG', 'x11', '', ',noxlib', d)}"
 
-GOBUILDFLAGS += "-tags=${GO_TAGS}"
+GOBUILDFLAGS:append = " -tags=${GO_TAGS}"
 
 export GO111MODULE="off"
 
-- 
2.48.1


