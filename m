Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTP id 64F9152A57
	for <meta-arago@arago-project.org>;
	Mon, 29 Sep 2014 21:42:19 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.18.33.160])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0NCO00D2XMXNOFF0@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 29 Sep 2014 16:42:03 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id A7AF9200A9; Mon,
	29 Sep 2014 17:41:47 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 29 Sep 2014 17:41:47 -0400
Message-id: <1412026907-30057-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.4
Subject: [PATCH] u-boot-fw-utils: update to 2014.07 to support latest platforms
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
X-List-Received-Date: Mon, 29 Sep 2014 21:42:19 -0000

From: Denys Dmytriyenko <denys@ti.com>

This is temporarily overlayed here until accepted to oe-core.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-bsp/u-boot/u-boot-fw-utils_2014.07.bb  | 33 ++++++++++++++++++++++
 ...7.bbappend => u-boot-fw-utils_2014.07.bbappend} |  3 +-
 2 files changed, 34 insertions(+), 2 deletions(-)
 create mode 100644 meta-arago-distro/recipes-bsp/u-boot/u-boot-fw-utils_2014.07.bb
 rename meta-arago-distro/recipes-bsp/u-boot/{u-boot-fw-utils_2013.07.bbappend => u-boot-fw-utils_2014.07.bbappend} (84%)

diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot-fw-utils_2014.07.bb b/meta-arago-distro/recipes-bsp/u-boot/u-boot-fw-utils_2014.07.bb
new file mode 100644
index 0000000..10a3cd4
--- /dev/null
+++ b/meta-arago-distro/recipes-bsp/u-boot/u-boot-fw-utils_2014.07.bb
@@ -0,0 +1,33 @@
+SUMMARY = "U-Boot bootloader fw_printenv/setenv utilities"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://Licenses/README;md5=025bf9f768cbcb1a165dbe1a110babfb"
+SECTION = "bootloader"
+DEPENDS = "mtd-utils"
+
+# This revision corresponds to the tag "v2014.07"
+# We use the revision in order to avoid having to fetch it from the
+# repo during parse
+SRCREV = "524123a70761110c5cf3ccc5f52f6d4da071b959"
+
+PV = "v2014.07+git${SRCPV}"
+
+SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
+
+S = "${WORKDIR}/git"
+
+INSANE_SKIP_${PN} = "already-stripped"
+
+do_compile () {
+	oe_runmake ${UBOOT_MACHINE}
+	oe_runmake env
+}
+
+do_install () {
+	install -d ${D}${base_sbindir}
+	install -d ${D}${sysconfdir}
+	install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_printenv
+	install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_setenv
+	install -m 0644 ${S}/tools/env/fw_env.config ${D}${sysconfdir}/fw_env.config
+}
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bbappend b/meta-arago-distro/recipes-bsp/u-boot/u-boot-fw-utils_2014.07.bbappend
similarity index 84%
rename from meta-arago-distro/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bbappend
rename to meta-arago-distro/recipes-bsp/u-boot/u-boot-fw-utils_2014.07.bbappend
index 6d1680a..047f94b 100644
--- a/meta-arago-distro/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bbappend
+++ b/meta-arago-distro/recipes-bsp/u-boot/u-boot-fw-utils_2014.07.bbappend
@@ -1,6 +1,5 @@
-PR_append = "-arago0+gitr${SRCPV}"
+PR_append = "-arago0"
 
 # The proper config doesn't currently exist anywhere in mainline U-boot.
 # For now just use a similar config which is good enough for U-boot utilities.
 UBOOT_MACHINE_am57xx-evm = "dra7xx_evm_config"
-
-- 
2.0.4


