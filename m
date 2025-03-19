Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 263F2C35FFA
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 19:14:09 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.3066.1742411642678779474
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 19 Mar 2025 12:14:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=crh2RHeS;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: a-christidis@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52JJE1Pq3006679
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-arago@lists.yoctoproject.org>; Wed, 19 Mar 2025 14:14:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742411642;
	bh=+Td4navpTV1WuolaAFBS+vhL9uXdaU1SD1Yns75j2xM=;
	h=From:To:Subject:Date;
	b=crh2RHeS7i6yHqR4PDG4j8WCvT/wCk+HopHi2/HR8O9w9T4wnMUalCeJ0ymkYoukv
	 t8hJ8jwHbMb7nyznEF6kwBdKQ9jOr+M5sDxLTDhhUCYeCI+ozgfJD9Nr5k1oWD2acA
	 R+eSe6RC/lYAqKdbzujbBquJB2je51ekZQIML94w=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52JJE1An014674
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 19 Mar 2025 14:14:01 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 19
 Mar 2025 14:14:01 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 19 Mar 2025 14:14:01 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52JJE1DW105249;
	Wed, 19 Mar 2025 14:14:01 -0500
From: <a-christidis@ti.com>
To: <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH v2] ti-gc320-tests: Update SRCREV for recipe
Date: Wed, 19 Mar 2025 14:14:01 -0500
Message-ID: <20250319191401.2068619-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 19 Mar 2025 19:14:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16091

From: Antonios Christidis <a-christidis@ti.com>

Include a new SRCREV for the recipe to build from. This is not a new version of
the tests repo, instead the new commit sha includes cross compilation errors
fixes.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
v2:
- Removed tag for master, as the patch does not apply cleanly. 

 .../ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb b/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb
index f9b9685f..02605d98 100644
--- a/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb
+++ b/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb
@@ -5,12 +5,12 @@ LIC_FILES_CHKSUM = "file://dra7x-sdk-ti-gc320-tests_manifest.html;md5=22a0018554
 
 DEPENDS = "ti-gc320-libs"
 
-BRANCH = "ti-${PV}"
+BRANCH = "ti-${PV}-scarthgap"
 
 SRC_URI = "git://git.ti.com/git/graphics/ti-gc320-test.git;protocol=https;branch=${BRANCH} \
 file://0001-makefile.linux.def-relax-assignment-of-CC-and-other-.patch \
 "
-SRCREV = "53207f8e360a3336276b62066a1d8a9e923de17e"
+SRCREV = "3c334f2004c718c9bb4321213c362e65c491efe6"
 PR = "r2"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


