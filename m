Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 0A1FA529FA
	for <meta-arago@arago-project.org>;
	Mon,  6 May 2019 13:12:29 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x46DC1WJ067520
	for <meta-arago@arago-project.org>; Mon, 6 May 2019 08:12:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1557148321;
	bh=ftqEIimyJppVd75//EFjJ3/xsHmYk0Yc22ULxUHgI34=;
	h=From:To:CC:Subject:Date;
	b=yA7Nlw4CtNtIHVPD1H+Hl4WJenDJqf4mA1RsuMH4vReHAf2OH7caKsi1XPbK5NDNw
	Ez3xSdvHJH1cKc9QYaSGH2VPoPUl8x692MrM8cz147+n7rUXjvU1bxfoAIJ3/b0Vlj
	IRsOfoHvIfB5Kw6lC/suMtQqbpNXV3OSIKkjOkt8=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x46DC1BD041930
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 6 May 2019 08:12:01 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 6 May 2019 08:12:01 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 6 May 2019 08:12:01 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x46DC1xI030412;
	Mon, 6 May 2019 08:12:01 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 6 May 2019 08:59:54 -0400
Message-ID: <1557147594-9972-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH] Revert "HACK: FIXME: arago-core-tisdk-image: disable "sdk-host" packagegroups"
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
X-List-Received-Date: Mon, 06 May 2019 13:12:30 -0000
Content-Type: text/plain

This reverts commit 2680dc31f2125f7bbab55d4839721cbad8eb0ef4.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-core/images/arago-core-tisdk-image.inc | 23 +++++++++++-----------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
index da5d44d..76102a1 100644
--- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
@@ -55,15 +55,14 @@ IMAGE_INSTALL_QT = "\
 IMAGE_INSTALL_QT_keystone = ""
 IMAGE_INSTALL_QT_omapl138 = ""
 
-IMAGE_INSTALL = ""
-# Disable all "sdk-host" packagegroups due to issues installing "srcipk" packages
-#    packagegroup-arago-tisdk-addons-sdk-host \
-#    ${@bb.utils.contains('MACHINE_FEATURES','dsp','packagegroup-arago-tisdk-opencl-sdk-host','',d)} \
-#    packagegroup-arago-tisdk-crypto-sdk-host \
-#    ${@bb.utils.contains('MACHINE_FEATURES','sgx','packagegroup-arago-tisdk-graphics-sdk-host','',d)} \
-#    packagegroup-arago-tisdk-matrix-sdk-host \
-#    packagegroup-arago-tisdk-multimedia-sdk-host \
-#    packagegroup-arago-tisdk-hmi-sdk-host \
-#    packagegroup-arago-tisdk-amsdk-sdk-host${ARAGO_KERNEL_SUFFIX} \
-#    ${IMAGE_INSTALL_QT} \
-#"
+IMAGE_INSTALL = "\
+    packagegroup-arago-tisdk-addons-sdk-host \
+    ${@bb.utils.contains('MACHINE_FEATURES','dsp','packagegroup-arago-tisdk-opencl-sdk-host','',d)} \
+    packagegroup-arago-tisdk-crypto-sdk-host \
+    ${@bb.utils.contains('MACHINE_FEATURES','sgx','packagegroup-arago-tisdk-graphics-sdk-host','',d)} \
+    packagegroup-arago-tisdk-matrix-sdk-host \
+    packagegroup-arago-tisdk-multimedia-sdk-host \
+    packagegroup-arago-tisdk-hmi-sdk-host \
+    packagegroup-arago-tisdk-amsdk-sdk-host${ARAGO_KERNEL_SUFFIX} \
+    ${IMAGE_INSTALL_QT} \
+"
-- 
2.7.4


