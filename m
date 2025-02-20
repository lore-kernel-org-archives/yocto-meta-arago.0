Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C5A1C021B3
	for <webhook@archiver.kernel.org>; Thu, 20 Feb 2025 21:08:49 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.8128.1740085722879383036
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 20 Feb 2025 13:08:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=LEAKpvI+;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: a-christidis@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51KL8gWm103060
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-arago@lists.yoctoproject.org>; Thu, 20 Feb 2025 15:08:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740085722;
	bh=5RCSQirujPhdIe5vfLC2ZRnmm9JUISXBkP4dus73kqA=;
	h=From:To:Subject:Date;
	b=LEAKpvI+fSpjrUB+NfUPSxZspkr1lEGpqmyTl+KzOstZRTUXmRgGkQuRvY16VbkC6
	 Zzn3pHwaGFhbXusx00IlsaojDZH2P+FtIqm7lvJ/rInrEsR4LbqCQkhSFZ2WEcBgsN
	 6JeVK53alNRwVM+V/YmWao4k9E/V0XjKwdIjLUa8=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51KL8gTB031998
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Thu, 20 Feb 2025 15:08:42 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 20
 Feb 2025 15:08:42 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 20 Feb 2025 15:08:41 -0600
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51KL8fC9113799
	for <meta-arago@lists.yoctoproject.org>; Thu, 20 Feb 2025 15:08:41 -0600
From: <a-christidis@ti.com>
To: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap/master][PATCH v2] meta-arago-test: adding opencl-cts to ti-test-extra
Date: Thu, 20 Feb 2025 15:08:41 -0600
Message-ID: <20250220210841.215364-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 20 Feb 2025 21:08:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15882

From: Antonios Christidis <a-christidis@ti.com>

Adding opencl-cts to the ti-test-extra package group.

In master branch, the recipe linked will be from meta-openembedded. 
In scarthgap branch, the recipe linked will be from meta-arago. 

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
v2:
- Correction for what branch this is meant, both master and scarthgap
  now
 meta-arago-test/recipes-core/packagegroups/ti-test.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
index 8099198d..3155de1f 100644
--- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
@@ -63,6 +63,7 @@ TI_TEST_EXTRAS = " \
     piglit \
     python3-numpy \
     wayland-utils \
+    opencl-cts \
 "
 
 TI_TEST_BASE:append:armv7a = " \
-- 
2.34.1


