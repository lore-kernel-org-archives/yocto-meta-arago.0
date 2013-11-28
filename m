Return-Path: <yanivma@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id BE0D35296F
	for <meta-arago@arago-project.org>;
	Thu, 28 Nov 2013 11:39:31 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id rASBdVB9023669
	for <meta-arago@arago-project.org>; Thu, 28 Nov 2013 05:39:31 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id rASBdV6w008700
	for <meta-arago@arago-project.org>; Thu, 28 Nov 2013 05:39:31 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 28 Nov 2013 05:39:30 -0600
Received: from mcp8x-srv.emea.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	rASBdTI4031327;	Thu, 28 Nov 2013 05:39:30 -0600
From: Yaniv Mahani <yanivma@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 28 Nov 2013 13:37:40 +0200
Message-ID: <1385638660-11922-1-git-send-email-yanivma@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 08/14] ti-wifi-utils-wl18xx: Removed ol_r8.a6.01 recipe.
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
X-List-Received-Date: Thu, 28 Nov 2013 11:39:31 -0000
Content-Type: text/plain

From: Yaniv Machani <yanivma@ti.com>

- Clean up unsupported version

Signed-off-by: Yaniv Machani <yanivma@ti.com>
---
 .../ti-wifi-utils/ti-wifi-utils-wl18xx_r8.a6.01.bb |   28 --------------------
 1 files changed, 0 insertions(+), 28 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-wl18xx_r8.a6.01.bb

diff --git a/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-wl18xx_r8.a6.01.bb b/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-wl18xx_r8.a6.01.bb
deleted file mode 100644
index eab94fa..0000000
--- a/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-wl18xx_r8.a6.01.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-DESCRIPTION = "The calibrator and other useful utilities for TI wireless solution based on wl12xx driver"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=4725015cb0be7be389cf06deeae3683d"
-
-DEPENDS = "libnl"
-RDEPENDS_${PN} = "ti-compat-wireless-wl12xx wl12xx-firmware"
-
-PR ="r3+gitr${SRCPV}"
-
-# Tag: ol_r8.a6.01
-SRCREV = "214dfbdf97cc390b0020c4ea9331a1cf82240a64"
-SRC_URI = "git://github.com/TI-OpenLink/18xx-ti-utils.git \
-"
-
-PROVIDES += "ti-wifi-utils"
-RPROVIDES_${PN} += "ti-wifi-utils"
-RREPLACES_${PN} +=  "ti-wifi-utils"
-RCONFLICTS_${PN} +=  "ti-wifi-utils"
-
-S = "${WORKDIR}/git"
-
-export CROSS_COMPILE = "${TARGET_PREFIX}"
-CFLAGS += " -DCONFIG_LIBNL20"
-
-do_install() {
-    install -d ${D}${bindir}
-    install -m 0755 calibrator ${D}${bindir}/
-}
-- 
1.7.9


