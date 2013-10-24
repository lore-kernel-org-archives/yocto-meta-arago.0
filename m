Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 6D8EF52A62
	for <meta-arago@arago-project.org>;
	Thu, 24 Oct 2013 19:23:18 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9OJNHwp025172
	for <meta-arago@arago-project.org>; Thu, 24 Oct 2013 14:23:17 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9OJNHiA027265
	for <meta-arago@arago-project.org>; Thu, 24 Oct 2013 14:23:17 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 24 Oct 2013 14:23:17 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9OJNE0i003721;
	Thu, 24 Oct 2013 14:23:15 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 24 Oct 2013 15:15:47 -0500
Message-ID: <1382645748-14738-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 1/2] amsdk-av-files: Add WVGA files for dra7xx devices
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
X-List-Received-Date: Thu, 24 Oct 2013 19:23:19 -0000
Content-Type: text/plain

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../amsdk-av-files/amsdk-av-files_1.1.bb           |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.1.bb b/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.1.bb
index f0c7646..553ead5 100644
--- a/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.1.bb
+++ b/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://gforge.ti.com/gf/project/am_multimedia/"
 LICENSE = "CC-BY-NC-ND-3.0"
 SECTION = "multimedia"
 LIC_FILES_CHKSUM = "file://Multimedia_Data_Files_Manifest.doc;md5=5f25f2753d6294d6b3ecac61d2f64146"
-PR = "r1"
+PR = "r2"
 
 COMPATIBLE_MACHINE = "(omap3evm|am37x-evm|am3517-evm|am389x-evm|beagleboard|am335x-evm|ti43x|omap-a15)"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -14,6 +14,7 @@ VIDEO_FILES_append_beagleboard = "video_vga"
 VIDEO_FILES_append_am3517-evm  = "video_wqvga"
 VIDEO_FILES_append_am335x-evm  = "video_wvga \
 				                  video_wqvga"
+VIDEO_FILES_append_dra7xx-evm  = "video_wvga"
 
 SRC_URI = "https://gforge.ti.com/gf/download/frsrelease/564/5179/amsdk-av-files_${PV}.tar.gz;name=avfilestarball"
 
-- 
1.7.0.4


