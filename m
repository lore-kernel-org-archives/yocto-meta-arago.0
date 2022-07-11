Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0FE4CCA47B
	for <webhook@archiver.kernel.org>; Mon, 11 Jul 2022 16:49:41 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web09.31386.1657558177171920065
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 11 Jul 2022 09:49:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=THNMCbwi;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 26BGnZlj002759;
	Mon, 11 Jul 2022 11:49:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1657558175;
	bh=NmhKLVjdcpMjdGTHaKxwdUVeLPMgcVjdDe0EJUaDOac=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=THNMCbwifod/AbD2pWgQkOfD9bChQjiR3MYfBzUeBapZZ22SjpynyKYI2N9x5Ampu
	 rCBNxbhKZcsxwm/FUkPa/VCCZ8rEnqywev4qUWco5x+wRzC6DhV5HWo3hWdf2bgzwA
	 IRHbtkz9IElB1Uk+zaES2YHi2Abfcr1hy+r+t1N8=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 26BGnZNM046112
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 11 Jul 2022 11:49:35 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 11
 Jul 2022 11:49:34 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 11 Jul 2022 11:49:34 -0500
Received: from ula0226330.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 26BGnXpq030722;
	Mon, 11 Jul 2022 11:49:34 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][kirkstone/master][PATCH 2/3] big-data-ipc-demo: Merge
 include file and rename
Date: Mon, 11 Jul 2022 11:49:32 -0500
Message-ID: <20220711164933.21445-2-afd@ti.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220711164933.21445-1-afd@ti.com>
References: <20220711164933.21445-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 11 Jul 2022 16:49:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13946

The include might have been intended to be used by an TI RTOS build
but without this in the roadmap lets merge the include and rename
this recipe without the -linux postfix.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../conf/distro/include/arago-source-ipk.inc  |  4 +--
 ...ackagegroup-arago-tisdk-addons-sdk-host.bb |  2 +-
 .../packagegroup-arago-tisdk-addons.bb        |  2 +-
 .../big-data-ipc-demo/big-data-ipc-demo.inc   | 30 -------------------
 ...-linux_git.bb => big-data-ipc-demo_git.bb} | 30 ++++++++++++-------
 5 files changed, 24 insertions(+), 44 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo.inc
 rename meta-arago-extras/recipes-apps/big-data-ipc-demo/{big-data-ipc-demo-linux_git.bb => big-data-ipc-demo_git.bb} (54%)

diff --git a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
index 75355710..ffa76ed3 100644
--- a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
+++ b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
@@ -361,5 +361,5 @@ SRCIPK_INSTALL_DIR:pn-imglib-c66x ?= "component-sources/imglib_c66x_${PV}"
 CREATE_SRCIPK:pn-vlib-c66x ?= "1"
 SRCIPK_INSTALL_DIR:pn-vlib-c66x ?= "component-sources/vlib_c66x_${PV}"
 
-CREATE_SRCIPK:pn-big-data-ipc-demo-linux ?= "1"
-SRCIPK_INSTALL_DIR:pn-big-data-ipc-demo-linux ?= "example-applications/${PN}-${PV}"
+CREATE_SRCIPK:pn-big-data-ipc-demo ?= "1"
+SRCIPK_INSTALL_DIR:pn-big-data-ipc-demo ?= "example-applications/${PN}-${PV}"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
index a741eb03..eabec6c4 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
@@ -58,7 +58,7 @@ EXTRA_LIBS = ""
 EXTRA_LIBS:append:omap-a15 = " \
     cmem-mod-source \
     uio-module-drv-source \
-    big-data-ipc-demo-linux-source \
+    big-data-ipc-demo-source \
 "
 
 #EXTRA_LIBS:append:dra7xx = " \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 46182c9d..992549e6 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -109,7 +109,7 @@ EXTRA_PACKAGES:append:omap-a15 = " ti-ipc-examples-linux"
 EXTRA_PACKAGES:append:omapl138 = " ti-ipc-examples-linux"
 
 EXTRA_PACKAGES:append:omap-a15 = " \
-    ${@bb.utils.contains('MACHINE_FEATURES','dsp','big-data-ipc-demo-linux big-data-ipc-demo-linux-firmware','',d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES','dsp','big-data-ipc-demo big-data-ipc-demo-firmware','',d)} \
 "
 
 # acontis-atemsys
diff --git a/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo.inc b/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo.inc
deleted file mode 100644
index 32ead99c..00000000
--- a/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo.inc
+++ /dev/null
@@ -1,30 +0,0 @@
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://makefile;beginline=1;endline=31;md5=2f2ea348b98d5cc7807ece7adcc2c43a"
-
-COMPATIBLE_MACHINE = "omap-a15"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-BIG_DATA_IPC_GIT_URI = "git://git.ti.com/processor-sdk/big-data-ipc-examples.git"
-BIG_DATA_IPC_GIT_PROTOCOL = "git"
-BIG_DATA_IPC_GIT_BRANCH = "master"
-
-# Below commit ID corresponds to "DEV.BIG_DATA_IPC.01.03.00.00"
-BIG_DATA_IPC_SRCREV = "984edb3c69c8a1f51da02e0abcd2201319650894"
-
-BRANCH = "${BIG_DATA_IPC_GIT_BRANCH}"
-SRC_URI = "${BIG_DATA_IPC_GIT_URI};protocol=${BIG_DATA_IPC_GIT_PROTOCOL};branch=${BRANCH}"
-
-SRCREV = "${BIG_DATA_IPC_SRCREV}"
-PV = "01.03.00.00"
-
-S = "${WORKDIR}/git"
-
-PLATFORM = "UNKNOWN"
-PLATFORM:omap-a15 = "DRA7XX"
-
-IPC_TARGETS = ""
-IPC_TARGETS:omap-a15 = "\
-    gnu.targets.arm.A15F="${GCC_ARM_NONE_TOOLCHAIN}" \
-    ti.targets.elf.C66="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" \
-    ti.targets.arm.elf.M4="${M4_TOOLCHAIN_INSTALL_DIR}" \
-"
diff --git a/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo-linux_git.bb b/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo_git.bb
similarity index 54%
rename from meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo-linux_git.bb
rename to meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo_git.bb
index b384bf87..779cef7f 100644
--- a/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo-linux_git.bb
+++ b/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo_git.bb
@@ -1,7 +1,15 @@
 SUMMARY = "TI Big data IPC: Host linux examples"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://makefile;beginline=1;endline=31;md5=2f2ea348b98d5cc7807ece7adcc2c43a"
 
-require recipes-ti/includes/ti-paths.inc
-require big-data-ipc-demo.inc
+SRC_URI = "git://git.ti.com/processor-sdk/big-data-ipc-examples.git;protocol=git;branch=master"
+SRCREV = "984edb3c69c8a1f51da02e0abcd2201319650894"
+PV = "01.03.00.00"
+
+S = "${WORKDIR}/git"
+
+COMPATIBLE_MACHINE = "omap-a15"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit features_check
 
@@ -15,30 +23,32 @@ DEPENDS = "ti-ipc \
            ti-cgt6x-native \
 "
 
+PLATFORM = "UNKNOWN"
+PLATFORM:omap-a15 = "DRA7XX"
+
+require recipes-ti/includes/ti-paths.inc
+
 EXTRA_OEMAKE = "\
     PLATFORM=${PLATFORM} \
     XDC_INSTALL_DIR="${XDC_INSTALL_DIR}" \
     BIOS_INSTALL_DIR="${SYSBIOS_INSTALL_DIR}" \
     IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" \
     LINUX_SYSROOT_DIR="${STAGING_INCDIR}" \
-    ${IPC_TARGETS} \
-    JOBS="${PARALLEL_MAKE}" \
+    gnu.targets.arm.A15F="${GCC_ARM_NONE_TOOLCHAIN}" \
+    ti.targets.elf.C66="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" \
+    ti.targets.arm.elf.M4="${M4_TOOLCHAIN_INSTALL_DIR}" \
 "
 
 do_create_srcipk:prepend() {
-  rm -rf host_bios
+    rm -rf host_bios
 }
 
 do_compile() {
-  if [  "${PLATFORM}" != "UNKNOWN" ]; then
-      oe_runmake host_linux
-  fi
+    oe_runmake host_linux
 }
 
 do_install() {
-  if [  "${PLATFORM}" != "UNKNOWN" ]; then
     oe_runmake EXEC_DIR="${D}${bindir}" install_linux_bin
-  fi
 }
 
 PACKAGES =+ "${PN}-firmware"
-- 
2.36.1


