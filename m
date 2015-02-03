Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTPS id 80A83529AF
	for <meta-arago@arago-project.org>;
	Tue,  3 Feb 2015 02:55:36 +0000 (UTC)
Received: from gandalf.denix.org ([108.28.89.130]) by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NJ6009S5DG3CY40@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 02 Feb 2015 20:55:16 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=AptZB15K c=1 sm=1 tr=0	a=ckUr7rGttv+NBxkAVUaaIw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=0HtSIViG9nkA:10
	a=sozttTNsAAAA:8	a=c030iWq4bqIvYAb913kA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 656C5200F4;	Mon,
	2 Feb 2015 21:55:14 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 02 Feb 2015 21:55:13 -0500
Message-id: <1422932113-15891-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] Implement "golden" images that passed run-time testing.
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
X-List-Received-Date: Tue, 03 Feb 2015 02:55:36 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 build-oesdk.sh                           |  7 +++++++
 configs/arago-core-tisdk-daisy-puget.txt |  4 ++++
 lib/oesdk/bitbake-test-sdk-image         | 35 ++++++++++++++++++++++++++++++++
 3 files changed, 46 insertions(+)

diff --git a/build-oesdk.sh b/build-oesdk.sh
index 968fb12..0eb5fec 100755
--- a/build-oesdk.sh
+++ b/build-oesdk.sh
@@ -218,4 +218,11 @@ then
     rsync -az --delete $BUILD_ROOT/build-*/arago-tmp*/deploy/ $WEB_HOST/deploy/
 fi
 
+echo "Copying golden/ directory"
+# If COPY_GOLDEN_TO_WEB is set then copy to the WEB_HOST.
+if [ "$COPY_GOLDEN_TO_WEB" == "true" ]
+then
+    rsync -az --delete $BUILD_ROOT/build-*/arago-tmp*/golden/ $WEB_HOST/golden/
+fi
+
 echo "Build Finished"
diff --git a/configs/arago-core-tisdk-daisy-puget.txt b/configs/arago-core-tisdk-daisy-puget.txt
index f595ed6..957d594 100644
--- a/configs/arago-core-tisdk-daisy-puget.txt
+++ b/configs/arago-core-tisdk-daisy-puget.txt
@@ -307,6 +307,10 @@ COPY_TO_WEB="true"
 # such as images, IPK feeds etc, so may not be distributed publicly as is.
 COPY_DEPLOY_TO_WEB="true"
 
+# This variable specifies whether or not to copy the "golden" contents to a
+# remote web hosting server. These are images that passed run-time tests.
+COPY_GOLDEN_TO_WEB="true"
+
 # This variable points to the user@webhost:<basepath> location where the
 # deploy contents should be placed.  This is best done if you have done a
 # key exchange between these systems so that your SCP command will not ask
diff --git a/lib/oesdk/bitbake-test-sdk-image b/lib/oesdk/bitbake-test-sdk-image
index f6f91fa..8964912 100644
--- a/lib/oesdk/bitbake-test-sdk-image
+++ b/lib/oesdk/bitbake-test-sdk-image
@@ -271,9 +271,38 @@ copy_files_to_package_root() {
     cp $test_dir/temp/filesystem/$FS_FILTER*.$FS_IMAGE_TYPE $root_partition/rootfs_partition.$FS_IMAGE_TYPE
 }
 
+copy_golden_image() {
+    # Set m for logging purposes
+    m=$1
+
+    arago_tmp=`ls | grep "arago-tmp-*"`
+
+    # This is a critical failure and will not be able to be skipped
+    if [ "$arago_tmp" == "" ]
+    then
+        echo "Could not find the arago-tmp directory"
+        return 1
+    fi
+
+    img_path="$arago_tmp/deploy/images/$m"
+
+    # check that the img_path exists
+    if [ ! -d $img_path ]
+    then
+        echo "Images directory for machine $m is missing from arago-tmp"
+        return 1
+    fi
+
+    dest_path="$arago_tmp/golden/"
+    rm -rf $dest_path/$m
+
+    cp -a $img_path $dest_path
+}
+
 test_sdk_image() {
     # Set m for logging purposes
     m="$1"
+    test_passed="false"
 
     # Create a temporary directory to extract the build files to for
     # testing.  If the directory already exists then delete the old
@@ -319,6 +348,7 @@ test_sdk_image() {
             fi
         else
             echo "PASSED" > $LOG_DIR/$m-test-result.txt
+            test_passed="true"
         fi
 
     else
@@ -334,6 +364,11 @@ test_sdk_image() {
     then
         copy_files_to_package_root $m
     fi
+
+    if [ "$test_passed" == "true" -a $COPY_GOLDEN_TO_WEB == "true" ]
+    then
+        copy_golden_image $m
+    fi
 }
 
 # This function receives a comma separated list of machines to build and test.
-- 
2.2.0


