Return-Path: <h-gou@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id C87CA520E4
	for <meta-arago@arago-project.org>;
	Mon, 23 Sep 2019 19:24:09 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8NJN0Y1130593
	for <meta-arago@arago-project.org>; Mon, 23 Sep 2019 14:23:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1569266580;
	bh=bBYfXXqkTcAFY7ykQ5f4VRtt58rKf7gXozTybZPuH7I=;
	h=From:To:CC:Subject:Date;
	b=jvVb48RJqKkkwghgg+pn+vrUrL/Kih7ALlq6PW6UQmpAo+03ZaW82LcwUvdUhHFwf
	DVcNeQo7IjvL18Wnb2R4cNlMdpY2r1+QlvA9GYXZnAZ3C3nixq8CcinGowhzw3BMhD
	LMK5FUX4cG7suL3rjburVEWtW06eXLYqkZtHyCHg=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8NJN0If127274
	for <meta-arago@arago-project.org>; Mon, 23 Sep 2019 14:23:00 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 23 Sep 2019 14:23:00 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 23 Sep 2019 14:22:54 -0500
Received: from UDA0271529.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8NJMxq7033647;
	Mon, 23 Sep 2019 14:23:00 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 23 Sep 2019 15:21:18 -0400
Message-ID: <20190923192121.29814-1-a0271529@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>, d-senicic1@ti.com,
	Djordje Senicic <x0157990@ti.com>
Subject: [master/thud/ti2019.03 1/4] tiovx-sys-iface: add interface header files between TIOVX library and IPC implementation
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
X-List-Received-Date: Mon, 23 Sep 2019 19:24:10 -0000
Content-Type: text/plain

* Use update-alternatives for the firmware
* Add reload-dsp-fw.sh to enable run-time firmware switch between opencl and tiovx

Signed-off-by: Djordje Senicic <x0157990@ti.com>
Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 .../recipes-ti/tiovx/files/reload-dsp-fw.sh   | 66 +++++++++++++++++++
 .../recipes-ti/tiovx/tiovx-sys-iface.bb       | 49 ++++++++++++++
 .../recipes-ti/tiovx/tiovx-sys.inc            |  5 ++
 3 files changed, 120 insertions(+)
 create mode 100755 meta-arago-extras/recipes-ti/tiovx/files/reload-dsp-fw.sh
 create mode 100644 meta-arago-extras/recipes-ti/tiovx/tiovx-sys-iface.bb
 create mode 100644 meta-arago-extras/recipes-ti/tiovx/tiovx-sys.inc

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
index 00000000..84d2934b
--- /dev/null
+++ b/meta-arago-extras/recipes-ti/tiovx/tiovx-sys-iface.bb
@@ -0,0 +1,49 @@
+SUMMARY = "TI OpenVX interface header files between TIOVX library and HOST, DSP IPC side implementation "
+DESCRIPTION = "Collection of header files needed to defined interface between TIOVX library and HOST and DSP IPC side implementation. In order to maintain source compatibility, directory structure follows VSDK source tree layout."
+
+LICENSE = "TI-TSPA"
+LIC_FILES_CHKSUM = "file://iface/VSDK/docs/TIOVX-SYS-IFACE_1.0.0.0_manifest.html;md5=10904cbdb4f065c025a63ca71ae7de2d"
+
+require recipes-ti/includes/tisdk-paths.inc
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


