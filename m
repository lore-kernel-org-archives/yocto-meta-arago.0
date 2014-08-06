Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTP id 22834529DD
	for <meta-arago@arago-project.org>;
	Wed,  6 Aug 2014 22:53:56 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [72.66.25.89])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N9W000HNQ9RW260@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 06 Aug 2014 17:53:52 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 3BB182016B; Wed,
	06 Aug 2014 18:53:51 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 06 Aug 2014 18:53:44 -0400
Message-id: <1407365627-29059-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.4
Subject: [PATCH 1/4] packagegroups: conditionally disable dual-camera and image-gallery for Qt5 builds
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
X-List-Received-Date: Wed, 06 Aug 2014 22:54:02 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb    | 5 ++---
 .../packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb    | 5 ++---
 .../packagegroups/packagegroup-arago-tisdk-multimedia.bb             | 5 ++---
 3 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index ae502f1..109e1ad 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to include Matrix v2"
 LICENSE = "MIT"
-PR = "r29"
+PR = "r30"
 
 inherit packagegroup
 
@@ -77,8 +77,7 @@ MATRIX_APPS_append_ti43x = "        \
     matrix-multimedia-demo-mpeg4aacdec \
     matrix-multimedia-demo-mpeg4dec \
                                     \
-    matrix-gui-apps-dual-camera     \
-    matrix-gui-apps-image-gallery   \
+    ${@base_conditional('QT_PROVIDER', 'qt5', '', 'matrix-gui-apps-dual-camera matrix-gui-apps-image-gallery', d)} \
                                     \
     matrix-gui-generic-pm           \
     matrix-gui-pm-demos-suspend     \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
index 307e712..40aa486 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to add multimedia related sources into the SDK"
 LICENSE = "MIT"
-PR = "r4"
+PR = "r5"
 
 inherit packagegroup
 
@@ -17,8 +17,7 @@ MULTIMEDIA_append_am3517-evm = " \
 "
 
 MULTIMEDIA_append_ti43x = " \
-    dual-camera-demo-src \
-    image-gallery-src \
+    ${@base_conditional('QT_PROVIDER', 'qt5', '', 'dual-camera-demo-src image-gallery-src', d)} \
 "
 
 RDEPENDS_${PN} = "\
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
index 417b0a8..7016ec0 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to add multimedia related packages"
 LICENSE = "MIT"
-PR = "r8"
+PR = "r9"
 
 inherit packagegroup
 
@@ -18,8 +18,7 @@ MULTIMEDIA_append_ti33x = " \
 
 MULTIMEDIA_append_ti43x = " \
     amsdk-av-files \
-    dual-camera-demo \
-    image-gallery \
+    ${@base_conditional('QT_PROVIDER', 'qt5', '', 'dual-camera-demo image-gallery', d)} \
 "
 
 MULTIMEDIA_append_omap-a15 = " \
-- 
2.0.4


