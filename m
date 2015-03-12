Return-Path: <a0866934local@udb0866934>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 7616252A78
	for <meta-arago@arago-project.org>;
	Thu, 12 Mar 2015 12:56:03 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2CCu2xW017428
	for <meta-arago@arago-project.org>; Thu, 12 Mar 2015 07:56:02 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2CCu1wd007384
	for <meta-arago@arago-project.org>; Thu, 12 Mar 2015 07:56:01 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 12 Mar 2015 07:56:01 -0500
Received: from udb0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2CCu1Kg017014;
	Thu, 12 Mar 2015 07:56:01 -0500
Received: from a0866934local by udb0866934 with local (Exim 4.76)
	(envelope-from <a0866934local@udb0866934>)	id 1YW2ef-0005k0-7W;
	Thu, 12 Mar 2015 08:56:01 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 12 Mar 2015 08:55:54 -0400
Message-ID: <1426164957-22030-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1426164957-22030-1-git-send-email-j-stiffler@ti.com>
References: <1426164957-22030-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 1/4] packagegroup-*: Include wayland/weston if specified in DISTRO_FEATURES.
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
X-List-Received-Date: Thu, 12 Mar 2015 12:56:03 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../packagegroups/packagegroup-arago-qte.bb        |    4 ++--
 .../packagegroup-arago-tisdk-graphics.bb           |    4 ++--
 .../packagegroups/packagegroup-arago-tisdk-qte.bb  |    4 ++--
 .../packagegroups/packagegroup-linaro-tc-test.bb   |    5 +++--
 4 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
index 9618de5..149dfac 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to add Qt embedded related packages"
 LICENSE = "MIT"
-PR = "r8"
+PR = "r9"
 
 inherit packagegroup
 
@@ -34,7 +34,7 @@ QT5_ESSENTIALS = "\
     qtlocation-qmlplugins \
     qtmultimedia-plugins \
     qtmultimedia-qmlplugins \
-    qtwayland-plugins \
+    ${@base_contains('DISTRO_FEATURES', 'wayland', 'qtwayland-plugins', '', d)} \
     qt3d-qmlplugins \
     qtwebkit-qmlplugins \
     qtquick1-plugins \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
index 74b8417..327a11b 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install graphics binaries"
 LICENSE = "MIT"
-PR = "r7"
+PR = "r8"
 
 inherit packagegroup
 
@@ -43,6 +43,6 @@ GRAPHICS_RDEPENDS_omap-a15 = "\
 #    omapdrm-pvr
 
 RDEPENDS_${PN} = "\
-    ${@base_conditional('QT_PROVIDER', 'qt4e', "", "${GRAPHICS_WESTON}", d)} \
+    ${@base_contains('DISTRO_FEATURES', 'wayland', "${GRAPHICS_WESTON}", '', d)} \
     ${GRAPHICS_RDEPENDS} \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
index eeb32fb..ac84008 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to add Qt embedded related packages"
 LICENSE = "MIT"
-PR = "r11"
+PR = "r12"
 
 inherit packagegroup
 
@@ -22,7 +22,7 @@ QT5_DEMOS = "\
     qtlocation-examples \
     qtmultimedia-examples \
     qtscript-examples \
-    qtwayland-examples \
+    ${@base_contains('DISTRO_FEATURES', 'wayland', 'qtwayland-examples', '', d)} \
     qtwebkit-examples-examples \
     qtquick1-examples \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-linaro-tc-test.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-linaro-tc-test.bb
index 8fd863e..68e7ab0 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-linaro-tc-test.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-linaro-tc-test.bb
@@ -1,6 +1,8 @@
 DESCRIPTION = "Group of packages to build with Linaro toolchain for testing"
 LICENSE = "MIT"
 
+PR = "r1"
+
 inherit packagegroup
 
 RDEPENDS_${PN} = "\
@@ -10,8 +12,7 @@ RDEPENDS_${PN} = "\
     bash \
     coreutils \
     apache \
-    wayland \
-    weston \
+    ${@base_contains('DISTRO_FEATURES', 'wayland', 'wayland weston', '', d)} \
     gstreamer \
     openssl \
     openssh \
-- 
1.7.9.5


