Return-Path: <h-gou@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 1818152A87
	for <meta-arago@arago-project.org>;
	Mon, 16 Jan 2017 16:19:58 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v0GGJv9C021440
	for <meta-arago@arago-project.org>; Mon, 16 Jan 2017 10:19:57 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v0GGJvhX013760
	for <meta-arago@arago-project.org>; Mon, 16 Jan 2017 10:19:57 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 16 Jan 2017 10:19:56 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v0GGJvhW031531;	Mon, 16 Jan 2017 10:19:57 -0600
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 16 Jan 2017 11:19:27 -0500
Message-ID: <1484583567-11821-1-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Cc: d-senicic1@ti.com
Subject: [PATCH] opencv: update SRC_URI to use tiopencv repo which has TI specific patches
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
X-List-Received-Date: Mon, 16 Jan 2017 16:19:58 -0000
Content-Type: text/plain

* The major addition of tiopencv is dispatching OpenCV kernels to DSP via OpenCL

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
 .../opencv/opencv/am57xx-evm/setupEnv.sh           |  3 ++
 .../opencv/opencv/dra7xx-evm/setupEnv.sh           |  3 ++
 .../opencv/opencv/keystone/setupEnv.sh             |  3 ++
 .../recipes-support/opencv/opencv/setupEnv.sh      |  2 ++
 .../recipes-support/opencv/opencv_3.1.bbappend     | 32 ++++++++++++++++++++++
 5 files changed, 43 insertions(+)
 create mode 100644 meta-arago-distro/recipes-support/opencv/opencv/am57xx-evm/setupEnv.sh
 create mode 100644 meta-arago-distro/recipes-support/opencv/opencv/dra7xx-evm/setupEnv.sh
 create mode 100644 meta-arago-distro/recipes-support/opencv/opencv/keystone/setupEnv.sh
 create mode 100644 meta-arago-distro/recipes-support/opencv/opencv/setupEnv.sh
 create mode 100644 meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend

diff --git a/meta-arago-distro/recipes-support/opencv/opencv/am57xx-evm/setupEnv.sh b/meta-arago-distro/recipes-support/opencv/opencv/am57xx-evm/setupEnv.sh
new file mode 100644
index 0000000..3ad2560
--- /dev/null
+++ b/meta-arago-distro/recipes-support/opencv/opencv/am57xx-evm/setupEnv.sh
@@ -0,0 +1,3 @@
+export OPENCV_BUILDDIR=/usr/share/OpenCV/samples
+export OPENCV_TEST_DATA_PATH=/usr/share/OpenCV/testdata
+export OPENCV_OPENCL_DEVICE='TI AM57:ACCELERATOR:TI Multicore C66 DSP'
diff --git a/meta-arago-distro/recipes-support/opencv/opencv/dra7xx-evm/setupEnv.sh b/meta-arago-distro/recipes-support/opencv/opencv/dra7xx-evm/setupEnv.sh
new file mode 100644
index 0000000..3ad2560
--- /dev/null
+++ b/meta-arago-distro/recipes-support/opencv/opencv/dra7xx-evm/setupEnv.sh
@@ -0,0 +1,3 @@
+export OPENCV_BUILDDIR=/usr/share/OpenCV/samples
+export OPENCV_TEST_DATA_PATH=/usr/share/OpenCV/testdata
+export OPENCV_OPENCL_DEVICE='TI AM57:ACCELERATOR:TI Multicore C66 DSP'
diff --git a/meta-arago-distro/recipes-support/opencv/opencv/keystone/setupEnv.sh b/meta-arago-distro/recipes-support/opencv/opencv/keystone/setupEnv.sh
new file mode 100644
index 0000000..5b6bdb7
--- /dev/null
+++ b/meta-arago-distro/recipes-support/opencv/opencv/keystone/setupEnv.sh
@@ -0,0 +1,3 @@
+export OPENCV_BUILDDIR=/usr/share/OpenCV/samples
+export OPENCV_TEST_DATA_PATH=/usr/share/OpenCV/testdata
+export OPENCV_OPENCL_DEVICE='TI KeyStone II:ACCELERATOR:TI Multicore C66 DSP'
diff --git a/meta-arago-distro/recipes-support/opencv/opencv/setupEnv.sh b/meta-arago-distro/recipes-support/opencv/opencv/setupEnv.sh
new file mode 100644
index 0000000..5bf7afd
--- /dev/null
+++ b/meta-arago-distro/recipes-support/opencv/opencv/setupEnv.sh
@@ -0,0 +1,2 @@
+export OPENCV_BUILDDIR=/usr/share/OpenCV/samples
+export OPENCV_TEST_DATA_PATH=/usr/share/OpenCV/testdata
diff --git a/meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend b/meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend
new file mode 100644
index 0000000..aef44bc
--- /dev/null
+++ b/meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend
@@ -0,0 +1,32 @@
+PR = "r0"
+
+BRANCH = "tiopencvrelease_3.1"
+
+SRC_URI_remove = "git://github.com/Itseez/opencv.git;name=opencv"
+SRC_URI_prepend = "git://git.ti.com/opencv/tiopencv.git;protocol=git;branch=${BRANCH};name=opencv"
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+SRC_URI_append += "\
+     file://setupEnv.sh \
+"
+
+SRCREV_opencv = "b4f54ac48ced0ade8223eafab9cd3ad6dbb1b515"
+
+DEPENDS_remove_keystone = "qtbase"
+
+PACKAGECONFIG_append_am57xx-evm= " opencl"
+PACKAGECONFIG_append_dra7xx-evm= " opencl"
+PACKAGECONFIG_append_keystone = " opencl"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+PACKAGECONFIG[opencl] = "-DWITH_OPENCL=ON -DCMAKE_CXX_FLAGS_RELEASE="${CMAKE_CXX_FLAGS_RELEASE} -DCV_TIOPENCL -DCV_TIOPENCL_ENABLE_PROGRAM_COUNT -DMAX_PROGRAM_HASH_SIZE=50" -DCMAKE_C_FLAGS_RELEASE="${CMAKE_C_FLAGS_RELEASE} -DCV_TIOPENCL -DCV_TIOPENCL_ENABLE_PROGRAM_COUNT -DMAX_PROGRAM_HASH_SIZE=50" -DWITH_OPENCLAMDFFT=OFF -DWITH_OPENCLAMDBLAS=OFF,-DWITH_OPENCL=OFF,cmem opencl,"
+
+do_install_append() {
+    install -d ${D}${datadir}/OpenCV/samples/bin/
+    install -d ${D}${datadir}/OpenCV/titestsuite/
+    cp -f bin/*_test_* ${D}${datadir}/OpenCV/samples/bin/
+    cp -f ${S}/titestsuite/* ${D}${datadir}/OpenCV/titestsuite/
+    cp -f ${WORKDIR}/setupEnv.sh ${D}${datadir}/OpenCV/titestsuite/
+}
-- 
1.9.1


