Return-Path: <jake@udd0866934>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id C006E5298C
	for <meta-arago@arago-project.org>;
	Thu, 15 Oct 2015 14:00:16 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t9FE0FpX021688
	for <meta-arago@arago-project.org>; Thu, 15 Oct 2015 09:00:15 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9FE0FDB032746
	for <meta-arago@arago-project.org>; Thu, 15 Oct 2015 09:00:15 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 15 Oct 2015 09:00:15 -0500
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9FE0Fq4005780;
	Thu, 15 Oct 2015 09:00:15 -0500
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1Zmj4p-0002vf-1o; Thu, 15 Oct 2015 10:00:15 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 15 Oct 2015 10:00:13 -0400
Message-ID: <1444917613-11225-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] ti-tisdk-setup: Extend support to keystone
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
X-List-Received-Date: Thu, 15 Oct 2015 14:00:17 -0000
Content-Type: text/plain

* Bump SRCREV for keystone u-boot-env script.
* Restructure the way files are installed so that create_sdcard.sh
  does not get installed for keystone, since keystone does not have
  SD card support.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb | 32 +++++++++++++++-------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
index 646866f..701346b 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
@@ -2,16 +2,29 @@ DESCRIPTION = "Package containing scripts to setup the development host and targ
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://setup.sh;beginline=3;endline=31;md5=fc4b04a33df6d892c9f4d4a9d92b945e"
 
-PR = "r26"
+PR = "r27"
 
 BRANCH ?= "master"
-SRCREV = "c0192495f5612bad33a709a016b74b93085faf8c"
+SRCREV = "9ba9b0c10634d71aa4685aedc4ce9990534586ea"
 SRC_URI = "git://arago-project.org/git/projects/tisdk-setup-scripts.git;protocol=git;branch=${BRANCH}"
 
 S = "${WORKDIR}/git/"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
+SDCARD_SCRIPT = " create-sdcard.sh"
+SDCARD_SCRIPT_keystone = ""
+
+SETUP_SCRIPTS = " common.sh \
+                  setup-host-check.sh \
+                  setup-minicom.sh \
+                  setup-package-install.sh \
+                  setup-targetfs-nfs.sh \
+                  setup-tftp.sh \
+                  add-to-group.sh \
+                  ${SDCARD_SCRIPT} \
+"
+
 UBOOT_ENV_am37x-evm = "setup-uboot-env-am37x.sh"
 UBOOT_ENV_beagleboard = "setup-uboot-env-beagleboard.sh"
 UBOOT_ENV_am3517-evm = "setup-uboot-env-am3517.sh"
@@ -20,19 +33,18 @@ UBOOT_ENV_ti33x = "setup-uboot-env-am335x.sh"
 UBOOT_ENV_ti43x = "setup-uboot-env-am43x.sh"
 UBOOT_ENV_omap5-evm = "setup-uboot-env-omap5.sh"
 UBOOT_ENV_am57xx-evm = "setup-uboot-env-am57xx-evm.sh"
+UBOOT_ENV_keystone = "setup-uboot-env-keystone.sh"
 UBOOT_ENV = "setup-uboot-unknown.sh"
 
 do_install () {
     install -m 0755 ${S}/setup.sh ${D}/
+
     install -d ${D}/bin
-    install -m 0755 ${S}/common.sh ${D}/bin
-    install -m 0755 ${S}/setup-host-check.sh ${D}/bin
-    install -m 0755 ${S}/setup-minicom.sh ${D}/bin
-    install -m 0755 ${S}/setup-package-install.sh ${D}/bin
-    install -m 0755 ${S}/setup-targetfs-nfs.sh ${D}/bin
-    install -m 0755 ${S}/setup-tftp.sh ${D}/bin
-    install -m 0755 ${S}/create-sdcard.sh ${D}/bin
-    install -m 0755 ${S}/add-to-group.sh ${D}/bin
+    for script in ${SETUP_SCRIPTS}
+    do
+        install -m 0755 ${S}/${script} ${D}/bin
+    done
+
     install -m 0755 ${S}/${UBOOT_ENV} ${D}/bin/setup-uboot-env.sh
 }
 
-- 
1.9.1


