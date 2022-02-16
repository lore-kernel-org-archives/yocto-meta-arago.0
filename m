Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.9812.1645004074614134685
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 16 Feb 2022 01:34:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=D112e7gy;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: a-m1@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21G9YXHN047102
	for <meta-arago@lists.yoctoproject.org>; Wed, 16 Feb 2022 03:34:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1645004073;
	bh=6or7hQThWl6Bj3mNcs9jwEqtzDLUcS9GdaXt97gqXc4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=D112e7gy1/xfw5NytXhPn+IZDEzbzLrJXeaa88QwYl7T6NhvBvvtFCf5O8UtDkZ8D
	 5PE+5lj//cbCFM4FtFxIi0T4z5H9lyexAlez3kas791gm30hXa2tr/nWZQDRV/Behy
	 jxqf1NBtTGwVYiARUjdRaWVcuyuxgOHfS2lpJtrU=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21G9YXNi051737
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 16 Feb 2022 03:34:33 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 16
 Feb 2022 03:34:33 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 16 Feb 2022 03:34:32 -0600
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21G9YLmI120916;
	Wed, 16 Feb 2022 03:34:31 -0600
From: "Aparna M" <a-m1@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>
CC: <nikhil.nd@ti.com>, <nsekhar@ti.com>
Subject: [meta-arago][tisdk-setup-scripts][master][PATCH 3/4] setup-uboot-env-am57xx-hs-evm: Add u-boot env setup support for am57xx-hs
Date: Wed, 16 Feb 2022 15:04:13 +0530
Message-ID: <20220216093414.5085-4-a-m1@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220216093414.5085-1-a-m1@ti.com>
References: <20220216093414.5085-1-a-m1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Add u-boot env setup support for am57xx-hs

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>

Signed-off-by: Aparna M <a-m1@ti.com>
---
 setup-uboot-env-am57xx-hs-evm.sh | 242 +++++++++++++++++++++++++++++++
 1 file changed, 242 insertions(+)
 create mode 100644 setup-uboot-env-am57xx-hs-evm.sh

diff --git a/setup-uboot-env-am57xx-hs-evm.sh b/setup-uboot-env-am57xx-hs-evm.sh
new file mode 100644
index 0000000..c3192b5
--- /dev/null
+++ b/setup-uboot-env-am57xx-hs-evm.sh
@@ -0,0 +1,242 @@
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
+fitimage="fitImage-arago-base-tisdk-image-"$platform".itb"
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
+if [ "$fit" -eq "1" ]; then
+	do_expect "\"$prompt\"" "send setenv serverip $ip" $cwd/setupBoard.minicom
+	do_expect "\"$prompt\"" "send setenv fit_bootfile $fitimage" $cwd/setupBoard.minicom
+        do_expect "\"$prompt\"" "send setenv bootcmd 'run findfdt; run init_console; run envboot; setenv autoload no; dhcp; tftp \${fit_loadaddr} \${fit_bootfile}; run args_fit; bootm \${fit_loadaddr}#\${fdtfile}'" $cwd/setupBoard.minicom
+	do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom
+fi
+# Default U-Boot environment will boot our default SD card image.
+
+do_expect "\"$prompt\"" "send \"boot\"" $cwd/setupBoard.minicom
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

