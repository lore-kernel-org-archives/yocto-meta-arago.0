Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8502ECA100F
	for <webhook@archiver.kernel.org>; Mon, 22 Sep 2025 17:25:11 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.58538.1758561903553515129
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 22 Sep 2025 10:25:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=h72mW2UR;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58MHP2S31301382;
	Mon, 22 Sep 2025 12:25:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758561902;
	bh=+LWRGBQMei/izhG/YDpjaLdzk2ieS4QEYfbyX6/7P3M=;
	h=From:To:Subject:Date;
	b=h72mW2URvFG0FRRBxO5fOq1LPZ3t8r/SjRk8bHEzD6cDDAdwVS+aFcCRmIRYwNshg
	 eRC1UZqg6MUT8ubkcjWroNrcs6c7HEftHl5c4XtbNs6xKAC/HnAt1+kwKeHXM1D94M
	 marLFhzXm6zejIe+ZwrB6WESYmhudtH3eex9YODc=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58MHP2Vr1338859
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 22 Sep 2025 12:25:02 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 22
 Sep 2025 12:25:02 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 22 Sep 2025 12:25:02 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58MHP2ef3150672;
	Mon, 22 Sep 2025 12:25:02 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1v0kHd-0005eX-S9; Mon, 22 Sep 2025 12:25:01 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] ti-test: Make opencl-cts dependent on DISTRO_FEATURES
Date: Mon, 22 Sep 2025 12:25:01 -0500
Message-ID: <20250922172501.21690-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 22 Sep 2025 17:25:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16608

The opencl-cts recipe now requires that DISTRO_FEATURES include "opencl"
to build [1].  We need the same kind of check to not include that recipe
if opencl is not enabled for the distro.

[1] https://git.openembedded.org/meta-openembedded/commit/?id=f65ae714d885a99b89c17088842aa9724ba29b16

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-test/recipes-core/packagegroups/ti-test.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
index cc194a45..71122d78 100644
--- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
@@ -73,7 +73,7 @@ TI_TEST_EXTRAS = " \
     python3-numpy \
     wayland-utils \
     offscreendemo \
-    opencl-cts \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'opencl', 'opencl-cts', '', d)} \
 "
 
 TI_TEST_BASE:append:armv7a = " \
-- 
2.17.1


