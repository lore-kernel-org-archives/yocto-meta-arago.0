Return-Path: <jake@udc0866934>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 07B9052A79
	for <meta-arago@arago-project.org>;
	Thu, 30 Aug 2018 13:51:43 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7UDpYH4028250
	for <meta-arago@arago-project.org>; Thu, 30 Aug 2018 08:51:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1535637094;
	bh=TkxKSNUGCFdJ2o8CiZ2MUgZ/+MOI266dY41E+Nw1G10=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=PXVV9jSWg/nPxj8CVs49PGDnlLdS4qa+B2dlxQ1LZIUqopkBpcqCfSC5CJcztWYfw
	7mkxzRJH6nTtBYKHL36LktGfw05L5bqStbKB/RSQydM9F9xsN5Bn4NeLTO0Mm4BH8F
	ixjRbvdMvZ1SGU9meghOcYJbS5Uk0297Sp+QbCRk=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7UDpY2c004469
	for <meta-arago@arago-project.org>; Thu, 30 Aug 2018 08:51:34 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 30 Aug 2018 08:51:34 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 30 Aug 2018 08:51:34 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7UDpY1Y004014;
	Thu, 30 Aug 2018 08:51:34 -0500
Received: from jake by udc0866934 with local (Exim 4.82)
	(envelope-from <jake@udc0866934>)
	id 1fvNME-0007ty-6x; Thu, 30 Aug 2018 09:51:34 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 30 Aug 2018 09:51:31 -0400
Message-ID: <1535637091-30335-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1535637091-30335-1-git-send-email-j-stiffler@ti.com>
References: <1535637091-30335-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [tisdk-setup-scripts][PATCH 2/2] setup-uboot-env-am65x: add U-Boot setup for am65x
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
X-List-Received-Date: Thu, 30 Aug 2018 13:51:45 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 setup-uboot-env-am65x.sh | 313 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 313 insertions(+)
 create mode 100644 setup-uboot-env-am65x.sh

diff --git a/setup-uboot-env-am65x.sh b/setup-uboot-env-am65x.sh
new file mode 100644
index 0000000..8d70880
--- /dev/null
+++ b/setup-uboot-env-am65x.sh
@@ -0,0 +1,313 @@
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
+kernelimage="Image-""$platform"".bin"
+kernelimagesrc=`ls -1 $cwd/../board-support/prebuilt-images/$kernelimage`
+kernelimagedefault=`basename $kernelimagesrc`
+
+board_name=""
+while [ -z "$board_name" ]
+do
+    echo "Do you have the AM65x EVM or IDK?"
+    echo " 1: UNKOWN"
+    echo " 2: EVM"
+    echo " 3: IDK"
+    echo
+    read -p "[ 1 ] " board
+
+    if [ ! -n "$board" ]; then
+        board="1"
+    fi
+
+    case $board in
+        "1") board_name="am65x";;
+        "2") board_name="am65x_evm";;
+        "3") board_name="am65x_idk";;
+        *) echo "Invalid reponse. Please enter 1-3."; echo;;
+    esac
+done
+
+echo "Select Linux kernel location:"
+echo " 1: TFTP"
+echo " 2: SD card"
+echo
+read -p "[ 1 ] " kernel
+
+if [ ! -n "$kernel" ]; then
+    kernel="1"
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
+if [ "$kernel" -eq "1" ]; then
+    echo
+    echo "Available kernel images in /tftproot:"
+    for file in /tftpboot/*; do
+	basefile=`basename $file`
+	echo "    $basefile"
+    done
+    echo
+    echo "Which kernel image do you want to boot from TFTP?"
+    read -p "[ $kernelimagedefault ] " kernelimage
+
+    if [ ! -n "$kernelimage" ]; then
+	kernelimage=$kernelimagedefault
+    fi
+else
+    kernelimage=Image
+fi
+
+board="unknown"
+check_for_board() {
+    lsusb -vv -d 0403:6011 > /dev/null 2>&1
+
+    if [ "$?" = "0" ]
+    then
+        board="am65x"
+    fi
+}
+
+echo "timeout 300" > $cwd/setupBoard.minicom
+echo "verbose on" >> $cwd/setupBoard.minicom
+do_expect "\"stop autoboot:\"" "send \" \"" $cwd/setupBoard.minicom
+
+# SW reboot not currently supported
+#do_expect "\"$prompt\"" "send \"env default -f -a\"" $cwd/setupBoard.minicom
+#do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom
+#do_expect "\"$prompt\"" "send \"reset\"" $cwd/setupBoard.minicom
+#do_expect "\"stop autoboot:\"" "send \" \"" $cwd/setupBoard.minicom
+
+# Configurable settings
+do_expect "\"$prompt\"" "send \"setenv serverip $ip\"" $cwd/setupBoard.minicom
+do_expect "\"$prompt\"" "send \"setenv nfs_root $rootpath\"" $cwd/setupBoard.minicom
+do_expect "\"$prompt\"" "send \"setenv board_name $board_name\"" $cwd/setupBoard.minicom
+do_expect "\"$prompt\"" "send \"setenv name_kern $kernelimage\"" $cwd/setupBoard.minicom
+
+# General macros
+do_expect "\"$prompt\"" "send \"setenv bootcmd 'run findfdt; run envboot; run setup_\${kern_boot}; run init_\${rootfs_boot}; run get_kern_\${kern_boot}; run get_fdt_\${kern_boot}; run get_overlay_\${kern_boot}; run run_kern'\"" $cwd/setupBoard.minicom
+
+do_expect "\"$prompt\"" "send \"setenv init_net 'run args_all args_net; setenv autoload no; dhcp'\"" $cwd/setupBoard.minicom
+do_expect "\"$prompt\"" "send \"setenv args_net 'setenv bootargs \${optargs} rootfstype=nfs root=/dev/nfs rw nfsroot=\${serverip}:\${nfs_root},\${nfs_options} ip=dhcp'\"" $cwd/setupBoard.minicom
+do_expect "\"$prompt\"" "send \"setenv get_kern_net 'tftp \${loadaddr} \${name_kern}'\"" $cwd/setupBoard.minicom
+do_expect "\"$prompt\"" "send \"setenv get_fdt_net 'tftp \${fdtaddr} \${name_fdt}'\"" $cwd/setupBoard.minicom
+do_expect "\"$prompt\"" "send \"setenv get_overlay_net 'fdt address \${fdtaddr};fdt resize 0x100000;for overlay in \${overlay_files};do;tftp \${overlayaddr} \${overlay};fdt apply \${overlayaddr}; done'\"" $cwd/setupBoard.minicom
+
+do_expect "\"$prompt\"" "send \"setenv nfs_options 'nolock,v3,tcp,rsize=4096,wsize=4096'\"" $cwd/setupBoard.minicom
+do_expect "\"$prompt\"" "send \"setenv setup_mmc ''\"" $cwd/setupBoard.minicom
+do_expect "\"$prompt\"" "send \"setenv setup_net 'setenv autoload no; dhcp'\"" $cwd/setupBoard.minicom
+
+
+
+if [ "$kernel" -eq "1" ]; then
+	do_expect "\"$prompt\"" "send \"setenv kern_boot net\"" $cwd/setupBoard.minicom
+else
+	do_expect "\"$prompt\"" "send \"setenv kern_boot mmc\"" $cwd/setupBoard.minicom
+fi
+
+if [ "$fs" -eq "1" ]; then
+	do_expect "\"$prompt\"" "send \"setenv rootfs_boot net\"" $cwd/setupBoard.minicom
+else
+	do_expect "\"$prompt\"" "send \"setenv rootfs_boot mmc\"" $cwd/setupBoard.minicom
+fi
+do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom
+do_expect "\"$prompt\"" "send \"boot\"" $cwd/setupBoard.minicom
+#echo "! killall -s SIGHUP minicom" >> $cwd/setupBoard.minicom
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
+            serial_number=`lsusb -v -d 0403:6011 | grep iSerial | awk '{ print $NF }'`
+            usb_id=`dmesg | grep "SerialNumber: $serial_number" | tail -1 | awk '{ print $3 }'`
+            port=`dmesg | grep FTDI | grep "tty" | grep "$usb_id" | tail -4 | head -1 | grep "attached" |  awk '{ print $NF }'`
+            while [ -z "$port" ] && [ "$loopCount" -ne "10" ]
+            do
+                #count to 10 and timeout if no connection is found
+                loopCount=$((loopCount+1))
+
+                sleep 1
+                serial_number=`lsusb -v -d 0403:6011 | grep iSerial | awk '{ print $NF }'`
+                usb_id=`dmesg | grep "SerialNumber: $sn" | tail -1 | awk '{ print $3 }'`
+                port=`dmesg | grep FTDI | grep "tty" | grep "usb $usb_id" | tail -4 | head -1 | grep "attached" |  awk '{ print $NF }'`
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
1.9.1


