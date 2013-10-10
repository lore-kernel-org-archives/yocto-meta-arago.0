Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 606D05299B
	for <meta-arago@arago-project.org>;
	Thu, 10 Oct 2013 21:57:02 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9ALv1aq004623
	for <meta-arago@arago-project.org>; Thu, 10 Oct 2013 16:57:01 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9ALv0GD002205
	for <meta-arago@arago-project.org>; Thu, 10 Oct 2013 16:57:01 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 10 Oct 2013 16:57:01 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9ALuvtL014817;
	Thu, 10 Oct 2013 16:56:59 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 10 Oct 2013 17:45:01 -0500
Message-ID: <1381445101-27904-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [tisdk-build-scripts][PATCH v2] tisdk-build-scripts: Allow support for uImage and zImage
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
X-List-Received-Date: Thu, 10 Oct 2013 21:57:02 -0000
Content-Type: text/plain

* There is a possibility some SDKs will use uImage while others will use
  zImage.
* Support both choices.

Version 2 changes:
* Rebase and drop 1 out of the 3 changes that were already in mainline.
* Simplify if statement conditional.
* Use Bash's regular expression expansion capability.
* Fix inconsistent variable name usage.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 lib/oesdk/bitbake-test-sdk-image |    2 +-
 lib/oesdk/package-sdks           |   15 ++++++++-------
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/lib/oesdk/bitbake-test-sdk-image b/lib/oesdk/bitbake-test-sdk-image
index 9122d89..7baa106 100644
--- a/lib/oesdk/bitbake-test-sdk-image
+++ b/lib/oesdk/bitbake-test-sdk-image
@@ -174,7 +174,7 @@ extract_sdk_image() {
         cp $sdk_path/$filesys $test_dir/temp/filesystem
 
         # Find the kernel image
-        kernel=`find ./$sdk_path -name "uImage-$m.bin" | xargs basename`
+        kernel=`find ./$sdk_path -name "[uz]Image-$m.bin" | xargs basename`
         # This is a critical failure and will not be able to be skipped
         if [ -z "$kernel" ]
         then
diff --git a/lib/oesdk/package-sdks b/lib/oesdk/package-sdks
index 8f4e5e2..d6b01f7 100644
--- a/lib/oesdk/package-sdks
+++ b/lib/oesdk/package-sdks
@@ -48,18 +48,19 @@ create_sd_card_content() {
         rm u-boot-spl.bin-$m
     fi
 
-    # For some devices the uImage  and dtb files are read from the /boot
-    # directory of the rootfs.  In this case do not package the uImage
-    # and device tree files into the boot partition as it will cause
-    # confusion.
+    # For some devices the uImage/zImage and dtb files are read
+    # from the /boot directory of the rootfs. In this case do
+    # not package the uImage/zImage and device tree files into
+    # the boot partition as it will cause confusion.
     if [ "$PACKAGE_BOOT_KERNEL_FILES" = "true" ]
     then
-        if [ -e uImage-$m.bin ]
+        if [ -e [uz]Image-$m.bin ]
         then
-            mv uImage-$m.bin uImage
+            kernel_image=`ls [uz]Image-$m.bin | grep -o [uz]Image`
+            mv [uz]Image-$m.bin $kernel_image
         fi
     else
-        rm -f uImage*
+        rm -f [uz]Image*
         rm -f *.dtb
     fi
 
-- 
1.7.0.4


