Return-Path: <yanivma@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id C4D1F52A51
	for <meta-arago@arago-project.org>;
	Tue, 29 Jul 2014 20:18:50 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s6TKIokS017304
	for <meta-arago@arago-project.org>; Tue, 29 Jul 2014 15:18:50 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6TKIovj010424
	for <meta-arago@arago-project.org>; Tue, 29 Jul 2014 15:18:50 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 29 Jul 2014 15:18:49 -0500
Received: from mcp8x-srv.emea.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s6TKImIC029016;	Tue, 29 Jul 2014 15:18:49 -0500
From: Yaniv Machani <yanivma@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 29 Jul 2014 23:13:55 +0300
Message-ID: <1406664835-16595-2-git-send-email-yanivma@ti.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1406664835-16595-1-git-send-email-yanivma@ti.com>
References: <1406664835-16595-1-git-send-email-yanivma@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] wl18xx-wlconf: version update
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
X-List-Received-Date: Tue, 29 Jul 2014 20:18:51 -0000
Content-Type: text/plain

    - Update to latest version tag - ol_r8.a9.14
    - move to git.ti.com

Signed-off-by: Yaniv Machani <yanivma@ti.com>
---
 .../{wlconf_r8.a8.10.bb => wlconf_r8.a9.14.bb}     |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)
 rename meta-arago-extras/recipes-connectivity/wlconf/{wlconf_r8.a8.10.bb => wlconf_r8.a9.14.bb} (85%)

diff --git a/meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a8.10.bb b/meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a9.14.bb
similarity index 85%
rename from meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a8.10.bb
rename to meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a9.14.bb
index 5f50e88..02af7f6 100644
--- a/meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a8.10.bb
+++ b/meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a9.14.bb
@@ -2,12 +2,12 @@ DESCRIPTION = "Configuration utility for TI wireless drivers"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://README;beginline=1;endline=21;md5=adc05a1903d3f107f85c90328e3a9438"
 
-PR ="r1"
+PR ="r2"
 PR_append = "+gitr${SRCPV}"
 
-# Tag: ol_r8.a8.10
-SRCREV = "c50159d66af1786414b819ebcaa8b2571ae790a1"
-SRC_URI = "git://github.com/TI-OpenLink/18xx-ti-utils.git"
+# Tag: ol_r8.a9.14
+SRCREV = "e014b59381f04b329fccd0ec18a5f2da7fa0fd63"
+SRC_URI = "git://git.ti.com/wilink8-wlan/18xx-ti-utils.git"
 
 S = "${WORKDIR}/git/wlconf"
 
@@ -28,6 +28,7 @@ do_install() {
 	install -m 0755 README ${D}${bindir}/wlconf/
 	install -m 0755 example.conf ${D}${bindir}/wlconf/
 	install -m 0755 example.ini ${D}${bindir}/wlconf/
+	install -m 0755 configure-device.sh ${D}${bindir}/wlconf/
 	install -m 0755 ${S}/official_inis/* \
 			${D}${bindir}/wlconf/official_inis/
 }
-- 
1.7.9


