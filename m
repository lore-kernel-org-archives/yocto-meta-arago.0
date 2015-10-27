Return-Path: <jake@udd0866934>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id A848152999
	for <meta-arago@arago-project.org>;
	Tue, 27 Oct 2015 19:05:28 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t9RJ5RHj011852
	for <meta-arago@arago-project.org>; Tue, 27 Oct 2015 14:05:27 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9RJ5RxY022149
	for <meta-arago@arago-project.org>; Tue, 27 Oct 2015 14:05:27 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 27 Oct 2015 14:05:27 -0500
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9RJ5RBx028684;
	Tue, 27 Oct 2015 14:05:27 -0500
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1Zr9Yk-0000xE-Tl; Tue, 27 Oct 2015 15:05:26 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 27 Oct 2015 15:05:16 -0400
Message-ID: <1445972723-3625-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1445972723-3625-1-git-send-email-j-stiffler@ti.com>
References: <1445972723-3625-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 1/8] packagegroup-arago-tisdk-addons: Clean up machine-specific packages
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
X-List-Received-Date: Tue, 27 Oct 2015 19:05:30 -0000
Content-Type: text/plain

* Reorganize into easier-to-read lists

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../packagegroup-arago-tisdk-addons.bb             | 36 ++++++++++++++--------
 1 file changed, 23 insertions(+), 13 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 4a94dc7..fa2d04d 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r30"
+PR = "r31"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -25,24 +25,34 @@ UTILS = " \
 UTILS_UBOOT_FW = "u-boot-fw-utils"
 UTILS_UBOOT_FW_keystone = ""
 
-UTILS_append_ti33x = " mmc-utils"
-UTILS_append_ti43x = " mmc-utils"
-UTILS_append_omap-a15 = " mmc-utils"
+UTILS_append_ti33x = " mmc-utils \
+                       canutils \
+                       switch-config \
+"
+
+UTILS_append_ti43x = " mmc-utils \
+                       canutils \
+                       switch-config \
+                       libdrm-omap \
+"
+
+UTILS_append_omap-a15 = " mmc-utils \
+                          parted \
+                          switch-config \
+                          libdrm-omap \
+                          stream-openmp \
+"
 
 # Add PRU examples for am180x-evm devices
 UTILS_append_am180x-evm = " ti-pru-sw-examples"
 
 UTILS_append_omap3 = " canutils"
-UTILS_append_ti33x = " canutils"
-UTILS_append_ti43x = " canutils"
-UTILS_append_dra7xx = " canutils dsptop gdbc6x"
-UTILS_append_omap-a15 = " parted"
-
-UTILS_append_ti33x = " switch-config"
-UTILS_append_ti43x = " switch-config libdrm-omap"
-UTILS_append_omap-a15 = " switch-config libdrm-omap stream-openmp"
 
-UTILS_append_dra7xx = " glsdk-example-apps"
+UTILS_append_dra7xx = " canutils \
+                        dsptop \
+                        gdbc6x \
+                        glsdk-example-apps \
+"
 
 EXTRA_LIBS = ""
 EXTRA_LIBS_append_omap-a15 = " cmem"
-- 
1.9.1


