Return-Path: <sam.nelson@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id DC4CC52007
	for <meta-arago@arago-project.org>;
	Tue, 28 Jun 2016 22:11:17 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u5SMACnb011362
	for <meta-arago@arago-project.org>; Tue, 28 Jun 2016 17:10:12 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u5SMBH3Q019499
	for <meta-arago@arago-project.org>; Tue, 28 Jun 2016 17:11:17 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 28 Jun 2016 17:11:17 -0500
Received: from uda0862859a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u5SMBHpd002982;	Tue, 28 Jun 2016 17:11:17 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 28 Jun 2016 18:11:16 -0400
Message-ID: <1467151876-29554-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH v2] packagegroup-arago-tisdk-addons: Add uio-module-drv and related test code
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
X-List-Received-Date: Tue, 28 Jun 2016 22:11:18 -0000
Content-Type: text/plain

Adds uio-module-drv component and related test code for omap-a15 and
keystone2 platforms

Signed-off-by: Sam Nelson <sam.nelson@ti.com>

---
Added PR bump
---
---
 .../packagegroups/packagegroup-arago-tisdk-addons.bb      | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index efa6ab9..75f8207 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r50"
+PR = "r51"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -51,6 +51,8 @@ UTILS_append_omap-a15 = " mmc-utils \
                           pru-icss \
                           strongswan \
                           ti-ipc-rtos-fw \
+                          uio-test-pruss \
+                          uio-module-drv-test \
 "
 
 UTILS_append_dra7xx = " canutils \
@@ -60,6 +62,7 @@ UTILS_append_dra7xx = " canutils \
 "
 
 UTILS_append_keystone = " \
+    uio-module-drv-test \
     ti-ipc-rtos-fw \
 "
 
@@ -81,7 +84,15 @@ UTILS_append_k2e-evm = " \
 UTILS_append_k2g-evm = " canutils"
 
 EXTRA_LIBS = ""
-EXTRA_LIBS_append_omap-a15 = " cmem"
+EXTRA_LIBS_append_omap-a15 = " \
+    cmem \
+    uio-module-drv \
+"
+
+EXTRA_LIBS_append_keystone = " \
+    cmem \
+    uio-module-drv \
+"
 
 DEVTOOLS = " \
     packagegroup-core-buildessential \
-- 
1.9.1


