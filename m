Return-Path: <jake@ubuntu-quadshannondemopc5>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 77E1852A89
	for <meta-arago@arago-project.org>;
	Thu,  5 Mar 2015 13:33:55 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t25DXsfL027581
	for <meta-arago@arago-project.org>; Thu, 5 Mar 2015 07:33:54 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t25DXr20000669
	for <meta-arago@arago-project.org>; Thu, 5 Mar 2015 07:33:53 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 5 Mar 2015 07:33:53 -0600
Received: from Ubuntu-QuadShannonDemoPC5 (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t25DXrc0023330;	Thu, 5 Mar 2015 07:33:53 -0600
Received: from jake by Ubuntu-QuadShannonDemoPC5 with local (Exim 4.76)
	(envelope-from <jake@ubuntu-quadshannondemopc5>)	id 1YTVuT-0003Kf-6u;
	Thu, 05 Mar 2015 08:33:53 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 5 Mar 2015 08:33:28 -0500
Message-ID: <1425562410-19688-4-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1425562410-19688-1-git-send-email-j-stiffler@ti.com>
References: <1425562410-19688-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [RFC 3/4] qtbase: Choose QT platform abstraction based on ARAGO_QT_PLATFORM.
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
X-List-Received-Date: Thu, 05 Mar 2015 13:33:55 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-qt/qt5/qtbase/qt_env_eglfs.sh          |    5 +++++
 .../recipes-qt/qt5/qtbase_5.4.1.bbappend           |   10 ++++++----
 2 files changed, 11 insertions(+), 4 deletions(-)
 create mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase/qt_env_eglfs.sh

diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase/qt_env_eglfs.sh b/meta-arago-distro/recipes-qt/qt5/qtbase/qt_env_eglfs.sh
new file mode 100644
index 0000000..4ae0d9f
--- /dev/null
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase/qt_env_eglfs.sh
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+### QT Environment Variables ###
+export QT_QPA_GENERIC_PLUGINS=Auto
+export QT_QPA_PLATFORM=eglfs
diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase_5.4.1.bbappend b/meta-arago-distro/recipes-qt/qt5/qtbase_5.4.1.bbappend
index a466581..a86aba0 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtbase_5.4.1.bbappend
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase_5.4.1.bbappend
@@ -5,16 +5,18 @@ GLES_EXTRA_DEPS_omap-a15 = "libdrm wayland"
 
 PACKAGECONFIG[gles2] = "-opengl es2 -eglfs,,virtual/libgles2 virtual/egl ${GLES_EXTRA_DEPS}"
 
-PR_append = "-arago3"
+PR_append = "-arago4"
 
-QT_CONFIG_FLAGS += "-qpa wayland"
+QT_CONFIG_FLAGS += "-qpa ${ARAGO_QT_PLATOFM}"
 
-SRC_URI += "file://qt_env.sh"
+QT_ENV_SCRIPT = "${@base_conditional('ARAGO_QT_PLATFORM', 'eglfs', 'qt_env_eglfs.sh', 'qt_env.sh', d)}"
+
+SRC_URI += "file://${QT_ENV_SCRIPT}"
 
 # Add custom Arago Qt 5 Environment script file
 do_install_append () {
     install -d ${D}${sysconfdir}/profile.d
-    install -m 0644 ${WORKDIR}/qt_env.sh ${D}${sysconfdir}/profile.d/
+    install -m 0644 ${WORKDIR}/${QT_ENV_SCRIPT} ${D}${sysconfdir}/profile.d/qt_env.sh
 }
 
 PACKAGES =+ "${PN}-conf"
-- 
1.7.9.5


