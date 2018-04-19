Return-Path: <yuanzhao@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id BF66C52986
	for <meta-arago@arago-project.org>;
	Thu, 19 Apr 2018 21:13:23 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w3JLDLeL027368
	for <meta-arago@arago-project.org>; Thu, 19 Apr 2018 16:13:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1524172401;
	bh=UnMj7DJX2PUJ2XpB8VnmvMiCT6JW+I9/E+13zA1Un0U=;
	h=From:To:CC:Subject:Date;
	b=ra6XDlnXzvzIRRG/9mz0fsh2ywR9fJluiX6cmzfhKlCm+vBkQy6Km623pRYbUBwrK
	gXkDXzBam+R7WVZAAPkEDfjtHyELpElWLt4XRB+41PXolTJgN0KierVYCQXziWowVU
	4iiYaoEcyvKOzbarkA0rDb11HdTX0HxeVtabTqwM=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3JLDLL4002389
	for <meta-arago@arago-project.org>; Thu, 19 Apr 2018 16:13:21 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 19 Apr 2018 16:13:20 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 19 Apr 2018 16:13:20 -0500
Received: from sdomc-build0.hou.asp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3JLDKKU029499;
	Thu, 19 Apr 2018 16:13:20 -0500
From: Yuan Zhao <yuanzhao@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 19 Apr 2018 16:13:14 -0500
Message-ID: <20180419211314.78585-1-yuanzhao@ti.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] ocl: update to version 01.01.15.00
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
X-List-Received-Date: Thu, 19 Apr 2018 21:13:24 -0000
Content-Type: text/plain

- opencl: add monitor build recipe for ipu
- opencl: update examples list

Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
---
 meta-arago-extras/recipes-ti/ocl/ocl.inc           |  4 +-
 .../recipes-ti/ocl/opencl-examples_git.bb          | 29 ++++++++----
 .../recipes-ti/ocl/opencl-monitor-ipu_git.bb       | 54 ++++++++++++++++++++++
 meta-arago-extras/recipes-ti/ocl/opencl_git.bb     |  5 +-
 4 files changed, 79 insertions(+), 13 deletions(-)
 create mode 100644 meta-arago-extras/recipes-ti/ocl/opencl-monitor-ipu_git.bb

diff --git a/meta-arago-extras/recipes-ti/ocl/ocl.inc b/meta-arago-extras/recipes-ti/ocl/ocl.inc
index 635bb911..dd336397 100644
--- a/meta-arago-extras/recipes-ti/ocl/ocl.inc
+++ b/meta-arago-extras/recipes-ti/ocl/ocl.inc
@@ -1,4 +1,4 @@
-PV = "1.1.14.11"
+PV = "1.1.15.0"
 INC_PR = "r0"
 
 LIC_FILES_CHKSUM = "file://../debian/copyright;md5=2e3965a73a8a49c23836467266120dff"
@@ -9,7 +9,7 @@ OCL_GIT_URI = "git://git.ti.com/opencl/ti-opencl.git"
 OCL_GIT_PROTOCOL = "git"
 OCL_GIT_BRANCH = "master"
 
-OCL_SRCREV = "6bbf15687cffc62567848e2c041e9c2dbddea999"
+OCL_SRCREV = "78b0bc0eb38e76a057bc20ed2e3e485f262a9349"
 
 BRANCH = "${OCL_GIT_BRANCH}"
 SRC_URI = "${OCL_GIT_URI};protocol=${OCL_GIT_PROTOCOL};branch=${BRANCH}"
diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
index 5721e581..25b01258 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD"
 include ocl.inc
 require recipes-ti/includes/ti-paths.inc
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.0"
 
 COMPATIBLE_MACHINE = "dra7xx|keystone"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -22,26 +22,29 @@ RDEPENDS_${PN}-dev += " libgomp-dev"
 S = "${WORKDIR}/git/opencl_example_src"
 B = "${S}"
 
-OCL_EXAMPLE_LIST = " buffer \
+OCL_EXAMPLE_LIST = " abort_exit \
+                     buffer \
                      ccode \
+                     conv1d \
+                     dgemm \
+                     dspheap \
                      dsplib_fft \
+                     edmamgr \
                      float_compute \
+                     matmpy \
+                     monte_carlo \
                      null \
                      offline \
                      offline_embed \
+                     ooo_callback \
                      platforms \
+                     sgemm \
                      simple \
+                     timeout \
                      vecadd \
-                     matmpy \
-                     monte_carlo \
-                     ooo_callback \
-                     edmamgr \
-                     sgemm \
                      vecadd_openmp \
                      vecadd_openmp_t \
-                     dgemm \
-                     abort_exit \
-                     timeout \
+                     vecadd_subdevice \
 "
 
 OCL_PERSISTENT_EXAMPLE_LIST = " persistent_clock_concurrent \
@@ -55,6 +58,12 @@ OCL_PERSISTENT_EXAMPLE_LIST = " persistent_clock_concurrent \
 
 OCL_EXAMPLE_LIST_append_dra7xx = " ${OCL_PERSISTENT_EXAMPLE_LIST}"
 
+OCL_MPAX_EXAMPLE_LIST = " vecadd_mpax \
+                          vecadd_mpax_openmp \
+"
+
+OCL_EXAMPLE_LIST_append_k2hk = " ${OCL_MPAX_EXAMPLE_LIST}"
+
 python do_unpack_append() {
     import shutil
 
diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-monitor-ipu_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl-monitor-ipu_git.bb
new file mode 100644
index 00000000..a895261d
--- /dev/null
+++ b/meta-arago-extras/recipes-ti/ocl/opencl-monitor-ipu_git.bb
@@ -0,0 +1,54 @@
+DESCRIPTION = "TI OpenCL M4/IPU device firmware for AM57x"
+HOMEPAGE = "http://software-dl.ti.com/mctools/docs/opencl/intro.html"
+LICENSE = "BSD"
+
+include ocl.inc
+require recipes-ti/includes/ti-paths.inc
+
+PR = "${INC_PR}.0"
+
+inherit cmake update-alternatives
+
+DEPENDS = " common-csl-ip-rtos \
+            pm-lld-rtos \
+            ti-xdctools-native \
+            ti-ipc-rtos \
+            ti-sysbios \
+            ti-pdk-build-rtos \
+            ti-cgt-arm-native \
+            util-linux-native \
+"
+
+COMPATIBLE_MACHINE = "dra7xx"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+S = "${WORKDIR}/git/monitor_ipu"
+
+BUILD_TARGET_dra7xx = "ARM_AM57"
+
+EXTRA_OECMAKE += " -DCROSS_COMPILE=TRUE \
+                   -DOCL_MONITOR_IPU_DIR=${S} \
+                   -DBUILD_OUTPUT=all \
+"
+
+export IPC_DIR = "${IPC_INSTALL_DIR}"
+export BIOS_DIR = "${SYSBIOS_INSTALL_DIR}"
+export PDK_DIR = "${PDK_INSTALL_DIR}"
+export XDC_DIR = "${XDC_INSTALL_DIR}"
+export TI_OCL_M4_CGT_INSTALL = "${STAGING_DIR_NATIVE}/usr/share/ti/ti-cgt-arm"
+export CSL_LIB_M4 = "${PDK_DIR}/packages/ti/csl/lib/am572x/m4/release/ti.csl.aem4"
+export PM_HAL_LIB_M4 = "$(PDK_DIR)/packages/ti/drv/pm/lib/am572x/m4/release/pm_hal.aem4"
+
+ALTERNATIVE_${PN}_dra7xx = "dra7-ipu1-fw.xem4"
+ALTERNATIVE_LINK_NAME[dra7-ipu1-fw.xem4] = "${base_libdir}/firmware/dra7-ipu1-fw.xem4"
+ALTERNATIVE_TARGET[dra7-ipu1-fw.xem4] = "${base_libdir}/firmware/dra7-ipu1-fw.xem4.opencl-monitor"
+ALTERNATIVE_PRIORITY = "100"
+
+MONITOR_IPU_FIRMWARE = ""
+MONITOR_IPU_FIRMWARE_dra7xx = "${base_libdir}/firmware/dra7-ipu1-fw.*"
+
+FILES_${PN} += " \
+    ${MONITOR_IPU_FIRMWARE} \
+"
+
+INSANE_SKIP_${PN} = "arch"
diff --git a/meta-arago-extras/recipes-ti/ocl/opencl_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
index fdc822d0..df6197fa 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
@@ -35,9 +35,12 @@ DEPENDS_append_dra7xx   = " ti-ipc virtual/kernel"
 DEPENDS_append_keystone = " mpm-transport multiprocmgr"
 DEPENDS_remove_k2g = " libulm"
 
+MONITORS        = " opencl-monitor"
+MONITORS_dra7xx = " opencl-monitor opencl-monitor-ipu"
+
 RDEPENDS_${PN} += " bash"
 RDEPENDS_${PN}-dev += " ocl-gl-headers-dev opencl-monitor"
-RDEPENDS_${PN}-runtime += " ${PN} opencl-monitor clocl ti-cgt6x"
+RDEPENDS_${PN}-runtime += " ${PN} ${MONITORS} clocl ti-cgt6x"
 
 ALLOW_EMPTY_${PN}-runtime = "1"
 
-- 
2.14.1


