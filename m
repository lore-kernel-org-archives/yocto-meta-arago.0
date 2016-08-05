Return-Path: <h-gou@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [198.47.19.12])
	by arago-project.org (Postfix) with ESMTPS id BB7C9529AA
	for <meta-arago@arago-project.org>;
	Fri,  5 Aug 2016 21:44:51 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u75LioMF015789
	for <meta-arago@arago-project.org>; Fri, 5 Aug 2016 16:44:50 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u75LioNh017296
	for <meta-arago@arago-project.org>; Fri, 5 Aug 2016 16:44:50 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 5 Aug 2016 16:44:50 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u75LioAx012109;	Fri, 5 Aug 2016 16:44:50 -0500
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 5 Aug 2016 17:44:48 -0400
Message-ID: <1470433488-16913-1-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] amsdk-av-files: specify video files for keystone
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
X-List-Received-Date: Fri, 05 Aug 2016 21:44:52 -0000
Content-Type: text/plain

* The video files will be used for HEVC decoding on keystone

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
 .../recipes-multimedia/amsdk-av-files/amsdk-av-files_1.4.bb         | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.4.bb b/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.4.bb
index 0c3da61..4598416 100644
--- a/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.4.bb
+++ b/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.4.bb
@@ -3,9 +3,9 @@ HOMEPAGE = "https://gforge.ti.com/gf/project/am_multimedia/"
 LICENSE = "CC-BY-NC-ND-3.0 & CC-BY-3.0"
 SECTION = "multimedia"
 LIC_FILES_CHKSUM = "file://Multimedia_Data_Files_Manifest.doc;md5=da0727f80b90422138535dfffc36cd1a"
-PR = "r0"
+PR = "r1"
 
-COMPATIBLE_MACHINE = "(omap3|ti33x|ti43x|omap-a15)"
+COMPATIBLE_MACHINE = "(omap3|ti33x|ti43x|omap-a15|keystone)"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 VIDEO_FILES = "video_480p "
@@ -21,6 +21,8 @@ VIDEO_FILES_append_dra7xx      = "video_wvga \
                                   video_720p \
                                   video_yuv"
 
+VIDEO_FILES_keystone = "video_720p "
+
 SRC_URI = "https://gforge.ti.com/gf/download/frsrelease/1279/7769/amsdk-av-files_${PV}.tar.gz;name=avfilestarball"
 
 S = "${WORKDIR}/amsdk-av-files"
-- 
1.9.1


