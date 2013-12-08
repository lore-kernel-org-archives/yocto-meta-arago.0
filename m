Return-Path: <yanivma@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 60E4E52A86
	for <meta-arago@arago-project.org>;
	Sun,  8 Dec 2013 08:20:23 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id rB88KMI4025164
	for <meta-arago@arago-project.org>; Sun, 8 Dec 2013 02:20:22 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rB88KMi1011426
	for <meta-arago@arago-project.org>; Sun, 8 Dec 2013 02:20:22 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Sun, 8 Dec 2013 02:20:22 -0600
Received: from mcp8x-srv.emea.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	rB88KJt2009163;	Sun, 8 Dec 2013 02:20:21 -0600
From: Yaniv Mahani <yanivma@ti.com>
To: <meta-arago@arago-project.org>
Date: Sun, 8 Dec 2013 10:18:11 +0200
Message-ID: <1386490696-16318-3-git-send-email-yanivma@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1386490696-16318-1-git-send-email-yanivma@ti.com>
References: <1386490696-16318-1-git-send-email-yanivma@ti.com>
MIME-Version: 1.0
Subject: [PATCH 3/8] wlconf : Update recipe to ol_r8.a8.08 version.
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
X-List-Received-Date: Sun, 08 Dec 2013 08:20:24 -0000
Content-Type: text/plain

From: Yaniv Machani <yanivma@ti.com>

- Added missing default configuration file.

Signed-off-by: Yaniv Machani <yanivma@ti.com>
---
 .../{wlconf_r8.a6.01.bb => wlconf_r8.a8.08.bb}     |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)
 rename meta-arago-extras/recipes-connectivity/wlconf/{wlconf_r8.a6.01.bb => wlconf_r8.a8.08.bb} (88%)

diff --git a/meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a6.01.bb b/meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a8.08.bb
similarity index 88%
rename from meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a6.01.bb
rename to meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a8.08.bb
index 8076350..f4adc18 100644
--- a/meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a6.01.bb
+++ b/meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a8.08.bb
@@ -2,11 +2,11 @@ DESCRIPTION = "Configuration utility for TI wireless drivers"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://README;beginline=1;endline=21;md5=adc05a1903d3f107f85c90328e3a9438"
 
-PR ="r2"
+PR ="r0"
 PR_append = "+gitr${SRCPV}"
 
-# Tag: ol_r8.a6.01
-SRCREV = "214dfbdf97cc390b0020c4ea9331a1cf82240a64"
+# Tag: ol_r8.a8.08
+SRCREV = "c976584589981c9ab8741d1819a5019e17cac13b"
 SRC_URI = "git://github.com/TI-OpenLink/18xx-ti-utils.git"
 
 S = "${WORKDIR}/git/wlconf"
@@ -21,6 +21,7 @@ do_install() {
 	install -m 0755 wlconf ${D}${bindir}/wlconf/
 	install -m 0755 dictionary.txt ${D}${bindir}/wlconf/
 	install -m 0755 struct.bin ${D}${bindir}/wlconf/
+	install -m 0755 default.conf ${D}${bindir}/wlconf/
 	install -m 0755 wl18xx-conf-default.bin ${D}${bindir}/wlconf/
 	install -m 0755 README ${D}${bindir}/wlconf/
 	install -m 0755 example.conf ${D}${bindir}/wlconf/
-- 
1.7.9


