Return-Path: <jake@udc0866934>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [198.47.19.12])
	by arago-project.org (Postfix) with ESMTPS id 2EEAE529E8
	for <meta-arago@arago-project.org>;
	Mon, 15 Aug 2016 16:56:26 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u7FGuPgH025895
	for <meta-arago@arago-project.org>; Mon, 15 Aug 2016 11:56:25 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u7FGuPow030866
	for <meta-arago@arago-project.org>; Mon, 15 Aug 2016 11:56:25 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 15 Aug 2016 11:56:24 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u7FGuOjb006391;
	Mon, 15 Aug 2016 11:56:24 -0500
Received: from jake by udc0866934 with local (Exim 4.82)	(envelope-from
	<jake@udc0866934>)	id 1bZLBY-00048x-9S; Mon, 15 Aug 2016 12:56:24 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 15 Aug 2016 12:56:20 -0400
Message-ID: <1471280181-15895-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [tisdk-setup-scripts][PATCH 1/2] create-sdcard: update for switch to tar.xz image formats
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
X-List-Received-Date: Mon, 15 Aug 2016 16:56:26 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 create-sdcard.sh | 44 ++++++++++++++++++++++----------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/create-sdcard.sh b/create-sdcard.sh
index edf57b0..7ada332 100644
--- a/create-sdcard.sh
+++ b/create-sdcard.sh
@@ -87,8 +87,8 @@ untar_progress ()
 {
     TARBALL=$1;
     DIRECTPATH=$2;
-    BLOCKING_FACTOR=$(($(gzip --list ${TARBALL} | sed -n -e "s/.*[[:space:]]\+[0-9]\+[[:space:]]\+\([0-9]\+\)[[:space:]].*$/\1/p") / 51200 + 1));
-    tar --blocking-factor=${BLOCKING_FACTOR} --checkpoint=1 --checkpoint-action='ttyout=Written %u%  \r' -zxf ${TARBALL} -C ${DIRECTPATH}
+    BLOCKING_FACTOR=$(($(xz --robot --list ${TARBALL} | grep 'totals' | awk '{print $5}') / 51200 + 1));
+    tar --blocking-factor=${BLOCKING_FACTOR} --checkpoint=1 --checkpoint-action='ttyout=Written %u%  \r' -Jxf ${TARBALL} -C ${DIRECTPATH}
 }
 
 #copy/paste programs
@@ -150,26 +150,26 @@ populate_3_partitions() {
             continue
 		fi
         # Check that tarballs were found
-        if [ ! -e "$TARBALLPATH""/boot_partition.tar.gz" ]
+        if [ ! -e "$TARBALLPATH""/boot_partition.tar.xz" ]
         then
-            echo "Could not find boot_partition.tar.gz as expected.  Please"
-            echo "point to the directory containing the boot_partition.tar.gz"
+            echo "Could not find boot_partition.tar.xz as expected.  Please"
+            echo "point to the directory containing the boot_partition.tar.xz"
             ENTERCORRECTLY=0
             continue
         fi
 
-        if [ ! -e "$TARBALLPATH""/rootfs_partition.tar.gz" ]
+        if [ ! -e "$TARBALLPATH""/rootfs_partition.tar.xz" ]
         then
-            echo "Could not find rootfs_partition.tar.gz as expected.  Please"
-            echo "point to the directory containing the rootfs_partition.tar.gz"
+            echo "Could not find rootfs_partition.tar.xz as expected.  Please"
+            echo "point to the directory containing the rootfs_partition.tar.xz"
             ENTERCORRECTLY=0
             continue
         fi
 
-        if [ ! -e "$TARBALLPATH""/start_here_partition.tar.gz" ]
+        if [ ! -e "$TARBALLPATH""/start_here_partition.tar.xz" ]
         then
-            echo "Could not find start_here_partition.tar.gz as expected.  Please"
-            echo "point to the directory containing the start_here_partition.tar.gz"
+            echo "Could not find start_here_partition.tar.xz as expected.  Please"
+            echo "point to the directory containing the start_here_partition.tar.xz"
             ENTERCORRECTLY=0
             continue
         fi
@@ -199,7 +199,7 @@ cat << EOM
 
 ################################################################################
 EOM
-        untar_progress $TARBALLPATH/boot_partition.tar.gz tmp/
+        untar_progress $TARBALLPATH/boot_partition.tar.xz tmp/
         if [ -e "./tmp/MLO" ]
         then
             cp ./tmp/MLO boot/
@@ -213,7 +213,7 @@ cat << EOM
 
 ################################################################################
 EOM
-        untar_progress $TARBALLPATH/rootfs_partition.tar.gz rootfs/
+        untar_progress $TARBALLPATH/rootfs_partition.tar.xz rootfs/
 
 cat << EOM
 
@@ -223,7 +223,7 @@ cat << EOM
 ################################################################################
 EOM
         rm -rf tmp/*
-        untar_progress $TARBALLPATH/start_here_partition.tar.gz tmp/
+        untar_progress $TARBALLPATH/start_here_partition.tar.xz tmp/
 
 cat << EOM
 
@@ -752,7 +752,7 @@ if [ $FILEPATHOPTION -eq 1 ] ; then
 	#ROOTFSTAR=`ls  $ROOTFILEPARTH | grep tisdk.*rootfs | awk {'print $1'}`
 
 	#Make sure there is only 1 tar
-	CHECKNUMOFTAR=`ls $ROOTFILEPARTH | grep "tisdk.*rootfs" | grep 'tar.gz' | grep -n '' | grep '2:' | awk {'print $1'}`
+	CHECKNUMOFTAR=`ls $ROOTFILEPARTH | grep "tisdk.*rootfs" | grep 'tar.xz' | grep -n '' | grep '2:' | awk {'print $1'}`
 	if [ -n "$CHECKNUMOFTAR" ]
 	then
 cat << EOM
@@ -764,15 +764,15 @@ cat << EOM
 ################################################################################
 
 EOM
-		ls $ROOTFILEPARTH | grep "tisdk.*rootfs" | grep 'tar.gz' | grep -n '' | awk {'print "	" , $1'}
+		ls $ROOTFILEPARTH | grep "tisdk.*rootfs" | grep 'tar.xz' | grep -n '' | awk {'print "	" , $1'}
 		echo ""
 		read -p "Enter Number of rootfs Tarball: " TARNUMBER
 		echo " "
-		FOUNDTARFILENAME=`ls $ROOTFILEPARTH | grep "rootfs" | grep 'tar.gz' | grep -n '' | grep "${TARNUMBER}:" | cut -c3- | awk {'print$1'}`
+		FOUNDTARFILENAME=`ls $ROOTFILEPARTH | grep "rootfs" | grep 'tar.xz' | grep -n '' | grep "${TARNUMBER}:" | cut -c3- | awk {'print$1'}`
 		ROOTFSTAR=$FOUNDTARFILENAME
 
 	else
-		ROOTFSTAR=`ls  $ROOTFILEPARTH | grep "tisdk.*rootfs" | grep 'tar.gz' | awk {'print $1'}`
+		ROOTFSTAR=`ls  $ROOTFILEPARTH | grep "tisdk.*rootfs" | grep 'tar.xz' | awk {'print $1'}`
 	fi
 
 	ROOTFSUSERFILEPATH=$ROOTFILEPARTH/$ROOTFSTAR
@@ -786,7 +786,7 @@ cat << EOM
   For U-boot and MLO
 
   If files are located in Tarball write complete path including the file name.
-      e.x. $:  /home/user/MyCustomTars/boot.tar.gz
+      e.x. $:  /home/user/MyCustomTars/boot.tar.xz
 
   If files are located in a directory write the directory path
       e.x. $: /ti-sdk/board-support/prebuilt-images/
@@ -919,7 +919,7 @@ cat << EOM
    For Rootfs partition
 
    If files are located in Tarball write complete path including the file name.
-      e.x. $:  /home/user/MyCustomTars/rootfs.tar.gz
+      e.x. $:  /home/user/MyCustomTars/rootfs.tar.xz
 
   If files are located in a directory write the directory path
       e.x. $: /ti-sdk/targetNFS/
@@ -959,7 +959,7 @@ EOM
 
 
 	# Check if user entered a tar or not for Boot
-	ISBOOTTAR=`ls $BOOTUSERFILEPATH | grep .tar.gz | awk {'print $1'}`
+	ISBOOTTAR=`ls $BOOTUSERFILEPATH | grep .tar.xz | awk {'print $1'}`
 	if [ -n "$ISBOOTTAR" ]
 	then
 		BOOTPATHOPTION=2
@@ -981,7 +981,7 @@ EOM
 
 
 	#Check if user entered a tar or not for Rootfs
-	ISROOTFSTAR=`ls $ROOTFSUSERFILEPATH | grep .tar.gz | awk {'print $1'}`
+	ISROOTFSTAR=`ls $ROOTFSUSERFILEPATH | grep .tar.xz | awk {'print $1'}`
 	if [ -n "$ISROOTFSTAR" ]
 	then
 		ROOTFSPATHOPTION=2
-- 
1.9.1


