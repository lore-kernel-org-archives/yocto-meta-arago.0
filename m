Return-Path: <j-choudhary@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4512E743FD
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 08:47:35 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.13154.1695977254652579727
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 29 Sep 2023 01:47:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=bYwhfQdL;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: j-choudhary@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 38T8lXqb055479
	for <meta-arago@lists.yoctoproject.org>; Fri, 29 Sep 2023 03:47:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1695977253;
	bh=36I9F72l/oTt7tOnZ+cQ+4J5rKMTSoV5NtuN/1H6deo=;
	h=From:To:CC:Subject:Date;
	b=bYwhfQdLcXTqh7teBh4KW5gQ2KJqocZC6OxPymJmh9aYnHbO//G2AsAuNDCSunDCi
	 D1mKaW47pJrRY9vTtd/yjSQQ6BHCEwSQpeb24EimTToSjH+BzDeZZyWfSVRZNvqI1w
	 gD0jqjHwtLbVt1XLiJsqleRutYV/pcOsdatsjtpk=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 38T8lXQ7111410
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Fri, 29 Sep 2023 03:47:33 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 29
 Sep 2023 03:47:33 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 29 Sep 2023 03:47:33 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 38T8lWsB022380;
	Fri, 29 Sep 2023 03:47:33 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>, <reatmon@ti.com>
CC: <kamlesh@ti.com>, <u-kumar1@ti.com>, <j-choudhary@ti.com>
Subject: [meta-arago][kirkstone][PATCH] meta-arago-demos: matrix-gui-v2-apps: pick platform specific openssl tests
Date: Fri, 29 Sep 2023 14:17:31 +0530
Message-ID: <20230929084731.15228-1-j-choudhary@ti.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 29 Sep 2023 08:47:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14908

update matrix-gui-v2-apps recipe SRCREV to pick the openssl changes
for platform specific test suites and include software performance test
suites as well.

Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---
 meta-arago-demos/recipes-core/matrix/matrix-gui-apps-git.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-demos/recipes-core/matrix/matrix-gui-apps-git.inc b/meta-arago-demos/recipes-core/matrix/matrix-gui-apps-git.inc
index beaf4820..8effcd1b 100644
--- a/meta-arago-demos/recipes-core/matrix/matrix-gui-apps-git.inc
+++ b/meta-arago-demos/recipes-core/matrix/matrix-gui-apps-git.inc
@@ -4,9 +4,9 @@ LICENSE_CHECKSUM = "LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
 LIC_FILES_CHKSUM := "file://../${LICENSE_CHECKSUM}"
 
 SRC_URI = "git://git.ti.com/git/matrix-gui-v2/matrix-gui-v2-apps.git;protocol=https;branch=${BRANCH}"
-SRCREV = "011bc0ab43110eb2fca4dd6c58fc0433642da8d6"
+SRCREV = "73853d99f1210591daacc668a72468c03440e25a"
 BRANCH = "master"
-INC_PR = "r77"
+INC_PR = "r78"
 
 # Pull in the base package for installing matrix applications
 require matrix-gui-apps.inc
-- 
2.25.1


