Return-Path: <a0866934local@udb0866934>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 1A12B529E0
	for <meta-arago@arago-project.org>;
	Wed,  8 Apr 2015 19:28:47 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t38JSkdl030774
	for <meta-arago@arago-project.org>; Wed, 8 Apr 2015 14:28:46 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t38JSjpk019182
	for <meta-arago@arago-project.org>; Wed, 8 Apr 2015 14:28:45 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 8 Apr 2015 14:28:44 -0500
Received: from udb0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t38JSiK4027821;
	Wed, 8 Apr 2015 14:28:44 -0500
Received: from a0866934local by udb0866934 with local (Exim 4.76)
	(envelope-from <a0866934local@udb0866934>)	id 1YfveV-0000QO-TJ;
	Wed, 08 Apr 2015 15:28:43 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 8 Apr 2015 15:28:33 -0400
Message-ID: <1428521313-1602-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [tisdk-setup-scripts][PATCH] setup-uboot: Reset to default environment.
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
X-List-Received-Date: Wed, 08 Apr 2015 19:28:47 -0000
Content-Type: text/plain

* Prevent any previous settings from corrupting the setup.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 setup-uboot-env-am18x.sh       |    1 +
 setup-uboot-env-am335x.sh      |    1 +
 setup-uboot-env-am3517.sh      |    1 +
 setup-uboot-env-am37x.sh       |    1 +
 setup-uboot-env-am43x.sh       |    1 +
 setup-uboot-env-am57xx-evm.sh  |    1 +
 setup-uboot-env-beagleboard.sh |    1 +
 setup-uboot-env-omap5.sh       |    1 +
 8 files changed, 8 insertions(+)

diff --git a/setup-uboot-env-am18x.sh b/setup-uboot-env-am18x.sh
index 5ee813e..a357b78 100644
--- a/setup-uboot-env-am18x.sh
+++ b/setup-uboot-env-am18x.sh
@@ -226,6 +226,7 @@ if [ "$minicom" = "y" ]; then
     echo "verbose on" >> $minicomfilepath
     echo >> $minicomfilepath
     do_expect "\"stop autoboot:\"" "send \"\"" $minicomfilepath
+    do_expect "\"$prompt\"" "send \"env default -f -a\"" $minicomfilepath
     do_expect "\"$prompt\"" "send \"setenv bootdelay 4\"" $minicomfilepath
     do_expect "\"$prompt\"" "send \"setenv baudrate 115200\"" $minicomfilepath
     do_expect "\"ENTER ...\"" "send \"\"" $minicomfilepath
diff --git a/setup-uboot-env-am335x.sh b/setup-uboot-env-am335x.sh
index b3be574..be8d4de 100644
--- a/setup-uboot-env-am335x.sh
+++ b/setup-uboot-env-am335x.sh
@@ -172,6 +172,7 @@ echo "timeout 300" > $cwd/setupBoard.minicom
 echo "verbose on" >> $cwd/setupBoard.minicom
 
 do_expect "\"stop autoboot:\"" "send \" \"" $cwd/setupBoard.minicom
+do_expect "\"U-Boot#\"" "send \"env default -f -a\"" $cwd/setupBoard.minicom
 if [ "$kernel" -eq "1" ]; then
 	if [ "$fs" -eq "1" ]; then
 		#TFTP and NFS Boot
diff --git a/setup-uboot-env-am3517.sh b/setup-uboot-env-am3517.sh
index f9ef134..ddb1a15 100644
--- a/setup-uboot-env-am3517.sh
+++ b/setup-uboot-env-am3517.sh
@@ -189,6 +189,7 @@ if [ "$minicom" = "y" ]; then
     echo "verbose on" >> $minicomfilepath
     echo >> $minicomfilepath
     do_expect "\"stop autoboot:\"" "send \"\"" $minicomfilepath
+    do_expect "\"$prompt\"" "send \"env default -f -a\"" $minicomfilepath
     do_expect "\"$prompt\"" "send \"setenv bootdelay 3\"" $minicomfilepath
     do_expect "\"$prompt\"" "send \"setenv baudrate 115200\"" $minicomfilepath
     do_expect "\"ENTER ...\"" "send \"\"" $minicomfilepath
diff --git a/setup-uboot-env-am37x.sh b/setup-uboot-env-am37x.sh
index 0476483..de4db1a 100644
--- a/setup-uboot-env-am37x.sh
+++ b/setup-uboot-env-am37x.sh
@@ -189,6 +189,7 @@ if [ "$minicom" = "y" ]; then
     echo "verbose on" >> $minicomfilepath
     echo >> $minicomfilepath
     do_expect "\"stop autoboot:\"" "send \"\"" $minicomfilepath
+    do_expect "\"$prompt\"" "send \"env default -f -a\"" $minicomfilepath
     do_expect "\"$prompt\"" "send \"setenv bootdelay 3\"" $minicomfilepath
     do_expect "\"$prompt\"" "send \"setenv baudrate 115200\"" $minicomfilepath
     do_expect "\"ENTER ...\"" "send \"\"" $minicomfilepath
diff --git a/setup-uboot-env-am43x.sh b/setup-uboot-env-am43x.sh
index 282ffc1..170a87d 100644
--- a/setup-uboot-env-am43x.sh
+++ b/setup-uboot-env-am43x.sh
@@ -126,6 +126,7 @@ fi
 echo "timeout 300" > $cwd/setupBoard.minicom
 echo "verbose on" >> $cwd/setupBoard.minicom
 do_expect "\"stop autoboot:\"" "send \" \"" $cwd/setupBoard.minicom
+do_expect "\"U-Boot#\"" "send \"env default -f -a\"" $cwd/setupBoard.minicom
 if [ "$kernel" -eq "1" ]; then
 	if [ "$fs" -eq "1" ]; then
 		#TFTP and NFS Boot
diff --git a/setup-uboot-env-am57xx-evm.sh b/setup-uboot-env-am57xx-evm.sh
index 4707fa8..9828f91 100644
--- a/setup-uboot-env-am57xx-evm.sh
+++ b/setup-uboot-env-am57xx-evm.sh
@@ -122,6 +122,7 @@ fi
 echo "timeout 300" > $cwd/setupBoard.minicom
 echo "verbose on" >> $cwd/setupBoard.minicom
 do_expect "\"stop autoboot:\"" "send \" \"" $cwd/setupBoard.minicom
+do_expect "\"U-Boot#\"" "send \"env default -f -a\"" $cwd/setupBoard.minicom
 if [ "$kernel" -eq "1" ]; then
 	if [ "$fs" -eq "1" ]; then
 		#TFTP and NFS Boot
diff --git a/setup-uboot-env-beagleboard.sh b/setup-uboot-env-beagleboard.sh
index 97a34db..6c74b7e 100644
--- a/setup-uboot-env-beagleboard.sh
+++ b/setup-uboot-env-beagleboard.sh
@@ -189,6 +189,7 @@ if [ "$minicom" = "y" ]; then
     echo "verbose on" >> $minicomfilepath
     echo >> $minicomfilepath
     do_expect "\"stop autoboot:\"" "send \"\"" $minicomfilepath
+    do_expect "\"$prompt\"" "send \"env default -f -a\"" $minicomfilepath
     do_expect "\"$prompt\"" "send \"setenv bootdelay 3\"" $minicomfilepath
     do_expect "\"$prompt\"" "send \"setenv baudrate 115200\"" $minicomfilepath
     do_expect "\"ENTER ...\"" "send \"\"" $minicomfilepath
diff --git a/setup-uboot-env-omap5.sh b/setup-uboot-env-omap5.sh
index 4b97575..7944c83 100644
--- a/setup-uboot-env-omap5.sh
+++ b/setup-uboot-env-omap5.sh
@@ -138,6 +138,7 @@ if [ "$minicom" = "y" ]; then
     echo "verbose on" >> $minicomfilepath
     echo >> $minicomfilepath
     do_expect "\"stop autoboot:\"" "send \"\"" $minicomfilepath
+    do_expect "\"$prompt\"" "send \"env default -f -a\"" $minicomfilepath
     do_expect "\"$prompt\"" "send \"setenv bootdelay 3\"" $minicomfilepath
     do_expect "\"$prompt\"" "send \"setenv baudrate 115200\"" $minicomfilepath
 #    do_expect "\"ENTER ...\"" "send \"\"" $minicomfilepath
-- 
1.7.9.5


