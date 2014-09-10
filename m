Return-Path: <yanivma@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 9C10652007
	for <meta-arago@arago-project.org>;
	Wed, 10 Sep 2014 12:41:51 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s8ACfohk024534
	for <meta-arago@arago-project.org>; Wed, 10 Sep 2014 07:41:50 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s8ACfoSv028277
	for <meta-arago@arago-project.org>; Wed, 10 Sep 2014 07:41:50 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 10 Sep 2014 07:41:50 -0500
Received: from mcp8x-srv.emea.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s8ACfnCU023968;	Wed, 10 Sep 2014 07:41:50 -0500
From: Yaniv Machani <yanivma@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 10 Sep 2014 15:36:08 +0300
Message-ID: <1410352568-6319-1-git-send-email-yanivma@ti.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
Subject: [PATCH] wl18xx: scripts: update scripts to match OOB configuration
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
X-List-Received-Date: Wed, 10 Sep 2014 12:41:52 -0000
Content-Type: text/plain

- Cleanup some redundant scripts
- Change default path
---
 .../wl18xx-target-scripts_r8.a9.14.bb              |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_r8.a9.14.bb b/meta-arago-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_r8.a9.14.bb
index 8ba0092..9ac3531 100644
--- a/meta-arago-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_r8.a9.14.bb
+++ b/meta-arago-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_r8.a9.14.bb
@@ -2,10 +2,10 @@ DESCRIPTION = "Scripts and configuration files for TI wireless drivers"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://README;beginline=1;endline=21;md5=b8d6a0865f50159bf5c0d175d1f4a705"
 
-PR ="r1+gitr${SRCPV}"
+PR ="r2+gitr${SRCPV}"
 
 # Tag: ol_r8.a9.14
-SRCREV = "4d9f47235501fb2c665b6336a54e0ba152e8e941"
+SRCREV = "3a09bcf797ffe16a0d793e550caec9322a4e8027"
 BRANCH = "sitara-mbss"
 SRC_URI = "git://git.ti.com/wilink8-wlan/wl18xx-target-scripts.git;protocol=git;branch=${BRANCH}"
 
-- 
1.7.9


