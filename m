Return-Path: <jake@ubuntu-quadshannondemopc5>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 0EA105299E
	for <meta-arago@arago-project.org>;
	Thu,  5 Mar 2015 18:31:51 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t25IVoN4009924
	for <meta-arago@arago-project.org>; Thu, 5 Mar 2015 12:31:50 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t25IVn9l008987
	for <meta-arago@arago-project.org>; Thu, 5 Mar 2015 12:31:49 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 5 Mar 2015 12:31:48 -0600
Received: from Ubuntu-QuadShannonDemoPC5 (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t25IVm2Y009666;	Thu, 5 Mar 2015 12:31:48 -0600
Received: from jake by Ubuntu-QuadShannonDemoPC5 with local (Exim 4.76)
	(envelope-from <jake@ubuntu-quadshannondemopc5>)	id 1YTaYm-0005C4-J4;
	Thu, 05 Mar 2015 13:31:48 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 5 Mar 2015 13:31:41 -0500
Message-ID: <1425580304-19919-3-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1425580304-19919-1-git-send-email-j-stiffler@ti.com>
References: <1425580304-19919-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [RFC v2 2/4] packagegroups: Implement WAYLAND_SUPPORT flag.
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
X-List-Received-Date: Thu, 05 Mar 2015 18:31:51 -0000
Content-Type: text/plain

* If WAYLAND_SUPPORT = 1, include wayland, weston, and qtwalyand
  plugins nad examples.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../packagegroups/packagegroup-arago-qte.bb        |    4 ++--
 .../packagegroup-arago-tisdk-graphics.bb           |    4 ++--
 .../packagegroups/packagegroup-arago-tisdk-qte.bb  |    4 ++--
 .../packagegroups/packagegroup-linaro-tc-test.bb   |    5 +++--
 4 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
index 9618de5..d5cfdef 100644
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
+    ${@base_conditional('WAYLAND_SUPPORT', '1', 'qtwayland-plugins', '', d)} \
     qt3d-qmlplugins \
     qtwebkit-qmlplugins \
     qtquick1-plugins \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
index f854596..18d7edd 100644
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
+    ${@base_conditional('WAYLAND_SUPPORT', '1', "${GRAPHICS_WESTON}", '', d)} \
     ${GRAPHICS_RDEPENDS} \
     ${GRAPHICS_BLTSVILLE} \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
index eeb32fb..4fb9e1e 100644
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
+    ${@base_conditional('WAYLAND_SUPPORT', '1', 'qtwayland-examples', '', d)} \
     qtwebkit-examples-examples \
     qtquick1-examples \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-linaro-tc-test.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-linaro-tc-test.bb
index 8fd863e..818909f 100644
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
+    ${@base_conditional('WAYLAND_SUPPORT', '1', 'wayland weston', '', d)} \
     gstreamer \
     openssl \
     openssh \
-- 
1.7.9.5


