Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CA1CC2BD09
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 14:37:16 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.21725.1719844634913244183
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 01 Jul 2024 07:37:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=x7vYqm66;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 461EbDs8047740;
	Mon, 1 Jul 2024 09:37:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1719844633;
	bh=oMoe3733kueJQQyQYOSo3eDuOwxAg8T5mJb/jwkscs8=;
	h=From:To:Subject:Date;
	b=x7vYqm66XnpVDMtmHVNnDuiOJ4d37HFXjni87J7VKbZvGSomRRrDpbeH03e2o955h
	 e9TcvCE94373+VQWAgQIr9jQ0wGCuhObWUHwZVW7gPZ4w0l8NEzZcOB60ALgSpQ1ft
	 BPMKbluD1E0P8to+VdKdPkYNM/aJImsnqQlf87yo=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 461EbCRR002512
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 1 Jul 2024 09:37:12 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 1
 Jul 2024 09:37:12 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 1 Jul 2024 09:37:12 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 461EbCs4039497;
	Mon, 1 Jul 2024 09:37:12 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1sOI9Y-0006uE-E3; Mon, 01 Jul 2024 09:37:12 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] openssl-perf: Add openssl_aes256_encdec.sh script
Date: Mon, 1 Jul 2024 09:37:12 -0500
Message-ID: <20240701143712.26506-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 01 Jul 2024 14:37:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15421

This is an additional openssl script that our testing flow requires.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-benchmark/openssl-perf/openssl-perf.bb        | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-arago-test/recipes-benchmark/openssl-perf/openssl-perf.bb b/meta-arago-test/recipes-benchmark/openssl-perf/openssl-perf.bb
index 8257a561..1d36d489 100644
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
@@ -18,7 +20,9 @@ UNPACKDIR = "${S}"
 do_install() {
     install -d ${D}${bindir}
     install -m 0755 ${S}/openssl_perf.sh ${D}${bindir}/openssl_perf.sh
+    install -m 0755 ${S}/openssl_aes256_encdec.sh ${D}${bindir}/openssl_aes256_encdec.sh
 }
 
 FILES:${PN} = "${bindir}/openssl_perf.sh"
+FILES:${PN} = "${bindir}/openssl_aes256_encdec.sh"
 
-- 
2.17.1


