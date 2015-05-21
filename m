Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTPS id 0C3E552987
	for <meta-arago@arago-project.org>;
	Thu, 21 May 2015 02:06:50 +0000 (UTC)
Received: from gandalf.denix.org ([108.28.31.169]) by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NOO001HBGIV8JC0@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 20 May 2015 21:06:36 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Ap5ZB14n c=1 sm=1 tr=0	a=fMO+sUsoiA3cqMJ/JkSOnA==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=h1PgugrvaO0A:10
	a=sozttTNsAAAA:8	a=9YIYOVUUITRXznXj8vAA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id E46C620099;	Wed,
	20 May 2015 22:06:30 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 20 May 2015 22:06:30 -0400
Message-id: <1432173990-12576-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [tisdk-build-scripts][PATCH v2 1/2] bitbake-test-sdk-image: move golden out of TMPDIR, pre-create golden/mach
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
X-List-Received-Date: Thu, 21 May 2015 02:06:50 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
v2 - also update COPY_GOLDEN_TO_WEB code with new path

 build-oesdk.sh                   | 2 +-
 lib/oesdk/bitbake-test-sdk-image | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/build-oesdk.sh b/build-oesdk.sh
index 0eb5fec..8958a10 100755
--- a/build-oesdk.sh
+++ b/build-oesdk.sh
@@ -222,7 +222,7 @@ echo "Copying golden/ directory"
 # If COPY_GOLDEN_TO_WEB is set then copy to the WEB_HOST.
 if [ "$COPY_GOLDEN_TO_WEB" == "true" ]
 then
-    rsync -az --delete $BUILD_ROOT/build-*/arago-tmp*/golden/ $WEB_HOST/golden/
+    rsync -az --delete $BUILD_ROOT/build-*/golden/ $WEB_HOST/golden/
 fi
 
 echo "Build Finished"
diff --git a/lib/oesdk/bitbake-test-sdk-image b/lib/oesdk/bitbake-test-sdk-image
index c9cb60a..c5abf6f 100644
--- a/lib/oesdk/bitbake-test-sdk-image
+++ b/lib/oesdk/bitbake-test-sdk-image
@@ -299,10 +299,11 @@ copy_golden_image() {
         return 1
     fi
 
-    dest_path="$arago_tmp/golden/"
+    dest_path="golden/"
     rm -rf $dest_path/$m
 
-    cp -a $img_path $dest_path
+    mkdir $dest_path/$m
+    cp -a $img_path $dest_path/$m
 }
 
 test_sdk_image() {
-- 
2.2.0


