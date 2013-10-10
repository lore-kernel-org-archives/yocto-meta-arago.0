Return-Path: <localcontrol@dntsab06real.emea.dhcp.ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id A5EDA52A92
	for <meta-arago@arago-project.org>;
	Wed,  9 Oct 2013 23:59:00 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r99NwxBs012005
	for <meta-arago@arago-project.org>; Wed, 9 Oct 2013 18:58:59 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r99NwxC5016254
	for <meta-arago@arago-project.org>; Wed, 9 Oct 2013 18:58:59 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 9 Oct 2013 18:58:59 -0500
Received: from dntsab06real.emea.dhcp.ti.com (dntsab06real.emea.dhcp.ti.com
	[137.167.84.131])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	r99Nwxkw028285	for <meta-arago@arago-project.org>;
	Wed, 9 Oct 2013 18:58:59 -0500
Received: from dntsab06real.emea.dhcp.ti.com (localhost [127.0.0.1])	by
	dntsab06real.emea.dhcp.ti.com (8.14.4/8.14.4/Debian-2ubuntu2) with
	ESMTP id r9A0vgJt013675	for <meta-arago@arago-project.org>;
	Thu, 10 Oct 2013 01:57:42 +0100
Received: (from localcontrol@localhost)	by dntsab06real.emea.dhcp.ti.com
	(8.14.4/8.14.4/Submit) id r9A0vgxR013674	for
	meta-arago@arago-project.org; Thu, 10 Oct 2013 01:57:42 +0100
From: Roger Monk <r-monk@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 10 Oct 2013 01:57:30 +0100
Message-ID: <1381366658-13630-4-git-send-email-r-monk@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1381366658-13630-1-git-send-email-r-monk@ti.com>
References: <1381366658-13630-1-git-send-email-r-monk@ti.com>
MIME-Version: 1.0
Subject: [PATCH 03/11] ti-connectivity/wl18xx-firmware: Apply Workaround PD Recovery Fix
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
X-List-Received-Date: Wed, 09 Oct 2013 23:59:01 -0000
Content-Type: text/plain

   * Update to custom firmware version (ol_r8.a7.02_pd_fix) to fix
     power-down recovery seen on some boards/ap configurations

Signed-off-by: Roger Monk <r-monk@ti.com>
---
 .../wl18xx-firmware/wl18xx-firmware_r8.a7.02.bb    |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a7.02.bb b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a7.02.bb
index f41edd5..0f8dd9d 100644
--- a/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a7.02.bb
+++ b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a7.02.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=b28122fd6678e89fd3a8d4bc80922969"
 
 PACKAGE_ARCH = "all"
 
-PR = "r1+gitr${SRCPV}"
+PR = "r2+gitr${SRCPV}"
 
 PROVIDES += "wl12xx-firmware"
 RPROVIDES_${PN} += "wl12xx-firmware"
@@ -13,8 +13,8 @@ RCONFLICTS_${PN} += "wl12xx-firmware"
 
 COMPATIBLE_MACHINE = "(omap-a15)"
 
-# Tag: ol_r8.a7.02
-SRCREV = "f3fe754d585f9af821c244a606761c5f69278ed6"
+# Tag: ol_r8.a7.02_pd_fix (workaround powerdown recovery fix)
+SRCREV = "3fb3bd321f89f9910f25d3006668b831df944a7f"
 SRC_URI = "git://github.com/TI-OpenLink/wl18xx_fw.git;protocol=git \
            file://Makefile \
           "
-- 
1.7.9.5


