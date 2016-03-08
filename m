Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTPS id 246D052A26
	for <meta-arago@arago-project.org>;
	Tue,  8 Mar 2016 18:23:49 +0000 (UTC)
Received: from vz-proxy-l001.mx.aol.com ([64.236.82.158])
	by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O3Q00DJKGF6VZ30@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 08 Mar 2016 12:23:31 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=MtGvkDue c=1 sm=1 tr=0	a=W8DY27sA+pJ1DslXMfMu3Q==:117
	a=7OsogOcEt9IA:10 a=sozttTNsAAAA:8	a=HihYlcsHAAAA:8
	a=SOnmpBoiLuU9oqWKTP8A:9
Received: by 100.15.86.14 with SMTP id 4c748d68; Tue, 08 Mar 2016 18:23:30 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 66DBC161F14;	Tue,
	8 Mar 2016 13:23:30 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 08 Mar 2016 13:23:30 -0500
Message-id: <1457461410-12113-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] ipc-test-fw: remove, sample FW images are now provided by ipc
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
X-List-Received-Date: Tue, 08 Mar 2016 18:23:57 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../ipc-test-fw/ipc-test-fw_3.21.00.02.bb          | 49 ----------------------
 .../packagegroups/packagegroup-arago-test.bb       |  3 +-
 2 files changed, 1 insertion(+), 51 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-bsp/ipc-test-fw/ipc-test-fw_3.21.00.02.bb

diff --git a/meta-arago-distro/recipes-bsp/ipc-test-fw/ipc-test-fw_3.21.00.02.bb b/meta-arago-distro/recipes-bsp/ipc-test-fw/ipc-test-fw_3.21.00.02.bb
deleted file mode 100644
index 3093b53..0000000
--- a/meta-arago-distro/recipes-bsp/ipc-test-fw/ipc-test-fw_3.21.00.02.bb
+++ /dev/null
@@ -1,49 +0,0 @@
-DESCRIPTION = "Firmware images to test IPC"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/BSD;md5=3775480a712fc46a69647678acb234cb"
-
-inherit update-alternatives
-
-FWVER = "eng-4-gb9283b0"
-PR = "r2+${FWVER}"
-
-COMPATIBLE_MACHINE = "omap5-evm|dra7xx"
-
-INHIBIT_PACKAGE_STRIP = "1"
-INSANE_SKIP_${PN} = "arch"
-
-S = "${WORKDIR}/${PV}_${FWVER}"
-
-SRC_URI = "http://arago-project.org/files/releases/ipc-test-fw/${PV}_${FWVER}.tar.gz"
-
-SRC_URI[md5sum] = "4fcba6844949ea909131684a80233800"
-SRC_URI[sha256sum] = "3b90b195c382937551251055aaa9185627e86027c91fb41a594dc390391d5fb6"
-
-do_compile() {
-    :
-}
-
-do_install() {
-    install -d ${D}${base_libdir}/firmware
-    for f in *.xe*
-    do
-        install -m 755 $f ${D}${base_libdir}/firmware/$f.${BPN}
-    done
-}
-
-ALTERNATIVE_${PN} = "dra7-dsp1-fw.xe66 dra7-dsp2-fw.xe66 dra7-ipu1-fw.xem4 dra7-ipu2-fw.xem4 ducati-m3-core0.xem3 tesla-dsp.xe64T"
-ALTERNATIVE_LINK_NAME[dra7-dsp1-fw.xe66] = "${base_libdir}/firmware/dra7-dsp1-fw.xe66"
-ALTERNATIVE_TARGET[dra7-dsp1-fw.xe66] = "${base_libdir}/firmware/dra7-dsp1-fw.xe66.${BPN}"
-ALTERNATIVE_LINK_NAME[dra7-dsp2-fw.xe66] = "${base_libdir}/firmware/dra7-dsp2-fw.xe66"
-ALTERNATIVE_TARGET[dra7-dsp2-fw.xe66] = "${base_libdir}/firmware/dra7-dsp2-fw.xe66.${BPN}"
-ALTERNATIVE_LINK_NAME[dra7-ipu1-fw.xem4] = "${base_libdir}/firmware/dra7-ipu1-fw.xem4"
-ALTERNATIVE_TARGET[dra7-ipu1-fw.xem4] = "${base_libdir}/firmware/dra7-ipu1-fw.xem4.${BPN}"
-ALTERNATIVE_LINK_NAME[dra7-ipu2-fw.xem4] = "${base_libdir}/firmware/dra7-ipu2-fw.xem4"
-ALTERNATIVE_TARGET[dra7-ipu2-fw.xem4] = "${base_libdir}/firmware/dra7-ipu2-fw.xem4.${BPN}"
-ALTERNATIVE_LINK_NAME[ducati-m3-core0.xem3] = "${base_libdir}/firmware/ducati-m3-core0.xem3"
-ALTERNATIVE_TARGET[ducati-m3-core0.xem3] = "${base_libdir}/firmware/ducati-m3-core0.xem3.${BPN}"
-ALTERNATIVE_LINK_NAME[tesla-dsp.xe64T] = "${base_libdir}/firmware/tesla-dsp.xe64T"
-ALTERNATIVE_TARGET[tesla-dsp.xe64T] = "${base_libdir}/firmware/tesla-dsp.xe64T.${BPN}"
-ALTERNATIVE_PRIORITY = "20"
-
-FILES_${PN} += "${base_libdir}/firmware"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
index 34d3b59..2aa3885 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Extended task to get System Test specific apps"
 LICENSE = "MIT"
-PR = "r39"
+PR = "r40"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -49,7 +49,6 @@ ARAGO_TI_TEST_append_ti43x = " \
 
 ARAGO_TI_TEST_append_omap-a15 = " \
     omapconf \
-    ipc-test-fw \
     ${@base_contains('MACHINE_FEATURES', 'mmip', 'omapdrmtest', '', d)} \
     "
 
-- 
2.2.0


