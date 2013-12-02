Return-Path: <yanivma@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 1A18B52972
	for <meta-arago@arago-project.org>;
	Mon,  2 Dec 2013 14:10:28 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id rB2EARlT006119
	for <meta-arago@arago-project.org>; Mon, 2 Dec 2013 08:10:27 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id rB2EARYf022169
	for <meta-arago@arago-project.org>; Mon, 2 Dec 2013 08:10:27 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 2 Dec 2013 08:10:27 -0600
Received: from mcp8x-srv.emea.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	rB2EAQsC028524;	Mon, 2 Dec 2013 08:10:27 -0600
From: Yaniv Mahani <yanivma@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 2 Dec 2013 16:08:32 +0200
Message-ID: <1385993312-3132-1-git-send-email-yanivma@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 09/14 v2] wl18xx-firmware: update recipe to ol_r8.a8.08 version.
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
X-List-Received-Date: Mon, 02 Dec 2013 14:10:29 -0000
Content-Type: text/plain

From: Yaniv Machani <yanivma@ti.com>

Signed-off-by: Yaniv Machani <yanivma@ti.com>
---
 ...are_r8.a6.01.bb => wl18xx-firmware_r8.a8.08.bb} |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 copy meta-arago-extras/recipes-bsp/wl18xx-firmware/{wl18xx-firmware_r8.a6.01.bb => wl18xx-firmware_r8.a8.08.bb} (86%)

diff --git a/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a6.01.bb b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a8.08.bb
similarity index 86%
copy from meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a6.01.bb
copy to meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a8.08.bb
index 4b3f22a..6f9c8cb 100644
--- a/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a6.01.bb
+++ b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a8.08.bb
@@ -4,15 +4,15 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=b28122fd6678e89fd3a8d4bc80922969"
 
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


