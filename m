Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id C2F0352981
	for <meta-arago@arago-project.org>;
	Wed, 13 Aug 2014 19:46:20 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7DJkK82007512
	for <meta-arago@arago-project.org>; Wed, 13 Aug 2014 14:46:20 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7DJkKRl007113
	for <meta-arago@arago-project.org>; Wed, 13 Aug 2014 14:46:20 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 13 Aug 2014 14:46:19 -0500
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s7DJkI6l015821;	Wed, 13 Aug 2014 14:46:19 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id s7DJkFTr012731;	Thu, 14 Aug 2014 01:16:17 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 13 Aug 2014 14:46:08 -0500
Message-ID: <1407959172-16985-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1407959172-16985-1-git-send-email-fcooper@ti.com>
References: <1407959172-16985-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 2/6] qtbase: Add global environment variable script
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
X-List-Received-Date: Wed, 13 Aug 2014 19:46:21 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

* There are important Qt environment variables that needs to be set and those
  variables are only being set within Matrix's init script.
* This causes problems when your trying to manually run a Qt application
  outside of Matrix since you need to manually export the proper Qt specific
  environment variables again.
* Create a qt_env.sh that contains these Qt specific environment variables and
  install it into /etc/profile.d which will insure these environment variables are
  global and the default.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 meta-arago-distro/recipes-qt/qt5/qtbase/qt_env.sh  |   12 ++++++++++++
 .../recipes-qt/qt5/qtbase_5.2.1.bbappend           |   18 +++++++++++++++++-
 2 files changed, 29 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase/qt_env.sh

diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase/qt_env.sh b/meta-arago-distro/recipes-qt/qt5/qtbase/qt_env.sh
new file mode 100644
index 0000000..51c181f
--- /dev/null
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase/qt_env.sh
@@ -0,0 +1,12 @@
+#!/bin/sh
+
+### QT Environment Variables ###
+export QT_QPA_GENERIC_PLUGINS=Auto
+export QT_QPA_PLATFORM=wayland
+
+
+# Set the QT_QPA_GENERIC_PLUGINS for touchscreen if it exists
+if [ -e /dev/input/touchscreen0 ]
+then
+    export QT_QPA_GENERIC_PLUGINS=Tslib:/dev/input/touchscreen0
+fi
diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase_5.2.1.bbappend b/meta-arago-distro/recipes-qt/qt5/qtbase_5.2.1.bbappend
index f5f772a..446b72a 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtbase_5.2.1.bbappend
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase_5.2.1.bbappend
@@ -1,8 +1,24 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
 GLES_EXTRA_DEPS = ""
 GLES_EXTRA_DEPS_omap-a15 = "libdrm wayland"
 
 PACKAGECONFIG[gles2] = "-opengl es2 -eglfs,,virtual/libgles2 virtual/egl ${GLES_EXTRA_DEPS}"
 
-PR_append = "-arago1"
+PR_append = "-arago2"
 
 QT_CONFIG_FLAGS += "-qpa wayland"
+
+SRC_URI += "file://qt_env.sh"
+
+# Add custom Arago Qt 5 Environment script file
+do_install_append () {
+    install -d ${D}${sysconfdir}/profile.d
+    install -m 0644 ${WORKDIR}/qt_env.sh ${D}${sysconfdir}/profile.d/
+}
+
+PACKAGES =+ "${PN}-conf"
+
+FILES_${PN}-conf = "${sysconfdir}/profile.d/qt_env.sh"
+
+RDEPENDS_${PN} += "${PN}-conf"
-- 
1.7.9.5


