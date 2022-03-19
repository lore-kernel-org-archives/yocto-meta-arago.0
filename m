Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6504DC433EF
	for <webhook@archiver.kernel.org>; Sat, 19 Mar 2022 12:33:21 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web08.6623.1647693200783605902
 for <meta-arago@lists.yoctoproject.org>;
 Sat, 19 Mar 2022 05:33:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=AQrLY34g;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: nm@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22JCXHTC070641;
	Sat, 19 Mar 2022 07:33:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1647693197;
	bh=6HxezNTKoU0rMnt9BiQRu6Qpwz3X8kG015zb8bIvLXc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=AQrLY34gA/xcNq4bi7iJw4RxzCAZrOyR/HLHKmt5tYD56d+zaUzceg8AcYkCGFFSI
	 +UfWyvnhy2lMcQEcpPtfT+5OuHz2GunKjoI9BAtZUaBOQGjAPZvlG/kWjMznCv2bv2
	 HwIsP4jxPuzUIG5RKg/RxdiBPOHc+LJTw5mMoDJ8=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22JCXHiC105951
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 19 Mar 2022 07:33:17 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Sat, 19
 Mar 2022 07:33:17 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Sat, 19 Mar 2022 07:33:17 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22JCXHbG105396;
	Sat, 19 Mar 2022 07:33:17 -0500
From: Nishanth Menon <nm@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>
CC: <d-gerlach@ti.com>, <j-humphreys@ti.com>, <khilman@ti.com>,
        <meta-arago@lists.yoctoproject.org>, <minas@ti.com>,
        <nikhil.nd@ti.com>, <praneeth@ti.com>, <spatton@ti.com>,
        Nishanth Menon <nm@ti.com>
Subject: [master/dunfell PATCH V4 07/12] tisdk-core-bundle: Add documentation
 to clarify usage
Date: Sat, 19 Mar 2022 07:33:05 -0500
Message-ID: <20220319123310.8546-8-nm@ti.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220319123310.8546-1-nm@ti.com>
References: <20220319123310.8546-1-nm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sat, 19 Mar 2022 12:33:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13681

Add documentation to the core-bundle to explain the usage and intent
of the build configuration.

Signed-off-by: Nishanth Menon <nm@ti.com>
---
Changes Since V3: None.

V3: https://lore.kernel.org/all/20220318184045.11246-8-nm@ti.com/

 meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
index 253bfbb68657..0892a8a62d57 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
@@ -1,3 +1,10 @@
+SUMMARY = "Installer package for TI SDK - NOT for direct use on target"
+
+DESCRIPTION = "This creates an installer including all the default images\
+ recommended including source, binaries, filesystems, etc.
+ for TI SDK. This is meant to be used on the host system.
+"
+
 require tisdk-core-bundle.inc
 
 DEPLOY_SPL_NAME_omapl138 = ""
-- 
2.31.1


