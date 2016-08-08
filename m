Return-Path: <h-gou@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [198.47.19.11])
	by arago-project.org (Postfix) with ESMTPS id 05C845298D
	for <meta-arago@arago-project.org>;
	Mon,  8 Aug 2016 16:25:49 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u78GPkMq016411
	for <meta-arago@arago-project.org>; Mon, 8 Aug 2016 11:25:46 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u78GPkUH024136
	for <meta-arago@arago-project.org>; Mon, 8 Aug 2016 11:25:46 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 8 Aug 2016 11:25:45 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u78GPj41019432;	Mon, 8 Aug 2016 11:25:46 -0500
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 8 Aug 2016 12:25:39 -0400
Message-ID: <1470673539-29495-1-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] point-cloud-viewer: add version 2.0
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
X-List-Received-Date: Mon, 08 Aug 2016 16:25:54 -0000
Content-Type: text/plain

* This package adds the binary of point cloud viewer as well as the
  input point cloud.

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
 .../point-cloud-viewer/point-cloud-viewer_2.0.bb   | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud-viewer_2.0.bb

diff --git a/meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud-viewer_2.0.bb b/meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud-viewer_2.0.bb
new file mode 100644
index 0000000..9d3b99e
--- /dev/null
+++ b/meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud-viewer_2.0.bb
@@ -0,0 +1,31 @@
+DESCRIPTION = "Point cloud viewer"
+HOMEPAGE = "https://gforge.ti.com/gf/project/am_multimedia"
+LICENSE = "TI-TSPA"
+LIC_FILES_CHKSUM := "file://PointCloudViewer_manifest.html;md5=7ea694db2dd8d82fd91a18cab8c2c2db"
+
+PR = "r0"
+
+COMPATIBLE_MACHINE = "dra7xx"
+
+SRC_URI = "https://gforge.ti.com/gf/download/frsrelease/1304/7978/${PN}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "b4a49f1998397efb7c33299a7aeec386"
+SRC_URI[sha256sum] = "7b25a185122ed739eab040b77f101f866d33f77c4f64cae95d60213787228f17"
+
+S = "${WORKDIR}/${PN}-${PV}"
+
+RDEPENDS_${PN} = "glfw3 opencv"
+
+do_install() {
+    install -d ${D}${bindir}
+    install -m 755 ${S}/point_cloud_viewer ${D}${bindir}
+
+    install -d ${D}${datadir}/ti/pointclouds
+    install -m 644 ${S}/example_point_cloud.xyz ${D}${datadir}/ti/pointclouds
+}
+
+FILES_${PN} += "\
+    ${datadir}/ti/pointclouds \
+"
+
+INSANE_SKIP_${PN} = "already-stripped"
-- 
1.9.1


