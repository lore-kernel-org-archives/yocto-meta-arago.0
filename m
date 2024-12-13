Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A08DE7717F
	for <webhook@archiver.kernel.org>; Fri, 13 Dec 2024 15:21:13 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.17925.1734103269073796303
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 13 Dec 2024 07:21:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=gbnIdrcY;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BDFL7s83103637
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 13 Dec 2024 09:21:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734103267;
	bh=OnH3UlGDelx3MI1AbP/6ivbzVsgxrjus8Rl8BijO058=;
	h=From:To:CC:Subject:Date;
	b=gbnIdrcYkZXcjuT4WFPp0CY1IufyXFhuScI0fZOlTQJ78b06lntAoe3J2b7xVpH2x
	 DWc0MhstpvStK3iArHYyoxQdz7gz+u5x3+Wa8JwnCDDMdaXYEek28k8EuDVBlGUFAP
	 SJhtAEa9mG8KbRxHCObiUbD/XvVXBBCtr0kUk7wo=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BDFL7Le041705;
	Fri, 13 Dec 2024 09:21:07 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 13
 Dec 2024 09:21:06 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 13 Dec 2024 09:21:06 -0600
Received: from ula0226330.dhcp.ti.com (ula0226330.dhcp.ti.com [128.247.81.224] (may be forged))
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BDFL69N057859;
	Fri, 13 Dec 2024 09:21:06 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master][PATCH] timestamping: Remove this recipe
Date: Fri, 13 Dec 2024 09:21:06 -0600
Message-ID: <20241213152106.55372-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 13 Dec 2024 15:21:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15657

This uses an old kernel as the source and seems unused. Let's do
a scream test and drop this recipe.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../timestamping/timestamping_4.1.bb          | 24 -------------------
 .../recipes-core/packagegroups/ti-test.bb     |  1 -
 2 files changed, 25 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-kernel/timestamping/timestamping_4.1.bb

diff --git a/meta-arago-extras/recipes-kernel/timestamping/timestamping_4.1.bb b/meta-arago-extras/recipes-kernel/timestamping/timestamping_4.1.bb
deleted file mode 100644
index cdef66db..00000000
--- a/meta-arago-extras/recipes-kernel/timestamping/timestamping_4.1.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-SUMMARY = "Linux Kernel timestamping"
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
-
-SRC_URI = "https://www.kernel.org/pub/linux/kernel/v4.x/linux-${PV}.tar.xz"
-
-SRC_URI[md5sum] = "fe9dc0f6729f36400ea81aa41d614c37"
-SRC_URI[sha256sum] = "caf51f085aac1e1cea4d00dbbf3093ead07b551fc07b31b2a989c05f8ea72d9f"
-
-S = "${WORKDIR}/linux-${PV}"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-do_compile () {
-	cd ${S}/Documentation/networking/timestamping
-	${CC} -o timestamping timestamping.c
-}
-
-do_install () {
-	install -d ${D}${bindir}
-	install -m 0755 ${S}/Documentation/networking/timestamping/timestamping ${D}${bindir}
-}
-
-INSANE_SKIP:${PN} = "ldflags"
diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
index e8458cef..150efb14 100644
--- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
@@ -71,7 +71,6 @@ TI_TEST_BASE:append:armv7ve = " \
     cpuburn-neon \
 "
 
-#    timestamping
 TI_TEST_TI_TOOLS = " \
     arm-benchmarks \
     arm-ddr-bandwidth \
-- 
2.39.2


