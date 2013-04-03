Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 857F052A47
	for <meta-arago@arago-project.org>;
	Wed,  3 Apr 2013 20:30:35 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r33KUWTS020953
	for <meta-arago@arago-project.org>; Wed, 3 Apr 2013 15:30:33 -0500
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r33KUV5R020063
	for <meta-arago@arago-project.org>; Thu, 4 Apr 2013 02:00:31 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by dbde70.ent.ti.com
	(172.24.170.148) with Microsoft SMTP Server id 14.1.323.3;
	Thu, 4 Apr 2013 02:00:30 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r33KURs6004679;
	Thu, 4 Apr 2013 02:00:29 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 3 Apr 2013 15:30:25 -0500
Message-ID: <1365021025-21393-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCHv2 4/5] tisdk-readme: add README file to prebuilt images directory
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
X-List-Received-Date: Wed, 03 Apr 2013 20:30:35 -0000
Content-Type: text/plain

* In the SDK prebuilt-images directory add a README file that
  details where the images belong on the SD card.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
* Updated in version 2
    * Fixed missing return in the README file

---
 .../recipes-tisdk/tisdk-readme/tisdk-readme.bb     |   22 ++++++++++++++++++++
 .../recipes-tisdk/tisdk-readme/tisdk-readme/README |   22 ++++++++++++++++++++
 2 files changed, 44 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme.bb
 create mode 100644 meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme/README

diff --git a/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme.bb b/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme.bb
new file mode 100644
index 0000000..6fdcaff
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "Package that will install a README file into the SDK prebuilt-binaries directory"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+SRC_URI = "\
+    file://README \
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
+    install -m 0644 ${S}/README ${D}/board-support/prebuilt-images/
+}
+
+FILES_${PN} += "board-support/*"
diff --git a/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme/README b/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme/README
new file mode 100644
index 0000000..873d1e8
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme/README
@@ -0,0 +1,22 @@
+The files contained in this directory represent the images that were built
+as part of the original SDK build and packaging process.  They are meant
+to serve as a restore and starting point for your development.  In order
+to use these images with an SD card they should be placed in the appropriate
+locations.
+
+By default these locations are:
+
+================================================================================
+|       FILE       |                  LOCATION                                 |
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


