Return-Path: <jake@udc0866934>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 8991B52AFE
	for <meta-arago@arago-project.org>;
	Thu, 22 Dec 2016 14:25:37 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id uBMEPaXE021848
	for <meta-arago@arago-project.org>; Thu, 22 Dec 2016 08:25:36 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id uBMEPZOT012483
	for <meta-arago@arago-project.org>; Thu, 22 Dec 2016 08:25:36 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 22 Dec 2016 08:25:35 -0600
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id uBMEPZJD020879;
	Thu, 22 Dec 2016 08:25:35 -0600
Received: from jake by udc0866934 with local (Exim 4.82)	(envelope-from
	<jake@udc0866934>)	id 1cK4JL-000447-Aq; Thu, 22 Dec 2016 09:25:35 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 22 Dec 2016 09:25:25 -0500
Message-ID: <1482416729-15556-5-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1482416729-15556-1-git-send-email-j-stiffler@ti.com>
References: <1482416729-15556-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [tisdk-setup-scripts][PATCH 4/8] setup-uboot-env-keystone.sh: make updating ubifs an independent option
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
X-List-Received-Date: Thu, 22 Dec 2016 14:25:41 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 setup-uboot-env-keystone.sh | 34 ++++++++++++++++++++--------------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/setup-uboot-env-keystone.sh b/setup-uboot-env-keystone.sh
index da90629..0ec6e8e 100755
--- a/setup-uboot-env-keystone.sh
+++ b/setup-uboot-env-keystone.sh
@@ -170,6 +170,17 @@ copy_to_tftproot "$ubifsimages"
 echo "--------------------------------------------------------------------------------"
 prompt_feedback "Would you like to update U-boot on the board?" ubootupdate y y n
 
+prompt_feedback "Would you like to update the UBI filesystem on the board?" ubifsupdate y y n
+
+if [ "$ubifsupdate" = "y" ]; then
+    echo "Available ubi images in $tftproot:"
+    for file in $tftproot/*-${platform}.ubi; do
+	basefile=`basename $file`
+	echo "    $basefile"
+    done
+    echo
+    prompt_feedback "Which ubi image do you want to boot?" ubifsimage $ubifsimagedefault
+fi
 
 echo "Select secondary boot:"
 echo " 1: NFS"
@@ -187,14 +198,6 @@ if [ "$secondary_boot" -eq "1" ]; then
     echo
     prompt_feedback "Which kernel image do you want to boot from TFTP?" kernelimage $kernelimagedefault
 else
-    echo
-    echo "Available ubi images in $tftproot:"
-    for file in $tftproot/*-${platform}.ubi; do
-	basefile=`basename $file`
-	echo "    $basefile"
-    done
-    echo
-    prompt_feedback "Which ubi image do you want to boot?" ubifsimage $ubifsimagedefault
     kernelimage=zImage
 fi
 
@@ -296,14 +299,17 @@ do_expect "\"$prompt\"" "send \"setenv name_ubi $ubifsimage\"" $cwd/setupBoard.m
 do_expect "\"$prompt\"" "send \"setenv name_kern $kernelimage\"" $cwd/setupBoard.minicom
 do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom
 
+if [ "$ubifsupdate" = "y" ]; then
+    do_expect "\"$prompt\"" "send \"run get_ubi_net\"" $cwd/setupBoard.minicom
+    do_expect "\"$prompt\"" "send \"run burn_ubi\"" $cwd/setupBoard.minicom
+fi
+
 if [ "$secondary_boot" -eq "1" ]; then
-	#TFTP and NFS Boot
-	do_expect "\"$prompt\"" "send \"setenv boot net\"" $cwd/setupBoard.minicom
+    #TFTP and NFS Boot
+    do_expect "\"$prompt\"" "send \"setenv boot net\"" $cwd/setupBoard.minicom
 else
-	#SD and NFS Boot
-	do_expect "\"$prompt\"" "send \"run get_ubi_net\"" $cwd/setupBoard.minicom
-	do_expect "\"$prompt\"" "send \"run burn_ubi\"" $cwd/setupBoard.minicom
-	do_expect "\"$prompt\"" "send \"setenv boot ubi\"" $cwd/setupBoard.minicom
+    #UBI Boot
+    do_expect "\"$prompt\"" "send \"setenv boot ubi\"" $cwd/setupBoard.minicom
 fi
 
 do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom
-- 
1.9.1


