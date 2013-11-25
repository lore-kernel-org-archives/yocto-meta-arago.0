Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 79C8652A81
	for <meta-arago@arago-project.org>;
	Mon, 25 Nov 2013 15:51:03 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id rAPFp2v1016567
	for <meta-arago@arago-project.org>; Mon, 25 Nov 2013 09:51:02 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAPFp2XB025845
	for <meta-arago@arago-project.org>; Mon, 25 Nov 2013 09:51:02 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 25 Nov 2013 09:51:02 -0600
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAPFoujw009147;
	Mon, 25 Nov 2013 09:51:00 -0600
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 25 Nov 2013 10:53:57 -0600
Message-ID: <1385398442-24668-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1385398442-24668-1-git-send-email-fcooper@ti.com>
References: <1385398442-24668-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 2/7] packagegroup-arago-qt5: Create Qt5 target package group
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
X-List-Received-Date: Mon, 25 Nov 2013 15:51:03 -0000
Content-Type: text/plain

* Create package group that by default includes essential Qt 5 plugins.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../packagegroups/packagegroup-arago-qt5.bb        |   33 ++++++++++++++++++++
 1 files changed, 33 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qt5.bb

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qt5.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qt5.bb
new file mode 100644
index 0000000..57d9a6c
--- /dev/null
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qt5.bb
@@ -0,0 +1,33 @@
+DESCRIPTION = "Task to add Qt 5 embedded related packages"
+LICENSE = "MIT"
+PR = "r0"
+
+inherit packagegroup
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+QT_SGX_SUPPORT = "\
+    qt3d \
+    qt3d-qmlplugins \
+"
+
+RDEPENDS_${PN} = "\
+    qtbase \
+    qtbase-plugins \
+    qtbase-fonts \
+    qtbase-fonts-pfa \
+    qtbase-fonts-pfb \
+    qtbase-fonts-qpf \
+    qtbase-fonts-ttf-dejavu \
+    qtbase-fonts-ttf-vera \
+    qtwebkit-qmlplugins \
+    qtwebkit \
+    qtdeclarative \
+    qtdeclarative-qmlplugins \
+    qtjsbackend \
+    qtlocation \
+    qtsvg \
+    qtsvg-plugins \
+    ${@base_contains('MACHINE_FEATURES','sgx','${QT_SGX_SUPPORT}','',d)} \
+"
+
-- 
1.7.0.4


