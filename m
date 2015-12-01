Return-Path: <e-ruei1@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 7296052A22
	for <meta-arago@arago-project.org>;
	Tue,  1 Dec 2015 15:30:38 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id tB1FUaTU030966
	for <meta-arago@arago-project.org>; Tue, 1 Dec 2015 09:30:36 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id tB1FUanB029366
	for <meta-arago@arago-project.org>; Tue, 1 Dec 2015 09:30:36 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 1 Dec 2015 09:30:36 -0600
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	tB1FUY6v003898	for <meta-arago@arago-project.org>;
	Tue, 1 Dec 2015 09:30:36 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 1 Dec 2015 10:30:18 -0500
Message-ID: <1448983818-21402-6-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1448983818-21402-1-git-send-email-e-ruei1@ti.com>
References: <1448983818-21402-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
Subject: [PATCH V2 5/5] ti-tisdk-makefile: Include omapdrm-pvr related make instructions only if SGX is available
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
X-List-Received-Date: Tue, 01 Dec 2015 15:30:41 -0000
Content-Type: text/plain

Enable non-SGX build for AM3/AM4:
For ti43x and ti33x: Include SGX DDK kernel module omapdrm-pvr related make instructions
                     only if SGX is included at MACHINE_FEATURES

Signed-off-by: Eric Ruei <a0850410@uda0850410>
---
 .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb      | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 024e3cd..d2a1409 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -44,7 +44,7 @@ SRC_URI = "\
     file://Makefile_pru-icss \
 "
 
-PR = "r61"
+PR = "r62"
 
 MAKEFILES_MATRIX_GUI = "matrix-gui-browser \
                         refresh-screen \
@@ -81,7 +81,7 @@ MAKEFILES_append_ti33x = " u-boot-spl \
                            ti-crypto-examples \
                            linux-dtbs \
                            cryptodev \
-                           omapdrm-pvr \
+                           ${@base_contains('MACHINE_FEATURES', 'sgx', 'omapdrm-pvr', ' ', d)} \
                            pru-icss \
 "
 MAKEFILES_append_ti43x = " u-boot-spl \
@@ -91,7 +91,7 @@ MAKEFILES_append_ti43x = " u-boot-spl \
                            cryptodev \
                            dual-camera-demo \
                            image-gallery \
-                           omapdrm-pvr \
+                           ${@base_contains('MACHINE_FEATURES', 'sgx', 'omapdrm-pvr', ' ', d)} \
                            pru-icss \
 "
 
@@ -134,7 +134,7 @@ PLATFORM_OMAPDRM_omap-a15 = "omap5430"
 
 PVR_NULLDRM = ""
 PVR_NULLDRM_ti33x = "1"
-PVR_NULLDRM_ti43x = "1"
+PVR_NULLDRM_ti43x = "0"
 PVR_NULLDRM_omap-a15 = "0"
 
 PLATFORM_DEBUGSS = ""
-- 
1.9.1


