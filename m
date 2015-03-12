Return-Path: <jake@ubuntu-quadshannondemopc5>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id CF86C52A7E
	for <meta-arago@arago-project.org>;
	Thu, 12 Mar 2015 19:46:30 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2CJkTOs001043
	for <meta-arago@arago-project.org>; Thu, 12 Mar 2015 14:46:30 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2CJkS45001447
	for <meta-arago@arago-project.org>; Thu, 12 Mar 2015 14:46:28 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 12 Mar 2015 14:46:28 -0500
Received: from Ubuntu-QuadShannonDemoPC5 (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t2CJkSNf029555;	Thu, 12 Mar 2015 14:46:28 -0500
Received: from jake by Ubuntu-QuadShannonDemoPC5 with local (Exim 4.76)
	(envelope-from <jake@ubuntu-quadshannondemopc5>)	id 1YW93s-0002pK-F0;
	Thu, 12 Mar 2015 15:46:28 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 12 Mar 2015 15:46:21 -0400
Message-ID: <1426189582-16812-4-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1426189582-16812-1-git-send-email-j-stiffler@ti.com>
References: <1426189582-16812-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH v2 3/4] qtbase: Use DISTRO_FEATURES to set appropriate qpa.
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
X-List-Received-Date: Thu, 12 Mar 2015 19:46:32 -0000
Content-Type: text/plain

* If wayland is in DISTRO_FEATURES, then configure '-qpa wayland'
* Otherwise configure '-qpa eglfs'

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
v2: omap-a15 requires wayland regardless of whether it is a feature.

 meta-arago-distro/recipes-qt/qt5/qtbase/qt_env.sh  |    1 -
 .../recipes-qt/qt5/qtbase_5.4.1.bbappend           |    4 ++--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase/qt_env.sh b/meta-arago-distro/recipes-qt/qt5/qtbase/qt_env.sh
index 1e8c196..f888d50 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtbase/qt_env.sh
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase/qt_env.sh
@@ -2,4 +2,3 @@
 
 ### QT Environment Variables ###
 export QT_QPA_GENERIC_PLUGINS=Auto
-export QT_QPA_PLATFORM=wayland
diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase_5.4.1.bbappend b/meta-arago-distro/recipes-qt/qt5/qtbase_5.4.1.bbappend
index a466581..4af0582 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtbase_5.4.1.bbappend
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase_5.4.1.bbappend
@@ -5,9 +5,9 @@ GLES_EXTRA_DEPS_omap-a15 = "libdrm wayland"
 
 PACKAGECONFIG[gles2] = "-opengl es2 -eglfs,,virtual/libgles2 virtual/egl ${GLES_EXTRA_DEPS}"
 
-PR_append = "-arago3"
+PR_append = "-arago4"
 
-QT_CONFIG_FLAGS += "-qpa wayland"
+QT_CONFIG_FLAGS += "-qpa ${@base_contains('DISTRO_FEATURES', 'wayland', 'wayland', 'eglfs', d)}"
 
 SRC_URI += "file://qt_env.sh"
 
-- 
1.7.9.5


