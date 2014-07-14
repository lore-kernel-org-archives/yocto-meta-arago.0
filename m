Return-Path: <yanivma@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 76C6252A7A
	for <meta-arago@arago-project.org>;
	Mon, 14 Jul 2014 15:09:18 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s6EF9HFX028169
	for <meta-arago@arago-project.org>; Mon, 14 Jul 2014 10:09:17 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6EF9HWS008185
	for <meta-arago@arago-project.org>; Mon, 14 Jul 2014 10:09:17 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 14 Jul 2014 10:09:17 -0500
Received: from mcp8x-srv.emea.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s6EF8uSt023580;	Mon, 14 Jul 2014 10:09:16 -0500
From: Yaniv Machani <yanivma@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 14 Jul 2014 18:04:08 +0300
Message-ID: <1405350249-15037-5-git-send-email-yanivma@ti.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1405350249-15037-1-git-send-email-yanivma@ti.com>
References: <1405350249-15037-1-git-send-email-yanivma@ti.com>
MIME-Version: 1.0
Subject: [PATCH 4/5] Wl18xx : recipes update - tag changed to ol_r8.a9.14
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
X-List-Received-Date: Mon, 14 Jul 2014 15:09:18 -0000
Content-Type: text/plain

     - Changed git sources to git.ti.com
     - Updated to latest release.

Signed-off-by: Yaniv Machani <yanivma@ti.com>
---
 ...8.a8.10.bb => ti-wifi-utils-wl18xx_r8.a9.14.bb} |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-arago-extras/recipes-devtools/ti-wifi-utils/{ti-wifi-utils-wl18xx_r8.a8.10.bb => ti-wifi-utils-wl18xx_r8.a9.14.bb} (81%)

diff --git a/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-wl18xx_r8.a8.10.bb b/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-wl18xx_r8.a9.14.bb
similarity index 81%
rename from meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-wl18xx_r8.a8.10.bb
rename to meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-wl18xx_r8.a9.14.bb
index 26faa6f..f74c2f9 100644
--- a/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-wl18xx_r8.a8.10.bb
+++ b/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-wl18xx_r8.a9.14.bb
@@ -5,11 +5,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4725015cb0be7be389cf06deeae3683d"
 DEPENDS = "libnl"
 RDEPENDS_${PN} = "wl18xx-firmware"
 
-PR ="r1+gitr${SRCPV}"
+PR ="r2+gitr${SRCPV}"
 
-#Tag: ol_r8.a8.10
-SRCREV = "c50159d66af1786414b819ebcaa8b2571ae790a1"
-SRC_URI = "git://github.com/TI-OpenLink/18xx-ti-utils.git \
+#Tag: ol_r8.a9.14
+SRCREV = "e014b59381f04b329fccd0ec18a5f2da7fa0fd63"
+SRC_URI = "git://git.ti.com/wilink8-wlan/18xx-ti-utils.git \
 "
 
 PROVIDES += "ti-wifi-utils"
-- 
1.7.9


