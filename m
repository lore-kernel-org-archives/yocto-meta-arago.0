Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.9813.1645004077371220167
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 16 Feb 2022 01:34:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=FuJYdyFz;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: a-m1@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21G9Ya3m119457
	for <meta-arago@lists.yoctoproject.org>; Wed, 16 Feb 2022 03:34:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1645004076;
	bh=7uPz7YLRVnK3OZIapNQgh8vlTJX0m7r4I5Fov0uZcY4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=FuJYdyFzofaAfwLFiyVKP9WmZ2o644eAxiqsVZHs6k/1wziltGwPouMhql4u07iXN
	 lXEV5Nma/2Lf06UoU+P9gdH27kdapa92a6mG0k0juaWAYvOKRMQaq9Ru+4z90/7UHu
	 cyDVPdYG+DILZTe+F1hKF/+12Z3ZutnFZ9KWlRGU=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21G9Yak7051809
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 16 Feb 2022 03:34:36 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 16
 Feb 2022 03:34:36 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 16 Feb 2022 03:34:36 -0600
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21G9YLmJ120916;
	Wed, 16 Feb 2022 03:34:35 -0600
From: "Aparna M" <a-m1@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>
CC: <nikhil.nd@ti.com>, <nsekhar@ti.com>
Subject: [meta-arago][tisdk-setup-scripts][master][PATCH 4/4] setup-uboot-env-keystone-hs: Add u-boot env setup support for keystone hs devices
Date: Wed, 16 Feb 2022 15:04:14 +0530
Message-ID: <20220216093414.5085-5-a-m1@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220216093414.5085-1-a-m1@ti.com>
References: <20220216093414.5085-1-a-m1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Add u-boot env setup support for keystone hs devices.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>

Signed-off-by: Aparna M <a-m1@ti.com>
---
 setup-uboot-env-keystone-hs.sh | 456 +++++++++++++++++++++++++++++++++
 1 file changed, 456 insertions(+)
 create mode 100755 setup-uboot-env-keystone-hs.sh

diff --git a/setup-uboot-env-keystone-hs.sh b/setup-uboot-env-keystone-hs.sh
new file mode 100755
index 0000000..9eff80f
--- /dev/null
+++ b/setup-uboot-env-keystone-hs.sh
@@ -0,0 +1,456 @@
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
+    local expect_str="$1"
+    local command="$2"
+
+    shift; shift
+
+    while [ $# -gt 0 ]
+    do
+        echo "expect {" >> "$1"
+        check_status
+        echo "    $expect_str" >> "$1"
+        check_status
+        echo "    timeout 600 goto end" >> "$1"
+        echo "}" >> "$1"
+        check_status
+        echo $command >> "$1"
+        check_status
+        echo >> "$1"
+
+        shift
+    done
+}
+
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
+copy_to_tftproot() {
+    files="$1"
+    for file in $files
+    do
+	if [ -f $tftproot/$file ]; then
+	    echo
+	    echo "$tftproot/$file already exists. The existing installed file can be renamed and saved under the new name."
+	    prompt_feedback "(o) overwrite (s) skip copy" exists o
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
+# Create the BMC scripts. These require no configuration from the user.
+create_bmc_scripts() {
+    ( echo "timeout 300"; echo; ) > $cwd/bmcUartBoot.minicom
+    ( echo "timeout 300"; echo; ) > $cwd/bmcNandBoot.minicom
+
+    # Allow time for XMODEM transfer to begin
+    echo "! sleep 1" >> $cwd/bmcUartBoot.minicom
+
+    ( echo "send \" \""; echo; ) >> $cwd/bmcUartBoot.minicom
+    ( echo "send \" \""; echo; ) >> $cwd/bmcNandBoot.minicom
+
+    do_expect "\"BMC>\"" "send \"bootmode #4\"" $cwd/bmcUartBoot.minicom
+    do_expect "\"BMC>\"" "send \"bootmode #0\"" $cwd/bmcNandBoot.minicom
+
+    do_expect "\"BMC>\"" "send \"reboot\"" $cwd/bmcUartBoot.minicom $cwd/bmcNandBoot.minicom
+
+    echo "end:" >> $cwd/bmcUartBoot.minicom
+    echo "end:" >> $cwd/bmcNandBoot.minicom
+
+    # bmcUartboot.minicom will be killed by the updateUboot.minicom script
+    echo "! killall -s SIGHUP minicom" >> $cwd/bmcNandBoot.minicom
+}
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
+prompt_feedback "Autodetected the following ip address of your host, correct it if necessary" ip "$(echo $ipdefault | sed -e 's| .*||')" $ipdefault
+
+if [ -f $cwd/../.tftproot ]; then
+    tftproot=`cat $cwd/../.tftproot`
+else
+    prompt_feedback "Where is your tftp root directory?" tftproot "/tftpboot"
+fi
+
+if [ -f $cwd/../.targetfs ]; then
+    rootpath=`cat $cwd/../.targetfs`
+else
+    prompt_feedback "Where is your target filesystem extracted?" rootpath "${HOME}/targetNFS"
+fi
+
+
+fitimage="fitImage-arago-base-tisdk-image-"$platform".itb"
+fitimagesrc=`ls -1 $cwd/../board-support/prebuilt-images/$fitimage`
+fitimagedefault=`basename $fitimagesrc`
+
+ubootimage="u-boot_HS_MLO-${platform}"
+ubootimagesrc=`readlink -m $cwd/../board-support/prebuilt-images/$ubootimage`
+
+echo "--------------------------------------------------------------------------------"
+prompt_feedback "Would you like to update U-boot on the board?" ubootupdate y y n
+
+echo
+echo "Available fit images in /tftproot:"
+for file in /tftpboot/*.itb; do
+    basefile=`basename $file`
+    echo "    $basefile"
+done
+echo
+echo "Which fit image do you want to boot from TFTP?"
+read -p "[ $fitimagedefault ] " fitimage
+
+if [ ! -n "$fitimage" ]; then
+    fitimage=$fitimagedefault
+fi
+
+board="unknown"
+check_for_board() {
+    case $platform in
+        "k2hk-evm")
+            lsusb -vv -d 0403:6010 > /dev/null 2>&1
+
+            if [ "$?" = "0" ]
+            then
+                board="k2evm"
+                board_vendor="0403"
+                board_product="6010"
+                num_port="2"
+                uart_port_idx="1"
+                bmc_port_idx="2"
+            fi
+        ;;
+
+        "k2l-evm"|"k2e-evm")
+            lsusb -vv -d 10c4:ea70 > /dev/null 2>&1
+
+            if [ "$?" = "0" ]
+            then
+                board="k2evm"
+                board_vendor="10c4"
+                board_product="ea70"
+                num_port="2"
+                uart_port_idx="1"
+                bmc_port_idx="2"
+            fi
+        ;;
+    esac
+}
+
+echo "timeout 1800" > $cwd/setupBoard.minicom
+echo "timeout 1800" > $cwd/updateBoard.minicom
+echo "verbose on" >> $cwd/setupBoard.minicom
+echo "verbose on" >> $cwd/updateBoard.minicom
+
+do_expect "\"stop autoboot:\"" "send \" \"" $cwd/setupBoard.minicom $cwd/updateBoard.minicom
+
+# If U-Boot was not updated, refuse to proceed.
+cat >> $cwd/setupBoard.minicom << __EOF__
+expect {
+    "$prompt"
+    "# " goto uboot_update_required
+    timeout 60 goto end
+}
+send " "
+__EOF__
+
+# Reset to the default environment
+do_expect "\"$prompt\"" "send \"env default -f -a\"" $cwd/setupBoard.minicom $cwd/updateBoard.minicom
+
+do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom
+
+# Reset incase any variables are set when u-boot initializes
+do_expect "\"$prompt\"" "send \"reset\"" $cwd/setupBoard.minicom
+do_expect "\"stop autoboot:\"" "send \" \"" $cwd/setupBoard.minicom
+
+# Set up the U-Boot environment
+do_expect "\"$prompt\"" "send \"setenv serverip $ip\"" $cwd/setupBoard.minicom $cwd/updateBoard.minicom
+do_expect "\"$prompt\"" "send \"setenv tftp_root '$tftproot'\"" $cwd/setupBoard.minicom $cwd/updateBoard.minicom
+do_expect "\"$prompt\"" "send \"setenv name_uboot $ubootimage\"" $cwd/setupBoard.minicom $cwd/updateBoard.minicom
+do_expect "\"$prompt\"" "send \"setenv fit_bootfile $fitimage\"" $cwd/setupBoard.minicom $cwd/updateBoard.minicom
+do_expect "\"$prompt\"" "send \"setenv fit_loadaddr 0xc0000000\"" $cwd/setupBoard.minicom $cwd/updateBoard.minicom
+do_expect "\"$prompt\"" "send \"setenv addr_mon 0xc08000\"" $cwd/setupBoard.minicom $cwd/updateBoard.minicom
+do_expect "\"$prompt\"" "send \"setenv addr_mon_mkimg 0xc07ffc0\"" $cwd/setupBoard.minicom $cwd/updateBoard.minicom
+do_expect "\"$prompt\"" "send \"setenv mon_size 0x1210\"" $cwd/setupBoard.minicom $cwd/updateBoard.minicom
+do_expect "\"$prompt\"" "send \"setenv addr_mon 0xc08000\"" $cwd/setupBoard.minicom $cwd/updateBoard.minicom
+do_expect "\"$prompt\"" "send \"setenv sec_bm_install 'go \${addr_mon}4 0xc084000 \${mon_size}; mon_install \${addr_mon_mkimg}'\"" $cwd/setupBoard.minicom $cwd/updateBoard.minicom
+do_expect "\"$prompt\"" "send \"setenv loadimage 'dhcp \${fit_loadaddr} \${tftp_root}/\${fit_bootfile}'\"" $cwd/setupBoard.minicom $cwd/updateBoard.minicom
+do_expect "\"$prompt\"" "send \"setenv bootcmd 'run sec_bm_install; run loadimage; bootm \${fit_loadaddr}#\${name_fdt}'\"" $cwd/setupBoard.minicom $cwd/updateBoard.minicom
+
+
+# Create command to fetch and flash u-boot and ubi
+#
+# TBD: Save minicom output to a log and use these strings to determine the
+#      update status on the host machine.
+#
+update_uboot_status="U-Boot update:"
+update_ubi_status="UBI update:"
+
+do_expect "\"$prompt\"" "send \"setenv update_uboot 'if run get_uboot_net burn_uboot_nand; then echo $update_uboot_status SUCCESS; else echo $update_uboot_status FAILED; fi'\"" $cwd/setupBoard.minicom $cwd/updateBoard.minicom
+
+do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom $cwd/updateBoard.minicom
+do_expect "\"$prompt\"" "send \"printenv\"" $cwd/setupBoard.minicom $cwd/updateBoard.minicom
+
+if [ "$ubootupdate" = "y" ]; then
+    do_expect "\"$prompt\"" "send \"run sec_bm_install\"" $cwd/updateBoard.minicom
+    do_expect "\"$prompt\"" "send \"run update_uboot\"" $cwd/updateBoard.minicom
+fi
+
+do_expect "\"$prompt\"" "send \" \"" $cwd/updateBoard.minicom
+do_expect "\"$prompt\"" "send \"boot\"" $cwd/setupBoard.minicom
+
+cat >> $cwd/setupBoard.minicom << __EOF__
+goto end
+uboot_update_required:
+send echo; echo "*** U-boot is require to be updated before proceeding!"; echo "*** The automatic upgrade of this version of U-boot is currently disabled."; echo "*** Please follow the wiki instructions to manually upgrade U-boot."; echo
+end:
+__EOF__
+
+cat >> $cwd/updateBoard.minicom << __EOF__
+goto end
+uboot_update_required:
+send echo; echo "*** U-boot is require to be updated before proceeding!"; echo "*** The automatic upgrade of this version of U-boot is currently disabled."; echo "*** Please follow the wiki instructions to manually upgrade U-boot."; echo
+end:
+__EOF__
+echo "! killall -s SIGHUP minicom" >> $cwd/updateBoard.minicom
+
+echo "--------------------------------------------------------------------------------"
+prompt_feedback "Would you like to create a minicom script with the above parameters?" minicom y y n
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
+        if [ "$board" = "k2evm" ]
+        then
+            break
+        else
+            echo ""
+            prompt_feedback "Board could not be detected. Please connect the board to the PC." temp "Press any key to try checking again"
+
+            # Set to default board to allow user to specify the correct ports.
+            board=k2evm
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
+            echo "--------------------------------------------------------------------------------"
+            echo
+            echo -n "Detecting connection to board... "
+            loopCount=0
+            usb_id=`dmesg | grep "idVendor=${board_vendor}" | grep "idProduct=${board_product}" | tail -1 | sed -e 's|.*usb \(.*\):.*|\1|'`
+            uart_port=`dmesg | grep "usb $usb_id" | grep "tty" | tail -${num_port} | head -${uart_port_idx} | tail -1 | grep "attached" |  awk '{ print $NF }'`
+            bmc_port=`dmesg | grep "usb $usb_id" | grep "tty" | tail -${num_port} | head -${bmc_port_idx} | tail -1 | grep "attached" |  awk '{ print $NF }'`
+            while [ -z "$uart_port" ] && [ "$loopCount" -ne "10" ]
+            do
+                #count to 10 and timeout if no connection is found
+                loopCount=$((loopCount+1))
+
+                sleep 1
+                usb_id=`dmesg | grep "idVendor=${board_vendor}" | grep "idProduct=${board_product}" | tail -1 | sed -e 's|.*usb \(.*\):.*|\1|'`
+                uart_port=`dmesg | grep "usb $usb_id" | grep "tty" | tail -${num_port} | head -${uart_port_idx} | tail -1 | grep "attached" |  awk '{ print $NF }'`
+                bmc_port=`dmesg | grep "usb $usb_id" | grep "tty" | tail -${num_port} | head -${bmc_port_idx} | tail -1 | grep "attached" |  awk '{ print $NF }'`
+            done
+
+            #check to see if we actually found a port
+            if [ -n "$uart_port" ]; then
+                echo "${platform} (UART) autodetected at /dev/$uart_port"
+                echo
+                prompt_feedback "Please verify that this is correct or manually enter the correct port:" dev_uart_port "/dev/$uart_port"
+
+                echo "${platform} (BMC) autodetected at /dev/$bmc_port"
+                echo
+                prompt_feedback "Please verify that this is correct or manually enter the correct port:" dev_bmc_port "/dev/$bmc_port"
+
+                if [ ! -e "${dev_uart_port}" ]; then
+                    echo; echo "ERROR: ${dev_uart_port} does not exist!"
+                    dev_uart_port=""
+                fi
+
+                if [ ! -e "${dev_bmc_port}" ]; then
+                    echo; echo "ERROR: ${dev_bmc_port} does not exist!"
+                    dev_bmc_port=""
+                fi
+
+                if [ "$dev_uart_port" = "$dev_bmc_port" ]; then
+                    echo; echo "ERROR: UART and BMC cannot be the same port: $dev_uart_port!"
+                    dev_uart_port=""
+                fi
+
+                if [ -n "$dev_uart_port" ] && [ -n "$dev_bmc_port" ]; then
+                    break
+                fi
+            fi
+
+            #if we didn't find a port and reached the timeout limit then ask to reconnect
+            if [ -z "$uart_port" ] && [ "$loopCount" = "10" ]; then
+                echo ""
+                echo "Unable to detect which port the board is connected to."
+                echo "Please reconnect your board."
+                prompt_feedback "Press 'y' to attempt to detect your board again or press 'n' to continue..." retryBoardDetection y
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
+        sed -i -e "s|^pu port.*$|pu port             $dev_uart_port|g" ${HOME}/.minirc.dfl
+    fi
+
+    echo
+    echo "--------------------------------------------------------------------------------"
+    echo "Would you like to run the setup script now (y/n)?"
+    echo
+    echo "Please connect the ethernet cable as described in the Quick Start Guide."
+    echo "Once answering 'y' on the prompt below, the script will proceed with"
+    echo "automatically booting and configuring the board based on the responses"
+    echo "provided."
+    echo
+    echo "After successfully executing this script, your EVM will be set up. You will be "
+    echo "able to connect to it by executing 'minicom -w' or if you prefer a windows host"
+    echo "you can set up Tera Term as explained in the Software Developer's Guide."
+    echo "If you connect minicom or Tera Term and power cycle the board Linux will boot."
+
+    prompt_feedback "" minicomsetup y
+
+    if [ "$minicomsetup" = "y" ]; then
+      create_bmc_scripts
+
+      cd $cwd
+
+      # Configuring bootmode to UART boot via BMC
+      screen -dmS minicom_${platform}_bmc minicom -D "$dev_bmc_port" -S bmcUartBoot.minicom -C bmcUartBoot.log
+
+      # Transfering uboot.bin using XMODEM protocol
+      sx -kb "$ubootimagesrc" < "$dev_uart_port" > "$dev_uart_port"
+
+      # Configure U-Boot environment and optionally flash board
+      minicom -D "$dev_uart_port" -S updateBoard.minicom -C updateBoard.log
+      rm "$tmp_fifo"
+
+      # Configuring bootmode to NAND boot via BMC
+      minicom -D "$dev_bmc_port" -S bmcNandBoot.minicom -C bmcNandBoot.log
+
+      # Running terminal to board (UART)
+      minicom -w -D "$dev_uart_port" -C bootBoard.log
+      cd -
+    fi
+
+    echo "You can manually run minicom in the future with this setup script using: minicom -S $cwd/setupBoard.minicom"
+    echo "--------------------------------------------------------------------------------"
+
+fi
-- 
2.17.1

