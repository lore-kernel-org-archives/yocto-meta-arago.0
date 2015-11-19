Return-Path: <jake@udc0866934>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 8388052A65
	for <meta-arago@arago-project.org>;
	Thu, 19 Nov 2015 14:39:03 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id tAJEd2wg012388
	for <meta-arago@arago-project.org>; Thu, 19 Nov 2015 08:39:02 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id tAJEd2AC014066
	for <meta-arago@arago-project.org>; Thu, 19 Nov 2015 08:39:02 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 19 Nov 2015 08:39:02 -0600
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id tAJEd2bD006739;
	Thu, 19 Nov 2015 08:39:02 -0600
Received: from jake by udc0866934 with local (Exim 4.82)	(envelope-from
	<jake@udc0866934>)	id 1ZzQMX-0005tm-Fx; Thu, 19 Nov 2015 09:39:01 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 19 Nov 2015 09:38:59 -0500
Message-ID: <1447943939-22640-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [tisdk-setup-scripts][PATCH] create-sdcard.sh: Generalize search for rootfs tarball
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
X-List-Received-Date: Thu, 19 Nov 2015 14:39:04 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 create-sdcard.sh | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/create-sdcard.sh b/create-sdcard.sh
index c877da7..46ed5ae 100644
--- a/create-sdcard.sh
+++ b/create-sdcard.sh
@@ -752,10 +752,10 @@ if [ $FILEPATHOPTION -eq 1 ] ; then
 	BOOTUENV=`ls $BOOTFILEPATH | grep uEnv.txt | awk {'print $1'}`
 	#rootfs
 	ROOTFILEPARTH="$PARSEPATH/filesystem"
-	#ROOTFSTAR=`ls  $ROOTFILEPARTH | grep tisdk-rootfs | awk {'print $1'}`
+	#ROOTFSTAR=`ls  $ROOTFILEPARTH | grep tisdk.*rootfs | awk {'print $1'}`
 
 	#Make sure there is only 1 tar
-	CHECKNUMOFTAR=`ls $ROOTFILEPARTH | grep "tisdk-rootfs" | grep 'tar.gz' | grep -n '' | grep '2:' | awk {'print $1'}`
+	CHECKNUMOFTAR=`ls $ROOTFILEPARTH | grep "tisdk.*rootfs" | grep 'tar.gz' | grep -n '' | grep '2:' | awk {'print $1'}`
 	if [ -n "$CHECKNUMOFTAR" ]
 	then
 cat << EOM
@@ -767,7 +767,7 @@ cat << EOM
 ################################################################################
 
 EOM
-		ls $ROOTFILEPARTH | grep "tisdk-rootfs" | grep 'tar.gz' | grep -n '' | awk {'print "	" , $1'}
+		ls $ROOTFILEPARTH | grep "tisdk.*rootfs" | grep 'tar.gz' | grep -n '' | awk {'print "	" , $1'}
 		echo ""
 		read -p "Enter Number of rootfs Tarball: " TARNUMBER
 		echo " "
@@ -775,7 +775,7 @@ EOM
 		ROOTFSTAR=$FOUNDTARFILENAME
 
 	else
-		ROOTFSTAR=`ls  $ROOTFILEPARTH | grep "tisdk-rootfs" | grep 'tar.gz' | awk {'print $1'}`
+		ROOTFSTAR=`ls  $ROOTFILEPARTH | grep "tisdk.*rootfs" | grep 'tar.gz' | awk {'print $1'}`
 	fi
 
 	ROOTFSUSERFILEPATH=$ROOTFILEPARTH/$ROOTFSTAR
-- 
1.9.1


