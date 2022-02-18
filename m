Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.7475.1645161485402473922
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 17 Feb 2022 21:18:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=YKVXkXU9;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: a-m1@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21I5I4WJ002927
	for <meta-arago@lists.yoctoproject.org>; Thu, 17 Feb 2022 23:18:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1645161484;
	bh=re9ZBNodA5n/W1hFRdrrMiR6cBf0hj6bnGayM0/IlAo=;
	h=From:To:CC:Subject:Date;
	b=YKVXkXU9KX435kCREngstrP1n/rmXi00bJXiBrSHUYZ+P4ENuEDTx7Uo2qySJuC9x
	 HdRl2HzbGf/ll78ru+zxpY8K9DcfmGcBhiGMu7ur9JAkp6K6ngcEsBt7WbO5IAzbsz
	 jVaN240rUf+JqDPleiu5X/BfFd/DGluK8Z6jjHEo=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21I5I28n077588
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Thu, 17 Feb 2022 23:18:04 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 17
 Feb 2022 23:18:03 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 17 Feb 2022 23:18:03 -0600
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21I5I0Sp127079;
	Thu, 17 Feb 2022 23:18:01 -0600
From: "Aparna M" <a-m1@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>, <yogeshs@ti.com>,
        <reatmon@ti.com>
CC: <nikhil.nd@ti.com>, <nsekhar@ti.com>
Subject: [meta-arago][tisdk-setup-scripts][master][PATCH] setup-uboot-env-k2g-hs-evm: Add u-boot env setup for k2g-hs EVM
Date: Fri, 18 Feb 2022 10:47:58 +0530
Message-ID: <20220218051758.23099-1-a-m1@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Add u-boot env setup for k2g-hs EVM

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>

Signed-off-by: Aparna M <a-m1@ti.com>
---
 setup-uboot-env-k2g-hs-evm.sh | 242 ++++++++++++++++++++++++++++++++++
 1 file changed, 242 insertions(+)
 create mode 100755 setup-uboot-env-k2g-hs-evm.sh

diff --git a/setup-uboot-env-k2g-hs-evm.sh b/setup-uboot-env-k2g-hs-evm.sh
new file mode 100755
index 0000000..416abf1
--- /dev/null
+++ b/setup-uboot-env-k2g-hs-evm.sh
@@ -0,0 +1,242 @@
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
+# Configure prompt for U-Boot 2016.05
+prompt="=>"
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
+fitimage="fitImage-linux.bin-"$platform".itb"
+fitimagesrc=`ls -1 $cwd/../board-support/prebuilt-images/$fitimage`
+fitimagedefault=`basename $fitimagesrc`
+
+
+echo "Select fit image location:"
+echo " 1: TFTP"
+echo " 2: SD card"
+echo " 3: NFS"
+echo
+read -p "[ 1 ] " fit
+
+if [ ! -n "$fit" ]; then
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
+else
+    fitimage="fitImage"
+fi
+
+
+echo "timeout 300" > $cwd/setupBoard.minicom
+echo "verbose on" >> $cwd/setupBoard.minicom
+do_expect "\"stop autoboot:\"" "send \" \"" $cwd/setupBoard.minicom
+do_expect "\"$prompt\"" "send \"env default -f -a\"" $cwd/setupBoard.minicom
+do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom
+do_expect "\"$prompt\"" "send \"reset\"" $cwd/setupBoard.minicom
+do_expect "\"stop autoboot:\"" "send \" \"" $cwd/setupBoard.minicom
+
+do_expect "\"$prompt\"" "send \"setenv serverip $ip\"" $cwd/setupBoard.minicom
+do_expect "\"$prompt\"" "send \"setenv tftp_root '$tftproot'\"" $cwd/setupBoard.minicom
+do_expect "\"$prompt\"" "send \"setenv fit_bootfile $fitimage\"" $cwd/setupBoard.minicom
+do_expect "\"$prompt\"" "send \"setenv nfs_root '$rootpath'\"" $cwd/setupBoard.minicom
+
+if [ "$fit" -eq "1" ]; then
+    do_expect "\"$prompt\"" "send \"setenv kern_mode net\"" $cwd/setupBoard.minicom
+elif [ "$fit" -eq "2" ]; then
+    do_expect "\"$prompt\"" "send \"setenv kern_mode mmc\"" $cwd/setupBoard.minicom
+else
+    do_expect "\"$prompt\"" "send \"setenv kern_mode nfs\"" $cwd/setupBoard.minicom
+fi
+
+if [ "$fs" -eq "1" ]; then
+    do_expect "\"$prompt\"" "send \"setenv fs_mode nfs\"" $cwd/setupBoard.minicom
+else
+    do_expect "\"$prompt\"" "send \"setenv fs_mode mmc\"" $cwd/setupBoard.minicom
+fi
+do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom
+
+# This may be a little confusing, but the SDK's uEnv.txt uses uenvcmd to boot
+# into linux. This is because the default U-Boot environment is not sufficient.
+do_expect "\"$prompt\"" "send \"boot\"" $cwd/setupBoard.minicom
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
2.17.1

