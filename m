Return-Path: <localcontrol@dntsab06real.emea.dhcp.ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 1199052A81
	for <meta-arago@arago-project.org>;
	Wed,  9 Oct 2013 23:59:00 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r99NwxcI000678
	for <meta-arago@arago-project.org>; Wed, 9 Oct 2013 18:58:59 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r99NwxaP016245
	for <meta-arago@arago-project.org>; Wed, 9 Oct 2013 18:58:59 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 9 Oct 2013 18:58:59 -0500
Received: from dntsab06real.emea.dhcp.ti.com (dntsab06real.emea.dhcp.ti.com
	[137.167.84.131])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	r99Nwwp8001388	for <meta-arago@arago-project.org>;
	Wed, 9 Oct 2013 18:58:58 -0500
Received: from dntsab06real.emea.dhcp.ti.com (localhost [127.0.0.1])	by
	dntsab06real.emea.dhcp.ti.com (8.14.4/8.14.4/Debian-2ubuntu2) with
	ESMTP id r9A0vfHu013671	for <meta-arago@arago-project.org>;
	Thu, 10 Oct 2013 01:57:41 +0100
Received: (from localcontrol@localhost)	by dntsab06real.emea.dhcp.ti.com
	(8.14.4/8.14.4/Submit) id r9A0vfkP013670	for
	meta-arago@arago-project.org; Thu, 10 Oct 2013 01:57:41 +0100
From: Roger Monk <r-monk@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 10 Oct 2013 01:57:29 +0100
Message-ID: <1381366658-13630-3-git-send-email-r-monk@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1381366658-13630-1-git-send-email-r-monk@ti.com>
References: <1381366658-13630-1-git-send-email-r-monk@ti.com>
MIME-Version: 1.0
Subject: [PATCH 02/11] ti-connectivity/wl18xx-firmware: Add Wilink8 r8.a7.02
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
X-List-Received-Date: Wed, 09 Oct 2013 23:59:00 -0000
Content-Type: text/plain

   * Add v r8.a7.02 engineering release wifi firmware
   * This release supports the omap-a15 devices (omap5-evm/dra7-evm) with ES 2.1 WL8
      * OMAP5432 UEVMs with the following SKU contain ES2.1 Wilink8 TDK 18xx module
         * OMAP5432x-xx-x1-xx

Signed-off-by: Roger Monk <r-monk@ti.com>
---
 .../wl18xx-firmware/wl18xx-firmware_r8.a7.02.bb    |   33 ++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a7.02.bb

diff --git a/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a7.02.bb b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a7.02.bb
new file mode 100644
index 0000000..f41edd5
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a7.02.bb
@@ -0,0 +1,33 @@
+DESCRIPTION = "Firmware files for use with TI wl18xx"
+LICENSE = "TI-TSPA"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=b28122fd6678e89fd3a8d4bc80922969"
+
+PACKAGE_ARCH = "all"
+
+PR = "r1+gitr${SRCPV}"
+
+PROVIDES += "wl12xx-firmware"
+RPROVIDES_${PN} += "wl12xx-firmware"
+RREPLACES_${PN} += "wl12xx-firmware"
+RCONFLICTS_${PN} += "wl12xx-firmware"
+
+COMPATIBLE_MACHINE = "(omap-a15)"
+
+# Tag: ol_r8.a7.02
+SRCREV = "f3fe754d585f9af821c244a606761c5f69278ed6"
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


