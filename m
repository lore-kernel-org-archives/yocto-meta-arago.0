Return-Path: <yanivma@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 8F9515296F
	for <meta-arago@arago-project.org>;
	Thu, 28 Nov 2013 11:39:44 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id rASBdi2B010410
	for <meta-arago@arago-project.org>; Thu, 28 Nov 2013 05:39:44 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rASBdhC0017289
	for <meta-arago@arago-project.org>; Thu, 28 Nov 2013 05:39:44 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 28 Nov 2013 05:39:43 -0600
Received: from mcp8x-srv.emea.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	rASBdgRD021096;	Thu, 28 Nov 2013 05:39:43 -0600
From: Yaniv Mahani <yanivma@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 28 Nov 2013 13:37:52 +0200
Message-ID: <1385638672-11964-1-git-send-email-yanivma@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 09/14] wl18xx-firmware: update recipe to ol_r8.a8.08 version.
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
X-List-Received-Date: Thu, 28 Nov 2013 11:39:44 -0000
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
index 4b3f22a..5123c1b 100644
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
+SRCREV = "3e3c6dd48ef34ff0f87e506d8699a37bb3cc8134"
 SRC_URI = "git://github.com/TI-OpenLink/wl18xx_fw.git;protocol=git \
            file://Makefile \
           "
-- 
1.7.9


