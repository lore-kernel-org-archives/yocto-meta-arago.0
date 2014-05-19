Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 93F5F529A6
	for <meta-arago@arago-project.org>;
	Mon, 19 May 2014 19:20:55 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4JJKs5a018378
	for <meta-arago@arago-project.org>; Mon, 19 May 2014 14:20:54 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4JJKsYT020901
	for <meta-arago@arago-project.org>; Mon, 19 May 2014 14:20:54 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 19 May 2014 14:20:54 -0500
Received: from sdit-build04.dal.design.ti.com (dbdp20.itg.ti.com
	[172.24.170.38])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s4JJK8CA001355;	Mon, 19 May 2014 14:20:53 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 19 May 2014 14:20:03 -0500
Message-ID: <1400527207-17021-16-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1400527207-17021-1-git-send-email-Chase.Maupin@ti.com>
References: <1400527207-17021-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 15/19] packagegroup-arago-tisdk-graphics: Add SGX and BLTsville packages
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
X-List-Received-Date: Mon, 19 May 2014 19:20:55 -0000
Content-Type: text/plain

* Add the SGX and BLTsville support for OMAP5 and DRA7xx machines
  where applicable.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 ...packagegroup-arago-tisdk-graphics-sdk-target.bb |   11 ++++++++++-
 .../packagegroup-arago-tisdk-graphics.bb           |   14 ++++++++++++++
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
index 8775cc5..9b1ba93 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install graphics binaries on sdk target"
 LICENSE = "MIT"
-PR = "r3"
+PR = "r4"
 
 inherit packagegroup
 
@@ -19,6 +19,15 @@ GRAPHICS_RDEPENDS_ti43x = "\
     libgles-omap3-dev \
 "
 
+GRAPHICS_RDEPENDS_omap-a15 = "\
+    libgbm-dev \
+    omap5-sgx-ddk-um-linux-dev \
+    "
+
+GRAPHICS_BLTSVILLE = ""
+GRAPHICS_BLTSVILLE_omap-a15 = " bltsville-dev"
+
 RDEPENDS_${PN} = "\
     ${GRAPHICS_RDEPENDS} \
+    ${GRAPHICS_BLTSVILLE} \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
index 76e7bf2..fd64022 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
@@ -32,6 +32,20 @@ GRAPHICS_RDEPENDS_omap3 = "\
     ${GRAPHICS_SDK} \
 "
 
+GRAPHICS_RDEPENDS_omap-a15 = "\
+    libgbm \
+    omap5-sgx-ddk-um-linux \
+    "
+# Put this back when compile issues are fixed against 3.12
+#    omapdrm-pvr
+
+GRAPHICS_BLTSVILLE = ""
+GRAPHICS_BLTSVILLE_omap-a15 = " \
+    bltsville   \
+    "
+
+
 RDEPENDS_${PN} = "\
     ${GRAPHICS_RDEPENDS} \
+    ${GRAPHICS_BLTSVILLE} \
 "
-- 
1.7.9.5


