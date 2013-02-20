Return-Path: <ceh@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id A93A952A7B
	for <meta-arago@arago-project.org>;
	Wed, 20 Feb 2013 22:26:06 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r1KMQ1QL031940
	for <meta-arago@arago-project.org>; Wed, 20 Feb 2013 16:26:01 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r1KMQ1RF010081
	for <meta-arago@arago-project.org>; Wed, 20 Feb 2013 16:26:01 -0600
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 20 Feb 2013 16:26:01 -0600
Received: from localhost.localdomain (gtdev04-a0850405.am.dhcp.ti.com
	[10.218.102.32])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	r1KMQ0RN022750;	Wed, 20 Feb 2013 16:26:01 -0600
From: Carlos Hernandez <ceh@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 20 Feb 2013 17:42:57 -0500
Message-ID: <1361400177-5858-4-git-send-email-ceh@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1361400177-5858-1-git-send-email-ceh@ti.com>
References: <1361400177-5858-1-git-send-email-ceh@ti.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] Define linux-ti-staging recipe
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
X-List-Received-Date: Wed, 20 Feb 2013 22:26:25 -0000
Content-Type: text/plain

To build kernel from TI's integration tree.
Currently recipe only supports am335x devices.

Signed-off-by: Carlos Hernandez <ceh@ti.com>
---
 .../recipes-kernel/linux/linux-ti-staging_git.bb   |   48 ++++++++++++++++++++
 1 files changed, 48 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-kernel/linux/linux-ti-staging_git.bb

diff --git a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_git.bb b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_git.bb
new file mode 100644
index 0000000..4645e70
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_git.bb
@@ -0,0 +1,48 @@
+SECTION = "kernel"
+DESCRIPTION = "Linux kernel for TI devices"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
+KERNEL_IMAGETYPE = "uImage"
+
+inherit kernel
+require recipes-kernel/linux/linux-dtb.inc
+
+# Stage the power management firmware before building the kernel
+DEPENDS += "am33x-cm3"
+
+KERNEL_DEVICETREE_am335x-evm = "arch/arm/boot/dts/am335x-evm.dts"
+KERNEL_DEVICETREE_beaglebone = "arch/arm/boot/dts/am335x-bone.dts"
+
+COMPATIBLE_MACHINE = "ti33x"
+
+S = "${WORKDIR}/git"
+
+BRANCH = "TI-Linux-3.8-rc6"
+
+SRCREV = "94a9ccd79a7c7d8c02b684927a00ea1cbee94f34"
+PV = "3.8"
+
+# Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
+MACHINE_KERNEL_PR_append = "r1+gitr${SRCPV}"
+
+KVER = "${PV}"
+PSPREL = "-prerelease"
+
+# Override the SRC_URI from the linux-omap3.inc file
+SRC_URI = "git://gitorious.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH}"
+
+do_setup_defconfig() {
+        :
+}
+
+do_configure() {
+        make ARCH=arm omap2plus_defconfig
+}
+
+# Copy the am33x-cm3 firmware if it is available
+do_compile_prepend() {
+    if [ -e "${STAGING_DIR_HOST}/${base_libdir}/firmware/am335x-pm-firmware.bin" ]
+    then
+        cp "${STAGING_DIR_HOST}/${base_libdir}/firmware/am335x-pm-firmware.bin" "${S}/firmware"
+    fi
+}
-- 
1.7.0.4


