Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id DA88C52975
	for <meta-arago@arago-project.org>;
	Fri, 31 Jan 2020 23:31:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B119F40BDA;
	Fri, 31 Jan 2020 23:29:56 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 9CB3tKf5j_6F; Fri, 31 Jan 2020 23:29:56 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9A8DD409E1;
	Fri, 31 Jan 2020 23:29:55 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 53DA51743CE;
	Fri, 31 Jan 2020 18:29:55 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 31 Jan 2020 18:29:55 -0500
Message-Id: <1580513395-40306-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [zeus/master][PATCH] packagegroups: rework inclusion of ti-img-rogue-driver based on "gpu" MACHINE_FEATURES
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
X-List-Received-Date: Fri, 31 Jan 2020 23:31:49 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb           | 1 -
 .../packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb         | 2 +-
 .../packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb       | 2 +-
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb     | 1 -
 4 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
index 321c396..bfdc61f 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
@@ -44,7 +44,6 @@ UTILS_append_k3 = " \
 
 UTILS_append_j7-evm = " \
     ti-img-encode-decode-src \
-    ti-img-rogue-driver-src \
     pru-icss-src \
 "
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb
index 486d080..e669765 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb
@@ -6,7 +6,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit packagegroup
 
-GRAPHICS_RDEPENDS = "${PREFERRED_PROVIDER_virtual/gpudriver}-src"
+GRAPHICS_RDEPENDS = "${@bb.utils.contains('MACHINE_FEATURES','gpu','${PREFERRED_PROVIDER_virtual/gpudriver}-src','',d)}"
 
 GRAPHICS_RDEPENDS_append_omap-a15 = "\
     ti-gc320-driver-src \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
index cea4c7a..f4652d5 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
@@ -12,7 +12,7 @@ GRAPHICS_RDEPENDS = "\
     wayland-dev \
     weston-dev \
     ${PREFERRED_PROVIDER_virtual/egl}-dev \
-    ${PREFERRED_PROVIDER_virtual/gpudriver}-dev \
+    ${@bb.utils.contains('MACHINE_FEATURES','gpu','${PREFERRED_PROVIDER_virtual/gpudriver}-dev','',d)} \
 "
 GRAPHICS_RDEPENDS_remove_j7-evm = "ti-sgx-ddk-km-dev"
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
index 49144e9..72f3efe 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
@@ -27,7 +27,6 @@ GRAPHICS_RDEPENDS = "\
     ${@bb.utils.contains('MACHINE_FEATURES','gpu','${PREFERRED_PROVIDER_virtual/gpudriver}','',d)} \
     ${@bb.utils.contains('MACHINE_FEATURES','gpu','glmark2','',d)} \
 "
-GRAPHICS_RDEPENDS_remove_j7-evm = "ti-sgx-ddk-km"
 
 GRAPHICS_DISPLAY_UTILS = "\
 "
-- 
2.7.4


