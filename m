Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 4D917529A6
	for <meta-arago@arago-project.org>;
	Mon, 19 May 2014 19:20:36 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4JJKZf9031764
	for <meta-arago@arago-project.org>; Mon, 19 May 2014 14:20:35 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4JJKZJY017266
	for <meta-arago@arago-project.org>; Mon, 19 May 2014 14:20:35 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 19 May 2014 14:20:34 -0500
Received: from sdit-build04.dal.design.ti.com (dbdp20.itg.ti.com
	[172.24.170.38])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s4JJK8C3001355;	Mon, 19 May 2014 14:20:33 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 19 May 2014 14:19:56 -0500
Message-ID: <1400527207-17021-9-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1400527207-17021-1-git-send-email-Chase.Maupin@ti.com>
References: <1400527207-17021-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 08/19] ipc-test-fw: Update to not conflict with ipumm-fw
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
X-List-Received-Date: Mon, 19 May 2014 19:20:36 -0000
Content-Type: text/plain

* This test package installs a firmware only used during IPC
  testing.  This firmware will conflict with the firmware file
  installed by the ipumm-fw recipe.  So the firmware needs to
  be installed with a .test extension to avoid the conflict.
* The test case will be modified to link the proper firmware to
  the proper name at test time.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../ipc-test-fw/ipc-test-fw_3.21.00.02.bb          |   14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/recipes-bsp/ipc-test-fw/ipc-test-fw_3.21.00.02.bb b/meta-arago-distro/recipes-bsp/ipc-test-fw/ipc-test-fw_3.21.00.02.bb
index 41ab2fb..e855e8b 100644
--- a/meta-arago-distro/recipes-bsp/ipc-test-fw/ipc-test-fw_3.21.00.02.bb
+++ b/meta-arago-distro/recipes-bsp/ipc-test-fw/ipc-test-fw_3.21.00.02.bb
@@ -4,16 +4,17 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/BSD;md5=377548
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-PR = "eng-4-gb9283b0"
+FWVER = "eng-4-gb9283b0"
+PR = "r0+${FWVER}"
 
 COMPATIBLE_MACHINE = "omap5-evm|dra7xx-evm"
 
 INHIBIT_PACKAGE_STRIP = "1"
 INSANE_SKIP_${PN} = "arch"
 
-S = "${WORKDIR}/${PV}_${PR}"
+S = "${WORKDIR}/${PV}_${FWVER}"
 
-SRC_URI = "http://arago-project.org/files/releases/ipc-test-fw/${PV}_${PR}.tar.gz"
+SRC_URI = "http://arago-project.org/files/releases/ipc-test-fw/${PV}_${FWVER}.tar.gz"
 
 SRC_URI[md5sum] = "4fcba6844949ea909131684a80233800"
 SRC_URI[sha256sum] = "3b90b195c382937551251055aaa9185627e86027c91fb41a594dc390391d5fb6"
@@ -25,9 +26,14 @@ do_compile() {
     :
 }
 
+# Add a .test extension to the firmware files so that they do not conflict
+# with the real firmware images
 do_install() {
     install -d ${D}${base_libdir}/firmware
-    install -m 755 ${FW_FILES} ${D}${base_libdir}/firmware/
+    for f in ${FW_FILES}
+    do
+        install -m 755 ${f} ${D}${base_libdir}/firmware/${f}.test
+    done
 }
 
 FILES_${PN} += "${base_libdir}/firmware"
-- 
1.7.9.5


