Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CEADCA1013
	for <webhook@archiver.kernel.org>; Fri,  5 Sep 2025 23:38:56 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.2270.1757115531213803351
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 05 Sep 2025 16:38:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=RJjMDO/R;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: a-christidis@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 585NcovX3855638
	for <meta-arago@lists.yoctoproject.org>; Fri, 5 Sep 2025 18:38:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757115530;
	bh=35hOCviEGBxovI2/B6CZDClQ05ossAuALQW+Uf1Fyco=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=RJjMDO/RaIoN+JSTsRyv7ZL0cApXLYFeOpPDisAXVBf4Pmw8npYUjEgeBK6MMufb0
	 13Be3ZYUVk6NC7jCt6D7/sJDTDP981gEyCpZ2P7HFruBQg2aPtEktCHHUn5e2EQNHy
	 BGvzJcJeL/tmmKUTLryOubjI5TWjcgy/qhUYfVvY=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 585NcowO1232704
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Fri, 5 Sep 2025 18:38:50 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 5
 Sep 2025 18:38:50 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 5 Sep 2025 18:38:50 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 585Nco9X1174327;
	Fri, 5 Sep 2025 18:38:50 -0500
From: <a-christidis@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>
Subject: [meta-arago][master][PATCH v2 2/3] meta-arago-test: recipes-extended: Specify correct PV for OCL C headers
Date: Fri, 5 Sep 2025 18:38:48 -0500
Message-ID: <20250905233849.2506703-3-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250905233849.2506703-1-a-christidis@ti.com>
References: <20250905233849.2506703-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 05 Sep 2025 23:38:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16538

From: Antonios Christidis <a-christidis@ti.com>

With the .bbappend and .inc file, the version of the headers is
increased. So, specify the correct PV of the headers.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
 meta-arago-test/recipes-extended/opencl/opencl_headers-ti.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-test/recipes-extended/opencl/opencl_headers-ti.inc b/meta-arago-test/recipes-extended/opencl/opencl_headers-ti.inc
index 48335204..1216adf5 100644
--- a/meta-arago-test/recipes-extended/opencl/opencl_headers-ti.inc
+++ b/meta-arago-test/recipes-extended/opencl/opencl_headers-ti.inc
@@ -1,6 +1,7 @@
 inherit cmake
 
 SRCREV = "8275634cf9ec31b6484c2e6be756237cb583999d"
+PV = "2024.05.08"
 
 EXTRA_OECMAKE = "-DBUILD_TESTING=OFF"
 
-- 
2.34.1


