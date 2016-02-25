Return-Path: <e-ruei1@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 7EDD7529CF
	for <meta-arago@arago-project.org>;
	Thu, 25 Feb 2016 19:52:51 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u1PJqoXD026096
	for <meta-arago@arago-project.org>; Thu, 25 Feb 2016 13:52:50 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1PJqo6g019429
	for <meta-arago@arago-project.org>; Thu, 25 Feb 2016 13:52:50 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 25 Feb 2016 13:52:50 -0600
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u1PJqj9U001762	for <meta-arago@arago-project.org>;
	Thu, 25 Feb 2016 13:52:48 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 25 Feb 2016 14:52:42 -0500
Message-ID: <1456429962-17649-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] tisdk Makefile: Replace PVR_NULLDRM with TARGET_PRODUCT per graphics DDK change
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
X-List-Received-Date: Thu, 25 Feb 2016 19:52:51 -0000
Content-Type: text/plain

PVR_NULLDRM is only applicable for DDK 1.9 and is no longer used.
TARGET_PRODUCT is required for omapdrm-pvr build per DDK 1.14

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb       | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index bcd78ba..a9ced7e 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -156,10 +156,9 @@ PLATFORM_OMAPDRM_ti33x = "omap335x"
 PLATFORM_OMAPDRM_ti43x = "omap437x"
 PLATFORM_OMAPDRM_omap-a15 = "omap5430"
 
-PVR_NULLDRM = ""
-PVR_NULLDRM_ti33x = "1"
-PVR_NULLDRM_ti43x = "0"
-PVR_NULLDRM_omap-a15 = "0"
+TARGET_PRODUCT = "jacinto6evm"
+TARGET_PRODUCT_ti33x = "ti335x"
+TARGET_PRODUCT_ti43x = "ti437x"
 
 PLATFORM_DEBUGSS = ""
 PLATFORM_DEBUGSS_dra7xx = "DRA7xx_PLATFORM"
-- 
1.9.1


