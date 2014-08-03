Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTP id ECC315298E
	for <meta-arago@arago-project.org>;
	Sun,  3 Aug 2014 20:44:52 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [72.66.25.89])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N9R004130AD3K60@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Sun, 03 Aug 2014 15:44:42 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 31B482158E; Sat,
	02 Aug 2014 21:10:25 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Sat, 02 Aug 2014 21:10:19 -0400
Message-id: <1407028221-9762-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.2
In-reply-to: <1407028221-9762-1-git-send-email-denis@denix.org>
References: <1407028221-9762-1-git-send-email-denis@denix.org>
Subject: [PATCH 3/5] recipes: replace base_contains with base_conditional when not used on lists
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
X-List-Received-Date: Sun, 03 Aug 2014 20:44:53 -0000

From: Denys Dmytriyenko <denys@ti.com>

Speed up parsing time a bit by using faster direct comparison instead of
searching for a substring.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/arago-prefs.inc                 | 2 +-
 meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb           | 2 +-
 .../packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb          | 4 ++--
 .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb          | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index eada6a8..1178687 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -25,7 +25,7 @@ PREFERRED_VERSION_libdrm = "2.4.52"
 
 PREFERRED_PROVIDER_virtual/gettext = "gettext"
 
-ARAGO_QT_PROVIDER = "${@base_contains('QT_PROVIDER','qt5','',base_contains('MACHINE_FEATURES','sgx','qt4-embedded-gles','qt4-embedded',d),d)}"
+ARAGO_QT_PROVIDER = "${@base_conditional('QT_PROVIDER','qt5','',base_contains('MACHINE_FEATURES','sgx','qt4-embedded-gles','qt4-embedded',d),d)}"
 PREFERRED_PROVIDER_qt4-embedded = "${ARAGO_QT_PROVIDER}"
 
 PREFERRED_VERSION_qt4-embedded = "4.8.5"
diff --git a/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb b/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
index 0d7810a..649dfe3 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
@@ -5,7 +5,7 @@ require arago-base-tisdk-image.bb
 IMAGE_INSTALL += "\
     packagegroup-arago-test \
     ${@base_contains('MACHINE_FEATURES','sgx','packagegroup-arago-tisdk-graphics','',d)} \
-    ${@base_contains('QT_PROVIDER','qt5','packagegroup-arago-tisdk-qt5','packagegroup-arago-tisdk-qte',d)} \
+    ${@base_conditional('QT_PROVIDER','qt5','packagegroup-arago-tisdk-qt5','packagegroup-arago-tisdk-qte',d)} \
     packagegroup-arago-tisdk-addons \
     packagegroup-arago-tisdk-connectivity \
     packagegroup-arago-tisdk-crypto \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
index e5d1be5..5f021d3 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
@@ -20,8 +20,8 @@ TOOLS_append_am3517-evm = " flash-utility"
 
 EXTRA_FILES = ""
 EXTRA_FILES_omap-a15 = "tisdk-readme tisdk-uenv"
-EXTRA_FILES_ti33x = "${@base_contains('ARAGO_BRAND','amsdk','','tisdk-readme',d)}"
-EXTRA_FILES_ti43x = "${@base_contains('ARAGO_BRAND','amsdk','','tisdk-readme',d)}"
+EXTRA_FILES_ti33x = "${@base_conditional('ARAGO_BRAND','amsdk','','tisdk-readme',d)}"
+EXTRA_FILES_ti43x = "${@base_conditional('ARAGO_BRAND','amsdk','','tisdk-readme',d)}"
 
 RDEPENDS_${PN} = "\
     ${TOOLS} \
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 749fb72..336f5cb 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -95,7 +95,7 @@ MAKEFILES_append_am180x-evm = " pru \
 PLATFORM_ARCH = "armv7-a"
 PLATFORM_ARCH_omapl138 = "armv5te"
 
-KERNEL_BUILD_CMDS = "${@base_contains('KERNEL_IMAGETYPE','uImage','LOADADDR=${UBOOT_LOADADDRESS} uImage','zImage',d)}"
+KERNEL_BUILD_CMDS = "${@base_conditional('KERNEL_IMAGETYPE','uImage','LOADADDR=${UBOOT_LOADADDRESS} uImage','zImage',d)}"
 
 KERNEL_DEVICETREE_ti33x = "am335x-evm.dtb am335x-evmsk.dtb am335x-bone.dtb am335x-boneblack.dtb"
 KERNEL_DEVICETREE_ti43x = "am43x-epos-evm.dtb am437x-gp-evm.dtb"
-- 
2.0.2


