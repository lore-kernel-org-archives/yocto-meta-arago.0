Return-Path: <a0866934local@udb0866934>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 50EFD52A85
	for <meta-arago@arago-project.org>;
	Fri, 13 Mar 2015 12:05:20 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2DC5JuV031958
	for <meta-arago@arago-project.org>; Fri, 13 Mar 2015 07:05:19 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2DC5IF6018129
	for <meta-arago@arago-project.org>; Fri, 13 Mar 2015 07:05:18 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 13 Mar 2015 07:05:18 -0500
Received: from udb0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2DC5IE9016146;
	Fri, 13 Mar 2015 07:05:18 -0500
Received: from a0866934local by udb0866934 with local (Exim 4.76)
	(envelope-from <a0866934local@udb0866934>)	id 1YWOL7-0007Q3-VS;
	Fri, 13 Mar 2015 08:05:18 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 13 Mar 2015 08:05:13 -0400
Message-ID: <1426248313-28486-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1426248313-28486-1-git-send-email-j-stiffler@ti.com>
References: <1426248313-28486-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] packagegroup-arago-tisdk-matrix: Change conditions for including ts-calibrate-init.
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
X-List-Received-Date: Fri, 13 Mar 2015 12:05:20 -0000
Content-Type: text/plain

* Include if wayland not a DISTRO_FEATURE.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../packagegroup-arago-tisdk-matrix.bb             |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index d8386f5..094d93a 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to include Matrix v2"
 LICENSE = "MIT"
-PR = "r36"
+PR = "r37"
 
 inherit packagegroup
 
@@ -49,7 +49,7 @@ MATRIX_APPS_append_omap3 = "        \
     matrix-multimedia-demo-h264dec      \
     matrix-multimedia-demo-mpeg4aacdec   \
     matrix-multimedia-demo-mpeg4dec     \
-    ${@base_conditional('QT_PROVIDER', 'qt5', '', 'ts-calibrate-init', d)} \
+    ${@base_contains('DISTRO_FEATURES', 'wayland', '', 'ts-calibrate-init', d)} \
 "
 
 MATRIX_APPS_append_ti33x = "        \
@@ -66,7 +66,7 @@ MATRIX_APPS_append_ti33x = "        \
     matrix-gui-clocks               \
     matrix-gui-pm-demos-governor    \
                                     \
-    ${@base_conditional('QT_PROVIDER', 'qt5', '', 'ts-calibrate-init', d)} \
+    ${@base_conditional('WAYLAND_SUPPORT', '1', '', 'ts-calibrate-init', d)} \
 "
 
 MATRIX_APPS_append_ti43x = "        \
@@ -84,7 +84,7 @@ MATRIX_APPS_append_ti43x = "        \
     matrix-gui-pm-demos-governor    \
     matrix-gui-apps-dual-camera     \
     matrix-gui-apps-image-gallery   \
-    ${@base_conditional('QT_PROVIDER', 'qt5', '', 'ts-calibrate-init', d)} \
+    ${@base_conditional('WAYLAND_SUPPORT', '1', '', 'ts-calibrate-init', d)} \
 "
 
 MATRIX_APPS_append_omap-a15 = "     \
-- 
1.7.9.5


