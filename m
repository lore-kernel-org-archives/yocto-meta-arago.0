Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 878C4C83F1B
	for <webhook@archiver.kernel.org>; Fri, 11 Jul 2025 14:26:18 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.15119.1752243972506732186
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 11 Jul 2025 07:26:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=fiDMcFfZ;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: a-christidis@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56BEQBJe1456929
	for <meta-arago@lists.yoctoproject.org>; Fri, 11 Jul 2025 09:26:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752243971;
	bh=nj7QDHwJ4M63Ad35eqzrWvXb1kkjwPG1JiDg5r68LvU=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=fiDMcFfZ/qD3sbfffxrWbG9NDnLQjyRddVxg5rpKasvoReK5JBzRrjfwiiGQr7o8c
	 PzXtTECpSYSfqH4lLXBEEjNN1C2HuSiGrEmsuPE1PLQITwdnSnyXFsOfny4yC009Mx
	 jnJ0+11HNBZftZcuO2vW2xfE+3nycywtmsvmP06I=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56BEQBoQ2368216
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Fri, 11 Jul 2025 09:26:11 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 11
 Jul 2025 09:26:11 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 11 Jul 2025 09:26:11 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56BEQBwt3626506;
	Fri, 11 Jul 2025 09:26:11 -0500
From: <a-christidis@ti.com>
To: <rs@ti.com>, <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/scarthgap][2/2] meta-arago-test: packagegroups: Add off-screen demo to ti-test packagegroup
Date: Fri, 11 Jul 2025 09:26:11 -0500
Message-ID: <20250711142611.3567574-3-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250711142611.3567574-1-a-christidis@ti.com>
References: <20250711142611.3567574-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 11 Jul 2025 14:26:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16285

From: Antonios Christidis <a-christidis@ti.com>

Add the off-screen demo to ti-test package group.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
 meta-arago-test/recipes-core/packagegroups/ti-test.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
index a50c71e2..fb4c3e4c 100644
--- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
@@ -70,6 +70,7 @@ TI_TEST_EXTRAS = " \
     piglit \
     python3-numpy \
     wayland-utils \
+    offscreendemo \
     opencl-cts \
 "
 
-- 
2.34.1


