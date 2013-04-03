Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 17C3852A47
	for <meta-arago@arago-project.org>;
	Wed,  3 Apr 2013 16:48:01 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r33GlxbG030315
	for <meta-arago@arago-project.org>; Wed, 3 Apr 2013 11:48:00 -0500
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r33Glwa9027731
	for <meta-arago@arago-project.org>; Wed, 3 Apr 2013 22:17:58 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by dbde70.ent.ti.com
	(172.24.170.148) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 3 Apr 2013 22:17:58 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r33Glp4U024120;
	Wed, 3 Apr 2013 22:17:57 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 3 Apr 2013 11:47:48 -0500
Message-ID: <1365007669-12577-4-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1365007669-12577-1-git-send-email-Chase.Maupin@ti.com>
References: <1365007669-12577-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 4/5] tisdk-readme: add README file to prebuilt images directory
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

* In the SDK prebuilt-images directory add a README file that
  details where the images belong on the SD card.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../tisdk-uenv.bb => tisdk-readme/tisdk-readme.bb} |    6 ++--
 .../recipes-tisdk/tisdk-readme/tisdk-readme/README |   21 ++++++++++++++++++++
 2 files changed, 24 insertions(+), 3 deletions(-)
 copy meta-arago-distro/recipes-tisdk/{tisdk-uenv/tisdk-uenv.bb => tisdk-readme/tisdk-readme.bb} (61%)
 create mode 100644 meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme/README

diff --git a/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv.bb b/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme.bb
similarity index 61%
copy from meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv.bb
copy to meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme.bb
index e67ea97..6fdcaff 100644
--- a/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv.bb
+++ b/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme.bb
@@ -1,9 +1,9 @@
-DESCRIPTION = "Package that will install a uEnv.txt file into the SDK prebuilt-binaries directory"
+DESCRIPTION = "Package that will install a README file into the SDK prebuilt-binaries directory"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 SRC_URI = "\
-    file://uEnv.txt \
+    file://README \
 "
 
 PR = "r0"
@@ -16,7 +16,7 @@ S = "${WORKDIR}"
 do_install () {
     install -d ${D}/board-support/prebuilt-images
 
-    install -m 0644 ${S}/uEnv.txt ${D}/board-support/prebuilt-images/
+    install -m 0644 ${S}/README ${D}/board-support/prebuilt-images/
 }
 
 FILES_${PN} += "board-support/*"
diff --git a/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme/README b/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme/README
new file mode 100644
index 0000000..1537fef
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme/README
@@ -0,0 +1,21 @@
+The files contained in this directory represent the images that were built
+as part of the original SDK build and packaging process.  They are meant
+to serve as a restore and starting point for your development.  In order
+to use these images with an SD card they should be placed in the appropriate
+locations.
+
+By default these locations are:
+
+================================================================================|       FILE       |                  LOCATION                                 |
+================================================================================
+|    MLO           | boot partition
+|    u-boot.img    | boot partition
+|    uEnv.txt      | boot partition
+|    uImage        | /boot directory of the rootfs partition
+|    *.dtb         | /boot directory of the rootfs partition
+================================================================================
+
+By default the boot loaders are read from the first FAT partition, which is
+usually called the "boot" partition.  Then the bootloader will look for the
+uImage and DTB files in the /boot directory of the EXT partition, which is
+usually called the "rootfs" partition.
-- 
1.7.0.4


