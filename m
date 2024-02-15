Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCB12C48BC4
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 18:01:31 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.26025.1708020084619600467
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 15 Feb 2024 10:01:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=TBlqafgr;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41FI1Mjl080487;
	Thu, 15 Feb 2024 12:01:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1708020082;
	bh=6rocStNa0cfc8kkPkRV+/lg06tVReHr233HP/22w2iI=;
	h=From:To:CC:Subject:Date;
	b=TBlqafgrT19bByCMQBnPza6q2qz69RJmDHOlMif9cwDq49m4i0PQ3dCR9G+FjZyaE
	 MtPEBOnRjorGGW41wpLIRJdvOEf0lBDCd511lqaKTUR9SKY2Vj7Wnh4QLLP+lDK4yY
	 YwSbBgIqx7m8zpfLT2oxKgBXHGjpwXHJ0w8jWydA=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41FI1MWW123367
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 15 Feb 2024 12:01:22 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 15
 Feb 2024 12:01:22 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 15 Feb 2024 12:01:22 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41FI1MkB029717;
	Thu, 15 Feb 2024 12:01:22 -0600
From: <rs@ti.com>
To: <detheridge@ti.com>, <reatmon@ti.com>, <denys@konsulko.com>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][kirkstone][PATCH] weston: add upstrem-status to plane selection patch
Date: Thu, 15 Feb 2024 11:59:34 -0600
Message-ID: <20240215175933.3445346-2-rs@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 15 Feb 2024 18:01:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15199

From: Randolph Sapp <rs@ti.com>

Add Upstream-Status to a patch we've been carrying for a bit. This has been
accepted upstream and will be present in the version of Weston used in the next
Yocto LTS.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 ...1-backend-drm-Select-plane-based-on-current-attached-C.patch | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/0001-backend-drm-Select-plane-based-on-current-attached-C.patch b/meta-arago-distro/recipes-graphics/wayland/weston/0001-backend-drm-Select-plane-based-on-current-attached-C.patch
index d9444641..9c13a5bf 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston/0001-backend-drm-Select-plane-based-on-current-attached-C.patch
+++ b/meta-arago-distro/recipes-graphics/wayland/weston/0001-backend-drm-Select-plane-based-on-current-attached-C.patch
@@ -10,6 +10,8 @@ the corresponding CRTC.
 This prevents changing a CRTC's primary plane when it is active
 which is not allowed by the DRM framework.
 
+Upstream-Status: Backport 94afcbcdc3f1b1cfc050da242c9c70009b007fc6
+
 Based-on-patch-by: Eric Ruei <e-ruei1@ti.com>
 Signed-off-by: Andrew Davis <afd@ti.com>
 ---
-- 
2.43.0


