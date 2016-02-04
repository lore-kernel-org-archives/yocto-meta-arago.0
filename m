Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTPS id A7B4A529EA
	for <meta-arago@arago-project.org>;
	Thu,  4 Feb 2016 19:30:44 +0000 (UTC)
Received: from gandalf.denix.org ([100.15.86.14]) by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPSA id <0O21004J7FINOO60@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 04 Feb 2016 13:30:24 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=btqxfxui c=1 sm=1 tr=0	a=xDJgBcBrK5EN9DJ6g74wNQ==:117
	a=jFJIQSaiL_oA:10 a=sozttTNsAAAA:8	a=HihYlcsHAAAA:8
	a=BepsUTWYBPPOVOd4LkAA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id AFC2C161E69;	Thu,
	4 Feb 2016 14:30:23 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 04 Feb 2016 14:30:23 -0500
Message-id: <1454614223-25454-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [tisdk-build-scripts][PATCH] run-opentest: pass PMMC/TI-SCI FW file to opentest for k2g-evm
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
X-List-Received-Date: Thu, 04 Feb 2016 19:30:45 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 lib/run-opentest | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/lib/run-opentest b/lib/run-opentest
index fb9ffd5..f09466a 100644
--- a/lib/run-opentest
+++ b/lib/run-opentest
@@ -240,6 +240,13 @@ run_target_side_test() {
             ;;
     esac
 
+    pmmc=""
+    case $machine in
+        k2g-evm )
+            pmmc="~pmmc=$(ls $test_dir/temp/board-support/prebuilt-images/ti-sci-firmware-k2g.bin)"
+            ;;
+    esac
+
     bootattempts=""
     boottimeout=""
     if [ -n $OPENTEST_BOOT_ATTEMPTS ]
@@ -277,8 +284,8 @@ run_target_side_test() {
     fi
 
     # Call opentest framework.  Echo the command being used for logging
-    echo "java -jar $OPENTEST_JAR --template penguin --hw platform=$oplatform,$OPENTEST_HW_CAP --sw kernel=$kernel$dtb~kernel_modules=$spluart$uboot$skern$fwinit$bootattempts$boottimeout~nfs=$ipaddr:$nfs_dir$ASSIGN_TO_TEE~test_scripts_root=git://http://arago-project.org/git/projects/test-automation/execution-engines/vatf-scripts.git --options \"priority 0\" --params script=/$TEST_SCRIPTS_TGT/opentest.sh"
-    java -jar $OPENTEST_JAR --template penguin --hw platform=$oplatform,$OPENTEST_HW_CAP --sw kernel=$kernel$dtb~kernel_modules=$spluart$uboot$skern$fwinit$bootattempts$boottimeout~nfs=$ipaddr:$nfs_dir$ASSIGN_TO_TEE~test_scripts_root=git://http://arago-project.org/git/projects/test-automation/execution-engines/vatf-scripts.git --options "priority 0" --params script=/$TEST_SCRIPTS_TGT/opentest.sh
+    echo "java -jar $OPENTEST_JAR --template penguin --hw platform=$oplatform,$OPENTEST_HW_CAP --sw kernel=$kernel$dtb~kernel_modules=$spluart$uboot$skern$fwinit$pmmc$bootattempts$boottimeout~nfs=$ipaddr:$nfs_dir$ASSIGN_TO_TEE~test_scripts_root=git://http://arago-project.org/git/projects/test-automation/execution-engines/vatf-scripts.git --options \"priority 0\" --params script=/$TEST_SCRIPTS_TGT/opentest.sh"
+    java -jar $OPENTEST_JAR --template penguin --hw platform=$oplatform,$OPENTEST_HW_CAP --sw kernel=$kernel$dtb~kernel_modules=$spluart$uboot$skern$fwinit$pmmc$bootattempts$boottimeout~nfs=$ipaddr:$nfs_dir$ASSIGN_TO_TEE~test_scripts_root=git://http://arago-project.org/git/projects/test-automation/execution-engines/vatf-scripts.git --options "priority 0" --params script=/$TEST_SCRIPTS_TGT/opentest.sh
 
 ################################################################################
 # Check the results of the opentest run.
-- 
2.2.0


