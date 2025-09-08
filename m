Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B956CAC581
	for <webhook@archiver.kernel.org>; Mon,  8 Sep 2025 18:56:08 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.3047.1757357761692397673
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 08 Sep 2025 11:56:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=jsievZRc;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: a-christidis@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 588Iu199115700
	for <meta-arago@lists.yoctoproject.org>; Mon, 8 Sep 2025 13:56:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757357761;
	bh=F1xnMkFGYJ3Do7ELiN5SgTwnrpo4mCGf/3GzXDdWcDY=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=jsievZRcPLJM66IOibD91EGPldkfZIy1QNd/eav9axog/W2nK+dN/541HCRsog+14
	 9op5YxufAjWMz82In3DZaIUhqzDWwfONA/EHtEKLl/MFHdk4lkKgHBPZV/o3kNziM9
	 f0lcBkLIylwH9W/Z2DFDDUepLAitqZhqf/EKoTOw=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 588Iu1kH3160505
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Mon, 8 Sep 2025 13:56:01 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 8
 Sep 2025 13:56:00 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 8 Sep 2025 13:56:00 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 588Iu0aG1367803;
	Mon, 8 Sep 2025 13:56:00 -0500
From: <a-christidis@ti.com>
To: <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH v3 2/3] opencl-headers: Specify  correct PV
Date: Mon, 8 Sep 2025 13:55:59 -0500
Message-ID: <20250908185600.152317-3-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250908185600.152317-1-a-christidis@ti.com>
References: <20250908185600.152317-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 08 Sep 2025 18:56:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16547

From: Antonios Christidis <a-christidis@ti.com>

With the .bbappend and .inc file, the version of the headers is
increased. So, specify the correct PV of the headers.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
v3:
- Changed the subject tag from master to scarthgap
- Simplified subject

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


