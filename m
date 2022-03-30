Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F35AC433EF
	for <webhook@archiver.kernel.org>; Wed, 30 Mar 2022 12:54:00 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.6822.1648644839603859503
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 30 Mar 2022 05:54:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=gSobm2Ci;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22UCrvkZ014890;
	Wed, 30 Mar 2022 07:53:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1648644837;
	bh=sHh5Lz1WkXRwcmK5Y2vuRaIBtN0l0p5WCaP8GN3cq9Y=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=gSobm2Cihoq9hFWNZ8BQ5vF/cF1wZLQoN20UjEJ0o+Vuyc/uLElA9YIlhNVwOYK+Y
	 JjoDYVsmpFJHyom9BWIxqm6T3bVJkNuc9XaeaYYsSudyRxND7fp7uVGJgpWoOX4z/4
	 go/5/U7nhsHOR5z5Am06AbN9UiGzkUqFH5BeU3Pk=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22UCrvNO018204
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 30 Mar 2022 07:53:57 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 30
 Mar 2022 07:53:57 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 30 Mar 2022 07:53:57 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22UCrvgZ053136;
	Wed, 30 Mar 2022 07:53:57 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nZXpl-0008So-1J; Wed, 30 Mar 2022 07:53:57 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/dunfell][PATCH v3 2/2] packagegroup-*-graphics:
 add virtual provider for AM62x GPU driver v2
Date: Wed, 30 Mar 2022 07:53:56 -0500
Message-ID: <20220330125356.32492-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220330125356.32492-1-reatmon@ti.com>
References: <20220330125356.32492-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 30 Mar 2022 12:54:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13765

From: Krunal Bhargav <k-bhargav@ti.com>

Signed-off-by: Krunal Bhargav <k-bhargav@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-distro/conf/distro/include/arago-prefs.inc | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index a356c76c..f9fab020 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -21,6 +21,13 @@ PREFERRED_PROVIDER_virtual/libgles2_j7 = "ti-img-rogue-umlibs"
 PREFERRED_PROVIDER_virtual/libgbm_j7 = "ti-img-rogue-umlibs"
 PREFERRED_PROVIDER_virtual/gpudriver_j7 = "ti-img-rogue-driver"
 
+# am62xx has a Rogue GPU core
+PREFERRED_PROVIDER_virtual/egl_am62xx = "ti-img-rogue-umlibs"
+PREFERRED_PROVIDER_virtual/libgles1_am62xx = "ti-img-rogue-umlibs"
+PREFERRED_PROVIDER_virtual/libgles2_am62xx = "ti-img-rogue-umlibs"
+PREFERRED_PROVIDER_virtual/libgbm_am62xx = "ti-img-rogue-umlibs"
+PREFERRED_PROVIDER_virtual/gpudriver_am62xx = "ti-img-rogue-driver"
+
 # This is required when using keystone devices with graphical support
 # such as Qt5
 PREFERRED_PROVIDER_virtual/egl_keystone = "mesa"
-- 
2.17.1


