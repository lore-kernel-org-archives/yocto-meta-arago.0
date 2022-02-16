Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.9885.1645004068270684290
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 16 Feb 2022 01:34:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=mbsuMvZf;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: a-m1@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21G9YRhA011151
	for <meta-arago@lists.yoctoproject.org>; Wed, 16 Feb 2022 03:34:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1645004067;
	bh=tgFMyHHhyZXHzWq1ACXCtcRkkSuDebqsUAnb1qTo6Ek=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=mbsuMvZfXd28TC5j2BcsRqaSUfCwQYsP1m5AHHxiV0C009JF7TVtx6biSIJxLjWUc
	 JKyEUnmAHKILUHLcxcqCXAuc367ykdLKQt+49/CN5RhMLTN7+8kge8M81uqXWbCI4J
	 2N59TVnWiS+XCxKlApxoY+QqMh4U+WGklPOwEyhY=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21G9YRKG118550
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 16 Feb 2022 03:34:27 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 16
 Feb 2022 03:34:27 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 16 Feb 2022 03:34:27 -0600
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21G9YLmG120916;
	Wed, 16 Feb 2022 03:34:25 -0600
From: "Aparna M" <a-m1@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>
CC: <nikhil.nd@ti.com>, <nsekhar@ti.com>
Subject: [meta-arago][tisdk-setup-scripts][master][PATCH 1/4] setup-uboot-env-am43x-hs: Add u-boot env setup support for am43x-hs
Date: Wed, 16 Feb 2022 15:04:11 +0530
Message-ID: <20220216093414.5085-2-a-m1@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220216093414.5085-1-a-m1@ti.com>
References: <20220216093414.5085-1-a-m1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Add u-boot env setup support for am43x-hs

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>

Signed-off-by: Aparna M <a-m1@ti.com>
---
 setup-uboot-env-am43x-hs.sh | 165 ++++++++++++++++++++++++++++++++++++
 1 file changed, 165 insertions(+)
 create mode 100644 setup-uboot-env-am43x-hs.sh

diff --git a/setup-uboot-env-am43x-hs.sh b/setup-uboot-env-am43x-hs.sh
new file mode 100644
index 0000000..7b67a65
--- /dev/null
+++ b/setup-uboot-env-am43x-hs.sh
@@ -0,0 +1,165 @@
+#!/bin/sh
+
+# This distribution contains contributions or derivatives under copyright
+# as follows:
+#
+# Copyright (c) 2014, Texas Instruments Incorporated
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
+echo
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
+
+#This is an AM437x GP/EPOS EVM and thus has a NAND. Flash information to NAND.
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
+
-- 
2.17.1

