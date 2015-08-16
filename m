Return-Path: <yanivma@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 15FC15297D
	for <meta-arago@arago-project.org>;
	Sun, 16 Aug 2015 07:23:43 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t7G7NceT026893
	for <meta-arago@arago-project.org>; Sun, 16 Aug 2015 02:23:38 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7G7NcFm006652
	for <meta-arago@arago-project.org>; Sun, 16 Aug 2015 02:23:38 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Sun, 16 Aug 2015 02:23:38 -0500
Received: from wl-supersrv.emea.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t7G7NbXC007687;	Sun, 16 Aug 2015 02:23:38 -0500
From: Yaniv Machani <yanivma@ti.com>
To: <meta-arago@arago-project.org>
Date: Sun, 16 Aug 2015 00:21:01 -0700
Message-ID: <1439709661-574-1-git-send-email-yanivma@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] wilink8 : Update conf repo to latest version
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
X-List-Received-Date: Sun, 16 Aug 2015 07:23:51 -0000
Content-Type: text/plain

From: Yaniv Mahani <yanivma@ti.com>

    Updated configuration file repo to match version R8.6

Signed-off-by: Yaniv Machani <yanivma@ti.com>
---
 .../recipes-connectivity/wlconf/wlconf.bb          |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arago-extras/recipes-connectivity/wlconf/wlconf.bb b/meta-arago-extras/recipes-connectivity/wlconf/wlconf.bb
index 586339f..167ea43 100644
--- a/meta-arago-extras/recipes-connectivity/wlconf/wlconf.bb
+++ b/meta-arago-extras/recipes-connectivity/wlconf/wlconf.bb
@@ -2,12 +2,12 @@ DESCRIPTION = "Configuration utility for TI wireless drivers"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://README;beginline=1;endline=21;md5=adc05a1903d3f107f85c90328e3a9438"
 
-PV = "R8.5+git${SRCPV}"
+PV = "R8.6+git${SRCPV}"
 
-PR = "r3"
+PR = "r4"
 
-# Tag: R8.5
-SRCREV = "dcf0800f30ba449cd7f3a20f8b3f4853dc829652"
+# Tag: R8.6
+SRCREV = "cf8965aad73764022669647fa33852558a657930"
 SRC_URI = "git://git.ti.com/wilink8-wlan/18xx-ti-utils.git"
 
 S = "${WORKDIR}/git/wlconf"
-- 
1.7.9.5


