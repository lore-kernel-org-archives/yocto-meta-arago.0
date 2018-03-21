Return-Path: <h-gou@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id F3C06529A2
	for <meta-arago@arago-project.org>;
	Wed, 21 Mar 2018 03:12:06 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2L3B6UL019156
	for <meta-arago@arago-project.org>; Tue, 20 Mar 2018 22:11:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521601866;
	bh=dg+f4q7ZfS2nklfOKl/nGtEo+t71ndaNHdEWkKXbChA=;
	h=From:To:CC:Subject:Date;
	b=o+/YrUvv1CQ3sZkUX4GyJaxBdWQ8uqHIf93z7HaequMPor+2AEra9DZg/RB8d+Wwn
	Nt7sF3GxT+qN2C1DfHqOGB+ciABbBE0+3vSiaNavqFuS7dmCOGJyZsMX+C40ZZyanK
	7KtOorcx50vLVgbM+Xxsi1gUOoZblmmqS9FcEt/4=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2L3B6Ls022150
	for <meta-arago@arago-project.org>; Tue, 20 Mar 2018 22:11:06 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Tue, 20 Mar 2018 22:11:06 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Tue, 20 Mar 2018 22:11:06 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2L3B63k029601;
	Tue, 20 Mar 2018 22:11:06 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 20 Mar 2018 23:11:04 -0400
Message-ID: <1521601864-2431-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk] [PATCH] tiovx-sys-iface: add scripts for reloading dsp firmware
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
X-List-Received-Date: Wed, 21 Mar 2018 03:12:07 -0000
Content-Type: text/plain

* This is to enable run-time firmware switch between opencl-monitor and tiovx

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 recipes-ti/tiovx/files/reload-dsp-fw.sh | 66 +++++++++++++++++++++++++++++++++
 recipes-ti/tiovx/tiovx-sys-iface.bb     | 12 +++++-
 2 files changed, 77 insertions(+), 1 deletion(-)
 create mode 100755 recipes-ti/tiovx/files/reload-dsp-fw.sh

diff --git a/recipes-ti/tiovx/files/reload-dsp-fw.sh b/recipes-ti/tiovx/files/reload-dsp-fw.sh
new file mode 100755
index 0000000..198fd60
--- /dev/null
+++ b/recipes-ti/tiovx/files/reload-dsp-fw.sh
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
diff --git a/recipes-ti/tiovx/tiovx-sys-iface.bb b/recipes-ti/tiovx/tiovx-sys-iface.bb
index bcfbcc9..8f1b4d3 100644
--- a/recipes-ti/tiovx/tiovx-sys-iface.bb
+++ b/recipes-ti/tiovx/tiovx-sys-iface.bb
@@ -7,13 +7,19 @@ LIC_FILES_CHKSUM = "file://iface/VSDK/docs/TIOVX-SYS-IFACE_1.0.0.0_manifest.html
 require recipes-ti/includes/tisdk-paths.inc
 require tiovx-sys.inc
 
-PR = "r0"
+PR = "r1"
 
 COMPATIBLE_MACHINE = "dra7xx"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit update-alternatives
 
+FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
+
+SRC_URI_append += "\
+     file://reload-dsp-fw.sh \
+"
+
 S = "${WORKDIR}/git"
 
 do_install () {
@@ -21,9 +27,13 @@ do_install () {
     CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
     install -d ${D}${TIOVX_INSTALL_DIR_RECIPE}/sys-iface
     cp ${CP_ARGS} ${S}/iface/VSDK/* ${D}${TIOVX_INSTALL_DIR_RECIPE}/sys-iface
+#   Install the firmware
     install -d ${D}/${base_libdir}/firmware
     install -m 0644 ${S}/firmware/tiovx_dsp1.xe66 ${D}/${base_libdir}/firmware/dra7-dsp1-fw.xe66.openvx
     install -m 0644 ${S}/firmware/tiovx_dsp2.xe66 ${D}/${base_libdir}/firmware/dra7-dsp2-fw.xe66.openvx
+#   Install the scripts for loading dsp firmware
+    install -d ${D}${bindir}/
+    install -m 0755 ${WORKDIR}/reload-dsp-fw.sh ${D}${bindir}
 }
 
 ALTERNATIVE_${PN} = "dra7-dsp1-fw.xe66 dra7-dsp2-fw.xe66"
-- 
1.9.1


