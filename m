Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E7B9C0218C
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 21:20:03 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.5924.1737148794391935919
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 17 Jan 2025 13:19:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Q3rTr1va;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50HLJrel252447
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Jan 2025 15:19:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737148793;
	bh=MqhyvJFXwDA2U8ZKsmZ8ZoG1CxAVxXoCo9Y6pbs+HAA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Q3rTr1vabeF+SdRut4WTe2jPAqEeyeKetYobohPG6Vigc634Lt86z0y4JukQm0L2x
	 4iZnQZcPNZdzbMrGoPHe467mcRfPFRwV0i7cZDURa2QM7f1o1xbaUp3VQ1hOEweu2p
	 gUzVsSzfyhIgbFFQlkXioTufCHFecLAZBw3NW58k=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50HLJqRh112894
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 17 Jan 2025 15:19:53 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 17
 Jan 2025 15:19:52 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 17 Jan 2025 15:19:52 -0600
Received: from fllvsmtp7.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50HLJp5f030757;
	Fri, 17 Jan 2025 15:19:52 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][scarthgap/master][PATCH 2/5] arago.conf: Remove leftover comments around security protections
Date: Fri, 17 Jan 2025 15:19:48 -0600
Message-ID: <20250117211951.698377-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250117211951.698377-1-afd@ti.com>
References: <20250117211951.698377-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 17 Jan 2025 21:20:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15710

These flags, along with many more updated ones, can all be set using
security_flags.inc from oe-core now.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 6e8c6cb9..f1948523 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -153,10 +153,6 @@ ARAGO_SYSTEST_ENABLE ?= "0"
 ARAGO_KERNEL_SUFFIX:append = "${@oe.utils.conditional("ARAGO_SYSTEST_ENABLE", "1", "-systest", "", d)}"
 IMAGE_FSTYPES:remove = "${@['','ubi ubifs'][d.getVar('ARAGO_SYSTEST_ENABLE') == '1']}"
 
-# Enable basic stack and buffer overflow protections
-#TARGET_CPPFLAGS += "-fstack-protector -D_FORTIFY_SOURCE=1"
-#TARGET_CPPFLAGS += "-fstack-protector"
-
 # Load default preferences
 require conf/distro/include/arago-prefs.inc
 
-- 
2.39.2


