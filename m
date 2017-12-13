Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 6F5F952093
	for <meta-arago@arago-project.org>;
	Wed, 13 Dec 2017 17:57:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id EE22F208CC;
	Wed, 13 Dec 2017 17:57:09 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id sTdr89r2fcSJ; Wed, 13 Dec 2017 17:57:09 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CE89A20433;
	Wed, 13 Dec 2017 17:57:08 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 5C62C162717;
	Wed, 13 Dec 2017 12:57:08 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Wed, 13 Dec 2017 12:57:07 -0500
Message-Id: <1513187827-114020-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] FIXME: packagegroup-*-graphics: disable glmark2 due to gles breakage
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
X-List-Received-Date: Wed, 13 Dec 2017 17:57:10 -0000

[LCPD-11417]

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb  | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
index 0545644..8029665 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install graphics binaries"
 LICENSE = "MIT"
-PR = "r19"
+PR = "r20"
 
 inherit packagegroup
 
@@ -15,11 +15,12 @@ GRAPHICS_WAYLAND_append_omap-a15 = "\
     chromium-wayland \
 "
 
+# Temporarily disable glmark2 due to gcc7/gles? issues
+#    glmark2
 GRAPHICS_RDEPENDS = "\
     libgbm \
     ti-sgx-ddk-km \
     ti-sgx-ddk-um \
-    glmark2 \
 "
 
 GRAPHICS_DISPLAY_UTILS = "\
-- 
2.7.4


