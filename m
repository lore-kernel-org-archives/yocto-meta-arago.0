Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 655A7C77B73
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 21:48:16 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.1348.1685483286118697145
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 30 May 2023 14:48:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=gkbRPyTA;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34ULm3pV009381;
	Tue, 30 May 2023 16:48:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1685483283;
	bh=TcPhCskTwmuvADFlrKYfDIRSvN+CGo96h3hvOSRt42s=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=gkbRPyTAeQcAJZIqXPkzaThplJjdsXI2Wl6nFTjMRdlWnOPGUAiw/+SX0cRnAhaU8
	 tnsSGqUR+XG0FU5shCzXw0JG13GamUj7TXZGcm+CX5hfdrLYBm1IC+mjniaU5P6R2t
	 Pn0tng1cfC/urn6c67YWG7bg91Nnp5klyIE6Pszc=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34ULm3x7062436
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 30 May 2023 16:48:03 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 30
 May 2023 16:48:03 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 30 May 2023 16:48:03 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34ULm2rL026159;
	Tue, 30 May 2023 16:48:03 -0500
From: <rs@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>, <detheridge@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-arago][master/kirkstone][PATCH 2/2] ti-test: add piglit to ARAGO_TEST
Date: Tue, 30 May 2023 16:47:57 -0500
Message-ID: <20230530214757.3693099-3-rs@ti.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230530214757.3693099-1-rs@ti.com>
References: <20230530214757.3693099-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 30 May 2023 21:48:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14480

From: Randolph Sapp <rs@ti.com>

Piglit is an OpenGL test suite and test-suite runner with support for
OpenGLES, Vulkan, OpenCL compliance tests. This in particular is very
nice in tracking feature regressions and driver conformance.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf                | 3 +++
 meta-arago-distro/recipes-core/packagegroups/ti-test.bb | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index a6425fae..9164657c 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -95,6 +95,9 @@ PACKAGECONFIG:pn-curl = "${@bb.utils.contains("DISTRO_FEATURES", "ipv6", "ipv6",
 
 PACKAGECONFIG:pn-glmark2 = "drm-gles2 wayland-gles2"
 
+# Enable testing for opencl and vulkan with piglit
+PACKAGECONFIG:append:pn-piglit = " opencl vulkan"
+
 # Enable encryption support in open62541
 PACKAGECONFIG:append:pn-open62541 = " encrypt"
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
index 0b6e1eed..24fc937b 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
@@ -39,6 +39,9 @@ ARAGO_TEST = "\
     nbench-byte \
     stream \
     cryptodev-tests \
+    piglit \
+    opengl-es-cts \
+    vulkan-cts \
 "
 
 ARAGO_TEST:append:armv7a = " \
-- 
2.40.1


