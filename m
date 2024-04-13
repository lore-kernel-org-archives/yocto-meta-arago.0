Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52CB4C4345F
	for <webhook@archiver.kernel.org>; Sat, 13 Apr 2024 16:24:09 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.15134.1713025440966550625
 for <meta-arago@lists.yoctoproject.org>;
 Sat, 13 Apr 2024 09:24:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=P4Q5pxQP;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: c-shilwant@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43DGNutY036025;
	Sat, 13 Apr 2024 11:23:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1713025436;
	bh=OpddS/R0NBOVB/HkckXTaBCOo/eDuyTDPr0nEVDlLgU=;
	h=From:To:CC:Subject:Date;
	b=P4Q5pxQPmQT4xTFq5R32TYpbYwZt2ai99ulsIfjCN6MBAWIBQoEJAIzXiPBdsmszQ
	 5VjDmxUuHzd8cDpGN/1PKc5dMgvDJKcaqLB7g8fjwok7gKNrQ0QoELhXIebH2fMjfO
	 r/feQzMWAMJ8yCV2ODLFVR6nyjzMZJVEwgOu0Uqk=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43DGNuuH093018
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 13 Apr 2024 11:23:56 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 13
 Apr 2024 11:23:55 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 13 Apr 2024 11:23:55 -0500
Received: from localhost (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 43DGNtrR056636;
	Sat, 13 Apr 2024 11:23:55 -0500
From: Chirag Shilwant <c-shilwant@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Gyan Gupta <g-gupta@ti.com>
Subject: [meta-arago][master/scarthgap][PATCH] recipes-benchmark: lmbench: Remove redundant bbappend
Date: Sat, 13 Apr 2024 21:53:38 +0530
Message-ID: <20240413162338.1780049-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sat, 13 Apr 2024 16:24:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15276

This has been fixed upstream [1]. Hence, remove this bbappend.

[1]: https://git.openembedded.org/meta-openembedded/commit/?h=scarthgap&id=3b2330e4ee778c8a213116e927532dca5b36338b

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 meta-arago-distro/recipes-benchmark/lmbench/lmbench_%.bbappend | 2 --
 1 file changed, 2 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-benchmark/lmbench/lmbench_%.bbappend

diff --git a/meta-arago-distro/recipes-benchmark/lmbench/lmbench_%.bbappend b/meta-arago-distro/recipes-benchmark/lmbench/lmbench_%.bbappend
deleted file mode 100644
index 96dd2010..00000000
--- a/meta-arago-distro/recipes-benchmark/lmbench/lmbench_%.bbappend
+++ /dev/null
@@ -1,2 +0,0 @@
-ALTERNATIVE:${PN} += "hello"
-ALTERNATIVE_LINK_NAME[hello] = "${bindir}/hello"
-- 
2.34.1


