Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 5CADD52995
	for <meta-arago@arago-project.org>;
	Tue, 17 Mar 2020 20:13:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 274EC40C34;
	Tue, 17 Mar 2020 20:11:48 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id apgeRJTSGQ-m; Tue, 17 Mar 2020 20:11:48 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0973540A41;
	Tue, 17 Mar 2020 20:11:46 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 14072171268;
	Tue, 17 Mar 2020 16:11:45 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Tue, 17 Mar 2020 16:11:41 -0400
Message-Id: <1584475904-3730-6-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1584475904-3730-1-git-send-email-denys@ti.com>
References: <1584475904-3730-1-git-send-email-denys@ti.com>
Subject: [master][PATCH 6/9] ti-world: qtwebengine and qtbrowser depend on Python2
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
X-List-Received-Date: Tue, 17 Mar 2020 20:13:56 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-core/packagegroups/ti-world.bb    |  6 +++++-
 .../packagegroup-arago-qte-toolchain-target.bb              | 13 +------------
 2 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-world.bb b/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
index 9244d49..e104df8 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
@@ -21,6 +21,10 @@ EXTRABROWSERS = " \
     qtwebengine-examples \
 "
 
+PYTHON2APPS = " \
+    ${@bb.utils.contains('MACHINE_FEATURES','gpu',"${EXTRABROWSERS}",'',d)} \
+"
+
 DEVTOOLS = " \
     linux-libc-headers-dev \
     build-essential \
@@ -48,7 +52,7 @@ RDEPENDS_${PN} = "\
     packagegroup-arago-tisdk-addons-extra \
     ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-tisdk-hmi','packagegroup-arago-base-tisdk-server-extra',d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', "${CHROMIUM}", '', d)} \
-    ${@bb.utils.contains('MACHINE_FEATURES','gpu',"${EXTRABROWSERS}",'',d)} \
+    ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "${PYTHON2APPS}", "", d)} \
     ${@bb.utils.contains('MACHINE_FEATURES', 'gpu dsp', 'qt-opencv-opencl-opengl-multithreaded-dev', '', d)} \
     ${DEVTOOLS} \
     ${@bb.utils.contains('TUNE_FEATURES', 'armv7a', 'valgrind', '', d)} \
diff --git a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bb b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bb
index ac3c6b1..c40b453 100644
--- a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bb
+++ b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bb
@@ -63,24 +63,13 @@ QT5_DEV = " \
         qtxmlpatterns-dev \
         qtwebkit-mkspecs \
         qtwebkit-dev \
-        qtwebengine-mkspecs \
-        qtwebengine-dev \
+        ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "qtwebengine-mkspecs qtwebengine-dev", "", d)} \
         qtserialport-mkspecs \
         qtserialport-dev  \
         qtcharts-mkspecs \
         qtcharts-dev \
 "
 
-#QT5_DEV_append_k3 = " \
-#        qtwebkit-mkspecs \
-#        qtwebkit-dev \
-#"
-#
-#QT5_DEV_remove_k3 = " \
-#        qtwebengine-mkspecs \
-#        qtwebengine-dev \
-#"
-
 RDEPENDS_${PN} += " \
         ${@oe.utils.conditional('QT_PROVIDER', 'qt5', "${QT5_DEV}", "${QT4_DEV}", d)} \
 "
-- 
2.7.4


