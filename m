Return-Path: <jake@udc0866934>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [198.47.19.12])
	by arago-project.org (Postfix) with ESMTPS id 8D1895299F
	for <meta-arago@arago-project.org>;
	Mon, 15 Aug 2016 16:55:41 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u7FGteKa025367
	for <meta-arago@arago-project.org>; Mon, 15 Aug 2016 11:55:40 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u7FGtee2030125
	for <meta-arago@arago-project.org>; Mon, 15 Aug 2016 11:55:40 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 15 Aug 2016 11:55:39 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u7FGtd3j015117;
	Mon, 15 Aug 2016 11:55:40 -0500
Received: from jake by udc0866934 with local (Exim 4.82)	(envelope-from
	<jake@udc0866934>)	id 1bZLAp-00047d-HT; Mon, 15 Aug 2016 12:55:39 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 15 Aug 2016 12:55:37 -0400
Message-ID: <1471280137-15812-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [tisdk-build-scripts][PATCH] package-sdks: switch to tar.xz format
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
X-List-Received-Date: Mon, 15 Aug 2016 16:55:42 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 lib/oesdk/package-sdks | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/lib/oesdk/package-sdks b/lib/oesdk/package-sdks
index 498ee79..720b62a 100644
--- a/lib/oesdk/package-sdks
+++ b/lib/oesdk/package-sdks
@@ -77,12 +77,12 @@ create_sd_card_content() {
         cp -rLf $SD_CARD_CONTENT/$m/boot/* .
     fi
 
-    # Now tar up the boot_partition.tar.gz file
-    tar czf $sd_card_root/boot_partition.tar.gz *
+    # Now tar up the boot_partition.tar.xz file
+    tar cJf $sd_card_root/boot_partition.tar.xz *
 
     if [ "$?" != "0" ]
     then
-        echo "Could not create boot_partition.tar.gz"
+        echo "Could not create boot_partition.tar.xz"
         echo "FAILED" > $LOG_DIR/$m-build-sdcard.txt
         return 1
     fi
@@ -93,7 +93,7 @@ create_sd_card_content() {
 
     if [ "$?" != "0" ]
     then
-        echo "Could not mv rootfs_partition.tar.gz"
+        echo "Could not mv rootfs_partition.tar.xz"
         echo "FAILED" > $LOG_DIR/$m-build-sdcard.txt
         return 1
     fi
@@ -128,12 +128,12 @@ create_sd_card_content() {
         cp -rLf $SD_CARD_CONTENT/$m/start_here/* .
     fi
 
-    # Now tar up the start_here_partition.tar.gz file
-    tar czf $sd_card_root/start_here_partition.tar.gz *
+    # Now tar up the start_here_partition.tar.xz file
+    tar cJf $sd_card_root/start_here_partition.tar.xz *
 
     if [ "$?" != "0" ]
     then
-        echo "Could not create start_here_partition.tar.gz"
+        echo "Could not create start_here_partition.tar.xz"
         echo "FAILED" > $LOG_DIR/$m-build-sdcard.txt
         return 1
     fi
@@ -228,7 +228,7 @@ package_web_content() {
     # First the sources tarball
     cd $TEST_ROOT/$m-test/temp
 
-    tar --exclude=prebuilt-images -czf $exports_root/$m-sdk-src-$TISDK_VERSION.tar.gz board-support/*
+    tar --exclude=prebuilt-images -cJf $exports_root/$m-sdk-src-$TISDK_VERSION.tar.xz board-support/*
 
     if [ "$?" != 0 ]
     then
@@ -258,7 +258,7 @@ package_web_content() {
     fi
 
     cd $exports_root
-    tar czf $m-sdk-bin-$TISDK_VERSION.tar.gz board-support-bin/*
+    tar cJf $m-sdk-bin-$TISDK_VERSION.tar.xz board-support-bin/*
     if [ "$?" != 0 ]
     then
         echo "Could not create SDK binaries tarball"
@@ -270,7 +270,7 @@ package_web_content() {
 
     if [ "$EXPORT_ARAGO_SRC" == "1" ]
     then
-        tar -C $DL_DIR -czf $exports_root/$m-sdk-arago-src-$TISDK_VERSION.tar.gz .
+        tar -C $DL_DIR -cJf $exports_root/$m-sdk-arago-src-$TISDK_VERSION.tar.xz .
 
         if [ "$?" != 0 ]
         then
-- 
1.9.1


