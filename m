Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 042F252994
	for <meta-arago@arago-project.org>;
	Sat, 29 Feb 2020 16:17:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5825040C1D;
	Sat, 29 Feb 2020 16:15:04 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id ZWzH2wjkdVeO; Sat, 29 Feb 2020 16:15:04 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 142DD40BFE;
	Sat, 29 Feb 2020 16:15:01 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 71568174428;
	Sat, 29 Feb 2020 11:14:59 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Sat, 29 Feb 2020 11:14:43 -0500
Message-Id: <1582992888-3508-4-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582992888-3508-1-git-send-email-denis@denix.org>
References: <1582992888-3508-1-git-send-email-denis@denix.org>
Subject: [zeus/master][PATCH 4/9] opencl: major refactor
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
X-List-Received-Date: Sat, 29 Feb 2020 16:17:07 -0000

From: Jacob Stiffler <j-stiffler@ti.com>

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
Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroup-arago-tisdk-opencl.bb             |  6 +--
 meta-arago-extras/conf/layer.conf                  |  1 -
 meta-arago-extras/recipes-ti/ocl/clocl_git.bb      |  1 +
 .../recipes-ti/ocl/opencl-examples_git.bb          | 47 +++++++++++++++++++---
 meta-arago-extras/recipes-ti/ocl/opencl_git.bb     | 33 ++++++++-------
 5 files changed, 61 insertions(+), 27 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bb
index c1ef8ae..c357f9c 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bb
@@ -9,13 +9,10 @@ inherit packagegroup
 PACKAGES =+ "${PN}-extra"
 
 MAIN_PKGS = " \
-    opencl-examples \
+    opencl-examples-offline-compile \
 "
 
 EXTRA_PKGS = " \
-    opencl-staticdev \
-    opencl-examples-dev \
-    openmpacc-examples-dev \
     python-pyopencl \
 "
 
@@ -27,7 +24,6 @@ EXTRA_PKGS_append_k2hk = " \
 #    ti-fftw-examples
 EXTRA_PKGS_append_dra7xx = " \
     linalg-examples \
-    opencl-examples \
     kaldi \
 "
 
diff --git a/meta-arago-extras/conf/layer.conf b/meta-arago-extras/conf/layer.conf
index 02ffb8a..88fbaf9 100644
--- a/meta-arago-extras/conf/layer.conf
+++ b/meta-arago-extras/conf/layer.conf
@@ -41,5 +41,4 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
 SIGGEN_EXCLUDERECIPES_ABISAFE += " \
     ipsecmgr-mod \
     gstreamer1.0-plugins-bad \
-    opencl \
 "
diff --git a/meta-arago-extras/recipes-ti/ocl/clocl_git.bb b/meta-arago-extras/recipes-ti/ocl/clocl_git.bb
index c7f467f..df77d7e 100644
--- a/meta-arago-extras/recipes-ti/ocl/clocl_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/clocl_git.bb
@@ -31,4 +31,5 @@ do_install() {
   install -m 755 ${S}/clocl/${TARGET}/clocl ${D}${bindir}
 }
 
+RDEPENDS_${PN} += "ti-cgt6x"
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
index 4732c73..bb7ff83 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD"
 include ocl.inc
 require recipes-ti/includes/ti-paths.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 COMPATIBLE_MACHINE = "dra7xx|keystone"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -16,12 +16,30 @@ OCL_PERSISTENT_DEPENDS = "ti-xdctools-native ti-ipc-rtos ti-sysbios"
 
 DEPENDS_append_dra7xx = " ${OCL_PERSISTENT_DEPENDS}"
 
-RDEPENDS_${PN} += " opencl-runtime"
-RDEPENDS_${PN}-dev += " libgomp-dev"
+# Split examples into two groups:
+# - offline-compile: examples who's kernels are precompiled (offline).
+# - runtime-compile: examples who's kernels are compiled during runtime.
+PACKAGES =+ "${PN}-runtime-compile ${PN}-runtime-compile-dbg ${PN}-offline-compile ${PN}-offline-compile-dbg"
+
+RDEPENDS_${PN} = "${PN}-runtime-compile ${PN}-offline-compile"
+RDEPENDS_${PN}-dev += "libgomp-dev"
+RDEPENDS_${PN}-offline-compile += "opencl-runtime"
+RDEPENDS_${PN}-runtime-compile += "opencl"
 
 S = "${WORKDIR}/git/opencl_example_src"
 B = "${S}"
 
+OCL_RUNTIME_COMPILE_EXAMPLE_LIST = " \
+    ccode \
+    null \
+    ooo_callback \
+    simple \
+    vecadd \
+    vecadd_openmp \
+    vecadd_openmp_t \
+    vecadd_subdevice \
+"
+
 OCL_EXAMPLE_LIST = " abort_exit \
                      buffer \
                      ccode \
@@ -100,12 +118,29 @@ do_install() {
     done
 }
 
-FILES_${PN} += "\
-    ${datadir}/ti/examples/opencl \
+# First package the examples which require run-time kernel compilation.
+FILES_${PN}-runtime-compile += "\
+    ${@' '.join(['${datadir}/ti/examples/opencl/' + example for example in d.getVar('OCL_RUNTIME_COMPILE_EXAMPLE_LIST').split()])} \
+"
+
+FILES_${PN}-runtime-compile-dbg += "\
+    ${@' '.join(['${datadir}/ti/examples/opencl/' + example + '/.debug' for example in d.getVar('OCL_RUNTIME_COMPILE_EXAMPLE_LIST').split()])} \
+"
+
+# Remaining examples will fall through to the "offline" package.
+FILES_${PN}-offline-compile += "\
+    ${datadir}/ti/examples/opencl/ \
 "
 
-FILES_${PN}-dbg += "\
+FILES_${PN}-offline-compile-dbg += "\
     ${datadir}/ti/examples/opencl/*/.debug \
 "
 
+# Add makefiles to dev package
+FILES_${PN}-dev = "${datadir}/ti/examples/opencl/Makefile \
+                   ${datadir}/ti/examples/opencl/make.inc"
+
+ALLOW_EMPTY_${PN} = "1"
 INSANE_SKIP_${PN} = "arch ldflags textrel staticdev"
+INSANE_SKIP_${PN}-offline-compile = "arch ldflags textrel staticdev"
+INSANE_SKIP_${PN}-runtime-compile = "arch ldflags textrel staticdev"
diff --git a/meta-arago-extras/recipes-ti/ocl/opencl_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
index 69f9330..48bbc02 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
@@ -4,17 +4,23 @@ LICENSE = "BSD"
 
 include ocl.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.3"
 
 inherit cmake systemd
 
 COMPATIBLE_MACHINE = "dra7xx|keystone"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
+# Define runtime package for minimal dependencies to run opencl applications
+# which precompile the offloaded kernels. The base package will provide the
+# ability to compile kernels (clocl) during runtime.
 PACKAGES =+ "${PN}-runtime"
 
+MONITORS                      = " opencl-monitor"
+MONITORS_append_dra7xx        = " opencl-monitor-ipu"
+
 DEPENDS = " ocl-gl-headers \
-            opencl-monitor \
+            ${MONITORS} \
             cmake-native \
             cmem \
             ti-llvm3.6 \
@@ -31,20 +37,16 @@ DEPENDS = " ocl-gl-headers \
             json-c \
 "
 
-DEPENDS_append_dra7xx   = " ti-ipc virtual/kernel"
+DEPENDS_append_dra7xx = " ti-ipc virtual/kernel"
 DEPENDS_append_keystone = " mpm-transport multiprocmgr"
 DEPENDS_remove_k2g = " libulm"
 
-MONITORS                      = " opencl-monitor"
-MONITORS_append_am57xx-evm    = " opencl-monitor-ipu"
-MONITORS_append_am57xx-hs-evm = " opencl-monitor-ipu"
-MONITORS_append_dra7xx        = " opencl-monitor-ipu"
-
-RDEPENDS_${PN} += " bash"
-RDEPENDS_${PN}-dev += " ocl-gl-headers-dev opencl-monitor"
-RDEPENDS_${PN}-runtime += " ${PN} ${MONITORS} clocl ti-cgt6x"
+RDEPENDS_${PN}-runtime += "bash ${MONITORS}"
+RDEPENDS_${PN}-dev += "ocl-gl-headers-dev"
+RDEPENDS_${PN} += "${PN}-runtime clocl bash"
 
-ALLOW_EMPTY_${PN}-runtime = "1"
+# Use main package to pull in full support
+ALLOW_EMPTY_${PN} = "1"
 
 S = "${WORKDIR}/git/host"
 
@@ -73,10 +75,11 @@ do_install_append() {
     install -m0644 ${MCTD} ${D}${systemd_system_unitdir}/ti-mct-daemon.service
 }
 
-SYSTEMD_SERVICE_${PN} = "ti-mct-daemon.service"
-SYSTEMD_AUTO_ENABLE_${PN} = "${@oe.utils.conditional("RESERVE_CMEM", "1", "enable", "disable", d)}"
+SYSTEMD_PACKAGES = "${PN}-runtime"
+SYSTEMD_SERVICE_${PN}-runtime = "ti-mct-daemon.service"
+SYSTEMD_AUTO_ENABLE_${PN}-runtime = "${@oe.utils.conditional("RESERVE_CMEM", "1", "enable", "disable", d)}"
 
-FILES_${PN}-runtime += "${bindir}"
+FILES_${PN}-runtime += "${bindir} ${systemd_system_unitdir} ${sysconfdir}/ti-mctd ${libdir}/lib*${SOLIBS}"
 
 FILES_${PN} += " \
     ${datadir}/ti/opencl/* \
-- 
2.7.4


