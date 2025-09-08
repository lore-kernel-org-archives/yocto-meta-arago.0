Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59104CAC585
	for <webhook@archiver.kernel.org>; Mon,  8 Sep 2025 18:56:08 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.3049.1757357762957366820
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 08 Sep 2025 11:56:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=M4lv6EdD;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: a-christidis@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 588Iu18f3928510
	for <meta-arago@lists.yoctoproject.org>; Mon, 8 Sep 2025 13:56:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757357761;
	bh=x+ZXt+mFe60bwzRmJvKZWWfh8U7+VkfMNSWUjM6tkWs=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=M4lv6EdDEUVHFGSCOvwX5KfMXQJxsCmIjVv4kagXJCjGjin4n8bms6U83Ok4yQGzE
	 RDDTdg5xHdb/8aIMkLo1zWItfgfOQ3Q8dIaWDQ/OlLUJNy0aC+LbDrztYvF8MOTj5G
	 InEMxYRZ7TO2be/gB7Q9PZdJH0tFQezcVHPWINik=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 588Iu1DK2602542
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Mon, 8 Sep 2025 13:56:01 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 8
 Sep 2025 13:56:00 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 8 Sep 2025 13:56:00 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 588Iu0aH1367803;
	Mon, 8 Sep 2025 13:56:00 -0500
From: <a-christidis@ti.com>
To: <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH v3 3/3] opencl-clhpp: opencl-clhpp  v2.0.16 -> v2024.05.08
Date: Mon, 8 Sep 2025 13:56:00 -0500
Message-ID: <20250908185600.152317-4-a-christidis@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16550

From: Antonios Christidis <a-christidis@ti.com>

Increase the version of the opencl c++ headers to v2024.05.08. This way
both c and c++ headers will be the same version.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
v3:
- Changed the subject tag from master to scarthgap
- Simplified subject

v2:
- Implemented the changes in a yocto compliant way, not by creating a new recipe outright

 .../recipes-extended/opencl/opencl-clhpp_%.bbappend        | 4 ++++
 .../recipes-extended/opencl/opencl_clhpp-ti.inc            | 7 +++++++
 2 files changed, 11 insertions(+)
 create mode 100644 meta-arago-test/recipes-extended/opencl/opencl-clhpp_%.bbappend
 create mode 100644 meta-arago-test/recipes-extended/opencl/opencl_clhpp-ti.inc

diff --git a/meta-arago-test/recipes-extended/opencl/opencl-clhpp_%.bbappend b/meta-arago-test/recipes-extended/opencl/opencl-clhpp_%.bbappend
new file mode 100644
index 00000000..6e486f4c
--- /dev/null
+++ b/meta-arago-test/recipes-extended/opencl/opencl-clhpp_%.bbappend
@@ -0,0 +1,4 @@
+OPENCL_HEADERS_TI = ""
+OPENCL_HEADERS_TI:ti-soc = "opencl_clhpp-ti.inc"
+
+require ${OPENCL_HEADERS_TI}
diff --git a/meta-arago-test/recipes-extended/opencl/opencl_clhpp-ti.inc b/meta-arago-test/recipes-extended/opencl/opencl_clhpp-ti.inc
new file mode 100644
index 00000000..ed43170c
--- /dev/null
+++ b/meta-arago-test/recipes-extended/opencl/opencl_clhpp-ti.inc
@@ -0,0 +1,7 @@
+SRCREV  = "0bdbbfe5ecda42cff50c96cc5e33527f42fcbd45"
+PV = "2024.05.08"
+
+DEPENDS = "opencl-headers"
+
+EXTRA_OECMAKE:append = " -DOPENCL_CLHPP_BUILD_TESTING=OFF \
+			 -DBUILD_TESTING=OFF"
-- 
2.34.1


