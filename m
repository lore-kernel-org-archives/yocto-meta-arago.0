Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id C6CA9529A2
	for <meta-arago@arago-project.org>;
	Tue, 16 Mar 2021 19:57:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 274E440C1C;
	Tue, 16 Mar 2021 19:58:13 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id RRUv7KgKdu7k; Tue, 16 Mar 2021 19:58:13 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0B2C840A77;
	Tue, 16 Mar 2021 19:58:11 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id B3A5E17454B;
	Tue, 16 Mar 2021 15:58:11 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 16 Mar 2021 15:58:10 -0400
Message-Id: <1615924690-45022-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [dunfell/master][PATCH] opencv: drop deprecated bbappend for DSP-offloading
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
X-List-Received-Date: Tue, 16 Mar 2021 19:57:57 -0000

From: Denys Dmytriyenko <denys@konsulko.com>

DSP-offloading to OpenCL hasn't been updated for ~3 years [1] and is based
on version 3.1, which is no longer available. Remove remaining bbappend.

[1] https://git.ti.com/cgit/opencv/tiopencv/log/?h=tiopencvrelease_3.1

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-support/opencv/opencv_3.1.bbappend     | 41 ----------------------
 1 file changed, 41 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend

diff --git a/meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend b/meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend
deleted file mode 100644
index a87e832..0000000
--- a/meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend
+++ /dev/null
@@ -1,41 +0,0 @@
-PR = "r3"
-
-BRANCH = "tiopencvrelease_3.1"
-
-SRC_URI_remove = "git://github.com/Itseez/opencv.git;name=opencv"
-SRC_URI_prepend = "git://git.ti.com/opencv/tiopencv.git;protocol=git;branch=${BRANCH};name=opencv"
-
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-SRC_URI_append += "\
-     file://setupEnv.sh \
-"
-
-SRCREV_opencv = "102577cf10416ca8180adda88d3fd801eebc6318"
-
-DEPENDS_remove_keystone = "qtbase"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-PACKAGECONFIG_QTWAYLAND = "${@bb.utils.contains("DISTRO_FEATURES", "wayland", "qtwayland", "", d)}"
-PACKAGECONFIG_QTWAYLAND_keystone = ""
-
-PACKAGECONFIG_append = " ${PACKAGECONFIG_QTWAYLAND} \
-                         ${@bb.utils.contains('MACHINE_FEATURES','dsp','opencl', '', d)} \
-"
-
-PACKAGECONFIG_remove = "python3"
-PACKAGECONFIG_remove = "python2"
-
-inherit cmake_qt5
-
-PACKAGECONFIG[opencl] = "-DWITH_OPENCL=ON -DCMAKE_CXX_FLAGS_RELEASE="${CMAKE_CXX_FLAGS_RELEASE} -DCV_TIOPENCL -DCV_TIOPENCL_ENABLE_PROGRAM_COUNT -DMAX_PROGRAM_HASH_SIZE=50" -DCMAKE_C_FLAGS_RELEASE="${CMAKE_C_FLAGS_RELEASE} -DCV_TIOPENCL -DCV_TIOPENCL_ENABLE_PROGRAM_COUNT -DMAX_PROGRAM_HASH_SIZE=50" -DWITH_OPENCLAMDFFT=OFF -DWITH_OPENCLAMDBLAS=OFF,-DWITH_OPENCL=OFF,cmem opencl,"
-PACKAGECONFIG[qtwayland] = "-DWITH_QT=ON,-DWITH_QT=OFF,qtwayland,"
-
-do_install_append() {
-    install -d ${D}${datadir}/OpenCV/samples/bin/
-    install -d ${D}${datadir}/OpenCV/titestsuite/
-    cp -f bin/*_test_* ${D}${datadir}/OpenCV/samples/bin/
-    cp -f ${S}/titestsuite/* ${D}${datadir}/OpenCV/titestsuite/
-    cp -f ${WORKDIR}/setupEnv.sh ${D}${datadir}/OpenCV/titestsuite/
-}
-- 
2.7.4


