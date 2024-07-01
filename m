Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7D5AC2BD09
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 21:34:34 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.9685.1719869665908833586
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 01 Jul 2024 14:34:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=u/pJxubD;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 461LYMH3098589;
	Mon, 1 Jul 2024 16:34:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1719869662;
	bh=ebZUpAUdtNOOCInWYlmAiSnSg+55bBaCB6rDD51gb2c=;
	h=From:To:Subject:Date;
	b=u/pJxubDHtlYtG26hz3Mz8KwZ7odrdTqt6JPwcJOiftt1EnE9aOWZ0dsJWFtODH5c
	 J853efxBREIDR1rCtkVZ1CPaFTbsCfFAseVTUt2RYD4ORYeux7TbtgSSwW3tVQA6w5
	 jQv/nY+EBE+HPjXH/gmbSeB2u0XY1a4GnxHVKhUw=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 461LYMMD023568
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 1 Jul 2024 16:34:22 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 1
 Jul 2024 16:34:22 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 1 Jul 2024 16:34:22 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 461LYMUi107381;
	Mon, 1 Jul 2024 16:34:22 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1sOOfG-0001c0-0R; Mon, 01 Jul 2024 16:34:22 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH v2] openssl-perf: Add openssl_aes256_encdec.sh script
Date: Mon, 1 Jul 2024 16:34:21 -0500
Message-ID: <20240701213421.6004-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 01 Jul 2024 21:34:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15426

This is an additional openssl script that our testing flow requires.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-benchmark/openssl-perf/openssl-perf.bb   | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta-arago-test/recipes-benchmark/openssl-perf/openssl-perf.bb b/meta-arago-test/recipes-benchmark/openssl-perf/openssl-perf.bb
index 02f41f41..e5fcf450 100644
--- a/meta-arago-test/recipes-benchmark/openssl-perf/openssl-perf.bb
+++ b/meta-arago-test/recipes-benchmark/openssl-perf/openssl-perf.bb
@@ -1,5 +1,5 @@
-SUMMARY = "Benchmark for checking various OpenSSL performance functions"
-HOMEPAGE = "https://git.ti.com/cgit/matrix-gui-v2/matrix-gui-v2-apps/tree/cryptos_apps_scripts/openssl_perf_scripts/openssl_perf.sh"
+SUMMARY = "Benchmarks for checking various OpenSSL performance functions"
+HOMEPAGE = "https://git.ti.com/cgit/matrix-gui-v2/matrix-gui-v2-apps/tree/cryptos_apps_scripts/"
 LICENSE = "CC-BY-SA-3.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
 
@@ -7,9 +7,11 @@ PV = "1.0"
 
 SRC_URI = " \
     https://git.ti.com/cgit/matrix-gui-v2/matrix-gui-v2-apps/plain/cryptos_apps_scripts/openssl_perf_scripts/openssl_perf.sh;name=openssl_perf \
+    https://git.ti.com/cgit/matrix-gui-v2/matrix-gui-v2-apps/plain/cryptos_apps_scripts/openssl_aes256_encdec_scripts/openssl_aes256_encdec.sh;name=openssl_aes256_encdec \
     https://git.ti.com/cgit/matrix-gui-v2/matrix-gui-v2-apps/plain/LICENSE;name=license \
 "
 SRC_URI[openssl_perf.sha256sum] = "1ba5188beb6a1fa69d9f34df12c596ed49907c2b2d2ce2d985a305b9ecbed800"
+SRC_URI[openssl_aes256_encdec.sha256sum] = "c63efc35f7c161e02ef6d53b428bfbfce7ea3f2d329c552dbb04f865317eb408"
 SRC_URI[license.sha256sum] = "7febd1df714fa4b1e44fe0b0f73ceac7f9b9f97326695a0cc7074bd6c8d263e3"
 
 S = "${WORKDIR}"
@@ -17,7 +19,11 @@ S = "${WORKDIR}"
 do_install() {
     install -d ${D}${bindir}
     install -m 0755 ${S}/openssl_perf.sh ${D}${bindir}/openssl_perf.sh
+    install -m 0755 ${S}/openssl_aes256_encdec.sh ${D}${bindir}/openssl_aes256_encdec.sh
 }
 
-FILES:${PN} = "${bindir}/openssl_perf.sh"
+FILES:${PN} = "\
+    ${bindir}/openssl_perf.sh \
+    ${bindir}/openssl_aes256_encdec.sh \
+"
 
-- 
2.17.1


