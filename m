Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A961C5B543
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 13:31:46 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.6000.1748611898909922691
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 30 May 2025 06:31:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=xYqoQfxp;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54UDVb5P3795689;
	Fri, 30 May 2025 08:31:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748611897;
	bh=b8Cs9ntzGf2HXQtgE5uxVQ5k6h4PprmCcia2SBHl904=;
	h=From:To:Subject:Date;
	b=xYqoQfxpcnAA6/+H3Z5XZCBUguuT91QmXEmrAkbSkVBndAoVDWo+oRtcnzDcVobhM
	 qcvG758XaEpVPE3ffd6OONCRjrSCzfiIa18IP0fOrqD8FuNCIhmZOX9EXJq5AOB2n9
	 VjZ0CO5zsuEfTqxLsvZrWxEA7nAd6MJyUQARlZd0=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54UDVbl52896577
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 30 May 2025 08:31:37 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 30
 May 2025 08:31:37 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 30 May 2025 08:31:37 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 54UDVblu3118322;
	Fri, 30 May 2025 08:31:37 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1uKzph-0005GH-1x; Fri, 30 May 2025 08:31:37 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH]  packagegroup-arago-tisdk-graphics-sdk-target: Remove libgels3-dev
Date: Fri, 30 May 2025 08:31:36 -0500
Message-ID: <20250530133136.20185-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 30 May 2025 13:31:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16245

A recent change in oe-core that effectively removes libgles3-dev [1],
since libgles2-dev should contain everything we can remove our
dependency on it.

[1] https://git.openembedded.org/openembedded-core/commit/?id=7c0e9c170db93d9af7cc505dcd71c4f3d6c4e9c5

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../packagegroup-arago-tisdk-graphics-sdk-target.bb              | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
index e35f1766..22d368a3 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
@@ -11,7 +11,6 @@ RDEPENDS:${PN} = "\
     libgl-dev \
     libgles1-dev \
     libgles2-dev \
-    libgles3-dev \
     libdrm-dev \
     wayland-dev \
     weston-dev \
-- 
2.17.1


