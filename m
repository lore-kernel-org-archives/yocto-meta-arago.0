Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id AAB53529CC
	for <meta-arago@arago-project.org>;
	Tue,  5 Sep 2017 23:09:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5B915209BD;
	Tue,  5 Sep 2017 23:09:55 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id hJ6gfGiSPdud; Tue,  5 Sep 2017 23:09:55 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2CF5520999;
	Tue,  5 Sep 2017 23:09:54 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 9C6571625EE;
	Tue,  5 Sep 2017 19:09:53 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Tue,  5 Sep 2017 19:09:51 -0400
Message-Id: <1504652992-35063-3-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1504652992-35063-1-git-send-email-denys@ti.com>
References: <1504652992-35063-1-git-send-email-denys@ti.com>
Subject: [morty/master][PATCH 3/4] packagegroup-*-graphics: add chromium-wayland for A15 platforms
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
X-List-Received-Date: Tue, 05 Sep 2017 23:09:56 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-graphics.bb        | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
index 5dae1b5..b19e759 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
@@ -1,23 +1,26 @@
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
 "
 
+GRAPHICS_WAYLAND_append_omap-a15 = "\
+    chromium-wayland \
+"
+
 GRAPHICS_RDEPENDS = "\
     libgbm \
     ti-sgx-ddk-km \
     ti-sgx-ddk-um \
 "
 
-
 GRAPHICS_RDEPENDS_append_omap-a15 = "\
     ti-gc320-tests \
     ti-gc320-driver \
@@ -25,6 +28,6 @@ GRAPHICS_RDEPENDS_append_omap-a15 = "\
 "
 
 RDEPENDS_${PN} = "\
-    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', "${GRAPHICS_WESTON}", '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', "${GRAPHICS_WAYLAND}", '', d)} \
     ${GRAPHICS_RDEPENDS} \
 "
-- 
2.7.4


