Return-Path: <r-gunasekaran@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2FFAEB64DD
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 10:03:56 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.9457.1687860233934652758
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 27 Jun 2023 03:03:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=rQsftjZb;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: r-gunasekaran@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35RA3pcP093107;
	Tue, 27 Jun 2023 05:03:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687860231;
	bh=unzx2oFYDnNOmJs80nMDkBPmnMiMs+6xqrKRG6yyTgg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=rQsftjZb9vfz8FDr6je+op1hLlg/f/gOLaVdupe5mtks5PYaPkj8832PoqbHd5t/m
	 hEjdkCd0vTKKvYmsjvQtP6Uos3oNhfZYBftcQnG1/7B4ogv5zosOsOSLMzUcCKLvfI
	 uxfPmBIf2nF6usocRlwFTs3QM2U70zquGPr7W4z4=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35RA3p1Q030856
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 27 Jun 2023 05:03:51 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 27
 Jun 2023 05:03:51 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 27 Jun 2023 05:03:51 -0500
Received: from uda0500640.dal.design.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35RA3kla115122;
	Tue, 27 Jun 2023 05:03:49 -0500
From: Ravi Gunasekaran <r-gunasekaran@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <denis@denix.org>, <reatmon@ti.com>, <g-gupta@ti.com>,
        <r-gunasekaran@ti.com>, <praneeth@ti.com>
Subject: [master/kirkstone][PATCH v3 1/8] meta-arago-extras: sysrepo: Update checksum for nw-configurator
Date: Tue, 27 Jun 2023 15:33:38 +0530
Message-ID: <20230627100345.24340-2-r-gunasekaran@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230627100345.24340-1-r-gunasekaran@ti.com>
References: <20230627100345.24340-1-r-gunasekaran@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 27 Jun 2023 10:03:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14696

Instead of using the source file to compute the license checksum,
use the license text only from source file.

Signed-off-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
---

Changes since v2:
----------------
1) Corrected the license type
2) License checksum calculated based on the license header instead of the 
entire source file

Changes since v1:
---------------
No change

 .../recipes-sysrepo/nw-configurator/nw-configurator.bb       | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-sysrepo/nw-configurator/nw-configurator.bb b/meta-arago-extras/recipes-sysrepo/nw-configurator/nw-configurator.bb
index 5a152017..c5d9a86b 100644
--- a/meta-arago-extras/recipes-sysrepo/nw-configurator/nw-configurator.bb
+++ b/meta-arago-extras/recipes-sysrepo/nw-configurator/nw-configurator.bb
@@ -1,6 +1,7 @@
-LICENSE="GPLv2"
 DESCRIPTION = "Sysrepo based repo to configure EST"
-LIC_FILES_CHKSUM = "file://nw-configurator.c;md5=a818a6cf4fbeeb21acc8b4e9956c08a4"
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://nw-configurator.c;beginline=1;endline=33;md5=3538caaf9bfb8372347877ad393660fa"
 
 SRC_URI = "file://nw-configurator.c"
 
-- 
2.17.1


