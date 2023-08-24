Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E571C27C40
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 19:57:12 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.1297.1692907028925456583
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 24 Aug 2023 12:57:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ZYO5gS0J;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 37OJv7Qr044580;
	Thu, 24 Aug 2023 14:57:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1692907027;
	bh=R4OmJQGqDXOIAiD+FXs7ksUw2u/YzBZ6LhWtza6lqiI=;
	h=From:To:Subject:Date;
	b=ZYO5gS0Jwbx7O6RVYQViIKVWsCYCkKNv1jKvk7FaMgBZOaOaKPijT1B8WjGaUpVo9
	 onZQXRqkwo/PWik0n/lr1COz/9mCq8UfjQr+eW3EhV8R0AyluAeF6wqmOeKFgcRHIj
	 N2xAWaZ1njKnB1CWeRS+MOPjuHfB9IcT/y22j06Q=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 37OJv79a048688
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 24 Aug 2023 14:57:07 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 24
 Aug 2023 14:57:07 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 24 Aug 2023 14:57:07 -0500
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 37OJv7Rb004239;
	Thu, 24 Aug 2023 14:57:07 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1qZGS2-0002Fw-RK; Thu, 24 Aug 2023 14:57:06 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/kirkstone][PATCH] tensorflow-lite: Add SRCREV_FORMAT to fix build error
Date: Thu, 24 Aug 2023 14:57:06 -0500
Message-ID: <20230824195706.6675-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 24 Aug 2023 19:57:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14866

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-support/tensorflow-lite/tensorflow-lite_1.15.bb     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite_1.15.bb b/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite_1.15.bb
index defb6447..e4a1ec85 100644
--- a/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite_1.15.bb
+++ b/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite_1.15.bb
@@ -24,6 +24,8 @@ SRC_URI = "git://github.com/tensorflow/tensorflow.git;branch=r${PV};rev=590d6eef
     file://tflite-benchmark.sh \
     file://tensorflow-lite.pc.in"
 
+SRCREV_FORMAT="tensorflow_gemmlowp_googletest_abseil-cpp_ARM_NEON_2_x86_SSE_farmhash_flatbuffers"
+
 SRC_URI[mobilenet_v1_quant.md5sum] = "36af340c00e60291931cb30ce32d4e86"
 SRC_URI[mobilenet_v1_quant.sha256sum] = "d32432d28673a936b2d6281ab0600c71cf7226dfe4cdcef3012555f691744166"
 
-- 
2.17.1


