Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id CEAF852960
	for <meta-arago@arago-project.org>;
	Mon, 20 Mar 2017 20:40:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6DFA7208FB;
	Mon, 20 Mar 2017 20:40:42 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id N8AuajQj4l7p; Mon, 20 Mar 2017 20:40:42 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 46C2A208E3;
	Mon, 20 Mar 2017 20:40:41 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id BFEF41623AA;
	Mon, 20 Mar 2017 16:40:40 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Mon, 20 Mar 2017 16:40:40 -0400
Message-Id: <1490042440-43327-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] recipes: use omapl138 SOC overrides in place of am180x-evm
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
X-List-Received-Date: Mon, 20 Mar 2017 20:40:44 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb         | 2 +-
 .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb          | 4 ++--
 meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb      | 2 +-
 .../recipes-core/ti-pru-sw-examples/ti-pru-sw-examples_1.00.00.bb     | 2 +-
 .../recipes-devtools/pinmux-utility/pinmux-utility_1.0.1076.3.bb      | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
index 50470d9..e4211d7 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
@@ -14,7 +14,7 @@ UTILS = " \
 
 # ti-pru-sw-edma-driver is currently broken
 # Add pru and profibus sources for omapl138 devices
-#UTILS_append_am180x-evm = " \
+#UTILS_append_omapl138 = " \
 #    ti-pru-sw-examples-src \
 #"
 
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 1cc0ccf..a2dec74 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -122,8 +122,8 @@ MAKEFILES_append_omap-a15 = " u-boot-spl \
                               ti-gc320-driver \
                               barcode-roi \
 "
-MAKEFILES_append_am180x-evm = " pru \
-                                u-boot-legacy \
+MAKEFILES_append_omapl138 = " pru \
+                              u-boot-legacy \
 "
 
 MAKEFILES_append_keystone = " u-boot-spl \
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
index 8eae9d2..175fc3a 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
@@ -30,7 +30,7 @@ SETUP_SCRIPTS = " common.sh \
 UBOOT_ENV_am37x-evm = "setup-uboot-env-am37x.sh"
 UBOOT_ENV_beagleboard = "setup-uboot-env-beagleboard.sh"
 UBOOT_ENV_am3517-evm = "setup-uboot-env-am3517.sh"
-UBOOT_ENV_am180x-evm = "setup-uboot-env-am18x.sh"
+UBOOT_ENV_omapl138 = "setup-uboot-env-am18x.sh"
 UBOOT_ENV_ti33x = "setup-uboot-env-am335x.sh"
 UBOOT_ENV_ti43x = "setup-uboot-env-am43x.sh"
 UBOOT_ENV_omap5-evm = "setup-uboot-env-omap5.sh"
diff --git a/meta-arago-extras/recipes-core/ti-pru-sw-examples/ti-pru-sw-examples_1.00.00.bb b/meta-arago-extras/recipes-core/ti-pru-sw-examples/ti-pru-sw-examples_1.00.00.bb
index c661fe4..e7cb229 100644
--- a/meta-arago-extras/recipes-core/ti-pru-sw-examples/ti-pru-sw-examples_1.00.00.bb
+++ b/meta-arago-extras/recipes-core/ti-pru-sw-examples/ti-pru-sw-examples_1.00.00.bb
@@ -7,7 +7,7 @@ RDEPENDS_${PN} = "ti-pru-sw-edma-driver"
 PR = "r0"
 PV_append = "+svn${SRCPV}"
 
-COMPATIBLE_MACHINE = "am180x-evm"
+COMPATIBLE_MACHINE = "omapl138"
 
 SRC_URI = "svn://gforge.ti.com/svn/pru_sw/;module=trunk;protocol=https;user=anonymous;pswd=''"
 
diff --git a/meta-arago-extras/recipes-devtools/pinmux-utility/pinmux-utility_1.0.1076.3.bb b/meta-arago-extras/recipes-devtools/pinmux-utility/pinmux-utility_1.0.1076.3.bb
index d75b837..81c8a80 100644
--- a/meta-arago-extras/recipes-devtools/pinmux-utility/pinmux-utility_1.0.1076.3.bb
+++ b/meta-arago-extras/recipes-devtools/pinmux-utility/pinmux-utility_1.0.1076.3.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Texas Instruments Pinmux Utility"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2b328fcf0477d688d8b85f7310f9e6b9"
-COMPATIBLE_MACHINE = "am180x-evm"
+COMPATIBLE_MACHINE = "omapl138"
 
 PR = "r0"
 
-- 
2.7.4


