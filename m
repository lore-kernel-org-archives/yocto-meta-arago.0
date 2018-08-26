Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 0E0F252A0E
	for <meta-arago@arago-project.org>;
	Sun, 26 Aug 2018 14:16:19 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7QEGCZv083180
	for <meta-arago@arago-project.org>; Sun, 26 Aug 2018 09:16:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1535292972;
	bh=/sFm8FU9O01Gl7sk+XAP5hOXiBts4aW/MT4HXtZF0VA=;
	h=From:To:CC:Subject:Date;
	b=E1GjifplPLf046kZFvpMxkA1HiUqIR9lM2K0GsHsYQRpjzpvc1Hq+JXcaR3G+xXA5
	t4feHbGmKdLSQdzdFtryKivQpAbi4e63mcpctGBz9nzrckc8L8SVXK661Hsce1oVc5
	316okT2TdM8EOgZraIq1sA0Fy/LaX8mwYBUIRVAg=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7QEGCCl021047
	for <meta-arago@arago-project.org>; Sun, 26 Aug 2018 09:16:12 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Sun, 26 Aug 2018 09:16:11 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Sun, 26 Aug 2018 09:16:12 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7QEGBYu009882;
	Sun, 26 Aug 2018 09:16:11 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Sun, 26 Aug 2018 10:03:50 -0400
Message-ID: <1535292232-24309-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH v2 2/4] packagegroup-*-sdk-host: k3: add missing sources
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
X-List-Received-Date: Sun, 26 Aug 2018 14:16:20 -0000
Content-Type: text/plain

* Add cryptodev-module-src.
* Remove MATRIX_GUI override, thus enabling matrix-gui-browser-src
  and refresh-screen-src.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-crypto-sdk-host.bb          | 3 ++-
 .../packagegroups/packagegroup-arago-tisdk-matrix-sdk-host.bb          | 3 +--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-host.bb
index 59593e8..e87d8c2 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-host.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install crypto sources in SDK"
 LICENSE = "MIT"
-PR = "r10"
+PR = "r11"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -16,6 +16,7 @@ CRYPTO_RDEPENDS_append_ti33x = " cryptodev-module-src"
 CRYPTO_RDEPENDS_append_ti43x = " cryptodev-module-src"
 CRYPTO_RDEPENDS_append_dra7xx = " cryptodev-module-src"
 CRYPTO_RDEPENDS_append_keystone = " cryptodev-module-src"
+CRYPTO_RDEPENDS_append_k3 = " cryptodev-module-src"
 
 RDEPENDS_${PN} = "\
     ${CRYPTO_RDEPENDS} \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix-sdk-host.bb
index 078adab..11355fc 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix-sdk-host.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install Matrix v2 and associated applications sources in the SDK"
 LICENSE = "MIT"
-PR = "r6"
+PR = "r7"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -13,7 +13,6 @@ MATRIX_GUI = " \
 
 MATRIX_GUI_keystone = ""
 MATRIX_GUI_omapl138 = ""
-MATRIX_GUI_k3 = ""
 
 RDEPENDS_${PN} = "\
     matrix-gui-src \
-- 
2.7.4


