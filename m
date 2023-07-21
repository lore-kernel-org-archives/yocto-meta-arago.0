Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5941EB64DC
	for <webhook@archiver.kernel.org>; Fri, 21 Jul 2023 15:24:10 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.9890.1689953047310014793
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 21 Jul 2023 08:24:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=rTI5OOW+;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 36LFO5jv085744;
	Fri, 21 Jul 2023 10:24:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1689953045;
	bh=3K6yHasLym0MC0NyoLr09QMGpKcmex23Tch5GA1+u8U=;
	h=From:To:Subject:Date;
	b=rTI5OOW+vq3erxBJWyTzbMIe8e89eo/zrWv2njeo8Xm7qGjauTZo7+UaKGAkvu3bJ
	 CeA3T+ftmrPIA4o1GH3bR4Dz6ZEonlWGzf6HwXpN7/9f36foHueS7cLvtCJDrF4xUM
	 ZAHqZcgGyaSKA5402IJ+/WSj3IUC/CNSvxqQnQF4=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 36LFO5IT086736
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 21 Jul 2023 10:24:05 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 21
 Jul 2023 10:24:05 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 21 Jul 2023 10:24:05 -0500
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 36LFO57h085862;
	Fri, 21 Jul 2023 10:24:05 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1qMrzA-00032k-Rz; Fri, 21 Jul 2023 10:24:04 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/kirkstone][PATCH] clocl: Lock the llvm-config down to the native version
Date: Fri, 21 Jul 2023 10:24:04 -0500
Message-ID: <20230721152404.9888-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 21 Jul 2023 15:24:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14807

We are seeing some random build failures related to how bitbake chooses
which llvm-config to run during do_compile.  This locks the path to
llvm-config to the native version of the tool.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Suggested-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-arago-extras/recipes-ti/ocl/clocl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-ti/ocl/clocl_git.bb b/meta-arago-extras/recipes-ti/ocl/clocl_git.bb
index 9b2a3aa9..52deaab8 100644
--- a/meta-arago-extras/recipes-ti/ocl/clocl_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/clocl_git.bb
@@ -19,7 +19,7 @@ TARGET:class-nativesdk = "x86"
 EXTRA_OEMAKE = " -C ${S}/clocl \
                  _PRODUCT_VERSION=${PV} \
                  TARGET=${TARGET} \
-                 LLVM_CONFIG_EXE=llvm-config \
+                 LLVM_CONFIG_EXE=${STAGING_BINDIR_NATIVE}/llvm-config \
 "
 
 do_compile() {
-- 
2.17.1


