Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 80362529CA
	for <meta-arago@arago-project.org>;
	Tue, 26 Mar 2019 03:14:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4940E40B66;
	Tue, 26 Mar 2019 03:14:15 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id MCqampdft8wJ; Tue, 26 Mar 2019 03:14:15 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-81-231.washdc.fios.verizon.net
	[100.15.81.231])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2EB5C407DA;
	Tue, 26 Mar 2019 03:14:14 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id DA4D916D279;
	Mon, 25 Mar 2019 23:14:13 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Mon, 25 Mar 2019 23:14:13 -0400
Message-Id: <1553570053-5716-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud/master][PATCH] FIXME: packagegroup-*-graphics: disable chromium for now
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
X-List-Received-Date: Tue, 26 Mar 2019 03:14:29 -0000

There are some issues with the new toolchain still being debugged.
The new toolchain ends up producing a huge corrupted binary several GB in size.
In some cases (e.g. aarch64) it may run out of memory when compiling/linking.
Moreover, the version of chromium we use is quote outdated (2+ years now).
Until those issues are resolved, disable chromium.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-graphics.bb       | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
index e12c42a..ae70633 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
@@ -11,13 +11,13 @@ GRAPHICS_WAYLAND = "\
     weston-examples \
 "
 
-GRAPHICS_WAYLAND_append_omap-a15 = "\
-    chromium-wayland \
-"
+#GRAPHICS_WAYLAND_append_omap-a15 = "\
+#    chromium-wayland \
+#"
 
-GRAPHICS_WAYLAND_append_k3 = "\
-    chromium-wayland \
-"
+#GRAPHICS_WAYLAND_append_k3 = "\
+#    chromium-wayland \
+#"
 
 GRAPHICS_RDEPENDS = "\
     libgbm \
-- 
2.7.4


