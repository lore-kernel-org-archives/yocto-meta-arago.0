Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFC48C7EE37
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 19:51:07 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.6897.1686081066697112676
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 06 Jun 2023 12:51:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=G/a80mIk;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 356Jp3WA091554;
	Tue, 6 Jun 2023 14:51:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686081063;
	bh=q8sRXS7gG3ZXXeehHXd5iixmmQlOD2C0g4PQtXf4KTk=;
	h=From:To:CC:Subject:Date;
	b=G/a80mIkpqocxIbcQAVRkTM1uLNTXvJK5NROTI0LEQFuy5ywNg3DIxIhpv4QKxrk6
	 Vz9K17ML9IDgO9ZvYDFitNMWRt+9l43sIRxdHCAxOFCp19KDQOKPFMr3BDoXSJm6Eu
	 KhX5nyJcWPz0sDT8qj1qYKcdv0wH91OcZ+ZRhVy4=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 356Jp39V009428
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 6 Jun 2023 14:51:03 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 6
 Jun 2023 14:51:02 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 6 Jun 2023 14:51:03 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 356Jp2eN122292;
	Tue, 6 Jun 2023 14:51:02 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>, <afd@ti.com>, <detheridge@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-arago][master/kirkstone][PATCHv2] ti-test: add piglit to ARAGO_TEST
Date: Tue, 6 Jun 2023 14:51:01 -0500
Message-ID: <20230606195101.1611396-1-rs@ti.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 06 Jun 2023 19:51:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14501

From: Randolph Sapp <rs@ti.com>

Piglit is an OpenGL test suite and test-suite runner with support for
OpenGLES, Vulkan, OpenCL compliance tests. This in particular is very
nice in tracking feature regressions and driver conformance.

Signed-off-by: Randolph Sapp <rs@ti.com>
---

Ugh. I love how yocto will arbitrarily pad certain fields with
whitespace and simultaneously expect you to pad others manually.

 meta-arago-distro/conf/distro/arago.conf                | 3 +++
 meta-arago-distro/recipes-core/packagegroups/ti-test.bb | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index a6425fae..2f81f118 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -95,6 +95,9 @@ PACKAGECONFIG:pn-curl = "${@bb.utils.contains("DISTRO_FEATURES", "ipv6", "ipv6",
 
 PACKAGECONFIG:pn-glmark2 = "drm-gles2 wayland-gles2"
 
+# Enable testing for opencl and vulkan with piglit
+PACKAGECONFIG:append:pn-piglit = " ${@bb.utils.filter("DISTRO_FEATURES", "opencl vulkan", d)}"
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


