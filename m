Return-Path: <r-gunasekaran@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D5C8EB64D8
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 10:34:56 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.8247.1687430093831387904
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 22 Jun 2023 03:34:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=aJrKqond;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: r-gunasekaran@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35MAYpaU124449;
	Thu, 22 Jun 2023 05:34:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687430091;
	bh=okcc0VJBMv07elfQiKgB3UevY8yZhVsqEEGZUuQCnBQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=aJrKqondRMuEifQwRH4FYguhd4SXwIYWvXrzL2DQnuKOaZ0tj1vRQ5mo4Asb+gRdX
	 gJwu5FDT2qxK7kBlVnpwnqmk2H+lhK7M4nu2ZlgPM6cDnxf9CidhSN8tw/6JLHUu/z
	 A9UcO+D6o2fyl6B6U1X2wMJ/nW+efhdgJc093itU=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35MAYp6c063370
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 22 Jun 2023 05:34:51 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 22
 Jun 2023 05:34:50 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 22 Jun 2023 05:34:50 -0500
Received: from uda0500640.dal.design.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35MAYjlM061303;
	Thu, 22 Jun 2023 05:34:48 -0500
From: Ravi Gunasekaran <r-gunasekaran@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <denis@denix.org>, <reatmon@ti.com>, <g-gupta@ti.com>,
        <r-gunasekaran@ti.com>, <praneeth@ti.com>
Subject: [master/kirkstone][PATCH v2 1/3] meta-arago-extras: sysrepo: Update checksum for nw-configurator
Date: Thu, 22 Jun 2023 16:04:43 +0530
Message-ID: <20230622103445.31114-2-r-gunasekaran@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230622103445.31114-1-r-gunasekaran@ti.com>
References: <20230622103445.31114-1-r-gunasekaran@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 22 Jun 2023 10:34:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14675

Update the checksum values for nw-configurator

Signed-off-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
---
 .../recipes-sysrepo/nw-configurator/nw-configurator.bb          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-sysrepo/nw-configurator/nw-configurator.bb b/meta-arago-extras/recipes-sysrepo/nw-configurator/nw-configurator.bb
index 5a152017..b8a93f1c 100644
--- a/meta-arago-extras/recipes-sysrepo/nw-configurator/nw-configurator.bb
+++ b/meta-arago-extras/recipes-sysrepo/nw-configurator/nw-configurator.bb
@@ -1,6 +1,6 @@
 LICENSE="GPLv2"
 DESCRIPTION = "Sysrepo based repo to configure EST"
-LIC_FILES_CHKSUM = "file://nw-configurator.c;md5=a818a6cf4fbeeb21acc8b4e9956c08a4"
+LIC_FILES_CHKSUM = "file://nw-configurator.c;md5=f2ec672593c3707bb4fe68307dbf0506"
 
 SRC_URI = "file://nw-configurator.c"
 
-- 
2.17.1


