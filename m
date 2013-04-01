Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id BD80052A39
	for <meta-arago@arago-project.org>;
	Mon,  1 Apr 2013 14:55:06 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r31Et37k028584
	for <meta-arago@arago-project.org>; Mon, 1 Apr 2013 09:55:04 -0500
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r31Et2c2011594
	for <meta-arago@arago-project.org>; Mon, 1 Apr 2013 20:25:03 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by dbde70.ent.ti.com
	(172.24.170.148) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 1 Apr 2013 20:25:02 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r31EsxCa020052;
	Mon, 1 Apr 2013 20:25:01 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 1 Apr 2013 09:54:39 -0500
Message-ID: <1364828095-28755-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 01/17 v2] wl12xx-firmware: Pull back in old r5.00.18 recipe.
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
X-List-Received-Date: Mon, 01 Apr 2013 14:55:07 -0000
Content-Type: text/plain

* Current am180x-evm ships with a PG 2 wilink 6 module that isn't supported in
  newer wilink 6 releases.
* A newer PG 3 wilink 6 module is available for am180x-evm but needs to be
  purchased separately..
* Bring old r5.00.18 wl12x-firmware recipe with updated recipe name to add
  support for am180x-evm default wilink 6 module.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
Version 2 changes:
None. Apart of new patchset.

 .../wl12xx-firmware/wl12xx-firmware_r5.00.18.bb    |   28 ++++++++++++++++++++
 1 files changed, 28 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-extras/recipes-bsp/wl12xx-firmware/wl12xx-firmware_r5.00.18.bb

diff --git a/meta-arago-extras/recipes-bsp/wl12xx-firmware/wl12xx-firmware_r5.00.18.bb b/meta-arago-extras/recipes-bsp/wl12xx-firmware/wl12xx-firmware_r5.00.18.bb
new file mode 100644
index 0000000..12df963
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/wl12xx-firmware/wl12xx-firmware_r5.00.18.bb
@@ -0,0 +1,28 @@
+DESCRIPTION = "Firmware files for use with TI wl12xx"
+LICENSE = "TI-TSPA"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=ba590e1d103f891d0151609046aef9e8"
+
+PACKAGE_ARCH = "all"
+
+PR = "r0+gitr${SRCREV}"
+
+# This recipe provides the latest firmware files for wl12xx.
+# Therefore, use the contents of this recipe instead of the contents
+# of linux-firmware-wl12xx.
+RCONFLICTS_${PN} = "linux-firmware-wl12xx"
+RPROVIDES_${PN}  = "linux-firmware-wl12xx"
+
+SRCREV = "38e0dd7999b9087e00d1a59306a7c22fd23246cf"
+SRC_URI = "git://github.com/TI-ECS/ti-utils.git;protocol=git"
+
+S = "${WORKDIR}/git/hw/firmware"
+
+do_compile() {
+    :
+}
+
+do_install() {
+    oe_runmake 'DEST_DIR=${D}' install
+}
+
+FILES_${PN} = "/lib/firmware/ti-connectivity/*"
-- 
1.7.0.4


