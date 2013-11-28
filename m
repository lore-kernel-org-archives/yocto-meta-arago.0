Return-Path: <yanivma@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id B34335296F
	for <meta-arago@arago-project.org>;
	Thu, 28 Nov 2013 11:39:15 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id rASBdFju003828
	for <meta-arago@arago-project.org>; Thu, 28 Nov 2013 05:39:15 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id rASBdFJ7008577
	for <meta-arago@arago-project.org>; Thu, 28 Nov 2013 05:39:15 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 28 Nov 2013 05:39:14 -0600
Received: from mcp8x-srv.emea.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	rASBdDX6011047;	Thu, 28 Nov 2013 05:39:14 -0600
From: Yaniv Mahani <yanivma@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 28 Nov 2013 13:37:23 +0200
Message-ID: <1385638643-11878-1-git-send-email-yanivma@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 07/14] ti-wifi-utils-wl18xx: Update recipe to ol_r8.a8.08 version.
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
X-List-Received-Date: Thu, 28 Nov 2013 11:39:15 -0000
Content-Type: text/plain

From: Yaniv Machani <yanivma@ti.com>

- Updated firmware name.
- Added required makefile parameter to support libnl3 compilation.

Signed-off-by: Yaniv Machani <yanivma@ti.com>
---
 ...8.a6.01.bb => ti-wifi-utils-wl18xx_r8.a8.08.bb} |   13 ++++++++-----
 .../ti-wifi-utils/ti-wifi-utils.inc                |    6 +++---
 2 files changed, 11 insertions(+), 8 deletions(-)
 copy meta-arago-extras/recipes-devtools/ti-wifi-utils/{ti-wifi-utils-wl18xx_r8.a6.01.bb => ti-wifi-utils-wl18xx_r8.a8.08.bb} (68%)

diff --git a/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-wl18xx_r8.a6.01.bb b/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-wl18xx_r8.a8.08.bb
similarity index 68%
copy from meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-wl18xx_r8.a6.01.bb
copy to meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-wl18xx_r8.a8.08.bb
index eab94fa..601b203 100644
--- a/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-wl18xx_r8.a6.01.bb
+++ b/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-wl18xx_r8.a8.08.bb
@@ -3,12 +3,12 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4725015cb0be7be389cf06deeae3683d"
 
 DEPENDS = "libnl"
-RDEPENDS_${PN} = "ti-compat-wireless-wl12xx wl12xx-firmware"
+RDEPENDS_${PN} = "wl18xx-firmware"
 
-PR ="r3+gitr${SRCPV}"
+PR ="r0+gitr${SRCPV}"
 
-# Tag: ol_r8.a6.01
-SRCREV = "214dfbdf97cc390b0020c4ea9331a1cf82240a64"
+#Tag: ol_r8.a8.08
+SRCREV = "9627cb09b9de32b8ffcc32d3ce3e275b7c56d8e4"
 SRC_URI = "git://github.com/TI-OpenLink/18xx-ti-utils.git \
 "
 
@@ -20,7 +20,10 @@ RCONFLICTS_${PN} +=  "ti-wifi-utils"
 S = "${WORKDIR}/git"
 
 export CROSS_COMPILE = "${TARGET_PREFIX}"
-CFLAGS += " -DCONFIG_LIBNL20"
+
+EXTRA_OEMAKE = 'CFLAGS="${CFLAGS} -I${STAGING_INCDIR}/libnl3/ -DCONFIG_LIBNL32 " \
+		LDFLAGS="${LDFLAGS} -L${STAGING_LIBDIR}" \
+		NLVER=3'
 
 do_install() {
     install -d ${D}${bindir}
diff --git a/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils.inc b/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils.inc
index cdb3746..1f3ddba 100644
--- a/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils.inc
+++ b/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils.inc
@@ -2,16 +2,16 @@ DESCRIPTION = "The calibrator and other useful utilities for TI wireless solutio
 LICENSE = "BSD"
 
 DEPENDS = "libnl"
-RDEPENDS_${PN} = "ti-compat-wireless-wl12xx wl12xx-firmware"
+RDEPENDS_${PN} = "wl18xx-firmware"
 
-PR ="r1"
+PR ="r2"
 
 SRC_URI = "git://github.com/TI-OpenLink/ti-utils.git;protocol=git"
 
 S = "${WORKDIR}/git"
 
 export CROSS_COMPILE = "${TARGET_PREFIX}"
-CFLAGS += " -DCONFIG_LIBNL20"
+CFLAGS+="-DCONFIG_LIBNL32"
 
 do_install() {
 	install -d ${D}${bindir}
-- 
1.7.9


