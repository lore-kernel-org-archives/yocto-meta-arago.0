Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTP id E61D0529C2
	for <meta-arago@arago-project.org>;
	Mon, 22 Sep 2014 20:47:41 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.18.33.160])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0NCB00KSFLQIOD40@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 22 Sep 2014 15:47:22 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 772922001F; Mon,
	22 Sep 2014 16:47:06 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 22 Sep 2014 16:47:05 -0400
Message-id: <1411418825-1682-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.4
Subject: [tisdk-build-scripts][PATCH] run-opentest: introduce OPENTEST_BOOT_ATTEMPTS and OPENTEST_BOOT_TIMEOUT vars
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
X-List-Received-Date: Mon, 22 Sep 2014 20:47:42 -0000

From: Denys Dmytriyenko <denys@ti.com>

They control the number of attempts to boot the target (1 by default) and the
timeout value for boot to finish (150 sec by default)

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 configs/arago-core-tisdk-daisy-puget.txt |  6 ++++++
 lib/run-opentest                         | 16 ++++++++++++++--
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/configs/arago-core-tisdk-daisy-puget.txt b/configs/arago-core-tisdk-daisy-puget.txt
index 45b835f..9ab568b 100644
--- a/configs/arago-core-tisdk-daisy-puget.txt
+++ b/configs/arago-core-tisdk-daisy-puget.txt
@@ -189,6 +189,12 @@ OPENTEST_HW_CAP="linux_tigt_farm"
 # testing. Otherwise uses existing bootloaders on the board (SD, NAND, etc)
 OPENTEST_BOOTLOADERS="false"
 
+# Specify the number of attempts to boot the target (default is 1)
+OPENTEST_BOOT_ATTEMPTS="3"
+
+# Specify timeout in seconds for boot to finish (default is 150 sec)
+OPENTEST_BOOT_TIMEOUT="300"
+
 # This variable will allow control over whether to perform build testing or
 # skip it.  This should usually be set to true but may be changed for
 # prototyping.
diff --git a/lib/run-opentest b/lib/run-opentest
index 4d8d2b0..4ae0e27 100644
--- a/lib/run-opentest
+++ b/lib/run-opentest
@@ -227,6 +227,18 @@ run_target_side_test() {
         esac
     fi
 
+    bootattempts=""
+    boottimeout=""
+    if [ -n $OPENTEST_BOOT_ATTEMPTS ]
+    then
+        bootattempts="~var_boot_attempts=$OPENTEST_BOOT_ATTEMPTS"
+    fi
+    if [ -n $OPENTEST_BOOT_TIMEOUT ]
+    then
+        boottimeout="~var_boot_timeout=$OPENTEST_BOOT_TIMEOUT"
+    fi
+
+
     # Start the STAF process if not already started
     daemonize $STAF_ROOT/startSTAFProc.sh
     source $STAF_ROOT/STAFEnv.sh start
@@ -252,8 +264,8 @@ run_target_side_test() {
     fi
 
     # Call opentest framework.  Echo the command being used for logging
-    echo "java -jar $OPENTEST_JAR --template penguin --hw platform=$oplatform,$OPENTEST_HW_CAP --sw kernel=$kernel$dtb~kernel_modules=$spluart$uboot~nfs=$ipaddr:$nfs_dir$ASSIGN_TO_TEE~test_scripts_root=git://http://arago-project.org/git/projects/test-automation/execution-engines/vatf-scripts.git --params script=/$TEST_SCRIPTS_TGT/opentest.sh"
-    java -jar $OPENTEST_JAR --template penguin --hw platform=$oplatform,$OPENTEST_HW_CAP --sw kernel=$kernel$dtb~kernel_modules=$spluart$uboot~nfs=$ipaddr:$nfs_dir$ASSIGN_TO_TEE~test_scripts_root=git://http://arago-project.org/git/projects/test-automation/execution-engines/vatf-scripts.git --params script=/$TEST_SCRIPTS_TGT/opentest.sh
+    echo "java -jar $OPENTEST_JAR --template penguin --hw platform=$oplatform,$OPENTEST_HW_CAP --sw kernel=$kernel$dtb~kernel_modules=$spluart$uboot$bootattempts$boottimeout~nfs=$ipaddr:$nfs_dir$ASSIGN_TO_TEE~test_scripts_root=git://http://arago-project.org/git/projects/test-automation/execution-engines/vatf-scripts.git --params script=/$TEST_SCRIPTS_TGT/opentest.sh"
+    java -jar $OPENTEST_JAR --template penguin --hw platform=$oplatform,$OPENTEST_HW_CAP --sw kernel=$kernel$dtb~kernel_modules=$spluart$uboot$bootattempts$boottimeout~nfs=$ipaddr:$nfs_dir$ASSIGN_TO_TEE~test_scripts_root=git://http://arago-project.org/git/projects/test-automation/execution-engines/vatf-scripts.git --params script=/$TEST_SCRIPTS_TGT/opentest.sh
 
 ################################################################################
 # Check the results of the opentest run.
-- 
2.0.4


