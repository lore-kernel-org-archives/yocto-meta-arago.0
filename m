Return-Path: <yanivma@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 38BD3529A7
	for <meta-arago@arago-project.org>;
	Fri, 24 Apr 2015 12:18:52 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t3OCIp0j025761
	for <meta-arago@arago-project.org>; Fri, 24 Apr 2015 07:18:51 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3OCIoEf014894
	for <meta-arago@arago-project.org>; Fri, 24 Apr 2015 07:18:50 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 24 Apr 2015 07:18:50 -0500
Received: from mcp8x-srv.emea.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t3OCIniC016920;	Fri, 24 Apr 2015 07:18:49 -0500
From: Yaniv Machani <yanivma@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 24 Apr 2015 15:08:44 +0300
Message-ID: <1429877324-20845-1-git-send-email-yanivma@ti.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
Subject: [PATCH] wl18xx: compat : update driver to allow irq config
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
X-List-Received-Date: Fri, 24 Apr 2015 12:18:52 -0000
Content-Type: text/plain

- Driver update to change the IRQ configuration options.
   This also fixes an issue with consecutive IRQ with some HW

Signed-off-by: Yaniv Machani <yanivma@ti.com>
---
 .../ti-compat-wireless-wl18xx.bb                   |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx.bb b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx.bb
index ec40f9d..23387d1 100644
--- a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx.bb
+++ b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx.bb
@@ -15,7 +15,7 @@ inherit module
 PR = "${MACHINE_KERNEL_PR}+f+gitr${SRCPV}"
 
 # Tags: R8.5
-SRCREV_wl18xx = "cb51164c672b1ecadef339b9f9b39e29ab706723"
+SRCREV_wl18xx = "ad69b45b9a670ee7f76be4def03895ac9b3a6d4a"
 BRANCH_wl18xx = "ap_p2p"
 SRCREV_backports = "0d46f43a2f3ccdd53de19eee5b9c674bf8ef09a2"
 BRANCH_backports = "ap_dfs_mbss_all"
-- 
1.7.0.4


