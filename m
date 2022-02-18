Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web09.7451.1645161442314382910
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 17 Feb 2022 21:17:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=fD2zo2Mb;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: a-m1@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21I5HKWq002719
	for <meta-arago@lists.yoctoproject.org>; Thu, 17 Feb 2022 23:17:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1645161440;
	bh=nvxgonkRB5tlYfvFCFYV5C4lnEreKhOqSIy1Z665BAg=;
	h=From:To:CC:Subject:Date;
	b=fD2zo2Mb7bCoSKys4I0ueDLYFmoxc0cmswRTnXa8exSCVSt6uFLAJaJZKmQBHcJrE
	 QbtEpuhcNd6IDyxdAQ6YBmNFPqI1A6RdF+0TADQXG6uKeghM8ANcjdNlQzSkjgaI/l
	 c4nJ2rUrrnskindD2UDlmHYic2pChuZ7eMdyiLvI=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21I5HKAr009286
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Thu, 17 Feb 2022 23:17:20 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 17
 Feb 2022 23:17:20 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 17 Feb 2022 23:17:20 -0600
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21I5HH0w020309;
	Thu, 17 Feb 2022 23:17:18 -0600
From: "Aparna M" <a-m1@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>, <yogeshs@ti.com>,
        <reatmon@ti.com>
CC: <nikhil.nd@ti.com>, <nsekhar@ti.com>
Subject: [meta-arago][tisdk-setup-scripts][master][PATCH] setup-uboot-env-am18x: Bring script up to par with other u-boot env setup scripts
Date: Fri, 18 Feb 2022 10:47:15 +0530
Message-ID: <20220218051715.22384-1-a-m1@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Modify script to bring it upto par with other u-boot env setup scripts

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>

Signed-off-by: Aparna M <a-m1@ti.com>
---
 setup-uboot-env-am18x.sh | 314 ++++++++++++++-------------------------
 1 file changed, 112 insertions(+), 202 deletions(-)

diff --git a/setup-uboot-env-am18x.sh b/setup-uboot-env-am18x.sh
index 3733281..79dfd42 100644
--- a/setup-uboot-env-am18x.sh
+++ b/setup-uboot-env-am18x.sh
@@ -33,18 +33,30 @@
 cwd=`dirname $0`
 . $cwd/common.sh
 
-echo
-echo "--------------------------------------------------------------------------------"
-echo "This step will set up the u-boot variables for booting the EVM."
-
-SDKinstall=`grep TI_SDK_PATH= $cwd/../Rules.make | cut -d= -f2`
+do_expect() {
+    echo "expect {" >> $3
+    check_status
+    echo "    $1" >> $3
+    check_status
+    echo "}" >> $3
+    check_status
+    echo $2 >> $3
+    check_status
+    echo >> $3
+}
 
-dstdefault=$SDKinstall/targetNFS
 
+echo
+echo "--------------------------------------------------------------------------------"
+echo "This step will set up the U-Boot variables for booting the EVM."
+echo
 
 ipdefault=`ip addr show | grep 'inet ' | grep -v '127.0.0.1' | cut -d/ -f1 | awk '{ print $2 }'`
 platform=`grep PLATFORM= $cwd/../Rules.make | cut -d= -f2`
-prompt=" >"
+
+# Configure prompt for U-Boot 2016.05
+prompt="=>"
+
 
 echo "Autodetected the following ip address of your host, correct it if necessary"
 read -p "[ $ipdefault ] " ip
@@ -58,44 +70,22 @@ if [ -f $cwd/../.targetfs ]; then
     rootpath=`cat $cwd/../.targetfs`
 else
     echo "Where is your target filesystem extracted?"
-    read -p "[ $dstdefault ]" rootpath
+    read -p "[ ${HOME}/targetNFS ]" rootpath
 
     if [ ! -n "$rootpath" ]; then
-        rootpath="$dstdefault"
+        rootpath="${HOME}/targetNFS"
     fi
     echo
 fi
 
-if [ -f $cwd/../.tftproot ]; then
-    tftproot=`cat $cwd/../.tftproot`
-else
-    echo "Where is your TFTP root?"
-    read -p "[ /tftpboot ] " tftproot
+kernelimage="zImage-""$platform"".bin"
+kernelimagesrc=`ls -1 $cwd/../board-support/prebuilt-images/$kernelimage`
+kernelimagedefault=`basename $kernelimagesrc`
 
-    if [ ! -n "$tftproot" ]; then
-        tftproot="/tftpboot"
-    fi
-    echo
-fi
-
-uimage="uImage-""$platform"".bin"
-uimagesrc=`ls -1 $cwd/../board-support/prebuilt-images/$uimage`
-uimagedefault=`basename $uimagesrc`
-
-baseargs="console=ttyS2,115200n8 rw noinitrd"
-videoargs=""
-extendbaseargs=""
-fssdargs="root=/dev/mmcblk0p2 rootfstype=ext3 rootwait"
-fsnfsargs1="root=/dev/nfs nfsroot="
-fsnfsargs2="$ip:"
-fsnfsargs3="$rootpath"
-fsnfsargs4=",nolock,rsize=1024,wsize=1024"
-fsnfsargs=$fsnfsargs1$fsnfsargs2$fsnfsargs3$fsnfsargs4
 
 echo "Select Linux kernel location:"
 echo " 1: TFTP"
 echo " 2: SD card"
-echo " 3: flash"
 echo
 read -p "[ 1 ] " kernel
 
@@ -114,93 +104,81 @@ if [ ! -n "$fs" ]; then
     fs="1"
 fi
 
+
+
 if [ "$kernel" -eq "1" ]; then
     echo
-    echo "Available kernel images in $tftproot:"
-    for file in $tftproot/*; do
-        basefile=`basename $file`
-        echo "    $basefile"
+    echo "Available kernel images in /tftproot:"
+    for file in /tftpboot/*; do
+	basefile=`basename $file`
+	echo "    $basefile"
     done
-    if [ ! -f $tftproot/$uimagedefault ]; then
-        uimagedefault=`ls -1 $tftproot/* | head -1`
-        uimagedefault=`basename $uimagedefault`
-    fi
     echo
     echo "Which kernel image do you want to boot from TFTP?"
-    read -p "[ $uimagedefault ] " uimage
-
-    if [ ! -n "$uimage" ]; then
-        uimage=$uimagedefault
-    fi
+    read -p "[ $kernelimagedefault ] " kernelimage
 
-#    bootcmd="setenv bootcmd 'dhcp;bootm'"
-    bootcmd="setenv bootcmd 'dhcp;setenv serverip $ip;tftpboot;bootm'"
-    serverip="setenv serverip $ip"
-    bootfile="setenv bootfile $uimage"
-
-    if [ "$fs" -eq "1" ]; then
-        bootargs="setenv bootargs $baseargs $extendbaseargs $videoargs $fsnfsargs ip=dhcp"
-        cfg="uimage-tftp_fs-nfs"
-    else
-        bootargs="setenv bootargs $baseargs $extendbaseargs $videoargs $fssdargs ip=none"
-        cfg="uimage-tftp_fs-sd"
-    fi
-else
-    if [ "$kernel" -eq "2" ]; then
-
-        if [ "$fs" -eq "1" ]; then
-            bootargs="setenv bootargs $baseargs $extendbaseargs $videoargs $fsnfsargs ip=dhcp"
-            bootcmd="setenv bootcmd 'mmc rescan 0; fatload mmc 0 0xc0700000 uImage; bootm 0xc0700000'"
-            cfg="uimage-sd_fs-nfs"
-        else
-            bootargs="setenv bootargs $baseargs $extendbaseargs $videoargs $fssdargs ip=none"
-            bootcmd="setenv bootcmd 'mmc rescan 0; fatload mmc 0 0xc0700000 uImage; bootm 0xc0700000'"
-            cfg="uimage-sd_fs-sd"
-        fi
-    else
-        if [ "$fs" -eq "1" ]; then
-            bootargs="setenv bootargs $baseargs $extendbaseargs $videoargs $fsnfsargs ip=dhcp"
-            bootcmd="setenv bootcmd 'sf probe 0; sf read 0xc0700000 0x80000 0x280000; bootm 0xc0700000'"
-            cfg="uimage-flash_fs-nfs"
-        else
-            bootargs="setenv bootargs $baseargs $extendbaseargs $videoargs $fssdargs ip=none"
-            bootcmd="setenv bootcmd 'sf probe 0; sf read 0xc0700000 0x80000 0x280000; bootm 0xc0700000'"
-            cfg="uimage-flash_fs-sd"
-	fi
+    if [ ! -n "$kernelimage" ]; then
+	kernelimage=$kernelimagedefault
     fi
 fi
 
-echo
-echo "Resulting u-boot variable settings:"
-echo
-echo "setenv bootdelay 3"
-echo "setenv baudrate 115200"
-echo $bootargs
-echo $bootcmd
-
-if [ -n "$serverip" ]; then
-    echo "setenv autoload no"
-    echo $serverip
-fi
 
-if [ -n "$bootfile" ]; then
-    echo $bootfile
-fi
-echo "--------------------------------------------------------------------------------"
+echo "timeout 300" > $cwd/setupBoard.minicom
+echo "verbose on" >> $cwd/setupBoard.minicom
 
-do_expect() {
-    echo "expect {" >> $3
-    check_status
-    echo "    $1" >> $3
-    check_status
-    echo "}" >> $3
-    check_status
-    echo $2 >> $3
-    check_status
-    echo >> $3
-}
+do_expect "\"stop autoboot\"" "send \" \"" $cwd/setupBoard.minicom
+do_expect "\"$prompt\"" "send \"env default -f -a\"" $cwd/setupBoard.minicom
+do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom
+do_expect "\"$prompt\"" "send \"reset\"" $cwd/setupBoard.minicom
+do_expect "\"stop autoboot\"" "send \" \"" $cwd/setupBoard.minicom
+
+if [ "$kernel" -eq "1" ]; then
+	if [ "$fs" -eq "1" ]; then
+		#TFTP and NFS Boot
+		do_expect "\"$prompt\"" "send \"setenv serverip $ip\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send setenv rootpath '$rootpath'" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"setenv bootfile $kernelimage\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"setenv ip_method dhcp\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"setenv nfsopts 'nolock,v3,tcp,rsize=4096,wsize=4096'\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"setenv getuenv 'if mmc rescan; then if run loadbootenv; then run importbootenv; fi; fi;'\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send setenv bootcmd 'run findfdt; run getuenv; setenv autoload no;dhcp ;tftp \${loadaddr} $kernelimage; tftp \${fdtaddr} \${fdtfile}; run netargs; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"boot\"" $cwd/setupBoard.minicom
+	else
+		#TFTP and SD Boot
+		do_expect "\"$prompt\"" "send \"setenv serverip $ip\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"setenv bootfile $kernelimage\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"setenv ip_method none\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"setenv getuenv 'if mmc rescan; then if run loadbootenv; then run importbootenv; fi; fi;'\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send setenv bootcmd 'run findfdt; run getuenv; setenv autoload no; dhcp ; tftp \${loadaddr} $kernelimage; tftp \${fdtaddr} \${fdtfile}; run args_mmc; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"boot\"" $cwd/setupBoard.minicom
+	fi
+else
+	if [ "$fs" -eq "1" ]; then
+		#SD and NFS Boot
+		do_expect "\"$prompt\"" "send \"setenv serverip $ip\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send setenv rootpath '$rootpath'" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"setenv bootfile zImage\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"setenv ip_method dhcp\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"setenv nfsopts 'nolock,v3,tcp,rsize=4096,wsize=4096'\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"setenv getuenv 'if mmc rescan; then if run loadbootenv; then run importbootenv; fi; fi;'\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send setenv bootcmd 'setenv autoload no; mmc rescan; run findfdt; run getuenv; setenv devtype mmc; run loadimage; run loadfdt; run netargs; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"boot\"" $cwd/setupBoard.minicom
+	    else
+		#SD and SD boot.
+		do_expect "\"$prompt\"" "send \"setenv ip_method none\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"setenv bootfile zImage\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"setenv getuenv 'if mmc rescan; then if run loadbootenv; then run importbootenv; fi; fi;'\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send setenv bootcmd 'mmc rescan; run findfdt; run getuenv; setenv devtype mmc; run loadimage; run loadfdt; run args_mmc; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"boot\"" $cwd/setupBoard.minicom
+
+	fi
+fi
+echo "! killall -s SIGHUP minicom" >> $cwd/setupBoard.minicom
 
-echo
 echo "--------------------------------------------------------------------------------"
 echo "Would you like to create a minicom script with the above parameters (y/n)?"
 read -p "[ y ] " minicom
@@ -210,104 +188,36 @@ if [ ! -n "$minicom" ]; then
     minicom="y"
 fi
 
-#Use = instead of == for POSIX compliance and dash compatibility
 if [ "$minicom" = "y" ]; then
-    minicomfile=setup_$platform_$cfg.minicom
-    minicomfilepath=$cwd/../$minicomfile
-
-    if [ -f $minicomfilepath ]; then
-        echo "Moving existing $minicomfile to $minicomfile.old"
-        mv $minicomfilepath $minicomfilepath.old
-        check_status
-    fi
-
-    timeout=300
-    echo "timeout $timeout" >> $minicomfilepath
-    echo "verbose on" >> $minicomfilepath
-    echo >> $minicomfilepath
-    do_expect "\"stop autoboot:\"" "send \"\"" $minicomfilepath
-    do_expect "\"$prompt\"" "send \"env default -f -a\"" $minicomfilepath
-    do_expect "\"$prompt\"" "send \"saveenv\"" $minicomfilepath
-    do_expect "\"$prompt\"" "send \"reset\"" $minicomfilepath
-    do_expect "\"stop autoboot:\"" "send \" \"" $minicomfilepath
-
-    do_expect "\"$prompt\"" "send \"setenv bootdelay 4\"" $minicomfilepath
-    do_expect "\"$prompt\"" "send \"setenv baudrate 115200\"" $minicomfilepath
-    do_expect "\"ENTER ...\"" "send \"\"" $minicomfilepath
-    do_expect "\"$prompt\"" "send \"setenv oldbootargs \$\{bootargs\}\"" $minicomfilepath
-
-#   For dash compatibility need to use printf instead of echo
-#   because dash shell will expand the \c by default
-#   do_expect "\"$prompt\"" "send \"setenv bootargs $baseargs \c\"" $minicomfilepath
-    echo "expect {" >> $minicomfilepath
-    check_status
-    echo "    \"$prompt\"" >> $minicomfilepath
-    check_status
-    echo "}" >> $minicomfilepath
-    check_status
-    printf "send \"setenv bootargs $baseargs \c\"\n" >> $minicomfilepath
-    check_status
-
-#   For dash compatibility need to use printf instead of echo
-#   printf "send \"$extendbaseargs \c\"\n" >> $minicomfilepath
-#   printf "send \"$videoargs1 \c\"\n" >> $minicomfilepath
-#   printf "send \"$videoargs2 \c\"\n" >> $minicomfilepath
-#   printf "send \"$videoargs3 \c\"\n" >> $minicomfilepath
-    if [ "$fs" -eq "1" ]; then
-        printf "send \"$fsnfsargs1\c\"\n" >> $minicomfilepath
-        printf "send \"$fsnfsargs2\c\"\n" >> $minicomfilepath
-        printf "send \"$fsnfsargs3\c\"\n" >> $minicomfilepath
-        printf "send \"$fsnfsargs4 \c\"\n" >> $minicomfilepath
-        echo "send \"ip=dhcp\"" >> $minicomfilepath
-    else
-        printf "send \"$fssdargs \c\"\n" >> $minicomfilepath
-        echo "send \"ip=off\"" >> $minicomfilepath
-    fi
-    if [ "$kernel" -eq "1" ]; then
-        do_expect "\"$prompt\"" "send \"setenv autoload no\"" $minicomfilepath
-        do_expect "\"$prompt\"" "send \"setenv oldserverip \$\{serverip\}\"" $minicomfilepath
-        do_expect "\"$prompt\"" "send \"$serverip\"" $minicomfilepath
-#        do_expect "\"$prompt\"" "send \"setenv oldbootfile \$\{bootfile\}\"" $minicomfilepath
-        do_expect "\"$prompt\"" "send \"$bootfile\"" $minicomfilepath
-    fi
-    do_expect "\"$prompt\"" "send \"setenv oldbootcmd \$\{bootcmd\}\"" $minicomfilepath
-    do_expect "\"$prompt\"" "send \"$bootcmd\"" $minicomfilepath
-    do_expect "\"$prompt\"" "send \"saveenv\"" $minicomfilepath
-    do_expect "\"$prompt\"" "! killall -s SIGHUP minicom" $minicomfilepath
 
     echo -n "Successfully wrote "
-    readlink -m $minicomfilepath
-
-    echo
-    echo "Would you like to run the setup script now (y/n)? This requires you to connect"
-    echo "the RS-232 cable between your host and EVM as well as your ethernet cable as"
-    echo "described in the Quick Start Guide. Once answering 'y' on the prompt below"
-    echo "you will have $timeout seconds to connect the board and power cycle it"
-    echo "before the setup times out."
-    echo
-    echo "After successfully executing this script, your EVM will be set up. You will be "
-    echo "able to connect to it by executing 'minicom -w' or if you prefer a windows host"
-    echo "you can set up Tera Term as explained in the Software Developer's Guide."
-    echo "If you connect minicom or Tera Term and power cycle the board Linux will boot."
-    echo
-    read -p "[ y ] " minicomsetup
+    readlink -m $cwd/setupBoard.minicom
+fi
 
-    if [ ! -n "$minicomsetup" ]; then
-        minicomsetup="y"
-    fi
+echo "Would you like to run the setup script now (y/n)? For the general purpose evm "
+echo "you must now connect the RS-232 cable to your evm now. For the Beaglebone (Black)"
+echo "or StarterKit this step should of already have been done. Also connect the ethernet"
+echo "cable as described in the Quick Start Guide."
+echo "**Important**"
+echo "Once answering 'y' on the prompt below you will have 300 seconds to turn on the"
+echo "board or if it was already on reboot the board before the setup times out"
+echo
+echo "After successfully executing this script, your board will be set up. You will be "
+echo "able to connect to it by executing 'minicom -w' or if you prefer a windows host"
+echo "you can set up Tera Term as explained in the Software Developer's Guide."
+echo "If you connect minicom or Tera Term and power cycle the board Linux will boot."
+echo
+read -p "[ y ] " minicomsetup
 
-    savedir=""
-    #Use = instead of == for POSIX compliance and dash compatibility
-    if [ "$minicomsetup" = "y" ]; then
-        #For dash compatibility, do not use pushd & popd
-        savedir=$cwd
-	cd "$cwd/.."
-        check_status
-        sudo minicom -S $minicomfile
-        cd $savedir
-        check_status
-    fi
+if [ ! -n "$minicomsetup" ]; then
+minicomsetup="y"
+fi
 
-    echo "You can manually run minicom in the future with this setup script using: minicom -S $minicomfile"
+if [ "$minicomsetup" = "y" ]; then
+cd $cwd
+sudo minicom -w -S setupBoard.minicom
+cd -
 fi
+
+echo "You can manually run minicom in the future with this setup script using: minicom -S $cwd/setupBoard.minicom"
 echo "--------------------------------------------------------------------------------"
-- 
2.17.1

