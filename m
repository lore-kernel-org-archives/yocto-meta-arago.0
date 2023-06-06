Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BC8EC7EE43
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 19:27:57 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.6303.1686079676589117616
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 06 Jun 2023 12:27:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Gni81/Jz;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 356JRqOu037353;
	Tue, 6 Jun 2023 14:27:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686079673;
	bh=daU+aaZF6p6vdEdybKHUC4mgsYdMQTsXMNCv8QadSTE=;
	h=From:To:CC:Subject:Date;
	b=Gni81/Jz3sGWIthl0EoIOKluN4n5ehU9xwhu7UnVxJs/Zks4D6auUgd8aqxhKkiDc
	 udtX+vFUOsCNjFwA1zFcnWt1lj7lpHrBHW/wqPhY9UCQi6mbOhMeaYyaS4EX5dmiiY
	 wwKuMCdNz/x5jgk4xdvX/uoQT5VFaDjE23dzVC3s=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 356JRqDl088033
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 6 Jun 2023 14:27:52 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 6
 Jun 2023 14:27:52 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 6 Jun 2023 14:27:52 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 356JRqZT101088;
	Tue, 6 Jun 2023 14:27:52 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>, <afd@ti.com>, <detheridge@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [PATCH] ti-test: add piglit to ARAGO_TEST
Date: Tue, 6 Jun 2023 14:27:36 -0500
Message-ID: <20230606192736.909821-1-rs@ti.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 06 Jun 2023 19:27:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14499

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
index a6425fae..cce73ba8 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -95,6 +95,9 @@ PACKAGECONFIG:pn-curl = "${@bb.utils.contains("DISTRO_FEATURES", "ipv6", "ipv6",
 
 PACKAGECONFIG:pn-glmark2 = "drm-gles2 wayland-gles2"
 
+# Enable testing for opencl and vulkan with piglit
+PACKAGECONFIG:append:pn-piglit = "${@bb.utils.filter("DISTRO_FEATURES", "opencl vulkan", d)}"
+
 # Enable encryption support in open62541
 PACKAGECONFIG:append:pn-open62541 = " encrypt"
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
index 0b6e1eed..929d63c7 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
@@ -39,6 +39,9 @@ ARAGO_TEST = "\
     nbench-byte \
     stream \
     cryptodev-tests \
+    piglit \
+    ${@bb.utils.contains("DISTRO_FEATURES", "opengl", "opengl-es-cts", "", d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "vulkan", "vulkan-cts", "", d)} \
 "
 
 ARAGO_TEST:append:armv7a = " \
-- 
2.40.1


