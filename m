Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 3EE6D529B3
	for <meta-arago@arago-project.org>;
	Fri, 20 Feb 2015 22:56:42 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1KMufTF020115
	for <meta-arago@arago-project.org>; Fri, 20 Feb 2015 16:56:41 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1KMuep5009123
	for <meta-arago@arago-project.org>; Fri, 20 Feb 2015 16:56:40 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 20 Feb 2015 16:56:40 -0600
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t1KMudUP005820;	Fri, 20 Feb 2015 16:56:39 -0600
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id t1KMubAf006776;	Sat, 21 Feb 2015 04:26:38 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 20 Feb 2015 16:56:32 -0600
Message-ID: <1424472995-22977-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 1/4] dual-camera-demo: Updated dual camera demo that supports DRM and Qt 4 / Qt 5
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
X-List-Received-Date: Fri, 20 Feb 2015 22:56:42 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../dual-camera-demo/dual-camera-demo_1.0.bb       |   11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb
index d21a0e5..643daab 100644
--- a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb
+++ b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb
@@ -4,12 +4,13 @@ SECTION = "multimedia"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c7ca707704d3354a64feeb4f19f52eb5"
 
+DEPENDS += "libdrm"
 require recipes-core/matrix/matrix-gui-paths.inc
 
-PR = "r4"
+PR = "r5"
 
-BRANCH = "master"
-SRCREV = "255808485bfd9bebd7f13ecd48704b6cc9ae0d69"
+BRANCH = "drm"
+SRCREV = "0c48cb66cc995420dfec2f1fd620c8977f0170aa"
 
 SRC_URI = "git://gitorious.org/dual-camera-demo/dual-camera-demo.git;protocol=git;branch=${BRANCH}"
 
@@ -17,6 +18,8 @@ S = "${WORKDIR}/git"
 
 inherit qt-provider
 
+export SDK_PATH_TARGET='${STAGING_DIR_HOST}'
+
 # use the make targets already created in the Makefile.build files
 do_install() {
     install -d ${D}/usr/bin
@@ -28,6 +31,8 @@ do_install() {
 
 PACKAGES += "matrix-gui-apps-dual-camera"
 
+RDEPENDS_${PN} += "libdrm libdrm-omap"
+
 RDEPENDS_matrix-gui-apps-dual-camera  = "matrix-gui-apps-images matrix-gui-submenus-camera ${PN}"
 
 # Add the matrix directory to the FILES
-- 
1.7.9.5


