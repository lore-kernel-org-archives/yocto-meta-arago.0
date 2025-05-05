Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A8B6C3ABBB
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 15:33:18 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.53621.1746459191084575952
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 05 May 2025 08:33:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=zJn0EFoh;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: a-christidis@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 545FXAff281447
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-arago@lists.yoctoproject.org>; Mon, 5 May 2025 10:33:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746459190;
	bh=7rdDch1+iP7QNi7cSbqgvGzSjD+X3MKzf2fJiP+zSsM=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=zJn0EFohPU+cI0owMkAszsHiln2dWHhkA0QeSsDC8HM4jqHGtVvAEs0M1rG0+ed9o
	 ooLyRFyzj2zKMRZ4tESHL00ynLTIQQYggMfxH2D509C0NhPNzqujT6APDojuJXVjKs
	 AffE+vxbCBsUDZ79okpJT/VutORRkEXPUV4wWkxY=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 545FXAK2128216
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Mon, 5 May 2025 10:33:10 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 5
 May 2025 10:33:10 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 5 May 2025 10:33:10 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 545FX96B026218;
	Mon, 5 May 2025 10:33:10 -0500
From: <a-christidis@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>
Subject: [meta-arago][scarthgap][PATCH v1 3/3] meta-arago-test: recipes-graphics: Add opencl c++ headers
Date: Mon, 5 May 2025 10:33:09 -0500
Message-ID: <20250505153309.1739313-4-a-christidis@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16174

From: Antonios Christidis <a-christidis@ti.com>

Add opencl c++ headers, tag 2024.05.08.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
 .../opencl/opencl-clhpp_2024.05.08.bb         | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta-arago-test/recipes-graphics/opencl/opencl-clhpp_2024.05.08.bb

diff --git a/meta-arago-test/recipes-graphics/opencl/opencl-clhpp_2024.05.08.bb b/meta-arago-test/recipes-graphics/opencl/opencl-clhpp_2024.05.08.bb
new file mode 100644
index 00000000..25e7fd63
--- /dev/null
+++ b/meta-arago-test/recipes-graphics/opencl/opencl-clhpp_2024.05.08.bb
@@ -0,0 +1,26 @@
+SUMMARY  = "OpenCL API C++ bindings"
+DESCRIPTION = "OpenCL API C++ bindings from Khronos"
+
+LICENSE  = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+DEPENDS = "opencl-headers"
+
+SRCREV = "0bdbbfe5ecda42cff50c96cc5e33527f42fcbd45"
+
+SRC_URI = "git://github.com/KhronosGroup/OpenCL-CLHPP.git;protocol=https;branch=main"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+
+EXTRA_OECMAKE = " \
+                  -DBUILD_DOCS=OFF \
+                  -DBUILD_EXAMPLES=OFF \
+                  -DBUILD_TESTING=OFF \
+                  "
+
+# Headers only so PN is empty
+RDEPENDS:${PN}-dev = ""
+
+BBCLASSEXTEND += "native nativesdk"
-- 
2.34.1


