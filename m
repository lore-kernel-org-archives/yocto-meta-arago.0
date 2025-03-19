Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5CA8C35FFA
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 20:49:09 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.5452.1742417344622181238
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 19 Mar 2025 13:49:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=J27fg/qf;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: a-christidis@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52JKn3Vl424444
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-arago@lists.yoctoproject.org>; Wed, 19 Mar 2025 15:49:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742417343;
	bh=vg7LN3Wyvrkq9+7OIjsrkfK1DjVeh5f1F3ad4v7bPFs=;
	h=From:To:Subject:Date;
	b=J27fg/qfqPJlGfjZJ8wJkEYcHOum1yZV0z2csUNrGRqYRYc8wmHKGeKLXSNV9O77u
	 77wE9stxUA066bsLy17mNh2cazbGYFH22QiRjXwpjxB/tBJzBOGmz66ZtxvVU0rMfN
	 +M9gheZ9IFdyBbj16PeGVq4QdIwtnPosTK2B0t/o=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52JKn3eK064859
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 19 Mar 2025 15:49:03 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 19
 Mar 2025 15:49:03 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 19 Mar 2025 15:49:03 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52JKn34W115102;
	Wed, 19 Mar 2025 15:49:03 -0500
From: <a-christidis@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>
Subject: [meta-arago][scarthgap][PATCH v3] ti-gc320-tests: Update SRCREV for recipe
Date: Wed, 19 Mar 2025 15:49:03 -0500
Message-ID: <20250319204903.3819533-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 19 Mar 2025 20:49:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16092

From: Antonios Christidis <a-christidis@ti.com>

Include a new SRCREV for the recipe to build from. This is not a new version of
the tests repo, instead the new commit sha includes cross compilation errors
fixes.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---

v3:
- Instead of pointing to the scarthgap branch, the recipe now points to
  the ti-${PN} branch. I have moved my commits from the scarthgap
  branch to the ti-${PN} branch since the commits are not scarthgap
  specific. 

v2:
- Removed tag for master, as the patch does not apply cleanly.

 .../recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb b/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb
index f9b9685f..a09c07f7 100644
--- a/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb
+++ b/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb
@@ -10,7 +10,7 @@ BRANCH = "ti-${PV}"
 SRC_URI = "git://git.ti.com/git/graphics/ti-gc320-test.git;protocol=https;branch=${BRANCH} \
 file://0001-makefile.linux.def-relax-assignment-of-CC-and-other-.patch \
 "
-SRCREV = "53207f8e360a3336276b62066a1d8a9e923de17e"
+SRCREV = "3c334f2004c718c9bb4321213c362e65c491efe6"
 PR = "r2"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


