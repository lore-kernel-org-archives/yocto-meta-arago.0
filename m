Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 7CA8F529F6
	for <meta-arago@arago-project.org>;
	Fri, 17 Jan 2020 18:48:01 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00HIkElm107862
	for <meta-arago@arago-project.org>; Fri, 17 Jan 2020 12:46:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1579286774;
	bh=AqPZyZFpgtHqb7q8iiG5ityO8pwT7A6DstEk9fCKijQ=;
	h=From:To:CC:Subject:Date;
	b=nXaaxEtuzA8vYxCO/NC5vO3zq8cyTb4KHFdwAFwag2SvGXpraWuf7czHoHLP8PcMF
	BOapTy7y5TgEPvYpxGcU0LvLvq3EFPKojSY7p9cY6on3ucffwZsVjgxuNejqiVkk/v
	1Oz2TN7MCB9ikQZ2NqXKNOMkBGf+xBkr1Bxv1OGs=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00HIkEdq121663
	for <meta-arago@arago-project.org>; Fri, 17 Jan 2020 12:46:14 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Fri, 17 Jan 2020 12:46:13 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Fri, 17 Jan 2020 12:46:13 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00HIkDrA085509;
	Fri, 17 Jan 2020 12:46:13 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 17 Jan 2020 13:27:11 -0500
Message-ID: <1579285632-13770-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [RFC][PATCH 1/2] opencl: update package naming
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
X-List-Received-Date: Fri, 17 Jan 2020 18:48:02 -0000
Content-Type: text/plain

For opencl, use the runtime package to pull in the minimal set of
dependencies needed to run opencl applications. The applications must
use precompiled kernels. Use the main package to pull in the full set
of tools, including clocl and the accelerator toolchains.

For the opencl-examples, the offline-compile package are the examples
which provide precompiled kernels, and thus require the minimum set of
dependencies. The runtime-compile package requires the kernels to be
compiled during runtime, and thus require the full set of opencl
tools, including clocl.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-ti/ocl/opencl-examples_git.bb          | 25 ++++++++++++----------
 meta-arago-extras/recipes-ti/ocl/opencl_git.bb     | 18 ++++++++++------
 2 files changed, 25 insertions(+), 18 deletions(-)

diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
index fe09b90..bb7ff83 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD"
 include ocl.inc
 require recipes-ti/includes/ti-paths.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 COMPATIBLE_MACHINE = "dra7xx|keystone"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -16,12 +16,15 @@ OCL_PERSISTENT_DEPENDS = "ti-xdctools-native ti-ipc-rtos ti-sysbios"
 
 DEPENDS_append_dra7xx = " ${OCL_PERSISTENT_DEPENDS}"
 
-PACKAGES =+ "${PN}-runtime ${PN}-runtime-dbg ${PN}-offline ${PN}-offline-dbg"
+# Split examples into two groups:
+# - offline-compile: examples who's kernels are precompiled (offline).
+# - runtime-compile: examples who's kernels are compiled during runtime.
+PACKAGES =+ "${PN}-runtime-compile ${PN}-runtime-compile-dbg ${PN}-offline-compile ${PN}-offline-compile-dbg"
 
-RDEPENDS_${PN} = "${PN}-runtime ${PN}-offline"
+RDEPENDS_${PN} = "${PN}-runtime-compile ${PN}-offline-compile"
 RDEPENDS_${PN}-dev += "libgomp-dev"
-RDEPENDS_${PN}-offline += "opencl"
-RDEPENDS_${PN}-runtime += "opencl-runtime"
+RDEPENDS_${PN}-offline-compile += "opencl-runtime"
+RDEPENDS_${PN}-runtime-compile += "opencl"
 
 S = "${WORKDIR}/git/opencl_example_src"
 B = "${S}"
@@ -116,20 +119,20 @@ do_install() {
 }
 
 # First package the examples which require run-time kernel compilation.
-FILES_${PN}-runtime += "\
+FILES_${PN}-runtime-compile += "\
     ${@' '.join(['${datadir}/ti/examples/opencl/' + example for example in d.getVar('OCL_RUNTIME_COMPILE_EXAMPLE_LIST').split()])} \
 "
 
-FILES_${PN}-runtime-dbg += "\
+FILES_${PN}-runtime-compile-dbg += "\
     ${@' '.join(['${datadir}/ti/examples/opencl/' + example + '/.debug' for example in d.getVar('OCL_RUNTIME_COMPILE_EXAMPLE_LIST').split()])} \
 "
 
 # Remaining examples will fall through to the "offline" package.
-FILES_${PN}-offline += "\
+FILES_${PN}-offline-compile += "\
     ${datadir}/ti/examples/opencl/ \
 "
 
-FILES_${PN}-offline-dbg += "\
+FILES_${PN}-offline-compile-dbg += "\
     ${datadir}/ti/examples/opencl/*/.debug \
 "
 
@@ -139,5 +142,5 @@ FILES_${PN}-dev = "${datadir}/ti/examples/opencl/Makefile \
 
 ALLOW_EMPTY_${PN} = "1"
 INSANE_SKIP_${PN} = "arch ldflags textrel staticdev"
-INSANE_SKIP_${PN}-offline = "arch ldflags textrel staticdev"
-INSANE_SKIP_${PN}-runtime = "arch ldflags textrel staticdev"
+INSANE_SKIP_${PN}-offline-compile = "arch ldflags textrel staticdev"
+INSANE_SKIP_${PN}-runtime-compile = "arch ldflags textrel staticdev"
diff --git a/meta-arago-extras/recipes-ti/ocl/opencl_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
index 7128c74..59cb8ca 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
@@ -4,13 +4,16 @@ LICENSE = "BSD"
 
 include ocl.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 inherit cmake systemd
 
 COMPATIBLE_MACHINE = "dra7xx|keystone"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
+# Define runtime package for minimal dependencies to run opencl applications
+# which precompile the offloaded kernels. The base package will provide the
+# ability to compile kernels (clocl) during runtime.
 PACKAGES =+ "${PN}-runtime"
 
 MONITORS                      = " opencl-monitor"
@@ -40,11 +43,12 @@ DEPENDS_append_dra7xx   = " ti-ipc virtual/kernel"
 DEPENDS_append_keystone = " mpm-transport multiprocmgr"
 DEPENDS_remove_k2g = " libulm"
 
-RDEPENDS_${PN} += " bash ${MONITORS}"
+RDEPENDS_${PN}-runtime += " bash ${MONITORS}"
 RDEPENDS_${PN}-dev += " ocl-gl-headers-dev"
-RDEPENDS_${PN}-runtime += " ${PN} clocl"
+RDEPENDS_${PN} += " ${PN}-runtime clocl"
 
-ALLOW_EMPTY_${PN}-runtime = "1"
+# Use main package to pull in full support
+ALLOW_EMPTY_${PN} = "1"
 
 S = "${WORKDIR}/git/host"
 
@@ -73,10 +77,10 @@ do_install_append() {
     install -m0644 ${MCTD} ${D}${systemd_system_unitdir}/ti-mct-daemon.service
 }
 
-SYSTEMD_SERVICE_${PN} = "ti-mct-daemon.service"
-SYSTEMD_AUTO_ENABLE_${PN} = "${@oe.utils.conditional("RESERVE_CMEM", "1", "enable", "disable", d)}"
+SYSTEMD_SERVICE_${PN}-runtime = "ti-mct-daemon.service"
+SYSTEMD_AUTO_ENABLE_${PN}-runtime = "${@oe.utils.conditional("RESERVE_CMEM", "1", "enable", "disable", d)}"
 
-FILES_${PN}-runtime += "${bindir}"
+FILES_${PN}-runtime += "${bindir} ${systemd_system_unitdir}"
 
 FILES_${PN} += " \
     ${datadir}/ti/opencl/* \
-- 
2.7.4


