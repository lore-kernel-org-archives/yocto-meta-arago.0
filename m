Return-Path: <e-ruei1@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id D8CB4529F1
	for <meta-arago@arago-project.org>;
	Tue, 21 Aug 2018 22:29:34 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7LMTR4r083586
	for <meta-arago@arago-project.org>; Tue, 21 Aug 2018 17:29:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1534890567;
	bh=FKr3L6vTceL1R/aqWolBwNxq7MVczoWwqYOA+Om9UVo=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=bOqhhiFXhD5ZcykuP/GKTuSJrfVUMdGTfC/j7EvCuoxjWa7qePA1xSGIDYfQr4fC4
	XYe9LIN9mOLUKX4pdFjua3al12+qvLdXA2JrVan3LulizJ5eKNt4EYofprddjeWBWG
	aF1ViIKW9W++Qm7/DU8GoErrM2EAf11VqdWntrFI=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7LMTRgD026290
	for <meta-arago@arago-project.org>; Tue, 21 Aug 2018 17:29:27 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 21 Aug 2018 17:29:26 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 21 Aug 2018 17:29:26 -0500
Received: from uda0850410.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7LMTPKt031317
	for <meta-arago@arago-project.org>; Tue, 21 Aug 2018 17:29:26 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 21 Aug 2018 18:29:22 -0400
Message-ID: <1534890562-62245-5-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1534890562-62245-1-git-send-email-e-ruei1@ti.com>
References: <1534890562-62245-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH v2 4/4] packagegroup-arago-toolchain-tidsk-target: add GTK packagegroup
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
X-List-Received-Date: Tue, 21 Aug 2018 22:29:35 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../packagegroups/packagegroup-arago-toolchain-tisdk-target.bb   | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb
index 52e3456..75c190d 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to build and install header and libs into the sdk"
 LICENSE = "MIT"
-PR = "r12"
+PR = "r13"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -12,6 +12,12 @@ QT_TOOLCHAIN_TARGET = "\
 QT_TOOLCHAIN_TARGET_keystone = ""
 QT_TOOLCHAIN_TARGET_omapl138 = ""
 
+GTK_TOOLCHAIN_TARGET = "\
+    packagegroup-arago-gtk-sdk-target \
+"
+GTK_TOOLCHAIN_TARGET_keystone = ""
+GTK_TOOLCHAIN_TARGET_omapl138 = ""
+
 TISDK_TOOLCHAIN_BASE_TARGET = "\
     packagegroup-arago-standalone-sdk-target \
     packagegroup-arago-tisdk-multimedia-sdk-target \
@@ -26,6 +32,7 @@ TISDK_TOOLCHAIN_EXTRA_TARGET_omapl138 = ""
 
 RDEPENDS_${PN} = "\
     ${QT_TOOLCHAIN_TARGET} \
+    ${GTK_TOOLCHAIN_TARGET} \
     ${TISDK_TOOLCHAIN_BASE_TARGET} \
     ${TISDK_TOOLCHAIN_EXTRA_TARGET} \
     ${@bb.utils.contains('MACHINE_FEATURES','sgx','packagegroup-arago-tisdk-graphics-sdk-target','',d)} \
-- 
1.9.1


