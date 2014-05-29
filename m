Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 21C1F52AB3
	for <meta-arago@arago-project.org>;
	Thu, 29 May 2014 18:38:33 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4TIcWhb030682
	for <meta-arago@arago-project.org>; Thu, 29 May 2014 13:38:32 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4TIcWYL025522
	for <meta-arago@arago-project.org>; Thu, 29 May 2014 13:38:32 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 29 May 2014 13:38:32 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4TIcGgO022027;
	Thu, 29 May 2014 13:38:30 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 29 May 2014 13:38:10 -0500
Message-ID: <1401388695-30526-6-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1401388695-30526-1-git-send-email-fcooper@ti.com>
References: <1401388695-30526-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 06/11] image-gallery: Add image gallery application
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
X-List-Received-Date: Thu, 29 May 2014 18:38:33 -0000
Content-Type: text/plain

* Add new Qt application to the SDK which displays pictures taken by the camera
  demo.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-qt/qt-apps/image-gallery_git.bb        |   33 ++++++++++++++++++++
 1 files changed, 33 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-extras/recipes-qt/qt-apps/image-gallery_git.bb

diff --git a/meta-arago-extras/recipes-qt/qt-apps/image-gallery_git.bb b/meta-arago-extras/recipes-qt/qt-apps/image-gallery_git.bb
new file mode 100644
index 0000000..3040415
--- /dev/null
+++ b/meta-arago-extras/recipes-qt/qt-apps/image-gallery_git.bb
@@ -0,0 +1,33 @@
+DESCRIPTION = "Image Gallery"
+HOMEPAGE = "https://gitorious.org/image-gallery"
+SECTION = "multimedia"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=9c57cc1cdee589f97cbba69e95a89a15"
+
+require recipes-core/matrix/matrix-gui-paths.inc
+
+PR = "r0"
+
+BRANCH = "master"
+SRCREV = "8901d7c598b277e4e26a5abbcb859e7ceebd340a"
+
+SRC_URI = "git://gitorious.org/image-gallery/image-gallery.git;protocol=git;branch=${BRANCH}"
+
+S = "${WORKDIR}/git/"
+
+BUILDDIR ?= "."
+
+inherit qt-provider
+
+do_install() {
+	install -d ${D}/usr/bin
+	install -m 0755 ${BUILDDIR}/image-gallery ${D}/usr/bin/image-gallery
+	install -d ${D}${MATRIX_APP_DIR}/qt-image-gallery
+	cp -rf matrix-files/*  ${D}${MATRIX_APP_DIR}/qt-image-gallery
+}
+
+PACKAGES += "matrix-gui-apps-image-gallery"
+
+RDEPENDS_matrix-gui-apps-image-gallery  = "matrix-gui-apps-images matrix-gui-submenus-camera ${PN}"
+
+FILES_matrix-gui-apps-image-gallery += "${MATRIX_APP_DIR}/*"
-- 
1.7.0.4


