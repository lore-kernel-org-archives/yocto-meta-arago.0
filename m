Return-Path: <jake@udd0866934>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 814C752A9B
	for <meta-arago@arago-project.org>;
	Fri, 29 Jan 2016 15:10:23 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u0TFAN8c001735
	for <meta-arago@arago-project.org>; Fri, 29 Jan 2016 09:10:23 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0TFAMU4019087
	for <meta-arago@arago-project.org>; Fri, 29 Jan 2016 09:10:22 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 29 Jan 2016 09:10:22 -0600
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0TFAMWA028684;
	Fri, 29 Jan 2016 09:10:22 -0600
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1aPAgo-0001oO-5J; Fri, 29 Jan 2016 10:10:22 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 29 Jan 2016 10:10:13 -0500
Message-ID: <1454080219-6927-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1454080219-6927-1-git-send-email-j-stiffler@ti.com>
References: <1454080219-6927-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 1/7] qt-opencv-opencl-opengl-multithreaded: Add version 1.3.3
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
X-List-Received-Date: Fri, 29 Jan 2016 15:10:24 -0000
Content-Type: text/plain

    This example demonstrates the capablity of AM57x for video analytics.
    It builds on Qt and utilizes various IP blocks on AM57x:

    * Capture Driver: v4l2 camera capture
    * Open CV on A15: gesture recognition
    * Open CL for C66x: wave simulation algorithm
    * Open GL for SGX: hardware accelerated graphics rendering
    * Display Driver: DSS for display <br>

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../qt-opencv-opencl-opengl-multithreaded_git.bb   | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 meta-arago-extras/recipes-demo-applications/video-analytics-demo/qt-opencv-opencl-opengl-multithreaded_git.bb

diff --git a/meta-arago-extras/recipes-demo-applications/video-analytics-demo/qt-opencv-opencl-opengl-multithreaded_git.bb b/meta-arago-extras/recipes-demo-applications/video-analytics-demo/qt-opencv-opencl-opengl-multithreaded_git.bb
new file mode 100644
index 0000000..6785bdc
--- /dev/null
+++ b/meta-arago-extras/recipes-demo-applications/video-analytics-demo/qt-opencv-opencl-opengl-multithreaded_git.bb
@@ -0,0 +1,39 @@
+DESCRIPTION = "A simple multithreaded OpenCV example application using the Qt framework"
+HOMEPAGE = "https://github.com/devernay/qt-opencv-multithreaded"
+SECTION = "multimedia"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e28b998056a1a513e87be11c5045e85b"
+
+DEPENDS += "opencv opencl virtual/egl ti-cgt6x-native clocl-native dsplib-c66x"
+
+COMPATIBLE_MACHINE = "dra7xx"
+
+PV = "1.3.3"
+PR = "r1"
+
+BRANCH = "master"
+SRC_URI = "git://git.ti.com/apps/qt-opencv-opencl-opengl-multithreaded.git;protocol=git;branch=${BRANCH}"
+
+SRCREV = "f679a74230dbf7ace66ef06f79e02ac9abfc7d58"
+
+S = "${WORKDIR}/git"
+
+inherit qt-provider
+
+export TARGET_ROOTDIR = "${STAGING_DIR_HOST}"
+export TI_OCL_CGT_INSTALL = "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
+export TI_DSPLIB_DIR = "${STAGING_DIR_TARGET}/usr/share/ti/ti-dsplib-c66x-tree"
+
+do_compile() {
+    cd ${S}
+    oe_runmake -f oclMakefile
+    cd -
+    oe_runmake
+}
+
+do_install() {
+    install -d ${D}/usr/bin
+    install -m 755 qt-opencv-opencl-opengl-multithreaded ${D}/usr/bin/qt-opencv-opencl-opengl-multithreaded
+}
+
+RDEPENDS_${PN} += "opencv opencl-runtime"
-- 
1.9.1


