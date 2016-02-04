Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTPS id 148D252AB9
	for <meta-arago@arago-project.org>;
	Thu,  4 Feb 2016 02:00:15 +0000 (UTC)
Received: from gandalf.denix.org ([100.15.86.14]) by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPSA id <0O2000G972VYS981@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 03 Feb 2016 19:59:59 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WcjxEBVX c=1 sm=1 tr=0	a=xDJgBcBrK5EN9DJ6g74wNQ==:117
	a=jFJIQSaiL_oA:10 a=sozttTNsAAAA:8	a=HihYlcsHAAAA:8
	a=DF8doG2K_sTcVBbA3ccA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id CEFDE161E32;	Wed,
	3 Feb 2016 20:59:58 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 03 Feb 2016 20:59:58 -0500
Message-id: <1454551198-28485-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [tisdk-build-scripts][PATCH] run-opentest: pass skern and fw-initrd files to opentest for keystone machines
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
X-List-Received-Date: Thu, 04 Feb 2016 02:00:15 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 lib/run-opentest | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/lib/run-opentest b/lib/run-opentest
index ab65b5f..fb9ffd5 100644
--- a/lib/run-opentest
+++ b/lib/run-opentest
@@ -231,6 +231,15 @@ run_target_side_test() {
         esac
     fi
 
+    skern=""
+    fwinit=""
+    case $machine in
+        k2hk-evm|k2e-evm|k2g-evm|k2l-evm )
+            skern="~skern_file=$(ls $test_dir/temp/board-support/prebuilt-images/skern-*.bin)"
+            fwinit="~initramfs=$(ls $test_dir/temp/board-support/prebuilt-images/k2-fw-initrd.cpio.gz)"
+            ;;
+    esac
+
     bootattempts=""
     boottimeout=""
     if [ -n $OPENTEST_BOOT_ATTEMPTS ]
@@ -268,8 +277,8 @@ run_target_side_test() {
     fi
 
     # Call opentest framework.  Echo the command being used for logging
-    echo "java -jar $OPENTEST_JAR --template penguin --hw platform=$oplatform,$OPENTEST_HW_CAP --sw kernel=$kernel$dtb~kernel_modules=$spluart$uboot$bootattempts$boottimeout~nfs=$ipaddr:$nfs_dir$ASSIGN_TO_TEE~test_scripts_root=git://http://arago-project.org/git/projects/test-automation/execution-engines/vatf-scripts.git --options \"priority 0\" --params script=/$TEST_SCRIPTS_TGT/opentest.sh"
-    java -jar $OPENTEST_JAR --template penguin --hw platform=$oplatform,$OPENTEST_HW_CAP --sw kernel=$kernel$dtb~kernel_modules=$spluart$uboot$bootattempts$boottimeout~nfs=$ipaddr:$nfs_dir$ASSIGN_TO_TEE~test_scripts_root=git://http://arago-project.org/git/projects/test-automation/execution-engines/vatf-scripts.git --options "priority 0" --params script=/$TEST_SCRIPTS_TGT/opentest.sh
+    echo "java -jar $OPENTEST_JAR --template penguin --hw platform=$oplatform,$OPENTEST_HW_CAP --sw kernel=$kernel$dtb~kernel_modules=$spluart$uboot$skern$fwinit$bootattempts$boottimeout~nfs=$ipaddr:$nfs_dir$ASSIGN_TO_TEE~test_scripts_root=git://http://arago-project.org/git/projects/test-automation/execution-engines/vatf-scripts.git --options \"priority 0\" --params script=/$TEST_SCRIPTS_TGT/opentest.sh"
+    java -jar $OPENTEST_JAR --template penguin --hw platform=$oplatform,$OPENTEST_HW_CAP --sw kernel=$kernel$dtb~kernel_modules=$spluart$uboot$skern$fwinit$bootattempts$boottimeout~nfs=$ipaddr:$nfs_dir$ASSIGN_TO_TEE~test_scripts_root=git://http://arago-project.org/git/projects/test-automation/execution-engines/vatf-scripts.git --options "priority 0" --params script=/$TEST_SCRIPTS_TGT/opentest.sh
 
 ################################################################################
 # Check the results of the opentest run.
-- 
2.2.0


