Return-Path: <yanivma@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 7ACF4529D4
	for <meta-arago@arago-project.org>;
	Tue, 25 Aug 2015 20:54:20 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t7PKsJAN027956
	for <meta-arago@arago-project.org>; Tue, 25 Aug 2015 15:54:19 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7PKsJim024988
	for <meta-arago@arago-project.org>; Tue, 25 Aug 2015 15:54:19 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 25 Aug 2015 15:54:19 -0500
Received: from wlsrv.emea.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t7PKsIUD009867;	Tue, 25 Aug 2015 15:54:18 -0500
From: Yaniv Machani <yanivma@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 25 Aug 2015 13:52:16 -0700
Message-ID: <1440535936-14239-1-git-send-email-yanivma@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] bt-firmware: update bts install path
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
X-List-Received-Date: Tue, 25 Aug 2015 20:54:20 -0000
Content-Type: text/plain

Changed path to ti-connectivity folder under libdir

Signed-off-by: Yaniv Machani <yanivma@ti.com>
---
 .../recipes-bsp/bt-firmware/bt-firmware_git.bb     |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware_git.bb b/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware_git.bb
index cb29a84..52d6774 100644
--- a/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware_git.bb
+++ b/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware_git.bb
@@ -11,7 +11,7 @@ RCONFLICTS_${PN} = "linux-firmware-wl12xx"
 RREPLACES_${PN}  = "linux-firmware-wl12xx"
 
 PV = "R8.5+git${SRCPV}"
-PR = "r8"
+PR = "r9"
 
 COMPATIBLE_MACHINE = "ti33x|ti43x|dra7xx"
 
@@ -34,7 +34,7 @@ do_compile() {
 }
 
 do_install() {
-    install -d ${D}${base_libdir}/firmware
+    install -d ${D}${base_libdir}/firmware/ti-connectivity
     oe_runmake 'DEST_DIR=${D}' 'BASE_LIB_DIR=${base_libdir}' 'PLATFORM=${PLATFORM}' install
 }
 
-- 
1.7.9.5


