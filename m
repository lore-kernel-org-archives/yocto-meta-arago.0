Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id DDB8852A20
	for <meta-arago@arago-project.org>;
	Wed, 15 Feb 2017 06:30:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 759E420AAE;
	Wed, 15 Feb 2017 06:30:37 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id a2TFheCH7Rik; Wed, 15 Feb 2017 06:30:37 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5424420893;
	Wed, 15 Feb 2017 06:30:36 +0000 (UTC)
Received: from gimli.denix (pippin [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 5B1DB162373;
	Wed, 15 Feb 2017 01:30:35 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 15 Feb 2017 01:30:34 -0500
Message-Id: <1487140234-115453-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [krogoth/morty/master][PATCH] opencv: combine bbappends, don't add qtwayland for keystone
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
X-List-Received-Date: Wed, 15 Feb 2017 06:30:38 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-support/opencv/opencv_%.bbappend   |  8 --------
 meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend | 11 +++++++----
 2 files changed, 7 insertions(+), 12 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-support/opencv/opencv_%.bbappend

diff --git a/meta-arago-distro/recipes-support/opencv/opencv_%.bbappend b/meta-arago-distro/recipes-support/opencv/opencv_%.bbappend
deleted file mode 100644
index 7298a01..0000000
--- a/meta-arago-distro/recipes-support/opencv/opencv_%.bbappend
+++ /dev/null
@@ -1,8 +0,0 @@
-PACKAGECONFIG_append = "${@bb.utils.contains("DISTRO_FEATURES", "wayland", " qtwayland", "", d)}"
-
-PACKAGECONFIG[qtwayland] = "-DWITH_QT=ON,-DWITH_QT=OFF,qtwayland,"
-
-inherit cmake_qt5
-
-ALLOW_EMPTY_${PN}-java = "1"
-ALLOW_EMPTY_${PN}-locale = "1"
diff --git a/meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend b/meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend
index aef44bc..2de9b96 100644
--- a/meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend
+++ b/meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend
@@ -1,4 +1,4 @@
-PR = "r0"
+PR = "r1"
 
 BRANCH = "tiopencvrelease_3.1"
 
@@ -15,13 +15,16 @@ SRCREV_opencv = "b4f54ac48ced0ade8223eafab9cd3ad6dbb1b515"
 
 DEPENDS_remove_keystone = "qtbase"
 
-PACKAGECONFIG_append_am57xx-evm= " opencl"
-PACKAGECONFIG_append_dra7xx-evm= " opencl"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+PACKAGECONFIG_append_dra7xx = " opencl"
 PACKAGECONFIG_append_keystone = " opencl"
+PACKAGECONFIG_append_dra7xx = "${@bb.utils.contains("DISTRO_FEATURES", "wayland", " qtwayland", "", d)}"
 
-PACKAGE_ARCH = "${MACHINE_ARCH}"
+inherit cmake_qt5
 
 PACKAGECONFIG[opencl] = "-DWITH_OPENCL=ON -DCMAKE_CXX_FLAGS_RELEASE="${CMAKE_CXX_FLAGS_RELEASE} -DCV_TIOPENCL -DCV_TIOPENCL_ENABLE_PROGRAM_COUNT -DMAX_PROGRAM_HASH_SIZE=50" -DCMAKE_C_FLAGS_RELEASE="${CMAKE_C_FLAGS_RELEASE} -DCV_TIOPENCL -DCV_TIOPENCL_ENABLE_PROGRAM_COUNT -DMAX_PROGRAM_HASH_SIZE=50" -DWITH_OPENCLAMDFFT=OFF -DWITH_OPENCLAMDBLAS=OFF,-DWITH_OPENCL=OFF,cmem opencl,"
+PACKAGECONFIG[qtwayland] = "-DWITH_QT=ON,-DWITH_QT=OFF,qtwayland,"
 
 do_install_append() {
     install -d ${D}${datadir}/OpenCV/samples/bin/
-- 
2.7.4


