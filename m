Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C6F3CAC5A9
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 23:09:07 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.774.1758150540540258470
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 17 Sep 2025 16:09:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=TaVFQADX;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: a-christidis@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58HN8xh41618337
	for <meta-arago@lists.yoctoproject.org>; Wed, 17 Sep 2025 18:08:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758150539;
	bh=f90SevNxlk4pikaDQKHw64gwhdxckPwsxx7qQEVoHnU=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=TaVFQADXZ1D/MZNpGSOGUNDmnxcUPxGX2nsAZ1GiHlr0kr/QJ5L4plnvCwE3OD8GR
	 1OTTlTsNFkVXPi0nwkzT8JW5YF8pLrdyX4D5M9p6oHZ0dtGjdRdpFBnfAVY6TgGzFX
	 GiHZa82avNGD08JzP4THybcVffAqYi5hZwCF44rw=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58HN8xv11894316
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 17 Sep 2025 18:08:59 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 17
 Sep 2025 18:08:58 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 17 Sep 2025 18:08:59 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58HN8xbQ4118378;
	Wed, 17 Sep 2025 18:08:59 -0500
From: <a-christidis@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>
Subject: [meta-arago][scarthgap][PATCH v1 2/2] ktx-software: Add recipe v4.4.0
Date: Wed, 17 Sep 2025 18:08:59 -0500
Message-ID: <20250917230859.2083846-3-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250917230859.2083846-1-a-christidis@ti.com>
References: <20250917230859.2083846-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 17 Sep 2025 23:09:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16591

From: Antonios Christidis <a-christidis@ti.com>

Introduce recipe for ktx-software, version 4.4.0.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
 .../ktx-software/ktx-software_4.4.0.bb        | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-arago-test/recipes-graphics/ktx-software/ktx-software_4.4.0.bb

diff --git a/meta-arago-test/recipes-graphics/ktx-software/ktx-software_4.4.0.bb b/meta-arago-test/recipes-graphics/ktx-software/ktx-software_4.4.0.bb
new file mode 100644
index 00000000..c398ec83
--- /dev/null
+++ b/meta-arago-test/recipes-graphics/ktx-software/ktx-software_4.4.0.bb
@@ -0,0 +1,19 @@
+SUMMARY = "KTX (Khronos Texture) Library and Tools "
+DESCRIPTION = "KTX (Khronos Texture) is a lightweight container for textures for OpenGL, Vulkan and other GPU APIs."
+HOMEPAGE = "https://github.com/KhronosGroup/KTX-Software"
+
+LICENSE = "Apache-2.0 & BSD-1-Clause & BSD-2-Clause & BSD-3-Clause & BSL-1.0 \
+	   & CC-BY-3.0 & CC-BY-4.0 & CC0-1.0 & Zlib & MIT & HI-Trademark & fmt & \
+	   Kodak & PNGSuite & ETCSLA & Cesium-Trademark-Terms"
+
+LIC_FILES_CHKSUM = "file://REUSE.toml;md5=45910de791d599e6ba472f6fa506f391"
+
+SRC_URI = "git://github.com/KhronosGroup/KTX-Software.git;protocol=https;branch=main;lfs=0"
+SRCREV = "beef80159525d9fb7abb8645ea85f4c4f6842e8f"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+
+PACKAGECONFIG[ocl_backend] = "-DBASISU_SUPPORT_OPENCL=ON, -DBASISU_SUPPORT_OPENCL=OFF, virtual/opencl-icd"
+
-- 
2.34.1


