Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id B389552A51
	for <meta-arago@arago-project.org>;
	Wed, 12 Jul 2017 20:30:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8CEEC20C20;
	Wed, 12 Jul 2017 20:30:06 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 2NPEOJblUuj8; Wed, 12 Jul 2017 20:30:06 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6CB58207AF;
	Wed, 12 Jul 2017 20:30:05 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 050EF162529;
	Wed, 12 Jul 2017 16:30:05 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Wed, 12 Jul 2017 16:30:04 -0400
Message-Id: <1499891404-83318-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [morty/master][PATCH] packagegroup-*-graphics: add chromium-wayland
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
X-List-Received-Date: Wed, 12 Jul 2017 20:30:06 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-graphics.bb             | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
index 5dae1b5..9fe00f1 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
@@ -1,14 +1,15 @@
 DESCRIPTION = "Task to install graphics binaries"
 LICENSE = "MIT"
-PR = "r16"
+PR = "r17"
 
 inherit packagegroup
 
-GRAPHICS_WESTON = "\
+GRAPHICS_WAYLAND = "\
     weston \
     weston-init \
     weston-examples \
     wayland-ivi-extension \
+    chromium-wayland \
 "
 
 GRAPHICS_RDEPENDS = "\
@@ -25,6 +26,6 @@ GRAPHICS_RDEPENDS_append_omap-a15 = "\
 "
 
 RDEPENDS_${PN} = "\
-    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', "${GRAPHICS_WESTON}", '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', "${GRAPHICS_WAYLAND}", '', d)} \
     ${GRAPHICS_RDEPENDS} \
 "
-- 
2.7.4


