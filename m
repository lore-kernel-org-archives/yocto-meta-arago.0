Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 9B0CD52A2C
	for <meta-arago@arago-project.org>;
	Tue, 16 Apr 2019 20:40:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0635540BB6;
	Tue, 16 Apr 2019 20:40:25 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id FUBh5EbOn5n5; Tue, 16 Apr 2019 20:40:24 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D0DA940B0A;
	Tue, 16 Apr 2019 20:40:23 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 0C67A16D9CF;
	Tue, 16 Apr 2019 16:40:13 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Tue, 16 Apr 2019 16:40:12 -0400
Message-Id: <1555447212-41398-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud/master][PATCH] packagegroups, matrix: re-enable qtwebkit for k3
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
X-List-Received-Date: Tue, 16 Apr 2019 20:40:47 -0000

This reverts commit f75e0c1068e18c9ead6f9e39e5cf91800325dbd8.
---
 .../recipes-core/packagegroups/packagegroup-arago-qte.bb | 12 ++++++------
 .../packagegroups/packagegroup-arago-tisdk-matrix.bb     |  8 ++++----
 .../packagegroups/packagegroup-arago-tisdk-qte.bb        | 12 ++++++------
 .../recipes-core/matrix/matrix-gui-browser_2.0.bb        |  6 +++---
 .../packagegroup-arago-qte-toolchain-target.bb           | 16 ++++++++--------
 5 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
index 992b0b7..c038a16 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
@@ -46,12 +46,12 @@ QT5_ESSENTIALS = "\
     qtconnectivity-qmlplugins \
 "
 
-#QT5_ESSENTIALS_append_k3 = "\
-#    qtwebkit-qmlplugins \
-#"
-#QT5_ESSENTIALS_remove_k3 = "\
-#    qtwebengine-qmlplugins \
-#"
+QT5_ESSENTIALS_append_k3 = "\
+    qtwebkit-qmlplugins \
+"
+QT5_ESSENTIALS_remove_k3 = "\
+    qtwebengine-qmlplugins \
+"
 
 RDEPENDS_${PN} = "\
     ${@oe.utils.conditional('QT_PROVIDER', 'qt5', "${QT5_ESSENTIALS}", "${QT4_ESSENTIALS}", d)} \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index 02eaa97..1e54361 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -45,10 +45,10 @@ MATRIX_TOUCH_APPS = " \
 
 MATRIX_QT_APPS_keystone = ""
 MATRIX_QT_APPS_omapl138 = ""
-#MATRIX_QT_APPS_remove_k3 = "matrix-qt5-demo-browser"
-#MATRIX_QT_APPS_append_k3 = " \
-#    matrix-qt5-demo-webkit-browser \
-#"
+MATRIX_QT_APPS_remove_k3 = "matrix-qt5-demo-browser"
+MATRIX_QT_APPS_append_k3 = " \
+    matrix-qt5-demo-webkit-browser \
+"
 
 MATRIX_SGX_DEMOS = " \
     matrix-3d-demo-chameleon \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
index 36cfca9..43a0d02 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
@@ -28,13 +28,13 @@ QT5_DEMOS = "\
     qtserialport-examples \
 "
 
-#QT5_DEMOS_append_k3 = " qtwebkit-examples-examples"
+QT5_DEMOS_append_k3 = " qtwebkit-examples-examples"
 
-#QT5_DEMOS_remove_k3 = "\
-#    qtwebbrowser \
-#    qtwebbrowser-examples \
-#    qtwebengine-examples \
-#"
+QT5_DEMOS_remove_k3 = "\
+    qtwebbrowser \
+    qtwebbrowser-examples \
+    qtwebengine-examples \
+"
 
 QT_DEMOS = "\
     qt-tstat \
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
index 9635429..9ceaa56 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
@@ -10,14 +10,14 @@ inherit qt-provider
 RDEPENDS_${PN} += "${QT_RDEPENDS_FONTS}"
 
 DEPENDS += "${QT_DEPENDS_WEBENGINE}"
-#DEPENDS_k3 += "${QT_DEPENDS_WEBKIT}"
-#DEPENDS_remove_k3 = "${QT_DEPENDS_WEBENGINE}"
+DEPENDS_k3 += "${QT_DEPENDS_WEBKIT}"
+DEPENDS_remove_k3 = "${QT_DEPENDS_WEBENGINE}"
 
 PR = "r16"
 
 QT4_SRCREV = "83019b46fb3dec1a12667d251d35ba8682953a79"
 QT5_SRCREV = "d3ecf8d0dff3e4f901d588ea0dfe485733dfc9dc"
-#QT5_SRCREV_k3 = "78ad5db716d1abc4c05abfe435f066b6b88454d5"
+QT5_SRCREV_k3 = "78ad5db716d1abc4c05abfe435f066b6b88454d5"
 
 
 SRCREV = "${@oe.utils.conditional('QT_PROVIDER', 'qt5', "${QT5_SRCREV}", "${QT4_SRCREV}", d)}"
diff --git a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bb b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bb
index 5add6f9..2afc974 100644
--- a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bb
+++ b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bb
@@ -67,15 +67,15 @@ QT5_DEV = " \
         qtserialport-dev  \
 "
 
-#QT5_DEV_append_k3 = " \
-#        qtwebkit-mkspecs \
-#        qtwebkit-dev \
-#"
+QT5_DEV_append_k3 = " \
+        qtwebkit-mkspecs \
+        qtwebkit-dev \
+"
 
-#QT5_DEV_remove_k3 = " \
-#        qtwebengine-mkspecs \
-#        qtwebengine-dev \
-#"
+QT5_DEV_remove_k3 = " \
+        qtwebengine-mkspecs \
+        qtwebengine-dev \
+"
 
 RDEPENDS_${PN} += " \
         ${@oe.utils.conditional('QT_PROVIDER', 'qt5', "${QT5_DEV}", "${QT4_DEV}", d)} \
-- 
2.7.4


