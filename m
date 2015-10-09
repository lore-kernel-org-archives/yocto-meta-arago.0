Return-Path: <jake@udc0866934>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 5492C52961
	for <meta-arago@arago-project.org>;
	Fri,  9 Oct 2015 14:39:48 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t99EdltE004493
	for <meta-arago@arago-project.org>; Fri, 9 Oct 2015 09:39:47 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t99Edl8o012878
	for <meta-arago@arago-project.org>; Fri, 9 Oct 2015 09:39:47 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 9 Oct 2015 09:39:47 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t99EdlYC020238;
	Fri, 9 Oct 2015 09:39:47 -0500
Received: from jake by udc0866934 with local (Exim 4.82)	(envelope-from
	<jake@udc0866934>)	id 1ZkYpm-0001Mo-LE; Fri, 09 Oct 2015 10:39:46 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 9 Oct 2015 10:39:42 -0400
Message-ID: <1444401583-5220-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [tisdk-setup-scripts][PATCH 1/2] setup-tftp: Also copy boot-monitor and u-boot.gph
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
X-List-Received-Date: Fri, 09 Oct 2015 14:39:48 -0000
Content-Type: text/plain

* This is required for keystone devices

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 setup-tftp.sh | 60 ++++++++++++++++++++++++++++++++++-------------------------
 1 file changed, 35 insertions(+), 25 deletions(-)

diff --git a/setup-tftp.sh b/setup-tftp.sh
index 3428c73..714968f 100644
--- a/setup-tftp.sh
+++ b/setup-tftp.sh
@@ -55,6 +55,34 @@ disable = no
      echo "$tftpcfg successfully created"
 }
 
+prebuiltimagesdir=`cd $cwd/../board-support/prebuilt-images/ ; echo $PWD`
+copy_to_tftproot() {
+    files="$1"
+    for file in $files
+    do
+	if [ -f $tftproot/$file ]; then
+	    echo
+	    echo "$tftproot/$file already exists. The existing installed file can be renamed and saved under the new name."
+	    echo "(o) overwrite (s) skip copy "
+	    read -p "[o] " exists
+	    case "$exists" in
+	      s) echo "Skipping copy of $file, existing version will be used"
+		 ;;
+	      *) sudo cp "$prebuiltimagesdir/$file" $tftproot
+		 check_status
+		 echo
+		 echo "Successfully overwritten $file in tftp root directory $tftproot"
+		 ;;
+	    esac
+	else
+	    sudo cp "$prebuiltimagesdir/$file" $tftproot
+	    check_status
+	    echo
+	    echo "Successfully copied $file to tftp root directory $tftproot"
+	fi
+    done
+}
+
 echo "--------------------------------------------------------------------------------"
 echo "Which directory do you want to be your tftp root directory?(if this directory does not exist it will be created for you)"
 read -p "[ $tftprootdefault ] " tftproot
@@ -122,32 +150,14 @@ else
     echo "Successfully copied $kernelimage to tftp root directory $tftproot"
 fi
 
-dtbfiles=`cd $cwd/../board-support/prebuilt-images/;ls -1 *.dtb`
-prebuiltimagesdir=`cd $cwd/../board-support/prebuilt-images/ ; echo $PWD`
+dtbfiles=`cd $prebuiltimagesdir;ls -1 *.dtb`
+copy_to_tftproot "$dtbfiles"
 
-for dtbfile in $dtbfiles
-do
-    if [ -f $tftproot/$dtbfile ]; then
-        echo
-        echo "$tftproot/$dtbfile already exists. The existing installed file can be renamed and saved under the new name."
-        echo "(o) overwrite (s) skip copy "
-        read -p "[o] " exists
-        case "$exists" in
-          s) echo "Skipping copy of $dtbfile, existing version will be used"
-             ;;
-          *) sudo cp "$prebuiltimagesdir/$dtbfile" $tftproot
-             check_status
-             echo
-             echo "Successfully overwritten $$dtbfile in tftp root directory $tftproot"
-             ;;
-        esac
-    else
-        sudo cp "$prebuiltimagesdir/$dtbfile" $tftproot
-        check_status
-        echo
-        echo "Successfully copied $dtbfile to tftp root directory $tftproot"
-    fi
-done
+uboot_gph_files=`cd $prebuiltimagesdir;ls -1 u-boot*.gph 2> /dev/null`
+copy_to_tftproot "$uboot_gph_files"
+
+monfiles=`cd $prebuiltimagesdir;ls -1 skern*.bin 2> /dev/null`
+copy_to_tftproot "$monfiles"
 
 echo
 if [ -f $tftpcfg ]; then
-- 
1.9.1


