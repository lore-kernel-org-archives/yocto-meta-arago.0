Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 5698F5298E
	for <meta-arago@arago-project.org>;
	Fri, 24 Jan 2014 16:57:27 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0OGvPmB026553
	for <meta-arago@arago-project.org>; Fri, 24 Jan 2014 10:57:25 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0OGvP26008412
	for <meta-arago@arago-project.org>; Fri, 24 Jan 2014 10:57:25 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 24 Jan 2014 10:57:25 -0600
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0OGvMEO021471;
	Fri, 24 Jan 2014 10:57:23 -0600
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 24 Jan 2014 12:21:36 -0600
Message-ID: <1390587699-26905-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 1/4] dual-camera-demo: Dual Camera Demo App
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
X-List-Received-Date: Fri, 24 Jan 2014 16:57:28 -0000
Content-Type: text/plain

* Add Qt dual camera demo application.
---
 .../dual-camera-demo/dual-camera-demo_1.0.bb       |   32 ++++++++++++++++++++
 1 files changed, 32 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb

diff --git a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb
new file mode 100644
index 0000000..4d6d00c
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb
@@ -0,0 +1,32 @@
+DESCRIPTION = "Qt Dual Camera Demo"
+HOMEPAGE = "https://gitorious.org/dual-camera-demo/"
+SECTION = "multimedia"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://main.cpp;md5=424a1b7299bcd2c5fad3b05493dd8898"
+
+require recipes-core/matrix/matrix-gui-paths.inc
+
+PR = "r0"
+
+BRANCH = "master"
+SRCREV = "af299a206482562ceae8aa690a8b6644a3e0a66e"
+
+SRC_URI = "git://gitorious.org/dual-camera-demo/dual-camera-demo.git;protocol=git;branch=${BRANCH}"
+
+S = "${WORKDIR}/git"
+
+inherit qt-provider
+
+# use the make targets already created in the Makefile.build files
+do_install() {
+    cd ${S} && make -f Makefile.build DESTDIR=${D} install_common
+}
+
+PACKAGES += "matrix-gui-apps-dual-camera"
+
+RDEPENDS_matrix-gui-apps-dual-camera  = "matrix-gui-apps-images matrix-gui-submenus-multimedia ${PN}"
+
+# Add the matrix directory to the FILES
+FILES_${PN} = "/usr/bin/*"
+
+FILES_matrix-gui-apps-dual-camera = "${MATRIX_APP_DIR}/*"
-- 
1.7.0.4


