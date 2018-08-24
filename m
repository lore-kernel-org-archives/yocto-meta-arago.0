Return-Path: <j-stiffler@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id E8A4152985
	for <meta-arago@arago-project.org>;
	Fri, 24 Aug 2018 19:37:43 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7OJbabp074581
	for <meta-arago@arago-project.org>; Fri, 24 Aug 2018 14:37:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1535139456;
	bh=oZgurIfj7taTSfO5r1JJ/ERxudxBvPC8oX+uRv62WyQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=sauvtFXt9vzkN4o5BQAiKv0PQBGrJMWy+wLwVfrZB/pn7Emee5hlhvH1b8usqbYS1
	TBY3gdMFNMlSanpo1TL6kAFWso5xCqNXTDJKuSyoiDuPnFmP5OF144tFtiZdHL9Lia
	Y53EngudQcubf+HKQ5b9Pzu476uyV4a6QouGVoTc=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7OJbaOo027189
	for <meta-arago@arago-project.org>; Fri, 24 Aug 2018 14:37:36 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 24 Aug 2018 14:37:35 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 24 Aug 2018 14:37:35 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7OJbZ0q004368;
	Fri, 24 Aug 2018 14:37:35 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 24 Aug 2018 15:25:16 -0400
Message-ID: <1535138718-6772-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1535138718-6772-1-git-send-email-j-stiffler@ti.com>
References: <1535138718-6772-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 2/4] packagegroup-*-sdk-host: k3: add missing sources
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
X-List-Received-Date: Fri, 24 Aug 2018 19:37:44 -0000
Content-Type: text/plain

Add:
* cryptodev-module-src
* matrix-gui-browser

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


