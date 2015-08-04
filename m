Return-Path: <jake@udc0866934>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 4E4CC52991
	for <meta-arago@arago-project.org>;
	Tue,  4 Aug 2015 14:01:31 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t74E1UaA005174
	for <meta-arago@arago-project.org>; Tue, 4 Aug 2015 09:01:30 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t74E1UVK027135
	for <meta-arago@arago-project.org>; Tue, 4 Aug 2015 09:01:30 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 4 Aug 2015 09:01:30 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t74E1UUK014773;
	Tue, 4 Aug 2015 09:01:30 -0500
Received: from jake by udc0866934 with local (Exim 4.82)	(envelope-from
	<jake@udc0866934>)	id 1ZMcmX-0001Ml-PU; Tue, 04 Aug 2015 10:01:29 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 4 Aug 2015 10:01:10 -0400
Message-ID: <1438696870-5218-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH v2] amsdk-av-files: Update to version 1.4
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
X-List-Received-Date: Tue, 04 Aug 2015 14:01:31 -0000
Content-Type: text/plain

* This version add the new "Tear of Steel" clip.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../{amsdk-av-files_1.3.bb => amsdk-av-files_1.4.bb}          | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)
 rename meta-arago-extras/recipes-multimedia/amsdk-av-files/{amsdk-av-files_1.3.bb => amsdk-av-files_1.4.bb} (75%)

diff --git a/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.3.bb b/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.4.bb
similarity index 75%
rename from meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.3.bb
rename to meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.4.bb
index 143224b..0c3da61 100644
--- a/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.3.bb
+++ b/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.4.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "AMSDK multimedia support files"
 HOMEPAGE = "https://gforge.ti.com/gf/project/am_multimedia/"
 LICENSE = "CC-BY-NC-ND-3.0 & CC-BY-3.0"
 SECTION = "multimedia"
-LIC_FILES_CHKSUM = "file://Multimedia_Data_Files_Manifest.doc;md5=9254447a504d2179d83a6bc9e2c28142"
+LIC_FILES_CHKSUM = "file://Multimedia_Data_Files_Manifest.doc;md5=da0727f80b90422138535dfffc36cd1a"
 PR = "r0"
 
 COMPATIBLE_MACHINE = "(omap3|ti33x|ti43x|omap-a15)"
@@ -15,12 +15,13 @@ VIDEO_FILES_append_beagleboard = "video_vga"
 VIDEO_FILES_append_am3517-evm  = "video_wqvga"
 VIDEO_FILES_append_ti33x       = "video_wvga \
                                   video_wqvga"
+VIDEO_FILES_append_ti43x       = "video_wqvga"
 VIDEO_FILES_append_dra7xx      = "video_wvga \
                                   video_1080p \
                                   video_720p \
                                   video_yuv"
- 
-SRC_URI = "https://gforge.ti.com/gf/download/frsrelease/1271/7720/amsdk-av-files_${PV}.tar.gz;name=avfilestarball"
+
+SRC_URI = "https://gforge.ti.com/gf/download/frsrelease/1279/7769/amsdk-av-files_${PV}.tar.gz;name=avfilestarball"
 
 S = "${WORKDIR}/amsdk-av-files"
 
@@ -40,5 +41,5 @@ do_install() {
 
 FILES_${PN} += "${datadir}/ti/*"
 
-SRC_URI[avfilestarball.md5sum] = "3f930cd873bc55bfd52a09b85f567d0c"
-SRC_URI[avfilestarball.sha256sum] = "b389b732df409546c0aba6464a5b0815647d8fa24020c4bede823cbe26337c06"
+SRC_URI[avfilestarball.md5sum] = "29a2f8b5f41f49e30bbe9cf53eb06c5a"
+SRC_URI[avfilestarball.sha256sum] = "64dde10d03156d480c6f38494c9503e73878fa0a8d5009182ed43b0e926b5569"
-- 
1.9.1


