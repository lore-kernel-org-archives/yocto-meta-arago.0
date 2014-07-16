Return-Path: <yanivma@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 0B2B152A2F
	for <meta-arago@arago-project.org>;
	Wed, 16 Jul 2014 10:33:12 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s6GAXBcc031782
	for <meta-arago@arago-project.org>; Wed, 16 Jul 2014 05:33:11 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6GAXBuw025110
	for <meta-arago@arago-project.org>; Wed, 16 Jul 2014 05:33:11 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 16 Jul 2014 05:33:10 -0500
Received: from mcp8x-srv.emea.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s6GAX8px020092;	Wed, 16 Jul 2014 05:33:10 -0500
From: Yaniv Machani <yanivma@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 16 Jul 2014 13:28:30 +0300
Message-ID: <1405506511-20607-3-git-send-email-yanivma@ti.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1405506511-20607-1-git-send-email-yanivma@ti.com>
References: <1405506511-20607-1-git-send-email-yanivma@ti.com>
MIME-Version: 1.0
Subject: [PATCH 3/5 v2] wl18xx : update to ol_r8.a9.14
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
X-List-Received-Date: Wed, 16 Jul 2014 10:33:13 -0000
Content-Type: text/plain

    - Changed git sources to git.ti.com
    - Updated to latest release.
Signed-off-by: Yaniv Machani <yanivma@ti.com>
---
V2 Changes
    - Fixed mode change
    
 ...are_r8.a8.10.bb => wl18xx-firmware_r8.a9.14.bb} |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)
 rename meta-arago-extras/recipes-bsp/wl18xx-firmware/{wl18xx-firmware_r8.a8.10.bb => wl18xx-firmware_r8.a9.14.bb} (72%)

diff --git a/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a8.10.bb b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a9.14.bb
similarity index 72%
rename from meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a8.10.bb
rename to meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a9.14.bb
index b59f1c4..45d4ea7 100644
--- a/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a8.10.bb
+++ b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a9.14.bb
@@ -4,16 +4,17 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=4977a0fe767ee17765ae63c435a32a9e"
 
 PACKAGE_ARCH = "all"
 
-PR = "r3+gitr${SRCPV}"
+PR = "r4+gitr${SRCPV}"
 
 PROVIDES += "wl12xx-firmware"
 RPROVIDES_${PN} += "wl12xx-firmware"
 RREPLACES_${PN} += "wl12xx-firmware"
 RCONFLICTS_${PN} += "wl12xx-firmware"
 
-# Tag: ol_r8.a8.10
-SRCREV = "89dc93a5c23fd69ebacd64c936ba5aabf173c29b"
-SRC_URI = "git://github.com/TI-OpenLink/wl18xx_fw.git;protocol=git;branch=mbss \
+# Tag: ol_r8.a9.14
+SRCREV = "2568d8f61fd509eabb112110c20ea31c088ef6b9"
+BRANCH = "ap_dfs"
+SRC_URI = "git://git.ti.com/wilink8-wlan/wl18xx_fw.git;protocol=git;branch=${BRANCH} \
            file://0001-Add-Makefile-for-SDK.patch \
           "
 
-- 
1.7.9


