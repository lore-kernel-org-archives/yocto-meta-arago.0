Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F5B5CCD1BB
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 17:07:55 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.32.1761152869158277124
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 22 Oct 2025 10:07:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=OURVLTbi;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: a-christidis@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59MH7mqb319283
	for <meta-arago@lists.yoctoproject.org>; Wed, 22 Oct 2025 12:07:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1761152868;
	bh=Z1ZUN2r+Rg3AUPpf77Na1MlVoNSVmYWEKsAs09UqGpg=;
	h=From:To:Subject:Date;
	b=OURVLTbiJkqikTognEuyFMA8JziJCvYFgHOC1zJEiXQVnepn502n2kNmwl7Eq3Wcm
	 xrvfVzRRIeadUSCXUFEJhE+LuX7ejMT/U9/yJta6zTORH56V5FNsUn3VN56GjcPMM5
	 72jFkzY2iTcTQ6pDGNGTe1zxGtLWOwcw6wO7BTXo=
Received: from DLEE212.ent.ti.com (dlee212.ent.ti.com [157.170.170.114])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59MH7mWP1755819
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 22 Oct 2025 12:07:48 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 22 Oct
 2025 12:07:48 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 22 Oct 2025 12:07:48 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59MH7mfS1549269;
	Wed, 22 Oct 2025 12:07:48 -0500
From: <a-christidis@ti.com>
To: <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH v1]  packagegroup-arago-tisdk-graphics-sdk-target: Add nlohmann-json
Date: Wed, 22 Oct 2025 12:07:48 -0500
Message-ID: <20251022170748.2333083-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 22 Oct 2025 17:07:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16697

From: Antonios Christidis <a-christidis@ti.com>

Add development files for nlohmann-json.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
 .../packagegroup-arago-tisdk-graphics-sdk-target.bb              | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
index cb19a171..28f123c8 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
@@ -18,4 +18,5 @@ RDEPENDS:${PN} = "\
     ${@bb.utils.contains('MACHINE_FEATURES', 'gc320', 'ti-gc320-libs-dev', '', d)} \
     libsdl2-dev \
     ktx-software-dev \
+    nlohmann-json-dev \
 "
-- 
2.34.1


