Return-Path: <yanivma@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id C515A529EA
	for <meta-arago@arago-project.org>;
	Fri, 12 Sep 2014 22:16:35 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s8CMGY2q029728
	for <meta-arago@arago-project.org>; Fri, 12 Sep 2014 17:16:34 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s8CMGYds018054
	for <meta-arago@arago-project.org>; Fri, 12 Sep 2014 17:16:34 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 12 Sep 2014 17:16:34 -0500
Received: from mcp8x-srv.emea.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s8CMGXj1001759;	Fri, 12 Sep 2014 17:16:33 -0500
From: Yaniv Machani <yanivma@ti.com>
To: <meta-arago@arago-project.org>
Date: Sat, 13 Sep 2014 01:10:49 +0300
Message-ID: <1410559849-10317-1-git-send-email-yanivma@ti.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
Subject: [PATCH] wl18xx: scripts: update station scripts
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
X-List-Received-Date: Fri, 12 Sep 2014 22:16:36 -0000
Content-Type: text/plain

- Add udhcpc connection script
- Add configuration file to share folder

Signed-off-by: Yaniv Machani <yanivma@ti.com>
---
 .../wl18xx-target-scripts/wl18xx-target-scripts_r8.a9.14.bb         | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_r8.a9.14.bb b/meta-arago-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_r8.a9.14.bb
index 9ac3531..65fcd20 100644
--- a/meta-arago-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_r8.a9.14.bb
+++ b/meta-arago-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_r8.a9.14.bb
@@ -2,10 +2,10 @@ DESCRIPTION = "Scripts and configuration files for TI wireless drivers"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://README;beginline=1;endline=21;md5=b8d6a0865f50159bf5c0d175d1f4a705"
 
-PR ="r2+gitr${SRCPV}"
+PR ="r3+gitr${SRCPV}"
 
 # Tag: ol_r8.a9.14
-SRCREV = "3a09bcf797ffe16a0d793e550caec9322a4e8027"
+SRCREV = "2570d350f0bccf7e3df7bc5c7398a0a846724f58"
 BRANCH = "sitara-mbss"
 SRC_URI = "git://git.ti.com/wilink8-wlan/wl18xx-target-scripts.git;protocol=git;branch=${BRANCH}"
 
@@ -16,7 +16,7 @@ FILES_${PN} += "${datadir}/wl18xx/"
 do_install() {
 	install -d ${D}${datadir}/wl18xx/
 
-	scripts=`find ./ -type f -name "*\.sh"`
+	scripts=`find ./ -type f -name "*.*"`
 	for s in $scripts
 	do
 		install -m 0755 $s ${D}${datadir}/wl18xx/
-- 
1.8.3.2


