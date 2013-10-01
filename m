Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 22C9C52099
	for <meta-arago@arago-project.org>;
	Tue,  1 Oct 2013 17:19:22 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r91HJLnd020211
	for <meta-arago@arago-project.org>; Tue, 1 Oct 2013 12:19:21 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r91HJL1X017044
	for <meta-arago@arago-project.org>; Tue, 1 Oct 2013 12:19:21 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 1 Oct 2013 12:19:21 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r91HJHmB001903;
	Tue, 1 Oct 2013 12:19:19 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 1 Oct 2013 13:04:17 -0500
Message-ID: <1380650659-16536-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 1/3] Generalize PACKAGE_BOOT_UIMAGE variable
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
X-List-Received-Date: Tue, 01 Oct 2013 17:19:22 -0000
Content-Type: text/plain

* The device tree files along with the uImage sometimes aren't used in the boot
  partition.
* To reflect this change the variable PACKAGE_BOOT_UIMAGE to
  PACKAGE_BOOT_KERNEL_FILES.
* Also when this variable is set to false remove the kernel and dtb files from
  the boot partition instead of avoiding renaming it.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 configs/amsdk-config-05.06.00.00.txt     |   10 +++++-----
 configs/amsdk-config-05.07.00.00.txt     |   10 +++++-----
 configs/amsdk-config-06.00.00.00.txt     |   10 +++++-----
 configs/amsdk-config-07.00.00.00.txt     |   10 +++++-----
 configs/arago-core-amsdk-2013.04.01.txt  |   10 +++++-----
 configs/arago-core-tisdk-2013.04.00.txt  |   10 +++++-----
 configs/arago-core-tisdk-2013.04.01.txt  |   10 +++++-----
 configs/arago-core-tisdk-2013.04.02.txt  |   10 +++++-----
 configs/arago-core-tisdk-dylan-puget.txt |   10 +++++-----
 configs/arago-core-tisdk-puget.txt       |   10 +++++-----
 lib/oesdk/package-sdks                   |   12 ++++++++----
 11 files changed, 58 insertions(+), 54 deletions(-)

diff --git a/configs/amsdk-config-05.06.00.00.txt b/configs/amsdk-config-05.06.00.00.txt
index 706a24b..f2d3d1f 100644
--- a/configs/amsdk-config-05.06.00.00.txt
+++ b/configs/amsdk-config-05.06.00.00.txt
@@ -216,11 +216,11 @@ INSTALL_BUILDER_PROJECT="$SCRIPTS_ROOT/installer-files/tisdk.xml"
 # the symlink.
 SD_CARD_CONTENT="/home/jenkins/extra-files/sd_content"
 
-# This variable determines whether the uImage should be placed in the boot
-# partition tarball or not.  For newer kernel and u-boot combinations the
-# uImage is kept in the rootfs partition and placing it in the boot partition
-# will cause confusion.
-PACKAGE_BOOT_UIMAGE="true"
+# This variable determines whether the uImage and dtb files should be placed in
+# the boot partition tarball or not.  For newer kernel and u-boot combinations
+# the uImage and dtb files are kept in the rootfs partition and placing it in
+# the boot partition will cause confusion.
+PACKAGE_BOOT_KERNEL_FILES="true"
 
 # This variable points to the directory where the webgen tool has been
 # Installed.
diff --git a/configs/amsdk-config-05.07.00.00.txt b/configs/amsdk-config-05.07.00.00.txt
index 3b0ba8e..8a7107a 100644
--- a/configs/amsdk-config-05.07.00.00.txt
+++ b/configs/amsdk-config-05.07.00.00.txt
@@ -231,11 +231,11 @@ INSTALL_BUILDER_PROJECT="$SCRIPTS_ROOT/installer-files/tisdk.xml"
 # the symlink.
 SD_CARD_CONTENT="/home/jenkins/extra-files/sd_content"
 
-# This variable determines whether the uImage should be placed in the boot
-# partition tarball or not.  For newer kernel and u-boot combinations the
-# uImage is kept in the rootfs partition and placing it in the boot partition
-# will cause confusion.
-PACKAGE_BOOT_UIMAGE="true"
+# This variable determines whether the uImage and dtb files should be placed in
+# the boot partition tarball or not.  For newer kernel and u-boot combinations
+# the uImage and dtb files are kept in the rootfs partition and placing it in
+# the boot partition will cause confusion.
+PACKAGE_BOOT_KERNEL_FILES="true"
 
 # This variable points to the directory where the webgen tool has been
 # Installed.
diff --git a/configs/amsdk-config-06.00.00.00.txt b/configs/amsdk-config-06.00.00.00.txt
index edf8ba7..ea84183 100644
--- a/configs/amsdk-config-06.00.00.00.txt
+++ b/configs/amsdk-config-06.00.00.00.txt
@@ -237,11 +237,11 @@ INSTALL_BUILDER_PROJECT="$SCRIPTS_ROOT/installer-files/tisdk.xml"
 # the symlink.
 SD_CARD_CONTENT="/home/jenkins/extra-files/sd_content"
 
-# This variable determines whether the uImage should be placed in the boot
-# partition tarball or not.  For newer kernel and u-boot combinations the
-# uImage is kept in the rootfs partition and placing it in the boot partition
-# will cause confusion.
-PACKAGE_BOOT_UIMAGE="true"
+# This variable determines whether the uImage and dtb files should be placed in
+# the boot partition tarball or not.  For newer kernel and u-boot combinations
+# the uImage and dtb files are kept in the rootfs partition and placing it in
+# the boot partition will cause confusion.
+PACKAGE_BOOT_KERNEL_FILES="true"
 
 # This variable points to the directory where the webgen tool has been
 # Installed.
diff --git a/configs/amsdk-config-07.00.00.00.txt b/configs/amsdk-config-07.00.00.00.txt
index 1f4c86d..a011f83 100644
--- a/configs/amsdk-config-07.00.00.00.txt
+++ b/configs/amsdk-config-07.00.00.00.txt
@@ -237,11 +237,11 @@ INSTALL_BUILDER_PROJECT="$SCRIPTS_ROOT/installer-files/tisdk.xml"
 # the symlink.
 SD_CARD_CONTENT="/home/jenkins/extra-files/sd_content"
 
-# This variable determines whether the uImage should be placed in the boot
-# partition tarball or not.  For newer kernel and u-boot combinations the
-# uImage is kept in the rootfs partition and placing it in the boot partition
-# will cause confusion.
-PACKAGE_BOOT_UIMAGE="true"
+# This variable determines whether the uImage and dtb files should be placed in
+# the boot partition tarball or not.  For newer kernel and u-boot combinations
+# the uImage and dtb files are kept in the rootfs partition and placing it in
+# the boot partition will cause confusion.
+PACKAGE_BOOT_KERNEL_FILES="true"
 
 # This variable points to the directory where the webgen tool has been
 # Installed.
diff --git a/configs/arago-core-amsdk-2013.04.01.txt b/configs/arago-core-amsdk-2013.04.01.txt
index 4c7e1bd..420452b 100644
--- a/configs/arago-core-amsdk-2013.04.01.txt
+++ b/configs/arago-core-amsdk-2013.04.01.txt
@@ -239,11 +239,11 @@ INSTALL_BUILDER_PROJECT="$SCRIPTS_ROOT/installer-files/tisdk.xml"
 # the symlink.
 SD_CARD_CONTENT="/home/jenkins/extra-files/sd_content"
 
-# This variable determines whether the uImage should be placed in the boot
-# partition tarball or not.  For newer kernel and u-boot combinations the
-# uImage is kept in the rootfs partition and placing it in the boot partition
-# will cause confusion.
-PACKAGE_BOOT_UIMAGE="false"
+# This variable determines whether the uImage and dtb files should be placed in
+# the boot partition tarball or not.  For newer kernel and u-boot combinations
+# the uImage and dtb files are kept in the rootfs partition and placing it in
+# the boot partition will cause confusion.
+PACKAGE_BOOT_KERNEL_FILES="false"
 
 # This variable points to the directory where the webgen tool has been
 # Installed.
diff --git a/configs/arago-core-tisdk-2013.04.00.txt b/configs/arago-core-tisdk-2013.04.00.txt
index ef228ca..a811dbd 100644
--- a/configs/arago-core-tisdk-2013.04.00.txt
+++ b/configs/arago-core-tisdk-2013.04.00.txt
@@ -239,11 +239,11 @@ INSTALL_BUILDER_PROJECT="$SCRIPTS_ROOT/installer-files/tisdk.xml"
 # the symlink.
 SD_CARD_CONTENT="/home/jenkins/extra-files/sd_content"
 
-# This variable determines whether the uImage should be placed in the boot
-# partition tarball or not.  For newer kernel and u-boot combinations the
-# uImage is kept in the rootfs partition and placing it in the boot partition
-# will cause confusion.
-PACKAGE_BOOT_UIMAGE="true"
+# This variable determines whether the uImage and dtb files should be placed in
+# the boot partition tarball or not.  For newer kernel and u-boot combinations
+# the uImage and dtb files are kept in the rootfs partition and placing it in
+# the boot partition will cause confusion.
+PACKAGE_BOOT_KERNEL_FILES="true"
 
 # This variable points to the directory where the webgen tool has been
 # Installed.
diff --git a/configs/arago-core-tisdk-2013.04.01.txt b/configs/arago-core-tisdk-2013.04.01.txt
index ffeb1d2..35c9df3 100644
--- a/configs/arago-core-tisdk-2013.04.01.txt
+++ b/configs/arago-core-tisdk-2013.04.01.txt
@@ -239,11 +239,11 @@ INSTALL_BUILDER_PROJECT="$SCRIPTS_ROOT/installer-files/tisdk.xml"
 # the symlink.
 SD_CARD_CONTENT="/home/jenkins/extra-files/sd_content"
 
-# This variable determines whether the uImage should be placed in the boot
-# partition tarball or not.  For newer kernel and u-boot combinations the
-# uImage is kept in the rootfs partition and placing it in the boot partition
-# will cause confusion.
-PACKAGE_BOOT_UIMAGE="false"
+# This variable determines whether the uImage and dtb files should be placed in
+# the boot partition tarball or not.  For newer kernel and u-boot combinations
+# the uImage and dtb files are kept in the rootfs partition and placing it in
+# the boot partition will cause confusion.
+PACKAGE_BOOT_KERNEL_FILES="false"
 
 # This variable points to the directory where the webgen tool has been
 # Installed.
diff --git a/configs/arago-core-tisdk-2013.04.02.txt b/configs/arago-core-tisdk-2013.04.02.txt
index 55ba7d8..f2b1db8 100644
--- a/configs/arago-core-tisdk-2013.04.02.txt
+++ b/configs/arago-core-tisdk-2013.04.02.txt
@@ -239,11 +239,11 @@ INSTALL_BUILDER_PROJECT="$SCRIPTS_ROOT/installer-files/tisdk.xml"
 # the symlink.
 SD_CARD_CONTENT="/home/jenkins/extra-files/sd_content"
 
-# This variable determines whether the uImage should be placed in the boot
-# partition tarball or not.  For newer kernel and u-boot combinations the
-# uImage is kept in the rootfs partition and placing it in the boot partition
-# will cause confusion.
-PACKAGE_BOOT_UIMAGE="false"
+# This variable determines whether the uImage and dtb files should be placed in
+# the boot partition tarball or not.  For newer kernel and u-boot combinations
+# the uImage and dtb files are kept in the rootfs partition and placing it in
+# the boot partition will cause confusion.
+PACKAGE_BOOT_KERNEL_FILES="false"
 
 # This variable points to the directory where the webgen tool has been
 # Installed.
diff --git a/configs/arago-core-tisdk-dylan-puget.txt b/configs/arago-core-tisdk-dylan-puget.txt
index 5398e87..a2639f7 100644
--- a/configs/arago-core-tisdk-dylan-puget.txt
+++ b/configs/arago-core-tisdk-dylan-puget.txt
@@ -238,11 +238,11 @@ INSTALL_BUILDER_PROJECT="$SCRIPTS_ROOT/installer-files/tisdk.xml"
 # the symlink.
 SD_CARD_CONTENT="/home/jenkins/extra-files/sd_content"
 
-# This variable determines whether the uImage should be placed in the boot
-# partition tarball or not.  For newer kernel and u-boot combinations the
-# uImage is kept in the rootfs partition and placing it in the boot partition
-# will cause confusion.
-PACKAGE_BOOT_UIMAGE="false"
+# This variable determines whether the uImage and dtb files should be placed in
+# the boot partition tarball or not.  For newer kernel and u-boot combinations
+# the uImage and dtb files are kept in the rootfs partition and placing it in
+# the boot partition will cause confusion.
+PACKAGE_BOOT_KERNEL_FILES="false"
 
 # This variable points to the directory where the webgen tool has been
 # Installed.
diff --git a/configs/arago-core-tisdk-puget.txt b/configs/arago-core-tisdk-puget.txt
index 8e1fd98..cfda50f 100644
--- a/configs/arago-core-tisdk-puget.txt
+++ b/configs/arago-core-tisdk-puget.txt
@@ -238,11 +238,11 @@ INSTALL_BUILDER_PROJECT="$SCRIPTS_ROOT/installer-files/tisdk.xml"
 # the symlink.
 SD_CARD_CONTENT="/home/jenkins/extra-files/sd_content"
 
-# This variable determines whether the uImage should be placed in the boot
-# partition tarball or not.  For newer kernel and u-boot combinations the
-# uImage is kept in the rootfs partition and placing it in the boot partition
-# will cause confusion.
-PACKAGE_BOOT_UIMAGE="false"
+# This variable determines whether the uImage and dtb files should be placed in
+# the boot partition tarball or not.  For newer kernel and u-boot combinations
+# the uImage and dtb files are kept in the rootfs partition and placing it in
+# the boot partition will cause confusion.
+PACKAGE_BOOT_KERNEL_FILES="false"
 
 # This variable points to the directory where the webgen tool has been
 # Installed.
diff --git a/lib/oesdk/package-sdks b/lib/oesdk/package-sdks
index 148dadc..49f1fe7 100644
--- a/lib/oesdk/package-sdks
+++ b/lib/oesdk/package-sdks
@@ -42,15 +42,19 @@ create_sd_card_content() {
         mv u-boot-$m.bin u-boot.bin
     fi
 
-    # For some devices the uImage is read from the /boot directory of the
-    # rootfs.  In this case do not package the uImage into the boot partition
-    # as it will cause confusion.
-    if [ "$PACKAGE_BOOT_UIMAGE" = "true" ]
+    # For some devices the uImage  and dtb files are read from the /boot
+    # directory of the rootfs.  In this case do not package the uImage
+    # and device tree files into the boot partition as it will cause
+    # confusion.
+    if [ "$PACKAGE_BOOT_KERNEL_FILES" = "true" ]
     then
         if [ -e uImage-$m.bin ]
         then
             mv uImage-$m.bin uImage
         fi
+    else
+        rm -f uImage*
+        rm -f *.dtb
     fi
 
     # Copy the MLO if it exists for the device
-- 
1.7.0.4


