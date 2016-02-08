Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTPS id 0BC4D52007
	for <meta-arago@arago-project.org>;
	Mon,  8 Feb 2016 01:11:36 +0000 (UTC)
Received: from gandalf.denix.org ([100.15.86.14]) by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPSA id <0O2700139FAGQW10@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Sun, 07 Feb 2016 19:11:20 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=MtGvkDue c=1 sm=1 tr=0	a=xDJgBcBrK5EN9DJ6g74wNQ==:117
	a=jFJIQSaiL_oA:10 a=sozttTNsAAAA:8	a=HihYlcsHAAAA:8
	a=31J5djYFRYxwLqt6aU4A:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 8C188161E88;	Sun,
	7 Feb 2016 20:11:04 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Sun, 07 Feb 2016 20:11:04 -0500
Message-id: <1454893864-4714-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [tisdk-build-scripts][PATCH] run-opentest: log opentest output to $machine-test-log file
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
X-List-Received-Date: Mon, 08 Feb 2016 01:11:37 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 lib/common-functions | 2 +-
 lib/run-opentest     | 8 ++++++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/lib/common-functions b/lib/common-functions
index 42a1148..ace8f86 100644
--- a/lib/common-functions
+++ b/lib/common-functions
@@ -61,5 +61,5 @@ parse_config_file() {
 
 general_log='$LOG_DIR/sdk-build-log.txt'
 machine_build_log='$LOG_DIR/$m-build-log.txt'
-machine_test_log='$LOG_DIR/$m-test-log'
+machine_test_log='$LOG_DIR/$m-test-log.txt'
 error_log='$LOG_DIR/error-log.txt'
diff --git a/lib/run-opentest b/lib/run-opentest
index f09466a..0017b5e 100644
--- a/lib/run-opentest
+++ b/lib/run-opentest
@@ -64,7 +64,7 @@ run_target_side_test() {
     # Set m for logging purposes
     m="$1"
 
-    log $machine_build_log echo "testing machine $m"
+    log $machine_test_log echo "testing machine $m"
 
 ################################################################################
 # Prepare the root file system for testing by:
@@ -285,7 +285,11 @@ run_target_side_test() {
 
     # Call opentest framework.  Echo the command being used for logging
     echo "java -jar $OPENTEST_JAR --template penguin --hw platform=$oplatform,$OPENTEST_HW_CAP --sw kernel=$kernel$dtb~kernel_modules=$spluart$uboot$skern$fwinit$pmmc$bootattempts$boottimeout~nfs=$ipaddr:$nfs_dir$ASSIGN_TO_TEE~test_scripts_root=git://http://arago-project.org/git/projects/test-automation/execution-engines/vatf-scripts.git --options \"priority 0\" --params script=/$TEST_SCRIPTS_TGT/opentest.sh"
-    java -jar $OPENTEST_JAR --template penguin --hw platform=$oplatform,$OPENTEST_HW_CAP --sw kernel=$kernel$dtb~kernel_modules=$spluart$uboot$skern$fwinit$pmmc$bootattempts$boottimeout~nfs=$ipaddr:$nfs_dir$ASSIGN_TO_TEE~test_scripts_root=git://http://arago-project.org/git/projects/test-automation/execution-engines/vatf-scripts.git --options "priority 0" --params script=/$TEST_SCRIPTS_TGT/opentest.sh
+    if [ "${BUILD_LOG_VERBOSE}" = "true" ]; then
+        java -jar $OPENTEST_JAR --template penguin --hw platform=$oplatform,$OPENTEST_HW_CAP --sw kernel=$kernel$dtb~kernel_modules=$spluart$uboot$skern$fwinit$pmmc$bootattempts$boottimeout~nfs=$ipaddr:$nfs_dir$ASSIGN_TO_TEE~test_scripts_root=git://http://arago-project.org/git/projects/test-automation/execution-engines/vatf-scripts.git --options "priority 0" --params script=/$TEST_SCRIPTS_TGT/opentest.sh 2>&1 | eval tee -a $machine_test_log
+    else
+        java -jar $OPENTEST_JAR --template penguin --hw platform=$oplatform,$OPENTEST_HW_CAP --sw kernel=$kernel$dtb~kernel_modules=$spluart$uboot$skern$fwinit$pmmc$bootattempts$boottimeout~nfs=$ipaddr:$nfs_dir$ASSIGN_TO_TEE~test_scripts_root=git://http://arago-project.org/git/projects/test-automation/execution-engines/vatf-scripts.git --options "priority 0" --params script=/$TEST_SCRIPTS_TGT/opentest.sh
+    fi
 
 ################################################################################
 # Check the results of the opentest run.
-- 
2.2.0


