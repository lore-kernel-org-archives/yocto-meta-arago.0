Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A1B1C54E41
	for <webhook@archiver.kernel.org>; Tue,  5 Mar 2024 19:10:50 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.1569.1709665849296471155
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 05 Mar 2024 11:10:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=kU5IJLPO;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 425JAlHJ098787;
	Tue, 5 Mar 2024 13:10:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1709665847;
	bh=bVPqeZXLaMjq10b+LtuJYP31qYt+Qncku6MFDIOjr5Y=;
	h=From:To:CC:Subject:Date;
	b=kU5IJLPORvK+5WNaaasqHRIZAHpddjPIY/nVc/8rqW65GHkiai+VWVoUtJZOb9kuv
	 aicDoyDUdAg2yPV85lNgIsBpMETo9pzlHmtFo9+83L6hMeMP84tILfdnR2fPLkmM8A
	 OA2qgQ/Ir/0Os67rITue3pJBcZEh1/dh2oYXZqbU=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 425JAldL006509
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 5 Mar 2024 13:10:47 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 5
 Mar 2024 13:10:46 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 5 Mar 2024 13:10:46 -0600
Received: from lelvsmtp5.itg.ti.com ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 425JAkiA112501;
	Tue, 5 Mar 2024 13:10:46 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master][PATCH] big-data-ipc-demo: Remove this obsolete demo
Date: Tue, 5 Mar 2024 13:10:45 -0600
Message-ID: <20240305191045.67759-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 05 Mar 2024 19:10:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15218

This demo was based on SYS/BIOS which is no longer in development. This
demo has a spiritual successor called rpmsg_char_zerocopy. The new demo
does the same task as this one but is based on MCU+SDK. Remove this demo.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../big-data-ipc-demo_git.bb                  | 53 -------------------
 .../packagegroup-arago-tisdk-addons.bb        |  4 --
 2 files changed, 57 deletions(-)
 delete mode 100644 meta-arago-demos/recipes-apps/big-data-ipc-demo/big-data-ipc-demo_git.bb

diff --git a/meta-arago-demos/recipes-apps/big-data-ipc-demo/big-data-ipc-demo_git.bb b/meta-arago-demos/recipes-apps/big-data-ipc-demo/big-data-ipc-demo_git.bb
deleted file mode 100644
index c68d7152..00000000
--- a/meta-arago-demos/recipes-apps/big-data-ipc-demo/big-data-ipc-demo_git.bb
+++ /dev/null
@@ -1,53 +0,0 @@
-SUMMARY = "TI Big data IPC: Host linux examples"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://makefile;beginline=1;endline=31;md5=2f2ea348b98d5cc7807ece7adcc2c43a"
-
-SRC_URI = "git://git.ti.com/processor-sdk/big-data-ipc-examples.git;protocol=git;branch=master"
-SRCREV = "3dedbde2a539834ee8f4d0419888116ea80789d0"
-PV = "01.03.00.01"
-
-S = "${WORKDIR}/git"
-
-COMPATIBLE_MACHINE = "omap-a15"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-inherit features_check
-
-REQUIRED_MACHINE_FEATURES = "dsp"
-
-DEPENDS = "ti-ipc \
-           ti-xdctools-native \
-           ti-sysbios \
-           ti-ipc-rtos \
-           ti-cgt6x-native \
-           virtual/kernel \
-"
-
-do_configure[depends] += "virtual/kernel:do_shared_workdir"
-
-PLATFORM = "UNKNOWN"
-PLATFORM:omap-a15 = "DRA7XX"
-
-require recipes-ti/includes/ti-paths.inc
-
-EXTRA_OEMAKE = "\
-    PLATFORM=${PLATFORM} \
-    XDC_INSTALL_DIR="${XDC_INSTALL_DIR}" \
-    BIOS_INSTALL_DIR="${SYSBIOS_INSTALL_DIR}" \
-    IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" \
-    LINUX_SYSROOT_DIR="${STAGING_KERNEL_DIR}/include/uapi -I${STAGING_KERNEL_DIR}/include" \
-    gnu.targets.arm.A15F="${GCC_ARM_NONE_TOOLCHAIN}" \
-    ti.targets.elf.C66="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" \
-"
-
-do_compile() {
-    oe_runmake host_linux
-}
-
-do_install() {
-    oe_runmake EXEC_DIR="${D}${bindir}" install_linux_bin
-}
-
-PACKAGES =+ "${PN}-firmware"
-FILES:${PN}-firmware += "${bindir}/simple_buffer_example/release/server_dsp.xe66"
-INSANE_SKIP:${PN}-firmware += "arch"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 11d10596..14dfe3e8 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -88,10 +88,6 @@ EXTRA_PACKAGES:omapl138 = " \
 EXTRA_PACKAGES:append:omap-a15 = " ti-ipc-examples-linux"
 EXTRA_PACKAGES:append:omapl138 = " ti-ipc-examples-linux"
 
-#EXTRA_PACKAGES:append:omap-a15 = " \
-#    ${@bb.utils.contains('MACHINE_FEATURES','dsp','big-data-ipc-demo big-data-ipc-demo-firmware','',d)} \
-#"
-
 # acontis-atemsys
 #EXTRA_PACKAGES:append:am335x-evm = " pruss-lld-apps"
 #EXTRA_PACKAGES:append:am437x-evm = " pruss-lld-apps"
-- 
2.39.2


