Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTPS id 13277529AC
	for <meta-arago@arago-project.org>;
	Fri, 10 Jul 2015 01:45:36 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NR900NAH0VX5180@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 09 Jul 2015 20:45:34 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WcjxEBVX c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=zOBTXjUuO1YA:10
	a=sozttTNsAAAA:8	a=p66DwqiCmvK93HlR-vQA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 868E6161B0E;	Thu,
	9 Jul 2015 21:45:33 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 09 Jul 2015 21:45:32 -0400
Message-id: <1436492732-18531-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [tisdk-build-scripts][PATCH] build-oesdk: fold COPY_DEPLOY_TO_WEB and COPY_GOLDEN_TO_WEB under COPY_TO_WEB
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
X-List-Received-Date: Fri, 10 Jul 2015 01:45:36 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 build-oesdk.sh | 44 ++++++++++++++++++++++++--------------------
 1 file changed, 24 insertions(+), 20 deletions(-)

diff --git a/build-oesdk.sh b/build-oesdk.sh
index efe1a43..1f6d480 100755
--- a/build-oesdk.sh
+++ b/build-oesdk.sh
@@ -200,33 +200,37 @@ generate_report
 
 # If COPY_TO_WEB is set then copy to the WEB_HOST.  If we did not
 # productize the SDK then there is not much need to copy the files.
-if [ "$COPY_TO_WEB" == "true" -a "$PRODUCTIZE_SDK" == "true" ]
+if [ "$COPY_TO_WEB" == "true" ]
 then
-    scp -r $DEPLOY_ROOT $WEB_HOST/
-    # If the copy went well then clean out the DEPLOY_ROOT directory
-    # If the CLEAN_AFTER_COPY variable is true.
-    # TODO: Maybe this should be cleaned by jenkins if I want that.
-    if [ "$?" == "0" ]
+    if [ "$PRODUCTIZE_SDK" == "true" ]
     then
-        if [ "$CLEAN_AFTER_COPY" == "true" ]
+        echo "Copying productized images"
+        scp -r $DEPLOY_ROOT $WEB_HOST/
+        # If the copy went well then clean out the DEPLOY_ROOT directory
+        # If the CLEAN_AFTER_COPY variable is true.
+        # TODO: Maybe this should be cleaned by jenkins if I want that.
+        if [ "$?" == "0" ]
         then
-            rm -rf $DEPLOY_ROOT
+            if [ "$CLEAN_AFTER_COPY" == "true" ]
+            then
+                rm -rf $DEPLOY_ROOT
+            fi
         fi
     fi
-fi
 
-echo "Copying deploy/ directory"
-# If COPY_DEPLOY_TO_WEB is set then copy to the WEB_HOST.
-if [ "$COPY_DEPLOY_TO_WEB" == "true" ]
-then
-    rsync -az --delete $BUILD_ROOT/build-*/arago-tmp*/deploy/ $WEB_HOST/deploy/
-fi
+    echo "Copying deploy/ directory"
+    # If COPY_DEPLOY_TO_WEB is set then copy to the WEB_HOST.
+    if [ "$COPY_DEPLOY_TO_WEB" == "true" ]
+    then
+        rsync -az --delete $BUILD_ROOT/build-*/arago-tmp*/deploy/ $WEB_HOST/deploy/
+    fi
 
-echo "Copying golden/ directory"
-# If COPY_GOLDEN_TO_WEB is set then copy to the WEB_HOST.
-if [ "$COPY_GOLDEN_TO_WEB" == "true" ]
-then
-    rsync -az --delete $BUILD_ROOT/build-*/golden/ $WEB_HOST/golden/
+    echo "Copying golden/ directory"
+    # If COPY_GOLDEN_TO_WEB is set then copy to the WEB_HOST.
+    if [ "$COPY_GOLDEN_TO_WEB" == "true" ]
+    then
+        rsync -az --delete $BUILD_ROOT/build-*/golden/ $WEB_HOST/golden/
+    fi
 fi
 
 echo "Build Finished"
-- 
2.2.0


