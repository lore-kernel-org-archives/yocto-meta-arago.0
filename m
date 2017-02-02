Return-Path: <h-gou@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 3009D52AEF
	for <meta-arago@arago-project.org>;
	Thu,  2 Feb 2017 23:17:52 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v12NHqnj013247
	for <meta-arago@arago-project.org>; Thu, 2 Feb 2017 17:17:52 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v12NHqlD014461
	for <meta-arago@arago-project.org>; Thu, 2 Feb 2017 17:17:52 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 2 Feb 2017 17:17:51 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v12NHpdl016599;	Thu, 2 Feb 2017 17:17:51 -0600
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 2 Feb 2017 18:17:47 -0500
Message-ID: <1486077467-4989-1-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [krogoth/morty] [PATCH] qt-opencv-opencl-opengl-multithreaded: bump SRCREV and add OCV_NATIVE flag
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
X-List-Received-Date: Thu, 02 Feb 2017 23:17:52 -0000
Content-Type: text/plain

* Bump SRCREV for enhancements: OpenCL acceleration and video node detection for vip
* Enable OCV_NATIVE to use OpenCV APIs for camera capture: OpenCV APIs can now
  be used for camera capture with ~30fps because of the performance optimization
  in v4l-utils

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
 .../qt-opencv-opencl-opengl-multithreaded_git.bb                    | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-apps/video-analytics-demo/qt-opencv-opencl-opengl-multithreaded_git.bb b/meta-arago-extras/recipes-apps/video-analytics-demo/qt-opencv-opencl-opengl-multithreaded_git.bb
index 6785bdc..6e8093a 100644
--- a/meta-arago-extras/recipes-apps/video-analytics-demo/qt-opencv-opencl-opengl-multithreaded_git.bb
+++ b/meta-arago-extras/recipes-apps/video-analytics-demo/qt-opencv-opencl-opengl-multithreaded_git.bb
@@ -9,12 +9,12 @@ DEPENDS += "opencv opencl virtual/egl ti-cgt6x-native clocl-native dsplib-c66x"
 COMPATIBLE_MACHINE = "dra7xx"
 
 PV = "1.3.3"
-PR = "r1"
+PR = "r2"
 
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/apps/qt-opencv-opencl-opengl-multithreaded.git;protocol=git;branch=${BRANCH}"
 
-SRCREV = "f679a74230dbf7ace66ef06f79e02ac9abfc7d58"
+SRCREV = "a5dad4fbb470e526f6058095cf08a01f51abb02d"
 
 S = "${WORKDIR}/git"
 
@@ -24,6 +24,8 @@ export TARGET_ROOTDIR = "${STAGING_DIR_HOST}"
 export TI_OCL_CGT_INSTALL = "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
 export TI_DSPLIB_DIR = "${STAGING_DIR_TARGET}/usr/share/ti/ti-dsplib-c66x-tree"
 
+CXXFLAGS_append = " -DOCV_NATIVE "
+
 do_compile() {
     cd ${S}
     oe_runmake -f oclMakefile
-- 
1.9.1


