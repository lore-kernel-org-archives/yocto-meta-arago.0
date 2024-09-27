Return-Path: <s-vadapalli@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ED34CEBF86
	for <webhook@archiver.kernel.org>; Fri, 27 Sep 2024 08:46:43 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.64737.1727426799552804950
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 27 Sep 2024 01:46:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Jj/wZMJc;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: s-vadapalli@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 48R8kcSe053492;
	Fri, 27 Sep 2024 03:46:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1727426798;
	bh=5LS8kcYDkq6meecehv8K7CBJkIiYwiFqYnVTVupg2l4=;
	h=From:To:CC:Subject:Date;
	b=Jj/wZMJcCmySp1RstKFRjaGREIw8c6Rc6h6hA/fNPul3Zy3SApGS9x7nzC/YeXdDJ
	 A2ipHev4F+LpmDtWtAmpwqdOxO32EtIkuWTwXT7S9wBCgtEl7eMq3hYFbRWODpFFR+
	 RDGX+CN10gfAjXak+IuQv5OGk15OqgWbu4TOJI0c=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 48R8kcuP123346
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 27 Sep 2024 03:46:38 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 27
 Sep 2024 03:46:37 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 27 Sep 2024 03:46:37 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.81])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 48R8kZvF103490;
	Fri, 27 Sep 2024 03:46:36 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
CC: <s-vadapalli@ti.com>
Subject: [meta-arago][master/scarthgap][PATCH] packagegroup-arago-base: Add lldpd package
Date: Fri, 27 Sep 2024 14:16:35 +0530
Message-ID: <20240927084635.1182552-1-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 27 Sep 2024 08:46:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15561

Add the lldpd package to support LLDP (Link Layer Discovery Protocol).

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-base.bb        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
index 8b37aab9..121fa432 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
@@ -49,6 +49,7 @@ ARAGO_EXTRA = "\
     nfs-utils-client \
     cifs-utils \
     phytool \
+    lldpd \
 "
 
 OPTEE_PKGS = " \
-- 
2.40.1


