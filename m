Return-Path: <h-gou@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [198.47.19.11])
	by arago-project.org (Postfix) with ESMTPS id 43E0B52A5F
	for <meta-arago@arago-project.org>;
	Mon,  8 Aug 2016 15:36:34 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u78FaXmb020426
	for <meta-arago@arago-project.org>; Mon, 8 Aug 2016 10:36:33 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u78FaXCx031236
	for <meta-arago@arago-project.org>; Mon, 8 Aug 2016 10:36:33 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 8 Aug 2016 10:36:32 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u78FaW05006746;	Mon, 8 Aug 2016 10:36:32 -0500
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 8 Aug 2016 11:36:24 -0400
Message-ID: <1470670585-26473-1-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 1/2] matrix-gui-multimedia-demos: add DSP C66x image processing demos
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
X-List-Received-Date: Mon, 08 Aug 2016 15:36:34 -0000
Content-Type: text/plain

* dsp66imgproc displays the video output using kmssink
* dsp66imgproc-f2f saves the video output to a file

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
 .../recipes-core/matrix/matrix-gui-multimedia-demos_2.0.bb     | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-multimedia-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-multimedia-demos_2.0.bb
index e05da29..70e60ab 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-multimedia-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-multimedia-demos_2.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
 
 require matrix-gui-apps-git.inc
 
-PR = "${INC_PR}.5"
+PR = "${INC_PR}.6"
 
 inherit allarch
 
@@ -23,6 +23,8 @@ PACKAGES = "matrix-multimedia-demo-aac \
             matrix-multimedia-demo-ivahdh264enc \
             matrix-multimedia-demo-vip-vpe-ivahdmpeg4encdec \
             matrix-multimedia-demo-h265dec \
+            matrix-multimedia-demo-dsp66imgproc \
+            matrix-multimedia-demo-dsp66imgproc-f2f \
 "
 
 RDEPENDS_matrix-multimedia-demo-aac = "${MULTIMEDIA_RDEPENDS}"
@@ -34,6 +36,8 @@ RDEPENDS_matrix-multimedia-demo-ivahdh264dec             = "${MULTIMEDIA_RDEPEND
 RDEPENDS_matrix-multimedia-demo-ivahdh264enc             = "${MULTIMEDIA_RDEPENDS}"
 RDEPENDS_matrix-multimedia-demo-vip-vpe-ivahdmpeg4encdec = "${MULTIMEDIA_RDEPENDS}"
 RDEPENDS_matrix-multimedia-demo-h265dec      = "${MULTIMEDIA_RDEPENDS}"
+RDEPENDS_matrix-multimedia-demo-dsp66imgproc  = "${MULTIMEDIA_RDEPENDS}"
+RDEPENDS_matrix-multimedia-demo-dsp66imgproc-f2f  = "${MULTIMEDIA_RDEPENDS}"
 
 
 # Split the matrix files by multimedia demos
@@ -46,6 +50,8 @@ FILES_matrix-multimedia-demo-ivahdh264dec                = "${MATRIX_APP_DIR}/iv
 FILES_matrix-multimedia-demo-ivahdh264enc                = "${MATRIX_APP_DIR}/ivahd_multimedia_h264enc/*"
 FILES_matrix-multimedia-demo-vip-vpe-ivahdmpeg4encdec    = "${MATRIX_APP_DIR}/ivahd_multimedia_vip_vpe_mpeg4encdec/*"
 FILES_matrix-multimedia-demo-h265dec      = "${MATRIX_APP_DIR}/arm_multimedia_h265dec/*"
+FILES_matrix-multimedia-demo-dsp66imgproc     = "${MATRIX_APP_DIR}/dsp66_multimedia_imgproc/*"
+FILES_matrix-multimedia-demo-dsp66imgproc-f2f     = "${MATRIX_APP_DIR}/dsp66_multimedia_imgproc_f2f/*"
 
 # Split the ${bindir} files by multimedia demos
 FILES_matrix-multimedia-demo-aac += "${bindir}/runAACDec.sh"
@@ -57,3 +63,5 @@ FILES_matrix-multimedia-demo-ivahdh264dec               += "${bindir}/runIvahdH2
 FILES_matrix-multimedia-demo-ivahdh264enc               += "${bindir}/runIvahdH264Enc.sh"
 FILES_matrix-multimedia-demo-vip-vpe-ivahdmpeg4encdec   += "${bindir}/runIvahdVipVpeMpeg4EncDec.sh"
 FILES_matrix-multimedia-demo-h265dec      += "${bindir}/runH265Dec.sh"
+FILES_matrix-multimedia-demo-dsp66imgproc    += "${bindir}/runDsp66ImgProc.sh"
+FILES_matrix-multimedia-demo-dsp66imgproc-f2f    += "${bindir}/runDsp66ImgProcSave2File.sh"
-- 
1.9.1


