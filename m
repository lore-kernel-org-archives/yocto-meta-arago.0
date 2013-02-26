Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f175.google.com (mail-ob0-f175.google.com
	[209.85.214.175])
	by arago-project.org (Postfix) with ESMTPS id E44FB52A6B
	for <meta-arago@arago-project.org>;
	Tue, 26 Feb 2013 03:33:01 +0000 (UTC)
Received: by mail-ob0-f175.google.com with SMTP id uz6so11222obc.34
	for <meta-arago@arago-project.org>;
	Mon, 25 Feb 2013 19:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=3n5kyEaQl8UEbRniybpYRV80GBpzfDlVFhzKIFXhrgo=;
	b=tY3mxx0uDKPowyAXiN0ezTPvLP3FGKBVVnzOS/OstMs06oOCDB4K6XTXky8pMjXdOU
	EwtPNHyx/i8DBVI5K3lnqNSCV8FeX6JTcTRAUaFGzo5Dka78h4uRKj0yLBc2w1Nw7bZg
	vPxZWRfnH94ZBiHpCvg/iM3J3hqXy5wlC0vTqpjE9tyINlIyf6ICXVgxi8ug5fmbUVMI
	gVhbruXIrbtahEzMI7cxCq3Em+D7OnkJlK5/fvSRlnZr7DAzeGO8ZJJSxgF7YXKh7Y9d
	HddCPY6Y2OvktNkKhwTcTUJXK5F9TwUYfBP2QAVXWNrgdZjhHND676p+Y4moo5U+aWkw
	pSVA==
X-Received: by 10.60.21.38 with SMTP id s6mr170750oee.3.1361849580870;
	Mon, 25 Feb 2013 19:33:00 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id p2sm17587176obb.6.2013.02.25.19.32.58
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 25 Feb 2013 19:32:59 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Mon, 25 Feb 2013 21:32:45 -0600
Message-Id: <1361849574-7710-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 01/10] arago.conf: Add sgx MACHINE_FEATURES support
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
X-List-Received-Date: Tue, 26 Feb 2013 03:33:02 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* Meta-ti added sgx to the list of MACHINE_FEATURES.
* Use this variable to determine if packagegroups/recipes that depend on sgx
  should be used or not.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf           |    4 +---
 .../recipes-core/images/tisdk-rootfs-image.bb      |    2 +-
 .../packagegroup-arago-tisdk-matrix.bb             |    6 +++---
 .../packagegroup-arago-toolchain-tisdk-target.bb   |    6 ++++--
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 9aef151..bc75ff2 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -45,9 +45,7 @@ PREFERRED_VERSION_hostap-daemon = "2.0-devel-ti"
 PREFERRED_VERSION_omap3-sgx-modules = "4.08.00.01"
 PREFERRED_VERSION_libgles-omap3 = "4.08.00.01"
 
-ARAGO_QT_PROVIDER = "qt4-embedded"
-# Enable Qt+GLES for ARM v7a devices
-ARAGO_QT_PROVIDER_armv7a = "qt4-embedded-gles"
+ARAGO_QT_PROVIDER = "${@base_contains('MACHINE_FEATURES','sgx','qt4-embedded-gles','qt4-embedded',d)}"
 
 PREFERRED_PROVIDER_qt4-embedded = "${ARAGO_QT_PROVIDER}"
 
diff --git a/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb b/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
index f5215d1..d6924d1 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
@@ -5,7 +5,7 @@ require arago-base-tisdk-image.bb
 
 IMAGE_INSTALL += "\
     packagegroup-arago-test \
-    packagegroup-arago-tisdk-graphics \
+    ${@base_contains('MACHINE_FEATURES','sgx','packagegroup-arago-tisdk-graphics','',d)} \
     packagegroup-arago-tisdk-qte \
     packagegroup-arago-tisdk-addons \
     packagegroup-arago-tisdk-connectivity \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index 4c41265..46c9a2a 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to include Matrix v2"
 LICENSE = "MIT"
-PR = "r9"
+PR = "r10"
 
 inherit packagegroup
 
@@ -36,13 +36,13 @@ MATRIX_QT_APPS_keystone = ""
 MATRIX_APPS = ""
 
 MATRIX_APPS_append_omap3 = "        \
-    matrix-gui-3d-demos             \
+    ${@base_contains('MACHINE_FEATURES','sgx','matrix-gui-3d-demos','',d)} \
     matrix-gui-multimedia-demos     \
 "
 
 MATRIX_APPS_append_ti33x = "        \
     matrix-gui-ethernet-demos       \
-    matrix-gui-3d-demos             \
+    ${@base_contains('MACHINE_FEATURES','sgx','matrix-gui-3d-demos','',d)} \
     matrix-gui-multimedia-demos     \
                                     \
     matrix-gui-clocks-275mhz        \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb
index ecc06b6..495a0e4 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb
@@ -1,14 +1,16 @@
 DESCRIPTION = "Task to build and install header and libs into the sdk"
 LICENSE = "MIT"
-PR = "r4"
+PR = "r5"
 
 inherit packagegroup
 
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
 RDEPENDS_${PN} = "\
     packagegroup-arago-qte-toolchain-target \
     packagegroup-arago-tisdk-multimedia-sdk-target \
     packagegroup-arago-tisdk-connectivity-sdk-target \
     packagegroup-arago-tisdk-crypto-sdk-target \
-    packagegroup-arago-tisdk-graphics-sdk-target \
+    ${@base_contains('MACHINE_FEATURES','sgx','packagegroup-arago-tisdk-graphics-sdk-target','',d)} \
     packagegroup-arago-tisdk-addons-sdk-target \
 "
-- 
1.7.0.4


