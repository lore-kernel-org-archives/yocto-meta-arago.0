Return-Path: <a0866934local@udb0866934>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id C809452A89
	for <meta-arago@arago-project.org>;
	Thu, 12 Mar 2015 12:56:04 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2CCu3aQ023623
	for <meta-arago@arago-project.org>; Thu, 12 Mar 2015 07:56:03 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2CCu2HO007402
	for <meta-arago@arago-project.org>; Thu, 12 Mar 2015 07:56:02 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 12 Mar 2015 07:56:02 -0500
Received: from udb0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2CCu24T025919;
	Thu, 12 Mar 2015 07:56:02 -0500
Received: from a0866934local by udb0866934 with local (Exim 4.76)
	(envelope-from <a0866934local@udb0866934>)	id 1YW2eg-0005k3-2z;
	Thu, 12 Mar 2015 08:56:02 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 12 Mar 2015 08:55:55 -0400
Message-ID: <1426164957-22030-3-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1426164957-22030-1-git-send-email-j-stiffler@ti.com>
References: <1426164957-22030-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] qtbase: Use DISTRO_FEATURES to set appropriate qpa.
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
X-List-Received-Date: Thu, 12 Mar 2015 12:56:05 -0000
Content-Type: text/plain

* If wayland is in DISTRO_FEATURES, then configure '-qpa wayland'
* Otherwise configure '-qpa eglfs'

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-distro/recipes-qt/qt5/qtbase/qt_env.sh  |    1 -
 .../recipes-qt/qt5/qtbase_5.4.1.bbappend           |    9 ++++++---
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase/qt_env.sh b/meta-arago-distro/recipes-qt/qt5/qtbase/qt_env.sh
index 1e8c196..f888d50 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtbase/qt_env.sh
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase/qt_env.sh
@@ -2,4 +2,3 @@
 
 ### QT Environment Variables ###
 export QT_QPA_GENERIC_PLUGINS=Auto
-export QT_QPA_PLATFORM=wayland
diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase_5.4.1.bbappend b/meta-arago-distro/recipes-qt/qt5/qtbase_5.4.1.bbappend
index a466581..5a00800 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtbase_5.4.1.bbappend
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase_5.4.1.bbappend
@@ -1,13 +1,16 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 GLES_EXTRA_DEPS = ""
-GLES_EXTRA_DEPS_omap-a15 = "libdrm wayland"
+GLES_EXTRA_DEPS_omap-a15 = " \
+    libdrm \
+    ${@base_contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)} \
+"
 
 PACKAGECONFIG[gles2] = "-opengl es2 -eglfs,,virtual/libgles2 virtual/egl ${GLES_EXTRA_DEPS}"
 
-PR_append = "-arago3"
+PR_append = "-arago4"
 
-QT_CONFIG_FLAGS += "-qpa wayland"
+QT_CONFIG_FLAGS += "-qpa ${@base_contains('DISTRO_FEATURES', 'wayland', 'wayland', 'eglfs', d)}"
 
 SRC_URI += "file://qt_env.sh"
 
-- 
1.7.9.5


