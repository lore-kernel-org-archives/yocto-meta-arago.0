Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E07AEC27C5E
	for <webhook@archiver.kernel.org>; Mon, 10 Jun 2024 15:07:11 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.21868.1718032023361131562
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 10 Jun 2024 08:07:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=kmGoyjSX;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45AF71De012825;
	Mon, 10 Jun 2024 10:07:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718032021;
	bh=hPxZ4H2Xauc05FKlz1PB0Z86NYnkle75wb07JntH8qY=;
	h=From:To:Subject:Date;
	b=kmGoyjSXsBg6M1mLOpYu/UiuAf+PWDvzyVbZBj1Ki9OCBcTU/N9ULTjWcfJuS/glK
	 ZHzRvZjtbJosaPcoaolrMHCXS0zEAMvWaZxelbkYMv4xr8H4e1qnbs+wM57RDJdI3x
	 gcv0XLAgIdTb//bVve19k5+yrAojCdj7gRwkSMew=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45AF71se028937
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 10 Jun 2024 10:07:01 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 10
 Jun 2024 10:07:01 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 10 Jun 2024 10:07:01 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45AF711S002107;
	Mon, 10 Jun 2024 10:07:01 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1sGgbt-0003Ur-Ar; Mon, 10 Jun 2024 10:07:01 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH] openssl-perf: Performance script for testing
Date: Mon, 10 Jun 2024 10:07:01 -0500
Message-ID: <20240610150701.13401-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 10 Jun 2024 15:07:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15380

We need to pull a single script in from the matrix-gui packages since
they are getting removed.  The openssl_perf.sh is required for the
ti-test flow.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../openssl-perf/openssl-perf.bb              | 23 +++++++++++++++++++
 .../recipes-core/packagegroups/ti-test.bb     |  1 +
 2 files changed, 24 insertions(+)
 create mode 100644 meta-arago-test/recipes-benchmark/openssl-perf/openssl-perf.bb

diff --git a/meta-arago-test/recipes-benchmark/openssl-perf/openssl-perf.bb b/meta-arago-test/recipes-benchmark/openssl-perf/openssl-perf.bb
new file mode 100644
index 00000000..02f41f41
--- /dev/null
+++ b/meta-arago-test/recipes-benchmark/openssl-perf/openssl-perf.bb
@@ -0,0 +1,23 @@
+SUMMARY = "Benchmark for checking various OpenSSL performance functions"
+HOMEPAGE = "https://git.ti.com/cgit/matrix-gui-v2/matrix-gui-v2-apps/tree/cryptos_apps_scripts/openssl_perf_scripts/openssl_perf.sh"
+LICENSE = "CC-BY-SA-3.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
+
+PV = "1.0"
+
+SRC_URI = " \
+    https://git.ti.com/cgit/matrix-gui-v2/matrix-gui-v2-apps/plain/cryptos_apps_scripts/openssl_perf_scripts/openssl_perf.sh;name=openssl_perf \
+    https://git.ti.com/cgit/matrix-gui-v2/matrix-gui-v2-apps/plain/LICENSE;name=license \
+"
+SRC_URI[openssl_perf.sha256sum] = "1ba5188beb6a1fa69d9f34df12c596ed49907c2b2d2ce2d985a305b9ecbed800"
+SRC_URI[license.sha256sum] = "7febd1df714fa4b1e44fe0b0f73ceac7f9b9f97326695a0cc7074bd6c8d263e3"
+
+S = "${WORKDIR}"
+
+do_install() {
+    install -d ${D}${bindir}
+    install -m 0755 ${S}/openssl_perf.sh ${D}${bindir}/openssl_perf.sh
+}
+
+FILES:${PN} = "${bindir}/openssl_perf.sh"
+
diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
index b71c374b..8cb27f21 100644
--- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
@@ -73,6 +73,7 @@ TI_TEST_TI_TOOLS = " \
     cpuloadgen \
     input-utils \
     ltp-ddt \
+    openssl-perf \
     uvc-gadget \
 "
 
-- 
2.17.1


