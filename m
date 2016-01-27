Return-Path: <jake@udd0866934>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 56FDF529E4
	for <meta-arago@arago-project.org>;
	Wed, 27 Jan 2016 19:54:33 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u0RJsWxC022471
	for <meta-arago@arago-project.org>; Wed, 27 Jan 2016 13:54:32 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0RJsWAP022552
	for <meta-arago@arago-project.org>; Wed, 27 Jan 2016 13:54:32 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 27 Jan 2016 13:54:32 -0600
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0RJsWm7022148;
	Wed, 27 Jan 2016 13:54:32 -0600
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1aOWAh-0007F4-UB; Wed, 27 Jan 2016 14:54:31 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 27 Jan 2016 14:54:26 -0500
Message-ID: <1453924469-27790-4-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453924469-27790-1-git-send-email-j-stiffler@ti.com>
References: <1453924469-27790-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 3/6] packagegroup-arago-tisdk-addons*: Add OpenCL and related packages for keystone
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
X-List-Received-Date: Wed, 27 Jan 2016 19:54:34 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../packagegroup-arago-tisdk-addons-sdk-host.bb    | 29 +++++++++++++++++++++-
 .../packagegroup-arago-tisdk-addons-sdk-target.bb  | 14 ++++++++++-
 .../packagegroup-arago-tisdk-addons.bb             | 21 ++++++++++++++++
 3 files changed, 62 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
index c5ffbe9..eed469d 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install sources for additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r16"
+PR = "r17"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -35,6 +35,18 @@ UTILS_append_dra7xx = " \
     opencl-examples-src \
 "
 
+UTILS_append_k2hk-evm = " \
+    opencl-examples-src \
+"
+
+UTILS_append_k2l-evm = " \
+    opencl-examples-src \
+"
+
+UTILS_append_k2e-evm = " \
+    opencl-examples-src \
+"
+
 EXTRA_LIBS = ""
 
 EXTRA_LIBS_append_omap-a15 = " \
@@ -53,6 +65,21 @@ EXTRA_LIBS_append_keystone = " \
     hplib-mod-src \
 "
 
+EXTRA_LIBS_append_k2hk-evm = " \
+    debugss-module-drv-src \
+    gdbserverproxy-module-drv-src \
+"
+
+EXTRA_LIBS_append_k2l-evm = " \
+    debugss-module-drv-src \
+    gdbserverproxy-module-drv-src \
+"
+
+EXTRA_LIBS_append_k2e-evm = " \
+    debugss-module-drv-src \
+    gdbserverproxy-module-drv-src \
+"
+
 RDEPENDS_${PN} = "\
     ${UTILS} \
     ${EXTRA_LIBS} \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
index 7d5b290..12352eb 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install headers and libraries related to addons into the SDK"
 LICENSE = "MIT"
-PR = "r19"
+PR = "r20"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -121,6 +121,9 @@ UTILS_append_ti43x = " canutils-dev"
 UTILS_append_dra7xx = " canutils-dev \
                         opencl-staticdev \
 "
+UTILS_append_k2hk-evm = " opencl-staticdev"
+UTILS_append_k2l-evm = " opencl-staticdev"
+UTILS_append_k2e-evm = " opencl-staticdev"
 UTILS_append_k2g-evm = " canutils-dev"
 
 EXTRA_LIBS = ""
@@ -129,6 +132,15 @@ EXTRA_LIBS_append_dra7xx = " libulm-dev \
                              libulm-staticdev \
                              gdbserver-c6x-dev \
 "
+EXTRA_LIBS_append_k2hk-evm = " libulm-staticdev \
+                               gdbserver-c6x-dev \
+"
+EXTRA_LIBS_append_k2l-evm = " libulm-staticdev \
+                              gdbserver-c6x-dev \
+"
+EXTRA_LIBS_append_k2e-evm = " libulm-staticdev \
+                              gdbserver-c6x-dev \
+"
 
 RDEPENDS_${PN} = "\
     ${UTILS} \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 1fade5a..b34c6f4 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -62,6 +62,27 @@ UTILS_append_dra7xx = " canutils \
                         opencl-examples-dev \
 "
 
+UTILS_append_k2hk-evm = " \
+    opencl-staticdev \
+    opencl-examples-dev \
+    gdbc6x \
+    dsptop \
+"
+
+UTILS_append_k2l-evm = " \
+    opencl-staticdev \
+    opencl-examples-dev \
+    gdbc6x \
+    dsptop \
+"
+
+UTILS_append_k2e-evm = " \
+    opencl-staticdev \
+    opencl-examples-dev \
+    gdbc6x \
+    dsptop \
+"
+
 UTILS_append_k2g-evm = " canutils"
 
 EXTRA_LIBS = ""
-- 
1.9.1


