Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTP id CF1515208C
	for <meta-arago@arago-project.org>;
	Mon,  3 Mar 2014 23:36:41 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N1V00AB3W8P7B20@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 03 Mar 2014 17:36:40 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 3929E2039D; Mon,
	03 Mar 2014 18:36:25 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 03 Mar 2014 18:36:15 -0500
Message-id: <1393889779-3995-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
In-reply-to: <1393889779-3995-1-git-send-email-denis@denix.org>
References: <1393889779-3995-1-git-send-email-denis@denix.org>
Subject: [tisdk-build-scripts][PATCH 1/5] run-opentest: make assigning tests to a specific TEE optional
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
X-List-Received-Date: Mon, 03 Mar 2014 23:36:43 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 lib/run-opentest |   12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/lib/run-opentest b/lib/run-opentest
index 98a7dc8..c502764 100644
--- a/lib/run-opentest
+++ b/lib/run-opentest
@@ -213,6 +213,14 @@ run_target_side_test() {
         OPENTEST_TEE_IP="128.247.105.52"
     fi
 
+    # if OPENTEST_TEE_IP is set to "none", disable assigning to a specific TEE
+    if [ "$OPENTEST_TEE_IP" == "none" ]
+    then
+        ASSIGN_TO_TEE=""
+    else
+        ASSIGN_TO_TEE="~assign_to_tees=\"vatf on $OPENTEST_TEE_IP\""
+    fi
+
     # if OPENTEST_HW_CAP is not set in config, default to "linux"
     if [ -z $OPENTEST_HW_CAP ]
     then
@@ -220,8 +228,8 @@ run_target_side_test() {
     fi
 
     # Call opentest framework.  Echo the command being used for logging
-    echo "java -jar opentest_cli_0.7.jar --template penguin --hw platform=$oplatform,$OPENTEST_HW_CAP --sw kernel=$kernel$dtb~kernel_modules=$spluart$uboot~nfs=$ipaddr:$nfs_dir~assign_to_tees=\"vatf on $OPENTEST_TEE_IP\" --params script=/$TEST_SCRIPTS_TGT/opentest.sh"
-    java -jar opentest_cli_0.7.jar --template penguin --hw platform=$oplatform,$OPENTEST_HW_CAP --sw kernel=$kernel$dtb~kernel_modules=$spluart$uboot~nfs=$ipaddr:$nfs_dir~assign_to_tees="vatf on $OPENTEST_TEE_IP" --params script=/$TEST_SCRIPTS_TGT/opentest.sh
+    echo "java -jar opentest_cli_0.7.jar --template penguin --hw platform=$oplatform,$OPENTEST_HW_CAP --sw kernel=$kernel$dtb~kernel_modules=$spluart$uboot~nfs=$ipaddr:$nfs_dir$ASSIGN_TO_TEE --params script=/$TEST_SCRIPTS_TGT/opentest.sh"
+    java -jar opentest_cli_0.7.jar --template penguin --hw platform=$oplatform,$OPENTEST_HW_CAP --sw kernel=$kernel$dtb~kernel_modules=$spluart$uboot~nfs=$ipaddr:$nfs_dir$ASSIGN_TO_TEE --params script=/$TEST_SCRIPTS_TGT/opentest.sh
 
 ################################################################################
 # Check the results of the opentest run.
-- 
1.7.9.5


