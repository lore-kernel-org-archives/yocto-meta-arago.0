Return-Path: <yanivma@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id CE811529E3
	for <meta-arago@arago-project.org>;
	Thu, 28 Nov 2013 11:35:09 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id rASBZ9N2007533
	for <meta-arago@arago-project.org>; Thu, 28 Nov 2013 05:35:09 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rASBZ9R5014248
	for <meta-arago@arago-project.org>; Thu, 28 Nov 2013 05:35:09 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 28 Nov 2013 05:35:08 -0600
Received: from mcp8x-srv.emea.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	rASBZ7ZG018541;	Thu, 28 Nov 2013 05:35:08 -0600
From: Yaniv Mahani <yanivma@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 28 Nov 2013 13:33:17 +0200
Message-ID: <1385638397-11663-1-git-send-email-yanivma@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 02/14] wpa-supplicant-wl18xx: Removed ol_r8.a6.01 recipe.
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
X-List-Received-Date: Thu, 28 Nov 2013 11:35:10 -0000
Content-Type: text/plain

From: Yaniv Machani <yanivma@ti.com>

Clean up unsupported version.
Signed-off-by: Yaniv Machani <yanivma@ti.com>
---
 .../wpa-supplicant-wl18xx_r8.a6.01.bb              |   24 --------------------
 1 files changed, 0 insertions(+), 24 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx_r8.a6.01.bb

diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx_r8.a6.01.bb b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx_r8.a6.01.bb
deleted file mode 100644
index f6c4f70..0000000
--- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx_r8.a6.01.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-# This is a TI specific version of the wpa-supplicant recipe for use with the
-# wl18xx wlan module.
-
-require wpa-supplicant.inc
-
-LICENSE = "GPLv2 | BSD"
-LIC_FILES_CHKSUM = "file://../COPYING;md5=ab87f20cd7e8c0d0a6539b34d3791d0e \
-                    file://../README;md5=5cb758942d25f6f61fd4ac388fd446fa \
-                    file://wpa_supplicant.c;beginline=1;endline=17;md5=8835156c8ab8cad6356ec7f39ebe3aba"
-
-FILESEXTRAPATHS_append := "${THISDIR}/wpa-supplicant:"
-
-# Tag: ol_r8.a6.01
-SRCREV = "7190ff7dbd43243290b626068ded0d61c5019050"
-PR = "r2+gitr${SRCPV}"
-
-# Add ti to the PV to indicate that this is a TI modify version of wpa-supplicant.
-PV = "2.0-devel-ti"
-
-PROVIDES += "wpa-supplicant"
-RPROVIDES_${PN}  += "wpa-supplicant"
-RREPLACES_${PN}  += "wpa-supplicant"
-RCONFLICTS_${PN}  += "wpa-supplicant"
-RDEPENDS_${PN} += "wpa-supplicant-cli wpa-supplicant-passphrase"
-- 
1.7.9


