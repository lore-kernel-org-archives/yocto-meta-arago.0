Return-Path: <e-ruei1@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 2881752A1C
	for <meta-arago@arago-project.org>;
	Wed, 30 Oct 2019 19:57:18 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9UJtv5j109007
	for <meta-arago@arago-project.org>; Wed, 30 Oct 2019 14:55:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1572465357;
	bh=Zbe1q0oD3e+IqRszOf51xmuWf1v4cEK04Xs5qWmkSiA=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=tAHdG5CcJP8EKvfbIwSFBj0eI2dVgPSGRKxilh4e5CjqCKa/d+KAPQvO5QfCmozRN
	wLl3ZwBVeC9rmRn4sL2ShzwK1su4u4KJHz1/GseS2XVZn1qs8Mr1zG2RBD042IHKSB
	MZeCnOo2tAHHUO9OPw7Ba8qvkZ1PO4/DODgSH/OE=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9UJtvYF031256
	for <meta-arago@arago-project.org>; Wed, 30 Oct 2019 14:55:57 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 30 Oct 2019 14:55:44 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 30 Oct 2019 14:55:44 -0500
Received: from UDA0850410.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9UJtuwm112935
	for <meta-arago@arago-project.org>; Wed, 30 Oct 2019 14:55:56 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 30 Oct 2019 15:55:44 -0400
Message-ID: <20191030195550.17767-2-e-ruei1@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191030195550.17767-1-e-ruei1@ti.com>
References: <20191030195550.17767-1-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH v2 1/7] packagegroup-arago-xxx-qte-xxx: re-enable qtwebengine per EGL 1.5 for AM3/4/5
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
X-List-Received-Date: Wed, 30 Oct 2019 19:57:19 -0000
Content-Type: text/plain

qtwebengine 5.11.3 works well with mesa-based EGL 1.5 on AM3/4/5 although
there are still some display issues on AM6 (arm64).

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../packagegroups/packagegroup-arago-qte.bb          |  9 +++++----
 .../packagegroups/packagegroup-arago-tisdk-qte.bb    |  7 +++++--
 .../packagegroup-arago-qte-toolchain-target.bb       | 12 +++++++-----
 3 files changed, 17 insertions(+), 11 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
index 8cfcdfc3..b48b8c9f 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to add Qt embedded related packages"
 LICENSE = "MIT"
-PR = "r15"
+PR = "r16"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -41,6 +41,7 @@ QT5_ESSENTIALS = "\
     qtvirtualkeyboard-plugins \
     qtvirtualkeyboard-qmlplugins \
     qtwebkit-qmlplugins \
+    qtwebengine-qmlplugins \
     liberation-fonts \
     qtconnectivity \
     qtconnectivity-qmlplugins \
@@ -49,9 +50,9 @@ QT5_ESSENTIALS = "\
 #QT5_ESSENTIALS_append_k3 = "\
 #    qtwebkit-qmlplugins \
 #"
-#QT5_ESSENTIALS_remove_k3 = "\
-#    qtwebengine-qmlplugins \
-#"
+QT5_ESSENTIALS_remove_k3 = "\
+    qtwebengine-qmlplugins \
+"
 
 RDEPENDS_${PN} = "\
     ${@oe.utils.conditional('QT_PROVIDER', 'qt5', "${QT5_ESSENTIALS}", "${QT4_ESSENTIALS}", d)} \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
index 8c73a4be..09516693 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to add Qt embedded related packages"
 LICENSE = "MIT"
-PR = "r21"
+PR = "r22"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -23,13 +23,16 @@ QT5_DEMOS = "\
     qtsvg-examples \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'qtwayland-examples', '', d)} \
     qtwebkit-examples-examples \
+    qtwebengine-examples \
     qtserialport-examples \
     qtcharts-examples \
 "
 
 #QT5_DEMOS_append_k3 = " qtwebkit-examples-examples"
 #
-#QT5_DEMOS_remove_k3 = "\
+QT5_DEMOS_remove_k3 = "\
+    qtwebengine-examples \
+"
 #    qtwebbrowser \
 #    qtwebbrowser-examples \
 #    qtwebengine-examples \
diff --git a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bb b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bb
index a5ed1bff..a90f56c0 100644
--- a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bb
+++ b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Target packages for Qt Embedded SDK"
 LICENSE = "MIT"
 
-PR = "r15"
+PR = "r16"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -63,6 +63,8 @@ QT5_DEV = " \
         qtxmlpatterns-dev \
         qtwebkit-mkspecs \
         qtwebkit-dev \
+        qtwebengine-mkspecs \
+        qtwebengine-dev \
         qtserialport-mkspecs \
         qtserialport-dev  \
         qtcharts-mkspecs \
@@ -74,10 +76,10 @@ QT5_DEV = " \
 #        qtwebkit-dev \
 #"
 #
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
2.17.1


