Return-Path: <h-gou@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id E02255209B
	for <meta-arago@arago-project.org>;
	Wed, 15 Feb 2017 22:19:29 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v1FMJJPS004132
	for <meta-arago@arago-project.org>; Wed, 15 Feb 2017 16:19:19 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v1FMJE1r011929
	for <meta-arago@arago-project.org>; Wed, 15 Feb 2017 16:19:14 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 15 Feb 2017 16:19:14 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v1FMJEsR031246;	Wed, 15 Feb 2017 16:19:14 -0600
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 15 Feb 2017 17:19:10 -0500
Message-ID: <1487197151-8160-1-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [morty/krogoth][PATCH 1/2] matrix-gui-multimedia-demos: add ivahdmjpegenc demo
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
X-List-Received-Date: Wed, 15 Feb 2017 22:19:30 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
 meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc       | 4 ++--
 .../recipes-core/matrix/matrix-gui-multimedia-demos_2.0.bb          | 6 +++++-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
index c8e1ce1..61487d0 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
@@ -4,9 +4,9 @@ LICENSE_CHECKSUM = "LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
 LIC_FILES_CHKSUM := "file://../${LICENSE_CHECKSUM}"
 
 SRC_URI = "git://git.ti.com/matrix-gui-v2/matrix-gui-v2-apps.git;protocol=git;branch=${BRANCH}"
-SRCREV = "847f3353dc29927417f31430d1b6dc5982146240"
+SRCREV = "84ce4e1b28b3c76a90bd0f481258207ef1c93017"
 BRANCH = "master"
-INC_PR = "r43"
+INC_PR = "r44"
 
 # Pull in the base package for installing matrix applications
 require matrix-gui-apps.inc
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-multimedia-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-multimedia-demos_2.0.bb
index 70e60ab..07240f2 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-multimedia-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-multimedia-demos_2.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
 
 require matrix-gui-apps-git.inc
 
-PR = "${INC_PR}.6"
+PR = "${INC_PR}.7"
 
 inherit allarch
 
@@ -21,6 +21,7 @@ PACKAGES = "matrix-multimedia-demo-aac \
             matrix-multimedia-demo-mpeg4dec     \
             matrix-multimedia-demo-ivahdh264dec \
             matrix-multimedia-demo-ivahdh264enc \
+            matrix-multimedia-demo-ivahdmjpegenc \
             matrix-multimedia-demo-vip-vpe-ivahdmpeg4encdec \
             matrix-multimedia-demo-h265dec \
             matrix-multimedia-demo-dsp66imgproc \
@@ -34,6 +35,7 @@ RDEPENDS_matrix-multimedia-demo-mpeg4aacdec   = "${MULTIMEDIA_RDEPENDS}"
 RDEPENDS_matrix-multimedia-demo-mpeg4dec     = "${MULTIMEDIA_RDEPENDS}"
 RDEPENDS_matrix-multimedia-demo-ivahdh264dec             = "${MULTIMEDIA_RDEPENDS}"
 RDEPENDS_matrix-multimedia-demo-ivahdh264enc             = "${MULTIMEDIA_RDEPENDS}"
+RDEPENDS_matrix-multimedia-demo-ivahdmjpegenc            = "${MULTIMEDIA_RDEPENDS}"
 RDEPENDS_matrix-multimedia-demo-vip-vpe-ivahdmpeg4encdec = "${MULTIMEDIA_RDEPENDS}"
 RDEPENDS_matrix-multimedia-demo-h265dec      = "${MULTIMEDIA_RDEPENDS}"
 RDEPENDS_matrix-multimedia-demo-dsp66imgproc  = "${MULTIMEDIA_RDEPENDS}"
@@ -48,6 +50,7 @@ FILES_matrix-multimedia-demo-mpeg4aacdec   = "${MATRIX_APP_DIR}/arm_multimedia_m
 FILES_matrix-multimedia-demo-mpeg4dec     = "${MATRIX_APP_DIR}/arm_multimedia_mpeg4dec/*"
 FILES_matrix-multimedia-demo-ivahdh264dec                = "${MATRIX_APP_DIR}/ivahd_multimedia_h264dec/*"
 FILES_matrix-multimedia-demo-ivahdh264enc                = "${MATRIX_APP_DIR}/ivahd_multimedia_h264enc/*"
+FILES_matrix-multimedia-demo-ivahdmjpegenc               = "${MATRIX_APP_DIR}/ivahd_multimedia_mjpegenc/*"
 FILES_matrix-multimedia-demo-vip-vpe-ivahdmpeg4encdec    = "${MATRIX_APP_DIR}/ivahd_multimedia_vip_vpe_mpeg4encdec/*"
 FILES_matrix-multimedia-demo-h265dec      = "${MATRIX_APP_DIR}/arm_multimedia_h265dec/*"
 FILES_matrix-multimedia-demo-dsp66imgproc     = "${MATRIX_APP_DIR}/dsp66_multimedia_imgproc/*"
@@ -61,6 +64,7 @@ FILES_matrix-multimedia-demo-mpeg4aacdec   += "${bindir}/runMpeg4AacDec.sh"
 FILES_matrix-multimedia-demo-mpeg4dec     += "${bindir}/runMpeg4Dec.sh"
 FILES_matrix-multimedia-demo-ivahdh264dec               += "${bindir}/runIvahdH264Dec.sh"
 FILES_matrix-multimedia-demo-ivahdh264enc               += "${bindir}/runIvahdH264Enc.sh"
+FILES_matrix-multimedia-demo-ivahdmjpegenc              += "${bindir}/runIvahdMjpegEnc.sh"
 FILES_matrix-multimedia-demo-vip-vpe-ivahdmpeg4encdec   += "${bindir}/runIvahdVipVpeMpeg4EncDec.sh"
 FILES_matrix-multimedia-demo-h265dec      += "${bindir}/runH265Dec.sh"
 FILES_matrix-multimedia-demo-dsp66imgproc    += "${bindir}/runDsp66ImgProc.sh"
-- 
1.9.1


