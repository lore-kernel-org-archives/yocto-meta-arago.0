Return-Path: <jake@ubuntu-quadshannondemopc5>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id CC94852A63
	for <meta-arago@arago-project.org>;
	Thu,  5 Mar 2015 18:31:51 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t25IVpTi005714
	for <meta-arago@arago-project.org>; Thu, 5 Mar 2015 12:31:51 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t25IVoKG009000
	for <meta-arago@arago-project.org>; Thu, 5 Mar 2015 12:31:50 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 5 Mar 2015 12:31:49 -0600
Received: from Ubuntu-QuadShannonDemoPC5 (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t25IVn8f020752;	Thu, 5 Mar 2015 12:31:49 -0600
Received: from jake by Ubuntu-QuadShannonDemoPC5 with local (Exim 4.76)
	(envelope-from <jake@ubuntu-quadshannondemopc5>)	id 1YTaYn-0005C7-L4;
	Thu, 05 Mar 2015 13:31:49 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 5 Mar 2015 13:31:42 -0500
Message-ID: <1425580304-19919-4-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1425580304-19919-1-git-send-email-j-stiffler@ti.com>
References: <1425580304-19919-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [RFC v2 3/4] qtbase: Set qpa based in WAYLAND_SUPPORT flag.
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
X-List-Received-Date: Thu, 05 Mar 2015 18:31:52 -0000
Content-Type: text/plain

* If WAYLAND_SUPPORT = 0, then use eglfs.

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
index a466581..446a2d9 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtbase_5.4.1.bbappend
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase_5.4.1.bbappend
@@ -1,13 +1,16 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 GLES_EXTRA_DEPS = ""
-GLES_EXTRA_DEPS_omap-a15 = "libdrm wayland"
+GLES_EXTRA_DEPS_omap-a15 = " \
+    libdrm \
+    ${@base_conditional('WAYLAND_SUPPORT', '1', 'wayland', '', d)} \
+"
 
 PACKAGECONFIG[gles2] = "-opengl es2 -eglfs,,virtual/libgles2 virtual/egl ${GLES_EXTRA_DEPS}"
 
-PR_append = "-arago3"
+PR_append = "-arago4"
 
-QT_CONFIG_FLAGS += "-qpa wayland"
+QT_CONFIG_FLAGS += "-qpa ${@base_conditional('WAYLAND_SUPPORT', '1', 'wayland', 'eglfs', d)}"
 
 SRC_URI += "file://qt_env.sh"
 
-- 
1.7.9.5


