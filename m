Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22B2CEB64D7
	for <webhook@archiver.kernel.org>; Tue, 20 Jun 2023 21:02:59 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.1340.1687294973937506107
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 20 Jun 2023 14:02:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=mH2zfoG9;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35KL2n4b123870;
	Tue, 20 Jun 2023 16:02:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687294969;
	bh=edgTQgz7w0SE55ANaAAfn1bmt+ey5n6j95BDujAMX0I=;
	h=From:To:CC:Subject:Date;
	b=mH2zfoG9dhDesdJxUKtPa3CyXqHDJKi86Tyc86oOjCAh3qRe6nzwpogaivdJiU10l
	 S0aD8vzlVWTEIHe+oa7nrw+uSkgsgEsjDE74y95/1Xg0CC7biXPc5mO04kq1uEoJPd
	 61iMpagCydv+7r/lxYZo+apRMdRymiqKk1Qd7mZg=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35KL2nhA004829
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 20 Jun 2023 16:02:49 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 20
 Jun 2023 16:02:49 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 20 Jun 2023 16:02:49 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35KL2njM108053;
	Tue, 20 Jun 2023 16:02:49 -0500
From: <rs@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>, <afd@ti.com>, <b-brnich@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-arago][master/kirkstone][PATCH] ti-test-extras: add numpy for multimedia tests
Date: Tue, 20 Jun 2023 16:01:00 -0500
Message-ID: <20230620210059.1789748-2-rs@ti.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 20 Jun 2023 21:02:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14661

From: Randolph Sapp <rs@ti.com>

Add python3-numpy to the ti-test-extras for advanced multimedia testing.

Signed-off-by: Randolph Sapp <rs@ti.com>
---

Brandon needs this package for some multimedia packages and it's python
related so I'm adding it to the big test group to be safe.

 meta-arago-distro/recipes-core/packagegroups/ti-test.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
index f97ad756..793eb583 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
@@ -41,6 +41,7 @@ ARAGO_TEST = "\
 "
 
 ARAGO_TEST_EXTRAS = " \
+    python3-numpy \
     piglit \
     ${@bb.utils.contains("DISTRO_FEATURES", "opengl", "opengl-es-cts", "", d)} \
     ${@bb.utils.contains("DISTRO_FEATURES", "vulkan", "vulkan-cts", "", d)} \
-- 
2.41.0


