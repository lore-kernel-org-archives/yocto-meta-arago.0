Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D891ECAAD3
	for <webhook@archiver.kernel.org>; Mon, 19 Sep 2022 11:15:17 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web12.18471.1663586107839284858
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 19 Sep 2022 04:15:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=yoSGikYQ;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: p-bhagat@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 28JBF68S014667
	for <meta-arago@lists.yoctoproject.org>; Mon, 19 Sep 2022 06:15:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1663586106;
	bh=3PQShrApELBWRbCAxhMkmjixaKBhyEY7jAo0cb4qanE=;
	h=From:To:CC:Subject:Date;
	b=yoSGikYQW7EVoqKlvSoTrX+F0UI1uPWgGI5wtkD1if00fXBU8JGFu/Wx3MFvIXn7G
	 jVgGg7aQ+0chjvvKte9o7AtDiZ/8jTxSfJO5SgDneGSNvvbadSHM9TIcwGJbx9RB0P
	 djEbKP8X26er8j29OzmMUH1E8WBSUcY1mwT94F9M=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 28JBF6Ra007950
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Mon, 19 Sep 2022 06:15:06 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Mon, 19
 Sep 2022 06:15:06 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Mon, 19 Sep 2022 06:15:06 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 28JBF5ow050950;
	Mon, 19 Sep 2022 06:15:06 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>, <reatmon@ti.com>
CC: <c-shilwant@ti.com>, <s-adivi@ti.com>
Subject: [[meta-arago][tisdk-setup-scripts][master][PATCH]] setup.sh : Make
 Linux SDK setup script interactive
Date: Mon, 19 Sep 2022 16:44:46 +0530
Message-ID: <20220919111446.21263-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 19 Sep 2022 11:15:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14039

- Add functionality to tell what setup.sh is about to run and give option to either select or skip that step.
- Jira - https://jira.itg.ti.com/browse/SITREQ-795

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 setup.sh | 133 ++++++++++++++++++++++++++++++++++++++++---------------
 1 file changed, 98 insertions(+), 35 deletions(-)

diff --git a/setup.sh b/setup.sh
index fc4c6c7..f002e72 100644
--- a/setup.sh
+++ b/setup.sh
@@ -50,6 +50,58 @@ how to develop software on the EVM
 EOF
 }
 
+
+
+run_package_install() {
+	if [ -f $cwd/bin/setup-package-install.sh ]; then
+     		$cwd/bin/setup-package-install.sh
+     		check_status
+	else
+    		echo "setup-package-install.sh does not exist in the bin directory"
+    		exit 1
+	fi
+}
+
+run_target_nfs() {
+	if [ -f $cwd/bin/setup-targetfs-nfs.sh ]; then
+    		$cwd/bin/setup-targetfs-nfs.sh
+    		check_status
+	else
+    		echo "setup-targetfs-nfs.sh does not exist in the bin directory"
+    		exit 1
+	fi
+}
+
+run_tftp() {
+	if [ -f $cwd/bin/setup-tftp.sh ]; then
+    		$cwd/bin/setup-tftp.sh
+    		check_status
+	else
+    		echo "setup-tftp.sh does not exist in the bin directory"
+    		exit 1
+	fi
+}
+
+run_minicom() {
+	if [ -f $cwd/bin/setup-minicom.sh ]; then
+    		$cwd/bin/setup-minicom.sh
+    		check_status
+	else
+    		echo "setup-minicom.sh does not exist in the bin directory"
+    		exit 1
+	fi
+}
+
+run_uboot() {
+	if [ -f $cwd/bin/setup-uboot-env.sh ]; then
+    		$cwd/bin/setup-uboot-env.sh
+    		check_status
+	else
+    		echo "setup-uboot-env.sh does not exist in the bin directory"
+    		exit 1
+	fi
+}
+
 cwd=`dirname $0`
 # Minimum major Linux version for running add-to-group script
 min_ver_upper=12
@@ -86,45 +138,56 @@ if [ "$host_upper" -gt "$min_ver_upper" -o "$host_upper" -eq "$min_ver_upper" ];
     fi
 fi
 
-if [ -f $cwd/bin/setup-package-install.sh ]; then
-     $cwd/bin/setup-package-install.sh
-     check_status
-else
-    echo "setup-package-install.sh does not exist in the bin directory"
-    exit 1
-fi
 
-if [ -f $cwd/bin/setup-targetfs-nfs.sh ]; then
-    $cwd/bin/setup-targetfs-nfs.sh
-    check_status
-else
-    echo "setup-targetfs-nfs.sh does not exist in the bin directory"
-    exit 1
-fi
+while true; do
+    read -p "Do you wish to install required host packages (Press (Y) to run, (n) to skip)? " -r response
+    case $response in
+        [Yy]* ) run_package_install; break;;
+        [Nn]* ) echo "host packages installation skipped"; break;;
+	   "" ) run_package_install; break;; 
+	    * )  echo "Enter Y/n";;
+    esac
+done
 
-if [ -f $cwd/bin/setup-tftp.sh ]; then
-    $cwd/bin/setup-tftp.sh
-    check_status
-else
-    echo "setup-tftp.sh does not exist in the bin directory"
-    exit 1
-fi
+while true; do
+    read -p "Do you wish to run nfs setup (Press (Y) to run, (n) to skip) ? " -r response
+    case $response in
+        [Yy]* ) run_target_nfs; break;;
+        [Nn]* ) echo "nfs setup skipped"; break;;
+	   "" ) run_target_nfs; break;;
+	    * )  echo "Enter Y/n";;
+    esac
+done
 
-if [ -f $cwd/bin/setup-minicom.sh ]; then
-    $cwd/bin/setup-minicom.sh
-    check_status
-else
-    echo "setup-minicom.sh does not exist in the bin directory"
-    exit 1
-fi
+while true; do
+    read -p "Do you wish to run tftp setup (Press (Y) to run, (n) to skip) ? " -r response
+    case $response in
+        [Yy]* ) run_tftp; break;;
+        [Nn]* ) echo "tftp setup skipped"; break;;
+	   "" ) run_tftp; break;;
+	    * )  echo "Enter Y/n";;
+    esac
+done
 
-if [ -f $cwd/bin/setup-uboot-env.sh ]; then
-    $cwd/bin/setup-uboot-env.sh
-    check_status
-else
-    echo "setup-uboot-env.sh does not exist in the bin directory"
-    exit 1
-fi
+while true; do
+    read -p "Do you wish to run minicom setup (Press (Y) to run, (n) to skip) ? " -r response
+    case $response in
+        [Yy]* ) run_minicom; break;;
+        [Nn]* ) echo "minicom setup skipped"; break;;
+	   "" ) run_minicom; break;;
+	    * )  echo "Enter Y/n";;
+    esac
+done
+
+while true; do
+    read -p "Do you wish to run uboot setup (Press (Y) to run, (n) to skip) ? " -r response
+    case $response in
+        [Yy]* ) run_uboot; break;;
+        [Nn]* ) echo "uboot setup skipped"; break;;
+	   "" ) run_uboot; break;;
+	    * )  echo "Enter Y/n";;
+    esac
+done
 
 # Publish the TISDK exit header
 exit_footer
-- 
2.17.1


