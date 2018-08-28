Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id DC34A529EE
	for <meta-arago@arago-project.org>;
	Tue, 28 Aug 2018 02:05:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0D55A20C20;
	Tue, 28 Aug 2018 02:05:40 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id L1NG6VlzAx3X; Tue, 28 Aug 2018 02:05:39 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DC568206EB;
	Tue, 28 Aug 2018 02:05:38 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 63EC71635D9;
	Mon, 27 Aug 2018 22:05:38 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 27 Aug 2018 22:05:37 -0400
Message-Id: <1535421937-8146-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [rocko/master][PATCH] packagegroup-*-graphics: add chromium-wayland for k3
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
X-List-Received-Date: Tue, 28 Aug 2018 02:05:48 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
index 75cd9bc..b772ffd 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install graphics binaries"
 LICENSE = "MIT"
-PR = "r20"
+PR = "r21"
 
 inherit packagegroup
 
@@ -15,6 +15,10 @@ GRAPHICS_WAYLAND_append_omap-a15 = "\
     chromium-wayland \
 "
 
+GRAPHICS_WAYLAND_append_k3 = "\
+    chromium-wayland \
+"
+
 # Temporarily disable glmark2 due to gcc7/gles? issues
 #    glmark2
 GRAPHICS_RDEPENDS = "\
-- 
2.7.4


