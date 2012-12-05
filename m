Return-Path: <ceh@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 43554529E1
	for <meta-arago@arago-project.org>;
	Wed,  5 Dec 2012 21:39:21 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id qB5LdK15007560
	for <meta-arago@arago-project.org>; Wed, 5 Dec 2012 15:39:20 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id qB5LdKe0028714
	for <meta-arago@arago-project.org>; Wed, 5 Dec 2012 15:39:20 -0600
Received: from dlelxv23.itg.ti.com (172.17.1.198) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 5 Dec 2012 15:39:19 -0600
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])	by dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	qB5LdJNK015828	for <meta-arago@arago-project.org>;
	Wed, 5 Dec 2012 15:39:19 -0600
Received: from dta0850405-ubuntu1 (dta0850405-ubuntu1.am.dhcp.ti.com
	[158.218.103.14])	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7)
	with ESMTP id qB5LdJw10539	for <meta-arago@arago-project.org>;
	Wed, 5 Dec 2012 15:39:19 -0600 (CST)
Received: from [127.0.0.1] (localhost [127.0.0.1])	by dta0850405-ubuntu1
	(Postfix) with ESMTP id 176C1110604A	for <meta-arago@arago-project.org>;
	Wed, 5 Dec 2012 16:39:19 -0500 (EST)
Message-ID: <50BFBF06.7050107@ti.com>
Date: Wed, 5 Dec 2012 16:39:18 -0500
From: Carlos Hernandez <ceh@ti.com>
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: <meta-arago@arago-project.org>
Subject: [PATCH] Define linux-am335x-upstream-staging recipe
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
X-List-Received-Date: Wed, 05 Dec 2012 21:39:21 -0000
X-Groupsio-MsgNum: 647
Content-Type: multipart/mixed; boundary="------------030209020007030806090804"

--------------030209020007030806090804
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

AUTOREV recipe for github.com/hvaibhav/am335x-linux.git

Please consider for meta-arago. Thanks,
Carlos

--------------030209020007030806090804
Content-Type: text/x-patch;
	name="0003-Define-linux-am335x-upstream-staging-recipe.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="0003-Define-linux-am335x-upstream-staging-recipe.patch"

From 193cdfd5104d55d6b71973e41b0874d7cd6f591a Mon Sep 17 00:00:00 2001
From: Carlos Hernandez <ceh@ti.com>
Date: Tue, 4 Dec 2012 17:32:18 -0500
Subject: [PATCH 03/12] Define linux-am335x-upstream-staging recipe

AUTOREV recipe for github.com/hvaibhav/am335x-linux.git

Signed-off-by: Carlos Hernandez <ceh@ti.com>
---
 .../linux/linux-am335x-upstream-staging_git.bb     |   48 ++++++++++++++++++++
 1 files changed, 48 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-kernel/linux/linux-am335x-upstream-staging_git.bb

diff --git a/meta-arago-distro/recipes-kernel/linux/linux-am335x-upstream-staging_git.bb b/meta-arago-distro/recipes-kernel/linux/linux-am335x-upstream-staging_git.bb
new file mode 100644
index 0000000..61454cf
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/linux/linux-am335x-upstream-staging_git.bb
@@ -0,0 +1,48 @@
+SECTION = "kernel"
+DESCRIPTION = "Linux kernel for TI33x EVM from PSP, based on am335x-kernel"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
+KERNEL_IMAGETYPE = "uImage"
+
+inherit kernel
+require setup-dtb.inc
+
+# Stage the power management firmware before building the kernel
+DEPENDS += "am33x-cm3"
+
+KERNEL_DEVICETREE_am335x-evm = "arch/arm/boot/dts/am335x-evm.dts"
+
+COMPATIBLE_MACHINE = "ti33x"
+
+S = "${WORKDIR}/git"
+
+BRANCH = "am335x-upstream-staging"
+
+SRCREV = "${AUTOREV}"
+PV = "3.7"
+
+# Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
+MACHINE_KERNEL_PR_append = "r11+gitr${SRCPV}"
+
+KVER = "${PV}"
+PSPREL = "-prerelease"
+
+# Override the SRC_URI from the linux-omap3.inc file
+SRC_URI = "git://github.com/hvaibhav/am335x-linux.git;protocol=git;branch=${BRANCH} \
+"
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


--------------030209020007030806090804--
