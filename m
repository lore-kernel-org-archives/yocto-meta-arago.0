Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECB0AC43217
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 17:18:56 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web09.379.1651166334789935260
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 28 Apr 2022 10:18:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=oweIBRYz;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23SHIrha112658;
	Thu, 28 Apr 2022 12:18:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1651166333;
	bh=krBCIARbSRAgBHKvg/5RFpwWdYGRA37CILIGJ46M23o=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=oweIBRYzIyexofwO4NzIpLkkM9M8vBsnEn3iv16N79qdsv/1GT/XT2/rHJrJpNbc7
	 kCYpGlhS62oMFkt/bu6KPvNLFveI8kdMzWm7isqcy/jCuQLhCd7TEl+2FVxdMvyYy1
	 79zxpgYMyqz8+/osrZOXgTK/IDBgGAyfNLdzZbQs=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23SHIrNN057538
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 28 Apr 2022 12:18:53 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 28
 Apr 2022 12:18:53 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 28 Apr 2022 12:18:53 -0500
Received: from ula0226330.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23SHIp7B090758;
	Thu, 28 Apr 2022 12:18:53 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][oe-layersetup PATCH v2 4/5] Build Poky in a directory
 named poky-tmp vs arago-tmp
Date: Thu, 28 Apr 2022 12:18:50 -0500
Message-ID: <20220428171851.19270-4-afd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220428171851.19270-1-afd@ti.com>
References: <20220428171851.19270-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 28 Apr 2022 17:18:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13827

This also allows us to keep version of both should we need.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 sample-files/local-poky-v2.conf.sample | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sample-files/local-poky-v2.conf.sample b/sample-files/local-poky-v2.conf.sample
index a958055..4bd0563 100644
--- a/sample-files/local-poky-v2.conf.sample
+++ b/sample-files/local-poky-v2.conf.sample
@@ -48,7 +48,7 @@ SSTATE_DIR = "${OEBASE}/build/sstate-cache"
 # where BitBake should place its temporary files and output. Keep in mind that
 # this includes the extraction and compilation of many applications and the toolchain
 # which can use Gigabytes of hard disk space.
-TMPDIR = "${OEBASE}/build/arago-tmp"
+TMPDIR = "${OEBASE}/build/poky-tmp"
 
 #
 # Machine Selection
-- 
2.17.1


