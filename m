Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id A08DB52A4F
	for <meta-arago@arago-project.org>;
	Thu, 12 Sep 2019 15:39:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 88B1C40C0E;
	Thu, 12 Sep 2019 15:38:49 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id gWOJ-wuqWyGN; Thu, 12 Sep 2019 15:38:49 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6032340C15;
	Thu, 12 Sep 2019 15:38:48 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 02ABA174222;
	Thu, 12 Sep 2019 11:38:45 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu, 12 Sep 2019 11:38:36 -0400
Message-Id: <1568302717-46518-32-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568302717-46518-1-git-send-email-denys@ti.com>
References: <1568302717-46518-1-git-send-email-denys@ti.com>
Subject: [master][PATCH 31/32] packagegroup-*-graphics: disable chromium-wayland
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
X-List-Received-Date: Thu, 12 Sep 2019 15:40:12 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-graphics.bb       | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
index a44d2fc..bda595e 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
@@ -13,13 +13,13 @@ GRAPHICS_WAYLAND = "\
     weston-examples \
 "
 
-GRAPHICS_WAYLAND_append_omap-a15 = "\
-    ${@bb.utils.contains('MACHINE_FEATURES','gpu','chromium-wayland','',d)} \
-"
+#GRAPHICS_WAYLAND_append_omap-a15 = "\
+#    ${@bb.utils.contains('MACHINE_FEATURES','gpu','chromium-wayland','',d)} \
+#"
 
-GRAPHICS_WAYLAND_append_k3 = "\
-    ${@bb.utils.contains('MACHINE_FEATURES','gpu','chromium-wayland','',d)} \
-"
+#GRAPHICS_WAYLAND_append_k3 = "\
+#    ${@bb.utils.contains('MACHINE_FEATURES','gpu','chromium-wayland','',d)} \
+#"
 
 GRAPHICS_RDEPENDS = "\
     ${PREFERRED_PROVIDER_virtual/libgbm} \
-- 
2.7.4


