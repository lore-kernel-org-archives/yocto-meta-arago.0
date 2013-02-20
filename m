Return-Path: <ceh@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id A5A2B52A2C
	for <meta-arago@arago-project.org>;
	Wed, 20 Feb 2013 22:26:06 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r1KMQ17Q015194
	for <meta-arago@arago-project.org>; Wed, 20 Feb 2013 16:26:01 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r1KMQ1tl010052
	for <meta-arago@arago-project.org>; Wed, 20 Feb 2013 16:26:01 -0600
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 20 Feb 2013 16:26:00 -0600
Received: from localhost.localdomain (gtdev04-a0850405.am.dhcp.ti.com
	[10.218.102.32])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	r1KMQ0RM022750;	Wed, 20 Feb 2013 16:26:00 -0600
From: Carlos Hernandez <ceh@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 20 Feb 2013 17:42:56 -0500
Message-ID: <1361400177-5858-3-git-send-email-ceh@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1361400177-5858-1-git-send-email-ceh@ti.com>
References: <1361400177-5858-1-git-send-email-ceh@ti.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] Define arago-test-image
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
X-List-Received-Date: Wed, 20 Feb 2013 22:26:10 -0000
Content-Type: text/plain

Signed-off-by: Carlos Hernandez <ceh@ti.com>
---
 .../recipes-core/images/arago-test-image.bb        |   21 ++++++++++++++++++++
 .../packagegroup-arago-test-addons.bb              |   20 +++++++++++++++++++
 2 files changed, 41 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-core/images/arago-test-image.bb
 create mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb

diff --git a/meta-arago-distro/recipes-core/images/arago-test-image.bb b/meta-arago-distro/recipes-core/images/arago-test-image.bb
new file mode 100644
index 0000000..49e5a8d
--- /dev/null
+++ b/meta-arago-distro/recipes-core/images/arago-test-image.bb
@@ -0,0 +1,21 @@
+# Arago System Test image
+# gives you test applications
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
+
+require arago-image.inc
+
+COMPATIBLE_MACHINE = "omap3|dm365|omapl138|ti813x|ti814x|ti816x|omap4|ti33x"
+
+IMAGE_INSTALL += "\
+    packagegroup-arago-base \
+    packagegroup-arago-console \
+    packagegroup-arago-base-tisdk \
+    packagegroup-arago-tisdk-crypto \
+    packagegroup-arago-tisdk-multimedia \
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
1.7.0.4


