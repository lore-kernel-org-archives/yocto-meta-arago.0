Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTPS id 4949052A65
	for <meta-arago@arago-project.org>;
	Mon, 23 Nov 2015 04:22:24 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NY9006S72SEGDA0@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Sun, 22 Nov 2015 22:22:06 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=btqxfxui c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=qtqOOiqGOCEA:10 a=sozttTNsAAAA:8
	a=HihYlcsHAAAA:8	a=BH1Y_ll7440cQqTkN9QA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id A7676161D26;	Sun,
	22 Nov 2015 23:21:50 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Sun, 22 Nov 2015 23:21:50 -0500
Message-id: <1448252510-30231-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] ipc-test-fw: package all files per systest request
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
X-List-Received-Date: Mon, 23 Nov 2015 04:22:30 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-bsp/ipc-test-fw/ipc-test-fw_3.21.00.02.bb              | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta-arago-distro/recipes-bsp/ipc-test-fw/ipc-test-fw_3.21.00.02.bb b/meta-arago-distro/recipes-bsp/ipc-test-fw/ipc-test-fw_3.21.00.02.bb
index 232301f..55a6768 100644
--- a/meta-arago-distro/recipes-bsp/ipc-test-fw/ipc-test-fw_3.21.00.02.bb
+++ b/meta-arago-distro/recipes-bsp/ipc-test-fw/ipc-test-fw_3.21.00.02.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/BSD;md5=377548
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 FWVER = "eng-4-gb9283b0"
-PR = "r0+${FWVER}"
+PR = "r1+${FWVER}"
 
 COMPATIBLE_MACHINE = "omap5-evm|dra7xx"
 
@@ -19,9 +19,6 @@ SRC_URI = "http://arago-project.org/files/releases/ipc-test-fw/${PV}_${FWVER}.ta
 SRC_URI[md5sum] = "4fcba6844949ea909131684a80233800"
 SRC_URI[sha256sum] = "3b90b195c382937551251055aaa9185627e86027c91fb41a594dc390391d5fb6"
 
-FW_FILES_omap5-evm = "tesla-dsp.xe64T ducati-m3-core0.xem3"
-FW_FILES_dra7xx = "dra7-dsp1-fw.xe66 dra7-dsp2-fw.xe66 dra7-ipu1-fw.xem4 dra7-ipu2-fw.xem4"
-
 do_compile() {
     :
 }
@@ -30,7 +27,7 @@ do_compile() {
 # with the real firmware images
 do_install() {
     install -d ${D}${base_libdir}/firmware
-    for f in ${FW_FILES}
+    for f in *.xe*
     do
         install -m 755 ${f} ${D}${base_libdir}/firmware/${f}.test
     done
-- 
2.2.0


