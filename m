Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTPS id 56AF65299F
	for <meta-arago@arago-project.org>;
	Mon, 24 Nov 2014 21:05:59 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.160]) by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NFK002DIAKLO6H0@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 24 Nov 2014 15:05:10 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=IOK10brD c=1 sm=1 tr=0	a=A8KAnipHuDHkz1LiHkTZyg==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=5y4faFyK3SkA:10
	a=sozttTNsAAAA:8	a=FzMroocpNC3RV7wyNsMA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 8EEA6200E2;	Mon,
	24 Nov 2014 16:05:09 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 24 Nov 2014 16:05:09 -0500
Message-id: <1416863109-6745-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.1.2
Subject: [tisdk-build-scripts][PATCH] run-opentest/bitbake-test-sdk-image: skip weston TS calibration
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
X-List-Received-Date: Mon, 24 Nov 2014 21:06:00 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 lib/oesdk/bitbake-test-sdk-image       | 1 +
 lib/run-opentest                       | 3 ++-
 test-scripts/S08-fake-weston-calibrate | 6 ++++++
 3 files changed, 9 insertions(+), 1 deletion(-)
 create mode 100755 test-scripts/S08-fake-weston-calibrate

diff --git a/lib/oesdk/bitbake-test-sdk-image b/lib/oesdk/bitbake-test-sdk-image
index 900367f..f6f91fa 100644
--- a/lib/oesdk/bitbake-test-sdk-image
+++ b/lib/oesdk/bitbake-test-sdk-image
@@ -33,6 +33,7 @@ package_tested_rootfs() {
         sudo rm -rf $nfs_dir/$TEST_SCRIPTS_TGT
         sudo rm -rf $nfs_dir/etc/pointercal
         sudo rm -rf $nfs_dir/etc/rc5.d/S90-fake-pointercal
+        sudo rm -rf $nfs_dir/etc/rc5.d/S08-fake-weston-calibrate
         sudo rm -rf $nfs_dir/etc/dropbear/dropbear_rsa_*
         # Don't forget to remove the original file system tarball
         sudo rm -rf $nfs_dir/$filesys
diff --git a/lib/run-opentest b/lib/run-opentest
index a156df8..61bef14 100644
--- a/lib/run-opentest
+++ b/lib/run-opentest
@@ -116,8 +116,9 @@ run_target_side_test() {
 
     sudo cp -rf $TEST_SCRIPTS $TEST_SCRIPTS_TGT
 
-    # Copy in an init script to create a fake pointercal file to allow booting
+    # Copy init scripts to create fake pointercal/calibrate files to allow booting
     sudo cp $TEST_SCRIPTS_TGT/S90-fake-pointercal etc/rc5.d/
+    sudo cp $TEST_SCRIPTS_TGT/S08-fake-weston-calibrate etc/rc5.d/
 
     # Modify the nightly-test.sh script with the required values
     sudo sed -i "s=__BASEDIR__=/$TEST_SCRIPTS_TGT=" $TEST_SCRIPTS_TGT/nightly-test.sh
diff --git a/test-scripts/S08-fake-weston-calibrate b/test-scripts/S08-fake-weston-calibrate
new file mode 100755
index 0000000..cc7944a
--- /dev/null
+++ b/test-scripts/S08-fake-weston-calibrate
@@ -0,0 +1,6 @@
+#!/bin/sh
+
+WS_CALUDEV_FILE=/etc/udev/rules.d/ws-calibrate.rules
+
+echo "Creating a fake calibration rule file in $WS_CALUDEV_FILE"
+touch $WS_CALUDEV_FILE
-- 
2.1.2


