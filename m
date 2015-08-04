Return-Path: <jake@udc0866934>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id B6AA752A08
	for <meta-arago@arago-project.org>;
	Tue,  4 Aug 2015 15:08:03 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t74F83rL019135
	for <meta-arago@arago-project.org>; Tue, 4 Aug 2015 10:08:03 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t74F827j030702
	for <meta-arago@arago-project.org>; Tue, 4 Aug 2015 10:08:03 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 4 Aug 2015 10:08:02 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t74F82S0027175;
	Tue, 4 Aug 2015 10:08:02 -0500
Received: from jake by udc0866934 with local (Exim 4.82)	(envelope-from
	<jake@udc0866934>)	id 1ZMdow-0008K5-Iy; Tue, 04 Aug 2015 11:08:02 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 4 Aug 2015 11:07:52 -0400
Message-ID: <1438700873-31955-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1438700873-31955-1-git-send-email-j-stiffler@ti.com>
References: <1438700873-31955-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] matrix-gui-multimedia-demos: Add H265 decode demo.
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
X-List-Received-Date: Tue, 04 Aug 2015 15:08:04 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-core/matrix/matrix-gui-multimedia-demos_2.0.bb          | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-multimedia-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-multimedia-demos_2.0.bb
index 4cfb98e..e05da29 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-multimedia-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-multimedia-demos_2.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
 
 require matrix-gui-apps-git.inc
 
-PR = "${INC_PR}.4"
+PR = "${INC_PR}.5"
 
 inherit allarch
 
@@ -22,6 +22,7 @@ PACKAGES = "matrix-multimedia-demo-aac \
             matrix-multimedia-demo-ivahdh264dec \
             matrix-multimedia-demo-ivahdh264enc \
             matrix-multimedia-demo-vip-vpe-ivahdmpeg4encdec \
+            matrix-multimedia-demo-h265dec \
 "
 
 RDEPENDS_matrix-multimedia-demo-aac = "${MULTIMEDIA_RDEPENDS}"
@@ -32,6 +33,7 @@ RDEPENDS_matrix-multimedia-demo-mpeg4dec     = "${MULTIMEDIA_RDEPENDS}"
 RDEPENDS_matrix-multimedia-demo-ivahdh264dec             = "${MULTIMEDIA_RDEPENDS}"
 RDEPENDS_matrix-multimedia-demo-ivahdh264enc             = "${MULTIMEDIA_RDEPENDS}"
 RDEPENDS_matrix-multimedia-demo-vip-vpe-ivahdmpeg4encdec = "${MULTIMEDIA_RDEPENDS}"
+RDEPENDS_matrix-multimedia-demo-h265dec      = "${MULTIMEDIA_RDEPENDS}"
 
 
 # Split the matrix files by multimedia demos
@@ -43,6 +45,7 @@ FILES_matrix-multimedia-demo-mpeg4dec     = "${MATRIX_APP_DIR}/arm_multimedia_mp
 FILES_matrix-multimedia-demo-ivahdh264dec                = "${MATRIX_APP_DIR}/ivahd_multimedia_h264dec/*"
 FILES_matrix-multimedia-demo-ivahdh264enc                = "${MATRIX_APP_DIR}/ivahd_multimedia_h264enc/*"
 FILES_matrix-multimedia-demo-vip-vpe-ivahdmpeg4encdec    = "${MATRIX_APP_DIR}/ivahd_multimedia_vip_vpe_mpeg4encdec/*"
+FILES_matrix-multimedia-demo-h265dec      = "${MATRIX_APP_DIR}/arm_multimedia_h265dec/*"
 
 # Split the ${bindir} files by multimedia demos
 FILES_matrix-multimedia-demo-aac += "${bindir}/runAACDec.sh"
@@ -53,3 +56,4 @@ FILES_matrix-multimedia-demo-mpeg4dec     += "${bindir}/runMpeg4Dec.sh"
 FILES_matrix-multimedia-demo-ivahdh264dec               += "${bindir}/runIvahdH264Dec.sh"
 FILES_matrix-multimedia-demo-ivahdh264enc               += "${bindir}/runIvahdH264Enc.sh"
 FILES_matrix-multimedia-demo-vip-vpe-ivahdmpeg4encdec   += "${bindir}/runIvahdVipVpeMpeg4EncDec.sh"
+FILES_matrix-multimedia-demo-h265dec      += "${bindir}/runH265Dec.sh"
-- 
1.9.1


