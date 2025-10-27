Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8BC2CCF9EA
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 22:25:54 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.4427.1761603952377339736
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 27 Oct 2025 15:25:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=xuTVxQql;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: a-christidis@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59RMPpLm1369713
	for <meta-arago@lists.yoctoproject.org>; Mon, 27 Oct 2025 17:25:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1761603951;
	bh=vLWnXlphuadrhE5SX0/SiXymssj9/Xs8LWYwclC/lsw=;
	h=From:To:Subject:Date;
	b=xuTVxQqlVaZm30R6LQH0i2n6/XTQYe9qB3nXSQhj9WVxLWKEnA99JXB+jR1sm5734
	 V+sFrYz815dA1kkX9HUSH2nNjQkGWbZNk4gPzi7g82V3sNztg+rYfVssLhDI+UYIvo
	 9F/KuIFDR78SeDSXwJs/+zRKlwrFjRV9ELbEgkzs=
Received: from DLEE211.ent.ti.com (dlee211.ent.ti.com [157.170.170.113])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59RMPpBn1942074
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Mon, 27 Oct 2025 17:25:51 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 27 Oct
 2025 17:25:51 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 27 Oct 2025 17:25:51 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59RMPpfh1364033;
	Mon, 27 Oct 2025 17:25:51 -0500
From: <a-christidis@ti.com>
To: <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH]  packagegroup-arago-tisdk-graphics-sdk-target: Add stb-dev
Date: Mon, 27 Oct 2025 17:25:51 -0500
Message-ID: <20251027222551.2445083-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 27 Oct 2025 22:25:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16705

From: Antonios Christidis <a-christidis@ti.com>

Add development files for stb.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
 .../packagegroup-arago-tisdk-graphics-sdk-target.bb              | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
index 28f123c8..4e792845 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
@@ -19,4 +19,5 @@ RDEPENDS:${PN} = "\
     libsdl2-dev \
     ktx-software-dev \
     nlohmann-json-dev \
+    stb-dev \
 "
-- 
2.34.1


