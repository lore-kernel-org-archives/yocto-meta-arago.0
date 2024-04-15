Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB3C5C4345F
	for <webhook@archiver.kernel.org>; Mon, 15 Apr 2024 09:43:46 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.16931.1713174222363711970
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 15 Apr 2024 02:43:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=NKLgpt8Z;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: c-shilwant@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43F9hc97057409;
	Mon, 15 Apr 2024 04:43:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1713174218;
	bh=PsthThDW+Gaow4qparvU21tFpvtBG9cQvBFeGzNYBB4=;
	h=From:To:CC:Subject:Date;
	b=NKLgpt8Z6PFrA3dxVa6iA6w0kme50Fz5HmZWvH/cGGHNBG+3GT+gmInlZZvbnT42l
	 jP1JKEX61qUsKKGz4nc1y3hr38w8LVc0SNGe2p2CaY0cAiQQlIPIGS/K8NKhQOVQ3E
	 Sc5VFqw5dfrANR9TFCpOcJQpRl5tUu9Ih5W3nIbs=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43F9hcrc058624
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 15 Apr 2024 04:43:38 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 15
 Apr 2024 04:43:38 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 15 Apr 2024 04:43:38 -0500
Received: from localhost (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 43F9hbs2006382;
	Mon, 15 Apr 2024 04:43:38 -0500
From: Chirag Shilwant <c-shilwant@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Gyan Gupta <g-gupta@ti.com>
Subject: [meta-arago][master/scarthgap][PATCH] recipes-graphics: freetype: Remove redundant bbappend
Date: Mon, 15 Apr 2024 15:13:31 +0530
Message-ID: <20240415094331.3535927-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 15 Apr 2024 09:43:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15282

freetype recipe from oe-core:meta already has the appropriate
SPDX license identifiers [1]. Hence, remove this bbappend.

[1]: https://git.openembedded.org/openembedded-core/tree/meta/recipes-graphics/freetype/freetype_2.13.2.bb?h=scarthgap#n10

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 .../recipes-graphics/freetype/freetype_%.bbappend              | 3 ---
 1 file changed, 3 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-graphics/freetype/freetype_%.bbappend

diff --git a/meta-arago-distro/recipes-graphics/freetype/freetype_%.bbappend b/meta-arago-distro/recipes-graphics/freetype/freetype_%.bbappend
deleted file mode 100644
index 860a0797..00000000
--- a/meta-arago-distro/recipes-graphics/freetype/freetype_%.bbappend
+++ /dev/null
@@ -1,3 +0,0 @@
-PR:append = ".arago0"
-
-LICENSE = "GPL-2.0-or-later"
-- 
2.34.1


