Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 279C5E77199
	for <webhook@archiver.kernel.org>; Thu,  9 Jan 2025 14:27:19 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.48874.1736432833274561038
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 09 Jan 2025 06:27:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=HHwE1WAu;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 509ERBZV081111;
	Thu, 9 Jan 2025 08:27:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736432831;
	bh=A8jiPMIwHWRMMDqNo6IQOyE6ON4JsZPvimvVKnem0aY=;
	h=From:To:Subject:Date;
	b=HHwE1WAu6Bn1zYp0j/peMKYitg7jF05Lo8VcpS0Tga4IKn89uhzoPo8OHD0fa/ZJG
	 XNuXMGI8MT4BiMCI6nNtFjIvZaieh0hAz9IISXfzrjNIv+SSRUHcEdQIuDrbbctQF4
	 +/xacKybMRAm2fpU62pUiJ+PniTxy7Mwsvdhah/E=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 509ERBVt004640
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 9 Jan 2025 08:27:11 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 9
 Jan 2025 08:27:11 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 9 Jan 2025 08:27:11 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 509ERBRn005324;
	Thu, 9 Jan 2025 08:27:11 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tVtV9-0005aF-4N; Thu, 09 Jan 2025 08:27:11 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/scarthgap][PATCH] ti-test: Add kms++
Date: Thu, 9 Jan 2025 08:27:11 -0600
Message-ID: <20250109142711.21423-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 09 Jan 2025 14:27:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15688

Our testing also requires kms++ as a testing tool.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-test/recipes-core/packagegroups/ti-test.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
index e69421cf..2b6ec55d 100644
--- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
@@ -27,6 +27,8 @@ TI_TEST_BASE = "\
     iperf3 \
     kernel-modules \
     kernel-selftest \
+    kms++ \
+    kms++-python \
     libdrm-tests \
     linuxptp \
     lmbench \
-- 
2.17.1


