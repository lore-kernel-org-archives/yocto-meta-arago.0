Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 779A8C3ABAA
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 15:33:18 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.53623.1746459191145639003
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 05 May 2025 08:33:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=f7GG77ws;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: a-christidis@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 545FXATd983383
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-arago@lists.yoctoproject.org>; Mon, 5 May 2025 10:33:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746459190;
	bh=LCRiziahvGQz7kjU25Sp6JKuJysHXYbTkCpnopEuFic=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=f7GG77wsnzerGPC5jvy7V6kxeS+hYtpSheN7R4+vg8Heye0ycPijR/evWCHyYDxL2
	 8JSchOguGIrX8CdrYlM3lKyYlVQjL+oafhD3V013dF708+vNowoA2xliPWq6S1KGn+
	 7YzUMGZiU0KcXvTaRpkHagfpa0Gsk0a6Ps9eGEIs=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 545FXAQf018571
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Mon, 5 May 2025 10:33:10 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 5
 May 2025 10:33:09 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 5 May 2025 10:33:10 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 545FX96A026218;
	Mon, 5 May 2025 10:33:09 -0500
From: <a-christidis@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>
Subject: [meta-arago][scarthgap][PATCH v1 2/3] meta-arago-test: recipes-graphics: Add opencl c headers
Date: Mon, 5 May 2025 10:33:08 -0500
Message-ID: <20250505153309.1739313-3-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250505153309.1739313-1-a-christidis@ti.com>
References: <20250505153309.1739313-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 05 May 2025 15:33:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16175

From: Antonios Christidis <a-christidis@ti.com>

Add opencl c headers, tag 2024.05.08.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
 .../opencl/opencl-headers_2024.05.08.bb       | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-arago-test/recipes-graphics/opencl/opencl-headers_2024.05.08.bb

diff --git a/meta-arago-test/recipes-graphics/opencl/opencl-headers_2024.05.08.bb b/meta-arago-test/recipes-graphics/opencl/opencl-headers_2024.05.08.bb
new file mode 100644
index 00000000..b66181a9
--- /dev/null
+++ b/meta-arago-test/recipes-graphics/opencl/opencl-headers_2024.05.08.bb
@@ -0,0 +1,19 @@
+SUMMARY  = "OpenCL API Headers"
+DESCRIPTION = "OpenCL compute API headers from Khronos Group"
+LICENSE  = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+SECTION = "base"
+
+S = "${WORKDIR}/git"
+
+SRCREV = "8275634cf9ec31b6484c2e6be756237cb583999d"
+
+SRC_URI = "git://github.com/KhronosGroup/OpenCL-Headers.git;branch=main;protocol=https"
+
+inherit cmake
+
+EXTRA_OECMAKE = "-DBUILD_TESTING=OFF"
+
+ALLOW_EMPTY:${PN} = "1"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


