Return-Path: <yanivma@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 7693552A26
	for <meta-arago@arago-project.org>;
	Thu,  9 Oct 2014 15:44:20 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s99FiIrX030683
	for <meta-arago@arago-project.org>; Thu, 9 Oct 2014 10:44:18 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s99FiIoF018959
	for <meta-arago@arago-project.org>; Thu, 9 Oct 2014 10:44:18 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 9 Oct 2014 10:44:18 -0500
Received: from mcp8x-srv.emea.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s99FiH2L009380;	Thu, 9 Oct 2014 10:44:17 -0500
From: Yaniv Machani <yanivma@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 9 Oct 2014 18:38:03 +0300
Message-ID: <1412869083-16325-1-git-send-email-yanivma@ti.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
Subject: [PATCH] wl18xx: scripts: fix station dhcpc script
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
X-List-Received-Date: Thu, 09 Oct 2014 15:44:20 -0000
Content-Type: text/plain

 - Check if DHCPC was already started for wlan0 only.

Signed-off-by: Yaniv Machani <yanivma@ti.com>
---
 .../wl18xx-target-scripts_r8.a9.14.bb              |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_r8.a9.14.bb b/meta-arago-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_r8.a9.14.bb
index 65fcd20..cdd8d16 100644
--- a/meta-arago-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_r8.a9.14.bb
+++ b/meta-arago-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_r8.a9.14.bb
@@ -2,10 +2,10 @@ DESCRIPTION = "Scripts and configuration files for TI wireless drivers"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://README;beginline=1;endline=21;md5=b8d6a0865f50159bf5c0d175d1f4a705"
 
-PR ="r3+gitr${SRCPV}"
+PR ="r4+gitr${SRCPV}"
 
 # Tag: ol_r8.a9.14
-SRCREV = "2570d350f0bccf7e3df7bc5c7398a0a846724f58"
+SRCREV = "f6c66162e75c6a31fa7142530534e4df8f1a7bed"
 BRANCH = "sitara-mbss"
 SRC_URI = "git://git.ti.com/wilink8-wlan/wl18xx-target-scripts.git;protocol=git;branch=${BRANCH}"
 
-- 
1.7.9


