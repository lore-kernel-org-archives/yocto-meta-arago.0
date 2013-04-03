Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id A5C1A52A35
	for <meta-arago@arago-project.org>;
	Wed,  3 Apr 2013 16:48:01 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r33GltXF030153
	for <meta-arago@arago-project.org>; Wed, 3 Apr 2013 11:47:56 -0500
Received: from DBDE71.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r33Gls5X027718
	for <meta-arago@arago-project.org>; Wed, 3 Apr 2013 22:17:55 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by DBDE71.ent.ti.com
	(172.24.170.149) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 3 Apr 2013 22:17:54 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r33Glp4R024120;
	Wed, 3 Apr 2013 22:17:53 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 3 Apr 2013 11:47:45 -0500
Message-ID: <1365007669-12577-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 1/5] tisdk-uenv: Add ability to package uEnv files for U-Boot
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
X-List-Received-Date: Wed, 03 Apr 2013 16:48:08 -0000
Content-Type: text/plain

* Add the ability to add a uEnv.txt file into the prebuilt-images
  directory of the SDK.
* By default package a file with comments explaining how to use
  the uEnv.txt file.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../recipes-tisdk/tisdk-uenv/tisdk-uenv.bb         |   22 ++++++++++++++++++++
 .../tisdk-uenv/tisdk-uenv/omap5-evm/uEnv.txt       |   11 ++++++++++
 .../recipes-tisdk/tisdk-uenv/tisdk-uenv/uEnv.txt   |    9 ++++++++
 3 files changed, 42 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv.bb
 create mode 100644 meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/omap5-evm/uEnv.txt
 create mode 100644 meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/uEnv.txt

diff --git a/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv.bb b/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv.bb
new file mode 100644
index 0000000..e67ea97
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "Package that will install a uEnv.txt file into the SDK prebuilt-binaries directory"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+SRC_URI = "\
+    file://uEnv.txt \
+"
+
+PR = "r0"
+PV = "1.0"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+S = "${WORKDIR}"
+
+do_install () {
+    install -d ${D}/board-support/prebuilt-images
+
+    install -m 0644 ${S}/uEnv.txt ${D}/board-support/prebuilt-images/
+}
+
+FILES_${PN} += "board-support/*"
diff --git a/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/omap5-evm/uEnv.txt b/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/omap5-evm/uEnv.txt
new file mode 100644
index 0000000..6f726f5
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/omap5-evm/uEnv.txt
@@ -0,0 +1,11 @@
+# This uEnv.txt file can contain additional environment settings that you
+# want to set in U-Boot at boot time.  This can be simple variables such
+# as the serverip or custom variables.  The format of this file is:
+#    variable=value
+# NOTE: This file will be evaluated after the bootcmd is run and the
+#       bootcmd must be set to load this file if it exists (this is the
+#       default on all newer U-Boot images.  This also means that some
+#       variables such as bootdelay cannot be changed by this file since
+#       it is not evaluated until the bootcmd is run.
+bootdir=/boot
+bootpart=0:2
diff --git a/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/uEnv.txt b/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/uEnv.txt
new file mode 100644
index 0000000..0af0eef
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/uEnv.txt
@@ -0,0 +1,9 @@
+# This uEnv.txt file can contain additional environment settings that you
+# want to set in U-Boot at boot time.  This can be simple variables such
+# as the serverip or custom variables.  The format of this file is:
+#    variable=value
+# NOTE: This file will be evaluated after the bootcmd is run and the
+#       bootcmd must be set to load this file if it exists (this is the
+#       default on all newer U-Boot images.  This also means that some
+#       variables such as bootdelay cannot be changed by this file since
+#       it is not evaluated until the bootcmd is run.
-- 
1.7.0.4


