Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTP id 087B852A6D
	for <meta-arago@arago-project.org>;
	Mon,  8 Sep 2014 19:51:52 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.18.33.160])
	by vms173023.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0NBL0024ULPOKIL0@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 08 Sep 2014 14:49:06 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id C14EA20015; Mon,
	08 Sep 2014 15:49:00 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 08 Sep 2014 15:48:56 -0400
Message-id: <1410205737-7590-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.4
Subject: [tisdk-build-scripts][PATCH 1/2] run-opentest: only pass u-boot and spl/uart when enabled in config
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
X-List-Received-Date: Mon, 08 Sep 2014 19:51:52 -0000

From: Denys Dmytriyenko <denys@ti.com>

Introduce new variable OPENTEST_BOOTLOADERS to control it, but defaults to false.
This never worked as expected, since SPL/UART is only supported by am335x and
on other platforms it causes OpenTest to miss the escape window and it can't stop
boot sequence to configure the necessary parameters.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 configs/arago-core-tisdk-daisy-puget.txt |  4 ++++
 lib/run-opentest                         | 17 ++++++++++-------
 2 files changed, 14 insertions(+), 7 deletions(-)

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
diff --git a/lib/run-opentest b/lib/run-opentest
index a64e4cc..1a71ae8 100644
--- a/lib/run-opentest
+++ b/lib/run-opentest
@@ -206,15 +206,18 @@ run_target_side_test() {
     fi
 
     uboot=""
-    if [ -f $test_dir/temp/board-support/prebuilt-images/u-boot-$m.* ]
-    then
-        uboot="~secondary_bootloader=$(ls $test_dir/temp/board-support/prebuilt-images/u-boot-$m.*)"
-    fi
-
     spluart=""
-    if [ -f $test_dir/temp/board-support/prebuilt-images/u-boot-spl.bin-$m ]
+    if [ "$OPENTEST_BOOTLOADERS" == "true" ]
     then
-        spluart="~primary_bootloader=$(ls $test_dir/temp/board-support/prebuilt-images/u-boot-spl.bin-$m)"
+        if [ -f $test_dir/temp/board-support/prebuilt-images/u-boot-$m.* ]
+        then
+            uboot="~secondary_bootloader=$(ls $test_dir/temp/board-support/prebuilt-images/u-boot-$m.*)"
+        fi
+
+        if [ -f $test_dir/temp/board-support/prebuilt-images/u-boot-spl.bin-$m ]
+        then
+            spluart="~primary_bootloader=$(ls $test_dir/temp/board-support/prebuilt-images/u-boot-spl.bin-$m)"
+        fi
     fi
 
     # Start the STAF process if not already started
-- 
2.0.4


