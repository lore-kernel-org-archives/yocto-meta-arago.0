Return-Path: <r-gunasekaran@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4ADFC3DA40
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 14:43:07 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.15362.1687876977560211591
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 27 Jun 2023 07:42:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=L2a4/H20;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: r-gunasekaran@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35REgta5006937;
	Tue, 27 Jun 2023 09:42:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687876975;
	bh=mwbRmkvhQIT1rVyjAQ06+x0nwofvlXAyj9cVqoGRY1A=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=L2a4/H20gIsaXpTlZVM9e/Z02hXOBSMoJhzPkl+496RikqOOYfktUjkcEpdCDoeGw
	 9DmgfztmhxjwRLD4z7mBJUWWPZbm5Hu1lH3D0NSVjwLuM2EFiaRwuJlLkUz8r3x89/
	 Dm6Qit/diJ5l12cXl8CZXZ1o2yb5JVwpoGtDx6PI=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35REgtv7044538
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 27 Jun 2023 09:42:55 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 27
 Jun 2023 09:42:54 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 27 Jun 2023 09:42:54 -0500
Received: from uda0500640.dal.design.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35REgnlf097343;
	Tue, 27 Jun 2023 09:42:52 -0500
From: Ravi Gunasekaran <r-gunasekaran@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <denis@denix.org>, <reatmon@ti.com>, <g-gupta@ti.com>, <praneeth@ti.com>,
        <r-gunasekaran@ti.com>, <afd@ti.com>
Subject: [master/kirkstone][PATCH v4 1/8] meta-arago-extras: sysrepo: Update checksum for nw-configurator
Date: Tue, 27 Jun 2023 20:12:42 +0530
Message-ID: <20230627144249.30543-2-r-gunasekaran@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230627144249.30543-1-r-gunasekaran@ti.com>
References: <20230627144249.30543-1-r-gunasekaran@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 27 Jun 2023 14:43:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14706

Instead of using the source file to compute the license checksum,
use the license text only from source file.

Signed-off-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
---

Changes since v3:
----------------
No change

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


