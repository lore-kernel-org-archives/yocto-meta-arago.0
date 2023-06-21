Return-Path: <r-gunasekaran@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B266EB64D8
	for <webhook@archiver.kernel.org>; Wed, 21 Jun 2023 09:18:16 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.6778.1687339093264273102
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 21 Jun 2023 02:18:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=R4N84C3p;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: r-gunasekaran@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35L9IBmx031355;
	Wed, 21 Jun 2023 04:18:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687339091;
	bh=b26dEyUeZnnesgOzOz4iRhdd7NDj8HCHAdl1sDF/eUE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=R4N84C3pFpgd3VW7gThwVJEj4cUHoYuyKjP80VSpCUf1LzPI3nhXfjqdIwkzVKId0
	 sPiwmnjxhIlJzeneAzhOCM4G58OJ3QLaNmPtR6QUv7YzAZO5Vmfqg4V+zRDMAbvRiw
	 vYodeUYCDNm5HuGegblF3g8zkDm+nqwXXnzhKTSw=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35L9IB6L081737
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 21 Jun 2023 04:18:11 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 21
 Jun 2023 04:18:11 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 21 Jun 2023 04:18:11 -0500
Received: from uda0500640.dal.design.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35L9I2AN058227;
	Wed, 21 Jun 2023 04:18:09 -0500
From: Ravi Gunasekaran <r-gunasekaran@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <denis@denix.org>, <reatmon@ti.com>, <g-gupta@ti.com>,
        <r-gunasekaran@ti.com>
Subject: [master/kirkstone 3/3] tisdk-default-image: Add packages to support NETCONF/YANG
Date: Wed, 21 Jun 2023 14:48:01 +0530
Message-ID: <20230621091801.14944-4-r-gunasekaran@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230621091801.14944-1-r-gunasekaran@ti.com>
References: <20230621091801.14944-1-r-gunasekaran@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 21 Jun 2023 09:18:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14669

Add sysrepo, netopeer2-server, nw-configurator packages

Signed-off-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
---
 .../recipes-core/images/tisdk-default-image.bb             | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
index bb825e09..8239e0ce 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
@@ -5,7 +5,12 @@ DESCRIPTION = "Complete Arago TI SDK filesystem image containing complete\
 
 require arago-image.inc
 
-ARAGO_DEFAULT_IMAGE_EXTRA_INSTALL ?= ""
+ARAGO_DEFAULT_IMAGE_EXTRA_INSTALL ?= "\
+    sysrepo \
+    netopeer2-server \
+    nw-configurator \
+    tsn-yang-models \
+"
 
 IMAGE_INSTALL += "\
     packagegroup-arago-base \
-- 
2.17.1


