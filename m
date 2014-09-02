Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 57C85529CF
	for <meta-arago@arago-project.org>;
	Tue,  2 Sep 2014 19:07:33 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s82J7WPF007279
	for <meta-arago@arago-project.org>; Tue, 2 Sep 2014 14:07:32 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s82J7WFr031207
	for <meta-arago@arago-project.org>; Tue, 2 Sep 2014 14:07:32 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 2 Sep 2014 14:07:32 -0500
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s82J7VSX003354;	Tue, 2 Sep 2014 14:07:32 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id s82J7OcX001691;	Wed, 3 Sep 2014 00:37:30 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 2 Sep 2014 14:07:21 -0500
Message-ID: <1409684841-19677-5-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1409684841-19677-1-git-send-email-fcooper@ti.com>
References: <1409684841-19677-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 4/4] qtbase: Remove references of TSLIB
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
X-List-Received-Date: Tue, 02 Sep 2014 19:07:33 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

* Since Weston handles touch events in Qt 5 when using Wayland and Weston
  remove references to tslib since its no longer used.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 meta-arago-distro/recipes-qt/qt5/qtbase/qt_env.sh  |    7 -------
 .../recipes-qt/qt5/qtbase_5.2.1.bbappend           |    2 +-
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase/qt_env.sh b/meta-arago-distro/recipes-qt/qt5/qtbase/qt_env.sh
index 51c181f..1e8c196 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtbase/qt_env.sh
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase/qt_env.sh
@@ -3,10 +3,3 @@
 ### QT Environment Variables ###
 export QT_QPA_GENERIC_PLUGINS=Auto
 export QT_QPA_PLATFORM=wayland
-
-
-# Set the QT_QPA_GENERIC_PLUGINS for touchscreen if it exists
-if [ -e /dev/input/touchscreen0 ]
-then
-    export QT_QPA_GENERIC_PLUGINS=Tslib:/dev/input/touchscreen0
-fi
diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase_5.2.1.bbappend b/meta-arago-distro/recipes-qt/qt5/qtbase_5.2.1.bbappend
index 446b72a..a466581 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtbase_5.2.1.bbappend
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase_5.2.1.bbappend
@@ -5,7 +5,7 @@ GLES_EXTRA_DEPS_omap-a15 = "libdrm wayland"
 
 PACKAGECONFIG[gles2] = "-opengl es2 -eglfs,,virtual/libgles2 virtual/egl ${GLES_EXTRA_DEPS}"
 
-PR_append = "-arago2"
+PR_append = "-arago3"
 
 QT_CONFIG_FLAGS += "-qpa wayland"
 
-- 
1.7.9.5


