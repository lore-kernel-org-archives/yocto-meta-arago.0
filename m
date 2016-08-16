Return-Path: <h-gou@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 5BE2C529B1
	for <meta-arago@arago-project.org>;
	Tue, 16 Aug 2016 22:04:55 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u7GM4rwU026335
	for <meta-arago@arago-project.org>; Tue, 16 Aug 2016 17:04:53 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u7GM4qYO006567
	for <meta-arago@arago-project.org>; Tue, 16 Aug 2016 17:04:52 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 16 Aug 2016 17:04:52 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u7GM4pir018753;	Tue, 16 Aug 2016 17:04:52 -0500
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 16 Aug 2016 18:04:46 -0400
Message-ID: <1471385087-22759-3-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1471385087-22759-1-git-send-email-h-gou@ti.com>
References: <1471385087-22759-1-git-send-email-h-gou@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] extra-cmake-modules: add version 1.5.0+gitrX
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
X-List-Received-Date: Tue, 16 Aug 2016 22:04:59 -0000
Content-Type: text/plain

* extra-cmake-modules is required for building glfw3: version 3.2.
* This recipe exists in upstream under meta-luneui (master branch)
  https://layers.openembedded.org/layerindex/recipe/32503/

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
 .../recipes-devtools/cmake/extra-cmake-modules.bb  | 18 +++++++++++++++
 ...in-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-for-q.patch | 26 ++++++++++++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 meta-arago-extras/recipes-devtools/cmake/extra-cmake-modules.bb
 create mode 100644 meta-arago-extras/recipes-devtools/cmake/extra-cmake-modules/0001-Search-within-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-for-q.patch

diff --git a/meta-arago-extras/recipes-devtools/cmake/extra-cmake-modules.bb b/meta-arago-extras/recipes-devtools/cmake/extra-cmake-modules.bb
new file mode 100644
index 0000000..c12c0e2
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/cmake/extra-cmake-modules.bb
@@ -0,0 +1,18 @@
+UMMARY = "Extra modules and scripts for CMake"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING-CMAKE-SCRIPTS;md5=54c7042be62e169199200bc6477f04d1"
+
+PV = "1.5.0+gitr${SRCPV}"
+SRCREV = "8dc36cfa882f07a60b3ebdf16d9aac57871bd382"
+
+SRC_URI = " \
+    git://anongit.kde.org/extra-cmake-modules;protocol=git;branch=master \
+    file://0001-Search-within-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-for-q.patch \
+"
+S = "${WORKDIR}/git"
+
+EXTRA_OECMAKE += "-DBUILD_TESTING=off"
+
+inherit cmake
+
+FILES_${PN}-dev += "${datadir}/ECM"
diff --git a/meta-arago-extras/recipes-devtools/cmake/extra-cmake-modules/0001-Search-within-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-for-q.patch b/meta-arago-extras/recipes-devtools/cmake/extra-cmake-modules/0001-Search-within-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-for-q.patch
new file mode 100644
index 0000000..964dbbf
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/cmake/extra-cmake-modules/0001-Search-within-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-for-q.patch
@@ -0,0 +1,26 @@
+From 90d6c2bce5a50d2c05af25978bccbe047705eed7 Mon Sep 17 00:00:00 2001
+From: Simon Busch <morphis@gravedo.de>
+Date: Mon, 29 Dec 2014 12:05:20 +0100
+Subject: [PATCH] Search within OE_QMAKE_PATH_EXTERNAL_HOST_BINS for
+ qtwaylandscanner
+
+Signed-off-by: Simon Busch <morphis@gravedo.de>
+---
+ find-modules/FindQtWaylandScanner.cmake | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/find-modules/FindQtWaylandScanner.cmake b/find-modules/FindQtWaylandScanner.cmake
+index 7fb8a00..f782275 100644
+--- a/find-modules/FindQtWaylandScanner.cmake
++++ b/find-modules/FindQtWaylandScanner.cmake
+@@ -88,7 +88,7 @@ include(${CMAKE_CURRENT_LIST_DIR}/ECMFindModuleHelpersStub.cmake)
+ ecm_find_package_version_check(QtWaylandScanner)
+ 
+ # Find qtwaylandscanner
+-find_program(QtWaylandScanner_EXECUTABLE NAMES qtwaylandscanner)
++find_program(QtWaylandScanner_EXECUTABLE NAMES qtwaylandscanner HINTS ${OE_QMAKE_PATH_EXTERNAL_HOST_BINS})
+ 
+ include(FindPackageHandleStandardArgs)
+ find_package_handle_standard_args(QtWaylandScanner
+-- 
+2.1.0
-- 
1.9.1


