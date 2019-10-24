Return-Path: <e-ruei1@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id ED9E1529DB
	for <meta-arago@arago-project.org>;
	Thu, 24 Oct 2019 19:02:47 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9OJ1Ter124008
	for <meta-arago@arago-project.org>; Thu, 24 Oct 2019 14:01:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1571943689;
	bh=QoGlBrLvhgfja43/sEF0PW/mUvfALqcIAAK8Su0hlaY=;
	h=From:To:Subject:Date;
	b=Y1A8vYtVuezJFYaljjXcmPvK3cR0vIm6xkzunc0r4X+touGjo6MteVclDC/wB8ukQ
	qb7/wYqXDTP2fdC41jS92wSWh2Sa0OCSkxs+sAF3vwTX4g7zs9pJrxSRs7MABfTpSp
	AsbbNNNghCEq+aPW361hiNyEtawBnXLfCEVe/lzQ=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9OJ1TaU078119
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 24 Oct 2019 14:01:29 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 24 Oct 2019 14:01:18 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 24 Oct 2019 14:01:18 -0500
Received: from UDA0850410.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9OJ1SeE014911
	for <meta-arago@arago-project.org>; Thu, 24 Oct 2019 14:01:29 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 24 Oct 2019 15:01:21 -0400
Message-ID: <20191024190121.48094-1-e-ruei1@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [matrix-gui-v2-apps][PATCH] 3d_apps: update the default window mode to full-screen DRM
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
X-List-Received-Date: Thu, 24 Oct 2019 19:02:48 -0000
Content-Type: text/plain

The nullWS (Raw) applications are replaced with the DRM ones because the
Mesa-based EGL does not support nullDRM window system, the GBM(DRM) window
system should be used instead.

We also replace X11 with Wayland because X11 is no longer supported and
is replaced with Wayland.

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 3d_apps/3d_chameleon/runOGLES2ChameleonMan.sh |  8 ++++----
 3d_apps/3d_coverflow/runOGLES2Coverflow.sh    |  8 ++++----
 3d_apps/3d_exampleui/runOGLES2ExampleUI.sh    |  8 ++++----
 3d_apps/3d_film/runOGLESFilmTV.sh             | 10 +++++-----
 3d_apps/3d_lantern/runOGLES2MagicLantern.sh   |  8 ++++----
 3d_apps/3d_navigation/runOGLES2Navigation.sh  |  8 ++++----
 3d_apps/3d_shaders/runOGLES2Shaders.sh        |  8 ++++----
 3d_apps/3d_skull/runOGLESEvilSkull.sh         |  8 ++++----
 3d_apps/3d_vase/runOGLESVase.sh               |  8 ++++----
 9 files changed, 37 insertions(+), 37 deletions(-)
 mode change 100755 => 100644 3d_apps/3d_film/runOGLESFilmTV.sh
 mode change 100755 => 100644 3d_apps/3d_lantern/runOGLES2MagicLantern.sh
 mode change 100755 => 100644 3d_apps/3d_skull/runOGLESEvilSkull.sh

diff --git a/3d_apps/3d_chameleon/runOGLES2ChameleonMan.sh b/3d_apps/3d_chameleon/runOGLES2ChameleonMan.sh
index 382a884..be3daa2 100644
--- a/3d_apps/3d_chameleon/runOGLES2ChameleonMan.sh
+++ b/3d_apps/3d_chameleon/runOGLES2ChameleonMan.sh
@@ -3,13 +3,13 @@
 OGLESDIR=""
 OGLESAPP="OGLES2ChameleonMan"
 
-#Check if DISPLAY is set.  If so we assume we are running in X11
-#and will call the X11 version of the demos if they exist.
+#Check if DISPLAY is set.  If so we assume we are running in WAYLAND
+#and will call the Wayland version of the demos if they exist.
 if [ "$DISPLAY" == "" ]
 then
-    OGLESDIR="/usr/bin/SGX/demos/Raw"
+    OGLESDIR="/usr/bin/SGX/demos/DRM"
 else
-    OGLESDIR="/usr/bin/SGX/demos/X11"
+    OGLESDIR="/usr/bin/SGX/demos/Wayland"
 fi
 
 if [ -e "$OGLESDIR/$OGLESAPP" ]
diff --git a/3d_apps/3d_coverflow/runOGLES2Coverflow.sh b/3d_apps/3d_coverflow/runOGLES2Coverflow.sh
index 32d12e9..731545b 100644
--- a/3d_apps/3d_coverflow/runOGLES2Coverflow.sh
+++ b/3d_apps/3d_coverflow/runOGLES2Coverflow.sh
@@ -3,13 +3,13 @@
 OGLESDIR=""
 OGLESAPP="OGLES2Coverflow"
 
-#Check if DISPLAY is set.  If so we assume we are running in X11
-#and will call the X11 version of the demos if they exist.
+#Check if DISPLAY is set.  If so we assume we are running in WAYLAND
+#and will call the Wayland version of the demos if they exist.
 if [ "$DISPLAY" == "" ]
 then
-    OGLESDIR="/usr/bin/SGX/demos/Raw"
+    OGLESDIR="/usr/bin/SGX/demos/DRM"
 else
-    OGLESDIR="/usr/bin/SGX/demos/X11"
+    OGLESDIR="/usr/bin/SGX/demos/Wayland"
 fi
 
 if [ -e "$OGLESDIR/$OGLESAPP" ]
diff --git a/3d_apps/3d_exampleui/runOGLES2ExampleUI.sh b/3d_apps/3d_exampleui/runOGLES2ExampleUI.sh
index 6f7b41c..68869eb 100644
--- a/3d_apps/3d_exampleui/runOGLES2ExampleUI.sh
+++ b/3d_apps/3d_exampleui/runOGLES2ExampleUI.sh
@@ -3,13 +3,13 @@
 OGLESDIR=""
 OGLESAPP="OGLES2ExampleUI"
 
-#Check if DISPLAY is set.  If so we assume we are running in X11
-#and will call the X11 version of the demos if they exist.
+#Check if DISPLAY is set.  If so we assume we are running in WAYLAND
+#and will call the Wayland version of the demos if they exist.
 if [ "$DISPLAY" == "" ]
 then
-    OGLESDIR="/usr/bin/SGX/demos/Raw"
+    OGLESDIR="/usr/bin/SGX/demos/DRM"
 else
-    OGLESDIR="/usr/bin/SGX/demos/X11"
+    OGLESDIR="/usr/bin/SGX/demos/Wayland"
 fi
 
 if [ -e "$OGLESDIR/$OGLESAPP" ]
diff --git a/3d_apps/3d_film/runOGLESFilmTV.sh b/3d_apps/3d_film/runOGLESFilmTV.sh
old mode 100755
new mode 100644
index 4cc6f9e..461eaaa
--- a/3d_apps/3d_film/runOGLESFilmTV.sh
+++ b/3d_apps/3d_film/runOGLESFilmTV.sh
@@ -1,15 +1,15 @@
 #!/bin/sh
 
 OGLESDIR=""
-OGLESAPP="OGLESFilmTV"
+OGLESAPP="OGLES2FilmTV"
 
-#Check if DISPLAY is set.  If so we assume we are running in X11
-#and will call the X11 version of the demos if they exist.
+#Check if DISPLAY is set.  If so we assume we are running in WAYLAND
+#and will call the Wayland version of the demos if they exist.
 if [ "$DISPLAY" == "" ]
 then
-    OGLESDIR="/usr/bin/SGX/demos/Raw"
+    OGLESDIR="/usr/bin/SGX/demos/DRM"
 else
-    OGLESDIR="/usr/bin/SGX/demos/X11"
+    OGLESDIR="/usr/bin/SGX/demos/Wayland"
 fi
 
 if [ -e "$OGLESDIR/$OGLESAPP" ]
diff --git a/3d_apps/3d_lantern/runOGLES2MagicLantern.sh b/3d_apps/3d_lantern/runOGLES2MagicLantern.sh
old mode 100755
new mode 100644
index a9e02a8..d0715b9
--- a/3d_apps/3d_lantern/runOGLES2MagicLantern.sh
+++ b/3d_apps/3d_lantern/runOGLES2MagicLantern.sh
@@ -3,13 +3,13 @@
 OGLESDIR=""
 OGLESAPP="OGLES2MagicLantern"
 
-#Check if DISPLAY is set.  If so we assume we are running in X11
-#and will call the X11 version of the demos if they exist.
+#Check if DISPLAY is set.  If so we assume we are running in WAYLAND
+#and will call the Wayland version of the demos if they exist.
 if [ "$DISPLAY" == "" ]
 then
-    OGLESDIR="/usr/bin/SGX/demos/Raw"
+    OGLESDIR="/usr/bin/SGX/demos/DRM"
 else
-    OGLESDIR="/usr/bin/SGX/demos/X11"
+    OGLESDIR="/usr/bin/SGX/demos/Wayland"
 fi
 
 if [ -e "$OGLESDIR/$OGLESAPP" ]
diff --git a/3d_apps/3d_navigation/runOGLES2Navigation.sh b/3d_apps/3d_navigation/runOGLES2Navigation.sh
index 64b5713..6ddaa68 100644
--- a/3d_apps/3d_navigation/runOGLES2Navigation.sh
+++ b/3d_apps/3d_navigation/runOGLES2Navigation.sh
@@ -3,13 +3,13 @@
 OGLESDIR=""
 OGLESAPP="OGLES2Navigation"
 
-#Check if DISPLAY is set.  If so we assume we are running in X11
-#and will call the X11 version of the demos if they exist.
+#Check if DISPLAY is set.  If so we assume we are running in WAYLAND
+#and will call the Wayland version of the demos if they exist.
 if [ "$DISPLAY" == "" ]
 then
-    OGLESDIR="/usr/bin/SGX/demos/Raw"
+    OGLESDIR="/usr/bin/SGX/demos/DRM"
 else
-    OGLESDIR="/usr/bin/SGX/demos/X11"
+    OGLESDIR="/usr/bin/SGX/demos/Wayland"
 fi
 
 if [ -e "$OGLESDIR/$OGLESAPP" ]
diff --git a/3d_apps/3d_shaders/runOGLES2Shaders.sh b/3d_apps/3d_shaders/runOGLES2Shaders.sh
index f39a8a3..1a3db61 100644
--- a/3d_apps/3d_shaders/runOGLES2Shaders.sh
+++ b/3d_apps/3d_shaders/runOGLES2Shaders.sh
@@ -3,13 +3,13 @@
 OGLESDIR=""
 OGLESAPP="OGLES2Shaders"
 
-#Check if DISPLAY is set.  If so we assume we are running in X11
-#and will call the X11 version of the demos if they exist.
+#Check if DISPLAY is set.  If so we assume we are running in WAYLAND
+#and will call the Wayland version of the demos if they exist.
 if [ "$DISPLAY" == "" ]
 then
-    OGLESDIR="/usr/bin/SGX/demos/Raw"
+    OGLESDIR="/usr/bin/SGX/demos/DRM"
 else
-    OGLESDIR="/usr/bin/SGX/demos/X11"
+    OGLESDIR="/usr/bin/SGX/demos/Wayland"
 fi
 
 if [ -e "$OGLESDIR/$OGLESAPP" ]
diff --git a/3d_apps/3d_skull/runOGLESEvilSkull.sh b/3d_apps/3d_skull/runOGLESEvilSkull.sh
old mode 100755
new mode 100644
index 4d15b66..df7a3cf
--- a/3d_apps/3d_skull/runOGLESEvilSkull.sh
+++ b/3d_apps/3d_skull/runOGLESEvilSkull.sh
@@ -3,13 +3,13 @@
 OGLESDIR=""
 OGLESAPP="OGLESEvilSkull"
 
-#Check if DISPLAY is set.  If so we assume we are running in X11
-#and will call the X11 version of the demos if they exist.
+#Check if DISPLAY is set.  If so we assume we are running in WAYLAND
+#and will call the Wayland version of the demos if they exist.
 if [ "$DISPLAY" == "" ]
 then
-    OGLESDIR="/usr/bin/SGX/demos/Raw"
+    OGLESDIR="/usr/bin/SGX/demos/DRM"
 else
-    OGLESDIR="/usr/bin/SGX/demos/X11"
+    OGLESDIR="/usr/bin/SGX/demos/Wayland"
 fi
 
 if [ -e "$OGLESDIR/$OGLESAPP" ]
diff --git a/3d_apps/3d_vase/runOGLESVase.sh b/3d_apps/3d_vase/runOGLESVase.sh
index 6e201fd..2fd1230 100644
--- a/3d_apps/3d_vase/runOGLESVase.sh
+++ b/3d_apps/3d_vase/runOGLESVase.sh
@@ -3,13 +3,13 @@
 OGLESDIR=""
 OGLESAPP="OGLESVase"
 
-#Check if DISPLAY is set.  If so we assume we are running in X11
-#and will call the X11 version of the demos if they exist.
+#Check if DISPLAY is set.  If so we assume we are running in WAYLAND
+#and will call the Wayland version of the demos if they exist.
 if [ "$DISPLAY" == "" ]
 then
-    OGLESDIR="/usr/bin/SGX/demos/Raw"
+    OGLESDIR="/usr/bin/SGX/demos/DRM"
 else
-    OGLESDIR="/usr/bin/SGX/demos/X11"
+    OGLESDIR="/usr/bin/SGX/demos/Wayland"
 fi
 
 if [ -e "$OGLESDIR/$OGLESAPP" ]
-- 
2.17.1


