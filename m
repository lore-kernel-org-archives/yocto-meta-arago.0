Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E138FC2BD09
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 21:33:04 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.9649.1719869580543137864
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 01 Jul 2024 14:33:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=MNpdPi+7;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 461LWxLm124716;
	Mon, 1 Jul 2024 16:32:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1719869579;
	bh=ecj9xLZidnpZdmS+EyEmw3QmImSDxxs89mDwh1/mppc=;
	h=From:To:Subject:Date;
	b=MNpdPi+7y9pjCM7+o0nCgtJvhIqyWPyF4WyGAfYqDVsChCbmGpm+j7Hq0uQU4Sud2
	 vCXon94jBDJrDLPxz20CpDKC2+sIlmwv9ny7AYkv5TAz9H7E6lrvaaBy6h2O3kNPIJ
	 lMASQwg4xqWdM0AXFYhDvxi5ICSylLiKXv23d3gg=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 461LWxZv050732
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 1 Jul 2024 16:32:59 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 1
 Jul 2024 16:32:59 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 1 Jul 2024 16:32:59 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 461LWxYe105660;
	Mon, 1 Jul 2024 16:32:59 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1sOOdv-0000mK-6W; Mon, 01 Jul 2024 16:32:59 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH v2] openssl-perf: Add openssl_aes256_encdec.sh script
Date: Mon, 1 Jul 2024 16:32:59 -0500
Message-ID: <20240701213259.2852-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 01 Jul 2024 21:33:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15425

This is an additional openssl script that our testing flow requires.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Fix FILES.

 .../recipes-benchmark/openssl-perf/openssl-perf.bb   | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta-arago-test/recipes-benchmark/openssl-perf/openssl-perf.bb b/meta-arago-test/recipes-benchmark/openssl-perf/openssl-perf.bb
index 8257a561..2aeae2a1 100644
--- a/meta-arago-test/recipes-benchmark/openssl-perf/openssl-perf.bb
+++ b/meta-arago-test/recipes-benchmark/openssl-perf/openssl-perf.bb
@@ -1,5 +1,5 @@
-SUMMARY = "Benchmark for checking various OpenSSL performance functions"
-HOMEPAGE = "https://git.ti.com/cgit/matrix-gui-v2/matrix-gui-v2-apps/tree/cryptos_apps_scripts/openssl_perf_scripts/openssl_perf.sh"
+SUMMARY = "Benchmarks for checking various OpenSSL performance functions"
+HOMEPAGE = "https://git.ti.com/cgit/matrix-gui-v2/matrix-gui-v2-apps/tree/cryptos_apps_scripts/"
 LICENSE = "CC-BY-SA-3.0"
 LIC_FILES_CHKSUM = "file://${UNPACKDIR}/LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
 
@@ -7,9 +7,11 @@ PV = "1.0"
 
 SRC_URI = " \
     https://git.ti.com/cgit/matrix-gui-v2/matrix-gui-v2-apps/plain/cryptos_apps_scripts/openssl_perf_scripts/openssl_perf.sh;name=openssl_perf \
+    https://git.ti.com/cgit/matrix-gui-v2/matrix-gui-v2-apps/plain/cryptos_apps_scripts/openssl_aes256_encdec_scripts/openssl_aes256_encdec.sh;name=openssl_aes256_encdec \
     https://git.ti.com/cgit/matrix-gui-v2/matrix-gui-v2-apps/plain/LICENSE;name=license \
 "
 SRC_URI[openssl_perf.sha256sum] = "1ba5188beb6a1fa69d9f34df12c596ed49907c2b2d2ce2d985a305b9ecbed800"
+SRC_URI[openssl_aes256_encdec.sha256sum] = "c63efc35f7c161e02ef6d53b428bfbfce7ea3f2d329c552dbb04f865317eb408"
 SRC_URI[license.sha256sum] = "7febd1df714fa4b1e44fe0b0f73ceac7f9b9f97326695a0cc7074bd6c8d263e3"
 
 S = "${WORKDIR}/sources"
@@ -18,7 +20,11 @@ UNPACKDIR = "${S}"
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


