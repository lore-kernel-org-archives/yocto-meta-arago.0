Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86C33C0218D
	for <webhook@archiver.kernel.org>; Tue, 21 Jan 2025 17:52:44 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.22140.1737481954544381834
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 21 Jan 2025 09:52:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ad9VNyGW;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50LHqXIR846973
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 21 Jan 2025 11:52:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737481953;
	bh=TVCyneJLjIiS0j7OI5sODBSGuTy+hN2aB3PoFmck4h0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ad9VNyGWstHHLV154Ry1mJCIY8QEtxVICXocud/88TvyJxRpLXm20PWyOPHIwdmAt
	 R3N1rVKVahiYCkJkSm1CgejPZkEm+GTub1EF5S4V+uEqGRQoqjwUd+PivXhtIRqQd2
	 PYwVceNz66Va4NDvGBKorC8foo6I6fOVZZYYiMTo=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50LHqXUc115814
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 21 Jan 2025 11:52:33 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 21
 Jan 2025 11:52:33 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 21 Jan 2025 11:52:33 -0600
Received: from fllvsmtp8.itg.ti.com ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50LHqV9C097709;
	Tue, 21 Jan 2025 11:52:32 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][scarthgap/master][PATCH v2 5/7] arago.conf: Remove OpenMP as a DISTRO_FEATURE
Date: Tue, 21 Jan 2025 11:52:29 -0600
Message-ID: <20250121175231.27183-5-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250121175231.27183-1-afd@ti.com>
References: <20250121175231.27183-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 21 Jan 2025 17:52:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15725

The "openmp" DISTRO_FEATURE is now unused after DSP accelerated OpenCL
and OpenMP recipes were dropped. Remove this as a DISTRO_FEATURE.

Signed-off-by: Andrew Davis <afd@ti.com>
---

Changes for v2:
 - New patch

 meta-arago-distro/conf/distro/arago.conf | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index baa526a9..9f51ac26 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -50,12 +50,11 @@ DISTRO_FEATURES:append = " pam wayland opengl"
 DISTRO_FEATURES:remove = "x11"
 #DISTRO_FEATURES:append = " opencl"
 DISTRO_FEATURES:append = " vulkan"
-DISTRO_FEATURES:append = " openmp"
 
 # Normally target distro features will not be applied to native builds:
 # Native distro features on this list will use the target feature value
-DISTRO_FEATURES_FILTER_NATIVE:append = " opencl openmp"
-DISTRO_FEATURES_FILTER_NATIVESDK:append = " opencl openmp"
+DISTRO_FEATURES_FILTER_NATIVE:append = " opencl"
+DISTRO_FEATURES_FILTER_NATIVESDK:append = " opencl"
 
 # Set global runtime providers for major components
 ARAGO_SYSVINIT ??= "0"
-- 
2.39.2


