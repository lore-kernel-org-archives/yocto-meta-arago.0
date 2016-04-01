Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTPS id 4721052A8B
	for <meta-arago@arago-project.org>;
	Fri,  1 Apr 2016 03:42:09 +0000 (UTC)
Received: from vz-proxy-l006.mx.aol.com ([64.236.82.154])
	by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O4X009Z8RLRZJ40@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 31 Mar 2016 22:41:56 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=MtGvkDue c=1 sm=1 tr=0	a=Ut/DdBcw22SB5hFy08yqCQ==:117
	a=7OsogOcEt9IA:10 a=sozttTNsAAAA:8	a=jG4aZljmo0FY5L3pZwYA:9
Received: by 100.15.86.14 with SMTP id 6d368d7f; Fri, 01 Apr 2016 03:41:56 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id BC0F1161F5E;	Thu,
	31 Mar 2016 23:41:49 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 31 Mar 2016 23:41:26 -0400
Message-id: <1459482106-27723-7-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1459482106-27723-1-git-send-email-denis@denix.org>
References: <1459482106-27723-1-git-send-email-denis@denix.org>
Subject: [PATCH 06/26] u-boot-fw-utils: remove old version
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
X-List-Received-Date: Fri, 01 Apr 2016 03:42:09 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-bsp/u-boot/u-boot-fw-utils_2014.07.bb  | 33 ----------------------
 .../u-boot/u-boot-fw-utils_2014.07.bbappend        |  7 -----
 2 files changed, 40 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-bsp/u-boot/u-boot-fw-utils_2014.07.bb
 delete mode 100644 meta-arago-distro/recipes-bsp/u-boot/u-boot-fw-utils_2014.07.bbappend

diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot-fw-utils_2014.07.bb b/meta-arago-distro/recipes-bsp/u-boot/u-boot-fw-utils_2014.07.bb
deleted file mode 100644
index 10a3cd4..0000000
--- a/meta-arago-distro/recipes-bsp/u-boot/u-boot-fw-utils_2014.07.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-SUMMARY = "U-Boot bootloader fw_printenv/setenv utilities"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://Licenses/README;md5=025bf9f768cbcb1a165dbe1a110babfb"
-SECTION = "bootloader"
-DEPENDS = "mtd-utils"
-
-# This revision corresponds to the tag "v2014.07"
-# We use the revision in order to avoid having to fetch it from the
-# repo during parse
-SRCREV = "524123a70761110c5cf3ccc5f52f6d4da071b959"
-
-PV = "v2014.07+git${SRCPV}"
-
-SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
-
-S = "${WORKDIR}/git"
-
-INSANE_SKIP_${PN} = "already-stripped"
-
-do_compile () {
-	oe_runmake ${UBOOT_MACHINE}
-	oe_runmake env
-}
-
-do_install () {
-	install -d ${D}${base_sbindir}
-	install -d ${D}${sysconfdir}
-	install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_printenv
-	install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_setenv
-	install -m 0644 ${S}/tools/env/fw_env.config ${D}${sysconfdir}/fw_env.config
-}
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot-fw-utils_2014.07.bbappend b/meta-arago-distro/recipes-bsp/u-boot/u-boot-fw-utils_2014.07.bbappend
deleted file mode 100644
index 67bf9cf..0000000
--- a/meta-arago-distro/recipes-bsp/u-boot/u-boot-fw-utils_2014.07.bbappend
+++ /dev/null
@@ -1,7 +0,0 @@
-PR_append = "-arago1"
-
-# The proper config doesn't currently exist anywhere in mainline U-boot.
-# For now just use a similar config which is good enough for U-boot utilities.
-UBOOT_MACHINE_am57xx-evm = "dra7xx_evm_config"
-UBOOT_MACHINE_dra7xx-hs-evm = "dra7xx_evm_config"
-UBOOT_MACHINE_am437x-hs-evm = "am43xx_evm_config"
-- 
2.2.0


