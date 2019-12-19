Return-Path: <denys@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 4735F529A8
	for <meta-arago@arago-project.org>;
	Thu, 19 Dec 2019 19:07:02 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBJJ5OSu121619
	for <meta-arago@arago-project.org>; Thu, 19 Dec 2019 13:05:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1576782324;
	bh=S+qjkf4XVxdITL6F4i8MR8O0j8nSxZojAUK6A777FyI=;
	h=From:To:CC:Subject:Date;
	b=Trwy2OidRz/r9nkp87IYMEKLEFz8BJGQLoWS7Ph38nk+gQVyQ8JDJl1avi2sxe3RJ
	izw7+0vTnjqpGPDW48VHVzJo+TyWBaUDtoHGP+UchxDrZDrMG3LJBlQEL1dXdg5k+7
	SgFN/cIWYeSytzbEOlApS/w9ovM+WYNbtjjswXkI=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBJJ5ONJ036980
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 19 Dec 2019 13:05:24 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Thu, 19 Dec 2019 13:05:24 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Thu, 19 Dec 2019 13:05:24 -0600
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBJJ5NDX096010;
	Thu, 19 Dec 2019 13:05:23 -0600
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 19 Dec 2019 18:46:40 +0000
Message-ID: <20191219184640.19332-1-denys@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [RFC][PATCH] packagegroup-*-addons: move all remaining dev tools out of default rootfs
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
X-List-Received-Date: Thu, 19 Dec 2019 19:07:02 -0000
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-addons.bb      | 8 --------
 .../recipes-core/packagegroups/packagegroup-ti-world.bb   | 8 ++++++++
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 14b2370c..86913bd5 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -130,13 +130,6 @@ EXTRA_LIBS_append_ti33x = " \
     uio-module-drv \
 "
 
-DEVTOOLS = " \
-    linux-libc-headers-dev \
-    packagegroup-core-buildessential \
-    packagegroup-core-tools-debug \
-    git \
-"
-
 EXTRA_PACKAGES = " \
     nodejs \
     nodejs-npm \
@@ -192,7 +185,6 @@ EXTRA_PACKAGES_append_k2g-evm  = " pruss-lld-apps"
 RDEPENDS_${PN} = "\
     ${UTILS} \
     ${UTILS_UBOOT_FW} \
-    ${DEVTOOLS} \
     ${EXTRA_LIBS} \
 "
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ti-world.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-ti-world.bb
index 36b3f66b..00a97470 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ti-world.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-ti-world.bb
@@ -14,6 +14,13 @@ CHROMIUM_append_k3 = "\
     chromium-wayland \
 "
 
+DEVTOOLS = " \
+    linux-libc-headers-dev \
+    packagegroup-core-buildessential \
+    packagegroup-core-tools-debug \
+    git \
+"
+
 RDEPENDS_${PN} = "\
     packagegroup-arago-base \
     packagegroup-arago-console \
@@ -36,4 +43,5 @@ RDEPENDS_${PN} = "\
     ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-tisdk-hmi','packagegroup-arago-base-tisdk-server-extra',d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', "${CHROMIUM}", '', d)} \
     ${@bb.utils.contains('MACHINE_FEATURES', 'dsp', 'qt-opencv-opencl-opengl-multithreaded-dev', '', d)} \
+    ${DEVTOOLS} \
 "
-- 
2.17.1


