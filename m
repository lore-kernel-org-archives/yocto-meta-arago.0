Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC764C7EE2C
	for <webhook@archiver.kernel.org>; Tue, 16 May 2023 16:41:03 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.26949.1684255256305964595
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 16 May 2023 09:40:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=IetbRL+g;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34GGeth9066472;
	Tue, 16 May 2023 11:40:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1684255255;
	bh=o9XcKysflMXY3WdQPjca4pusWapiNd1dE+S2zjp9THc=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=IetbRL+gDI2cvWjYip+YFIE7K68fkNe8MfUnGcbbWUvYze7kLRbD9BbWfFsmv5tHF
	 SOEj/dZQDyzAtuFQYUkmHWkTtveHtsUG2RM3U4QLQ1cMohVZqdA+SvETVHqS/NlAOO
	 G6aQCNyDxKCViWoecY/b0TNf4WcG0Gh/IkKX8Ku4=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34GGetDX004964
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 16 May 2023 11:40:55 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 16
 May 2023 11:40:55 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 16 May 2023 11:40:55 -0500
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34GGetD0044979;
	Tue, 16 May 2023 11:40:55 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1pyxjK-00038X-U1; Tue, 16 May 2023 11:40:54 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/kirkstone][PATCH 6/6] branding-core: Temporarily disable GC320 driver
Date: Tue, 16 May 2023 11:40:54 -0500
Message-ID: <20230516164054.11978-7-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230516164054.11978-1-reatmon@ti.com>
References: <20230516164054.11978-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 16 May 2023 16:41:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14409

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-distro/conf/distro/include/branding-core.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-arago-distro/conf/distro/include/branding-core.inc b/meta-arago-distro/conf/distro/include/branding-core.inc
index b28fb196..79dadc11 100644
--- a/meta-arago-distro/conf/distro/include/branding-core.inc
+++ b/meta-arago-distro/conf/distro/include/branding-core.inc
@@ -14,3 +14,7 @@ ALTERNATIVE_PRIORITY:pn-ti-ipc-rtos = "15"
 
 # Remove mmip - DRM allocator, KMS sink, Wayland sink need porting to GST 1.18
 MACHINE_FEATURES:remove = "mmip"
+
+# GC320 support requires out-of-tree drivers not available in until LTS prep is
+# complete. Disable for now.
+MACHINE_FEATURES:remove = "gc320"
-- 
2.17.1


