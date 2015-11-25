Return-Path: <e-ruei1@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 7F4C052AB4
	for <meta-arago@arago-project.org>;
	Wed, 25 Nov 2015 23:08:05 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id tAPN84ik012562
	for <meta-arago@arago-project.org>; Wed, 25 Nov 2015 17:08:04 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id tAPN84qf026973
	for <meta-arago@arago-project.org>; Wed, 25 Nov 2015 17:08:04 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 25 Nov 2015 17:08:04 -0600
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	tAPN83ph018422	for <meta-arago@arago-project.org>;
	Wed, 25 Nov 2015 17:08:04 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 25 Nov 2015 18:07:59 -0500
Message-ID: <1448492879-1050-6-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1448492879-1050-1-git-send-email-e-ruei1@ti.com>
References: <1448492879-1050-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
Subject: [PATCH 5/5] ti-tisdk-makefile: Define PVR_NULLDRM based on the availability of SGX
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
X-List-Received-Date: Wed, 25 Nov 2015 23:08:07 -0000
Content-Type: text/plain

From: Eric Ruei <a0850410@uda0850410>

Enable non-SGX build for AM3/AM4:
For ti43x: Set PVR_NULLDRM to 1 only if SGX is not included at MACHINE_FEATURES

Signed-off-by: Eric Ruei <a0850410@uda0850410>
---
 .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 024e3cd..0e77202 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -44,7 +44,7 @@ SRC_URI = "\
     file://Makefile_pru-icss \
 "
 
-PR = "r61"
+PR = "r62"
 
 MAKEFILES_MATRIX_GUI = "matrix-gui-browser \
                         refresh-screen \
@@ -134,7 +134,7 @@ PLATFORM_OMAPDRM_omap-a15 = "omap5430"
 
 PVR_NULLDRM = ""
 PVR_NULLDRM_ti33x = "1"
-PVR_NULLDRM_ti43x = "1"
+PVR_NULLDRM_ti43x = "${@base_contains('MACHINE_FEATURES', 'sgx', '0', '1', d)}"
 PVR_NULLDRM_omap-a15 = "0"
 
 PLATFORM_DEBUGSS = ""
-- 
1.9.1


