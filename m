Return-Path: <jake@udc0866934>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 250D652A58
	for <meta-arago@arago-project.org>;
	Fri,  9 Oct 2015 14:39:50 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t99EdnwV023658
	for <meta-arago@arago-project.org>; Fri, 9 Oct 2015 09:39:49 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t99Edn4I015889
	for <meta-arago@arago-project.org>; Fri, 9 Oct 2015 09:39:49 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 9 Oct 2015 09:39:49 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t99EdmxC027387;
	Fri, 9 Oct 2015 09:39:49 -0500
Received: from jake by udc0866934 with local (Exim 4.82)	(envelope-from
	<jake@udc0866934>)	id 1ZkYpo-0001Mt-Ph; Fri, 09 Oct 2015 10:39:48 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 9 Oct 2015 10:39:43 -0400
Message-ID: <1444401583-5220-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1444401583-5220-1-git-send-email-j-stiffler@ti.com>
References: <1444401583-5220-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [tisdk-setup-scripts][PATCH 2/2] setup-uboot-env-keystone: Add u-boot env setup for keystone devices
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
X-List-Received-Date: Fri, 09 Oct 2015 14:39:50 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 ...nv-am57xx-evm.sh => setup-uboot-env-keystone.sh | 188 ++++++++++++++-------
 1 file changed, 123 insertions(+), 65 deletions(-)
 copy setup-uboot-env-am57xx-evm.sh => setup-uboot-env-keystone.sh (61%)
 mode change 100644 => 100755

diff --git a/setup-uboot-env-am57xx-evm.sh b/setup-uboot-env-keystone.sh
old mode 100644
new mode 100755
similarity index 61%
copy from setup-uboot-env-am57xx-evm.sh
copy to setup-uboot-env-keystone.sh
index ae95368..71e407d
--- a/setup-uboot-env-am57xx-evm.sh
+++ b/setup-uboot-env-keystone.sh
@@ -38,6 +38,7 @@ do_expect() {
     check_status
     echo "    $1" >> $3
     check_status
+    echo "    timeout 600 goto end" >> $3
     echo "}" >> $3
     check_status
     echo $2 >> $3
@@ -45,6 +46,32 @@ do_expect() {
     echo >> $3
 }
 
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
 
 echo
 echo "--------------------------------------------------------------------------------"
@@ -54,7 +81,6 @@ echo "--------------------------------------------------------------------------
 ipdefault=`ifconfig | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d: -f2 | awk '{ print $1 }'`
 platform=`grep PLATFORM= $cwd/../Rules.make | cut -d= -f2`
 
-
 echo "Autodetected the following ip address of your host, correct it if necessary"
 read -p "[ $ipdefault ] " ip
 echo
@@ -63,6 +89,18 @@ if [ ! -n "$ip" ]; then
     ip=$ipdefault
 fi
 
+if [ -f $cwd/../.tftproot ]; then
+    tftproot=`cat $cwd/../.tftproot`
+else
+    echo "Where is your tftp root directory?"
+    read -p "[ /tftpboot ]" tftproot
+
+    if [ ! -n "$tftproot" ]; then
+        tftproot="/tftpboot"
+    fi
+    echo
+fi
+
 if [ -f $cwd/../.targetfs ]; then
     rootpath=`cat $cwd/../.targetfs`
 else
@@ -75,38 +113,47 @@ else
     echo
 fi
 
+
 kernelimage="zImage-""$platform"".bin"
 kernelimagesrc=`ls -1 $cwd/../board-support/prebuilt-images/$kernelimage`
 kernelimagedefault=`basename $kernelimagesrc`
 
+ubootimage="u-boot-spi-${platform}.gph"
+
+ubifsimage="tisdk-server-rootfs-image-${platform}.ubi"
+ubifsimagesrc=`ls -1 $cwd/../filesystem/$ubifsimage`
+ubifsimagedefault=`basename $ubifsimagesrc`
 
-echo "Select Linux kernel location:"
-echo " 1: TFTP"
-echo " 2: SD card"
+prebuiltimagesdir=`cd $cwd/../filesystem/ ; echo $PWD`
+ubifsimages=`cd $prebuiltimagesdir;ls -1 *.ubi 2> /dev/null`
+copy_to_tftproot "$ubifsimages"
+
+
+echo "--------------------------------------------------------------------------------"
+echo "Would you like to update U-boot on the board (y/n)?"
+read -p "[ y ] " ubootupdate
 echo
-read -p "[ 1 ] " kernel
 
-if [ ! -n "$kernel" ]; then
-    kernel="1"
+if [ ! -n "$ubootupdate" ]; then
+    ubootupdate="y"
 fi
 
-echo
-echo "Select root file system location:"
+
+echo "Select secondary boot:"
 echo " 1: NFS"
-echo " 2: SD card"
+echo " 2: UBI"
 echo
-read -p "[ 1 ] " fs
+read -p "[ 1 ] " secondary_boot
 
-if [ ! -n "$fs" ]; then
-    fs="1"
+if [ ! -n "$secondary_boot" ]; then
+    secondary_boot="1"
 fi
 
 
-
-if [ "$kernel" -eq "1" ]; then
+if [ "$secondary_boot" -eq "1" ]; then
     echo
-    echo "Available kernel images in /tftproot:"
-    for file in /tftpboot/*; do
+    echo "Available kernel images in $tftproot:"
+    for file in $tftproot/*; do
 	basefile=`basename $file`
 	echo "    $basefile"
     done
@@ -117,6 +164,21 @@ if [ "$kernel" -eq "1" ]; then
     if [ ! -n "$kernelimage" ]; then
 	kernelimage=$kernelimagedefault
     fi
+else
+    echo
+    echo "Available ubi images in $tftproot:"
+    for file in $tftproot/*-${platform}.ubi; do
+	basefile=`basename $file`
+	echo "    $basefile"
+    done
+    echo
+    echo "Which ubi image do you want to boot?"
+    read -p "[ $ubifsimagedefault ] " ubifsimage
+
+    if [ ! -n "$ubifsimage" ]; then
+	ubifsimage=$ubifsimagedefault
+    fi
+    kernelimage=zImage
 fi
 
 board="unknown"
@@ -127,9 +189,16 @@ check_for_board() {
     then
         board="x15"
     fi
+
+    lsusb -vv -d 0403:6010 > /dev/null 2>&1
+
+    if [ "$?" = "0" ]
+    then
+        board="k2hk"
+    fi
 }
 
-echo "timeout 300" > $cwd/setupBoard.minicom
+echo "timeout 1800" > $cwd/setupBoard.minicom
 echo "verbose on" >> $cwd/setupBoard.minicom
 do_expect "\"stop autoboot:\"" "send \" \"" $cwd/setupBoard.minicom
 do_expect "\"U-Boot#\"" "send \"env default -f -a\"" $cwd/setupBoard.minicom
@@ -137,51 +206,35 @@ do_expect "\"U-Boot#\"" "send \"saveenv\"" $cwd/setupBoard.minicom
 do_expect "\"U-Boot#\"" "send \"reset\"" $cwd/setupBoard.minicom
 do_expect "\"stop autoboot:\"" "send \" \"" $cwd/setupBoard.minicom
 
-if [ "$kernel" -eq "1" ]; then
-	if [ "$fs" -eq "1" ]; then
-		#TFTP and NFS Boot
-		do_expect "\"U-Boot#\"" "send \"setenv serverip $ip\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send setenv rootpath '$rootpath'" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"setenv bootfile $kernelimage\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"setenv ip_method dhcp\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"setenv nfsopts 'nolock,v3,tcp,rsize=4096,wsize=4096'\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"setenv getuenv 'mmc dev \${mmcdev}; if mmc rescan; then if run loadbootenv; then run importbootenv; fi; fi;'\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send setenv bootcmd 'run findfdt; run getuenv; setenv autoload no;dhcp ;tftp \${loadaddr} $kernelimage; tftp \${fdtaddr} \${fdtfile}; run netargs; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"saveenv\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"boot\"" $cwd/setupBoard.minicom
-	else
-		#TFTP and SD Boot
-		do_expect "\"U-Boot#\"" "send \"setenv serverip $ip\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"setenv bootfile $kernelimage\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"setenv ip_method none\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"setenv getuenv 'mmc dev \${mmcdev}; if mmc rescan; then if run loadbootenv; then run importbootenv; fi; fi;'\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send setenv bootcmd 'run findfdt; run getuenv; setenv autoload no; dhcp ; tftp \${loadaddr} $kernelimage; tftp \${fdtaddr} \${fdtfile}; run mmcargs; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"saveenv\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"boot\"" $cwd/setupBoard.minicom
-	fi
-else
-	if [ "$fs" -eq "1" ]; then
-		#SD and NFS Boot
-		do_expect "\"U-Boot#\"" "send \"setenv serverip $ip\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send setenv rootpath '$rootpath'" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"setenv bootfile zImage\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"setenv ip_method dhcp\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"setenv nfsopts 'nolock,v3,tcp,rsize=4096,wsize=4096'\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"setenv getuenv 'mmc dev \${mmcdev}; if mmc rescan; then if run loadbootenv; then run importbootenv; fi; fi;'\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send setenv bootcmd 'setenv autoload no; mmc rescan; run findfdt; run getuenv; run loadimage; run loadfdt; run netargs; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"saveenv\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"boot\"" $cwd/setupBoard.minicom
-	    else
-		#SD and SD boot.
-		do_expect "\"U-Boot#\"" "send \"setenv ip_method none\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"setenv bootfile zImage\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"setenv getuenv 'mmc dev \${mmcdev}; if mmc rescan; then if run loadbootenv; then run importbootenv; fi; fi;'\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send setenv bootcmd 'mmc rescan; run findfdt; run getuenv; run loadimage; run loadfdt; run mmcargs; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"saveenv\"" $cwd/setupBoard.minicom
-		do_expect "\"U-Boot#\"" "send \"boot\"" $cwd/setupBoard.minicom
+do_expect "\"U-Boot#\"" "send \"setenv serverip $ip\"" $cwd/setupBoard.minicom
+do_expect "\"U-Boot#\"" "send setenv tftp_root '$tftproot'" $cwd/setupBoard.minicom
+do_expect "\"U-Boot#\"" "send setenv nfs_root '$rootpath'" $cwd/setupBoard.minicom
+do_expect "\"U-Boot#\"" "send \"setenv name_ubi $ubifsimage\"" $cwd/setupBoard.minicom
+do_expect "\"U-Boot#\"" "send \"setenv name_kern $kernelimage\"" $cwd/setupBoard.minicom
+do_expect "\"U-Boot#\"" "send \"setenv name_uboot $ubootimage\"" $cwd/setupBoard.minicom
+do_expect "\"U-Boot#\"" "send \"saveenv\"" $cwd/setupBoard.minicom
 
-	fi
+if [ "$ubootupdate" = "y" ]; then
+	do_expect "\"U-Boot#\"" "send \"run get_uboot_net\"" $cwd/setupBoard.minicom
+	do_expect "\"U-Boot#\"" "send \"run burn_uboot_spi\"" $cwd/setupBoard.minicom
+	do_expect "\"U-Boot#\"" "send \"reset\"" $cwd/setupBoard.minicom
+	do_expect "\"stop autoboot:\"" "send \" \"" $cwd/setupBoard.minicom
 fi
+
+if [ "$secondary_boot" -eq "1" ]; then
+	#TFTP and NFS Boot
+	do_expect "\"U-Boot#\"" "send \"setenv boot net\"" $cwd/setupBoard.minicom
+else
+	#SD and NFS Boot
+	do_expect "\"U-Boot#\"" "send \"run get_ubi_net\"" $cwd/setupBoard.minicom
+	do_expect "\"U-Boot#\"" "send \"run burn_ubi\"" $cwd/setupBoard.minicom
+	do_expect "\"U-Boot#\"" "send \"setenv boot ubi\"" $cwd/setupBoard.minicom
+fi
+
+do_expect "\"U-Boot#\"" "send \"saveenv\"" $cwd/setupBoard.minicom
+do_expect "\"U-Boot#\"" "send \"boot\"" $cwd/setupBoard.minicom
+
+echo "end:" >> $cwd/setupBoard.minicom
 echo "! killall -s SIGHUP minicom" >> $cwd/setupBoard.minicom
 
 echo "--------------------------------------------------------------------------------"
@@ -202,7 +255,7 @@ if [ "$minicom" = "y" ]; then
     do
         check_for_board
 
-        if [ "$board" = "x15" ]
+        if [ "$board" = "k2hk" ]
         then
             break
         else
@@ -223,21 +276,26 @@ if [ "$minicom" = "y" ]; then
         while [ yes ]
         do
             echo ""
+            echo "--------------------------------------------------------------------------------"
+            echo
             echo -n "Detecting connection to board... "
             loopCount=0
-            port=`dmesg | grep FTDI | grep "tty" | tail -1 | grep "attached" |  awk '{ print $NF }'`
+            usb_id=`dmesg | grep 'idVendor=0403' | grep 'idProduct=6010' | tail -1 | sed -e 's|.*usb \(.*\):.*|\1|'`
+            port=`dmesg  | grep FTDI | grep "$usb_id" | grep "tty" | tail -2 | head -1 | grep "attached" |  awk '{ print $NF }'`
             while [ -z "$port" ] && [ "$loopCount" -ne "10" ]
             do
                 #count to 10 and timeout if no connection is found
                 loopCount=$((loopCount+1))
 
                 sleep 1
-                port=`dmesg  | grep FTDI | grep "tty" | tail -1 | grep "attached" |  awk '{ print $NF }'`
+                usb_id=`dmesg | grep 'idVendor=0403' | grep 'idProduct=6010' | tail -1 | sed -e 's|.*usb \(.*\):.*|\1|'`
+                port=`dmesg  | grep FTDI | grep "$usb_id" | grep "tty" | tail -2 | head -1 | grep "attached" |  awk '{ print $NF }'`
             done
 
             #check to see if we actually found a port
             if [ -n "$port" ]; then
-                echo "/dev/$port"
+                echo "k2hk-evm connected at /dev/$port"
+                echo
                 break;
             fi
 
-- 
1.9.1


