Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27575C3DA49
	for <webhook@archiver.kernel.org>; Thu, 11 Jul 2024 16:12:58 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.204.1720714374649916990
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 11 Jul 2024 09:12:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=WbAnBzjQ;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46BGCoS5087198;
	Thu, 11 Jul 2024 11:12:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1720714370;
	bh=yUEtM8w7+SpbhY8KIoqM73vtG7ojDSqk4LkGINjWfyg=;
	h=From:To:Subject:Date;
	b=WbAnBzjQRBUsZSy1mn1uYafuqpyOPu7nUXFZ/cauU6BlyLuwKU4aLh7HoJvQNsmlg
	 ftrCnYkanyCTZ9QQFp8At+HdBCZQolsW8dCexfWqxd5yWKp1+bE0cmFnzhB7ThjQ4y
	 yH7k4IGFCdLlAGKenzCmktGi6eK1JyYJU6eTwuok=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46BGCog7008806
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 11 Jul 2024 11:12:50 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 11
 Jul 2024 11:12:50 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 11 Jul 2024 11:12:50 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46BGCoeM028628;
	Thu, 11 Jul 2024 11:12:50 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1sRwPa-0005i8-DD; Thu, 11 Jul 2024 11:12:50 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] openssl-perf: Add additional scripts
Date: Thu, 11 Jul 2024 11:12:50 -0500
Message-ID: <20240711161250.21913-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 11 Jul 2024 16:12:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15436

Adding a few more missing scripts.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../openssl-perf/openssl-perf.bb              | 24 +++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/meta-arago-test/recipes-benchmark/openssl-perf/openssl-perf.bb b/meta-arago-test/recipes-benchmark/openssl-perf/openssl-perf.bb
index 2aeae2a1..1939b2cf 100644
--- a/meta-arago-test/recipes-benchmark/openssl-perf/openssl-perf.bb
+++ b/meta-arago-test/recipes-benchmark/openssl-perf/openssl-perf.bb
@@ -8,10 +8,20 @@ PV = "1.0"
 SRC_URI = " \
     https://git.ti.com/cgit/matrix-gui-v2/matrix-gui-v2-apps/plain/cryptos_apps_scripts/openssl_perf_scripts/openssl_perf.sh;name=openssl_perf \
     https://git.ti.com/cgit/matrix-gui-v2/matrix-gui-v2-apps/plain/cryptos_apps_scripts/openssl_aes256_encdec_scripts/openssl_aes256_encdec.sh;name=openssl_aes256_encdec \
+    https://git.ti.com/cgit/matrix-gui-v2/matrix-gui-v2-apps/plain/cryptos_apps_scripts/openssl_display_cert_scripts/openssl_display_cert.sh;name=openssl_display_cert \
+    https://git.ti.com/cgit/matrix-gui-v2/matrix-gui-v2-apps/plain/cryptos_apps_scripts/openssl_gen_cert_scripts/openssl_gen_cert.sh;name=openssl_gen_cert \
+    https://git.ti.com/cgit/matrix-gui-v2/matrix-gui-v2-apps/plain/cryptos_apps_scripts/openssl_gen_pubkey_scripts/openssl_gen_pubkey.sh;name=openssl_gen_pubkey \
+    https://git.ti.com/cgit/matrix-gui-v2/matrix-gui-v2-apps/plain/cryptos_apps_scripts/openssl_gen_sha1hash_scripts/openssl_gen_sha1hash.sh;name=openssl_gen_sha1hash \
+    https://git.ti.com/cgit/matrix-gui-v2/matrix-gui-v2-apps/plain/cryptos_apps_scripts/openssl_start_server_scripts/openssl_start_server.sh;name=openssl_start_server \
     https://git.ti.com/cgit/matrix-gui-v2/matrix-gui-v2-apps/plain/LICENSE;name=license \
 "
-SRC_URI[openssl_perf.sha256sum] = "1ba5188beb6a1fa69d9f34df12c596ed49907c2b2d2ce2d985a305b9ecbed800"
-SRC_URI[openssl_aes256_encdec.sha256sum] = "c63efc35f7c161e02ef6d53b428bfbfce7ea3f2d329c552dbb04f865317eb408"
+SRC_URI[openssl_perf.sha256sum] = "5769e841b977d6a858da38826c2cf47c288ed642614c5b6f802409cb3601ab29"
+SRC_URI[openssl_aes256_encdec.sha256sum] = "1a488e3ba98f6f2e5f73c14681b0452ba902aecbb174e4e74b524dda4c5eda7a"
+SRC_URI[openssl_display_cert.sha256sum] = "fbe80fe1afe29f777e346ecd86d89e1f27cedc1bb745a9a9bc5cd38f2d566a3e"
+SRC_URI[openssl_gen_cert.sha256sum] = "47bfc80b88edebcc4d82ee3816bc05b95ca0d42c42e7f3b83e74fa6f9c6c01ef"
+SRC_URI[openssl_gen_pubkey.sha256sum] = "4581e2329afeb814602c4874ffa038d95a4bcc8b23df24d7be25822d0dd6c433"
+SRC_URI[openssl_gen_sha1hash.sha256sum] = "f338f8c3067ebb1c5710b16b91e8b9e38685b05fcc072060ec0c62bd10cefd97"
+SRC_URI[openssl_start_server.sha256sum] = "e23499210f701ef831d39a8c732f34f4b06fb3ba2d069c4a95ef25ae59f3c93e"
 SRC_URI[license.sha256sum] = "7febd1df714fa4b1e44fe0b0f73ceac7f9b9f97326695a0cc7074bd6c8d263e3"
 
 S = "${WORKDIR}/sources"
@@ -21,10 +31,20 @@ do_install() {
     install -d ${D}${bindir}
     install -m 0755 ${S}/openssl_perf.sh ${D}${bindir}/openssl_perf.sh
     install -m 0755 ${S}/openssl_aes256_encdec.sh ${D}${bindir}/openssl_aes256_encdec.sh
+    install -m 0755 ${S}/openssl_display_cert.sh ${D}${bindir}/openssl_display_cert.sh
+    install -m 0755 ${S}/openssl_gen_cert.sh ${D}${bindir}/openssl_gen_cert.sh
+    install -m 0755 ${S}/openssl_gen_pubkey.sh ${D}${bindir}/openssl_gen_pubkey.sh
+    install -m 0755 ${S}/openssl_gen_sha1hash.sh ${D}${bindir}/openssl_gen_sha1hash.sh
+    install -m 0755 ${S}/openssl_start_server.sh ${D}${bindir}/openssl_start_server.sh
 }
 
 FILES:${PN} = "\
     ${bindir}/openssl_perf.sh \
     ${bindir}/openssl_aes256_encdec.sh \
+    ${bindir}/openssl_display_cert.sh \
+    ${bindir}/openssl_gen_cert.sh \
+    ${bindir}/openssl_gen_pubkey.sh \
+    ${bindir}/openssl_gen_sha1hash.sh \
+    ${bindir}/openssl_start_server.sh \
 "
 
-- 
2.17.1


