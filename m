Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 0DA6452AB0
	for <meta-arago@arago-project.org>;
	Fri, 24 Jan 2014 16:57:34 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0OGvXPC031271
	for <meta-arago@arago-project.org>; Fri, 24 Jan 2014 10:57:33 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0OGvXe1008467
	for <meta-arago@arago-project.org>; Fri, 24 Jan 2014 10:57:33 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 24 Jan 2014 10:57:32 -0600
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0OGvMER021471;
	Fri, 24 Jan 2014 10:57:31 -0600
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 24 Jan 2014 12:21:39 -0600
Message-ID: <1390587699-26905-4-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1390587699-26905-1-git-send-email-fcooper@ti.com>
References: <1390587699-26905-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 4/4] packagegroup-arago-tisdk-*: Add dual camera demo to AM437x SDK
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
X-List-Received-Date: Fri, 24 Jan 2014 16:57:34 -0000
Content-Type: text/plain

* Include demo in the target filesystem.
* Include the sources in the host sdk.
* Add Matrix integration.
---
 .../packagegroup-arago-tisdk-matrix.bb             |    4 +++-
 ...packagegroup-arago-tisdk-multimedia-sdk-host.bb |    6 +++++-
 .../packagegroup-arago-tisdk-multimedia.bb         |    3 ++-
 3 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index 95ecb2a..9354624 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to include Matrix v2"
 LICENSE = "MIT"
-PR = "r27"
+PR = "r28"
 
 inherit packagegroup
 
@@ -77,6 +77,8 @@ MATRIX_APPS_append_ti43x = "        \
     matrix-multimedia-demo-mpeg4aacdec \
     matrix-multimedia-demo-mpeg4dec \
                                     \
+    matrix-gui-apps-dual-camera     \
+                                    \
     matrix-gui-generic-pm           \
     matrix-gui-pm-demos-suspend     \
     matrix-gui-clocks               \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
index 333b017..38b52b6 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to add multimedia related sources into the SDK"
 LICENSE = "MIT"
-PR = "r2"
+PR = "r3"
 
 inherit packagegroup
 
@@ -16,6 +16,10 @@ MULTIMEDIA_append_am3517-evm = " \
     av-examples-src \
 "
 
+MULTIMEDIA_append_ti43x = " \
+    dual-camera-demo-src \
+"
+
 RDEPENDS_${PN} = "\
     ${MULTIMEDIA} \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
index 62d059c..d9828b8 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to add multimedia related packages"
 LICENSE = "MIT"
-PR = "r5"
+PR = "r6"
 
 inherit packagegroup
 
@@ -18,6 +18,7 @@ MULTIMEDIA_append_ti33x = " \
 
 MULTIMEDIA_append_ti43x = " \
     amsdk-av-files \
+    dual-camera-demo \
 "
 
 MULTIMEDIA_append_omap-a15 = " \
-- 
1.7.0.4


