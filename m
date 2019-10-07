Return-Path: <h-gou@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 35DAB529F3
	for <meta-arago@arago-project.org>;
	Mon,  7 Oct 2019 22:32:33 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x97MVJ2p111700
	for <meta-arago@arago-project.org>; Mon, 7 Oct 2019 17:31:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1570487479;
	bh=iB/0yT+QHapZ8gZomC17cUQ2EPuTkNkqJm/aDDHuJbY=;
	h=From:To:CC:Subject:Date;
	b=CvFL+3ymRapcPi8u4NyEZavF+Ih0cnJ/VzxRbZuqlr+iVVvUP2svbtn7REqEzVLez
	WBXEcwF7WR65K4rTn35oTRj9HlUZuNUivyfbVKGpxndnB7M9M13kkxaKjgEHpwJtc1
	83TftyT6bKkqkXKLJ1wn5x1XWMfD/A8Bt9FBT8ag=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x97MVJZA079019
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 7 Oct 2019 17:31:19 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 7 Oct 2019 17:31:19 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 7 Oct 2019 17:31:19 -0500
Received: from UDA0271529.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x97MVJNu090165;
	Mon, 7 Oct 2019 17:31:19 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 7 Oct 2019 18:29:18 -0400
Message-ID: <20191007222920.28206-1-a0271529@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>, Djordje Senicic <x0157990@ti.com>
Subject: [master/thud] [PATCH v2 1/4] tiovx-sys-iface: add interface header files between TIOVX library and IPC implementation
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
X-List-Received-Date: Mon, 07 Oct 2019 22:32:33 -0000
Content-Type: text/plain

* Use update-alternatives for the firmware
* Add reload-dsp-fw.sh to enable run-time firmware switch between opencl and tiovx

Signed-off-by: Djordje Senicic <x0157990@ti.com>
Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
v2 changes:
* Add TIOVX_INSTALL_DIR* in arago-paths.inc
* Update the recipe to use arago-paths.inc

 .../recipes-ti/includes/arago-paths.inc       |  2 +
 .../recipes-ti/tiovx/files/reload-dsp-fw.sh   | 66 +++++++++++++++++++
 .../recipes-ti/tiovx/tiovx-sys-iface.bb       | 49 ++++++++++++++
 .../recipes-ti/tiovx/tiovx-sys.inc            |  5 ++
 4 files changed, 122 insertions(+)
 create mode 100755 meta-arago-extras/recipes-ti/tiovx/files/reload-dsp-fw.sh
 create mode 100644 meta-arago-extras/recipes-ti/tiovx/tiovx-sys-iface.bb
 create mode 100644 meta-arago-extras/recipes-ti/tiovx/tiovx-sys.inc

diff --git a/meta-arago-extras/recipes-ti/includes/arago-paths.inc b/meta-arago-extras/recipes-ti/includes/arago-paths.inc
index e90a82bd..137a33c3 100644
--- a/meta-arago-extras/recipes-ti/includes/arago-paths.inc
+++ b/meta-arago-extras/recipes-ti/includes/arago-paths.inc
@@ -7,6 +7,7 @@ export OCL_RTOS_INSTALL_DIR_RECIPE   = "${installdir}/ti-opencl-rtos-tree"
 export OCL_TIDL_FW_INSTALL_DIR_RECIPE   = "${installdir}/ti-opencl-tidl-fw-tree"
 export FFTLIB_INSTALL_DIR_RECIPE     = "${installdir}/ti-fftlib-tree"
 export FFTW_INSTALL_DIR_RECIPE       = "${installdir}/ti-fftw-tree"
+export TIOVX_INSTALL_DIR_RECIPE      = "${installdir}/ti-tiovx-lib-tree"
 
 export LIBARCH_INSTALL_DIR    = "${STAGING_DIR_TARGET}${LIBARCH_INSTALL_DIR_RECIPE}"
 export LINALG_INSTALL_DIR     = "${STAGING_DIR_TARGET}${LINALG_INSTALL_DIR_RECIPE}"
@@ -15,3 +16,4 @@ export OCL_RTOS_INSTALL_DIR   = "${STAGING_DIR_TARGET}${OCL_RTOS_INSTALL_DIR_REC
 export OCL_TIDL_FW_INSTALL_DIR   = "${STAGING_DIR_TARGET}${OCL_TIDL_FW_INSTALL_DIR_RECIPE}"
 export FFTLIB_INSTALL_DIR     = "${STAGING_DIR_TARGET}${FFTLIB_INSTALL_DIR_RECIPE}"
 export FFTW_INSTALL_DIR       = "${STAGING_DIR_TARGET}${FFTW_INSTALL_DIR_RECIPE}"
+export TIOVX_INSTALL_DIR      = "${STAGING_DIR_TARGET}${TIOVX_INSTALL_DIR_RECIPE}"
diff --git a/meta-arago-extras/recipes-ti/tiovx/files/reload-dsp-fw.sh b/meta-arago-extras/recipes-ti/tiovx/files/reload-dsp-fw.sh
new file mode 100755
index 00000000..198fd60f
--- /dev/null
+++ b/meta-arago-extras/recipes-ti/tiovx/files/reload-dsp-fw.sh
@@ -0,0 +1,66 @@
+#!/bin/sh
+usage() {
+    cat << EOF
+
+  Usage:
+         $0 <fw-type: opencl, tiovx>
+
+EOF
+}
+
+if [ "$1" ]; then
+case "$1" in
+    opencl) echo "Reload opencl firmware to DSP"
+        ;;
+    tiovx) echo "Reload tiovx firmware to DSP"
+        ;;
+    *) echo "Wrong argument $1"
+       usage
+       exit
+        ;;
+esac
+else
+       usage
+       exit
+fi
+
+fw="${1}"
+
+if [[ ${fw} == opencl ]]; then
+    #Start OpenCL CMEM memory allocation daemon
+    if pgrep -x "ti-mctd" > /dev/null
+    then
+        echo "ti-mctd is running"
+    else
+        echo "Starting ti-mctd..."
+        ti-mctd
+    fi
+    # Link opencl monitor firmware for DSPs
+    ln -s -f /lib/firmware/dra7-dsp1-fw.xe66.opencl-monitor /lib/firmware/dra7-dsp1-fw.xe66
+    ln -s -f /lib/firmware/dra7-dsp2-fw.xe66.opencl-monitor /lib/firmware/dra7-dsp2-fw.xe66
+fi
+
+if [[ ${fw} == tiovx ]]; then
+    # Kill CMEM multi-process daemon. This releases all CMEM memory used by OpenCL memory allocation
+    pkill ti-mctd
+
+    # Link tiovx firmware for DSPs
+    ln -s -f /lib/firmware/dra7-dsp1-fw.xe66.openvx /lib/firmware/dra7-dsp1-fw.xe66
+    ln -s -f /lib/firmware/dra7-dsp2-fw.xe66.openvx /lib/firmware/dra7-dsp2-fw.xe66
+fi
+
+cd /sys/bus/platform/drivers/omap-rproc/
+
+# release DSPs
+echo "Releasing DSPs..."
+echo 40800000.dsp > unbind
+
+echo 41000000.dsp > unbind
+
+# reload firmware for DSPs
+echo "Reloading firmware for DSPs..."
+echo 40800000.dsp > bind
+
+echo 41000000.dsp > bind
+
+cd ~-
diff --git a/meta-arago-extras/recipes-ti/tiovx/tiovx-sys-iface.bb b/meta-arago-extras/recipes-ti/tiovx/tiovx-sys-iface.bb
new file mode 100644
index 00000000..a60cbe54
--- /dev/null
+++ b/meta-arago-extras/recipes-ti/tiovx/tiovx-sys-iface.bb
@@ -0,0 +1,49 @@
+SUMMARY = "TI OpenVX interface header files between TIOVX library and HOST, DSP IPC side implementation "
+DESCRIPTION = "Collection of header files needed to defined interface between TIOVX library and HOST and DSP IPC side implementation. In order to maintain source compatibility, directory structure follows VSDK source tree layout."
+
+LICENSE = "TI-TSPA"
+LIC_FILES_CHKSUM = "file://iface/VSDK/docs/TIOVX-SYS-IFACE_1.0.0.0_manifest.html;md5=10904cbdb4f065c025a63ca71ae7de2d"
+
+require recipes-ti/includes/arago-paths.inc
+require tiovx-sys.inc
+
+PR = "r1"
+
+COMPATIBLE_MACHINE = "dra7xx"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+inherit update-alternatives
+
+SRC_URI_append += "\
+     file://reload-dsp-fw.sh \
+"
+
+S = "${WORKDIR}/git"
+
+do_install () {
+#   Install the header files
+    CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
+    install -d ${D}${TIOVX_INSTALL_DIR_RECIPE}/sys-iface
+    cp ${CP_ARGS} ${S}/iface/VSDK/* ${D}${TIOVX_INSTALL_DIR_RECIPE}/sys-iface
+#   Install the firmware
+    install -d ${D}/${base_libdir}/firmware
+    install -m 0644 ${S}/firmware/tiovx_dsp1.xe66 ${D}/${base_libdir}/firmware/dra7-dsp1-fw.xe66.openvx
+    install -m 0644 ${S}/firmware/tiovx_dsp2.xe66 ${D}/${base_libdir}/firmware/dra7-dsp2-fw.xe66.openvx
+#   Install the scripts for loading dsp firmware
+    install -d ${D}${bindir}/
+    install -m 0755 ${WORKDIR}/reload-dsp-fw.sh ${D}${bindir}
+}
+
+ALTERNATIVE_${PN} = "dra7-dsp1-fw.xe66 dra7-dsp2-fw.xe66"
+ALTERNATIVE_LINK_NAME[dra7-dsp1-fw.xe66] = "${base_libdir}/firmware/dra7-dsp1-fw.xe66"
+ALTERNATIVE_TARGET[dra7-dsp1-fw.xe66] = "${base_libdir}/firmware/dra7-dsp1-fw.xe66.openvx"
+ALTERNATIVE_LINK_NAME[dra7-dsp2-fw.xe66] = "${base_libdir}/firmware/dra7-dsp2-fw.xe66"
+ALTERNATIVE_TARGET[dra7-dsp2-fw.xe66] = "${base_libdir}/firmware/dra7-dsp2-fw.xe66.openvx"
+ALTERNATIVE_PRIORITY = "20"
+
+FILES_${PN} += "${TIOVX_INSTALL_DIR_RECIPE}/sys-iface/* "
+PACKAGES =+ "${PN}-firmware"
+FILES_${PN}-firmware = "${base_libdir}/firmware/*"
+
+INSANE_SKIP_${PN}-firmware = "arch"
+
diff --git a/meta-arago-extras/recipes-ti/tiovx/tiovx-sys.inc b/meta-arago-extras/recipes-ti/tiovx/tiovx-sys.inc
new file mode 100644
index 00000000..becf0cc1
--- /dev/null
+++ b/meta-arago-extras/recipes-ti/tiovx/tiovx-sys.inc
@@ -0,0 +1,5 @@
+PV = "01.00.01.00"
+
+BRANCH="master"
+SRCREV = "5be60aee8d013907a4d8a6cc8af35a517a33b49e"
+SRC_URI = "git://git.ti.com/processor-sdk/tiovx-app.git;protocol=git;branch=${BRANCH}"
-- 
2.17.1


