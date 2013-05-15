Return-Path: <hzhang@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id AEAE952A39
	for <meta-arago@arago-project.org>;
	Wed, 15 May 2013 18:32:32 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r4FIWVY9024448
	for <meta-arago@arago-project.org>; Wed, 15 May 2013 13:32:31 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r4FIWVvH021282
	for <meta-arago@arago-project.org>; Wed, 15 May 2013 13:32:31 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 15 May 2013 13:32:31 -0500
Received: from ares-ubuntu.am.dhcp.ti.com (ares-ubuntu.am.dhcp.ti.com
	[158.218.103.17])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	r4FIWVTl025835;	Wed, 15 May 2013 13:32:31 -0500
Received: from a0868496 by ares-ubuntu.am.dhcp.ti.com with local (Exim 4.76)
	(envelope-from <hzhang@ti.com>)	id 1UcgV4-0007wm-Ov; Wed, 15 May 2013
	14:32:30 -0400
From: <hzhang@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 15 May 2013 14:32:28 -0400
Message-ID: <1368642748-30517-1-git-send-email-hzhang@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] packagegroup-arago-tisdk-matrix: remove ethernet menu from common apps
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
X-List-Received-Date: Wed, 15 May 2013 18:32:33 -0000
Content-Type: text/plain

From: Hao Zhang <hzhang@ti.com>

---
 .../packagegroup-arago-tisdk-matrix.bb             |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index dda72af..2b40f98 100755
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to include Matrix v2"
 LICENSE = "MIT"
-PR = "r15"
+PR = "r16"
 
 inherit packagegroup
 
@@ -22,7 +22,6 @@ MATRIX_COMMON_APPS = "              \
     matrix-gui-oprofile-demos       \
     matrix-gui-settings-demos       \
     matrix-gui-usb-demos            \
-    matrix-gui-submenus-ethernet    \
 "
 
 MATRIX_QT_APPS = "                  \
@@ -47,6 +46,7 @@ MATRIX_APPS_append_omap3 = "        \
 "
 
 MATRIX_APPS_append_ti33x = "        \
+    matrix-gui-submenus-ethernet    \
     matrix-gui-ethernet-demos       \
     ${@base_contains('MACHINE_FEATURES','sgx','${MATRIX_SGX_DEMOS}','',d)} \
     matrix-gui-multimedia-demos     \
-- 
1.7.9.5


