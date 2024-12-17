Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A703CE77187
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 21:02:10 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.91648.1734469328885902005
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 17 Dec 2024 13:02:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=DNmphXND;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BHL27ca3528272
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Dec 2024 15:02:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734469327;
	bh=F8L0eYRKm1C4g3End0C79wHC6rslT5qe1Ss8G4FOgys=;
	h=From:To:CC:Subject:Date;
	b=DNmphXND4ZIf2p0+4pYwKATZj2R8SkkwRVDfuZrqIB/tekxQ4ZdBrtRjB7f7lgk9B
	 dnGc121mGOD49V8+rv7etxna1BgXPXsL6yKa/sFxgPpRNQp4xksj3q9hfMXhEMfEXd
	 LXYwyUwrBPrbHOx7gmqpt4mk8O/MQJ8dpnmFxH58=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BHL27UD030056
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 Dec 2024 15:02:07 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 17
 Dec 2024 15:02:07 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 17 Dec 2024 15:02:07 -0600
Received: from lelvsmtp6.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BHL262a042172;
	Tue, 17 Dec 2024 15:02:07 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][scarthgap/master][PATCH 1/3] ti-demos: Add pdm-anomaly-detection for all platforms
Date: Tue, 17 Dec 2024 15:02:04 -0600
Message-ID: <20241217210206.47052-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 17 Dec 2024 21:02:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15666

There is nothing in this demo that makes it specific to any board.
Enable this for all devices.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../recipes-core/packagegroups/ti-demos.bb             | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-demos.bb b/meta-arago-distro/recipes-core/packagegroups/ti-demos.bb
index 7bccb4de..91e469e7 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-demos.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-demos.bb
@@ -1,17 +1,9 @@
 SUMMARY = "TI World packagegroup"
 LICENSE = "MIT"
 
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
 inherit packagegroup
 
-PDM_ANOMALY_PKG = "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'pdm-anomaly-detection', '', d)}"
-
-PDM_ANOMALY = ""
-PDM_ANOMALY:ti33x = "${PDM_ANOMALY_PKG}"
-PDM_ANOMALY:ti43x = "${PDM_ANOMALY_PKG}"
-PDM_ANOMALY:omap-a15 = "${PDM_ANOMALY_PKG}"
-PDM_ANOMALY:am65xx = "${PDM_ANOMALY_PKG}"
+PDM_ANOMALY = "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'pdm-anomaly-detection', '', d)}"
 
 RDEPENDS:${PN} = "\
     ${PDM_ANOMALY} \
-- 
2.39.2


