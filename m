Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 3BD7352A76
	for <meta-arago@arago-project.org>;
	Mon, 22 Apr 2013 17:27:28 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r3MHRRga005724
	for <meta-arago@arago-project.org>; Mon, 22 Apr 2013 12:27:27 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r3MHRRCS030242
	for <meta-arago@arago-project.org>; Mon, 22 Apr 2013 12:27:27 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 22 Apr 2013 12:27:26 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id r3MHRGHD016775;
	Mon, 22 Apr 2013 12:27:25 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 22 Apr 2013 12:27:13 -0500
Message-ID: <1366651633-27986-4-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1366651633-27986-1-git-send-email-fcooper@ti.com>
References: <1366651633-27986-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 4/4] crypto demos: Switch back to script based crypto demos for non am335x platforms
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
X-List-Received-Date: Mon, 22 Apr 2013 17:27:28 -0000
Content-Type: text/plain

* The C based openssl crypto demos were originally created and validated for
  am335x boards.
* For various non am335x platforms problems have been discovered.
* Until C programs are updated switch back to the script based crypto demos for
  all non am335x platforms.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../packagegroup-arago-tisdk-crypto-sdk-host.bb    |    8 ++++----
 .../packagegroup-arago-tisdk-crypto.bb             |    5 +++--
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |    4 ++--
 .../recipes-core/matrix/matrix-gui-apps-git.inc    |    2 +-
 .../matrix/matrix-gui-crypto-demos_2.0.bb          |   11 +++++++----
 5 files changed, 17 insertions(+), 13 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-host.bb
index 3ee2f37..90a4dd9 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-host.bb
@@ -1,14 +1,14 @@
 DESCRIPTION = "Task to install crypto sources in SDK"
 LICENSE = "MIT"
-PR = "r3"
+PR = "r4"
 
 inherit packagegroup
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-CRYPTO_RDEPENDS = " \
-    ti-crypto-examples-src \
-"
+CRYPTO_RDEPENDS = ""
+
+CRYPTO_RDEPENDS_append_ti33x = " ti-crypto-examples-src"
 
 CRYPTO_RDEPENDS_append_am37x-evm = "\
     ti-ocf-crypto-module-src \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto.bb
index 0863d61..c1e7054 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install crypto packages into target FS"
 LICENSE = "MIT"
-PR = "r3"
+PR = "r4"
 
 inherit packagegroup
 
@@ -12,9 +12,10 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 CRYPTO_SUPPORT = "\
     openssl \
     openssl-misc \
-    ti-crypto-examples \
     "
 
+CRYPTO_SUPPORT_append_ti33x = " ti-crypto-examples"
+
 # Add crypto hardware support for am37x-evm
 # NOTE: this package depends on a kernel patch which also has a TSU
 #       exemption filed.  The current name and checksums of the
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 49963f6..a10470d 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -32,12 +32,11 @@ SRC_URI = "\
     file://Makefile_omapconf \
 "
 
-PR = "r10"
+PR = "r11"
 
 MAKEFILES_COMMON = "linux \
                     matrix-gui \
                     arm-benchmarks \
-                    ti-crypto-examples \
                     am-sysinfo \
                     matrix-gui-browser \
                     refresh-screen \
@@ -63,6 +62,7 @@ MAKEFILES_append_am3517-evm = " av-examples \
 MAKEFILES_append_ti33x = " u-boot-spl \
                            ${QUICK_PLAYGROUND} \                    
                            wireless \
+                           ti-crypto-examples \
 "
 MAKEFILES_append_omap-a15 = " u-boot-spl \
                               ${QUICK_PLAYGROUND} \
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
index 6b340c2..9158681 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM := "file://../${LICENSE_CHECKSUM}"
 SRC_URI = "git://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps.git;protocol=git;branch=${BRANCH}"
 SRCREV = "2f938391c53826d261f41e8a177413793194499e"
 BRANCH = "master"
-INC_PR = "r12"
+INC_PR = "r13"
 
 # Pull in the base package for installing matrix applications
 require matrix-gui-apps.inc
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb
index 123f6e5..e87a773 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb
@@ -4,13 +4,16 @@ LICENSE = "CC-BY-SA"
 
 require matrix-gui-apps-git.inc
 
-PR = "${INC_PR}.3"
+PR = "${INC_PR}.4"
 
-inherit allarch
+PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 S = "${WORKDIR}/git/cryptos_apps_scripts"
+S_ti33x = "${WORKDIR}/git/cryptos_apps_program"
+
+FILES_${PN} += "${MATRIX_BASE_DIR}/*"
 
 # Make sure crypto submenu and app images has been installed. Also make sure openssl is available
-RDEPENDS_${PN} += "matrix-gui-apps-images matrix-gui-submenus-cryptos openssl ti-crypto-examples"
+RDEPENDS_${PN} += "matrix-gui-apps-images matrix-gui-submenus-cryptos openssl"
 
-FILES_${PN} += "${MATRIX_BASE_DIR}/*"
+RDEPENDS_${PN}_ti33x_append = " ti-crypto-examples"
-- 
1.7.0.4


