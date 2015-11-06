Return-Path: <jake@udd0866934>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id D49C352A71
	for <meta-arago@arago-project.org>;
	Fri,  6 Nov 2015 19:30:38 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id tA6JUcNl012100
	for <meta-arago@arago-project.org>; Fri, 6 Nov 2015 13:30:38 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id tA6JUcW4030347
	for <meta-arago@arago-project.org>; Fri, 6 Nov 2015 13:30:38 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 6 Nov 2015 13:30:38 -0600
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id tA6JUblx009622;
	Fri, 6 Nov 2015 13:30:38 -0600
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1Zumib-0006Me-PB; Fri, 06 Nov 2015 14:30:37 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 6 Nov 2015 14:30:32 -0500
Message-ID: <1446838233-24415-4-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1446838233-24415-1-git-send-email-j-stiffler@ti.com>
References: <1446838233-24415-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] packagegroup-arago-tisdk-addons*: Add pru-icss
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
X-List-Received-Date: Fri, 06 Nov 2015 19:30:40 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb    | 9 ++++++++-
 .../packagegroups/packagegroup-arago-tisdk-addons.bb             | 5 ++++-
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
index cc6bc6c..c5ffbe9 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install sources for additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r15"
+PR = "r16"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -19,10 +19,16 @@ UTILS_append_am180x-evm = " \
 
 UTILS_append_omap-a15 = " \
     omapconf-src \
+    pru-icss-src \
 "
 
 UTILS_append_ti33x = " \
     omapconf-src \
+    pru-icss-src \
+"
+
+UTILS_append_ti43x = " \
+    pru-icss-src \
 "
 
 UTILS_append_dra7xx = " \
@@ -33,6 +39,7 @@ EXTRA_LIBS = ""
 
 EXTRA_LIBS_append_omap-a15 = " \
     cmem-mod-src \
+    pru-icss-src \
 "
 
 EXTRA_LIBS_append_dra7xx = " \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index ca011d0..0171123 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r32"
+PR = "r33"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -28,12 +28,14 @@ UTILS_UBOOT_FW_keystone = ""
 UTILS_append_ti33x = " mmc-utils \
                        canutils \
                        switch-config \
+                       pru-icss \
 "
 
 UTILS_append_ti43x = " mmc-utils \
                        canutils \
                        switch-config \
                        libdrm-omap \
+                       pru-icss \
 "
 
 UTILS_append_omap-a15 = " mmc-utils \
@@ -41,6 +43,7 @@ UTILS_append_omap-a15 = " mmc-utils \
                           switch-config \
                           libdrm-omap \
                           stream-openmp \
+                          pru-icss \
 "
 
 # Add PRU examples for am180x-evm devices
-- 
1.9.1


