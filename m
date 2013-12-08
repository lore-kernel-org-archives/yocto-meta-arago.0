Return-Path: <yanivma@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 7080C5298A
	for <meta-arago@arago-project.org>;
	Sun,  8 Dec 2013 08:20:25 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id rB88KOBA025170
	for <meta-arago@arago-project.org>; Sun, 8 Dec 2013 02:20:24 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rB88KOY0011448
	for <meta-arago@arago-project.org>; Sun, 8 Dec 2013 02:20:24 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Sun, 8 Dec 2013 02:20:23 -0600
Received: from mcp8x-srv.emea.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	rB88KJt4009163;	Sun, 8 Dec 2013 02:20:23 -0600
From: Yaniv Mahani <yanivma@ti.com>
To: <meta-arago@arago-project.org>
Date: Sun, 8 Dec 2013 10:18:13 +0200
Message-ID: <1386490696-16318-5-git-send-email-yanivma@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1386490696-16318-1-git-send-email-yanivma@ti.com>
References: <1386490696-16318-1-git-send-email-yanivma@ti.com>
MIME-Version: 1.0
Subject: [PATCH 5/8] wl18xx-firmware: update recipe to ol_r8.a8.08 version.
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
X-List-Received-Date: Sun, 08 Dec 2013 08:20:25 -0000
Content-Type: text/plain

From: Yaniv Machani <yanivma@ti.com>

Signed-off-by: Yaniv Machani <yanivma@ti.com>
---
 ...are_r8.a6.01.bb => wl18xx-firmware_r8.a8.08.bb} |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-arago-extras/recipes-bsp/wl18xx-firmware/{wl18xx-firmware_r8.a6.01.bb => wl18xx-firmware_r8.a8.08.bb} (76%)

diff --git a/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a6.01.bb b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a8.08.bb
similarity index 76%
rename from meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a6.01.bb
rename to meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a8.08.bb
index 4b3f22a..759bf47 100644
--- a/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a6.01.bb
+++ b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a8.08.bb
@@ -1,18 +1,18 @@
 DESCRIPTION = "Firmware files for use with TI wl18xx"
 LICENSE = "TI-TSPA"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=b28122fd6678e89fd3a8d4bc80922969"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=4977a0fe767ee17765ae63c435a32a9e"
 
 PACKAGE_ARCH = "all"
 
-PR = "r2+gitr${SRCPV}"
+PR = "r0+gitr${SRCPV}"
 
 PROVIDES += "wl12xx-firmware"
 RPROVIDES_${PN} += "wl12xx-firmware"
 RREPLACES_${PN} += "wl12xx-firmware"
 RCONFLICTS_${PN} += "wl12xx-firmware"
 
-# Tag: ol_r8.a6.01
-SRCREV = "1c0f45f0e8aec0823175f7ac977908888c424aa1"
+# Tag: ol_r8.a8.08
+SRCREV = "8e7f455e726f2bf92c568286a5cca510d7718dc1"
 SRC_URI = "git://github.com/TI-OpenLink/wl18xx_fw.git;protocol=git \
            file://Makefile \
           "
-- 
1.7.9


