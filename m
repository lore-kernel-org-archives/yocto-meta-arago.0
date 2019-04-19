Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 4926D52A0D
	for <meta-arago@arago-project.org>;
	Fri, 19 Apr 2019 23:17:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A02BE40A3D;
	Fri, 19 Apr 2019 23:17:14 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 8uZ6le2Wpl6h; Fri, 19 Apr 2019 23:17:14 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 899F140B66;
	Fri, 19 Apr 2019 23:17:13 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 72CF216DC72;
	Fri, 19 Apr 2019 19:17:12 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Fri, 19 Apr 2019 19:17:11 -0400
Message-Id: <1555715831-1260-2-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1555715831-1260-1-git-send-email-denys@ti.com>
References: <1555715831-1260-1-git-send-email-denys@ti.com>
Subject: [thud/master][PATCH 2/2] packagegroup-*-graphics: re-enable chromium
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
X-List-Received-Date: Fri, 19 Apr 2019 23:17:37 -0000

This reverts commit 33a759c5cc7c3786908b417c68132d67f582b381.
---
 .../packagegroups/packagegroup-arago-tisdk-graphics.bb       | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
index ae70633..e12c42a 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
@@ -11,13 +11,13 @@ GRAPHICS_WAYLAND = "\
     weston-examples \
 "
 
-#GRAPHICS_WAYLAND_append_omap-a15 = "\
-#    chromium-wayland \
-#"
+GRAPHICS_WAYLAND_append_omap-a15 = "\
+    chromium-wayland \
+"
 
-#GRAPHICS_WAYLAND_append_k3 = "\
-#    chromium-wayland \
-#"
+GRAPHICS_WAYLAND_append_k3 = "\
+    chromium-wayland \
+"
 
 GRAPHICS_RDEPENDS = "\
     libgbm \
-- 
2.7.4


