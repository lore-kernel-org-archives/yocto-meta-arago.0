Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 7273452A5D
	for <meta-arago@arago-project.org>;
	Sun, 17 Jun 2018 19:37:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E081420BBF;
	Sun, 17 Jun 2018 19:37:44 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id VDAJ-5tO32ei; Sun, 17 Jun 2018 19:37:44 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A6F8220C16;
	Sun, 17 Jun 2018 19:37:43 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 062B51634B4;
	Sun, 17 Jun 2018 15:37:42 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Sun, 17 Jun 2018 15:37:40 -0400
Message-Id: <1529264260-41284-9-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1529264260-41284-1-git-send-email-denys@ti.com>
References: <1529264260-41284-1-git-send-email-denys@ti.com>
Subject: [rocko/master][PATCH 9/9] FIXME: packagegroup, matrix: disable remaining non-server dependencies for K3
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
X-List-Received-Date: Sun, 17 Jun 2018 19:37:54 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb       | 1 +
 .../packagegroups/packagegroup-arago-tisdk-matrix-sdk-host.bb           | 1 +
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb       | 2 ++
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb   | 1 +
 .../packagegroups/packagegroup-arago-toolchain-tisdk-target.bb          | 2 ++
 meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb                 | 1 +
 6 files changed, 8 insertions(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 288b25a..da323f4 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -32,6 +32,7 @@ UTILS = " \
 
 UTILS_UBOOT_FW = "u-boot-fw-utils"
 UTILS_UBOOT_FW_keystone = ""
+UTILS_UBOOT_FW_k3 = ""
 
 UTILS_append_ti33x = " mmc-utils \
                        can-utils \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix-sdk-host.bb
index 295b164..078adab 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix-sdk-host.bb
@@ -13,6 +13,7 @@ MATRIX_GUI = " \
 
 MATRIX_GUI_keystone = ""
 MATRIX_GUI_omapl138 = ""
+MATRIX_GUI_k3 = ""
 
 RDEPENDS_${PN} = "\
     matrix-gui-src \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index f1c3083..812e8ac 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -20,6 +20,7 @@ MATRIX_GUI = "               \
 
 MATRIX_GUI_keystone = ""
 MATRIX_GUI_omapl138 = ""
+MATRIX_GUI_k3 = ""
 
 MATRIX_COMMON_APPS = "              \
     matrix-gui-armbenchmarks-demos  \
@@ -42,6 +43,7 @@ MATRIX_TOUCH_APPS = " \
 
 MATRIX_QT_APPS_keystone = ""
 MATRIX_QT_APPS_omapl138 = ""
+MATRIX_QT_APPS_k3 = ""
 
 MATRIX_SGX_DEMOS = " \
     matrix-3d-demo-chameleon \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
index 1c1e7d0..ab91ac8 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
@@ -11,6 +11,7 @@ MULTIMEDIA = " \
 "
 
 MULTIMEDIA_omapl138 = ""
+MULTIMEDIA_k3 = ""
 MULTIMEDIA_append_keystone = " \
     hevc-arm-decoder \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb
index 5614d3a..2851302 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb
@@ -11,6 +11,7 @@ QT_TOOLCHAIN_TARGET = "\
 "
 QT_TOOLCHAIN_TARGET_keystone = ""
 QT_TOOLCHAIN_TARGET_omapl138 = ""
+QT_TOOLCHAIN_TARGET_k3 = ""
 
 TISDK_TOOLCHAIN_BASE_TARGET = "\
     packagegroup-arago-standalone-sdk-target \
@@ -23,6 +24,7 @@ TISDK_TOOLCHAIN_EXTRA_TARGET = "\
 "
 TISDK_TOOLCHAIN_EXTRA_TARGET_keystone = ""
 TISDK_TOOLCHAIN_EXTRA_TARGET_omapl138 = ""
+TISDK_TOOLCHAIN_EXTRA_TARGET_k3 = ""
 
 RDEPENDS_${PN} = "\
     ${QT_TOOLCHAIN_TARGET} \
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
index 21f5b18..ff57e12 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
@@ -55,6 +55,7 @@ do_install(){
 GUIDEPS = "matrix-gui-browser refresh-screen"
 GUIDEPS_keystone = ""
 GUIDEPS_omapl138 = ""
+GUIDEPS_k3 = ""
 
 RDEPENDS_${PN} += "matrix-lighttpd-config lighttpd lighttpd-module-cgi lighttpd-module-compress lighttpd-module-expire php php-cgi php-cli ${GUIDEPS}"
 
-- 
2.7.4


