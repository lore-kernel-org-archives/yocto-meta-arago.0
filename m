Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8939BC7EE25
	for <webhook@archiver.kernel.org>; Wed, 26 Apr 2023 21:32:28 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.5179.1682544740544346644
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 26 Apr 2023 14:32:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=YCv8MkDz;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33QLWHUp075982;
	Wed, 26 Apr 2023 16:32:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1682544737;
	bh=Cxhz4FpLajkUl5z9ocsKqPyTTWv4Lo9nMzzv/AZzizU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=YCv8MkDzGNyzuBiXjGotIcX8S5XUTCpzhcuj1ofLFLU57rE6df5GYspdXHuZgmiGB
	 8rWjyuGOTG8ZMij4okhG4B3Yzx3i4A/0gKCgmTwwPuyJVqmruhd+oLv6Ai4QCwxCwe
	 GMHF4HUvF3kTzbJU7ezExLrMcZ6s483MYdzIM9L0=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33QLWHi6088758
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 26 Apr 2023 16:32:17 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 26
 Apr 2023 16:32:16 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 26 Apr 2023 16:32:16 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33QLWGvh067242;
	Wed, 26 Apr 2023 16:32:16 -0500
From: <rs@ti.com>
To: <afd@ti.com>, <denis@denix.org>, <reatmon@ti.com>, <detheridge@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-arago][master/kirkstone][PATCH 1/6] arago.conf: drop the explicit removal of x11, add vulkan
Date: Wed, 26 Apr 2023 16:32:08 -0500
Message-ID: <20230426213214.3501230-2-rs@ti.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230426213214.3501230-1-rs@ti.com>
References: <20230426213214.3501230-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 26 Apr 2023 21:32:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14353

From: Randolph Sapp <rs@ti.com>

Drop the explicit removal of x11 as the new PVR Vulkan libs have runtime
dependencies on libx11.

Add vulkan as a distro feature.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 094e67da..58841051 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -45,12 +45,10 @@ TMPDIR .= "${TCMODEAPPEND}"
 # Start with default set of distro features
 DISTRO_FEATURES = "${DISTRO_FEATURES_DEFAULT} ${DISTRO_FEATURES_LIBC}"
 
-# Remove some unwanted features
-DISTRO_FEATURES:remove = "x11"
-
 # Add additional distro features
 DISTRO_FEATURES:append = " pam wayland opengl"
 #DISTRO_FEATURES:append = " opencl"
+DISTRO_FEATURES:append = " vulkan"
 DISTRO_FEATURES:append = " opencv"
 DISTRO_FEATURES:append = " openmp"
 
-- 
2.40.0


