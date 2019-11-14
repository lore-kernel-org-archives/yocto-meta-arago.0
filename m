Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 4570652A1C
	for <meta-arago@arago-project.org>;
	Thu, 14 Nov 2019 01:20:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0CE4240BF2;
	Thu, 14 Nov 2019 01:19:05 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id g7yte02nEwcS; Thu, 14 Nov 2019 01:19:05 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D94EC40BF3;
	Thu, 14 Nov 2019 01:19:03 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 29B911742EE;
	Wed, 13 Nov 2019 20:19:02 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 13 Nov 2019 20:18:55 -0500
Message-Id: <1573694338-30083-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573694338-30083-1-git-send-email-denis@denix.org>
References: <1573694338-30083-1-git-send-email-denis@denix.org>
Subject: [RFC][PATCH 2/5] packagegroup-*-graphics*: cleanup #2 - drop chromium
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
X-List-Received-Date: Thu, 14 Nov 2019 01:20:31 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroup-arago-tisdk-graphics-sdk-host.bb           |  3 +--
 .../packagegroup-arago-tisdk-graphics-sdk-target.bb         |  8 ++------
 .../packagegroups/packagegroup-arago-tisdk-graphics.bb      | 13 +------------
 3 files changed, 4 insertions(+), 20 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb
index 8f6d112..5290d5e 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb
@@ -4,8 +4,7 @@ PR = "r8"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-inherit packagegroup
-inherit machine_features_check
+inherit packagegroup machine_features_check
 
 REQUIRED_MACHINE_FEATURES = "gpu"
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
index 63cd882..28fb1d3 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
@@ -1,17 +1,13 @@
-DESCRIPTION = "Task to install graphics binaries on sdk target"
+DESCRIPTION = "Task to install graphics packages in SDK target"
 LICENSE = "MIT"
 PR = "r10"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-inherit packagegroup
-inherit machine_features_check
+inherit packagegroup machine_features_check
 
 REQUIRED_MACHINE_FEATURES = "gpu"
 
-GRAPHICS_RDEPENDS = "\
-"
-
 RDEPENDS_${PN} = "\
     libegl-dev \
     libdrm-dev \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
index 37e1606..f1a5ab6 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
@@ -4,8 +4,7 @@ PR = "r26"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-inherit packagegroup
-inherit machine_features_check
+inherit packagegroup machine_features_check
 
 REQUIRED_MACHINE_FEATURES = "gpu"
 
@@ -15,15 +14,6 @@ GFX_WAYLAND = "\
     wayland-ivi-extension \
 "
 
-GFX_CHROMIUM = ""
-GFX_CHROMIUM_append_omap-a15 = "\
-    chromium-wayland \
-"
-
-GFX_CHROMIUM_append_k3 = "\
-    chromium-wayland \
-"
-
 GFX_UTILS = ""
 GFX_UTILS_append_omap-a15  = "\
     glsdk-util-scripts \
@@ -34,6 +24,5 @@ RDEPENDS_${PN} = "\
     glmark2 \
     ${@bb.utils.contains('MACHINE_FEATURES', 'gc320', 'ti-gc320-tests', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', "${GFX_WAYLAND}", '', d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', "${GFX_CHROMIUM}", '', d)} \
     ${GFX_UTILS} \
 "
-- 
2.7.4


