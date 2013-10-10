Return-Path: <localcontrol@dntsab06real.emea.dhcp.ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 1A79452A81
	for <meta-arago@arago-project.org>;
	Wed,  9 Oct 2013 23:59:04 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r99Nx3J8000694
	for <meta-arago@arago-project.org>; Wed, 9 Oct 2013 18:59:03 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r99Nx3Xl016464
	for <meta-arago@arago-project.org>; Wed, 9 Oct 2013 18:59:03 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 9 Oct 2013 18:59:03 -0500
Received: from dntsab06real.emea.dhcp.ti.com (dntsab06real.emea.dhcp.ti.com
	[137.167.84.131])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	r99Nx27A028359	for <meta-arago@arago-project.org>;
	Wed, 9 Oct 2013 18:59:02 -0500
Received: from dntsab06real.emea.dhcp.ti.com (localhost [127.0.0.1])	by
	dntsab06real.emea.dhcp.ti.com (8.14.4/8.14.4/Debian-2ubuntu2) with
	ESMTP id r9A0vjPx013699	for <meta-arago@arago-project.org>;
	Thu, 10 Oct 2013 01:57:45 +0100
Received: (from localcontrol@localhost)	by dntsab06real.emea.dhcp.ti.com
	(8.14.4/8.14.4/Submit) id r9A0vjXM013698	for
	meta-arago@arago-project.org; Thu, 10 Oct 2013 01:57:45 +0100
From: Roger Monk <r-monk@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 10 Oct 2013 01:57:36 +0100
Message-ID: <1381366658-13630-10-git-send-email-r-monk@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1381366658-13630-1-git-send-email-r-monk@ti.com>
References: <1381366658-13630-1-git-send-email-r-monk@ti.com>
MIME-Version: 1.0
Subject: [PATCH 09/11] ti-connectivity/ti-wifi-utils-wl18xx: Add Wilink8 r8.a7.02
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
X-List-Received-Date: Wed, 09 Oct 2013 23:59:04 -0000
Content-Type: text/plain

   * Add v r8.a7.02 engineering release wifi utilities for wilink8
   * This release supports the omap-a15 devices (omap5-evm/dra7-evm) with ES 2.1 WL8
   * OMAP5432 UEVMs with the following SKU contain ES2.1 Wilink8 TDK 18xx module
      * OMAP5432x-xx-x1-xx

Signed-off-by: Roger Monk <r-monk@ti.com>
---
 .../ti-wifi-utils/ti-wifi-utils-wl18xx_r8.a7.02.bb |   30 ++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-wl18xx_r8.a7.02.bb

diff --git a/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-wl18xx_r8.a7.02.bb b/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-wl18xx_r8.a7.02.bb
new file mode 100644
index 0000000..fab2ee1
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-wl18xx_r8.a7.02.bb
@@ -0,0 +1,30 @@
+DESCRIPTION = "The calibrator and other useful utilities for TI wireless solution based on wl12xx driver"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4725015cb0be7be389cf06deeae3683d"
+
+COMPATIBLE_MACHINE = "(omap-a15)"
+
+DEPENDS = "libnl"
+RDEPENDS_${PN} = "ti-compat-wireless-wl12xx wl12xx-firmware"
+
+PR ="r1+gitr${SRCPV}"
+
+# Tag: ol_r8.a7.02
+SRCREV = "badbb7ecb70971857e4863c792a40e91f4f0a985"
+SRC_URI = "git://github.com/TI-OpenLink/18xx-ti-utils.git \
+"
+
+PROVIDES += "ti-wifi-utils"
+RPROVIDES_${PN} += "ti-wifi-utils"
+RREPLACES_${PN} +=  "ti-wifi-utils"
+RCONFLICTS_${PN} +=  "ti-wifi-utils"
+
+S = "${WORKDIR}/git"
+
+export CROSS_COMPILE = "${TARGET_PREFIX}"
+CFLAGS += " -DCONFIG_LIBNL20"
+
+do_install() {
+    install -d ${D}${bindir}
+    install -m 0755 calibrator ${D}${bindir}/
+}
-- 
1.7.9.5


