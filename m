Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id BFA5752A68
	for <meta-arago@arago-project.org>;
	Thu, 16 Jan 2014 23:57:55 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0GNvs7r019813
	for <meta-arago@arago-project.org>; Thu, 16 Jan 2014 17:57:54 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0GNvslO004009
	for <meta-arago@arago-project.org>; Thu, 16 Jan 2014 17:57:54 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 16 Jan 2014 17:57:54 -0600
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0GNvfd7003746;
	Thu, 16 Jan 2014 17:57:52 -0600
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 16 Jan 2014 19:19:10 -0600
Message-ID: <1389921550-8122-5-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1389921550-8122-1-git-send-email-fcooper@ti.com>
References: <1389921550-8122-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 5/5] Add Wilink 8 support for AM43x boards
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
X-List-Received-Date: Thu, 16 Jan 2014 23:57:56 -0000
Content-Type: text/plain

---
 .../conf/distro/include/arago-prefs.inc            |    1 +
 ...ckagegroup-arago-tisdk-connectivity-sdk-host.bb |    4 +++-
 ...agegroup-arago-tisdk-connectivity-sdk-target.bb |    6 +++++-
 .../packagegroup-arago-tisdk-connectivity.bb       |    8 +++++++-
 .../packagegroup-arago-tisdk-matrix.bb             |    4 +++-
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |    3 ++-
 6 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index 8a2d7de..d5176fd 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -93,3 +93,4 @@ PREFERRED_VERSION_gettext = "0.16.1"
 
 PREFERRED_PROVIDER_wpa-supplicant = "wpa-supplicant"
 PREFERRED_PROVIDER_wpa-supplicant_ti33x = "wpa-supplicant-wl18xx"
+PREFERRED_PROVIDER_wpa-supplicant_ti43x = "wpa-supplicant-wl18xx"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-host.bb
index 4ebfe15..e367c28 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-host.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install wlan and bluetooth sources into the SDK"
 LICENSE = "MIT"
-PR = "r8"
+PR = "r9"
 
 inherit packagegroup
 
@@ -14,6 +14,8 @@ CONNECTIVITY_RDEPENDS = ""
 
 CONNECTIVITY_RDEPENDS_ti33x = "${FIRMWARE_AND_DRIVERS_SRC}"
 
+CONNECTIVITY_RDEPENDS_ti43x = "${FIRMWARE_AND_DRIVERS_SRC}"
+
 RDEPENDS_${PN} = "\
     ${CONNECTIVITY_RDEPENDS} \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-target.bb
index 28304c6..a7bcd56 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-target.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install wlan headers and libraries into the SDK"
 LICENSE = "MIT"
-PR = "r5"
+PR = "r6"
 
 inherit packagegroup
 
@@ -12,6 +12,10 @@ CONNECTIVITY_RDEPENDS_ti33x  = "\
     wpa-supplicant-wl18xx-dev \
 "
 
+CONNECTIVITY_RDEPENDS_ti43x  = "\
+    wpa-supplicant-wl18xx-dev \
+"
+
 RDEPENDS_${PN} = "\
     ${CONNECTIVITY_RDEPENDS} \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
index 0cdc480..622e9e4 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install wlan packages into the target FS"
 LICENSE = "MIT"
-PR = "r20"
+PR = "r21"
 
 inherit packagegroup
 
@@ -45,6 +45,12 @@ CONNECTIVITY_RDEPENDS_ti33x = "\
     ${FIRMWARE_AND_DRIVERS} \
 "
 
+CONNECTIVITY_RDEPENDS_ti43x = "\
+    ${WLAN_COMMON} \
+    ${DEMO_APPS} \
+    ${FIRMWARE_AND_DRIVERS} \
+"
+
 RDEPENDS_${PN} = "\
     ${CONNECTIVITY_RDEPENDS} \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index b8b3217..220d77f 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to include Matrix v2"
 LICENSE = "MIT"
-PR = "r25"
+PR = "r26"
 
 inherit packagegroup
 
@@ -78,6 +78,8 @@ MATRIX_APPS_append_ti43x = "        \
     matrix-gui-generic-pm           \
     matrix-gui-pm-demos-suspend     \
     matrix-gui-clocks               \
+                                    \
+    matrix-gui-wifi-demos           \
 "
 
 MATRIX_APPS_append_omap-a15 = "     \
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index ed23f98..34a53b6 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -33,7 +33,7 @@ SRC_URI = "\
     file://Makefile_oprofile-example \
 "
 
-PR = "r22"
+PR = "r23"
 
 MAKEFILES_COMMON = "linux \
                     matrix-gui \
@@ -70,6 +70,7 @@ MAKEFILES_append_ti43x = " u-boot-spl \
                            ${QUICK_PLAYGROUND} \
                            ti-crypto-examples \
                            linux-dtbs \
+                           wireless \
 "
 MAKEFILES_append_omap-a15 = " u-boot-spl \
                               ${QUICK_PLAYGROUND} \
-- 
1.7.0.4


