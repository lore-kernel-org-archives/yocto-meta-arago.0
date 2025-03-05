Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 185CBC19F32
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 23:59:49 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.354.1741219178967849156
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 05 Mar 2025 15:59:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=a0LOejUV;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: a-christidis@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 525Nxcg83457081
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-arago@lists.yoctoproject.org>; Wed, 5 Mar 2025 17:59:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741219178;
	bh=dCwALDvWY7rNO8iXVjnxBmrg+OFYCUg0ZgWFunsuRhI=;
	h=From:To:Subject:Date;
	b=a0LOejUVYegzWJIxnRRQuJpDe+BiQhPvvWIbz54FT01/BohiLWZ/+7JRhVIE+MWLP
	 tZydtqPYtxGmr4Nwc1fxfAocQuwz+B0UGcs8pmvxXB7tj7k7MMae7rCeaoLrwCVvN5
	 HCxLrho3XsG+rSkLBfhkyoo2po1RiyJi0j3CjAUs=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 525Nxc0c052912
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 5 Mar 2025 17:59:38 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 5
 Mar 2025 17:59:37 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 5 Mar 2025 17:59:38 -0600
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 525Nxbip047090;
	Wed, 5 Mar 2025 17:59:37 -0600
From: <a-christidis@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <afd@ti.com>
Subject: [meta-arago][scarthgap/master][PATCH] ti-gc320-tests: Add RDEPENDS ti-gc320-libs-dev
Date: Wed, 5 Mar 2025 17:59:37 -0600
Message-ID: <20250305235937.408253-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 05 Mar 2025 23:59:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15948

From: Antonios Christidis <a-christidis@ti.com>

Include the package ti-gc320-libs-dev as a runtime dependency.
This is needed as the gc320 require the symbolic link of libGAL.so to
run which is located in the ti-gc320-livs-dev package.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
 .../recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb  | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb b/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb
index f9b9685f..e596e684 100644
--- a/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb
+++ b/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb
@@ -4,6 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://dra7x-sdk-ti-gc320-tests_manifest.html;md5=22a001855467f373c47f45de5330e3c9"
 
 DEPENDS = "ti-gc320-libs"
+RDEPENDS:${PN}:append = " ti-gc320-libs-dev"
 
 BRANCH = "ti-${PV}"
 
-- 
2.34.1


