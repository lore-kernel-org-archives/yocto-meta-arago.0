Return-Path: <j-stiffler@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 7FF8352AC4
	for <meta-arago@arago-project.org>;
	Tue, 28 Feb 2017 16:01:38 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v1SG1cfA025740
	for <meta-arago@arago-project.org>; Tue, 28 Feb 2017 10:01:38 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v1SG1bIN028660
	for <meta-arago@arago-project.org>; Tue, 28 Feb 2017 10:01:38 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 28 Feb 2017 10:01:37 -0600
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v1SG1bOf030075;	Tue, 28 Feb 2017 10:01:37 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 28 Feb 2017 10:59:19 -0500
Message-ID: <1488297560-24159-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [krogoth/morty/master][PATCH 1/2] packagegroup-arago-tisdk-opencl*: add linalg for dra7xx
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
X-List-Received-Date: Tue, 28 Feb 2017 16:01:38 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-opencl-sdk-host.bb       | 6 +++++-
 .../packagegroups/packagegroup-arago-tisdk-opencl-sdk-target.bb     | 6 +++++-
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bb   | 6 +++++-
 3 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl-sdk-host.bb
index aac2472..0e0e112 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl-sdk-host.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install sources for OpenCL/MP apps and demos"
 LICENSE = "MIT"
-PR = "r0"
+PR = "r1"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -15,6 +15,10 @@ UTILS_append_k2hk-evm = " \
     linalg-examples-src \
 "
 
+UTILS_append_dra7xx = " \
+    linalg-examples-src \
+"
+
 RDEPENDS_${PN} = "\
     ${UTILS} \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl-sdk-target.bb
index ac235f0..ea0f724 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl-sdk-target.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install headers and libraries of OpenCL/MP and related components"
 LICENSE = "MIT"
-PR = "r1"
+PR = "r2"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -16,6 +16,10 @@ UTILS_append_k2hk-evm = " \
     linalg-dev \
 "
 
+UTILS_append_dra7xx = " \
+    linalg-dev \
+"
+
 RDEPENDS_${PN} = "\
     ${UTILS} \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bb
index 6898dd6..e882e2a 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install OpenCL/MP and related components"
 LICENSE = "MIT"
-PR = "r1"
+PR = "r2"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -23,6 +23,10 @@ EXTRA_PKGS_append_k2hk-evm = " \
     linalg-examples \
 "
 
+EXTRA_PKGS_append_dra7xx = " \
+    linalg-examples \
+"
+
 RDEPENDS_${PN} = "\
     ${MAIN_PKGS} \
 "
-- 
2.7.4


