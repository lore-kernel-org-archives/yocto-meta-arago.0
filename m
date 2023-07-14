Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2070EB64DC
	for <webhook@archiver.kernel.org>; Fri, 14 Jul 2023 22:06:58 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.293.1689372414615687742
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 14 Jul 2023 15:06:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=nPsQHPol;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: praneeth@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 36EM6q3I120793
	for <meta-arago@lists.yoctoproject.org>; Fri, 14 Jul 2023 17:06:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1689372413;
	bh=q76DSAvBidmL51sHabJ5shVuz0FCAwpi4RnFT3/5HgY=;
	h=From:To:CC:Subject:Date;
	b=nPsQHPolgYU+0bj/ez2ZOOT1zbvln1pUWikmKEba0ELY5vh4v/i/03hKryaiurDjN
	 2rLdAlcdxtZ9Cu4OssV0Y9bvPd1xgoL0DGmFaOci1r1t1IE2TjJZLj0IrDP/aaQHP/
	 xAXa2YZNHh+OD+WJ6NjMuLkWah0Qdgihx+JL6SYg=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 36EM6qEU019617
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Fri, 14 Jul 2023 17:06:52 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 14
 Jul 2023 17:06:52 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 14 Jul 2023 17:06:52 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 36EM6qM8054801;
	Fri, 14 Jul 2023 17:06:52 -0500
From: <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Ryan Eatmon <reatmon@ti.com>,
        Jayesh
 Choudhary <j-choudhary@ti.com>, Udit Kumar <u-kumar1@ti.com>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [kirkstone PATCH] meta-arago-demos: matrix-gui-v2-apps: update to pick openssl_perf fixes
Date: Fri, 14 Jul 2023 17:06:52 -0500
Message-ID: <20230714220652.19240-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 14 Jul 2023 22:06:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14802

From: Praneeth Bajjuri <praneeth@ti.com>

update matrix-gui-v2-apps recipe SRCREV to pick
* openssl_perf: update engine and remove des-cbc

This includes OPENSSL 3.0.9 engine name change necessary for crypto demo
to be functional

This update also includes test suite removal of des-cbc as this
algorithm is not supported.

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 meta-arago-demos/recipes-core/matrix/matrix-gui-apps-git.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-demos/recipes-core/matrix/matrix-gui-apps-git.inc b/meta-arago-demos/recipes-core/matrix/matrix-gui-apps-git.inc
index 94776f54..beaf4820 100644
--- a/meta-arago-demos/recipes-core/matrix/matrix-gui-apps-git.inc
+++ b/meta-arago-demos/recipes-core/matrix/matrix-gui-apps-git.inc
@@ -4,9 +4,9 @@ LICENSE_CHECKSUM = "LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
 LIC_FILES_CHKSUM := "file://../${LICENSE_CHECKSUM}"
 
 SRC_URI = "git://git.ti.com/git/matrix-gui-v2/matrix-gui-v2-apps.git;protocol=https;branch=${BRANCH}"
-SRCREV = "cad105b0c2b75a90f4def523b4fdbd0b6aa2fe8e"
+SRCREV = "011bc0ab43110eb2fca4dd6c58fc0433642da8d6"
 BRANCH = "master"
-INC_PR = "r76"
+INC_PR = "r77"
 
 # Pull in the base package for installing matrix applications
 require matrix-gui-apps.inc
-- 
2.17.1


