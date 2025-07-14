Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7236CC83F1B
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 18:35:24 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.85567.1752518119584782344
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 14 Jul 2025 11:35:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=aBSTjiA9;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: a-christidis@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56EIZJFp2712005
	for <meta-arago@lists.yoctoproject.org>; Mon, 14 Jul 2025 13:35:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752518119;
	bh=mI+ET609m79tqr3XPOXAGpcs0dekHCspqXirugNGWi4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=aBSTjiA9w2UbwMw/eww3ANELWHYZvW2AEYAgiqsfBy9Oa4angggv7wBjkQ8zX/DjK
	 3FQRy+uJ13TJ2YD8FF6Fpo/7wEKlLQgbJSYkmsOKfzoPNLwjUHhePSB9Q7eFfzaeQO
	 UsIiPLfcI5wUqf77qWXz0yIRp2VFAy4pm7KXnzyU=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56EIZJ5O667740
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Mon, 14 Jul 2025 13:35:19 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 14
 Jul 2025 13:35:18 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 14 Jul 2025 13:35:18 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56EIZIvA1246697;
	Mon, 14 Jul 2025 13:35:18 -0500
From: <a-christidis@ti.com>
To: <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <rs@ti.com>
Subject: [meta-arago][master][PATCH v2 2/2] meta-arago-test: packagegroups: Add off-screen demo to ti-test package group
Date: Mon, 14 Jul 2025 13:35:18 -0500
Message-ID: <20250714183518.1116312-3-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250714183518.1116312-1-a-christidis@ti.com>
References: <20250714183518.1116312-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 14 Jul 2025 18:35:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16298

From: Antonios Christidis <a-christidis@ti.com>

Add the off-screen demo to ti-test package group.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
 meta-arago-test/recipes-core/packagegroups/ti-test.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
index 1ca23878..c940ea27 100644
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


