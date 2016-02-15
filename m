Return-Path: <jake@udd0866934>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 0DE5F52A9B
	for <meta-arago@arago-project.org>;
	Mon, 15 Feb 2016 17:19:37 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u1FHJZGQ011735
	for <meta-arago@arago-project.org>; Mon, 15 Feb 2016 11:19:35 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1FHJZxP003748
	for <meta-arago@arago-project.org>; Mon, 15 Feb 2016 11:19:35 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 15 Feb 2016 11:19:35 -0600
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1FHJZNt029424;
	Mon, 15 Feb 2016 11:19:35 -0600
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1aVMoA-0000P7-L5; Mon, 15 Feb 2016 12:19:34 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 15 Feb 2016 12:19:27 -0500
Message-ID: <1455556771-1512-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1455556771-1512-1-git-send-email-j-stiffler@ti.com>
References: <1455556771-1512-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 1/5] packagegroup-arago-tisdk-addons: Add ${PN}-extra package
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
X-List-Received-Date: Mon, 15 Feb 2016 17:19:38 -0000
Content-Type: text/plain

* This extra packagegroup will be used for non-essential addons such
  as -dev packages
* The motivation for the creation of this packagegroup is to limit the
  ubifs to only essential packages but still provide a filesystem
  tarball with the complete set of packages for NFS.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../packagegroup-arago-tisdk-addons.bb             | 46 ++++++++++++----------
 1 file changed, 26 insertions(+), 20 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 8314cc2..3ab3bf8 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -1,11 +1,13 @@
 DESCRIPTION = "Task to install additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r40"
+PR = "r41"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit packagegroup
 
+PACKAGES =+ "${PN}-extra"
+
 UTILS = " \
     am-sysinfo \
     dt \
@@ -59,8 +61,7 @@ UTILS_append_dra7xx = " canutils \
                         dsptop \
                         gdbc6x \
                         glsdk-example-apps \
-                        opencl-staticdev \
-                        opencl-examples-dev \
+                        opencl-examples \
 "
 
 UTILS_append_keystone = " \
@@ -68,22 +69,19 @@ UTILS_append_keystone = " \
 "
 
 UTILS_append_k2hk-evm = " \
-    opencl-staticdev \
-    opencl-examples-dev \
+    opencl-examples \
     gdbc6x \
     dsptop \
 "
 
 UTILS_append_k2l-evm = " \
-    opencl-staticdev \
-    opencl-examples-dev \
+    opencl-examples \
     gdbc6x \
     dsptop \
 "
 
 UTILS_append_k2e-evm = " \
-    opencl-staticdev \
-    opencl-examples-dev \
+    opencl-examples \
     gdbc6x \
     dsptop \
 "
@@ -99,22 +97,26 @@ DEVTOOLS = " \
     git \
 "
 
-DEVTOOLS_append_ti33x = " \
+EXTRA_PACKAGES = " \
     nodejs \
     nodejs-npm \
     protobuf \
 "
-
-DEVTOOLS_append_ti43x = " \
-    nodejs \
-    nodejs-npm \
-    protobuf \
+EXTRA_PACKAGES_append_dra7xx = " \
+    opencl-staticdev \
+    opencl-examples-dev \
 "
-
-DEVTOOLS_append_omap-a15 = " \
-    nodejs \
-    nodejs-npm \
-    protobuf \
+EXTRA_PACKAGES_append_k2hk-evm = " \
+    opencl-staticdev \
+    opencl-examples-dev \
+"
+EXTRA_PACKAGES_append_k2l-evm = " \
+    opencl-staticdev \
+    opencl-examples-dev \
+"
+EXTRA_PACKAGES_append_k2e-evm = " \
+    opencl-staticdev \
+    opencl-examples-dev \
 "
 
 RDEPENDS_${PN} = "\
@@ -123,3 +125,7 @@ RDEPENDS_${PN} = "\
     ${DEVTOOLS} \
     ${EXTRA_LIBS} \
 "
+
+RDEPENDS_${PN}-extra = "\
+    ${EXTRA_PACKAGES} \
+"
-- 
1.9.1


