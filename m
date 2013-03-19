Return-Path: <eyalr@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 2DE2A5203A
	for <meta-arago@arago-project.org>;
	Tue, 19 Mar 2013 15:45:53 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2JFjoMf030984
	for <meta-arago@arago-project.org>; Tue, 19 Mar 2013 10:45:51 -0500
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2JFjnaV010525
	for <meta-arago@arago-project.org>;
	Tue, 19 Mar 2013 21:15:50 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by dbde70.ent.ti.com
	(172.24.170.148) with Microsoft SMTP Server id 14.1.323.3;
	Tue, 19 Mar 2013 21:15:49 +0530
Received: from user-VirtualBox.emea.dhcp.ti.com (dbdp20.itg.ti.com
	[172.24.170.38])	by dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	r2JFjlfp025731;	Tue, 19 Mar 2013 21:15:48 +0530
From: Eyal Reizer <eyalr@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 19 Mar 2013 17:45:29 +0200
Message-ID: <1363707935-2749-2-git-send-email-eyalr@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCHv2 2/9] wl18xx-firmware: install Wilink8 wlan firmware files
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
X-List-Received-Date: Tue, 19 Mar 2013 15:45:53 -0000
Content-Type: text/plain

Add a recipe for installing the Wilink8 wlan firmware files into
the target file system.

This package replace the wilink6 package which is provided by the
wl12xx-firmware recipe. Selection between the two is done using a
"WILINK_VERSION" switch added to arago.conf

Signed-off-by: Eyal Reizer <eyalr@ti.com>
---
 .../wl18xx-firmware/wl18xx-firmware/Makefile       |    7 +++++
 .../wl18xx-firmware/wl18xx-firmware_r8.a6.01.bb    |   30 ++++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware/Makefile
 create mode 100644 meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a6.01.bb

diff --git a/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware/Makefile b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware/Makefile
new file mode 100644
index 0000000..0bb7ab8
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware/Makefile
@@ -0,0 +1,7 @@
+# Installs the the ti-connectiviy wlan firmware files into the root file system
+
+install:
+	install -d  $(DEST_DIR)/lib/firmware/ti-connectivity
+	cp -RpP * $(DEST_DIR)/lib/firmware/ti-connectivity/
+	rm -f $(DEST_DIR)/lib/firmware/ti-connectivity/Makefile
+
diff --git a/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a6.01.bb b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a6.01.bb
new file mode 100644
index 0000000..fd463cc
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a6.01.bb
@@ -0,0 +1,30 @@
+DESCRIPTION = "Firmware files for use with TI wl18xx"
+LICENSE = "TI-TSPA"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=b28122fd6678e89fd3a8d4bc80922969"
+
+PACKAGE_ARCH = "all"
+
+PR = "r1+gitr${SRCREV}"
+
+PROVIDES += "wl12xx-firmware"
+RPROVIDES += "wl12xx-firmware" 
+RREPLACES += "wl12xx-firmware"
+RCONFLICTS += "wl12xx-firmware"
+
+SRCREV = "ol_r8.a6.01"
+SRC_URI = "git://github.com/TI-OpenLink/wl18xx_fw.git;protocol=git \
+           file://Makefile \
+          "
+
+S = "${WORKDIR}/git"
+
+do_compile() {
+    :
+}
+
+do_install() {
+    cp ${WORKDIR}/Makefile ${S}
+    oe_runmake 'DEST_DIR=${D}' install
+}
+
+FILES_${PN} = "/lib/firmware/ti-connectivity/*"
-- 
1.7.9.5


