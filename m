Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTP id ED48E529BC
	for <meta-arago@arago-project.org>;
	Thu, 30 Jan 2014 02:34:11 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N070007E0G2M9C0@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 29 Jan 2014 20:33:53 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id A1FE6200DB; Wed,
	29 Jan 2014 21:33:37 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 29 Jan 2014 21:33:34 -0500
Message-id: <1391049214-14245-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] ipc-test-fw: add FW images version 3.21.00.02 for IPC tests
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
X-List-Received-Date: Thu, 30 Jan 2014 02:34:12 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../ipc-test-fw/ipc-test-fw_3.21.00.02.bb          | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 meta-arago-distro/recipes-bsp/ipc-test-fw/ipc-test-fw_3.21.00.02.bb

diff --git a/meta-arago-distro/recipes-bsp/ipc-test-fw/ipc-test-fw_3.21.00.02.bb b/meta-arago-distro/recipes-bsp/ipc-test-fw/ipc-test-fw_3.21.00.02.bb
new file mode 100644
index 0000000..41ab2fb
--- /dev/null
+++ b/meta-arago-distro/recipes-bsp/ipc-test-fw/ipc-test-fw_3.21.00.02.bb
@@ -0,0 +1,33 @@
+DESCRIPTION = "Firmware images to test IPC"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/BSD;md5=3775480a712fc46a69647678acb234cb"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+PR = "eng-4-gb9283b0"
+
+COMPATIBLE_MACHINE = "omap5-evm|dra7xx-evm"
+
+INHIBIT_PACKAGE_STRIP = "1"
+INSANE_SKIP_${PN} = "arch"
+
+S = "${WORKDIR}/${PV}_${PR}"
+
+SRC_URI = "http://arago-project.org/files/releases/ipc-test-fw/${PV}_${PR}.tar.gz"
+
+SRC_URI[md5sum] = "4fcba6844949ea909131684a80233800"
+SRC_URI[sha256sum] = "3b90b195c382937551251055aaa9185627e86027c91fb41a594dc390391d5fb6"
+
+FW_FILES_omap5-evm = "tesla-dsp.xe64T ducati-m3-core0.xem3"
+FW_FILES_dra7xx-evm = "dra7-dsp1-fw.xe66 dra7-dsp2-fw.xe66 dra7-ipu1-fw.xem4 dra7-ipu2-fw.xem4"
+
+do_compile() {
+    :
+}
+
+do_install() {
+    install -d ${D}${base_libdir}/firmware
+    install -m 755 ${FW_FILES} ${D}${base_libdir}/firmware/
+}
+
+FILES_${PN} += "${base_libdir}/firmware"
-- 
1.8.3.2


