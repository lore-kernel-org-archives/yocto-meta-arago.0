Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5C20C35FFA
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 20:53:29 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.5693.1742417605994327922
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 19 Mar 2025 13:53:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=YmzlZ+Jr;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: a-christidis@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52JKrPWV3046928
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-arago@lists.yoctoproject.org>; Wed, 19 Mar 2025 15:53:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742417605;
	bh=a307oYXmMpF9SQUApd79YAprID1wnSmwQztV8GSP+i0=;
	h=From:To:Subject:Date;
	b=YmzlZ+JrNtDqxqy9+0t8zk+yemKNxQLIj7Mx6xmc+xc75Dz8kNBpFdKoItBCP2cTC
	 bHupa6l7HXNp4yHO0b6Xb/7y2N02ljCTP9hVNpr4d7LRsGwOrQttA5SPfj8xIws6H+
	 KBpi0AZsdDxvLXTH4QaYMdDTVK3nuD5QrfEszh6A=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52JKrPsd066921
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 19 Mar 2025 15:53:25 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 19
 Mar 2025 15:53:24 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 19 Mar 2025 15:53:24 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52JKrOFS084665;
	Wed, 19 Mar 2025 15:53:24 -0500
From: <a-christidis@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>
Subject: [meta-arago][master][PATCH] ti-gc320-tests: Update SRCREV for recipe
Date: Wed, 19 Mar 2025 15:53:24 -0500
Message-ID: <20250319205324.3900296-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 19 Mar 2025 20:53:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16093

From: Antonios Christidis <a-christidis@ti.com>

Include a new SRCREV for the recipe to build from. This is not a new version of
the tests repo, instead the new commit sha includes cross compilation errors
fixes.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
 .../ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb                 | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb b/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb
index f020194a..62eab650 100644
--- a/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb
+++ b/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb
@@ -11,9 +11,8 @@ BRANCH = "ti-${PV}"
 
 SRC_URI = "git://git.ti.com/git/graphics/ti-gc320-test.git;protocol=https;branch=${BRANCH} \
     file://0001-makefile.linux.def-relax-assignment-of-CC-and-other-.patch \
-    file://0001-galUtil-Fix-compile-error.patch \
 "
-SRCREV = "53207f8e360a3336276b62066a1d8a9e923de17e"
+SRCREV = "3c334f2004c718c9bb4321213c362e65c491efe6"
 PR = "r2"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


