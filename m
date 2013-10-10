Return-Path: <localcontrol@dntsab06real.emea.dhcp.ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id B09AC529A8
	for <meta-arago@arago-project.org>;
	Thu, 10 Oct 2013 15:03:43 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9AF3hdj001919
	for <meta-arago@arago-project.org>; Thu, 10 Oct 2013 10:03:43 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9AF3hmc008856
	for <meta-arago@arago-project.org>; Thu, 10 Oct 2013 10:03:43 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 10 Oct 2013 10:03:43 -0500
Received: from dntsab06real.emea.dhcp.ti.com (dntsab06real.emea.dhcp.ti.com
	[137.167.84.131])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	r9AF3gNv021475	for <meta-arago@arago-project.org>;
	Thu, 10 Oct 2013 10:03:42 -0500
Received: from dntsab06real.emea.dhcp.ti.com (localhost [127.0.0.1])	by
	dntsab06real.emea.dhcp.ti.com (8.14.4/8.14.4/Debian-2ubuntu2) with
	ESMTP id r9AG2PZs016873	for <meta-arago@arago-project.org>;
	Thu, 10 Oct 2013 17:02:25 +0100
Received: (from localcontrol@localhost)	by dntsab06real.emea.dhcp.ti.com
	(8.14.4/8.14.4/Submit) id r9AG2PFJ016872	for
	meta-arago@arago-project.org; Thu, 10 Oct 2013 17:02:25 +0100
From: Roger Monk <r-monk@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 10 Oct 2013 17:02:13 +0100
Message-ID: <1381420942-16810-3-git-send-email-r-monk@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1381420942-16810-1-git-send-email-r-monk@ti.com>
References: <1381420942-16810-1-git-send-email-r-monk@ti.com>
MIME-Version: 1.0
Subject: [PATCHv2 02/11] ti-connectivity/wl18xx-firmware: Add Wilink8 r8.a7.02
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
X-List-Received-Date: Thu, 10 Oct 2013 15:03:44 -0000
Content-Type: text/plain

   * Add v r8.a7.02 engineering release wifi firmware
   * This release supports the omap-a15 devices (omap5-evm/dra7-evm) with ES 2.1 WL8
      * OMAP5432 UEVMs with the following SKU contain ES2.1 Wilink8 TDK 18xx module
         * OMAP5432x-xx-x1-xx

Signed-off-by: Roger Monk <r-monk@ti.com>
---
 ...are_r8.a6.01.bb => wl18xx-firmware_r8.a7.02.bb} |    8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 copy meta-arago-extras/recipes-bsp/wl18xx-firmware/{wl18xx-firmware_r8.a6.01.bb => wl18xx-firmware_r8.a7.02.bb} (82%)

diff --git a/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a6.01.bb b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a7.02.bb
similarity index 82%
copy from meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a6.01.bb
copy to meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a7.02.bb
index 4b3f22a..f41edd5 100644
--- a/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a6.01.bb
+++ b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a7.02.bb
@@ -4,15 +4,17 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=b28122fd6678e89fd3a8d4bc80922969"
 
 PACKAGE_ARCH = "all"
 
-PR = "r2+gitr${SRCPV}"
+PR = "r1+gitr${SRCPV}"
 
 PROVIDES += "wl12xx-firmware"
 RPROVIDES_${PN} += "wl12xx-firmware"
 RREPLACES_${PN} += "wl12xx-firmware"
 RCONFLICTS_${PN} += "wl12xx-firmware"
 
-# Tag: ol_r8.a6.01
-SRCREV = "1c0f45f0e8aec0823175f7ac977908888c424aa1"
+COMPATIBLE_MACHINE = "(omap-a15)"
+
+# Tag: ol_r8.a7.02
+SRCREV = "f3fe754d585f9af821c244a606761c5f69278ed6"
 SRC_URI = "git://github.com/TI-OpenLink/wl18xx_fw.git;protocol=git \
            file://Makefile \
           "
-- 
1.7.9.5


