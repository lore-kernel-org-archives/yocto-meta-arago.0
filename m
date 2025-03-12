Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB61FC35FF2
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 15:08:30 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.39718.1741792106582697992
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 12 Mar 2025 08:08:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=pMMkCEYC;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52CF8PSv1061773
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Mar 2025 10:08:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741792105;
	bh=BfRdRlLNKxDEKAkXqO5tnB9NL/b4z8F+9xlho9W2ypk=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=pMMkCEYCi+GMoX1tIJoz1aoDvv9YHAZbc4FoRyMFX80E2Cao4IUWFUjmnbnhy5D5j
	 Ece3vS8oTeys8j0b2kTYB8ZLbJ5Zg5sdr9pGkyS0wY8JeHA5EPSZ7Aq97RP10X67aU
	 HPmGAbSw7gEu929H9usD5YbBarvZyupuVRCDd7ps=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52CF8Ppi027386
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 12 Mar 2025 10:08:25 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 12
 Mar 2025 10:08:25 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 12 Mar 2025 10:08:24 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52CF8OVu101401;
	Wed, 12 Mar 2025 10:08:24 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tsNh2-0001jW-OW; Wed, 12 Mar 2025 10:08:24 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/scarthgap][PATCH 6/6] nnstreamer: Add COMPATIBLE_MACHINE
Date: Wed, 12 Mar 2025 10:08:24 -0500
Message-ID: <20250312150824.6579-7-reatmon@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16009

The onnxruntime recipe has a COMPATIBLE_MACHINE setting that limits
this to just armv7a and aarch64.  Since this package depends on it, we
need the same settings.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-multimedia/nnstreamer/nnstreamer_2.4.0.bb       | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.4.0.bb b/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.4.0.bb
index 50d16d29..6e142f4e 100644
--- a/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.4.0.bb
+++ b/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.4.0.bb
@@ -9,6 +9,12 @@ SRCREV = "7c57c288250578cad598f065b6fda6c0ff720cf9"
 
 S = "${WORKDIR}/git"
 
+# Only compatible with armv7a, armv7ve, and aarch64
+COMPATIBLE_MACHINE = "(^$)"
+COMPATIBLE_MACHINE:aarch64 = "(.*)"
+COMPATIBLE_MACHINE:armv7a = "${@bb.utils.contains("TUNE_FEATURES","neon","(.*)","(^$)",d)}"
+COMPATIBLE_MACHINE:armv7ve = "${@bb.utils.contains("TUNE_FEATURES","neon","(.*)","(^$)",d)}"
+
 inherit meson pkgconfig
 
 DEPENDS = " \
-- 
2.17.1


