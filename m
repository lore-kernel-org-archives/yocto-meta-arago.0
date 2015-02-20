Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 3FF4E529B3
	for <meta-arago@arago-project.org>;
	Fri, 20 Feb 2015 22:56:43 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1KMugit005363
	for <meta-arago@arago-project.org>; Fri, 20 Feb 2015 16:56:42 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1KMufIH024234
	for <meta-arago@arago-project.org>; Fri, 20 Feb 2015 16:56:41 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 20 Feb 2015 16:56:41 -0600
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t1KMue0r008840;	Fri, 20 Feb 2015 16:56:41 -0600
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id t1KMubAg006776;	Sat, 21 Feb 2015 04:26:39 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 20 Feb 2015 16:56:33 -0600
Message-ID: <1424472995-22977-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1424472995-22977-1-git-send-email-fcooper@ti.com>
References: <1424472995-22977-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 2/4] packagegroup-arago-tisdk-*: Add back dual camera demo that supports Qt and 3.14
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
X-List-Received-Date: Fri, 20 Feb 2015 22:56:43 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../packagegroup-arago-tisdk-addons.bb             |    6 +++---
 ...packagegroup-arago-tisdk-multimedia-sdk-host.bb |    7 +++++--
 .../packagegroup-arago-tisdk-multimedia.bb         |    6 +++---
 3 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 6d98ba6..c6b07a9 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r19"
+PR = "r20"
 
 inherit packagegroup
 
@@ -39,8 +39,8 @@ UTILS_append_dra7xx = " canutils"
 UTILS_append_omap-a15 = " parted"
 
 UTILS_append_ti33x = " switch-config"
-UTILS_append_ti43x = " switch-config"
-UTILS_append_omap-a15 = " switch-config"
+UTILS_append_ti43x = " switch-config libdrm-omap"
+UTILS_append_omap-a15 = " switch-config libdrm-omap"
 
 RDEPENDS_${PN} = "\
     ${UTILS} \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
index 94fd786..8f7c4fe 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to add multimedia related sources into the SDK"
 LICENSE = "MIT"
-PR = "r6"
+PR = "r7"
 
 inherit packagegroup
 
@@ -16,7 +16,10 @@ MULTIMEDIA_append_am3517-evm = " \
     av-examples-src \
 "
 
-MULTIMEDIA_append_ti43x = ""
+MULTIMEDIA_append_ti43x = " \
+    dual-camera-demo-src \
+    image-gallery-src \
+"
 
 #Demo doesn't work on 3.14
 # ${@base_conditional('QT_PROVIDER', 'qt5', '', 'dual-camera-demo-src image-gallery-src', d)}
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
index 81d5ee1..dd495f8 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to add multimedia related packages"
 LICENSE = "MIT"
-PR = "r10"
+PR = "r11"
 
 inherit packagegroup
 
@@ -17,10 +17,10 @@ MULTIMEDIA_append_ti33x = " \
 "
 
 MULTIMEDIA_append_ti43x = " \
+    dual-camera-demo \
+    image-gallery \
     amsdk-av-files \
 "
-# demo doesn't work on 3.14
-# ${@base_conditional('QT_PROVIDER', 'qt5', '', 'dual-camera-demo image-gallery', d)}
 
 MULTIMEDIA_append_omap-a15 = " \
     amsdk-av-files \
-- 
1.7.9.5


