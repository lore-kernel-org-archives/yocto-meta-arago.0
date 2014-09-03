Return-Path: <karthik.ramanan@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id EB583529D5
	for <meta-arago@arago-project.org>;
	Wed,  3 Sep 2014 12:42:14 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s83CgEtU013477
	for <meta-arago@arago-project.org>; Wed, 3 Sep 2014 07:42:14 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s83CgERE020267
	for <meta-arago@arago-project.org>; Wed, 3 Sep 2014 07:42:14 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 3 Sep 2014 07:42:13 -0500
Received: from swubn01.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s83CfZhp031656;
	Wed, 3 Sep 2014 07:42:12 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 3 Sep 2014 18:11:30 +0530
Message-ID: <1409748091-12617-12-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 2.0.1
In-Reply-To: <1409748091-12617-1-git-send-email-a0393906@ti.com>
References: <1409748091-12617-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
Subject: [for dora] [PATCH v2 11/12] wl18xx-wlconf: version update
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
X-List-Received-Date: Wed, 03 Sep 2014 12:42:15 -0000
Content-Type: text/plain

From: Yaniv Machani <yanivma@ti.com>

- Update to latest version tag - ol_r8.a9.14
    - move to git.ti.com

Signed-off-by: Yaniv Machani <yanivma@ti.com>
Acked-by: Franklin Cooper Jr. <fcooper@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Tested-by: Karthik Ramanan <a0393906@ti.com>
---
 .../wlconf/{wlconf_r8.a8.10.bb => wlconf_r8.a9.14.bb}            | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)
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
2.0.1


