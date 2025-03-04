Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54672C021B8
	for <webhook@archiver.kernel.org>; Tue,  4 Mar 2025 21:27:58 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.34395.1741123669876359622
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 04 Mar 2025 13:27:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=w6TDT96m;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: a-christidis@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 524LRm7g3089948
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-arago@lists.yoctoproject.org>; Tue, 4 Mar 2025 15:27:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741123668;
	bh=gYaHeVlkpCeac82h/XywaYmg1cSkxWi1jq7sQpEbdQw=;
	h=From:To:Subject:Date;
	b=w6TDT96mD2c0Y/aqZSjY3kaX3PoTJF9N4majkzOaCm1IPNckU2fzxwrzEEmt/4Rku
	 sXtZssyAe+Z/fpxlfjMQFJbMvSyoqxxCf91gE/zhaaUkj8rQ7j8Ay7DoNVW2+qCzOr
	 i0orqO1k0M3RHSEWJBXnphwvLt3kIsETEp+GXSqo=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 524LRmXq004667
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Tue, 4 Mar 2025 15:27:48 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 4
 Mar 2025 15:27:48 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 4 Mar 2025 15:27:48 -0600
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 524LRmbU023789
	for <meta-arago@lists.yoctoproject.org>; Tue, 4 Mar 2025 15:27:48 -0600
From: <a-christidis@ti.com>
To: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap/master][PATCH] meta-arago-test: add pytesseract & python3-pillow to ti-test-extra
Date: Tue, 4 Mar 2025 15:27:48 -0600
Message-ID: <20250304212748.272567-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 04 Mar 2025 21:27:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15941

From: Antonios Christidis <a-christidis@ti.com>

Add the pytesseract and python3-pillow recipes to the ti-test-extra package
group.  They are both needed for the automated chromium test.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
 meta-arago-test/recipes-core/packagegroups/ti-test.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
index 8099198d..e6d7e572 100644
--- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
@@ -60,6 +60,8 @@ TI_TEST_BASE = "\
 "
 
 TI_TEST_EXTRAS = " \
+    python3-pillow \
+    pytesseract \
     piglit \
     python3-numpy \
     wayland-utils \
-- 
2.34.1


