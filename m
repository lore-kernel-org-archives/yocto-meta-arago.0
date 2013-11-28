Return-Path: <yanivma@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id DA3B2529E3
	for <meta-arago@arago-project.org>;
	Thu, 28 Nov 2013 11:39:01 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id rASBd1SY023634
	for <meta-arago@arago-project.org>; Thu, 28 Nov 2013 05:39:01 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rASBd0M7016801
	for <meta-arago@arago-project.org>; Thu, 28 Nov 2013 05:39:01 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 28 Nov 2013 05:39:00 -0600
Received: from mcp8x-srv.emea.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	rASBcxg0031103;	Thu, 28 Nov 2013 05:39:00 -0600
From: Yaniv Mahani <yanivma@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 28 Nov 2013 13:37:09 +0200
Message-ID: <1385638629-11836-1-git-send-email-yanivma@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 06/14] wlconf : Removed ol_r8.a6.01 recipe.
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
X-List-Received-Date: Thu, 28 Nov 2013 11:39:02 -0000
Content-Type: text/plain

From: Yaniv Machani <yanivma@ti.com>

Clean up unsupported version.

Signed-off-by: Yaniv Machani <yanivma@ti.com>
---
 .../recipes-connectivity/wlconf/wlconf_r8.a6.01.bb |   37 --------------------
 1 files changed, 0 insertions(+), 37 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a6.01.bb

diff --git a/meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a6.01.bb b/meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a6.01.bb
deleted file mode 100644
index 8076350..0000000
--- a/meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a6.01.bb
+++ /dev/null
@@ -1,37 +0,0 @@
-DESCRIPTION = "Configuration utility for TI wireless drivers"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://README;beginline=1;endline=21;md5=adc05a1903d3f107f85c90328e3a9438"
-
-PR ="r2"
-PR_append = "+gitr${SRCPV}"
-
-# Tag: ol_r8.a6.01
-SRCREV = "214dfbdf97cc390b0020c4ea9331a1cf82240a64"
-SRC_URI = "git://github.com/TI-OpenLink/18xx-ti-utils.git"
-
-S = "${WORKDIR}/git/wlconf"
-
-EXTRA_OEMAKE = "CC=${TARGET_PREFIX}gcc"
-
-do_install() {
-	install -d ${D}${bindir}
-	install -d ${D}${bindir}/wlconf/
-	install -d ${D}${bindir}/wlconf/official_inis
-
-	install -m 0755 wlconf ${D}${bindir}/wlconf/
-	install -m 0755 dictionary.txt ${D}${bindir}/wlconf/
-	install -m 0755 struct.bin ${D}${bindir}/wlconf/
-	install -m 0755 wl18xx-conf-default.bin ${D}${bindir}/wlconf/
-	install -m 0755 README ${D}${bindir}/wlconf/
-	install -m 0755 example.conf ${D}${bindir}/wlconf/
-	install -m 0755 example.ini ${D}${bindir}/wlconf/
-	install -m 0755 ${S}/official_inis/* \
-			${D}${bindir}/wlconf/official_inis/
-}
-
-FILES_${PN} += " \
-	${bindir}/wlconf \
-	${bindir}/wlconf/official_inis \
-"
-
-FILES_${PN}-dbg += "${bindir}/wlconf/.debug"
-- 
1.7.9


