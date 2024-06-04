Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED69FC25B78
	for <webhook@archiver.kernel.org>; Tue,  4 Jun 2024 17:09:52 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.1711.1717520991287398862
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 04 Jun 2024 10:09:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=OeJMvx1V;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 454H9oHj103235;
	Tue, 4 Jun 2024 12:09:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717520990;
	bh=kU1bm7aXU95jXVsIl/ylIm7nOsQhE7Zx8Xd79jQOcic=;
	h=From:To:Subject:Date;
	b=OeJMvx1VceZyrNQJM6gfD2N4TDapZgOb/CSW0J+3ZoJ2B7YMtYvN766LbwF/P4LpH
	 aT0RqGmQhAWCUyAYIsIRD2CdZQ9m8wsWfvYy38bwmp37WAzUngzxH9INY070wiKKH0
	 HRQy7ilhMrPbBxSIx+Z76QmzFBoo0zw+0+8PQjMU=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 454H9o1n020265
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 4 Jun 2024 12:09:50 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 4
 Jun 2024 12:09:49 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 4 Jun 2024 12:09:49 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 454H9nTR025136;
	Tue, 4 Jun 2024 12:09:49 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1sEXfR-0002vc-F7; Tue, 04 Jun 2024 12:09:49 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH v2] arm-ddr-bandwidth: Bandwidth script for testing
Date: Tue, 4 Jun 2024 12:09:49 -0500
Message-ID: <20240604170949.11176-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 04 Jun 2024 17:09:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15365

We need to pull a single script in from the matrix-gui packages since
they are getting removed.  The runLmDDRBandwidth.sh is required for the
ti-test flow.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Removed ${WORKDIR} from LIC_FILES_CHKSUM variable.

 .../arm-ddr-bandwidth/arm-ddr-bandwidth.bb    | 23 +++++++++++++++++++
 .../recipes-core/packagegroups/ti-test.bb     |  1 +
 2 files changed, 24 insertions(+)
 create mode 100644 meta-arago-test/recipes-benchmark/arm-ddr-bandwidth/arm-ddr-bandwidth.bb

diff --git a/meta-arago-test/recipes-benchmark/arm-ddr-bandwidth/arm-ddr-bandwidth.bb b/meta-arago-test/recipes-benchmark/arm-ddr-bandwidth/arm-ddr-bandwidth.bb
new file mode 100644
index 00000000..78f80b55
--- /dev/null
+++ b/meta-arago-test/recipes-benchmark/arm-ddr-bandwidth/arm-ddr-bandwidth.bb
@@ -0,0 +1,23 @@
+SUMMARY = "Benchmark for checking DDR bandwidth"
+HOMEPAGE = "https://git.ti.com/cgit/matrix-gui-v2/matrix-gui-v2-apps/tree/arm_apps/arm_ddr_bandwidth/runLmDDRBandwidth.sh"
+LICENSE = "CC-BY-SA-3.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
+
+PV = "1.0"
+
+SRC_URI = " \
+    https://git.ti.com/cgit/matrix-gui-v2/matrix-gui-v2-apps/plain/arm_apps/arm_ddr_bandwidth/runLmDDRBandwidth.sh;name=runLmDDRBandwidth \
+    https://git.ti.com/cgit/matrix-gui-v2/matrix-gui-v2-apps/plain/LICENSE;name=license \
+"
+SRC_URI[runLmDDRBandwidth.sha256sum] = "67997d721b351344d8788200a15bb3640093045bc25f2b5307dd331ebd1556a3"
+SRC_URI[license.sha256sum] = "7febd1df714fa4b1e44fe0b0f73ceac7f9b9f97326695a0cc7074bd6c8d263e3"
+
+S = "${WORKDIR}"
+
+do_install() {
+    install -d ${D}${datadir}/matrix-gui-2.0/apps
+    install -m 0644 ${S}/runLmDDRBandwidth.sh ${D}${datadir}/matrix-gui-2.0/apps/runLmDDRBandwidth.sh
+}
+
+FILES:${PN} = "${datadir}/matrix-gui-2.0/apps/runLmDDRBandwidth.sh"
+
diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
index 4dbd9fca..b71c374b 100644
--- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
@@ -69,6 +69,7 @@ TI_TEST_BASE:append:armv7ve = " \
 #    timestamping
 TI_TEST_TI_TOOLS = " \
     arm-benchmarks \
+    arm-ddr-bandwidth \
     cpuloadgen \
     input-utils \
     ltp-ddt \
-- 
2.17.1


