Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTP id 0ACA752A78
	for <meta-arago@arago-project.org>;
	Mon, 25 Aug 2014 20:32:23 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.18.33.160])
	by vms173023.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0NAV00IDYQDE6I80@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 25 Aug 2014 15:32:03 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 7E37720085; Mon,
	25 Aug 2014 16:32:02 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 25 Aug 2014 16:32:02 -0400
Message-id: <1408998722-12639-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.4
Subject: [PATCH] images, packagegroups: don't build Qt for Keystone devices
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
X-List-Received-Date: Mon, 25 Aug 2014 20:32:23 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/images/arago-core-tisdk-image.inc             | 10 +++++++++-
 .../packagegroups/packagegroup-arago-toolchain-tisdk-target.bb | 10 ++++++++--
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
index 2932714..70dce1c 100644
--- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
@@ -31,12 +31,20 @@ TARGET_IMAGES_keystone = "arago-base-tisdk-image tisdk-server-rootfs-image"
 
 TISDK_TOOLCHAIN = "meta-toolchain-arago-tisdk"
 
+TISDK_TOOLCHAIN_keystone = "meta-toolchain-arago"
+
+IMAGE_INSTALL_QT = "\
+    packagegroup-arago-tisdk-qte-sdk-host \
+"
+
+IMAGE_INSTALL_QT_keystone = ""
+
 IMAGE_INSTALL = "\
     packagegroup-arago-tisdk-addons-sdk-host \
     packagegroup-arago-tisdk-connectivity-sdk-host \
     packagegroup-arago-tisdk-crypto-sdk-host \
     packagegroup-arago-tisdk-matrix-sdk-host \
     packagegroup-arago-tisdk-multimedia-sdk-host \
-    packagegroup-arago-tisdk-qte-sdk-host \
     packagegroup-arago-tisdk-amsdk-sdk-host \
+    ${IMAGE_INSTALL_QT} \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb
index 495a0e4..43623b6 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb
@@ -1,13 +1,19 @@
 DESCRIPTION = "Task to build and install header and libs into the sdk"
 LICENSE = "MIT"
-PR = "r5"
+PR = "r6"
 
 inherit packagegroup
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-RDEPENDS_${PN} = "\
+QT_TOOLCHAIN_TARGET = "\
     packagegroup-arago-qte-toolchain-target \
+"
+
+QT_TOOLCHAIN_TARGET_keystone = ""
+
+RDEPENDS_${PN} = "\
+    ${QT_TOOLCHAIN_TARGET} \
     packagegroup-arago-tisdk-multimedia-sdk-target \
     packagegroup-arago-tisdk-connectivity-sdk-target \
     packagegroup-arago-tisdk-crypto-sdk-target \
-- 
2.0.4


