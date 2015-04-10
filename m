Return-Path: <a0866934local@udb0866934>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id E5746529C6
	for <meta-arago@arago-project.org>;
	Fri, 10 Apr 2015 10:55:18 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t3AAtIsg018461
	for <meta-arago@arago-project.org>; Fri, 10 Apr 2015 05:55:18 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3AAtHZL014821
	for <meta-arago@arago-project.org>; Fri, 10 Apr 2015 05:55:17 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 10 Apr 2015 05:55:16 -0500
Received: from udb0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3AAtGHX008821;
	Fri, 10 Apr 2015 05:55:16 -0500
Received: from a0866934local by udb0866934 with local (Exim 4.76)
	(envelope-from <a0866934local@udb0866934>)	id 1YgWai-0007Db-CG;
	Fri, 10 Apr 2015 06:55:16 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 10 Apr 2015 06:55:04 -0400
Message-ID: <1428663304-27712-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [tisdk-setup-scripts][PATCH v2] setup-uboot: Reset to default environment.
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
X-List-Received-Date: Fri, 10 Apr 2015 10:55:19 -0000
Content-Type: text/plain

* Prevent any previous settings from corrupting the setup.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
v2: 
* Reset CPU after setting default env.
  - This is needed since default environment does not set the correct
    "board_name" variable which is needed to find the correct device
    tree file.
  - u-boot will auto-detect the board upon booting and set the
    appropriate "board_name".

 setup-uboot-env-am18x.sh       |    5 +++++
 setup-uboot-env-am335x.sh      |    5 +++++
 setup-uboot-env-am3517.sh      |    5 +++++
 setup-uboot-env-am37x.sh       |    5 +++++
 setup-uboot-env-am43x.sh       |    5 +++++
 setup-uboot-env-am57xx-evm.sh  |    5 +++++
 setup-uboot-env-beagleboard.sh |    5 +++++
 setup-uboot-env-omap5.sh       |    5 +++++
 8 files changed, 40 insertions(+)

diff --git a/setup-uboot-env-am18x.sh b/setup-uboot-env-am18x.sh
index 5ee813e..8c296e5 100644
--- a/setup-uboot-env-am18x.sh
+++ b/setup-uboot-env-am18x.sh
@@ -226,6 +226,11 @@ if [ "$minicom" = "y" ]; then
     echo "verbose on" >> $minicomfilepath
     echo >> $minicomfilepath
     do_expect "\"stop autoboot:\"" "send \"\"" $minicomfilepath
+    do_expect "\"$prompt\"" "send \"env default -f -a\"" $minicomfilepath
+    do_expect "\"$prompt\"" "send \"saveenv\"" $minicomfilepath
+    do_expect "\"$prompt\"" "send \"reset\"" $minicomfilepath
+    do_expect "\"stop autoboot:\"" "send \" \"" $minicomfilepath
+
     do_expect "\"$prompt\"" "send \"setenv bootdelay 4\"" $minicomfilepath
     do_expect "\"$prompt\"" "send \"setenv baudrate 115200\"" $minicomfilepath
     do_expect "\"ENTER ...\"" "send \"\"" $minicomfilepath
diff --git a/setup-uboot-env-am335x.sh b/setup-uboot-env-am335x.sh
index b3be574..e3fb522 100644
--- a/setup-uboot-env-am335x.sh
+++ b/setup-uboot-env-am335x.sh
@@ -172,6 +172,11 @@ echo "timeout 300" > $cwd/setupBoard.minicom
 echo "verbose on" >> $cwd/setupBoard.minicom
 
 do_expect "\"stop autoboot:\"" "send \" \"" $cwd/setupBoard.minicom
+do_expect "\"U-Boot#\"" "send \"env default -f -a\"" $cwd/setupBoard.minicom
+do_expect "\"U-Boot#\"" "send \"saveenv\"" $cwd/setupBoard.minicom
+do_expect "\"U-Boot#\"" "send \"reset\"" $cwd/setupBoard.minicom
+do_expect "\"stop autoboot:\"" "send \" \"" $cwd/setupBoard.minicom
+
 if [ "$kernel" -eq "1" ]; then
 	if [ "$fs" -eq "1" ]; then
 		#TFTP and NFS Boot
diff --git a/setup-uboot-env-am3517.sh b/setup-uboot-env-am3517.sh
index f9ef134..73e9971 100644
--- a/setup-uboot-env-am3517.sh
+++ b/setup-uboot-env-am3517.sh
@@ -189,6 +189,11 @@ if [ "$minicom" = "y" ]; then
     echo "verbose on" >> $minicomfilepath
     echo >> $minicomfilepath
     do_expect "\"stop autoboot:\"" "send \"\"" $minicomfilepath
+    do_expect "\"$prompt\"" "send \"env default -f -a\"" $minicomfilepath
+    do_expect "\"$prompt\"" "send \"saveenv\"" $minicomfilepath
+    do_expect "\"$prompt\"" "send \"reset\"" $minicomfilepath
+    do_expect "\"stop autoboot:\"" "send \" \"" $minicomfilepath
+
     do_expect "\"$prompt\"" "send \"setenv bootdelay 3\"" $minicomfilepath
     do_expect "\"$prompt\"" "send \"setenv baudrate 115200\"" $minicomfilepath
     do_expect "\"ENTER ...\"" "send \"\"" $minicomfilepath
diff --git a/setup-uboot-env-am37x.sh b/setup-uboot-env-am37x.sh
index 0476483..e9970d6 100644
--- a/setup-uboot-env-am37x.sh
+++ b/setup-uboot-env-am37x.sh
@@ -189,6 +189,11 @@ if [ "$minicom" = "y" ]; then
     echo "verbose on" >> $minicomfilepath
     echo >> $minicomfilepath
     do_expect "\"stop autoboot:\"" "send \"\"" $minicomfilepath
+    do_expect "\"$prompt\"" "send \"env default -f -a\"" $minicomfilepath
+    do_expect "\"$prompt\"" "send \"saveenv\"" $minicomfilepath
+    do_expect "\"$prompt\"" "send \"reset\"" $minicomfilepath
+    do_expect "\"stop autoboot:\"" "send \" \"" $minicomfilepath
+
     do_expect "\"$prompt\"" "send \"setenv bootdelay 3\"" $minicomfilepath
     do_expect "\"$prompt\"" "send \"setenv baudrate 115200\"" $minicomfilepath
     do_expect "\"ENTER ...\"" "send \"\"" $minicomfilepath
diff --git a/setup-uboot-env-am43x.sh b/setup-uboot-env-am43x.sh
index 282ffc1..2e0067e 100644
--- a/setup-uboot-env-am43x.sh
+++ b/setup-uboot-env-am43x.sh
@@ -126,6 +126,11 @@ fi
 echo "timeout 300" > $cwd/setupBoard.minicom
 echo "verbose on" >> $cwd/setupBoard.minicom
 do_expect "\"stop autoboot:\"" "send \" \"" $cwd/setupBoard.minicom
+do_expect "\"U-Boot#\"" "send \"env default -f -a\"" $cwd/setupBoard.minicom
+do_expect "\"U-Boot#\"" "send \"saveenv\"" $cwd/setupBoard.minicom
+do_expect "\"U-Boot#\"" "send \"reset\"" $cwd/setupBoard.minicom
+do_expect "\"stop autoboot:\"" "send \" \"" $cwd/setupBoard.minicom
+
 if [ "$kernel" -eq "1" ]; then
 	if [ "$fs" -eq "1" ]; then
 		#TFTP and NFS Boot
diff --git a/setup-uboot-env-am57xx-evm.sh b/setup-uboot-env-am57xx-evm.sh
index 4707fa8..a3f4126 100644
--- a/setup-uboot-env-am57xx-evm.sh
+++ b/setup-uboot-env-am57xx-evm.sh
@@ -122,6 +122,11 @@ fi
 echo "timeout 300" > $cwd/setupBoard.minicom
 echo "verbose on" >> $cwd/setupBoard.minicom
 do_expect "\"stop autoboot:\"" "send \" \"" $cwd/setupBoard.minicom
+do_expect "\"U-Boot#\"" "send \"env default -f -a\"" $cwd/setupBoard.minicom
+do_expect "\"U-Boot#\"" "send \"saveenv\"" $cwd/setupBoard.minicom
+do_expect "\"U-Boot#\"" "send \"reset\"" $cwd/setupBoard.minicom
+do_expect "\"stop autoboot:\"" "send \" \"" $cwd/setupBoard.minicom
+
 if [ "$kernel" -eq "1" ]; then
 	if [ "$fs" -eq "1" ]; then
 		#TFTP and NFS Boot
diff --git a/setup-uboot-env-beagleboard.sh b/setup-uboot-env-beagleboard.sh
index 97a34db..bc237ae 100644
--- a/setup-uboot-env-beagleboard.sh
+++ b/setup-uboot-env-beagleboard.sh
@@ -189,6 +189,11 @@ if [ "$minicom" = "y" ]; then
     echo "verbose on" >> $minicomfilepath
     echo >> $minicomfilepath
     do_expect "\"stop autoboot:\"" "send \"\"" $minicomfilepath
+    do_expect "\"$prompt\"" "send \"env default -f -a\"" $minicomfilepath
+    do_expect "\"$prompt\"" "send \"saveenv\"" $minicomfilepath
+    do_expect "\"$prompt\"" "send \"reset\"" $minicomfilepath
+    do_expect "\"stop autoboot:\"" "send \" \"" $minicomfilepath
+
     do_expect "\"$prompt\"" "send \"setenv bootdelay 3\"" $minicomfilepath
     do_expect "\"$prompt\"" "send \"setenv baudrate 115200\"" $minicomfilepath
     do_expect "\"ENTER ...\"" "send \"\"" $minicomfilepath
diff --git a/setup-uboot-env-omap5.sh b/setup-uboot-env-omap5.sh
index 4b97575..94b246a 100644
--- a/setup-uboot-env-omap5.sh
+++ b/setup-uboot-env-omap5.sh
@@ -138,6 +138,11 @@ if [ "$minicom" = "y" ]; then
     echo "verbose on" >> $minicomfilepath
     echo >> $minicomfilepath
     do_expect "\"stop autoboot:\"" "send \"\"" $minicomfilepath
+    do_expect "\"$prompt\"" "send \"env default -f -a\"" $minicomfilepath
+    do_expect "\"$prompt\"" "send \"saveenv\"" $minicomfilepath
+    do_expect "\"$prompt\"" "send \"reset\"" $minicomfilepath
+    do_expect "\"stop autoboot:\"" "send \" \"" $minicomfilepath
+
     do_expect "\"$prompt\"" "send \"setenv bootdelay 3\"" $minicomfilepath
     do_expect "\"$prompt\"" "send \"setenv baudrate 115200\"" $minicomfilepath
 #    do_expect "\"ENTER ...\"" "send \"\"" $minicomfilepath
-- 
1.7.9.5


