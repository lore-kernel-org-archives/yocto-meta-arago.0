Return-Path: <jake@udc0866934>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 3E8DF52A5B
	for <meta-arago@arago-project.org>;
	Tue,  8 Dec 2015 14:25:00 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id tB8EOw9j014593
	for <meta-arago@arago-project.org>; Tue, 8 Dec 2015 08:24:58 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id tB8EOvIB031361
	for <meta-arago@arago-project.org>; Tue, 8 Dec 2015 08:24:57 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 8 Dec 2015 08:24:57 -0600
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id tB8EOvRP024364;
	Tue, 8 Dec 2015 08:24:57 -0600
Received: from jake by udc0866934 with local (Exim 4.82)	(envelope-from
	<jake@udc0866934>)	id 1a6JCL-0000Wr-2K; Tue, 08 Dec 2015 09:24:57 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 8 Dec 2015 09:24:50 -0500
Message-ID: <1449584690-1999-5-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [tisdk-setup-scripts][PATCH v2 5/5] setup-uboot-env-k2g-evm: Add u-boot setup for k2g-evm
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
X-List-Received-Date: Tue, 08 Dec 2015 14:25:07 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
v2 changes:
* Run "envboot" as part of the bootcmd to get contents of uEnv.txt

 setup-uboot-env-k2g-evm.sh | 253 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 253 insertions(+)
 create mode 100755 setup-uboot-env-k2g-evm.sh

diff --git a/setup-uboot-env-k2g-evm.sh b/setup-uboot-env-k2g-evm.sh
new file mode 100755
index 0000000..3e8c1db
--- /dev/null
+++ b/setup-uboot-env-k2g-evm.sh
@@ -0,0 +1,253 @@
+#!/bin/sh
+
+# This distribution contains contributions or derivatives under copyright
+# as follows:
+#
+# Copyright (c) 2015, Texas Instruments Incorporated
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
+    echo "    timeout 600 goto end" >> $3
+    echo "}" >> $3
+    check_status
+    echo $2 >> $3
+    check_status
+    echo >> $3
+}
+
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
+echo
+echo "--------------------------------------------------------------------------------"
+echo "This step will set up the u-boot variables for booting the EVM."
+echo "--------------------------------------------------------------------------------"
+
+ipdefault=`ifconfig | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d: -f2 | awk '{ print $1 }'`
+platform=`grep PLATFORM= $cwd/../Rules.make | cut -d= -f2`
+
+echo "Autodetected the following ip address of your host, correct it if necessary"
+read -p "[ $ipdefault ] " ip
+echo
+
+if [ ! -n "$ip" ]; then
+    ip=$ipdefault
+fi
+
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
+
+kernelimage="zImage-""$platform"".bin"
+kernelimagesrc=`ls -1 $cwd/../board-support/prebuilt-images/$kernelimage`
+kernelimagedefault=`basename $kernelimagesrc`
+
+ubootimage="u-boot-spi-${platform}.gph"
+
+ubifsimage="tisdk-server-rootfs-image-${platform}.ubi"
+ubifsimagesrc=`ls -1 $cwd/../filesystem/$ubifsimage`
+ubifsimagedefault=`basename $ubifsimagesrc`
+
+prebuiltimagesdir=`cd $cwd/../filesystem/ ; echo $PWD`
+ubifsimages=`cd $prebuiltimagesdir;ls -1 *.ubi 2> /dev/null`
+copy_to_tftproot "$ubifsimages"
+
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
+if [ "$kernel" -eq "1" ]; then
+    echo
+    echo "Available kernel images in $tftproot:"
+    for file in $tftproot/*; do
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
+    kernelimage=zImage
+fi
+
+echo "timeout 300" > $cwd/setupBoard.minicom
+echo "verbose on" >> $cwd/setupBoard.minicom
+do_expect "\"stop autoboot:\"" "send \" \"" $cwd/setupBoard.minicom
+do_expect "\"U-Boot#\"" "send \"env default -f -a\"" $cwd/setupBoard.minicom
+do_expect "\"U-Boot#\"" "send \"saveenv\"" $cwd/setupBoard.minicom
+do_expect "\"U-Boot#\"" "send \"reset\"" $cwd/setupBoard.minicom
+do_expect "\"stop autoboot:\"" "send \" \"" $cwd/setupBoard.minicom
+
+do_expect "\"U-Boot#\"" "send \"setenv serverip $ip\"" $cwd/setupBoard.minicom
+do_expect "\"U-Boot#\"" "send \"setenv tftp_root '$tftproot'\"" $cwd/setupBoard.minicom
+do_expect "\"U-Boot#\"" "send \"setenv nfs_root '$rootpath'\"" $cwd/setupBoard.minicom
+do_expect "\"U-Boot#\"" "send \"setenv name_ubi $ubifsimage\"" $cwd/setupBoard.minicom
+do_expect "\"U-Boot#\"" "send \"setenv name_kern $kernelimage\"" $cwd/setupBoard.minicom
+do_expect "\"U-Boot#\"" "send \"setenv name_uboot $ubootimage\"" $cwd/setupBoard.minicom
+
+do_expect "\"U-Boot#\"" "send \"setenv bootcmd 'run envboot; run init_\${fs_mode} get_pmmc_\${kern_mode} run_pmmc get_fdt_\${kern_mode} get_mon_\${kern_mode} get_kern_\${kern_mode} run_mon run_kern'\"" $cwd/setupBoard.minicom
+
+do_expect "\"U-Boot#\"" "send \"saveenv\"" $cwd/setupBoard.minicom
+
+if [ "$kernel" -eq "1" ]; then
+	#TFTP
+	do_expect "\"U-Boot#\"" "send \"setenv kern_mode net\"" $cwd/setupBoard.minicom
+else
+	#SD
+	do_expect "\"U-Boot#\"" "send \"setenv kern_mode mmc\"" $cwd/setupBoard.minicom
+fi
+
+if [ "$fs" -eq "1" ]; then
+	#NFS
+	do_expect "\"U-Boot#\"" "send \"setenv fs_mode net\"" $cwd/setupBoard.minicom
+else
+	#SD
+	do_expect "\"U-Boot#\"" "send \"setenv fs_mode mmc\"" $cwd/setupBoard.minicom
+fi
+
+do_expect "\"U-Boot#\"" "send \"saveenv\"" $cwd/setupBoard.minicom
+do_expect "\"U-Boot#\"" "send \"boot\"" $cwd/setupBoard.minicom
+
+echo "end:" >> $cwd/setupBoard.minicom
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
+    echo "Would you like to run the setup script now (y/n)? This requires you to connect"
+    echo "the RS-232 cable between your host and EVM as well as your ethernet cable as"
+    echo "described in the Quick Start Guide. Once answering 'y' on the prompt below"
+    echo "you will have 300 seconds to connect the board and power cycle it"
+    echo "before the setup times out"
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


