Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 4C1F852998
	for <meta-arago@arago-project.org>;
	Mon, 17 Jun 2019 17:38:40 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5HHbxJL113713
	for <meta-arago@arago-project.org>; Mon, 17 Jun 2019 12:37:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1560793079;
	bh=7UsVchJ7K0UswR2+95EGuK3DarGMp69o34fml18yDtE=;
	h=From:To:CC:Subject:Date;
	b=YNt+YXoOCVw2wBDWo8tOFTsJPp2L9iNAtX/RvA+t5T75nnGoLs3hRurNkdFIRbWXB
	l9r3LteaC8mt7CpLdBinn3RYmiEK2KcYLBPY1+os/O5qO+vYKWR6mG8lze7WqHhUWP
	7r3ECa11VaKqRu861sKiLauFi4mG1R0rLLL0txDc=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5HHbxhm029245
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 17 Jun 2019 12:37:59 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 17 Jun 2019 12:37:58 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 17 Jun 2019 12:37:58 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5HHbwmm045382;
	Mon, 17 Jun 2019 12:37:58 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 17 Jun 2019 13:21:49 -0400
Message-ID: <1560792109-26034-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud/ti2019.01][PATCH] matrix-gui-crypto-demos: configure to use openssl 1.0
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Jun 2019 17:38:41 -0000
Content-Type: text/plain

The openssl_perf.sh script requires HW offloading, so use openssl 1.0
which supports it.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb       | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb
index 02a4f46..99cf9c9 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
 
 require matrix-gui-apps-git.inc
 
-PR = "${INC_PR}.11"
+PR = "${INC_PR}.12"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -13,10 +13,16 @@ S_ti43x = "${WORKDIR}/git/cryptos_apps_program"
 S_dra7xx = "${WORKDIR}/git/cryptos_apps_program"
 S_keystone = "${WORKDIR}/git/cryptos_apps_program"
 
+# These scripts HW offloading, so use openssl 1.0
+OPENSSL_BIN = "/usr/bin/openssl10"
+do_configure() {
+    sed -i -e "s|^OPENSSL=.*|OPENSSL=${OPENSSL_BIN}|" ${S}/openssl_perf_scripts/openssl_perf.sh
+}
+
 FILES_${PN} += "${MATRIX_BASE_DIR}/*"
 
-# Make sure crypto submenu and app images has been installed. Also make sure openssl is available
-RDEPENDS_${PN} += "matrix-gui-apps-images matrix-gui-submenus-cryptos openssl matrix-gui-helper-scripts"
+# Make sure crypto submenu and app images has been installed. Also make sure openssl10 is available
+RDEPENDS_${PN} += "matrix-gui-apps-images matrix-gui-submenus-cryptos openssl10 matrix-gui-helper-scripts"
 
 RDEPENDS_${PN}_append_ti33x = " ti-crypto-examples"
 RDEPENDS_${PN}_append_ti43x = " ti-crypto-examples"
-- 
2.7.4


