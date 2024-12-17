Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F9F5E7717F
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 21:02:10 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.91650.1734469329380533633
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 17 Dec 2024 13:02:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ZAeWlpd1;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BHL28LZ3528276
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Dec 2024 15:02:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734469328;
	bh=sttob6ZhauXSnk1pN3972SRkt9tQth6wcNMxSdfGrzw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ZAeWlpd1nHFWNatiRLjVlGBcPa6gbiFZsmtRGVcgzMGWJhnGgTXYX60m1P69KaFZD
	 iRupOENnL8r7mrknmT2noXl/J+ACj+bHGjpehYEZzj1zp3uGtJ8tSWLwLqhocwLI5x
	 y1rYI8bJbu6Z5YHtKtwaTHvLTNynmoXoR2lcxrUQ=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BHL27Dr030063
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 Dec 2024 15:02:07 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 17
 Dec 2024 15:02:07 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 17 Dec 2024 15:02:07 -0600
Received: from lelvsmtp6.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BHL262c042172;
	Tue, 17 Dec 2024 15:02:07 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][scarthgap/master][PATCH 3/3]  packagegroup-arago-tisdk-hmi: Enable HMI demos for all platforms
Date: Tue, 17 Dec 2024 15:02:06 -0600
Message-ID: <20241217210206.47052-3-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241217210206.47052-1-afd@ti.com>
References: <20241217210206.47052-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 17 Dec 2024 21:02:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15667

There is nothing in this demo that makes it specific to any board.
Enable these for all devices.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../packagegroup-arago-tisdk-hmi.bb           | 27 +------------------
 1 file changed, 1 insertion(+), 26 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi.bb
index a8261bf2..ca528d3d 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi.bb
@@ -2,35 +2,10 @@ SUMMARY = "Task to add HMI related packages"
 LICENSE = "MIT"
 PR = "r0"
 
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
 inherit packagegroup
 
-HMI = " \
-"
-
-
-HMI:append:ti33x = " \
+RDEPENDS:${PN} = "\
     evse-hmi \
     protection-relays-hmi \
     mmwavegesture-hmi \
 "
-
-HMI:append:ti43x = " \
-    evse-hmi \
-    mmwavegesture-hmi \
-"
-
-HMI:append:omap-a15 = " \
-    evse-hmi \
-    mmwavegesture-hmi \
-"
-
-HMI:append:am65xx = " \
-    evse-hmi \
-    mmwavegesture-hmi \
-"
-
-RDEPENDS:${PN} = "\
-	${HMI} \
-"
-- 
2.39.2


