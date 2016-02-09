Return-Path: <denis@denix.org>
Received: from vms173015pub.verizon.net (vms173015pub.verizon.net
	[206.46.173.15])
	by arago-project.org (Postfix) with ESMTPS id 4DD7952982
	for <meta-arago@arago-project.org>;
	Tue,  9 Feb 2016 20:45:47 +0000 (UTC)
Received: from gandalf.denix.org ([100.15.86.14]) by vms173015.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPSA id <0O2A00BP6SBP5840@vms173015.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 09 Feb 2016 14:45:31 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=J+9Xl1TS c=1 sm=1 tr=0	a=xDJgBcBrK5EN9DJ6g74wNQ==:117
	a=jFJIQSaiL_oA:10 a=sozttTNsAAAA:8	a=HihYlcsHAAAA:8
	a=SgmpmKiGJiIJ4EAPgTEA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 78DC3161E8C;	Tue,
	9 Feb 2016 15:45:25 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 09 Feb 2016 15:45:25 -0500
Message-id: <1455050725-31731-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [tisdk-build-scripts][PATCH] run-opentest: grab console logs from OpenTest
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
X-List-Received-Date: Tue, 09 Feb 2016 20:45:48 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 lib/common-functions |    1 +
 lib/run-opentest     |   11 ++++++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/lib/common-functions b/lib/common-functions
index ace8f86..e0fc8c6 100644
--- a/lib/common-functions
+++ b/lib/common-functions
@@ -62,4 +62,5 @@ parse_config_file() {
 general_log='$LOG_DIR/sdk-build-log.txt'
 machine_build_log='$LOG_DIR/$m-build-log.txt'
 machine_test_log='$LOG_DIR/$m-test-log.txt'
+machine_console_log='$LOG_DIR/$m-console-log.txt'
 error_log='$LOG_DIR/error-log.txt'
diff --git a/lib/run-opentest b/lib/run-opentest
index 0017b5e..fb27d82 100644
--- a/lib/run-opentest
+++ b/lib/run-opentest
@@ -1,3 +1,5 @@
+#!/bin/bash
+
 # Translate OE machine types to opentest HW platforms and don't test on
 # unsupported platforms.
 # NOTE: Some platforms re-use the same board so we can set oplatform the same
@@ -291,6 +293,13 @@ run_target_side_test() {
         java -jar $OPENTEST_JAR --template penguin --hw platform=$oplatform,$OPENTEST_HW_CAP --sw kernel=$kernel$dtb~kernel_modules=$spluart$uboot$skern$fwinit$pmmc$bootattempts$boottimeout~nfs=$ipaddr:$nfs_dir$ASSIGN_TO_TEE~test_scripts_root=git://http://arago-project.org/git/projects/test-automation/execution-engines/vatf-scripts.git --options "priority 0" --params script=/$TEST_SCRIPTS_TGT/opentest.sh
     fi
 
+    otret=$?
+
+    if [ "${BUILD_LOG_VERBOSE}" = "true" ]; then
+        oturl=`eval grep 'LOG\ PATH' $machine_test_log | egrep -o 'href="([^"]*)' | cut -d\" -f2 | sed 's/dev_test_\([[:digit:]]\+\).html/dut1_\1_log.txt/'`
+        eval wget --no-proxy "$oturl" -O $machine_console_log
+    fi
+
 ################################################################################
 # Check the results of the opentest run.
 #   - If the test failed mark the failure and exit
@@ -300,7 +309,7 @@ run_target_side_test() {
     # This is not marked as a critical failure because this could be a false
     # failure from the test system itself.  So depending on what we set for
     # SKIP_TEST_FAILURES we may continue with the packaging step.
-    if [ "$?" != 0 ]
+    if [ "$otret" != 0 ]
     then
         echo "Opentest failed for $m"
         echo "FAILED" > $LOG_DIR/$m-test-result.txt
-- 
1.7.9.5


