Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTP id B89E852972
	for <meta-arago@arago-project.org>;
	Thu, 11 Sep 2014 23:17:33 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.18.33.160])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0NBR009KNFCT5G60@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 11 Sep 2014 18:17:17 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 42C5620087; Thu,
	11 Sep 2014 19:17:17 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 11 Sep 2014 19:17:16 -0400
Message-id: <1410477436-16291-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.4
Subject: [PATCH v2 1/2] run-opentest: only pass u-boot and spl/uart for am335x paltforms when enabled in config
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
X-List-Received-Date: Thu, 11 Sep 2014 23:17:34 -0000

From: Denys Dmytriyenko <denys@ti.com>

* Introduce new variable OPENTEST_BOOTLOADERS to control it, which defaults to true.
* Since SPL/UART is only supported by am335x, check for the platform before passing it
  to OpenTest.
* On other platforms it causes OpenTest to miss the escape window and it can't stop
  boot sequence to configure the necessary parameters.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
v2 - do machine check, switch the default to "true" as before

 configs/amsdk/amsdk-config-08.00.00.00.txt      |  4 ++++
 configs/arago-core-tisdk-daisy-puget.txt        |  4 ++++
 configs/coresdk/arago-core-tisdk-2014.08.00.txt |  4 ++++
 configs/distroless-meta-ti-puget.txt            |  4 ++++
 lib/run-opentest                                | 26 +++++++++++++++++--------
 5 files changed, 34 insertions(+), 8 deletions(-)

diff --git a/configs/amsdk/amsdk-config-08.00.00.00.txt b/configs/amsdk/amsdk-config-08.00.00.00.txt
index ff724e9..07d3024 100644
--- a/configs/amsdk/amsdk-config-08.00.00.00.txt
+++ b/configs/amsdk/amsdk-config-08.00.00.00.txt
@@ -176,6 +176,10 @@ OPENTEST_TEE_IP="none"
 # Defaults to "linux" if not set
 OPENTEST_HW_CAP="linux_tid_farm"
 
+# Determine whether SPL/UART and U-boot binaries are passed to OpenTest for
+# testing. Otherwise uses existing bootloaders on the board (SD, NAND, etc)
+OPENTEST_BOOTLOADERS="true"
+
 # This variable will allow control over whether to perform build testing or
 # skip it.  This should usually be set to true but may be changed for
 # prototyping.
diff --git a/configs/arago-core-tisdk-daisy-puget.txt b/configs/arago-core-tisdk-daisy-puget.txt
index c132baf..f8bfb7a 100644
--- a/configs/arago-core-tisdk-daisy-puget.txt
+++ b/configs/arago-core-tisdk-daisy-puget.txt
@@ -177,6 +177,10 @@ OPENTEST_TEE_IP="none"
 # Limit the board selection to official TI GT farm, avoiding personal boards
 OPENTEST_HW_CAP="linux_tigt_farm"
 
+# Determine whether SPL/UART and U-boot binaries are passed to OpenTest for
+# testing. Otherwise uses existing bootloaders on the board (SD, NAND, etc)
+OPENTEST_BOOTLOADERS="false"
+
 # This variable will allow control over whether to perform build testing or
 # skip it.  This should usually be set to true but may be changed for
 # prototyping.
diff --git a/configs/coresdk/arago-core-tisdk-2014.08.00.txt b/configs/coresdk/arago-core-tisdk-2014.08.00.txt
index 1a5e20c..f0ff41c 100644
--- a/configs/coresdk/arago-core-tisdk-2014.08.00.txt
+++ b/configs/coresdk/arago-core-tisdk-2014.08.00.txt
@@ -176,6 +176,10 @@ OPENTEST_TEE_IP="none"
 # Defaults to "linux" if not set
 OPENTEST_HW_CAP="linux_tid_farm"
 
+# Determine whether SPL/UART and U-boot binaries are passed to OpenTest for
+# testing. Otherwise uses existing bootloaders on the board (SD, NAND, etc)
+OPENTEST_BOOTLOADERS="false"
+
 # This variable will allow control over whether to perform build testing or
 # skip it.  This should usually be set to true but may be changed for
 # prototyping.
diff --git a/configs/distroless-meta-ti-puget.txt b/configs/distroless-meta-ti-puget.txt
index 917b125..d08d0b1 100644
--- a/configs/distroless-meta-ti-puget.txt
+++ b/configs/distroless-meta-ti-puget.txt
@@ -163,6 +163,10 @@ OPENTEST_TEE_IP="none"
 # Limit the board selection to official TI GT farm, avoiding personal boards
 OPENTEST_HW_CAP="linux_tigt_farm"
 
+# Determine whether SPL/UART and U-boot binaries are passed to OpenTest for
+# testing. Otherwise uses existing bootloaders on the board (SD, NAND, etc)
+OPENTEST_BOOTLOADERS="false"
+
 # This variable will allow control over whether to perform build testing or
 # skip it.  This should usually be set to true but may be changed for
 # prototyping.
diff --git a/lib/run-opentest b/lib/run-opentest
index a64e4cc..4d8d2b0 100644
--- a/lib/run-opentest
+++ b/lib/run-opentest
@@ -5,7 +5,7 @@ set_opentest_platform() {
     machine="$1"
 
     case $machine in
-        am37x-evm|am180x-evm|am3517-evm|da850-omapl138-evm|beagleboard|am335x-evm|omap5-evm|dra7xx-evm )
+        am37x-evm|am180x-evm|am3517-evm|da850-omapl138-evm|beagleboard|beaglebone|am335x-evm|omap5-evm|dra7xx-evm )
             oplatform=$machine
             ;;
         am437x-evm )
@@ -28,6 +28,9 @@ set_opentest_dtb() {
         am335x-evm )
             odtb="am335x-evm.dtb"
             ;;
+        beaglebone )
+            odtb="am335x-boneblack.dtb"
+            ;;
         am437x-evm )
             odtb="am43x-epos-evm.dtb"
             ;;
@@ -206,15 +209,22 @@ run_target_side_test() {
     fi
 
     uboot=""
-    if [ -f $test_dir/temp/board-support/prebuilt-images/u-boot-$m.* ]
-    then
-        uboot="~secondary_bootloader=$(ls $test_dir/temp/board-support/prebuilt-images/u-boot-$m.*)"
-    fi
-
     spluart=""
-    if [ -f $test_dir/temp/board-support/prebuilt-images/u-boot-spl.bin-$m ]
+    if [ "$OPENTEST_BOOTLOADERS" != "false" ]
     then
-        spluart="~primary_bootloader=$(ls $test_dir/temp/board-support/prebuilt-images/u-boot-spl.bin-$m)"
+        case $m in
+            am335x-evm|beaglebone )
+                if [ -f $test_dir/temp/board-support/prebuilt-images/u-boot-$m.* ]
+                then
+                    uboot="~secondary_bootloader=$(ls $test_dir/temp/board-support/prebuilt-images/u-boot-$m.*)"
+                fi
+
+                if [ -f $test_dir/temp/board-support/prebuilt-images/u-boot-spl.bin-$m ]
+                then
+                    spluart="~primary_bootloader=$(ls $test_dir/temp/board-support/prebuilt-images/u-boot-spl.bin-$m)"
+                fi
+                ;;
+        esac
     fi
 
     # Start the STAF process if not already started
-- 
2.0.4


