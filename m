Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D033C19F32
	for <webhook@archiver.kernel.org>; Thu,  6 Mar 2025 00:04:49 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.453.1741219482509142173
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 05 Mar 2025 16:04:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=kXwj7Kh0;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: a-christidis@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52604fKj4110464
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
	for <meta-arago@lists.yoctoproject.org>; Wed, 5 Mar 2025 18:04:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741219482;
	bh=pCAXMdWyWuxdB0i4tHnbcK+WK+lu/sOsYrg5pISaQY8=;
	h=From:To:Subject:Date;
	b=kXwj7Kh0x85GPULgkN8b/ybwYzqhcQTiBCkzfcPhzSAz6I9k7N29YUOlffxAd5gWv
	 QFgO8fhDVjO1vS4+oe8a2LC3CfUN4O/3KMdVcTkDk7XPDfQfOdxqFGq7/NFc9320BS
	 E69k5YnxiDkP+nFLdeAWNT4+eMvYHVG9oEvd2eug=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52604fjT087795
	for <meta-arago@lists.yoctoproject.org>; Wed, 5 Mar 2025 18:04:41 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 5
 Mar 2025 18:04:41 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 5 Mar 2025 18:04:41 -0600
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52604fjq056057;
	Wed, 5 Mar 2025 18:04:41 -0600
From: <a-christidis@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <afd@ti.com>
Subject: [meta-arago][scarthgap/master][PATCH v2] ti-gc320-tests: Add RDEPENDS ti-gc320-libs-dev
Date: Wed, 5 Mar 2025 18:04:41 -0600
Message-ID: <20250306000441.408976-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 06 Mar 2025 00:04:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15949

From: Antonios Christidis <a-christidis@ti.com>

Include the package ti-gc320-libs-dev as a runtime dependency.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---

v2:
- Added dev-deps on INSANE_SKIP

 .../ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb                 | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb b/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb
index f9b9685f..14278d76 100644
--- a/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb
+++ b/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb
@@ -4,6 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://dra7x-sdk-ti-gc320-tests_manifest.html;md5=22a001855467f373c47f45de5330e3c9"
 
 DEPENDS = "ti-gc320-libs"
+RDEPENDS:${PN}:append = " ti-gc320-libs-dev"
 
 BRANCH = "ti-${PV}"
 
@@ -32,5 +33,5 @@ do_install() {
 	done
 }
 
-INSANE_SKIP:${PN} += "ldflags already-stripped libdir"
+INSANE_SKIP:${PN} += "ldflags already-stripped libdir dev-deps"
 INSANE_SKIP:${PN}-dbg += "libdir"
-- 
2.34.1


