Return-Path: <yanivma@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id A225D5296F
	for <meta-arago@arago-project.org>;
	Thu, 28 Nov 2013 11:39:58 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id rASBdwdL007899
	for <meta-arago@arago-project.org>; Thu, 28 Nov 2013 05:39:58 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rASBdwbT017385
	for <meta-arago@arago-project.org>; Thu, 28 Nov 2013 05:39:58 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 28 Nov 2013 05:39:57 -0600
Received: from mcp8x-srv.emea.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	rASBdu9k031492;	Thu, 28 Nov 2013 05:39:57 -0600
From: Yaniv Mahani <yanivma@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 28 Nov 2013 13:38:07 +0200
Message-ID: <1385638687-12009-1-git-send-email-yanivma@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 10/14] wl18xx-firmware: Removed ol_r8.a6.01 recipe.
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
X-List-Received-Date: Thu, 28 Nov 2013 11:39:58 -0000
Content-Type: text/plain

From: Yaniv Machani <yanivma@ti.com>

Signed-off-by: Yaniv Machani <yanivma@ti.com>
---
 .../wl18xx-firmware/wl18xx-firmware_r8.a6.01.bb    |   31 --------------------
 1 files changed, 0 insertions(+), 31 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a6.01.bb

diff --git a/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a6.01.bb b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a6.01.bb
deleted file mode 100644
index 4b3f22a..0000000
--- a/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a6.01.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-DESCRIPTION = "Firmware files for use with TI wl18xx"
-LICENSE = "TI-TSPA"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=b28122fd6678e89fd3a8d4bc80922969"
-
-PACKAGE_ARCH = "all"
-
-PR = "r2+gitr${SRCPV}"
-
-PROVIDES += "wl12xx-firmware"
-RPROVIDES_${PN} += "wl12xx-firmware"
-RREPLACES_${PN} += "wl12xx-firmware"
-RCONFLICTS_${PN} += "wl12xx-firmware"
-
-# Tag: ol_r8.a6.01
-SRCREV = "1c0f45f0e8aec0823175f7ac977908888c424aa1"
-SRC_URI = "git://github.com/TI-OpenLink/wl18xx_fw.git;protocol=git \
-           file://Makefile \
-          "
-
-S = "${WORKDIR}/git"
-
-do_compile() {
-    :
-}
-
-do_install() {
-    cp ${WORKDIR}/Makefile ${S}
-    oe_runmake 'DEST_DIR=${D}' install
-}
-
-FILES_${PN} = "/lib/firmware/ti-connectivity/*"
-- 
1.7.9


