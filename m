Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 178A2529B3
	for <meta-arago@arago-project.org>;
	Tue, 16 Dec 2014 17:11:09 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id sBGHB8eh029404
	for <meta-arago@arago-project.org>; Tue, 16 Dec 2014 11:11:08 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id sBGHB86Y026475
	for <meta-arago@arago-project.org>; Tue, 16 Dec 2014 11:11:08 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 16 Dec 2014 11:11:08 -0600
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	sBGHB7QV025521;	Tue, 16 Dec 2014 11:11:07 -0600
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id sBGHB3Tl016985;	Tue, 16 Dec 2014 22:41:05 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 16 Dec 2014 11:11:01 -0600
Message-ID: <1418749862-2529-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1418749862-2529-1-git-send-email-fcooper@ti.com>
References: <1418749862-2529-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 2/3] packagegroup-arago-tisdk-multimedia-*: Remove dual camera demo
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
X-List-Received-Date: Tue, 16 Dec 2014 17:11:09 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

* Dual camera does not work on 3.14 currently. Remove for now until it is
  fixed.
Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 ...packagegroup-arago-tisdk-multimedia-sdk-host.bb |    9 +++++----
 .../packagegroup-arago-tisdk-multimedia.bb         |    5 +++--
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
index 40aa486..94fd786 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to add multimedia related sources into the SDK"
 LICENSE = "MIT"
-PR = "r5"
+PR = "r6"
 
 inherit packagegroup
 
@@ -16,9 +16,10 @@ MULTIMEDIA_append_am3517-evm = " \
     av-examples-src \
 "
 
-MULTIMEDIA_append_ti43x = " \
-    ${@base_conditional('QT_PROVIDER', 'qt5', '', 'dual-camera-demo-src image-gallery-src', d)} \
-"
+MULTIMEDIA_append_ti43x = ""
+
+#Demo doesn't work on 3.14
+# ${@base_conditional('QT_PROVIDER', 'qt5', '', 'dual-camera-demo-src image-gallery-src', d)}
 
 RDEPENDS_${PN} = "\
     ${MULTIMEDIA} \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
index 3cd6293..81d5ee1 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to add multimedia related packages"
 LICENSE = "MIT"
-PR = "r9"
+PR = "r10"
 
 inherit packagegroup
 
@@ -18,8 +18,9 @@ MULTIMEDIA_append_ti33x = " \
 
 MULTIMEDIA_append_ti43x = " \
     amsdk-av-files \
-    ${@base_conditional('QT_PROVIDER', 'qt5', '', 'dual-camera-demo image-gallery', d)} \
 "
+# demo doesn't work on 3.14
+# ${@base_conditional('QT_PROVIDER', 'qt5', '', 'dual-camera-demo image-gallery', d)}
 
 MULTIMEDIA_append_omap-a15 = " \
     amsdk-av-files \
-- 
1.7.9.5


