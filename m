Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTPS id DCE3052A34
	for <meta-arago@arago-project.org>;
	Sat,  5 Dec 2015 02:25:21 +0000 (UTC)
Received: from gandalf.denix.org ([100.15.86.14]) by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPSA id <0NYV003A75DT3P10@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 04 Dec 2015 20:25:06 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WcjxEBVX c=1 sm=1 tr=0	a=xDJgBcBrK5EN9DJ6g74wNQ==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=wUQvQvOEmiQA:10 a=sozttTNsAAAA:8
	a=U53058OFSLw7R0u1540A:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 5A626161D36;	Fri,
	4 Dec 2015 21:25:05 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 04 Dec 2015 21:25:03 -0500
Message-id: <1449282304-13964-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH 1/2] ipc-test-fw: add alternatives handling
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
X-List-Received-Date: Sat, 05 Dec 2015 02:25:22 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../ipc-test-fw/ipc-test-fw_3.21.00.02.bb          | 23 +++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/meta-arago-distro/recipes-bsp/ipc-test-fw/ipc-test-fw_3.21.00.02.bb b/meta-arago-distro/recipes-bsp/ipc-test-fw/ipc-test-fw_3.21.00.02.bb
index 55a6768..3093b53 100644
--- a/meta-arago-distro/recipes-bsp/ipc-test-fw/ipc-test-fw_3.21.00.02.bb
+++ b/meta-arago-distro/recipes-bsp/ipc-test-fw/ipc-test-fw_3.21.00.02.bb
@@ -2,10 +2,10 @@ DESCRIPTION = "Firmware images to test IPC"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/BSD;md5=3775480a712fc46a69647678acb234cb"
 
-PACKAGE_ARCH = "${MACHINE_ARCH}"
+inherit update-alternatives
 
 FWVER = "eng-4-gb9283b0"
-PR = "r1+${FWVER}"
+PR = "r2+${FWVER}"
 
 COMPATIBLE_MACHINE = "omap5-evm|dra7xx"
 
@@ -23,14 +23,27 @@ do_compile() {
     :
 }
 
-# Add a .test extension to the firmware files so that they do not conflict
-# with the real firmware images
 do_install() {
     install -d ${D}${base_libdir}/firmware
     for f in *.xe*
     do
-        install -m 755 ${f} ${D}${base_libdir}/firmware/${f}.test
+        install -m 755 $f ${D}${base_libdir}/firmware/$f.${BPN}
     done
 }
 
+ALTERNATIVE_${PN} = "dra7-dsp1-fw.xe66 dra7-dsp2-fw.xe66 dra7-ipu1-fw.xem4 dra7-ipu2-fw.xem4 ducati-m3-core0.xem3 tesla-dsp.xe64T"
+ALTERNATIVE_LINK_NAME[dra7-dsp1-fw.xe66] = "${base_libdir}/firmware/dra7-dsp1-fw.xe66"
+ALTERNATIVE_TARGET[dra7-dsp1-fw.xe66] = "${base_libdir}/firmware/dra7-dsp1-fw.xe66.${BPN}"
+ALTERNATIVE_LINK_NAME[dra7-dsp2-fw.xe66] = "${base_libdir}/firmware/dra7-dsp2-fw.xe66"
+ALTERNATIVE_TARGET[dra7-dsp2-fw.xe66] = "${base_libdir}/firmware/dra7-dsp2-fw.xe66.${BPN}"
+ALTERNATIVE_LINK_NAME[dra7-ipu1-fw.xem4] = "${base_libdir}/firmware/dra7-ipu1-fw.xem4"
+ALTERNATIVE_TARGET[dra7-ipu1-fw.xem4] = "${base_libdir}/firmware/dra7-ipu1-fw.xem4.${BPN}"
+ALTERNATIVE_LINK_NAME[dra7-ipu2-fw.xem4] = "${base_libdir}/firmware/dra7-ipu2-fw.xem4"
+ALTERNATIVE_TARGET[dra7-ipu2-fw.xem4] = "${base_libdir}/firmware/dra7-ipu2-fw.xem4.${BPN}"
+ALTERNATIVE_LINK_NAME[ducati-m3-core0.xem3] = "${base_libdir}/firmware/ducati-m3-core0.xem3"
+ALTERNATIVE_TARGET[ducati-m3-core0.xem3] = "${base_libdir}/firmware/ducati-m3-core0.xem3.${BPN}"
+ALTERNATIVE_LINK_NAME[tesla-dsp.xe64T] = "${base_libdir}/firmware/tesla-dsp.xe64T"
+ALTERNATIVE_TARGET[tesla-dsp.xe64T] = "${base_libdir}/firmware/tesla-dsp.xe64T.${BPN}"
+ALTERNATIVE_PRIORITY = "20"
+
 FILES_${PN} += "${base_libdir}/firmware"
-- 
2.2.0


