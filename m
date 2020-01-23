Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id C1EEE52995
	for <meta-arago@arago-project.org>;
	Thu, 23 Jan 2020 21:53:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 670FA40BF7;
	Thu, 23 Jan 2020 21:51:32 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id DelOlbSMCMan; Thu, 23 Jan 2020 21:51:32 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 50FA9400E8;
	Thu, 23 Jan 2020 21:51:31 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 008871743A7;
	Thu, 23 Jan 2020 16:51:30 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 23 Jan 2020 16:51:30 -0500
Message-Id: <1579816290-4616-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [RFC][PATCH] packagegroups: move extra qtwebengine and qtbrowser out of default rootfs
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
X-List-Received-Date: Thu, 23 Jan 2020 21:53:22 -0000

From: Denys Dmytriyenko <denys@ti.com>

Make them part of ti-world, while default rootfs should only have qtwebkit now.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-qte.bb      |  8 --------
 .../packagegroups/packagegroup-arago-tisdk-qte.bb             | 11 -----------
 meta-arago-distro/recipes-core/packagegroups/ti-world.bb      |  8 +++++++-
 3 files changed, 7 insertions(+), 20 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
index 5984fee..bf8124d 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
@@ -41,19 +41,11 @@ QT5_ESSENTIALS = "\
     qtvirtualkeyboard-plugins \
     qtvirtualkeyboard-qmlplugins \
     qtwebkit-qmlplugins \
-    qtwebengine-qmlplugins \
     liberation-fonts \
     qtconnectivity \
     qtconnectivity-qmlplugins \
 "
 
-#QT5_ESSENTIALS_append_k3 = "\
-#    qtwebkit-qmlplugins \
-#"
-#QT5_ESSENTIALS_remove_k3 = "\
-#    qtwebengine-qmlplugins \
-#"
-
 RDEPENDS_${PN} = "\
     ${@oe.utils.conditional('QT_PROVIDER', 'qt5', "${QT5_ESSENTIALS}", "${QT4_ESSENTIALS}", d)} \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
index fbc5f12..e057267 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
@@ -22,21 +22,10 @@ QT5_DEMOS = "\
     qtsvg-examples \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'qtwayland-examples', '', d)} \
     qtwebkit-examples-examples \
-    qtwebengine-examples \
-    qtwebbrowser \
-    qtwebbrowser-examples \
     qtserialport-examples \
     qtcharts-examples \
 "
 
-#QT5_DEMOS_append_k3 = " qtwebkit-examples-examples"
-#
-#QT5_DEMOS_remove_k3 = "\
-#    qtwebbrowser \
-#    qtwebbrowser-examples \
-#    qtwebengine-examples \
-#"
-
 QT_DEMOS = "\
     qt-tstat \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-world.bb b/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
index fb20b89..2bba82b 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
@@ -11,11 +11,16 @@ CHROMIUM = ""
 CHROMIUM_append_omap-a15 = "\
     chromium-ozone-wayland \
 "
-
 CHROMIUM_append_k3 = "\
     chromium-ozone-wayland \
 "
 
+EXTRABROWSERS = " \
+    qtwebbrowser-examples \
+    qtwebengine-qmlplugins \
+    qtwebengine-examples \
+"
+
 DEVTOOLS = " \
     linux-libc-headers-dev \
     packagegroup-core-buildessential \
@@ -44,6 +49,7 @@ RDEPENDS_${PN} = "\
     packagegroup-arago-tisdk-addons-extra \
     ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-tisdk-hmi','packagegroup-arago-base-tisdk-server-extra',d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', "${CHROMIUM}", '', d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES','gpu',"${EXTRABROWSERS}",'',d)} \
     ${@bb.utils.contains('MACHINE_FEATURES', 'gpu dsp', 'qt-opencv-opencl-opengl-multithreaded-dev', '', d)} \
     ${DEVTOOLS} \
     ${@bb.utils.contains('TUNE_FEATURES', 'armv7a', 'valgrind', '', d)} \
-- 
2.7.4


