Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06C33C433F5
	for <webhook@archiver.kernel.org>; Thu,  6 Oct 2022 15:06:41 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web09.178.1665068795711829607
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 06 Oct 2022 08:06:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=NUJcpzxe;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 296F6UwY007899;
	Thu, 6 Oct 2022 10:06:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1665068790;
	bh=8o+VgIgR75e9FL7VK4mLMS7utbG1DRxQSRPdhO5poyc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=NUJcpzxetF1dZA9sngeaz+U8/dJQ072BsEO/KO9B1Z0HYiAxYuQYG1R8MQmHKvpIh
	 lwwnXKgDebC6b5hCYJ564hc56ekTK+8prcILb5KF1DDw99E7n0qYsOTjZJQoJXf/vk
	 x7dMpJUA1whTjl4kzqwMb09fb/GeZiDAgbg/tC3Y=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 296F6Un8010640
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 6 Oct 2022 10:06:30 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Thu, 6 Oct
 2022 10:06:30 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Thu, 6 Oct 2022 10:06:30 -0500
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat.itg.ti.com
 [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 296F6STZ021833;
	Thu, 6 Oct 2022 10:06:29 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master/kirkstone][PATCH 5/7] ti-pru-sw: Remove old
 TI-PRU-SW examples and helpers
Date: Thu, 6 Oct 2022 10:06:26 -0500
Message-ID: <20221006150628.17044-5-afd@ti.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221006150628.17044-1-afd@ti.com>
References: <20221006150628.17044-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 06 Oct 2022 15:06:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14057

The source for these is long gone and they were not the correct
way to use the PRUs these days anyway. Remove them.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../conf/distro/include/arago-source-ipk.inc  |  3 --
 ...ackagegroup-arago-tisdk-addons-sdk-host.bb |  6 ----
 .../ti-pru-sw-app-loader_1.00.00.bb           | 26 ----------------
 .../ti-pru-sw-edma-library_1.00.00.bb         | 30 ------------------
 .../ti-pru-sw-examples_1.00.00.bb             | 31 -------------------
 5 files changed, 96 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-core/ti-pru-sw-app-loader/ti-pru-sw-app-loader_1.00.00.bb
 delete mode 100644 meta-arago-extras/recipes-core/ti-pru-sw-edma-library/ti-pru-sw-edma-library_1.00.00.bb
 delete mode 100644 meta-arago-extras/recipes-core/ti-pru-sw-examples/ti-pru-sw-examples_1.00.00.bb

diff --git a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
index 00a86bb9..a709fd00 100644
--- a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
+++ b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
@@ -100,9 +100,6 @@ SRCIPK_INSTALL_DIR:pn-arm-benchmarks ?= "example-applications/${PN}-${PV}"
 CREATE_SRCIPK:pn-omapconf ?= "1"
 SRCIPK_INSTALL_DIR:pn-omapconf ?= "example-applications/${PN}-${PV}"
 
-CREATE_SRCIPK:pn-ti-pru-sw-examples ?= "1"
-SRCIPK_INSTALL_DIR:pn-ti-pru-sw-examples ?= "example-applications/pru-${PV}"
-
 CREATE_SRCIPK:pn-ti-compat-wireless-wl18xx ?= "1"
 SRCIPK_INSTALL_DIR:pn-ti-compat-wireless-wl18xx ?= "board-support/extra-drivers/${PN}-${PV}"
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
index 52322a86..1814137b 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
@@ -12,12 +12,6 @@ UTILS = " \
     oprofile-example-source \
 "
 
-# ti-pru-sw-edma-driver is currently broken
-# Add pru and profibus sources for omapl138 devices
-#UTILS:append:omapl138 = " \
-#    ti-pru-sw-examples-source \
-#"
-
 UTILS:append:omap-a15 = " \
     omapconf-source \
     pru-icss-source \
diff --git a/meta-arago-extras/recipes-core/ti-pru-sw-app-loader/ti-pru-sw-app-loader_1.00.00.bb b/meta-arago-extras/recipes-core/ti-pru-sw-app-loader/ti-pru-sw-app-loader_1.00.00.bb
deleted file mode 100644
index 5eaad599..00000000
--- a/meta-arago-extras/recipes-core/ti-pru-sw-app-loader/ti-pru-sw-app-loader_1.00.00.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-DESCRIPTION = "PRU sw application loader"
-HOMEPAGE = "https://gforge.ti.com/gf/project/pru_sw/"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://interface/prussdrv.c;beginline=1;endline=47;md5=6012fea45c1fbced663277bc90d2163a"
-
-RRECOMMENDS:${PN} = "kernel-module-uio-pru"
-PR = "r0"
-PV:append = "+svn${SRCPV}"
-
-COMPATIBLE_MACHINE = "omapl138"
-
-SRC_URI = "svn://gforge.ti.com/svn/pru_sw/;module=trunk;protocol=https;user=anonymous;pswd=''"
-
-SRCREV = "33"
-S = "${WORKDIR}/trunk/app_loader"
-
-do_compile () {
-        make -C ${S}/interface CCTOOL_PREFIX=${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}
-}
-
-do_install () {
-        install -d ${D}${libdir}
-        install -d ${D}${includedir}
-        install -m 0644 ${S}/include/* ${D}${includedir}
-        install -m 0644 ${S}/lib/* ${D}${libdir}
-}
diff --git a/meta-arago-extras/recipes-core/ti-pru-sw-edma-library/ti-pru-sw-edma-library_1.00.00.bb b/meta-arago-extras/recipes-core/ti-pru-sw-edma-library/ti-pru-sw-edma-library_1.00.00.bb
deleted file mode 100644
index 88b86d63..00000000
--- a/meta-arago-extras/recipes-core/ti-pru-sw-edma-library/ti-pru-sw-edma-library_1.00.00.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-DESCRIPTION = "eDMA library for use by PRU sw example applications"
-HOMEPAGE = "https://gforge.ti.com/gf/project/pru_sw/"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://edma.c;beginline=1;endline=46;md5=f6bde95a8e2277050e36b257ca9214a6"
-
-DEPENDS += "virtual/kernel"
-
-RDEPENDS:${PN} += "ti-pru-sw-edma-driver"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-COMPATIBLE_MACHINE = "omapl138"
-
-MACHINE_KERNEL_PR:append = "a"
-PR = "${MACHINE_KERNEL_PR}"
-PV:append = "+svn${SRCPV}"
-
-SRC_URI = "svn://gforge.ti.com/svn/pru_sw/;module=trunk;protocol=https;user=anonymous;pswd=''"
-
-SRCREV = "33"
-S = "${WORKDIR}/trunk/peripheral_lib/edma_driver/interface"
-
-do_compile () {
-	oe_runmake KERNEL_DIR="${STAGING_KERNEL_DIR}" CCTOOL_PREFIX=${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}
-}
-
-do_install () {
-	install -d ${D}/${libdir}
-	install -m 0755 ${S}/../lib/libedmautils.a ${D}/${libdir}/
-}
diff --git a/meta-arago-extras/recipes-core/ti-pru-sw-examples/ti-pru-sw-examples_1.00.00.bb b/meta-arago-extras/recipes-core/ti-pru-sw-examples/ti-pru-sw-examples_1.00.00.bb
deleted file mode 100644
index 60bc3d5a..00000000
--- a/meta-arago-extras/recipes-core/ti-pru-sw-examples/ti-pru-sw-examples_1.00.00.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-DESCRIPTION = "PRU sw example applications"
-HOMEPAGE = "https://gforge.ti.com/gf/project/pru_sw/"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENCE.txt;md5=c4fd8ee7443c1b2b6238b4b5df796481"
-DEPENDS = "ti-pru-sw-app-loader ti-pru-sw-edma-library"
-RDEPENDS:${PN} = "ti-pru-sw-edma-driver"
-PR = "r0"
-PV:append = "+svn${SRCPV}"
-
-COMPATIBLE_MACHINE = "omapl138"
-
-SRC_URI = "svn://gforge.ti.com/svn/pru_sw/;module=trunk;protocol=https;user=anonymous;pswd=''"
-
-SRCREV = "33"
-S = "${WORKDIR}/trunk"
-
-do_compile () {
-        make -C ${S}/example_apps \
-          CCTOOLS="${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}"\
-          BINDIR_APPLICATIONS="${S}/example_apps/bin" \
-          BINDIR_FW="${S}/example_apps/bin" \
-          UTILS_DIR="${S}/utils"
-}
-
-do_install () {
-        install -d ${D}/usr/share/ti/ti-pru-eg/
-        install -m 0755 ${S}/example_apps/bin/* ${D}/usr/share/ti/ti-pru-eg/
-}
-
-FILES:${PN} += "${datadir}/ti/ti-pru-eg/*"
-FILES:${PN}-dbg += "${datadir}/ti/ti-pru-eg/.debug/*"
-- 
2.37.3


