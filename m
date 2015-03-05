Return-Path: <jake@ubuntu-quadshannondemopc5>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id BB43152A52
	for <meta-arago@arago-project.org>;
	Thu,  5 Mar 2015 13:33:53 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t25DXrTF029858
	for <meta-arago@arago-project.org>; Thu, 5 Mar 2015 07:33:53 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t25DXpKX018510
	for <meta-arago@arago-project.org>; Thu, 5 Mar 2015 07:33:51 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 5 Mar 2015 07:33:51 -0600
Received: from Ubuntu-QuadShannonDemoPC5 (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t25DXpO8023265;	Thu, 5 Mar 2015 07:33:51 -0600
Received: from jake by Ubuntu-QuadShannonDemoPC5 with local (Exim 4.76)
	(envelope-from <jake@ubuntu-quadshannondemopc5>)	id 1YTVuR-0002aB-Dc;
	Thu, 05 Mar 2015 08:33:51 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 5 Mar 2015 08:33:27 -0500
Message-ID: <1425562410-19688-3-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1425562410-19688-1-git-send-email-j-stiffler@ti.com>
References: <1425562410-19688-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [RFC 2/4] packagegroups: Add wayland/weston based on ARAGO_QT_PLATFORM.
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
X-List-Received-Date: Thu, 05 Mar 2015 13:33:54 -0000
Content-Type: text/plain

* If ARAGO_QT_PLATFORM = wayland, include wayland and weston.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../packagegroups/packagegroup-arago-qte.bb        |    4 ++--
 .../packagegroup-arago-tisdk-graphics.bb           |    4 ++--
 .../packagegroups/packagegroup-arago-tisdk-qte.bb  |    4 ++--
 .../packagegroups/packagegroup-linaro-tc-test.bb   |    5 +++--
 4 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
index 9618de5..3007836 100644
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
+    ${@base_conditional('ARAGO_QT_PLATFORM', 'wayland', 'qtwayland-plugins', '', d)} \
     qt3d-qmlplugins \
     qtwebkit-qmlplugins \
     qtquick1-plugins \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
index f854596..c17f5c4 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install graphics binaries"
 LICENSE = "MIT"
-PR = "r7"
+PR = "r8"
 
 inherit packagegroup
 
@@ -48,7 +48,7 @@ GRAPHICS_BLTSVILLE_omap-a15 = " \
     "
 
 RDEPENDS_${PN} = "\
-    ${@base_conditional('QT_PROVIDER', 'qt4e', "", "${GRAPHICS_WESTON}", d)} \
+    ${@base_conditional('QT_PROVIDER', 'qt4e', "", base_conditional('ARAGO_QT_PLATFORM', 'wayland', "${GRAPHICS_WESTON}", '', d), d)} \
     ${GRAPHICS_RDEPENDS} \
     ${GRAPHICS_BLTSVILLE} \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
index eeb32fb..ac8eaa0 100644
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
+    ${@base_conditional('ARAGO_QT_PLATFORM', 'wayland', 'qtwayland-examples', '', d)} \
     qtwebkit-examples-examples \
     qtquick1-examples \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-linaro-tc-test.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-linaro-tc-test.bb
index 8fd863e..d813c8a 100644
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
+    ${@base_conditional('ARAGO_QT_PLATFORM', 'wayland', 'wayland weston', '', d)} \
     gstreamer \
     openssl \
     openssh \
-- 
1.7.9.5


