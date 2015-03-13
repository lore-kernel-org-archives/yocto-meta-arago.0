Return-Path: <a0866934local@udb0866934>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 71D9E5297F
	for <meta-arago@arago-project.org>;
	Fri, 13 Mar 2015 13:49:16 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2DDnCu0009157
	for <meta-arago@arago-project.org>; Fri, 13 Mar 2015 08:49:13 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2DDnBsa003542
	for <meta-arago@arago-project.org>; Fri, 13 Mar 2015 08:49:11 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 13 Mar 2015 08:49:11 -0500
Received: from udb0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2DDnBHB010231;
	Fri, 13 Mar 2015 08:49:11 -0500
Received: from a0866934local by udb0866934 with local (Exim 4.76)
	(envelope-from <a0866934local@udb0866934>)	id 1YWPxf-0007Xp-6p;
	Fri, 13 Mar 2015 09:49:11 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 13 Mar 2015 09:49:04 -0400
Message-ID: <1426254544-28971-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [tisdk-setup-scripts][PATCH] create-sdcard: Change SDK install prefix from ti-sdk to processor-sdk.
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
X-List-Received-Date: Fri, 13 Mar 2015 13:49:17 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 create-sdcard.sh |   14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/create-sdcard.sh b/create-sdcard.sh
index ca02ad2..17ae564 100644
--- a/create-sdcard.sh
+++ b/create-sdcard.sh
@@ -74,7 +74,7 @@ if [ "$AMIROOT" != "root" ] ; then
 fi
 
 THEPWD=$EXEPATH
-PARSEPATH=`echo $THEPWD | grep -o '.*ti-sdk.*.[0-9]/'`
+PARSEPATH=`echo $THEPWD | grep -o '.*processor-sdk.*.[0-9]/'`
 
 if [ "$PARSEPATH" != "" ] ; then
 PATHVALID=1
@@ -703,7 +703,7 @@ if [ $FILEPATHOPTION -eq 1 ] ; then
 
 	#check that in the right directory
 
-	THEEVMSDK=`echo $PARSEPATH | grep -o 'ti-sdk-.*[0-9]'`
+	THEEVMSDK=`echo $PARSEPATH | grep -o 'processor-sdk-.*[0-9]'`
 
 	if [ $PATHVALID -eq 1 ]; then
 	echo "now installing:  $THEEVMSDK"
@@ -720,7 +720,7 @@ if [ $FILEPATHOPTION -eq 1 ] ; then
 			then
 				echo "Directory exists"
 				echo ""
-				PARSEPATH=`echo $SDKFILEPATH | grep -o '.*ti-sdk.*.[0-9]/'`
+				PARSEPATH=`echo $SDKFILEPATH | grep -o '.*processor-sdk.*.[0-9]/'`
 				#echo $PARSEPATH
 
 				if [ "$PARSEPATH" != "" ] ; then
@@ -731,7 +731,7 @@ if [ $FILEPATHOPTION -eq 1 ] ; then
 				#echo $PATHVALID
 				if [ $PATHVALID -eq 1 ] ; then
 
-				THEEVMSDK=`echo $SDKFILEPATH | grep -o 'ti-sdk-.*[0-9]'`
+				THEEVMSDK=`echo $SDKFILEPATH | grep -o 'processor-sdk-.*[0-9]'`
 				echo "Is this the correct SDK: $THEEVMSDK"
 				echo ""
 				read -p 'Is this correct? [y/n] : ' ISRIGHTPATH
@@ -741,7 +741,7 @@ if [ $FILEPATHOPTION -eq 1 ] ; then
 					*)  echo "Please enter y or n";ENTERCORRECTLY=0;;
 					esac
 				else
-				echo "Invalid SDK path make sure to include ti-sdk-xxxx"
+				echo "Invalid SDK path make sure to include processor-sdk-xxxx"
 				ENTERCORRECTLY=0
 				fi
 
@@ -804,7 +804,7 @@ cat << EOM
       e.x. $:  /home/user/MyCustomTars/boot.tar.gz
 
   If files are located in a directory write the directory path
-      e.x. $: /ti-sdk/board-support/prebuilt-images/
+      e.x. $: /processor-sdk/board-support/prebuilt-images/
 
   NOTE: Not all platforms will have an MLO file and this file can
         be ignored for platforms that do not support an MLO.
@@ -937,7 +937,7 @@ cat << EOM
       e.x. $:  /home/user/MyCustomTars/rootfs.tar.gz
 
   If files are located in a directory write the directory path
-      e.x. $: /ti-sdk/targetNFS/
+      e.x. $: /processor-sdk/targetNFS/
 
 ################################################################################
 
-- 
1.7.9.5


