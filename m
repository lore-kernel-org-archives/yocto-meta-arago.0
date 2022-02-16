Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web09.10449.1645008798077305715
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 16 Feb 2022 02:53:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=IU2PqX00;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: a-m1@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21GArHj1066320
	for <meta-arago@lists.yoctoproject.org>; Wed, 16 Feb 2022 04:53:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1645008797;
	bh=mBi/dRjVqcHRkmIFAgbXOKmREA/jCqukV/hKRqVtPS8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=IU2PqX007tnotN9d3aL9fUXsSG4jJ54lIWzpvBF17yCuhai/b3Vm5kKqmSgQlpM+b
	 wXKU6sOj3QL5p+h5xZf99F5nfEK1ROJeEwB6sGat3+CVTVPtvN+JE64Cepei76ewcV
	 6FtKRv8XP+59N056YQalD8i2mQsc280f6I3GXcUg=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21GArHvb096380
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 16 Feb 2022 04:53:17 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 16
 Feb 2022 04:53:16 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 16 Feb 2022 04:53:16 -0600
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21GAr5Hx000822;
	Wed, 16 Feb 2022 04:53:15 -0600
From: "Aparna M" <a-m1@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>
CC: <nikhil.nd@ti.com>, <nsekhar@ti.com>
Subject: [meta-arago][tisdk-setup-scripts][master][PATCH v2 3/4] setup-uboot-env-keystone-hs: Add u-boot env setup support for keystone hs devices
Date: Wed, 16 Feb 2022 16:23:00 +0530
Message-ID: <20220216105301.13863-4-a-m1@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220216105301.13863-1-a-m1@ti.com>
References: <20220216105301.13863-1-a-m1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Add u-boot env setup support for keystone hs devices.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>

Signed-off-by: Aparna M <a-m1@ti.com>
---
 0001-setup-add-support-for-HS-EVMs.patch      | 1402 +++++++++++++++++
 ...fs-Modify-script-to-search-for-tisdk.patch |   47 +
 ...-Support-only-Ubunut-18.04-as-host-O.patch |   33 +
 ...keystone-hs-use-default-env-for-net-.patch |   53 +
 ...-Modify-script-to-support-only-Ubunu.patch |   34 +
 ...fs-Modify-script-to-search-for-tisdk.patch |   47 +
 ...x-condition-for-printing-Boot-image-.patch |   30 +
 setup-uboot-env-keystone-hs.sh                |  449 ++++++
 8 files changed, 2095 insertions(+)
 create mode 100644 0001-setup-add-support-for-HS-EVMs.patch
 create mode 100644 0001-setup-targetfs-nfs-Modify-script-to-search-for-tisdk.patch
 create mode 100644 0002-setup-host-check-Support-only-Ubunut-18.04-as-host-O.patch
 create mode 100644 0006-setup-uboot-env-keystone-hs-use-default-env-for-net-.patch
 create mode 100644 0014-setup-host-check-Modify-script-to-support-only-Ubunu.patch
 create mode 100644 0014-setup-targetfs-nfs-Modify-script-to-search-for-tisdk.patch
 create mode 100644 0015-create-sdcard-Fix-condition-for-printing-Boot-image-.patch
 create mode 100755 setup-uboot-env-keystone-hs.sh

diff --git a/0001-setup-add-support-for-HS-EVMs.patch b/0001-setup-add-support-for-HS-EVMs.patch
new file mode 100644
index 0000000..3170992
--- /dev/null
+++ b/0001-setup-add-support-for-HS-EVMs.patch
@@ -0,0 +1,1402 @@
+From 65f47c27dc9680cd60794da18db959dcd903f91d Mon Sep 17 00:00:00 2001
+From: Jacob Stiffler <j-stiffler@ti.com>
+Date: Thu, 8 Dec 2016 15:31:12 -0500
+Subject: [PATCH] setup: add support for HS EVMs
+
+Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
+---
+ setup-tftp-fit.sh                | 148 +++++++++++++
+ setup-uboot-env-am335x-hs.sh     | 339 +++++++++++++++++++++++++++++
+ setup-uboot-env-am43x-hs.sh      | 165 ++++++++++++++
+ setup-uboot-env-am57xx-hs-evm.sh | 242 +++++++++++++++++++++
+ setup-uboot-env-keystone-hs.sh   | 456 +++++++++++++++++++++++++++++++++++++++
+ 5 files changed, 1350 insertions(+)
+ create mode 100644 setup-tftp-fit.sh
+ create mode 100644 setup-uboot-env-am335x-hs.sh
+ create mode 100644 setup-uboot-env-am43x-hs.sh
+ create mode 100644 setup-uboot-env-am57xx-hs-evm.sh
+ create mode 100755 setup-uboot-env-keystone-hs.sh
+
+diff --git a/setup-tftp-fit.sh b/setup-tftp-fit.sh
+new file mode 100644
+index 0000000..a0cc07d
+--- /dev/null
++++ b/setup-tftp-fit.sh
+@@ -0,0 +1,148 @@
++#!/bin/sh
++
++# This distribution contains contributions or derivatives under copyright
++# as follows:
++#
++# Copyright (c) 2010, Texas Instruments Incorporated
++# All rights reserved.
++#
++# Redistribution and use in source and binary forms, with or without
++# modification, are permitted provided that the following conditions
++# are met:
++# - Redistributions of source code must retain the above copyright notice,
++#   this list of conditions and the following disclaimer.
++# - Redistributions in binary form must reproduce the above copyright
++#   notice, this list of conditions and the following disclaimer in the
++#   documentation and/or other materials provided with the distribution.
++# - Neither the name of Texas Instruments nor the names of its
++#   contributors may be used to endorse or promote products derived
++#   from this software without specific prior written permission.
++#
++# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
++# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
++# TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
++# PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
++# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
++# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
++# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
++# PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
++# LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
++# OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
++# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
++
++cwd=`dirname $0`
++. $cwd/common.sh
++
++tftpcfg=/etc/xinetd.d/tftp
++tftprootdefault=/tftpboot
++
++tftp() {
++    echo "
++service tftp
++{
++protocol = udp
++port = 69
++socket_type = dgram
++wait = yes
++user = nobody
++server = /usr/sbin/in.tftpd
++server_args = $tftproot
++disable = no
++}
++" | sudo tee $tftpcfg > /dev/null
++     check_status
++     echo
++     echo "$tftpcfg successfully created"
++}
++
++prebuiltimagesdir=`cd $cwd/../board-support/prebuilt-images/ ; echo $PWD`
++copy_to_tftproot() {
++    files="$1"
++    for file in $files
++    do
++	if [ -f $tftproot/$file ]; then
++	    echo
++	    echo "$tftproot/$file already exists. The existing installed file can be renamed and saved under the new name."
++	    echo "(o) overwrite (s) skip copy "
++	    read -p "[o] " exists
++	    case "$exists" in
++	      s) echo "Skipping copy of $file, existing version will be used"
++		 ;;
++	      *) sudo cp "$prebuiltimagesdir/$file" $tftproot
++		 check_status
++		 echo
++		 echo "Successfully overwritten $file in tftp root directory $tftproot"
++		 ;;
++	    esac
++	else
++	    sudo cp "$prebuiltimagesdir/$file" $tftproot
++	    check_status
++	    echo
++	    echo "Successfully copied $file to tftp root directory $tftproot"
++	fi
++    done
++}
++
++echo "--------------------------------------------------------------------------------"
++echo "Which directory do you want to be your tftp root directory?(if this directory does not exist it will be created for you)"
++read -p "[ $tftprootdefault ] " tftproot
++
++if [ ! -n "$tftproot" ]; then
++    tftproot=$tftprootdefault
++fi
++echo $tftproot > $cwd/../.tftproot
++echo "--------------------------------------------------------------------------------"
++
++echo
++echo "--------------------------------------------------------------------------------"
++echo "This step will set up the tftp server in the $tftproot directory."
++echo
++echo "Note! This command requires you to have administrator priviliges (sudo access) "
++echo "on your host."
++read -p "Press return to continue" REPLY
++
++if [ -d $tftproot ]; then
++    echo
++    echo "$tftproot already exists, not creating.."
++else
++    sudo mkdir -p $tftproot
++    check_status
++    sudo chmod 777 $tftproot
++    check_status
++    sudo chown nobody $tftproot
++    check_status
++fi
++
++platform=`cat $cwd/../Rules.make | grep -e "^PLATFORM=" | cut -d= -f2`
++itbfiles=`cd $prebuiltimagesdir;ls -1 *.itb`
++copy_to_tftproot "$itbfiles"
++
++uboot_files=`cd $prebuiltimagesdir;ls -1 u-boot_HS_MLO* 2> /dev/null`
++copy_to_tftproot "$uboot_files"
++
++echo
++if [ -f $tftpcfg ]; then
++    echo "$tftpcfg already exists.."
++
++    #Use = instead of == for POSIX and dash shell compliance
++    if [ "`cat $tftpcfg | grep server_args | cut -d= -f2 | sed 's/^[ ]*//'`" \
++          = "$tftproot" ]; then
++        echo "$tftproot already exported for TFTP, skipping.."
++    else
++        echo "Copying old $tftpcfg to $tftpcfg.old"
++        sudo cp $tftpcfg $tftpcfg.old
++        check_status
++        tftp
++    fi
++else
++    tftp
++fi
++
++echo
++echo "Restarting tftp server"
++sudo /etc/init.d/xinetd stop
++check_status
++sleep 1
++sudo /etc/init.d/xinetd start
++check_status
++echo "--------------------------------------------------------------------------------"
+diff --git a/setup-uboot-env-am335x-hs.sh b/setup-uboot-env-am335x-hs.sh
+new file mode 100644
+index 0000000..3e7bfad
+--- /dev/null
++++ b/setup-uboot-env-am335x-hs.sh
+@@ -0,0 +1,339 @@
++#!/bin/sh
++
++# This distribution contains contributions or derivatives under copyright
++# as follows:
++#
++# Copyright (c) 2010, Texas Instruments Incorporated
++# All rights reserved.
++#
++# Redistribution and use in source and binary forms, with or without
++# modification, are permitted provided that the following conditions
++# are met:
++# - Redistributions of source code must retain the above copyright notice,
++#   this list of conditions and the following disclaimer.
++# - Redistributions in binary form must reproduce the above copyright
++#   notice, this list of conditions and the following disclaimer in the
++#   documentation and/or other materials provided with the distribution.
++# - Neither the name of Texas Instruments nor the names of its
++#   contributors may be used to endorse or promote products derived
++#   from this software without specific prior written permission.
++#
++# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
++# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
++# TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
++# PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
++# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
++# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
++# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
++# PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
++# LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
++# OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
++# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
++
++cwd=`dirname $0`
++. $cwd/common.sh
++
++do_expect() {
++    echo "expect {" >> $3
++    check_status
++    echo "    $1" >> $3
++    check_status
++    echo "}" >> $3
++    check_status
++    echo $2 >> $3
++    check_status
++    echo >> $3
++}
++
++
++echo
++echo "--------------------------------------------------------------------------------"
++echo "This step will set up the U-Boot variables for booting the EVM."
++echo
++
++ipdefault=`ifconfig | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d: -f2 | awk '{ print $1 }'`
++platform=`grep PLATFORM= $cwd/../Rules.make | cut -d= -f2`
++
++# Configure prompt for U-Boot 2016.05
++prompt="=>"
++
++echo "Autodetected the following ip address of your host, correct it if necessary"
++read -p "[ $ipdefault ] " ip
++echo
++
++if [ ! -n "$ip" ]; then
++    ip=$ipdefault
++fi
++
++fitimage="fitImage-arago-base-tisdk-image-"$platform".itb"
++fitimagesrc=`ls -1 $cwd/../board-support/prebuilt-images/$fitimage`
++fitimagedefault=`basename $fitimagesrc`
++
++
++echo "Select fit image location:"
++echo " 1: TFTP"
++echo " 2: SD card"
++echo
++read -p "[ 1 ] " fit
++
++if [ ! -n "$fitimage" ]; then
++    fit="1"
++fi
++
++
++if [ "$fit" -eq "1" ]; then
++    echo
++    echo "Available fit images in /tftproot:"
++    for file in /tftpboot/*.itb; do
++	basefile=`basename $file`
++	echo "    $basefile"
++    done
++    echo
++    echo "Which fit image do you want to boot from TFTP?"
++    read -p "[ $fitimagedefault ] " fitimage
++
++    if [ ! -n "$fitimage" ]; then
++	fitimage=$fitimagedefault
++    fi
++fi
++
++isBB="n"
++isBBBlack="n"
++isBBrevA3="n"
++configBB="n"
++
++check_for_beaglebone() {
++    # First check if there is a rev A3 board which uses the custom VID/PID
++    # combination
++    lsusb -d 0403:a6d0 > /dev/null
++
++    if [ "$?" = "0" ]
++    then
++        # We found a beaglebone
++        isBB="y"
++        isBBrevA3="y"
++        return
++    fi
++
++    # Now let's check for a standard VID/PID like newer BeagleBones have
++    sudo lsusb -vv -d 0403:6010 | grep "Product" | grep "BeagleBone" > /dev/null
++
++    if [ "$?" = "0" ]
++    then
++        isBB="y"
++        return
++    fi
++
++    # Now let's check for EVM-SK
++    sudo lsusb -vv -d 0403:6010 | grep "Product" | grep "EVM-SK" > /dev/null
++
++    if [ "$?" = "0" ]
++    then
++        isBB="y"
++        return
++    fi
++
++
++    # Now let's check for BeagleBone Black
++    sudo lsusb -vv -d 0403:6001 > /dev/null
++
++    if [ "$?" = "0" ]
++    then
++        isBB="y"
++        isBBBlack="y"
++        return
++     fi
++
++}
++
++echo "timeout 300" > $cwd/setupBoard.minicom
++echo "verbose on" >> $cwd/setupBoard.minicom
++
++do_expect "\"stop autoboot\"" "send \" \"" $cwd/setupBoard.minicom
++do_expect "\"$prompt\"" "send \"env default -f -a\"" $cwd/setupBoard.minicom
++do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom
++do_expect "\"$prompt\"" "send \"reset\"" $cwd/setupBoard.minicom
++do_expect "\"stop autoboot\"" "send \" \"" $cwd/setupBoard.minicom
++
++if [ "$fit" -eq "1" ]; then
++	do_expect "\"$prompt\"" "send setenv serverip $ip" $cwd/setupBoard.minicom
++	do_expect "\"$prompt\"" "send setenv fit_bootfile $fitimage" $cwd/setupBoard.minicom
++        do_expect "\"$prompt\"" "send setenv bootcmd 'run findfdt; run init_console; run envboot; setenv autoload no; dhcp; tftp \${fit_loadaddr} \${fit_bootfile}; run args_fit; bootm \${fit_loadaddr}#\${fdtfile}'" $cwd/setupBoard.minicom
++	do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom
++fi
++# Default U-Boot environment will boot our default SD card image.
++
++do_expect "\"$prompt\"" "send \"boot\"" $cwd/setupBoard.minicom
++echo "! killall -s SIGHUP minicom" >> $cwd/setupBoard.minicom
++
++echo "--------------------------------------------------------------------------------"
++echo "Would you like to create a minicom script with the above parameters (y/n)?"
++read -p "[ y ] " minicom
++echo
++
++if [ ! -n "$minicom" ]; then
++    minicom="y"
++fi
++
++if [ "$minicom" = "y" ]; then
++
++    echo -n "Successfully wrote "
++    readlink -m $cwd/setupBoard.minicom
++fi
++
++while [ yes ]
++do
++	check_for_beaglebone
++
++	if [ "$isBB" = "y" ]
++	then
++		echo ""
++		echo "A BeagleBone (Black) or StarterKit board has been detected"
++		echo "Do you want to configure U-Boot for one of the boards mentioned"
++		echo "above? An answer of 'n' will configure U-Boot for the"
++		echo "General Purpose EVM instead"
++		read -p "(y/n) " configBB
++		echo
++
++		if [ "$configBB" = "y" ] || [ "$configBB" = "n" ]
++		then
++			break
++		else
++			echo "Invalid response"
++			echo
++			continue
++		fi
++	else
++		echo ""
++		echo "No BeagleBone (Black) or StarterKit detected. Assuming"
++		echo "general purpose evm is being used. Is this correct?"
++		read -p "(y/n) " validevm
++		echo ""
++		if [ "$validevm" = "y" ]
++		then
++			configBB="n"
++			break
++		else
++			if [ "$validevm" != "n" ]
++			then
++				echo "Invalid response"
++				echo
++				continue
++			fi
++
++			echo "Please connect the Beaglebone (Black) or StarterKit to the PC"
++			echo "If your using the StarterKit board make sure it is turned on"
++			read -p "Press any key to try checking again." temp
++		fi
++	fi
++done
++
++if [ "$configBB" = "y" ]
++then
++    ftdiInstalled=`lsmod | grep ftdi_sio`
++    if [ -z "$ftdiInstalled" ]; then
++    #Add the ability to regconize the BeagleBone as two serial ports
++        if [ "$isBBrevA3" = "y" ]
++        then
++            echo "Finishing install by adding drivers for Beagle Bone..."
++            sudo modprobe -q ftdi_sio vendor=0x0403 product=0xa6d0
++
++            #Create uDev rule
++            echo "# Load ftdi_sio driver including support for XDS100v2." > $cwd/99-custom.rules
++            echo "SYSFS{idVendor}=="0403", SYSFS{idProduct}=="a6d0", \\" >>  $cwd/99-custom.rules
++            echo "RUN+=\"/sbin/modprobe -q ftdi_sio vendor=0x0403 product=0xa6d0\"" >> $cwd/99-custom.rules
++            sudo cp $cwd/99-custom.rules /etc/udev/rules.d/
++            rm $cwd/99-custom.rules
++        else
++            sudo modprobe -q ftdi_sio
++        fi
++    fi
++
++    #infinite loop to look for board unless user asks to stop
++    while [ yes ]
++    do
++	    echo "Detecting connection to board..."
++	    loopCount=0
++	    port=`dmesg | grep FTDI | grep "tty" | tail -1 | grep "attached" |  awk '{ print $NF }'`
++	    while [ -z "$port" ] && [ "$loopCount" -ne "10" ]
++	    do
++		    #count to 10 and timeout if no connection is found
++		    loopCount=$((loopCount+1))
++
++		    sleep 1
++		    port=`dmesg  | grep FTDI | grep "tty" | tail -1 | grep "attached" |  awk '{ print $NF }'`
++	    done
++
++	    #check to see if we actually found a port
++	    if [ -n "$port" ]; then
++		    break;
++	    fi
++
++	    #if we didn't find a port and reached the timeout limit then ask to reconnect
++	    if [ -z "$port" ] && [ "$loopCount" = "10" ]; then
++		    echo ""
++		    echo "Unable to detect which port the board is connected to."
++		    echo "Please reconnect your board."
++		    echo "Press 'y' to attempt to detect your board again or press 'n' to continue..."
++		    read -p "(y/n)" retryBoardDetection
++	    fi
++
++	    #if they choose not to retry, ask user to reboot manually and exit
++	    if [ "$retryBoardDetection" = "n" ]; then
++		    echo ""
++		    echo "Please reboot your board manually and connect using minicom."
++		    exit;
++	    fi
++    done
++
++    #Change minicom to accurately reflect the bone
++    minicomcfg=${HOME}/.minirc.dfl
++    echo "pu port             /dev/$port
++    pu baudrate         115200
++    pu bits             8
++    pu parity           N
++    pu stopbits         1
++    pu minit
++    pu mreset
++    pu mdialpre
++    pu mdialsuf
++    pu mdialpre2
++    pu mdialsuf2
++    pu mdialpre3
++    pu mdialsuf3
++    pu mconnect
++    pu mnocon1          NO CARRIER
++    pu mnocon2          BUSY
++    pu mnocon3          NO DIALTONE
++    pu mnocon4          VOICE
++    pu rtscts           No" | tee $minicomcfg > /dev/null
++    check_status
++fi
++
++echo "Would you like to run the setup script now (y/n)? For the general purpose evm "
++echo "you must now connect the RS-232 cable to your evm now. For the Beaglebone (Black)"
++echo "or StarterKit this step should of already have been done. Also connect the ethernet"
++echo "cable as described in the Quick Start Guide."
++echo "**Important**"
++echo "Once answering 'y' on the prompt below you will have 300 seconds to turn on the"
++echo "board or if it was already on reboot the board before the setup times out"
++echo
++echo "After successfully executing this script, your board will be set up. You will be "
++echo "able to connect to it by executing 'minicom -w' or if you prefer a windows host"
++echo "you can set up Tera Term as explained in the Software Developer's Guide."
++echo "If you connect minicom or Tera Term and power cycle the board Linux will boot."
++echo
++read -p "[ y ] " minicomsetup
++
++if [ ! -n "$minicomsetup" ]; then
++minicomsetup="y"
++fi
++
++if [ "$minicomsetup" = "y" ]; then
++cd $cwd
++sudo minicom -w -S setupBoard.minicom
++cd -
++fi
++
++echo "You can manually run minicom in the future with this setup script using: minicom -S $cwd/setupBoard.minicom"
++echo "--------------------------------------------------------------------------------"
+diff --git a/setup-uboot-env-am43x-hs.sh b/setup-uboot-env-am43x-hs.sh
+new file mode 100644
+index 0000000..7b67a65
+--- /dev/null
++++ b/setup-uboot-env-am43x-hs.sh
+@@ -0,0 +1,165 @@
++#!/bin/sh
++
++# This distribution contains contributions or derivatives under copyright
++# as follows:
++#
++# Copyright (c) 2014, Texas Instruments Incorporated
++# All rights reserved.
++#
++# Redistribution and use in source and binary forms, with or without
++# modification, are permitted provided that the following conditions
++# are met:
++# - Redistributions of source code must retain the above copyright notice,
++#   this list of conditions and the following disclaimer.
++# - Redistributions in binary form must reproduce the above copyright
++#   notice, this list of conditions and the following disclaimer in the
++#   documentation and/or other materials provided with the distribution.
++# - Neither the name of Texas Instruments nor the names of its
++#   contributors may be used to endorse or promote products derived
++#   from this software without specific prior written permission.
++#
++# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
++# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
++# TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
++# PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
++# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
++# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
++# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
++# PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
++# LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
++# OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
++# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
++
++cwd=`dirname $0`
++. $cwd/common.sh
++
++do_expect() {
++    echo "expect {" >> $3
++    check_status
++    echo "    $1" >> $3
++    check_status
++    echo "}" >> $3
++    check_status
++    echo $2 >> $3
++    check_status
++    echo >> $3
++}
++
++
++echo
++echo "--------------------------------------------------------------------------------"
++echo "This step will set up the u-boot variables for booting the EVM."
++echo
++
++ipdefault=`ifconfig | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d: -f2 | awk '{ print $1 }'`
++platform=`grep PLATFORM= $cwd/../Rules.make | cut -d= -f2`
++
++# Configure prompt for U-Boot 2016.05
++prompt="=>"
++
++
++echo "Autodetected the following ip address of your host, correct it if necessary"
++read -p "[ $ipdefault ] " ip
++echo
++
++if [ ! -n "$ip" ]; then
++    ip=$ipdefault
++fi
++
++fitimage="fitImage-arago-base-tisdk-image-"$platform".itb"
++fitimagesrc=`ls -1 $cwd/../board-support/prebuilt-images/$fitimage`
++fitimagedefault=`basename $fitimagesrc`
++
++
++echo "Select fit image location:"
++echo " 1: TFTP"
++echo " 2: SD card"
++echo
++read -p "[ 1 ] " fit
++
++if [ ! -n "$fitimage" ]; then
++    fit="1"
++fi
++
++
++if [ "$fit" -eq "1" ]; then
++    echo
++    echo "Available fit images in /tftproot:"
++    for file in /tftpboot/*.itb; do
++	basefile=`basename $file`
++	echo "    $basefile"
++    done
++    echo
++    echo "Which fit image do you want to boot from TFTP?"
++    read -p "[ $fitimagedefault ] " fitimage
++
++    if [ ! -n "$fitimage" ]; then
++	fitimage=$fitimagedefault
++    fi
++fi
++
++
++#This is an AM437x GP/EPOS EVM and thus has a NAND. Flash information to NAND.
++
++
++echo "timeout 300" > $cwd/setupBoard.minicom
++echo "verbose on" >> $cwd/setupBoard.minicom
++do_expect "\"stop autoboot:\"" "send \" \"" $cwd/setupBoard.minicom
++do_expect "\"$prompt\"" "send \"env default -f -a\"" $cwd/setupBoard.minicom
++do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom
++do_expect "\"$prompt\"" "send \"reset\"" $cwd/setupBoard.minicom
++do_expect "\"stop autoboot:\"" "send \" \"" $cwd/setupBoard.minicom
++
++if [ "$fit" -eq "1" ]; then
++	do_expect "\"$prompt\"" "send setenv serverip $ip" $cwd/setupBoard.minicom
++	do_expect "\"$prompt\"" "send setenv fit_bootfile $fitimage" $cwd/setupBoard.minicom
++        do_expect "\"$prompt\"" "send setenv bootcmd 'run findfdt; run init_console; run envboot; setenv autoload no; dhcp; tftp \${fit_loadaddr} \${fit_bootfile}; run args_fit; bootm \${fit_loadaddr}#\${fdtfile}'" $cwd/setupBoard.minicom
++	do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom
++fi
++# Default U-Boot environment will boot our default SD card image.
++
++do_expect "\"$prompt\"" "send \"boot\"" $cwd/setupBoard.minicom
++echo "! killall -s SIGHUP minicom" >> $cwd/setupBoard.minicom
++
++echo "--------------------------------------------------------------------------------"
++echo "Would you like to create a minicom script with the above parameters (y/n)?"
++read -p "[ y ] " minicom
++echo
++
++if [ ! -n "$minicom" ]; then
++    minicom="y"
++fi
++
++if [ "$minicom" = "y" ]; then
++
++    echo -n "Successfully wrote "
++    readlink -m $cwd/setupBoard.minicom
++
++    echo "Would you like to run the setup script now (y/n)? This requires you to connect"
++    echo "the RS-232 cable between your host and EVM as well as your ethernet cable as"
++    echo "described in the Quick Start Guide. Once answering 'y' on the prompt below"
++    echo "you will have 300 seconds to connect the board and power cycle it"
++    echo "before the setup times out"
++    echo
++    echo "After successfully executing this script, your EVM will be set up. You will be "
++    echo "able to connect to it by executing 'minicom -w' or if you prefer a windows host"
++    echo "you can set up Tera Term as explained in the Software Developer's Guide."
++    echo "If you connect minicom or Tera Term and power cycle the board Linux will boot."
++    echo
++    read -p "[ y ] " minicomsetup
++
++    if [ ! -n "$minicomsetup" ]; then
++       minicomsetup="y"
++    fi
++
++    if [ "$minicomsetup" = "y" ]; then
++      cd $cwd
++      sudo minicom -w -S setupBoard.minicom
++      cd -
++    fi
++
++    echo "You can manually run minicom in the future with this setup script using: minicom -S $cwd/setupBoard.minicom"
++    echo "--------------------------------------------------------------------------------"
++
++fi
++
+diff --git a/setup-uboot-env-am57xx-hs-evm.sh b/setup-uboot-env-am57xx-hs-evm.sh
+new file mode 100644
+index 0000000..c3192b5
+--- /dev/null
++++ b/setup-uboot-env-am57xx-hs-evm.sh
+@@ -0,0 +1,242 @@
++#!/bin/sh
++
++# This distribution contains contributions or derivatives under copyright
++# as follows:
++#
++# Copyright (c) 2010, Texas Instruments Incorporated
++# All rights reserved.
++#
++# Redistribution and use in source and binary forms, with or without
++# modification, are permitted provided that the following conditions
++# are met:
++# - Redistributions of source code must retain the above copyright notice,
++#   this list of conditions and the following disclaimer.
++# - Redistributions in binary form must reproduce the above copyright
++#   notice, this list of conditions and the following disclaimer in the
++#   documentation and/or other materials provided with the distribution.
++# - Neither the name of Texas Instruments nor the names of its
++#   contributors may be used to endorse or promote products derived
++#   from this software without specific prior written permission.
++#
++# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
++# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
++# TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
++# PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
++# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
++# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
++# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
++# PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
++# LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
++# OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
++# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
++
++cwd=`dirname $0`
++. $cwd/common.sh
++
++do_expect() {
++    echo "expect {" >> $3
++    check_status
++    echo "    $1" >> $3
++    check_status
++    echo "}" >> $3
++    check_status
++    echo $2 >> $3
++    check_status
++    echo >> $3
++}
++
++
++echo
++echo "--------------------------------------------------------------------------------"
++echo "This step will set up the u-boot variables for booting the EVM."
++echo "--------------------------------------------------------------------------------"
++
++ipdefault=`ifconfig | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d: -f2 | awk '{ print $1 }'`
++platform=`grep PLATFORM= $cwd/../Rules.make | cut -d= -f2`
++
++# Configure prompt for U-Boot 2016.05
++prompt="=>"
++
++
++echo "Autodetected the following ip address of your host, correct it if necessary"
++read -p "[ $ipdefault ] " ip
++echo
++
++if [ ! -n "$ip" ]; then
++    ip=$ipdefault
++fi
++
++fitimage="fitImage-arago-base-tisdk-image-"$platform".itb"
++fitimagesrc=`ls -1 $cwd/../board-support/prebuilt-images/$fitimage`
++fitimagedefault=`basename $fitimagesrc`
++
++
++echo "Select fit image location:"
++echo " 1: TFTP"
++echo " 2: SD card"
++echo
++read -p "[ 1 ] " fit
++
++if [ ! -n "$fitimage" ]; then
++    fit="1"
++fi
++
++
++if [ "$fit" -eq "1" ]; then
++    echo
++    echo "Available fit images in /tftproot:"
++    for file in /tftpboot/*.itb; do
++	basefile=`basename $file`
++	echo "    $basefile"
++    done
++    echo
++    echo "Which fit image do you want to boot from TFTP?"
++    read -p "[ $fitimagedefault ] " fitimage
++
++    if [ ! -n "$fitimage" ]; then
++	fitimage=$fitimagedefault
++    fi
++fi
++
++board="unknown"
++check_for_board() {
++    lsusb -vv -d 0403:6001 > /dev/null 2>&1
++
++    if [ "$?" = "0" ]
++    then
++        board="x15"
++    fi
++
++    lsusb -vv -d 0403:6010 > /dev/null 2>&1
++
++    if [ "$?" = "0" ]
++    then
++        board="am5-idk"
++    fi
++}
++
++echo "timeout 300" > $cwd/setupBoard.minicom
++echo "verbose on" >> $cwd/setupBoard.minicom
++do_expect "\"stop autoboot:\"" "send \" \"" $cwd/setupBoard.minicom
++do_expect "\"$prompt\"" "send \"env default -f -a\"" $cwd/setupBoard.minicom
++do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom
++do_expect "\"$prompt\"" "send \"reset\"" $cwd/setupBoard.minicom
++do_expect "\"stop autoboot:\"" "send \" \"" $cwd/setupBoard.minicom
++
++if [ "$fit" -eq "1" ]; then
++	do_expect "\"$prompt\"" "send setenv serverip $ip" $cwd/setupBoard.minicom
++	do_expect "\"$prompt\"" "send setenv fit_bootfile $fitimage" $cwd/setupBoard.minicom
++        do_expect "\"$prompt\"" "send setenv bootcmd 'run findfdt; run init_console; run envboot; setenv autoload no; dhcp; tftp \${fit_loadaddr} \${fit_bootfile}; run args_fit; bootm \${fit_loadaddr}#\${fdtfile}'" $cwd/setupBoard.minicom
++	do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom
++fi
++# Default U-Boot environment will boot our default SD card image.
++
++do_expect "\"$prompt\"" "send \"boot\"" $cwd/setupBoard.minicom
++echo "! killall -s SIGHUP minicom" >> $cwd/setupBoard.minicom
++
++echo "--------------------------------------------------------------------------------"
++echo "Would you like to create a minicom script with the above parameters (y/n)?"
++read -p "[ y ] " minicom
++echo
++
++if [ ! -n "$minicom" ]; then
++    minicom="y"
++fi
++
++if [ "$minicom" = "y" ]; then
++
++    echo -n "Successfully wrote "
++    readlink -m $cwd/setupBoard.minicom
++
++    while [ yes ]
++    do
++        check_for_board
++
++        if [ "$board" != "unknown" ]
++        then
++            break
++        else
++            echo ""
++            echo "Board could not be detected. Please connect the board to the PC."
++            read -p "Press any key to try checking again." temp
++        fi
++    done
++
++    if [ "$board" != "unknown" ]
++    then
++        ftdiInstalled=`lsmod | grep ftdi_sio`
++        if [ -z "$ftdiInstalled" ]
++        then
++            sudo modprobe -q ftdi_sio
++        fi
++
++        while [ yes ]
++        do
++            echo ""
++            echo -n "Detecting connection to board... "
++            loopCount=0
++            port=`dmesg | grep FTDI | grep "tty" | tail -1 | grep "attached" |  awk '{ print $NF }'`
++            while [ -z "$port" ] && [ "$loopCount" -ne "10" ]
++            do
++                #count to 10 and timeout if no connection is found
++                loopCount=$((loopCount+1))
++
++                sleep 1
++                port=`dmesg  | grep FTDI | grep "tty" | tail -1 | grep "attached" |  awk '{ print $NF }'`
++            done
++
++            #check to see if we actually found a port
++            if [ -n "$port" ]; then
++                echo "/dev/$port"
++                break;
++            fi
++
++            #if we didn't find a port and reached the timeout limit then ask to reconnect
++            if [ -z "$port" ] && [ "$loopCount" = "10" ]; then
++                echo ""
++                echo "Unable to detect which port the board is connected to."
++                echo "Please reconnect your board."
++                echo "Press 'y' to attempt to detect your board again or press 'n' to continue..."
++                read -p "(y/n)" retryBoardDetection
++            fi
++
++            #if they choose not to retry, ask user to reboot manually and exit
++            if [ "$retryBoardDetection" = "n" ]; then
++                echo ""
++                echo "Please reboot your board manually and connect using minicom."
++                exit;
++            fi
++        done
++
++        sed -i -e "s|^pu port.*$|pu port             /dev/$port|g" ${HOME}/.minirc.dfl
++    fi
++
++    echo
++    echo "--------------------------------------------------------------------------------"
++    echo "Would you like to run the setup script now (y/n)?"
++    echo
++    echo "Please connect the ethernet cable as described in the Quick Start Guide."
++    echo "Once answering 'y' on the prompt below, you will have 300 seconds to connect"
++    echo "the board and power cycle it before the setup times out"
++    echo
++    echo "After successfully executing this script, your EVM will be set up. You will be "
++    echo "able to connect to it by executing 'minicom -w' or if you prefer a windows host"
++    echo "you can set up Tera Term as explained in the Software Developer's Guide."
++    echo "If you connect minicom or Tera Term and power cycle the board Linux will boot."
++    echo
++    read -p "[ y ] " minicomsetup
++
++    if [ ! -n "$minicomsetup" ]; then
++       minicomsetup="y"
++    fi
++
++    if [ "$minicomsetup" = "y" ]; then
++      cd $cwd
++      sudo minicom -w -S setupBoard.minicom
++      cd -
++    fi
++
++    echo "You can manually run minicom in the future with this setup script using: minicom -S $cwd/setupBoard.minicom"
++    echo "--------------------------------------------------------------------------------"
++
++fi
+diff --git a/setup-uboot-env-keystone-hs.sh b/setup-uboot-env-keystone-hs.sh
+new file mode 100755
+index 0000000..9eff80f
+--- /dev/null
++++ b/setup-uboot-env-keystone-hs.sh
+@@ -0,0 +1,456 @@
++#!/bin/sh
++
++# This distribution contains contributions or derivatives under copyright
++# as follows:
++#
++# Copyright (c) 2010, Texas Instruments Incorporated
++# All rights reserved.
++#
++# Redistribution and use in source and binary forms, with or without
++# modification, are permitted provided that the following conditions
++# are met:
++# - Redistributions of source code must retain the above copyright notice,
++#   this list of conditions and the following disclaimer.
++# - Redistributions in binary form must reproduce the above copyright
++#   notice, this list of conditions and the following disclaimer in the
++#   documentation and/or other materials provided with the distribution.
++# - Neither the name of Texas Instruments nor the names of its
++#   contributors may be used to endorse or promote products derived
++#   from this software without specific prior written permission.
++#
++# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
++# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
++# TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
++# PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
++# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
++# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
++# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
++# PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
++# LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
++# OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
++# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
++
++cwd=`dirname $0`
++. $cwd/common.sh
++
++do_expect() {
++    local expect_str="$1"
++    local command="$2"
++
++    shift; shift
++
++    while [ $# -gt 0 ]
++    do
++        echo "expect {" >> "$1"
++        check_status
++        echo "    $expect_str" >> "$1"
++        check_status
++        echo "    timeout 600 goto end" >> "$1"
++        echo "}" >> "$1"
++        check_status
++        echo $command >> "$1"
++        check_status
++        echo >> "$1"
++
++        shift
++    done
++}
++
++prompt_feedback() {
++    # Usage: prompt_feedback <prompt> [variable] [default_value] [valid_opt1] [valid_opt2]...
++    local prompt="$1"
++    local var=""
++    local default=""
++
++    local opt_str=""
++
++    local response=""
++    local good_response=""
++
++    shift
++    [ $# -eq 0 ] || var="$1"
++    shift
++    [ $# -eq 0 ] || default="$1"
++    shift
++
++    if [ $# -gt 0 ]
++    then
++        opt_str="($1"
++        shift
++
++        while [ $# -gt 0 ]
++        do
++            opt_str="${opt_str}/$1"
++            shift
++        done
++        opt_str="${opt_str})"
++    fi
++
++    echo "$prompt $opt_str"
++    if [ ! -z "$default" ]
++    then
++        read -p "[ $default ] " response
++    else
++        read response
++    fi
++    echo
++
++    [ ! -z "$response" ] || response="$default"
++
++    [ -z "$var" ] || eval $var=\"$response\"
++}
++
++copy_to_tftproot() {
++    files="$1"
++    for file in $files
++    do
++	if [ -f $tftproot/$file ]; then
++	    echo
++	    echo "$tftproot/$file already exists. The existing installed file can be renamed and saved under the new name."
++	    prompt_feedback "(o) overwrite (s) skip copy" exists o
++	    case "$exists" in
++	      s) echo "Skipping copy of $file, existing version will be used"
++		 ;;
++	      *) sudo cp "$prebuiltimagesdir/$file" $tftproot
++		 check_status
++		 echo
++		 echo "Successfully overwritten $file in tftp root directory $tftproot"
++		 ;;
++	    esac
++	else
++	    sudo cp "$prebuiltimagesdir/$file" $tftproot
++	    check_status
++	    echo
++	    echo "Successfully copied $file to tftp root directory $tftproot"
++	fi
++    done
++}
++
++# Create the BMC scripts. These require no configuration from the user.
++create_bmc_scripts() {
++    ( echo "timeout 300"; echo; ) > $cwd/bmcUartBoot.minicom
++    ( echo "timeout 300"; echo; ) > $cwd/bmcNandBoot.minicom
++
++    # Allow time for XMODEM transfer to begin
++    echo "! sleep 1" >> $cwd/bmcUartBoot.minicom
++
++    ( echo "send \" \""; echo; ) >> $cwd/bmcUartBoot.minicom
++    ( echo "send \" \""; echo; ) >> $cwd/bmcNandBoot.minicom
++
++    do_expect "\"BMC>\"" "send \"bootmode #4\"" $cwd/bmcUartBoot.minicom
++    do_expect "\"BMC>\"" "send \"bootmode #0\"" $cwd/bmcNandBoot.minicom
++
++    do_expect "\"BMC>\"" "send \"reboot\"" $cwd/bmcUartBoot.minicom $cwd/bmcNandBoot.minicom
++
++    echo "end:" >> $cwd/bmcUartBoot.minicom
++    echo "end:" >> $cwd/bmcNandBoot.minicom
++
++    # bmcUartboot.minicom will be killed by the updateUboot.minicom script
++    echo "! killall -s SIGHUP minicom" >> $cwd/bmcNandBoot.minicom
++}
++
++echo
++echo "--------------------------------------------------------------------------------"
++echo "This step will set up the u-boot variables for booting the EVM."
++echo "--------------------------------------------------------------------------------"
++
++ipdefault=`ifconfig | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d: -f2 | awk '{ print $1 }'`
++platform=`grep PLATFORM= $cwd/../Rules.make | cut -d= -f2`
++
++# Configure prompt for U-Boot 2016.05
++prompt="=>"
++
++prompt_feedback "Autodetected the following ip address of your host, correct it if necessary" ip "$(echo $ipdefault | sed -e 's| .*||')" $ipdefault
++
++if [ -f $cwd/../.tftproot ]; then
++    tftproot=`cat $cwd/../.tftproot`
++else
++    prompt_feedback "Where is your tftp root directory?" tftproot "/tftpboot"
++fi
++
++if [ -f $cwd/../.targetfs ]; then
++    rootpath=`cat $cwd/../.targetfs`
++else
++    prompt_feedback "Where is your target filesystem extracted?" rootpath "${HOME}/targetNFS"
++fi
++
++
++fitimage="fitImage-arago-base-tisdk-image-"$platform".itb"
++fitimagesrc=`ls -1 $cwd/../board-support/prebuilt-images/$fitimage`
++fitimagedefault=`basename $fitimagesrc`
++
++ubootimage="u-boot_HS_MLO-${platform}"
++ubootimagesrc=`readlink -m $cwd/../board-support/prebuilt-images/$ubootimage`
++
++echo "--------------------------------------------------------------------------------"
++prompt_feedback "Would you like to update U-boot on the board?" ubootupdate y y n
++
++echo
++echo "Available fit images in /tftproot:"
++for file in /tftpboot/*.itb; do
++    basefile=`basename $file`
++    echo "    $basefile"
++done
++echo
++echo "Which fit image do you want to boot from TFTP?"
++read -p "[ $fitimagedefault ] " fitimage
++
++if [ ! -n "$fitimage" ]; then
++    fitimage=$fitimagedefault
++fi
++
++board="unknown"
++check_for_board() {
++    case $platform in
++        "k2hk-evm")
++            lsusb -vv -d 0403:6010 > /dev/null 2>&1
++
++            if [ "$?" = "0" ]
++            then
++                board="k2evm"
++                board_vendor="0403"
++                board_product="6010"
++                num_port="2"
++                uart_port_idx="1"
++                bmc_port_idx="2"
++            fi
++        ;;
++
++        "k2l-evm"|"k2e-evm")
++            lsusb -vv -d 10c4:ea70 > /dev/null 2>&1
++
++            if [ "$?" = "0" ]
++            then
++                board="k2evm"
++                board_vendor="10c4"
++                board_product="ea70"
++                num_port="2"
++                uart_port_idx="1"
++                bmc_port_idx="2"
++            fi
++        ;;
++    esac
++}
++
++echo "timeout 1800" > $cwd/setupBoard.minicom
++echo "timeout 1800" > $cwd/updateBoard.minicom
++echo "verbose on" >> $cwd/setupBoard.minicom
++echo "verbose on" >> $cwd/updateBoard.minicom
++
++do_expect "\"stop autoboot:\"" "send \" \"" $cwd/setupBoard.minicom $cwd/updateBoard.minicom
++
++# If U-Boot was not updated, refuse to proceed.
++cat >> $cwd/setupBoard.minicom << __EOF__
++expect {
++    "$prompt"
++    "# " goto uboot_update_required
++    timeout 60 goto end
++}
++send " "
++__EOF__
++
++# Reset to the default environment
++do_expect "\"$prompt\"" "send \"env default -f -a\"" $cwd/setupBoard.minicom $cwd/updateBoard.minicom
++
++do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom
++
++# Reset incase any variables are set when u-boot initializes
++do_expect "\"$prompt\"" "send \"reset\"" $cwd/setupBoard.minicom
++do_expect "\"stop autoboot:\"" "send \" \"" $cwd/setupBoard.minicom
++
++# Set up the U-Boot environment
++do_expect "\"$prompt\"" "send \"setenv serverip $ip\"" $cwd/setupBoard.minicom $cwd/updateBoard.minicom
++do_expect "\"$prompt\"" "send \"setenv tftp_root '$tftproot'\"" $cwd/setupBoard.minicom $cwd/updateBoard.minicom
++do_expect "\"$prompt\"" "send \"setenv name_uboot $ubootimage\"" $cwd/setupBoard.minicom $cwd/updateBoard.minicom
++do_expect "\"$prompt\"" "send \"setenv fit_bootfile $fitimage\"" $cwd/setupBoard.minicom $cwd/updateBoard.minicom
++do_expect "\"$prompt\"" "send \"setenv fit_loadaddr 0xc0000000\"" $cwd/setupBoard.minicom $cwd/updateBoard.minicom
++do_expect "\"$prompt\"" "send \"setenv addr_mon 0xc08000\"" $cwd/setupBoard.minicom $cwd/updateBoard.minicom
++do_expect "\"$prompt\"" "send \"setenv addr_mon_mkimg 0xc07ffc0\"" $cwd/setupBoard.minicom $cwd/updateBoard.minicom
++do_expect "\"$prompt\"" "send \"setenv mon_size 0x1210\"" $cwd/setupBoard.minicom $cwd/updateBoard.minicom
++do_expect "\"$prompt\"" "send \"setenv addr_mon 0xc08000\"" $cwd/setupBoard.minicom $cwd/updateBoard.minicom
++do_expect "\"$prompt\"" "send \"setenv sec_bm_install 'go \${addr_mon}4 0xc084000 \${mon_size}; mon_install \${addr_mon_mkimg}'\"" $cwd/setupBoard.minicom $cwd/updateBoard.minicom
++do_expect "\"$prompt\"" "send \"setenv loadimage 'dhcp \${fit_loadaddr} \${tftp_root}/\${fit_bootfile}'\"" $cwd/setupBoard.minicom $cwd/updateBoard.minicom
++do_expect "\"$prompt\"" "send \"setenv bootcmd 'run sec_bm_install; run loadimage; bootm \${fit_loadaddr}#\${name_fdt}'\"" $cwd/setupBoard.minicom $cwd/updateBoard.minicom
++
++
++# Create command to fetch and flash u-boot and ubi
++#
++# TBD: Save minicom output to a log and use these strings to determine the
++#      update status on the host machine.
++#
++update_uboot_status="U-Boot update:"
++update_ubi_status="UBI update:"
++
++do_expect "\"$prompt\"" "send \"setenv update_uboot 'if run get_uboot_net burn_uboot_nand; then echo $update_uboot_status SUCCESS; else echo $update_uboot_status FAILED; fi'\"" $cwd/setupBoard.minicom $cwd/updateBoard.minicom
++
++do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom $cwd/updateBoard.minicom
++do_expect "\"$prompt\"" "send \"printenv\"" $cwd/setupBoard.minicom $cwd/updateBoard.minicom
++
++if [ "$ubootupdate" = "y" ]; then
++    do_expect "\"$prompt\"" "send \"run sec_bm_install\"" $cwd/updateBoard.minicom
++    do_expect "\"$prompt\"" "send \"run update_uboot\"" $cwd/updateBoard.minicom
++fi
++
++do_expect "\"$prompt\"" "send \" \"" $cwd/updateBoard.minicom
++do_expect "\"$prompt\"" "send \"boot\"" $cwd/setupBoard.minicom
++
++cat >> $cwd/setupBoard.minicom << __EOF__
++goto end
++uboot_update_required:
++send echo; echo "*** U-boot is require to be updated before proceeding!"; echo "*** The automatic upgrade of this version of U-boot is currently disabled."; echo "*** Please follow the wiki instructions to manually upgrade U-boot."; echo
++end:
++__EOF__
++
++cat >> $cwd/updateBoard.minicom << __EOF__
++goto end
++uboot_update_required:
++send echo; echo "*** U-boot is require to be updated before proceeding!"; echo "*** The automatic upgrade of this version of U-boot is currently disabled."; echo "*** Please follow the wiki instructions to manually upgrade U-boot."; echo
++end:
++__EOF__
++echo "! killall -s SIGHUP minicom" >> $cwd/updateBoard.minicom
++
++echo "--------------------------------------------------------------------------------"
++prompt_feedback "Would you like to create a minicom script with the above parameters?" minicom y y n
++
++if [ "$minicom" = "y" ]; then
++
++    echo -n "Successfully wrote "
++    readlink -m $cwd/setupBoard.minicom
++
++    while [ yes ]
++    do
++        check_for_board
++
++        if [ "$board" = "k2evm" ]
++        then
++            break
++        else
++            echo ""
++            prompt_feedback "Board could not be detected. Please connect the board to the PC." temp "Press any key to try checking again"
++
++            # Set to default board to allow user to specify the correct ports.
++            board=k2evm
++        fi
++    done
++
++    if [ "$board" != "unknown" ]
++    then
++        ftdiInstalled=`lsmod | grep ftdi_sio`
++        if [ -z "$ftdiInstalled" ]
++        then
++            sudo modprobe -q ftdi_sio
++        fi
++
++        while [ yes ]
++        do
++            echo ""
++            echo "--------------------------------------------------------------------------------"
++            echo
++            echo -n "Detecting connection to board... "
++            loopCount=0
++            usb_id=`dmesg | grep "idVendor=${board_vendor}" | grep "idProduct=${board_product}" | tail -1 | sed -e 's|.*usb \(.*\):.*|\1|'`
++            uart_port=`dmesg | grep "usb $usb_id" | grep "tty" | tail -${num_port} | head -${uart_port_idx} | tail -1 | grep "attached" |  awk '{ print $NF }'`
++            bmc_port=`dmesg | grep "usb $usb_id" | grep "tty" | tail -${num_port} | head -${bmc_port_idx} | tail -1 | grep "attached" |  awk '{ print $NF }'`
++            while [ -z "$uart_port" ] && [ "$loopCount" -ne "10" ]
++            do
++                #count to 10 and timeout if no connection is found
++                loopCount=$((loopCount+1))
++
++                sleep 1
++                usb_id=`dmesg | grep "idVendor=${board_vendor}" | grep "idProduct=${board_product}" | tail -1 | sed -e 's|.*usb \(.*\):.*|\1|'`
++                uart_port=`dmesg | grep "usb $usb_id" | grep "tty" | tail -${num_port} | head -${uart_port_idx} | tail -1 | grep "attached" |  awk '{ print $NF }'`
++                bmc_port=`dmesg | grep "usb $usb_id" | grep "tty" | tail -${num_port} | head -${bmc_port_idx} | tail -1 | grep "attached" |  awk '{ print $NF }'`
++            done
++
++            #check to see if we actually found a port
++            if [ -n "$uart_port" ]; then
++                echo "${platform} (UART) autodetected at /dev/$uart_port"
++                echo
++                prompt_feedback "Please verify that this is correct or manually enter the correct port:" dev_uart_port "/dev/$uart_port"
++
++                echo "${platform} (BMC) autodetected at /dev/$bmc_port"
++                echo
++                prompt_feedback "Please verify that this is correct or manually enter the correct port:" dev_bmc_port "/dev/$bmc_port"
++
++                if [ ! -e "${dev_uart_port}" ]; then
++                    echo; echo "ERROR: ${dev_uart_port} does not exist!"
++                    dev_uart_port=""
++                fi
++
++                if [ ! -e "${dev_bmc_port}" ]; then
++                    echo; echo "ERROR: ${dev_bmc_port} does not exist!"
++                    dev_bmc_port=""
++                fi
++
++                if [ "$dev_uart_port" = "$dev_bmc_port" ]; then
++                    echo; echo "ERROR: UART and BMC cannot be the same port: $dev_uart_port!"
++                    dev_uart_port=""
++                fi
++
++                if [ -n "$dev_uart_port" ] && [ -n "$dev_bmc_port" ]; then
++                    break
++                fi
++            fi
++
++            #if we didn't find a port and reached the timeout limit then ask to reconnect
++            if [ -z "$uart_port" ] && [ "$loopCount" = "10" ]; then
++                echo ""
++                echo "Unable to detect which port the board is connected to."
++                echo "Please reconnect your board."
++                prompt_feedback "Press 'y' to attempt to detect your board again or press 'n' to continue..." retryBoardDetection y
++            fi
++
++            #if they choose not to retry, ask user to reboot manually and exit
++            if [ "$retryBoardDetection" = "n" ]; then
++                echo ""
++                echo "Please reboot your board manually and connect using minicom."
++                exit;
++            fi
++        done
++
++        sed -i -e "s|^pu port.*$|pu port             $dev_uart_port|g" ${HOME}/.minirc.dfl
++    fi
++
++    echo
++    echo "--------------------------------------------------------------------------------"
++    echo "Would you like to run the setup script now (y/n)?"
++    echo
++    echo "Please connect the ethernet cable as described in the Quick Start Guide."
++    echo "Once answering 'y' on the prompt below, the script will proceed with"
++    echo "automatically booting and configuring the board based on the responses"
++    echo "provided."
++    echo
++    echo "After successfully executing this script, your EVM will be set up. You will be "
++    echo "able to connect to it by executing 'minicom -w' or if you prefer a windows host"
++    echo "you can set up Tera Term as explained in the Software Developer's Guide."
++    echo "If you connect minicom or Tera Term and power cycle the board Linux will boot."
++
++    prompt_feedback "" minicomsetup y
++
++    if [ "$minicomsetup" = "y" ]; then
++      create_bmc_scripts
++
++      cd $cwd
++
++      # Configuring bootmode to UART boot via BMC
++      screen -dmS minicom_${platform}_bmc minicom -D "$dev_bmc_port" -S bmcUartBoot.minicom -C bmcUartBoot.log
++
++      # Transfering uboot.bin using XMODEM protocol
++      sx -kb "$ubootimagesrc" < "$dev_uart_port" > "$dev_uart_port"
++
++      # Configure U-Boot environment and optionally flash board
++      minicom -D "$dev_uart_port" -S updateBoard.minicom -C updateBoard.log
++      rm "$tmp_fifo"
++
++      # Configuring bootmode to NAND boot via BMC
++      minicom -D "$dev_bmc_port" -S bmcNandBoot.minicom -C bmcNandBoot.log
++
++      # Running terminal to board (UART)
++      minicom -w -D "$dev_uart_port" -C bootBoard.log
++      cd -
++    fi
++
++    echo "You can manually run minicom in the future with this setup script using: minicom -S $cwd/setupBoard.minicom"
++    echo "--------------------------------------------------------------------------------"
++
++fi
+-- 
+1.9.1
+
diff --git a/0001-setup-targetfs-nfs-Modify-script-to-search-for-tisdk.patch b/0001-setup-targetfs-nfs-Modify-script-to-search-for-tisdk.patch
new file mode 100644
index 0000000..8423832
--- /dev/null
+++ b/0001-setup-targetfs-nfs-Modify-script-to-search-for-tisdk.patch
@@ -0,0 +1,47 @@
+From 8b64669ab1293dde690d68d72a90a606d23d36a3 Mon Sep 17 00:00:00 2001
+From: Aparna M <a-m1@ti.com>
+Date: Wed, 16 Feb 2022 12:58:04 +0530
+Subject: [PATCH 1/2] setup-targetfs-nfs: Modify script to search for
+ tisdk-default-image
+
+The tisdk-rootfs-image has been renamed to tisdk-default-image. Modify
+the script to search for the renamed default rootfs so the customer can
+pick the preferred rootfs to be installed.
+
+Signed-off-by: Aparna M <a-m1@ti.com>
+---
+ setup-targetfs-nfs.sh | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/setup-targetfs-nfs.sh b/setup-targetfs-nfs.sh
+index 8f7fbb1..8f89f0d 100644
+--- a/setup-targetfs-nfs.sh
++++ b/setup-targetfs-nfs.sh
+@@ -59,19 +59,19 @@ extract_fs() {
+     fstar=""
+     while [ -z "$fstar" ]
+     do
+-        numfs=`ls $cwd/../filesystem | grep "tisdk.*rootfs" | grep 'tar.xz' | grep -n '' | grep '2:' | awk {'print $1'}`
++        numfs=`ls $cwd/../filesystem | grep "tisdk.*rootfs\|tisdk.*default" | grep 'tar.xz' | grep -n '' | grep '2:' | awk {'print $1'}`
+         if [ -n "$numfs" ]
+         then
+             echo
+             echo "Multiple filesystems found."
+-            ls --sort=size $cwd/../filesystem | grep "tisdk.*rootfs" | grep 'tar.xz' | grep -n '' | awk {'print "       " , $1'}
++            ls --sort=size $cwd/../filesystem | grep "tisdk.*rootfs\|tisdk.*default" | grep 'tar.xz' | grep -n '' | awk {'print "       " , $1'}
+             echo
+-            read -p "Enter Number of rootfs Tarball: [1] " fsnum
++            read -p "Enter Number of rootfs Tarball: [1 or 2] " fsnum
+             [ -n "$fsnum" ] || fsnum=1
+             echo
+-            fstar=`ls --sort=size $cwd/../filesystem | grep "tisdk.*rootfs" | grep 'tar.xz' | grep -n '' | grep "^$fsnum:" | cut -c3- | awk {'print$1'}`
++            fstar=`ls --sort=size $cwd/../filesystem | grep "tisdk.*rootfs\|tisdk.*default" | grep 'tar.xz' | grep -n '' | grep "^$fsnum:" | cut -c3- | awk {'print$1'}`
+         else
+-            fstar=`ls  $cwd/../filesystem | grep "tisdk.*rootfs" | grep 'tar.xz' | awk {'print $1'}`
++            fstar=`ls  $cwd/../filesystem | grep "tisdk.*rootfs\|tisdk.*default" | grep 'tar.xz' | awk {'print $1'}`
+         fi
+         if [ -z "$fstar" ]
+         then
+-- 
+2.17.1
+
diff --git a/0002-setup-host-check-Support-only-Ubunut-18.04-as-host-O.patch b/0002-setup-host-check-Support-only-Ubunut-18.04-as-host-O.patch
new file mode 100644
index 0000000..eb8b990
--- /dev/null
+++ b/0002-setup-host-check-Support-only-Ubunut-18.04-as-host-O.patch
@@ -0,0 +1,33 @@
+From df419802217c59ae142bcd562c64cbe14567d00f Mon Sep 17 00:00:00 2001
+From: Aparna M <a-m1@ti.com>
+Date: Wed, 16 Feb 2022 13:11:00 +0530
+Subject: [PATCH 2/2] setup-host-check: Support only Ubunut 18.04 as host OS
+
+Modify script to support only Ubunut 18.04 as host OS
+
+Signed-off-by: Aparna M <a-m1@ti.com>
+---
+ setup-host-check.sh | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/setup-host-check.sh b/setup-host-check.sh
+index 45b4c71..1ca7c0a 100644
+--- a/setup-host-check.sh
++++ b/setup-host-check.sh
+@@ -39,10 +39,10 @@ echo "Verifying Linux host distribution"
+ 
+ get_host_type host
+ 
+-if [ "$host" != "precise" -a "$host" != "trusty" -a "$host" != "xenial"  -a "$host" != "bionic" ]; then
+-    echo "Unsupported host machine, only Ubuntu 12.04 LTS, Ubuntu 14.04 LTS, Ubuntu 16.04 LTS, and Ubuntu 18.04 LTS are supported"
++if [ "$host" != "bionic" ]; then
++    echo "Unsupported host Linux. Only Ubuntu 18.04 LTS is supported"
+     exit 1
+ fi
+-echo "Ubuntu 12.04 LTS, Ubuntu 14.04, or Ubuntu 14.04 LTS is being used, continuing.."
++echo "Ubuntu 18.04 LTS is being used, continuing.."
+ echo "--------------------------------------------------------------------------------"
+ echo
+-- 
+2.17.1
+
diff --git a/0006-setup-uboot-env-keystone-hs-use-default-env-for-net-.patch b/0006-setup-uboot-env-keystone-hs-use-default-env-for-net-.patch
new file mode 100644
index 0000000..4f45bf1
--- /dev/null
+++ b/0006-setup-uboot-env-keystone-hs-use-default-env-for-net-.patch
@@ -0,0 +1,53 @@
+From dcd49404bc974aaa77611a028fcfb6dfd8bd2b60 Mon Sep 17 00:00:00 2001
+From: Jacob Stiffler <j-stiffler@ti.com>
+Date: Wed, 13 Dec 2017 15:17:52 -0500
+Subject: [PATCH 6/6] setup-uboot-env-keystone-hs: use default env for net boot
+
+Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
+---
+ setup-uboot-env-keystone-hs.sh | 13 +++----------
+ 1 file changed, 3 insertions(+), 10 deletions(-)
+
+diff --git a/setup-uboot-env-keystone-hs.sh b/setup-uboot-env-keystone-hs.sh
+index 9eff80f..456bcd4 100755
+--- a/setup-uboot-env-keystone-hs.sh
++++ b/setup-uboot-env-keystone-hs.sh
+@@ -261,16 +261,10 @@ do_expect "\"stop autoboot:\"" "send \" \"" $cwd/setupBoard.minicom
+ # Set up the U-Boot environment
+ do_expect "\"$prompt\"" "send \"setenv serverip $ip\"" $cwd/setupBoard.minicom $cwd/updateBoard.minicom
+ do_expect "\"$prompt\"" "send \"setenv tftp_root '$tftproot'\"" $cwd/setupBoard.minicom $cwd/updateBoard.minicom
++do_expect "\"$prompt\"" "send \"setenv nfs_root '$rootpath'\"" $cwd/setupBoard.minicom $cwd/updateBoard.minicom
+ do_expect "\"$prompt\"" "send \"setenv name_uboot $ubootimage\"" $cwd/setupBoard.minicom $cwd/updateBoard.minicom
+ do_expect "\"$prompt\"" "send \"setenv fit_bootfile $fitimage\"" $cwd/setupBoard.minicom $cwd/updateBoard.minicom
+-do_expect "\"$prompt\"" "send \"setenv fit_loadaddr 0xc0000000\"" $cwd/setupBoard.minicom $cwd/updateBoard.minicom
+-do_expect "\"$prompt\"" "send \"setenv addr_mon 0xc08000\"" $cwd/setupBoard.minicom $cwd/updateBoard.minicom
+-do_expect "\"$prompt\"" "send \"setenv addr_mon_mkimg 0xc07ffc0\"" $cwd/setupBoard.minicom $cwd/updateBoard.minicom
+-do_expect "\"$prompt\"" "send \"setenv mon_size 0x1210\"" $cwd/setupBoard.minicom $cwd/updateBoard.minicom
+-do_expect "\"$prompt\"" "send \"setenv addr_mon 0xc08000\"" $cwd/setupBoard.minicom $cwd/updateBoard.minicom
+-do_expect "\"$prompt\"" "send \"setenv sec_bm_install 'go \${addr_mon}4 0xc084000 \${mon_size}; mon_install \${addr_mon_mkimg}'\"" $cwd/setupBoard.minicom $cwd/updateBoard.minicom
+-do_expect "\"$prompt\"" "send \"setenv loadimage 'dhcp \${fit_loadaddr} \${tftp_root}/\${fit_bootfile}'\"" $cwd/setupBoard.minicom $cwd/updateBoard.minicom
+-do_expect "\"$prompt\"" "send \"setenv bootcmd 'run sec_bm_install; run loadimage; bootm \${fit_loadaddr}#\${name_fdt}'\"" $cwd/setupBoard.minicom $cwd/updateBoard.minicom
++do_expect "\"$prompt\"" "send \"setenv boot net\"" $cwd/setupBoard.minicom $cwd/updateBoard.minicom
+ 
+ 
+ # Create command to fetch and flash u-boot and ubi
+@@ -287,7 +281,7 @@ do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom $cwd/updateBo
+ do_expect "\"$prompt\"" "send \"printenv\"" $cwd/setupBoard.minicom $cwd/updateBoard.minicom
+ 
+ if [ "$ubootupdate" = "y" ]; then
+-    do_expect "\"$prompt\"" "send \"run sec_bm_install\"" $cwd/updateBoard.minicom
++    do_expect "\"$prompt\"" "send \"run run_mon_hs\"" $cwd/updateBoard.minicom
+     do_expect "\"$prompt\"" "send \"run update_uboot\"" $cwd/updateBoard.minicom
+ fi
+ 
+@@ -440,7 +434,6 @@ if [ "$minicom" = "y" ]; then
+ 
+       # Configure U-Boot environment and optionally flash board
+       minicom -D "$dev_uart_port" -S updateBoard.minicom -C updateBoard.log
+-      rm "$tmp_fifo"
+ 
+       # Configuring bootmode to NAND boot via BMC
+       minicom -D "$dev_bmc_port" -S bmcNandBoot.minicom -C bmcNandBoot.log
+-- 
+1.9.1
+
diff --git a/0014-setup-host-check-Modify-script-to-support-only-Ubunu.patch b/0014-setup-host-check-Modify-script-to-support-only-Ubunu.patch
new file mode 100644
index 0000000..bd65fea
--- /dev/null
+++ b/0014-setup-host-check-Modify-script-to-support-only-Ubunu.patch
@@ -0,0 +1,34 @@
+From 910a589f904cfce8d6fe140c43134872d22a7eb0 Mon Sep 17 00:00:00 2001
+From: Aparna M <a-m1@ti.com>
+Date: Wed, 29 Sep 2021 16:22:34 +0530
+Subject: [PATCH] setup-host-check: Modify script to support only Ubunut 18.04
+ as host OS
+
+Modify script to support only Ubunut 18.04 as host OS for am64xx-evm
+
+Signed-off-by: Aparna M <a-m1@ti.com>
+---
+ setup-host-check.sh | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/setup-host-check.sh b/setup-host-check.sh
+index 45b4c71..df0d0b2 100644
+--- a/setup-host-check.sh
++++ b/setup-host-check.sh
+@@ -39,10 +39,10 @@ echo "Verifying Linux host distribution"
+ 
+ get_host_type host
+ 
+-if [ "$host" != "precise" -a "$host" != "trusty" -a "$host" != "xenial"  -a "$host" != "bionic" ]; then
+-    echo "Unsupported host machine, only Ubuntu 12.04 LTS, Ubuntu 14.04 LTS, Ubuntu 16.04 LTS, and Ubuntu 18.04 LTS are supported"
++if [ "$host" != "bionic" ]; then
++    echo "Unsupported host Linux. Only Ubuntu 18.04 LTS is supported"
+     exit 1
+ fi
+-echo "Ubuntu 12.04 LTS, Ubuntu 14.04, or Ubuntu 14.04 LTS is being used, continuing.."
++echo "Ubuntu 18.04 LTS is being used, continuing.."
+ echo "--------------------------------------------------------------------------------"
+ echo
+-- 
+2.17.1
+
diff --git a/0014-setup-targetfs-nfs-Modify-script-to-search-for-tisdk.patch b/0014-setup-targetfs-nfs-Modify-script-to-search-for-tisdk.patch
new file mode 100644
index 0000000..c7210ff
--- /dev/null
+++ b/0014-setup-targetfs-nfs-Modify-script-to-search-for-tisdk.patch
@@ -0,0 +1,47 @@
+From 7b2525cac2e44991e421fa288501110ab449dd13 Mon Sep 17 00:00:00 2001
+From: Aparna M <a-m1@ti.com>
+Date: Mon, 20 Dec 2021 11:37:21 +0530
+Subject: [PATCH] setup-targetfs-nfs: Modify script to search for
+ tisdk-default-image
+
+The tisdk-rootfs-image has been renamed to tisdk-default-image. Modify
+the script to search for the renamed default rootfs so the customer can
+pick the preferred rootfs to be installed.
+
+Signed-off-by: Aparna M <a-m1@ti.com>
+---
+ setup-targetfs-nfs.sh | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/setup-targetfs-nfs.sh b/setup-targetfs-nfs.sh
+index 8f7fbb1..8f89f0d 100644
+--- a/setup-targetfs-nfs.sh
++++ b/setup-targetfs-nfs.sh
+@@ -59,19 +59,19 @@ extract_fs() {
+     fstar=""
+     while [ -z "$fstar" ]
+     do
+-        numfs=`ls $cwd/../filesystem | grep "tisdk.*rootfs" | grep 'tar.xz' | grep -n '' | grep '2:' | awk {'print $1'}`
++        numfs=`ls $cwd/../filesystem | grep "tisdk.*rootfs\|tisdk.*default" | grep 'tar.xz' | grep -n '' | grep '2:' | awk {'print $1'}`
+         if [ -n "$numfs" ]
+         then
+             echo
+             echo "Multiple filesystems found."
+-            ls --sort=size $cwd/../filesystem | grep "tisdk.*rootfs" | grep 'tar.xz' | grep -n '' | awk {'print "       " , $1'}
++            ls --sort=size $cwd/../filesystem | grep "tisdk.*rootfs\|tisdk.*default" | grep 'tar.xz' | grep -n '' | awk {'print "       " , $1'}
+             echo
+-            read -p "Enter Number of rootfs Tarball: [1] " fsnum
++            read -p "Enter Number of rootfs Tarball: [1 or 2] " fsnum
+             [ -n "$fsnum" ] || fsnum=1
+             echo
+-            fstar=`ls --sort=size $cwd/../filesystem | grep "tisdk.*rootfs" | grep 'tar.xz' | grep -n '' | grep "^$fsnum:" | cut -c3- | awk {'print$1'}`
++            fstar=`ls --sort=size $cwd/../filesystem | grep "tisdk.*rootfs\|tisdk.*default" | grep 'tar.xz' | grep -n '' | grep "^$fsnum:" | cut -c3- | awk {'print$1'}`
+         else
+-            fstar=`ls  $cwd/../filesystem | grep "tisdk.*rootfs" | grep 'tar.xz' | awk {'print $1'}`
++            fstar=`ls  $cwd/../filesystem | grep "tisdk.*rootfs\|tisdk.*default" | grep 'tar.xz' | awk {'print $1'}`
+         fi
+         if [ -z "$fstar" ]
+         then
+-- 
+2.17.1
+
diff --git a/0015-create-sdcard-Fix-condition-for-printing-Boot-image-.patch b/0015-create-sdcard-Fix-condition-for-printing-Boot-image-.patch
new file mode 100644
index 0000000..f34691d
--- /dev/null
+++ b/0015-create-sdcard-Fix-condition-for-printing-Boot-image-.patch
@@ -0,0 +1,30 @@
+From 118751ce0feff3c998f258ba892981853bf6f112 Mon Sep 17 00:00:00 2001
+From: Aparna M <a-m1@ti.com>
+Date: Fri, 14 Jan 2022 14:56:49 +0530
+Subject: [PATCH] create-sdcard: Fix condition for printing Boot image not
+ found
+
+Fix condition for printing Boot image not found. sysfw.itb is now part
+of tiboot3.bin
+
+Signed-off-by: Aparna M <a-m1@ti.com>
+---
+ create-sdcard.sh | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/create-sdcard.sh b/create-sdcard.sh
+index 947d625..d93141d 100644
+--- a/create-sdcard.sh
++++ b/create-sdcard.sh
+@@ -1057,7 +1057,7 @@ if [ $BOOTPATHOPTION -eq 1 ] ; then
+ 
+ 	echo ""
+ 	#copy boot files out of board support
+-	if [ "$MLO" == "" ] && ( [ "$SPL_R5" == "" ] || [ "$SPL_A53" == "" ] || [ "$SYSFW" == "" ] ); then
++	if [ "$MLO" == "" ] && ( [ "$SPL_R5" == "" ] || [ "$SPL_A53" == "" ] ) ; then
+ 		echo "Boot image not found"
+ 	fi
+ 
+-- 
+2.17.1
+
diff --git a/setup-uboot-env-keystone-hs.sh b/setup-uboot-env-keystone-hs.sh
new file mode 100755
index 0000000..0c47ab2
--- /dev/null
+++ b/setup-uboot-env-keystone-hs.sh
@@ -0,0 +1,449 @@
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
+fitimage="fitImage-linux.bin-"$platform".itb"
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
+do_expect "\"$prompt\"" "send \"setenv nfs_root '$rootpath'\"" $cwd/setupBoard.minicom $cwd/updateBoard.minicom
+do_expect "\"$prompt\"" "send \"setenv name_uboot $ubootimage\"" $cwd/setupBoard.minicom $cwd/updateBoard.minicom
+do_expect "\"$prompt\"" "send \"setenv fit_bootfile $fitimage\"" $cwd/setupBoard.minicom $cwd/updateBoard.minicom
+do_expect "\"$prompt\"" "send \"setenv boot net\"" $cwd/setupBoard.minicom $cwd/updateBoard.minicom
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
+    do_expect "\"$prompt\"" "send \"run run_mon_hs\"" $cwd/updateBoard.minicom
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

