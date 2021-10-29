Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.1483.1635483978939528520
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 28 Oct 2021 22:06:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=DBRU6zXL;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: yogeshs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 19T56HPT092663;
	Fri, 29 Oct 2021 00:06:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1635483977;
	bh=3h3QFISWttK5t+QksEUOM4VpIgmC/j7eqGLJZr5ajp4=;
	h=From:To:Subject:Date;
	b=DBRU6zXLaGHXw79QHqOnIJfCJN9mECHRvi54g67dnoUXX2Gofd3VZmCDfRfEd03CA
	 UhX0fkT4BfaHfrVTRxS1ET7Red//yexRkJl5nsjrvwpPrC4SMJEAcv1KAAhmm9acpk
	 UD0yhDOVl8NAWAQdexOmNjJ+tk16Q87XFnUJbCKs=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 19T56H2u086315
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 29 Oct 2021 00:06:17 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 29
 Oct 2021 00:06:16 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 29 Oct 2021 00:06:16 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 19T56Gph040785;
	Fri, 29 Oct 2021 00:06:16 -0500
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/dunfell][PATCH] packagegroups: pru-icss: Add support for am64xx
Date: Fri, 29 Oct 2021 05:06:16 +0000
Message-ID: <20211029050616.12440-1-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

This patch is in conjuction with meta-ti patch to add pru-icss for
am64xx: https://lists.yoctoproject.org/g/meta-ti/message/14067

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
---
 .../packagegroup-arago-tisdk-addons-sdk-host.bb             | 6 +++++-
 .../packagegroups/packagegroup-arago-tisdk-addons.bb        | 4 ++--
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb              | 6 +++++-
 3 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
index d42f213d..c44f95ca 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install sources for additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r36"
+PR = "r37"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -53,6 +53,10 @@ UTILS_append_am65xx = " \
     pru-icss-src \
 "
 
+UTILS_append_am64xx = " \
+    pru-icss-src \
+"
+
 EXTRA_LIBS = ""
 
 EXTRA_LIBS_append_omap-a15 = " \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 287cba63..099817c3 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r79"
+PR = "r80"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -64,7 +64,7 @@ UTILS_append_k3 = " mmc-utils \
                     statcol \
 "
 
-UTILS_append_am64xx = " ti-rtos-firmware"
+UTILS_append_am64xx = " ti-rtos-firmware pru-icss"
 UTILS_append_am65xx = " ti-rtos-firmware pru-icss pru-pwm-fw"
 UTILS_append_j7 = " ti-rtos-firmware"
 UTILS_append_j7-evm = " pru-icss"
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 1320ec50..25aa8c38 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -56,7 +56,7 @@ SRC_URI = "\
     file://Makefile_ti-img-rogue-driver \
 "
 
-PR = "r105"
+PR = "r106"
 
 MAKEFILES_MATRIX_GUI = "matrix-gui-browser \
                         refresh-screen \
@@ -197,6 +197,9 @@ MAKEFILES_append_am65xx = " \
 MAKEFILES_append_j7 = " pru-icss \
                             ti-img-rogue-driver \
 "
+MAKEFILES_append_am64xx = " \
+                        pru-icss \
+"
 
 # Use this to export kernel arch to ARCH
 #
@@ -234,6 +237,7 @@ PRU_ICSS_INSTALL_TARGET_omap-a15 = "pru-icss_install_am572x"
 PRU_ICSS_INSTALL_TARGET_k2g = "pru-icss_install_k2g"
 PRU_ICSS_INSTALL_TARGET_am65xx = "pru-icss_install_am65x"
 PRU_ICSS_INSTALL_TARGET_j7 = "pru-icss_install_j721e"
+PRU_ICSS_INSTALL_TARGET_am64xx = "pru-icss_install_am64x"
 
 # Path to toolchains for the various cores in TI SOCs
 #
-- 
2.17.1

