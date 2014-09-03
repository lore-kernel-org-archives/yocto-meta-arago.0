Return-Path: <karthik.ramanan@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id B9F2E52ABF
	for <meta-arago@arago-project.org>;
	Wed,  3 Sep 2014 12:42:06 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s83Cg5Ku013457
	for <meta-arago@arago-project.org>; Wed, 3 Sep 2014 07:42:05 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s83Cg5sv015039
	for <meta-arago@arago-project.org>; Wed, 3 Sep 2014 07:42:05 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 3 Sep 2014 07:42:05 -0500
Received: from swubn01.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s83CfZhl031656;
	Wed, 3 Sep 2014 07:42:04 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 3 Sep 2014 18:11:26 +0530
Message-ID: <1409748091-12617-8-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 2.0.1
In-Reply-To: <1409748091-12617-1-git-send-email-a0393906@ti.com>
References: <1409748091-12617-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
Subject: [for dora] [PATCH v2 07/12] Wl18xx : recipes update - tag changed to ol_r8.a9.14
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
X-List-Received-Date: Wed, 03 Sep 2014 12:42:07 -0000
Content-Type: text/plain

From: Yaniv Machani <yanivma@ti.com>

- Changed git sources to git.ti.com
     - Updated to latest release.

Signed-off-by: Yaniv Machani <yanivma@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Tested-by: Karthik Ramanan <a0393906@ti.com>
---
 ...-utils-wl18xx_r8.a8.10.bb => ti-wifi-utils-wl18xx_r8.a9.14.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
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
2.0.1


