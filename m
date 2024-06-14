Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A49A8C27C77
	for <webhook@archiver.kernel.org>; Fri, 14 Jun 2024 18:27:41 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.1265.1718389661039773883
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 14 Jun 2024 11:27:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=fYP0oYr7;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45EIRcQB080009;
	Fri, 14 Jun 2024 13:27:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718389658;
	bh=+A9I624YQpg2r9s2BqsFRawFRlAuZVXoHJWC6xgSoG0=;
	h=From:To:CC:Subject:Date;
	b=fYP0oYr70DNoXh7Yoof9rLev5DTil6ybIBATkZNHbVXGclu/qQkxDFRth3X2EQZNS
	 ZH12stCBGsyUp82u/5LKMR1GTEPgkZ7UuhkOYQQsqFhi3k6uXhfh0YhK2jkJTn+RCI
	 Wb4WsALBE0j83jZn32h8AAYEMEeZ+EFXcj9o+Emk=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45EIRcxK002957
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 14 Jun 2024 13:27:38 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 14
 Jun 2024 13:27:37 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 14 Jun 2024 13:27:37 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45EIRbM8066209;
	Fri, 14 Jun 2024 13:27:37 -0500
From: <rs@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <vijayp@ti.com>
Subject: [meta-arago][scarthgap/master][PATCH] tisdk-graphics-sdk-target: include gles headers
Date: Fri, 14 Jun 2024 13:27:21 -0500
Message-ID: <20240614182721.4034202-1-rs@ti.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 14 Jun 2024 18:27:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15387

From: Randolph Sapp <rs@ti.com>

Pull in all GL and GLES headers.

Though IMG Rogue cores do not support desktop GL that shouldn't prevent
people from compiling GL things specifically for software rendering or
acceleration through other means.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../packagegroup-arago-tisdk-graphics-sdk-target.bb          | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
index 6f576a18..e35f1766 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
@@ -8,8 +8,11 @@ inherit packagegroup
 
 RDEPENDS:${PN} = "\
     libegl-dev \
+    libgl-dev \
+    libgles1-dev \
+    libgles2-dev \
+    libgles3-dev \
     libdrm-dev \
-    libgles3-mesa-dev \
     wayland-dev \
     weston-dev \
     ${@bb.utils.contains('MACHINE_FEATURES', 'gc320', 'ti-gc320-libs-dev', '', d)} \
-- 
2.45.1


