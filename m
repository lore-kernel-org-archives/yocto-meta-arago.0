Return-Path: <yanivma@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id ADFD35298E
	for <meta-arago@arago-project.org>;
	Sun, 14 Sep 2014 10:25:23 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s8EAPM7J001014
	for <meta-arago@arago-project.org>; Sun, 14 Sep 2014 05:25:22 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s8EAPMhb018669
	for <meta-arago@arago-project.org>; Sun, 14 Sep 2014 05:25:22 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Sun, 14 Sep 2014 05:25:22 -0500
Received: from mcp8x-srv.emea.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s8EAPLLx003185;	Sun, 14 Sep 2014 05:25:22 -0500
From: Yaniv Machani <yanivma@ti.com>
To: <meta-arago@arago-project.org>
Date: Sun, 14 Sep 2014 13:19:36 +0300
Message-ID: <1410689976-12494-1-git-send-email-yanivma@ti.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
Subject: [PATCH] wl18xx: compat: Fix suspend/resume warnings
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
X-List-Received-Date: Sun, 14 Sep 2014 10:25:23 -0000
Content-Type: text/plain

- Update the driver commit to fix suspend/resume issue.

Signed-off-by: Yaniv Machani <yanivma@ti.com>
---
 .../ti-compat-wireless-wl18xx_r8.a9.14.bb          |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a9.14.bb b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a9.14.bb
index 5adfe56..fd1b914 100644
--- a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a9.14.bb
+++ b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a9.14.bb
@@ -12,10 +12,10 @@ RDEPENDS_${PN} = "wireless-tools"
 PV = "r8.a9.14"
 inherit module
 
-PR = "${MACHINE_KERNEL_PR}+d+gitr${SRCPV}"
+PR = "${MACHINE_KERNEL_PR}+e+gitr${SRCPV}"
 
 # Tags: ol_r8.a9.14
-SRCREV_wl18xx = "0e48c4b55cfa0d557a098cbe92b1f092f1a9ad67"
+SRCREV_wl18xx = "3ccf4f9ff3fd5607f4d6e32fd84e2b3783532033"
 BRANCH_wl18xx = "ap_p2p"
 SRCREV_backports = "0d46f43a2f3ccdd53de19eee5b9c674bf8ef09a2"
 BRANCH_backports = "ap_dfs_mbss_all"
-- 
1.7.9


