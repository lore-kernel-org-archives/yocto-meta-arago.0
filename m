Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id E76F752A1F
	for <meta-arago@arago-project.org>;
	Fri,  5 Apr 2013 13:54:00 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r35DrwaZ012107
	for <meta-arago@arago-project.org>; Fri, 5 Apr 2013 08:53:59 -0500
Received: from DBDE71.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r35DruSW002149
	for <meta-arago@arago-project.org>; Fri, 5 Apr 2013 19:23:57 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by DBDE71.ent.ti.com
	(172.24.170.149) with Microsoft SMTP Server id 14.1.323.3;
	Fri, 5 Apr 2013 19:23:56 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r35DrrEb028018;
	Fri, 5 Apr 2013 19:23:55 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 5 Apr 2013 08:53:51 -0500
Message-ID: <1365170031-959-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH] amsdk-av-files: Add support for AV files for omap-a15
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
X-List-Received-Date: Fri, 05 Apr 2013 13:54:01 -0000
Content-Type: text/plain

* Use the 480p files that are the default for the omap-a15 devices

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../packagegroup-arago-tisdk-multimedia.bb         |    6 +++++-
 .../amsdk-av-files/amsdk-av-files_1.1.bb           |    2 +-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
index 32c718d..c38a546 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to add multimedia related packages"
 LICENSE = "MIT"
-PR = "r3"
+PR = "r4"
 
 inherit packagegroup
 
@@ -16,6 +16,10 @@ MULTIMEDIA_append_ti33x = " \
     amsdk-av-files \
 "
 
+MULTIMEDIA_append_omap-a15 = " \
+    amsdk-av-files \
+"
+
 MULTIMEDIA_append_am37x-evm = " \
     av-examples \
 "
diff --git a/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.1.bb b/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.1.bb
index 42cc3d8..6f91627 100644
--- a/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.1.bb
+++ b/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.1.bb
@@ -5,7 +5,7 @@ SECTION = "multimedia"
 LIC_FILES_CHKSUM = "file://Multimedia_Data_Files_Manifest.doc;md5=5f25f2753d6294d6b3ecac61d2f64146"
 PR = "r0"
 
-COMPATIBLE_MACHINE = "(omap3evm|am37x-evm|am3517-evm|am389x-evm|beagleboard|am335x-evm)"
+COMPATIBLE_MACHINE = "(omap3evm|am37x-evm|am3517-evm|am389x-evm|beagleboard|am335x-evm|omap-a15)"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 VIDEO_FILES = "video_480p "
-- 
1.7.0.4


