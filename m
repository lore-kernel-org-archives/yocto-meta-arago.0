Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CB68C282D1
	for <webhook@archiver.kernel.org>; Mon,  3 Mar 2025 14:58:06 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.55069.1741013884086715227
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 03 Mar 2025 06:58:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=hN8KqgRx;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 523Ew2kK3307999
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 3 Mar 2025 08:58:02 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741013882;
	bh=kSX+qk/XqAkAeL0Sm+1iU1ssgJn72BeFpQHCDXZmNSc=;
	h=From:To:CC:Subject:Date;
	b=hN8KqgRxQQVaD9Lz0rmjAZlF5EwJSYNNaMh9PG4EaLjCjESa5wWtt/rqcbfqolMjC
	 AdRiff3p6IBeFlbm+YyANeX9O6NzPoDCou2MIdD81xhwYEO970xvBi6f/DMQ6BNkxP
	 wos9opbHkwQlGGz3ObnRJ3c4dsZFpaeAfIYjYw+k=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 523Ew28O044726
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 3 Mar 2025 08:58:02 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 3
 Mar 2025 08:58:01 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 3 Mar 2025 08:58:02 -0600
Received: from fllvsmtp8.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 523Ew1Kw120089;
	Mon, 3 Mar 2025 08:58:01 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][scarthgap/master][PATCH] meta-arago-extras: armnn: Remove extra RDEPENDS
Date: Mon, 3 Mar 2025 08:58:00 -0600
Message-ID: <20250303145800.493451-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 03 Mar 2025 14:58:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15933

These are populated automatically based on shlib detection.

Suggested-by: Denys Dmytriyenko <denis@denix.org>
Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-arago-extras/recipes-devtools/armnn/armnn_24.11.bb | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta-arago-extras/recipes-devtools/armnn/armnn_24.11.bb b/meta-arago-extras/recipes-devtools/armnn/armnn_24.11.bb
index d13057c0..43ba21ea 100644
--- a/meta-arago-extras/recipes-devtools/armnn/armnn_24.11.bb
+++ b/meta-arago-extras/recipes-devtools/armnn/armnn_24.11.bb
@@ -22,12 +22,6 @@ DEPENDS = " \
     arm-compute-library \
 "
 
-RDEPENDS:${PN} = " \
-    arm-compute-library \
-    protobuf \
-    boost \
-"
-
 PACKAGECONFIG += "unit-tests tests ref"
 PACKAGECONFIG += "${@bb.utils.contains('TARGET_ARCH', 'aarch64', 'neon', '', d)}"
 PACKAGECONFIG += "${@bb.utils.contains('TARGET_ARCH', 'arm', 'neon', '', d)}"
-- 
2.39.2


