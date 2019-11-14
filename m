Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 5455D52A19
	for <meta-arago@arago-project.org>;
	Thu, 14 Nov 2019 02:07:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4169E40BF3;
	Thu, 14 Nov 2019 02:06:14 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id McQJQqWv3Q6A; Thu, 14 Nov 2019 02:06:14 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2016840BD2;
	Thu, 14 Nov 2019 02:06:13 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id C689B1742ED;
	Wed, 13 Nov 2019 21:06:12 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 13 Nov 2019 21:06:11 -0500
Message-Id: <1573697172-33633-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [RFC][PATCH 1/2] packagegroup: move "screenshot" util from amsdk to graphics packagegroup
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
X-List-Received-Date: Thu, 14 Nov 2019 02:07:40 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk.bb   | 7 +------
 .../packagegroups/packagegroup-arago-tisdk-graphics.bb             | 5 ++++-
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk.bb
index 42c6aef..20ba84c 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install additional packages only used in the Arago SDK"
 LICENSE = "MIT"
-PR = "r11"
+PR = "r12"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -17,11 +17,6 @@ OOBE_ti43x += "\
     parse-ip \
 "
 
-EXTRA_APPLICATIONS = "\
-    screenshot \
-"
-
 RDEPENDS_${PN} = "\
     ${OOBE} \
-    ${EXTRA_APPLICATIONS} \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
index f1a5ab6..420c628 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
@@ -14,7 +14,10 @@ GFX_WAYLAND = "\
     wayland-ivi-extension \
 "
 
-GFX_UTILS = ""
+GFX_UTILS = "\
+    screenshot \
+"
+
 GFX_UTILS_append_omap-a15  = "\
     glsdk-util-scripts \
 "
-- 
2.7.4


