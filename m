Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.2210.1645032811215976686
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 16 Feb 2022 09:33:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=f4fEp2O/;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: a-m1@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21GHXT9w025358
	for <meta-arago@lists.yoctoproject.org>; Wed, 16 Feb 2022 11:33:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1645032809;
	bh=GXmcxlgN5j/vaSTLs87M0BYczIM0pL37X8K61G7MUjY=;
	h=From:To:CC:Subject:Date;
	b=f4fEp2O/9VreB7ubEZictYs8vPkP8G/sAUZTYGVT18KAPdGWke1MlrvOu6HBD8H/U
	 x9cQogvEIrBEfKQnM3nDjnfPFf7vZlu6YGVY7OZCw7etCROm3ci4gXgsHiIeOPvjmw
	 WYBIKaptKKMM0da9HdGLUwmoisW78BuOVhbpGggE=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21GHXTvL117166
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 16 Feb 2022 11:33:29 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 16
 Feb 2022 11:33:28 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 16 Feb 2022 11:33:28 -0600
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21GHXQoH007459;
	Wed, 16 Feb 2022 11:33:26 -0600
From: "Aparna M" <a-m1@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>, <yogeshs@ti.com>
CC: <nikhil.nd@ti.com>, <nsekhar@ti.com>
Subject: [meta-arago][tisdk-setup-scripts][master][PATCH v2] setup-tftp-fit: Add support for HS EVMs
Date: Wed, 16 Feb 2022 23:03:23 +0530
Message-ID: <20220216173323.8588-1-a-m1@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Add tftp setup support for HS EVMs.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>

Signed-off-by: Aparna M <a-m1@ti.com>
---

Changes from v1:

* Copy firmware for k2g hs

 setup-tftp-fit.sh | 151 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 151 insertions(+)
 create mode 100644 setup-tftp-fit.sh

diff --git a/setup-tftp-fit.sh b/setup-tftp-fit.sh
new file mode 100644
index 0000000..c95bc09
--- /dev/null
+++ b/setup-tftp-fit.sh
@@ -0,0 +1,151 @@
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
+tftpcfg=/etc/xinetd.d/tftp
+tftprootdefault=/tftpboot
+
+tftp() {
+    echo "
+service tftp
+{
+protocol = udp
+port = 69
+socket_type = dgram
+wait = yes
+user = nobody
+server = /usr/sbin/in.tftpd
+server_args = $tftproot
+disable = no
+}
+" | sudo tee $tftpcfg > /dev/null
+     check_status
+     echo
+     echo "$tftpcfg successfully created"
+}
+
+prebuiltimagesdir=`cd $cwd/../board-support/prebuilt-images/ ; echo $PWD`
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
+echo "--------------------------------------------------------------------------------"
+echo "Which directory do you want to be your tftp root directory?(if this directory does not exist it will be created for you)"
+read -p "[ $tftprootdefault ] " tftproot
+
+if [ ! -n "$tftproot" ]; then
+    tftproot=$tftprootdefault
+fi
+echo $tftproot > $cwd/../.tftproot
+echo "--------------------------------------------------------------------------------"
+
+echo
+echo "--------------------------------------------------------------------------------"
+echo "This step will set up the tftp server in the $tftproot directory."
+echo
+echo "Note! This command requires you to have administrator priviliges (sudo access) "
+echo "on your host."
+read -p "Press return to continue" REPLY
+
+if [ -d $tftproot ]; then
+    echo
+    echo "$tftproot already exists, not creating.."
+else
+    sudo mkdir -p $tftproot
+    check_status
+    sudo chmod 777 $tftproot
+    check_status
+    sudo chown nobody $tftproot
+    check_status
+fi
+
+platform=`cat $cwd/../Rules.make | grep -e "^PLATFORM=" | cut -d= -f2`
+itbfiles=`cd $prebuiltimagesdir;ls -1 *.itb`
+copy_to_tftproot "$itbfiles"
+
+uboot_files=`cd $prebuiltimagesdir;ls -1 u-boot_HS_MLO* 2> /dev/null`
+copy_to_tftproot "$uboot_files"
+
+fw_files=`cd $prebuiltimagesdir;ls -1 *firmware*.bin 2> /dev/null`
+copy_to_tftproot "$fw_files"
+
+echo
+if [ -f $tftpcfg ]; then
+    echo "$tftpcfg already exists.."
+
+    #Use = instead of == for POSIX and dash shell compliance
+    if [ "`cat $tftpcfg | grep server_args | cut -d= -f2 | sed 's/^[ ]*//'`" \
+          = "$tftproot" ]; then
+        echo "$tftproot already exported for TFTP, skipping.."
+    else
+        echo "Copying old $tftpcfg to $tftpcfg.old"
+        sudo cp $tftpcfg $tftpcfg.old
+        check_status
+        tftp
+    fi
+else
+    tftp
+fi
+
+echo
+echo "Restarting tftp server"
+sudo /etc/init.d/xinetd stop
+check_status
+sleep 1
+sudo /etc/init.d/xinetd start
+check_status
+echo "--------------------------------------------------------------------------------"
-- 
2.17.1

