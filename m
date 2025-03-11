Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C22CC282DE
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 00:42:24 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.3604.1741653735952393823
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 10 Mar 2025 17:42:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=A5CX5xn5;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52B0gD6v1045825
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 Mar 2025 19:42:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741653733;
	bh=NZXXFFKHAILGv+97loy/9X6r50bhiJFfpq+UBv3bjDI=;
	h=From:To:CC:Subject:Date;
	b=A5CX5xn5lsLmS/jzNUXTpk3Vnq0FRZr/f5YGWrOeFvFTJkKByPtobY+NC4O75OPoU
	 5G0oiYjGhGbTI1PbhW9KNSfQrIU72bLmAp1nnvS5Ko/COLb7bCLg2jidA8iu77N248
	 oaf1FGIaHsqv34w7N6FqBjl92K3HwPQ4XvaZxkA8=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52B0gDTZ032333
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 10 Mar 2025 19:42:13 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 10
 Mar 2025 19:42:12 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 10 Mar 2025 19:42:13 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52B0gCfb025171;
	Mon, 10 Mar 2025 19:42:12 -0500
From: <rs@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap/master][PATCH] packagegroup-arago-opencl: add clpeak
Date: Mon, 10 Mar 2025 19:41:57 -0500
Message-ID: <20250311004156.3208961-2-rs@ti.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 11 Mar 2025 00:42:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15966

From: Randolph Sapp <rs@ti.com>

Add clpeak as a useful tool to determine peak device CL capabilities.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-opencl.bb      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-opencl.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-opencl.bb
index dd5b0f1e..185b0caf 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-opencl.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-opencl.bb
@@ -7,4 +7,5 @@ REQUIRED_DISTRO_FEATURES = "opencl"
 
 RDEPENDS:${PN} = "\
     clinfo \
+    clpeak \
 "
-- 
2.48.1


