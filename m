Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 83587520C0
	for <meta-arago@arago-project.org>;
	Fri, 10 Mar 2017 21:40:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 78E7A20BB2;
	Fri, 10 Mar 2017 21:40:49 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id JI0lQAB_V_rs; Fri, 10 Mar 2017 21:40:49 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 50E6220BA7;
	Fri, 10 Mar 2017 21:40:48 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id D19ED16239D;
	Fri, 10 Mar 2017 16:40:47 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 10 Mar 2017 16:40:47 -0500
Message-Id: <1489182047-145547-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [morty/master][PATCH] bt-enable: add startup script to enable bluetooth
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
X-List-Received-Date: Fri, 10 Mar 2017 21:40:50 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-connectivity/bt-enable/bt-enable.bb    | 25 ++++++
 .../bt-enable/bt-enable/bt-enable.service          | 12 +++
 .../bt-enable/bt-enable/bt-enable.sh               | 99 ++++++++++++++++++++++
 .../packagegroup-arago-tisdk-connectivity.bb       |  1 +
 4 files changed, 137 insertions(+)
 create mode 100644 meta-arago-distro/recipes-connectivity/bt-enable/bt-enable.bb
 create mode 100644 meta-arago-distro/recipes-connectivity/bt-enable/bt-enable/bt-enable.service
 create mode 100644 meta-arago-distro/recipes-connectivity/bt-enable/bt-enable/bt-enable.sh

diff --git a/meta-arago-distro/recipes-connectivity/bt-enable/bt-enable.bb b/meta-arago-distro/recipes-connectivity/bt-enable/bt-enable.bb
new file mode 100644
index 0000000..a0469f8
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/bt-enable/bt-enable.bb
@@ -0,0 +1,25 @@
+SUMMARY = "Bluetooth enable script"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://bt-enable.sh;beginline=2;endline=18;md5=d134d0d385c53f9201a270fef8448f29"
+
+SRC_URI = " \
+	file://bt-enable.sh \
+	file://bt-enable.service \
+"
+
+S = "${WORKDIR}"
+
+INITSCRIPT_NAME = "bt-enable.sh"
+INITSCRIPT_PARAMS = "defaults 99"
+
+inherit allarch update-rc.d systemd
+
+SYSTEMD_SERVICE_${PN} = "bt-enable.service"
+
+do_install () {
+	install -d ${D}${sysconfdir}/init.d
+	install -m 0755 bt-enable.sh ${D}${sysconfdir}/init.d/
+
+	install -d ${D}${systemd_system_unitdir}
+	install -m0644 bt-enable.service ${D}${systemd_system_unitdir}
+}
diff --git a/meta-arago-distro/recipes-connectivity/bt-enable/bt-enable/bt-enable.service b/meta-arago-distro/recipes-connectivity/bt-enable/bt-enable/bt-enable.service
new file mode 100644
index 0000000..2bde23a
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/bt-enable/bt-enable/bt-enable.service
@@ -0,0 +1,12 @@
+[Unit]
+Description=Enable and configure wl18xx bluetooth stack
+After=network.target
+
+[Service]
+Type=oneshot
+ExecStart=/etc/init.d/bt-enable.sh
+WorkingDirectory=/etc/init.d
+StandardOutput=syslog
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-arago-distro/recipes-connectivity/bt-enable/bt-enable/bt-enable.sh b/meta-arago-distro/recipes-connectivity/bt-enable/bt-enable/bt-enable.sh
new file mode 100644
index 0000000..312b631
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/bt-enable/bt-enable/bt-enable.sh
@@ -0,0 +1,99 @@
+#!/bin/bash
+#Permission is hereby granted, free of charge, to any person obtaining a copy
+#of this software and associated documentation files (the "Software"), to deal
+#in the Software without restriction, including without limitation the rights
+#to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+#copies of the Software, and to permit persons to whom the Software is
+#furnished to do so, subject to the following conditions:
+#
+#The above copyright notice and this permission notice shall be included in
+#all copies or substantial portions of the Software.
+#
+#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+#IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+#FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+#AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+#LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+#OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+#THE SOFTWARE.
+
+function bten_335_evm {
+	echo 117 > /sys/class/gpio/export
+	echo out > /sys/class/gpio/gpio117/direction
+	echo 1 > /sys/class/gpio/gpio117/value
+	echo "Done enabling BT"
+
+	local gpio="nshutdown_gpio=117"
+	local tty="tty=/dev/ttyS1"
+	local flow="flow_cntrl=1"
+	local baud_rate="baud_rate=3000000"
+	mkdir /home/root/tibt
+	echo $gpio > /home/root/tibt/config
+	echo $tty >> /home/root/tibt/config
+	echo $flow >> /home/root/tibt/config
+	echo $baud_rate >> /home/root/tibt/config
+}
+
+function bten_437_evm {
+	echo 16 > /sys/class/gpio/export
+	echo out > /sys/class/gpio/gpio16/direction
+	echo 1 > /sys/class/gpio/gpio16/value
+	echo "Done enabling BT"
+
+	local gpio="nshutdown_gpio=16"
+	local tty="tty=/dev/ttyS3"
+	local flow="flow_cntrl=1"
+	local baud_rate="baud_rate=3000000"
+	mkdir /home/root/tibt
+	echo $gpio > /home/root/tibt/config
+	echo $tty >> /home/root/tibt/config
+	echo $flow >> /home/root/tibt/config
+	echo $baud_rate >> /home/root/tibt/config
+}
+
+function bten_57x_idk {
+	echo 132 > /sys/class/gpio/export
+	echo out > /sys/class/gpio/gpio132/direction
+	echo 1 > /sys/class/gpio/gpio132/value
+	echo "Done enabling BT"
+
+	local gpio="nshutdown_gpio=16"
+	local tty="tty=/dev/ttyS7"
+	local flow="flow_cntrl=1"
+	local baud_rate="baud_rate=3686400"
+	mkdir /home/root/tibt
+	echo $gpio > /home/root/tibt/config
+	echo $tty >> /home/root/tibt/config
+	echo $flow >> /home/root/tibt/config
+	echo $baud_rate >> /home/root/tibt/config
+}
+
+b=$(cat /proc/device-tree/model)
+echo "$b"
+if [ `echo $b | grep -c "TI"` -gt 0 ]
+then
+	if [ `echo $b | grep -c "EVM"` -gt 0 ]
+	then
+		if [ `echo $b | grep -c "335"` -gt 0 ]
+		then
+			echo "success"
+			bten_335_evm
+		fi
+		if [ `echo $b | grep -c "437"` -gt 0 ]
+		then
+			echo "success"
+			bten_437_evm
+		fi
+	elif [ `echo $b | grep -c "IDK"` -gt 0 ]
+	then
+		if [ `echo $b | grep -c "57"` -gt 0 ]
+		then
+			echo "success"
+			bten_57x_idk
+		fi
+	else
+		echo "Not TI EVM board"
+	fi
+else
+	echo "Not a TI board"
+fi
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
index 92e5c73..7180a8b 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
@@ -42,6 +42,7 @@ BLUETOOTH_STACK = "\
     bluez5-noinst-tools \
     bluez5-testtools \
     uim \
+    bt-enable \
 "
 
 CONNECTIVITY_RDEPENDS = " \
-- 
2.7.4


