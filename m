Return-Path: <jake@udc0866934>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 6B0A352AF0
	for <meta-arago@arago-project.org>;
	Thu, 22 Dec 2016 14:25:37 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id uBMEPaTN004646
	for <meta-arago@arago-project.org>; Thu, 22 Dec 2016 08:25:36 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id uBMEPZTm002203
	for <meta-arago@arago-project.org>; Thu, 22 Dec 2016 08:25:35 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 22 Dec 2016 08:25:35 -0600
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id uBMEPZrn027100;
	Thu, 22 Dec 2016 08:25:35 -0600
Received: from jake by udc0866934 with local (Exim 4.82)	(envelope-from
	<jake@udc0866934>)	id 1cK4JK-00043v-Oz; Thu, 22 Dec 2016 09:25:34 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 22 Dec 2016 09:25:22 -0500
Message-ID: <1482416729-15556-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1482416729-15556-1-git-send-email-j-stiffler@ti.com>
References: <1482416729-15556-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [tisdk-setup-scripts][PATCH 1/8] setup-uboot-env-keystone.sh: add prompt_feedback function
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
X-List-Received-Date: Thu, 22 Dec 2016 14:25:42 -0000
Content-Type: text/plain

The prompt_feedback function abstracts many commonalities when
requesting user feedback.

* Echoing the query string
* providing a default value
* listing valid options
* capturing user input to a specified variable

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 setup-uboot-env-keystone.sh | 137 +++++++++++++++++++-------------------------
 1 file changed, 60 insertions(+), 77 deletions(-)

diff --git a/setup-uboot-env-keystone.sh b/setup-uboot-env-keystone.sh
index 7335758..fdd131a 100755
--- a/setup-uboot-env-keystone.sh
+++ b/setup-uboot-env-keystone.sh
@@ -46,6 +46,50 @@ do_expect() {
     echo >> $3
 }
 
+prompt_feedback() {
+    # Usage: prompt_feedback <prompt> [variable] [default_value] [valid_opt1] [valid_opt2]...
+    local prompt="$1"
+    local var=""
+    local default=""
+
+    local opt_str=""
+
+    local response=""
+    local good_response=""
+
+    shift
+    [ $# -eq 0 ] || var="$1"
+    shift
+    [ $# -eq 0 ] || default="$1"
+    shift
+
+    if [ $# -gt 0 ]
+    then
+        opt_str="($1"
+        shift
+
+        while [ $# -gt 0 ]
+        do
+            opt_str="${opt_str}/$1"
+            shift
+        done
+        opt_str="${opt_str})"
+    fi
+
+    echo "$prompt $opt_str"
+    if [ ! -z "$default" ]
+    then
+        read -p "[ $default ] " response
+    else
+        read response
+    fi
+    echo
+
+    [ ! -z "$response" ] || response="$default"
+
+    [ -z "$var" ] || eval $var=\"$response\"
+}
+
 copy_to_tftproot() {
     files="$1"
     for file in $files
@@ -53,8 +97,7 @@ copy_to_tftproot() {
 	if [ -f $tftproot/$file ]; then
 	    echo
 	    echo "$tftproot/$file already exists. The existing installed file can be renamed and saved under the new name."
-	    echo "(o) overwrite (s) skip copy "
-	    read -p "[o] " exists
+	    prompt_feedback "(o) overwrite (s) skip copy" exists o
 	    case "$exists" in
 	      s) echo "Skipping copy of $file, existing version will be used"
 		 ;;
@@ -84,36 +127,18 @@ platform=`grep PLATFORM= $cwd/../Rules.make | cut -d= -f2`
 # Configure prompt for U-Boot 2016.05
 prompt="=>"
 
-echo "Autodetected the following ip address of your host, correct it if necessary"
-read -p "[ $ipdefault ] " ip
-echo
-
-if [ ! -n "$ip" ]; then
-    ip=$ipdefault
-fi
+prompt_feedback "Autodetected the following ip address of your host, correct it if necessary" ip "$(echo $ipdefault | sed -e 's| .*||')" $ipdefault
 
 if [ -f $cwd/../.tftproot ]; then
     tftproot=`cat $cwd/../.tftproot`
 else
-    echo "Where is your tftp root directory?"
-    read -p "[ /tftpboot ]" tftproot
-
-    if [ ! -n "$tftproot" ]; then
-        tftproot="/tftpboot"
-    fi
-    echo
+    prompt_feedback "Where is your tftp root directory?" tftproot "/tftpboot"
 fi
 
 if [ -f $cwd/../.targetfs ]; then
     rootpath=`cat $cwd/../.targetfs`
 else
-    echo "Where is your target filesystem extracted?"
-    read -p "[ ${HOME}/targetNFS ]" rootpath
-
-    if [ ! -n "$rootpath" ]; then
-        rootpath="${HOME}/targetNFS"
-    fi
-    echo
+    prompt_feedback "Where is your target filesystem extracted?" rootpath "${HOME}/targetNFS"
 fi
 
 
@@ -133,24 +158,13 @@ copy_to_tftproot "$ubifsimages"
 
 
 echo "--------------------------------------------------------------------------------"
-echo "Would you like to update U-boot on the board (y/n)?"
-read -p "[ y ] " ubootupdate
-echo
-
-if [ ! -n "$ubootupdate" ]; then
-    ubootupdate="y"
-fi
+prompt_feedback "Would you like to update U-boot on the board?" ubootupdate y y n
 
 
 echo "Select secondary boot:"
 echo " 1: NFS"
 echo " 2: UBI"
-echo
-read -p "[ 1 ] " secondary_boot
-
-if [ ! -n "$secondary_boot" ]; then
-    secondary_boot="1"
-fi
+prompt_feedback "" secondary_boot 1
 
 
 if [ "$secondary_boot" -eq "1" ]; then
@@ -161,12 +175,7 @@ if [ "$secondary_boot" -eq "1" ]; then
 	echo "    $basefile"
     done
     echo
-    echo "Which kernel image do you want to boot from TFTP?"
-    read -p "[ $kernelimagedefault ] " kernelimage
-
-    if [ ! -n "$kernelimage" ]; then
-	kernelimage=$kernelimagedefault
-    fi
+    prompt_feedback "Which kernel image do you want to boot from TFTP?" kernelimage $kernelimagedefault
 else
     echo
     echo "Available ubi images in $tftproot:"
@@ -175,12 +184,7 @@ else
 	echo "    $basefile"
     done
     echo
-    echo "Which ubi image do you want to boot?"
-    read -p "[ $ubifsimagedefault ] " ubifsimage
-
-    if [ ! -n "$ubifsimage" ]; then
-	ubifsimage=$ubifsimagedefault
-    fi
+    prompt_feedback "Which ubi image do you want to boot?" ubifsimage $ubifsimagedefault
     kernelimage=zImage
 fi
 
@@ -302,13 +306,7 @@ __EOF__
 #echo "! killall -s SIGHUP minicom" >> $cwd/setupBoard.minicom
 
 echo "--------------------------------------------------------------------------------"
-echo "Would you like to create a minicom script with the above parameters (y/n)?"
-read -p "[ y ] " minicom
-echo
-
-if [ ! -n "$minicom" ]; then
-    minicom="y"
-fi
+prompt_feedback "Would you like to create a minicom script with the above parameters?" minicom y y n
 
 if [ "$minicom" = "y" ]; then
 
@@ -324,8 +322,7 @@ if [ "$minicom" = "y" ]; then
             break
         else
             echo ""
-            echo "Board could not be detected. Please connect the board to the PC."
-            read -p "Press any key to try checking again." temp
+            prompt_feedback "Board could not be detected. Please connect the board to the PC." temp "Press any key to try checking again"
         fi
     done
 
@@ -360,22 +357,13 @@ if [ "$minicom" = "y" ]; then
             if [ -n "$port" ]; then
                 echo "${platform} autodetected at /dev/$port"
                 echo
-                echo "Please verify that this is correct or manually enter the correct port:"
-                echo
-                read -p "[/dev/$port] " dev_port
-                echo
+                prompt_feedback "Please verify that this is correct or manually enter the correct port:" dev_port "/dev/$port"
 
-                if [ ! -n "$dev_port" ]
+                if [ ! -e "${dev_port}" ]
                 then
-                    dev_port="/dev/$port"
-                    break
+                    echo "ERROR: ${dev_port} does not exist!"
                 else
-                    if [ ! -e "${dev_port}" ]
-                    then
-                        echo "ERROR: ${dev_port} does not exist!"
-                    else
-                        break
-                    fi
+                    break
                 fi
             fi
 
@@ -384,8 +372,7 @@ if [ "$minicom" = "y" ]; then
                 echo ""
                 echo "Unable to detect which port the board is connected to."
                 echo "Please reconnect your board."
-                echo "Press 'y' to attempt to detect your board again or press 'n' to continue..."
-                read -p "(y/n)" retryBoardDetection
+                prompt_feedback "Press 'y' to attempt to detect your board again or press 'n' to continue..." retryBoardDetection y
             fi
 
             #if they choose not to retry, ask user to reboot manually and exit
@@ -411,12 +398,8 @@ if [ "$minicom" = "y" ]; then
     echo "able to connect to it by executing 'minicom -w' or if you prefer a windows host"
     echo "you can set up Tera Term as explained in the Software Developer's Guide."
     echo "If you connect minicom or Tera Term and power cycle the board Linux will boot."
-    echo
-    read -p "[ y ] " minicomsetup
 
-    if [ ! -n "$minicomsetup" ]; then
-       minicomsetup="y"
-    fi
+    prompt_feedback "" minicomsetup y
 
     if [ "$minicomsetup" = "y" ]; then
       cd $cwd
-- 
1.9.1


