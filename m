Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web09.10448.1645008794460859700
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 16 Feb 2022 02:53:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=E9bH9vWW;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: a-m1@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21GArD7g008779
	for <meta-arago@lists.yoctoproject.org>; Wed, 16 Feb 2022 04:53:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1645008793;
	bh=yMtOh7W+dotDqrkTfp06eqAej3NaYP253hUxLI+Uv6E=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=E9bH9vWW0dl6ExIB8SAU8LljcQpdJP4CXETzjBKmRFmCPuT+7xkOG/lbkwitiZGVF
	 sjp/A8NVD1434ZwpDyB3aYZOne6+LXcgGMqMr82HDWrGpk3+Vny5JLVjqKc+lAifTF
	 qHw2iwQk4AqSU5+I2GKnUIv8WYYKhfWQV7CQnWEE=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21GArD5j096319
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 16 Feb 2022 04:53:13 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 16
 Feb 2022 04:53:13 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 16 Feb 2022 04:53:13 -0600
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21GAr5Hw000822;
	Wed, 16 Feb 2022 04:53:11 -0600
From: "Aparna M" <a-m1@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>
CC: <nikhil.nd@ti.com>, <nsekhar@ti.com>
Subject: [meta-arago][tisdk-setup-scripts][master][PATCH v2 2/4] setup-uboot-env-am57xx-hs-evm: Add u-boot env setup support for am57xx-hs
Date: Wed, 16 Feb 2022 16:22:59 +0530
Message-ID: <20220216105301.13863-3-a-m1@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220216105301.13863-1-a-m1@ti.com>
References: <20220216105301.13863-1-a-m1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Add u-boot env setup support for am57xx-hs

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>

Signed-off-by: Aparna M <a-m1@ti.com>
---
 setup-uboot-env-am57xx-hs-evm.sh | 303 +++++++++++++++++++++++++++++++
 1 file changed, 303 insertions(+)
 create mode 100644 setup-uboot-env-am57xx-hs-evm.sh

diff --git a/setup-uboot-env-am57xx-hs-evm.sh b/setup-uboot-env-am57xx-hs-evm.sh
new file mode 100644
index 0000000..f227d37
--- /dev/null
+++ b/setup-uboot-env-am57xx-hs-evm.sh
@@ -0,0 +1,303 @@
+#!/bin/sh
+
+# This distribution contains contributions or derivatives under copyright
+# as follows:
+#
+# Copyright (c) 2010, Texas Instruments Incorporated
+# All rights reserved.
+#
+# Redistribution and use in source and binary forms, with or without
+# modification, are permitted provided that the following conditions
+# are met:
+# - Redistributions of source code must retain the above copyright notice,
+#   this list of conditions and the following disclaimer.
+# - Redistributions in binary form must reproduce the above copyright
+#   notice, this list of conditions and the following disclaimer in the
+#   documentation and/or other materials provided with the distribution.
+# - Neither the name of Texas Instruments nor the names of its
+#   contributors may be used to endorse or promote products derived
+#   from this software without specific prior written permission.
+#
+# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
+# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
+# TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
+# PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
+# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
+# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
+# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
+# PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
+# LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
+# OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
+# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+
+cwd=`dirname $0`
+. $cwd/common.sh
+
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
+
+
+echo
+echo "--------------------------------------------------------------------------------"
+echo "This step will set up the u-boot variables for booting the EVM."
+echo "--------------------------------------------------------------------------------"
+
+ipdefault=`ifconfig | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d: -f2 | awk '{ print $1 }'`
+platform=`grep PLATFORM= $cwd/../Rules.make | cut -d= -f2`
+
+# Configure prompt for U-Boot 2016.05
+prompt="=>"
+
+
+echo "Autodetected the following ip address of your host, correct it if necessary"
+read -p "[ $ipdefault ] " ip
+echo
+
+if [ ! -n "$ip" ]; then
+    ip=$ipdefault
+fi
+
+if [ -f $cwd/../.targetfs ]; then
+    rootpath=`cat $cwd/../.targetfs`
+else
+    echo "Where is your target filesystem extracted?"
+    read -p "[ ${HOME}/targetNFS ]" rootpath
+
+    if [ ! -n "$rootpath" ]; then
+        rootpath="${HOME}/targetNFS"
+    fi
+    echo
+fi
+
+fitimage="fitImage-linux.bin-"$platform".itb"
+fitimagesrc=`ls -1 $cwd/../board-support/prebuilt-images/$fitimage`
+fitimagedefault=`basename $fitimagesrc`
+
+
+echo "Select fit image location:"
+echo " 1: TFTP"
+echo " 2: SD card"
+echo
+read -p "[ 1 ] " fit
+
+if [ ! -n "$fitimage" ]; then
+    fit="1"
+fi
+
+echo
+echo "Select root file system location:"
+echo " 1: NFS"
+echo " 2: SD card"
+echo
+read -p "[ 1 ] " fs
+
+if [ ! -n "$fs" ]; then
+    fs="1"
+fi
+
+
+
+if [ "$fit" -eq "1" ]; then
+    echo
+    echo "Available fit images in /tftproot:"
+    for file in /tftpboot/*.itb; do
+	basefile=`basename $file`
+	echo "    $basefile"
+    done
+    echo
+    echo "Which fit image do you want to boot from TFTP?"
+    read -p "[ $fitimagedefault ] " fitimage
+
+    if [ ! -n "$fitimage" ]; then
+	fitimage=$fitimagedefault
+    fi
+fi
+
+board="unknown"
+check_for_board() {
+    lsusb -vv -d 0403:6001 > /dev/null 2>&1
+
+    if [ "$?" = "0" ]
+    then
+        board="x15"
+    fi
+
+    lsusb -vv -d 0403:6010 > /dev/null 2>&1
+
+    if [ "$?" = "0" ]
+    then
+        board="am5-idk"
+    fi
+}
+
+echo "timeout 300" > $cwd/setupBoard.minicom
+echo "verbose on" >> $cwd/setupBoard.minicom
+do_expect "\"stop autoboot:\"" "send \" \"" $cwd/setupBoard.minicom
+do_expect "\"$prompt\"" "send \"env default -f -a\"" $cwd/setupBoard.minicom
+do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom
+do_expect "\"$prompt\"" "send \"reset\"" $cwd/setupBoard.minicom
+do_expect "\"stop autoboot:\"" "send \" \"" $cwd/setupBoard.minicom
+
+do_expect "\"$prompt\"" "send \"run update_to_fit\"" $cwd/setupBoard.minicom
+if [ "$fit" -eq "1" ]; then
+	if [ "$fs" -eq "1" ]; then
+		#TFTP and NFS Boot
+		do_expect "\"$prompt\"" "send \"setenv serverip $ip\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send setenv rootpath '$rootpath'" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"setenv fit_bootfile $fitimage\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"setenv ip_method dhcp\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"setenv nfsopts 'nolock,v3,tcp,rsize=4096,wsize=4096'\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"setenv getuenv 'mmc dev \${mmcdev}; if mmc rescan; then if run loadbootenv; then run importbootenv; fi; fi;'\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send setenv bootcmd 'run findfdt; run getuenv; setenv autoload no;dhcp ;tftp \${fit_loadaddr} $fitimage; run netargs; bootm \${fit_loadaddr}#\${fdtfile}'" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"boot\"" $cwd/setupBoard.minicom
+	else
+		#TFTP and SD Boot
+		do_expect "\"$prompt\"" "send \"setenv serverip $ip\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"setenv fit_bootfile $fitimage\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"setenv ip_method none\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"setenv getuenv 'mmc dev \${mmcdev}; if mmc rescan; then if run loadbootenv; then run importbootenv; fi; fi;'\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send setenv bootcmd 'run findfdt; run getuenv; setenv autoload no; dhcp ; tftp \${fit_loadaddr} $fitimage; run args_mmc; bootm \${fit_loadaddr}#\${fdtfile}'" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"boot\"" $cwd/setupBoard.minicom
+	fi
+else
+	if [ "$fs" -eq "1" ]; then
+		#SD and NFS Boot
+		do_expect "\"$prompt\"" "send \"setenv serverip $ip\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send setenv rootpath '$rootpath'" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"setenv fit_bootfile fitImage\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"setenv ip_method dhcp\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"setenv nfsopts 'nolock,v3,tcp,rsize=4096,wsize=4096'\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"setenv getuenv 'mmc dev \${mmcdev}; if mmc rescan; then if run loadbootenv; then run importbootenv; fi; fi;'\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send setenv bootcmd 'setenv autoload no; mmc rescan; run findfdt; run getuenv; setenv devtype mmc; run loadimage; run netargs; bootm \${fit_loadaddr}#\${fdtfile}'" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"boot\"" $cwd/setupBoard.minicom
+	    else
+		#SD and SD boot.
+		do_expect "\"$prompt\"" "send \"setenv ip_method none\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"setenv fit_bootfile fitImage\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"setenv getuenv 'mmc dev \${mmcdev}; if mmc rescan; then if run loadbootenv; then run importbootenv; fi; fi;'\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send setenv bootcmd 'mmc rescan; run findfdt; run getuenv; setenv devtype mmc; run loadimage; run args_mmc; bootm \${fit_loadaddr}#\${fdtfile}'" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send \"boot\"" $cwd/setupBoard.minicom
+
+	fi
+fi
+echo "! killall -s SIGHUP minicom" >> $cwd/setupBoard.minicom
+
+echo "--------------------------------------------------------------------------------"
+echo "Would you like to create a minicom script with the above parameters (y/n)?"
+read -p "[ y ] " minicom
+echo
+
+if [ ! -n "$minicom" ]; then
+    minicom="y"
+fi
+
+if [ "$minicom" = "y" ]; then
+
+    echo -n "Successfully wrote "
+    readlink -m $cwd/setupBoard.minicom
+
+    while [ yes ]
+    do
+        check_for_board
+
+        if [ "$board" != "unknown" ]
+        then
+            break
+        else
+            echo ""
+            echo "Board could not be detected. Please connect the board to the PC."
+            read -p "Press any key to try checking again." temp
+        fi
+    done
+
+    if [ "$board" != "unknown" ]
+    then
+        ftdiInstalled=`lsmod | grep ftdi_sio`
+        if [ -z "$ftdiInstalled" ]
+        then
+            sudo modprobe -q ftdi_sio
+        fi
+
+        while [ yes ]
+        do
+            echo ""
+            echo -n "Detecting connection to board... "
+            loopCount=0
+            port=`dmesg | grep FTDI | grep "tty" | tail -1 | grep "attached" |  awk '{ print $NF }'`
+            while [ -z "$port" ] && [ "$loopCount" -ne "10" ]
+            do
+                #count to 10 and timeout if no connection is found
+                loopCount=$((loopCount+1))
+
+                sleep 1
+                port=`dmesg  | grep FTDI | grep "tty" | tail -1 | grep "attached" |  awk '{ print $NF }'`
+            done
+
+            #check to see if we actually found a port
+            if [ -n "$port" ]; then
+                echo "/dev/$port"
+                break;
+            fi
+
+            #if we didn't find a port and reached the timeout limit then ask to reconnect
+            if [ -z "$port" ] && [ "$loopCount" = "10" ]; then
+                echo ""
+                echo "Unable to detect which port the board is connected to."
+                echo "Please reconnect your board."
+                echo "Press 'y' to attempt to detect your board again or press 'n' to continue..."
+                read -p "(y/n)" retryBoardDetection
+            fi
+
+            #if they choose not to retry, ask user to reboot manually and exit
+            if [ "$retryBoardDetection" = "n" ]; then
+                echo ""
+                echo "Please reboot your board manually and connect using minicom."
+                exit;
+            fi
+        done
+
+        sed -i -e "s|^pu port.*$|pu port             /dev/$port|g" ${HOME}/.minirc.dfl
+    fi
+
+    echo
+    echo "--------------------------------------------------------------------------------"
+    echo "Would you like to run the setup script now (y/n)?"
+    echo
+    echo "Please connect the ethernet cable as described in the Quick Start Guide."
+    echo "Once answering 'y' on the prompt below, you will have 300 seconds to connect"
+    echo "the board and power cycle it before the setup times out"
+    echo
+    echo "After successfully executing this script, your EVM will be set up. You will be "
+    echo "able to connect to it by executing 'minicom -w' or if you prefer a windows host"
+    echo "you can set up Tera Term as explained in the Software Developer's Guide."
+    echo "If you connect minicom or Tera Term and power cycle the board Linux will boot."
+    echo
+    read -p "[ y ] " minicomsetup
+
+    if [ ! -n "$minicomsetup" ]; then
+       minicomsetup="y"
+    fi
+
+    if [ "$minicomsetup" = "y" ]; then
+      cd $cwd
+      sudo minicom -w -S setupBoard.minicom
+      cd -
+    fi
+
+    echo "You can manually run minicom in the future with this setup script using: minicom -S $cwd/setupBoard.minicom"
+    echo "--------------------------------------------------------------------------------"
+
+fi
-- 
2.17.1

