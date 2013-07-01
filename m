Return-Path: <denis@denix.org>
Received: from vms173001pub.verizon.net (vms173001pub.verizon.net
	[206.46.173.1])
	by arago-project.org (Postfix) with ESMTP id 20AE252AAD
	for <meta-arago@arago-project.org>;
	Mon,  1 Jul 2013 19:00:38 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MP9001CXU4MYVK0@vms173001.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 01 Jul 2013 14:00:37 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 2883A20011; Mon,
	01 Jul 2013 15:00:22 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 01 Jul 2013 15:00:21 -0400
Message-id: <1372705221-6512-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.2.1
Subject: [PATCH] arago-test: define system test packagegroup and image
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
X-List-Received-Date: Mon, 01 Jul 2013 19:00:38 -0000

From: Denys Dmytriyenko <denys@ti.com>

This is based on the original patch from Carlos Hernandez with following mods:
* Build tar.gz and ext2.gz - good for RAMDISK/SD/NFS
* Relax compatibility list to be generic
* Remove large multimedia packagegroup to better fit into RAM

Cc: Carlos Hernandez <ceh@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/images/arago-test-image.bb          | 20 ++++++++++++++++++++
 .../packagegroups/packagegroup-arago-test-addons.bb  | 20 ++++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 meta-arago-distro/recipes-core/images/arago-test-image.bb
 create mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb

diff --git a/meta-arago-distro/recipes-core/images/arago-test-image.bb b/meta-arago-distro/recipes-core/images/arago-test-image.bb
new file mode 100644
index 0000000..403041f
--- /dev/null
+++ b/meta-arago-distro/recipes-core/images/arago-test-image.bb
@@ -0,0 +1,20 @@
+# Arago System Test image
+# gives you test applications
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
+
+require arago-image.inc
+
+IMAGE_FSTYPES = "tar.gz ext2.gz"
+
+IMAGE_INSTALL += "\
+    packagegroup-arago-base \
+    packagegroup-arago-console \
+    packagegroup-arago-base-tisdk \
+    packagegroup-arago-tisdk-crypto \
+    packagegroup-arago-tisdk-addons \
+    packagegroup-arago-test \
+    packagegroup-arago-test-addons \
+    "
+
+export IMAGE_BASENAME = "arago-test-image"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb
new file mode 100644
index 0000000..3f44133
--- /dev/null
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "Task to install additional utilities/demos for test image"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+PR = "r0"
+
+ALLOW_EMPTY = "1"
+
+inherit packagegroup
+
+TEST_ADDONS = " \
+    bridge-utils \
+    "
+
+TEST_ADDONS_TI = " \
+    "
+
+RDEPENDS_${PN} = "\
+    ${TEST_ADDONS} \
+    ${TEST_ADDONS_TI} \
+    "
-- 
1.8.2.1


