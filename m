Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 58CE9529AB
	for <meta-arago@arago-project.org>;
	Mon, 17 Jul 2017 22:51:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0CEA1208FB;
	Mon, 17 Jul 2017 22:51:58 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id VFMdvUowZWPd; Mon, 17 Jul 2017 22:51:58 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D9F77208E7;
	Mon, 17 Jul 2017 22:51:55 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 68E2216200E;
	Mon, 17 Jul 2017 18:51:55 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Mon, 17 Jul 2017 18:51:54 -0400
Message-Id: <1500331914-134839-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Cc: Hari Nagalla <hnagalla@ti.com>
Subject: [morty/master][PATCH] bt-enable: update bluetooth enable boot script
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
X-List-Received-Date: Mon, 17 Jul 2017 22:51:58 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Cc: Hari Nagalla <hnagalla@ti.com>
---
 .../recipes-connectivity/bt-enable/bt-enable.bb    |  2 ++
 .../bt-enable/bt-enable/bt-enable.sh               | 42 ++++++++++++++++++----
 2 files changed, 37 insertions(+), 7 deletions(-)

diff --git a/meta-arago-distro/recipes-connectivity/bt-enable/bt-enable.bb b/meta-arago-distro/recipes-connectivity/bt-enable/bt-enable.bb
index a0469f8..b413bb0 100644
--- a/meta-arago-distro/recipes-connectivity/bt-enable/bt-enable.bb
+++ b/meta-arago-distro/recipes-connectivity/bt-enable/bt-enable.bb
@@ -7,6 +7,8 @@ SRC_URI = " \
 	file://bt-enable.service \
 "
 
+PR = "r1"
+
 S = "${WORKDIR}"
 
 INITSCRIPT_NAME = "bt-enable.sh"
diff --git a/meta-arago-distro/recipes-connectivity/bt-enable/bt-enable/bt-enable.sh b/meta-arago-distro/recipes-connectivity/bt-enable/bt-enable/bt-enable.sh
index 312b631..6d5443a 100644
--- a/meta-arago-distro/recipes-connectivity/bt-enable/bt-enable/bt-enable.sh
+++ b/meta-arago-distro/recipes-connectivity/bt-enable/bt-enable/bt-enable.sh
@@ -20,6 +20,8 @@
 function bten_335_evm {
 	echo 117 > /sys/class/gpio/export
 	echo out > /sys/class/gpio/gpio117/direction
+	echo 0 > /sys/class/gpio/gpio117/value
+	sleep 1
 	echo 1 > /sys/class/gpio/gpio117/value
 	echo "Done enabling BT"
 
@@ -37,6 +39,8 @@ function bten_335_evm {
 function bten_437_evm {
 	echo 16 > /sys/class/gpio/export
 	echo out > /sys/class/gpio/gpio16/direction
+	echo 0 > /sys/class/gpio/gpio16/value
+	sleep 1
 	echo 1 > /sys/class/gpio/gpio16/value
 	echo "Done enabling BT"
 
@@ -51,16 +55,37 @@ function bten_437_evm {
 	echo $baud_rate >> /home/root/tibt/config
 }
 
-function bten_57x_idk {
+function bten_57x_evm {
 	echo 132 > /sys/class/gpio/export
 	echo out > /sys/class/gpio/gpio132/direction
+	echo 0 > /sys/class/gpio/gpio132/value
+	sleep 1
 	echo 1 > /sys/class/gpio/gpio132/value
 	echo "Done enabling BT"
 
-	local gpio="nshutdown_gpio=16"
+	local gpio="nshutdown_gpio=132"
 	local tty="tty=/dev/ttyS7"
 	local flow="flow_cntrl=1"
-	local baud_rate="baud_rate=3686400"
+	local baud_rate="baud_rate=3000000"
+	mkdir /home/root/tibt
+	echo $gpio > /home/root/tibt/config
+	echo $tty >> /home/root/tibt/config
+	echo $flow >> /home/root/tibt/config
+	echo $baud_rate >> /home/root/tibt/config
+}
+
+function bten_43x_epos_evm {
+	echo 21 > /sys/class/gpio/export
+	echo out > /sys/class/gpio/gpio21/direction
+	echo 0 > /sys/class/gpio/gpio21/value
+	sleep 1
+	echo 1 > /sys/class/gpio/gpio21/value
+	echo "Done enabling BT"
+
+	local gpio="nshutdown_gpio=21"
+	local tty="tty=/dev/ttyS3"
+	local flow="flow_cntrl=1"
+	local baud_rate="baud_rate=3000000"
 	mkdir /home/root/tibt
 	echo $gpio > /home/root/tibt/config
 	echo $tty >> /home/root/tibt/config
@@ -84,12 +109,15 @@ then
 			echo "success"
 			bten_437_evm
 		fi
-	elif [ `echo $b | grep -c "IDK"` -gt 0 ]
-	then
-		if [ `echo $b | grep -c "57"` -gt 0 ]
+		if [ `echo $b | grep -c "572"` -gt 0 ]
+		then
+			echo "success"
+			bten_57x_evm
+		fi
+		if [ `echo $b | grep -c "EPOS"` -gt 0 ]
 		then
 			echo "success"
-			bten_57x_idk
+			bten_43x_epos_evm
 		fi
 	else
 		echo "Not TI EVM board"
-- 
2.7.4


