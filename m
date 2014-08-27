Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTP id 680FE52A50
	for <meta-arago@arago-project.org>;
	Wed, 27 Aug 2014 21:12:43 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.18.33.160])
	by vms173023.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0NAZ00KTEHKRJK80@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 27 Aug 2014 16:12:28 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 4A7D520088; Wed,
	27 Aug 2014 17:12:27 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 27 Aug 2014 17:12:26 -0400
Message-id: <1409173946-7113-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.4
Subject: [PATCH v2] packagegroup-*-graphics: add weston packages globally
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
X-List-Received-Date: Wed, 27 Aug 2014 21:12:43 -0000

From: Denys Dmytriyenko <denys@ti.com>

As long as Weston compositor runs on top of either DRM or fbdev, should not
depend on SGX libs

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
v2 - extract weston in its own list

 .../packagegroups/packagegroup-arago-tisdk-graphics.bb   | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
index 1439638..9ec8cb7 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
@@ -1,11 +1,17 @@
 DESCRIPTION = "Task to install graphics binaries"
 LICENSE = "MIT"
-PR = "r5"
+PR = "r6"
 
 inherit packagegroup
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
+GRAPHICS_WESTON = "\
+    weston \
+    weston-init \
+    weston-examples \
+"
+
 GRAPHICS_SDK = "\
     libgles-omap3 \
     libgles-omap3-blitwsegl \
@@ -17,12 +23,8 @@ GRAPHICS_SDK = "\
 "
 
 GRAPHICS_RDEPENDS = ""
-
 GRAPHICS_RDEPENDS_ti33x = "\
     ${GRAPHICS_SDK} \
-    weston \
-    weston-init \
-    weston-examples \
 "
 
 GRAPHICS_RDEPENDS_ti43x = "\
@@ -37,7 +39,7 @@ GRAPHICS_RDEPENDS_omap-a15 = "\
     libgbm \
     omap5-sgx-ddk-um-linux \
     "
-# Put this back when compile issues are fixed against 3.12
+# Put this back when compile issues are fixed against 3.14
 #    omapdrm-pvr
 
 GRAPHICS_BLTSVILLE = ""
@@ -45,8 +47,8 @@ GRAPHICS_BLTSVILLE_omap-a15 = " \
     bltsville   \
     "
 
-
 RDEPENDS_${PN} = "\
+    ${GRAPHICS_WESTON} \
     ${GRAPHICS_RDEPENDS} \
     ${GRAPHICS_BLTSVILLE} \
 "
-- 
2.0.4


