Return-Path: <yanivma@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id BA6C852A63
	for <meta-arago@arago-project.org>;
	Mon, 27 Jan 2014 20:21:18 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0RKLIgt008797
	for <meta-arago@arago-project.org>; Mon, 27 Jan 2014 14:21:18 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0RKLIkT021763
	for <meta-arago@arago-project.org>; Mon, 27 Jan 2014 14:21:18 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 27 Jan 2014 14:21:17 -0600
Received: from mcp8x-srv.emea.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s0RKLFHc006617;	Mon, 27 Jan 2014 14:21:17 -0600
From: Yaniv Mahani <yanivma@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 27 Jan 2014 22:19:45 +0200
Message-ID: <1390853985-8457-3-git-send-email-yanivma@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1390853985-8457-1-git-send-email-yanivma@ti.com>
References: <1390853985-8457-1-git-send-email-yanivma@ti.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] wl18xx wlconf: add missing default bin
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
X-List-Received-Date: Mon, 27 Jan 2014 20:21:19 -0000
Content-Type: text/plain

From: Yaniv Machani <yanivma@ti.com>

- Add missing configuration file, eliminate loading error message.
- Update to latest version.

Signed-off-by: Yaniv Machani <yanivma@ti.com>
---
 .../{wlconf_r8.a8.08.bb => wlconf_r8.a8.10.bb}     |    9 ++++++---
 1 files changed, 6 insertions(+), 3 deletions(-)
 rename meta-arago-extras/recipes-connectivity/wlconf/{wlconf_r8.a8.08.bb => wlconf_r8.a8.10.bb} (80%)

diff --git a/meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a8.08.bb b/meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a8.10.bb
similarity index 80%
rename from meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a8.08.bb
rename to meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a8.10.bb
index f4adc18..5f50e88 100644
--- a/meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a8.08.bb
+++ b/meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a8.10.bb
@@ -2,11 +2,11 @@ DESCRIPTION = "Configuration utility for TI wireless drivers"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://README;beginline=1;endline=21;md5=adc05a1903d3f107f85c90328e3a9438"
 
-PR ="r0"
+PR ="r1"
 PR_append = "+gitr${SRCPV}"
 
-# Tag: ol_r8.a8.08
-SRCREV = "c976584589981c9ab8741d1819a5019e17cac13b"
+# Tag: ol_r8.a8.10
+SRCREV = "c50159d66af1786414b819ebcaa8b2571ae790a1"
 SRC_URI = "git://github.com/TI-OpenLink/18xx-ti-utils.git"
 
 S = "${WORKDIR}/git/wlconf"
@@ -17,12 +17,14 @@ do_install() {
 	install -d ${D}${bindir}
 	install -d ${D}${bindir}/wlconf/
 	install -d ${D}${bindir}/wlconf/official_inis
+	install -d ${D}/lib/firmware/ti-connectivity
 
 	install -m 0755 wlconf ${D}${bindir}/wlconf/
 	install -m 0755 dictionary.txt ${D}${bindir}/wlconf/
 	install -m 0755 struct.bin ${D}${bindir}/wlconf/
 	install -m 0755 default.conf ${D}${bindir}/wlconf/
 	install -m 0755 wl18xx-conf-default.bin ${D}${bindir}/wlconf/
+	install -m 0755 wl18xx-conf-default.bin ${D}/lib/firmware/ti-connectivity/wl18xx-conf.bin
 	install -m 0755 README ${D}${bindir}/wlconf/
 	install -m 0755 example.conf ${D}${bindir}/wlconf/
 	install -m 0755 example.ini ${D}${bindir}/wlconf/
@@ -33,6 +35,7 @@ do_install() {
 FILES_${PN} += " \
 	${bindir}/wlconf \
 	${bindir}/wlconf/official_inis \
+	/lib/firmware/ti-connectivity/wl18xx-conf.bin \
 "
 
 FILES_${PN}-dbg += "${bindir}/wlconf/.debug"
-- 
1.7.9


