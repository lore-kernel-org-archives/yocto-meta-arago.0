Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 5FDF75298F
	for <meta-arago@arago-project.org>;
	Thu, 13 Jun 2019 05:58:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BC5E640A9E;
	Thu, 13 Jun 2019 05:57:43 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id P1yD5FVBfuRl; Thu, 13 Jun 2019 05:57:43 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8C09C40A58;
	Thu, 13 Jun 2019 05:57:42 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 723B3170077;
	Thu, 13 Jun 2019 01:57:41 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu, 13 Jun 2019 01:57:39 -0400
Message-Id: <1560405460-31220-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud/master][PATCH 1/2] packagegroup-*-graphics: add libdrm, wayland, weston to devkit
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
X-List-Received-Date: Thu, 13 Jun 2019 05:58:24 -0000

Also abstract EGL/GLES component to use the corresponding PREFERRED_PROVIDER variable.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroup-arago-tisdk-graphics-sdk-host.bb            |  4 +++-
 .../packagegroup-arago-tisdk-graphics-sdk-target.bb          | 12 +++++++++---
 .../packagegroups/packagegroup-arago-tisdk-graphics.bb       |  6 ++++--
 3 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb
index d2dce0d..96ed27b 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb
@@ -1,6 +1,8 @@
 DESCRIPTION = "Task to install graphics sources in SDK"
 LICENSE = "MIT"
-PR = "r6"
+PR = "r7"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit packagegroup
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
index 573601b..7e18d08 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
@@ -1,13 +1,19 @@
 DESCRIPTION = "Task to install graphics binaries on sdk target"
 LICENSE = "MIT"
-PR = "r8"
+PR = "r9"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit packagegroup
 
 GRAPHICS_RDEPENDS = "\
     libgbm-dev \
-    ti-sgx-ddk-um-dev \
-    "
+    libdrm-dev \
+    wayland-dev \
+    weston-dev \
+    ${PREFERRED_PROVIDER_virtual/egl}-dev \
+    ti-sgx-ddk-km-dev \
+"
 
 GRAPHICS_RDEPENDS_append_omap-a15 = "\
     ti-gc320-libs-dev \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
index cb7f68b..69cfea5 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
@@ -1,6 +1,8 @@
 DESCRIPTION = "Task to install graphics binaries"
 LICENSE = "MIT"
-PR = "r23"
+PR = "r24"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit packagegroup
 
@@ -21,8 +23,8 @@ GRAPHICS_WAYLAND_append_k3 = "\
 
 GRAPHICS_RDEPENDS = "\
     libgbm \
+    ${PREFERRED_PROVIDER_virtual/egl} \
     ${@bb.utils.contains('MACHINE_FEATURES','sgx','ti-sgx-ddk-km','',d)} \
-    ti-sgx-ddk-um \
     ${@bb.utils.contains('MACHINE_FEATURES','sgx','glmark2','',d)} \
 "
 
-- 
2.7.4


