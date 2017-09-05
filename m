Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id A5749529C8
	for <meta-arago@arago-project.org>;
	Tue,  5 Sep 2017 23:09:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 584152005C;
	Tue,  5 Sep 2017 23:09:55 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id pDWYF_VCM_X7; Tue,  5 Sep 2017 23:09:55 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 375CB209A4;
	Tue,  5 Sep 2017 23:09:54 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id A94BA1625EF;
	Tue,  5 Sep 2017 19:09:53 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Tue,  5 Sep 2017 19:09:52 -0400
Message-Id: <1504652992-35063-4-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1504652992-35063-1-git-send-email-denys@ti.com>
References: <1504652992-35063-1-git-send-email-denys@ti.com>
Subject: [morty/master][PATCH 4/4] packagegroup-*-qte*: remove QtWebKit dependency
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
X-List-Received-Date: Tue, 05 Sep 2017 23:09:56 -0000

Replaced with either QtWebEngine or full Chromium on A15 platforms.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-qte.bb             | 5 +----
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb       | 4 +---
 .../packagegroups/packagegroup-arago-qte-toolchain-target.bb         | 5 +----
 3 files changed, 3 insertions(+), 11 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
index f6788f3..fb38ab8 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to add Qt embedded related packages"
 LICENSE = "MIT"
-PR = "r12"
+PR = "r13"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -36,9 +36,6 @@ QT5_ESSENTIALS = "\
     qtmultimedia-qmlplugins \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'qtwayland-plugins', '', d)} \
     qt3d-qmlplugins \
-    qtwebkit-qmlplugins \
-    qtquick1-plugins \
-    qtquick1-qmlplugins \
     qtquickcontrols-qmlplugins \
     qtquickcontrols2-qmlplugins \
     qtgraphicaleffects-qmlplugins \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
index 30bac7b..f6f7468 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to add Qt embedded related packages"
 LICENSE = "MIT"
-PR = "r16"
+PR = "r17"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -20,14 +20,12 @@ QT5_DEMOS = "\
     qtdeclarative-tools \
     qtlocation-examples \
     qtmultimedia-examples \
-    qtquick1-examples \
     qtscript-examples \
     qtsvg-examples \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'qtwayland-examples', '', d)} \
     qtwebbrowser \
     qtwebbrowser-examples \
     qtwebengine-examples \
-    qtwebkit-examples-examples \
 "
 
 QT_DEMOS = "\
diff --git a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bb b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bb
index 73bae9d..88c5c6b 100644
--- a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bb
+++ b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Target packages for Qt Embedded SDK"
 LICENSE = "MIT"
 
-PR = "r11"
+PR = "r12"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -47,7 +47,6 @@ QT5_DEV = " \
         qtbase-mkspecs \
         qtdeclarative-mkspecs \
         qtscript-mkspecs \
-        qtwebkit-mkspecs \
         qt3d-mkspecs \
         qtlocation-mkspecs \
         qtsensors-mkspecs \
@@ -57,13 +56,11 @@ QT5_DEV = " \
         qtbase-staticdev \
         qtdeclarative-dev \
         qtscript-dev \
-        qtwebkit-dev \
         qt3d-dev \
         qtlocation-dev \
         qtsensors-dev \
         qtsvg-dev \
         qtxmlpatterns-dev \
-        qtquick1-dev \
         qtwebengine-mkspecs \
         qtwebengine-dev \
 "
-- 
2.7.4


