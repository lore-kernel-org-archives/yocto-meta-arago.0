Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4020EC25B76
	for <webhook@archiver.kernel.org>; Mon,  3 Jun 2024 16:10:48 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.87888.1717431041257443472
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 03 Jun 2024 09:10:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=OA6HE5OH;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 453GAdfN111153;
	Mon, 3 Jun 2024 11:10:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717431039;
	bh=xc0jGMGUicq3xHvLv+8ZNIZ+f6qKpp7SCfdisG/Vi/E=;
	h=From:To:Subject:Date;
	b=OA6HE5OHU26yhg0iXUIcXe0AFwsUqf1ykXO4TnH75c6ZBPH2zB/Jnn0KIS903LWm0
	 VWXSA1fQwCvv+nNKjfrLdMJHmyBcGgxUWIg1siQKryfboDylpbSj1ZC2IuKlW2LJcp
	 qiBKV42g5UW8wRLuT4CKwsWXkWRArh4td3uq7ng8=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 453GAdxP005081
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 3 Jun 2024 11:10:39 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 3
 Jun 2024 11:10:39 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 3 Jun 2024 11:10:39 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 453GAdpU051556;
	Mon, 3 Jun 2024 11:10:39 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1sEAGd-0004Dd-AW; Mon, 03 Jun 2024 11:10:39 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] arm-ddr-bandwidth: Bandwidth script for testing
Date: Mon, 3 Jun 2024 11:10:38 -0500
Message-ID: <20240603161039.16176-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 03 Jun 2024 16:10:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15353

We need to pull a single script in from the matrix-gui packages since
they are getting removed.  The runLmDDRBandwidth.sh is required for the
ti-test flow.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../arm-ddr-bandwidth/arm-ddr-bandwidth.bb    | 24 +++++++++++++++++++
 .../recipes-core/packagegroups/ti-test.bb     |  1 +
 2 files changed, 25 insertions(+)
 create mode 100644 meta-arago-test/recipes-benchmark/arm-ddr-bandwidth/arm-ddr-bandwidth.bb

diff --git a/meta-arago-test/recipes-benchmark/arm-ddr-bandwidth/arm-ddr-bandwidth.bb b/meta-arago-test/recipes-benchmark/arm-ddr-bandwidth/arm-ddr-bandwidth.bb
new file mode 100644
index 00000000..9155e0bb
--- /dev/null
+++ b/meta-arago-test/recipes-benchmark/arm-ddr-bandwidth/arm-ddr-bandwidth.bb
@@ -0,0 +1,24 @@
+SUMMARY = "Benchmark for checking DDR bandwidth"
+HOMEPAGE = "https://git.ti.com/cgit/matrix-gui-v2/matrix-gui-v2-apps/tree/arm_apps/arm_ddr_bandwidth/runLmDDRBandwidth.sh"
+LICENSE = "CC-BY-SA-3.0"
+LIC_FILES_CHKSUM = "file://${UNPACKDIR}/LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
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
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
+
+do_install() {
+    install -d ${D}${datadir}/matrix-gui-2.0/apps
+    install -m 0755 ${S}/runLmDDRBandwidth.sh ${D}${datadir}/matrix-gui-2.0/apps/runLmDDRBandwidth.sh
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


