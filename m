Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD724C35FF4
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 15:08:30 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.39442.1741792106533640019
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 12 Mar 2025 08:08:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=L5Kk3Em4;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52CF8PbH1533214
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Mar 2025 10:08:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741792105;
	bh=7twDkMJaaMa47M4o1p8PM33xM3i3WqVutNmVRBcC88E=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=L5Kk3Em4G9HfUBNIFtiFI1ToXLdMTG5ksFv2sDUwZ6Yk/OLaWvrQWcFdVbN0AYU44
	 HX6L1sKFFyVKG+psFITpNLWJAWbvuqxtzKEiKHYtl+lZfNxaKICFVoTmYQmzGBDeie
	 Q24r7f/1NqsjHT7FupKXYBQsgv/Wg3onMlPNhRgU=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52CF8P3f020208
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 12 Mar 2025 10:08:25 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 12
 Mar 2025 10:08:24 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 12 Mar 2025 10:08:24 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52CF8Otv101397;
	Wed, 12 Mar 2025 10:08:24 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tsNh2-0001jQ-Kg; Wed, 12 Mar 2025 10:08:24 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/scarthgap][PATCH 5/6] onnxruntime: Add COMPATIBLE_MACHINE
Date: Wed, 12 Mar 2025 10:08:23 -0500
Message-ID: <20250312150824.6579-6-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250312150824.6579-1-reatmon@ti.com>
References: <20250312150824.6579-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 12 Mar 2025 15:08:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16008

The arm_compute_library has a COMPATIBLE_MACHINE setting that limits
this to just armv7a and aarch64.  Since this package depends on it, we
need the same settings.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-framework/onnxruntime/onnxruntime_1.20.1.bb     | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime_1.20.1.bb b/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime_1.20.1.bb
index 7e810739..bee649cb 100644
--- a/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime_1.20.1.bb
+++ b/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime_1.20.1.bb
@@ -32,6 +32,12 @@ SRCREV_nsync = "13de152c2a1cd73ff4df97bd2c406b6d15d34af3"
 
 S = "${WORKDIR}/git"
 
+# Only compatible with armv7a, armv7ve, and aarch64
+COMPATIBLE_MACHINE = "(^$)"
+COMPATIBLE_MACHINE:aarch64 = "(.*)"
+COMPATIBLE_MACHINE:armv7a = "${@bb.utils.contains("TUNE_FEATURES","neon","(.*)","(^$)",d)}"
+COMPATIBLE_MACHINE:armv7ve = "${@bb.utils.contains("TUNE_FEATURES","neon","(.*)","(^$)",d)}"
+
 DEPENDS += "\
 	onnx \
 	abseil-cpp \
-- 
2.17.1


