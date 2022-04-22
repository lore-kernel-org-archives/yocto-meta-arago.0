Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CF14C35275
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 19:12:54 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web08.1285.1650652906860456098
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 22 Apr 2022 11:41:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=rk7WtAdE;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23MIfjcx096261;
	Fri, 22 Apr 2022 13:41:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1650652905;
	bh=+S0DXGCMG/Sgl/UAIoZo2TTk430qbaSTTQhKQytja+I=;
	h=From:To:Subject:Date;
	b=rk7WtAdEh0vRr1pYsfQ+ct5fde1k30g+ATTOsFbJ13E/rP+HkwS51gYM7/qfmL0uM
	 SmjB01Tb7iqfg7Oap54z3f6ucHE+h9UppqnicIXBU2GC3uf9aZKoKJ+J5TA3MsySeA
	 XSf9eHZ1r6d014cICxKy+73SZ7Bnwm8RYYw0iQr0=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23MIfjJE023121
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 22 Apr 2022 13:41:45 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 22
 Apr 2022 13:41:44 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 22 Apr 2022 13:41:44 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23MIfidU032573;
	Fri, 22 Apr 2022 13:41:44 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nhyDv-0005Gh-T2; Fri, 22 Apr 2022 13:41:43 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/dunfell][PATCH] arm-benchmarks: Bump SRCREV to
 fix for CPU frequency calculations
Date: Fri, 22 Apr 2022 13:41:43 -0500
Message-ID: <20220422184143.20211-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 22 Apr 2022 19:12:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13784

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb b/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb
index 5f6279ad..528f5a6e 100644
--- a/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb
+++ b/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb
@@ -7,7 +7,7 @@ SECTION = "system"
 PR = "r13"
 
 BRANCH ?= "master"
-SRCREV = "a3126fd88edd911fff33ace5b813652397bf4cfe"
+SRCREV = "fefaf9bdd6f36ab0cebaab8dbf34e5beb50f471c"
 
 SRC_URI = "git://git.ti.com/apps/arm_benchmarks.git;protocol=git;branch=${BRANCH}"
 
-- 
2.17.1


