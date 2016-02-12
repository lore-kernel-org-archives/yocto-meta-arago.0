Return-Path: <denis@denix.org>
Received: from vms173007pub.verizon.net (vms173007pub.verizon.net
	[206.46.173.7])
	by arago-project.org (Postfix) with ESMTPS id A4243529A5
	for <meta-arago@arago-project.org>;
	Fri, 12 Feb 2016 15:47:48 +0000 (UTC)
Received: from gandalf.denix.org ([100.15.86.14]) by vms173007.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPSA id <0O2F00CG8YJ8F490@vms173007.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 12 Feb 2016 09:47:33 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=EdU1O6SC c=1 sm=1 tr=0	a=xDJgBcBrK5EN9DJ6g74wNQ==:117
	a=jFJIQSaiL_oA:10 a=sozttTNsAAAA:8	a=HihYlcsHAAAA:8
	a=97Msy6gEF2yFMMFpBIgA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 90993161E91;	Fri,
	12 Feb 2016 10:39:10 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 12 Feb 2016 10:39:10 -0500
Message-id: <1455291550-14421-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [tisdk-build-scripts][PATCH] run-opentest: fix return value from OpenTest execution
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
X-List-Received-Date: Fri, 12 Feb 2016 15:47:48 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 lib/run-opentest | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/run-opentest b/lib/run-opentest
index fb27d82..330d4be 100644
--- a/lib/run-opentest
+++ b/lib/run-opentest
@@ -289,12 +289,12 @@ run_target_side_test() {
     echo "java -jar $OPENTEST_JAR --template penguin --hw platform=$oplatform,$OPENTEST_HW_CAP --sw kernel=$kernel$dtb~kernel_modules=$spluart$uboot$skern$fwinit$pmmc$bootattempts$boottimeout~nfs=$ipaddr:$nfs_dir$ASSIGN_TO_TEE~test_scripts_root=git://http://arago-project.org/git/projects/test-automation/execution-engines/vatf-scripts.git --options \"priority 0\" --params script=/$TEST_SCRIPTS_TGT/opentest.sh"
     if [ "${BUILD_LOG_VERBOSE}" = "true" ]; then
         java -jar $OPENTEST_JAR --template penguin --hw platform=$oplatform,$OPENTEST_HW_CAP --sw kernel=$kernel$dtb~kernel_modules=$spluart$uboot$skern$fwinit$pmmc$bootattempts$boottimeout~nfs=$ipaddr:$nfs_dir$ASSIGN_TO_TEE~test_scripts_root=git://http://arago-project.org/git/projects/test-automation/execution-engines/vatf-scripts.git --options "priority 0" --params script=/$TEST_SCRIPTS_TGT/opentest.sh 2>&1 | eval tee -a $machine_test_log
+        otret=${PIPESTATUS[0]}
     else
         java -jar $OPENTEST_JAR --template penguin --hw platform=$oplatform,$OPENTEST_HW_CAP --sw kernel=$kernel$dtb~kernel_modules=$spluart$uboot$skern$fwinit$pmmc$bootattempts$boottimeout~nfs=$ipaddr:$nfs_dir$ASSIGN_TO_TEE~test_scripts_root=git://http://arago-project.org/git/projects/test-automation/execution-engines/vatf-scripts.git --options "priority 0" --params script=/$TEST_SCRIPTS_TGT/opentest.sh
+        otret=$?
     fi
 
-    otret=$?
-
     if [ "${BUILD_LOG_VERBOSE}" = "true" ]; then
         oturl=`eval grep 'LOG\ PATH' $machine_test_log | egrep -o 'href="([^"]*)' | cut -d\" -f2 | sed 's/dev_test_\([[:digit:]]\+\).html/dut1_\1_log.txt/'`
         eval wget --no-proxy "$oturl" -O $machine_console_log
@@ -309,7 +309,7 @@ run_target_side_test() {
     # This is not marked as a critical failure because this could be a false
     # failure from the test system itself.  So depending on what we set for
     # SKIP_TEST_FAILURES we may continue with the packaging step.
-    if [ "$otret" != 0 ]
+    if [ $otret -ne 0 ]
     then
         echo "Opentest failed for $m"
         echo "FAILED" > $LOG_DIR/$m-test-result.txt
-- 
2.2.0


