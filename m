Return-Path: <jake@ubuntu-quadshannondemopc5>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 469B952987
	for <meta-arago@arago-project.org>;
	Tue,  2 Jun 2015 12:09:11 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t52C995Z014071
	for <meta-arago@arago-project.org>; Tue, 2 Jun 2015 07:09:09 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t52C99mC000792
	for <meta-arago@arago-project.org>; Tue, 2 Jun 2015 07:09:09 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 2 Jun 2015 07:09:08 -0500
Received: from Ubuntu-QuadShannonDemoPC5 (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t52C998C032450;	Tue, 2 Jun 2015 07:09:09 -0500
Received: from jake by Ubuntu-QuadShannonDemoPC5 with local (Exim 4.76)
	(envelope-from <jake@ubuntu-quadshannondemopc5>)	id 1Yzl0G-000817-PD;
	Tue, 02 Jun 2015 08:09:08 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 2 Jun 2015 08:09:06 -0400
Message-ID: <1433246946-30787-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] matrix-gui-multimedia-demos: Add IVAHD demos.
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
X-List-Received-Date: Tue, 02 Jun 2015 12:09:11 -0000
Content-Type: text/plain

* The following IVAHD demos are added:
  - H264 Decode
  - H264 Encode
  - Capture (vip)
      -> Scale (vpe)
        -> Ducati MPEG4 Encode (ivahd)
          -> Ducati MPEG4 Decode (ivahd)
            -> Display (kmssink)

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../matrix/matrix-gui-multimedia-demos_2.0.bb      |   14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-multimedia-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-multimedia-demos_2.0.bb
index 739e03f..4cfb98e 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-multimedia-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-multimedia-demos_2.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
 
 require matrix-gui-apps-git.inc
 
-PR = "${INC_PR}.3"
+PR = "${INC_PR}.4"
 
 inherit allarch
 
@@ -19,6 +19,9 @@ PACKAGES = "matrix-multimedia-demo-aac \
             matrix-multimedia-demo-h264dec      \
             matrix-multimedia-demo-mpeg4aacdec   \
             matrix-multimedia-demo-mpeg4dec     \
+            matrix-multimedia-demo-ivahdh264dec \
+            matrix-multimedia-demo-ivahdh264enc \
+            matrix-multimedia-demo-vip-vpe-ivahdmpeg4encdec \
 "
 
 RDEPENDS_matrix-multimedia-demo-aac = "${MULTIMEDIA_RDEPENDS}"
@@ -26,6 +29,9 @@ RDEPENDS_matrix-multimedia-demo-audiocapture = "${MULTIMEDIA_RDEPENDS}"
 RDEPENDS_matrix-multimedia-demo-h264dec      = "${MULTIMEDIA_RDEPENDS}"
 RDEPENDS_matrix-multimedia-demo-mpeg4aacdec   = "${MULTIMEDIA_RDEPENDS}"
 RDEPENDS_matrix-multimedia-demo-mpeg4dec     = "${MULTIMEDIA_RDEPENDS}"
+RDEPENDS_matrix-multimedia-demo-ivahdh264dec             = "${MULTIMEDIA_RDEPENDS}"
+RDEPENDS_matrix-multimedia-demo-ivahdh264enc             = "${MULTIMEDIA_RDEPENDS}"
+RDEPENDS_matrix-multimedia-demo-vip-vpe-ivahdmpeg4encdec = "${MULTIMEDIA_RDEPENDS}"
 
 
 # Split the matrix files by multimedia demos
@@ -34,6 +40,9 @@ FILES_matrix-multimedia-demo-audiocapture = "${MATRIX_APP_DIR}/arm_multimedia_au
 FILES_matrix-multimedia-demo-h264dec      = "${MATRIX_APP_DIR}/arm_multimedia_h264dec/*"
 FILES_matrix-multimedia-demo-mpeg4aacdec   = "${MATRIX_APP_DIR}/arm_multimedia_mpeg4aacdec/*"
 FILES_matrix-multimedia-demo-mpeg4dec     = "${MATRIX_APP_DIR}/arm_multimedia_mpeg4dec/*"
+FILES_matrix-multimedia-demo-ivahdh264dec                = "${MATRIX_APP_DIR}/ivahd_multimedia_h264dec/*"
+FILES_matrix-multimedia-demo-ivahdh264enc                = "${MATRIX_APP_DIR}/ivahd_multimedia_h264enc/*"
+FILES_matrix-multimedia-demo-vip-vpe-ivahdmpeg4encdec    = "${MATRIX_APP_DIR}/ivahd_multimedia_vip_vpe_mpeg4encdec/*"
 
 # Split the ${bindir} files by multimedia demos
 FILES_matrix-multimedia-demo-aac += "${bindir}/runAACDec.sh"
@@ -41,3 +50,6 @@ FILES_matrix-multimedia-demo-audiocapture += "${bindir}/runAudioCapture.sh"
 FILES_matrix-multimedia-demo-h264dec      += "${bindir}/runH264Dec.sh"
 FILES_matrix-multimedia-demo-mpeg4aacdec   += "${bindir}/runMpeg4AacDec.sh"
 FILES_matrix-multimedia-demo-mpeg4dec     += "${bindir}/runMpeg4Dec.sh"
+FILES_matrix-multimedia-demo-ivahdh264dec               += "${bindir}/runIvahdH264Dec.sh"
+FILES_matrix-multimedia-demo-ivahdh264enc               += "${bindir}/runIvahdH264Enc.sh"
+FILES_matrix-multimedia-demo-vip-vpe-ivahdmpeg4encdec   += "${bindir}/runIvahdVipVpeMpeg4EncDec.sh"
-- 
1.7.9.5


