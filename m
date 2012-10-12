Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id 912FA52A70
	for <meta-arago@arago-project.org>;
	Fri, 12 Oct 2012 04:57:34 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so2459032oag.38
	for <meta-arago@arago-project.org>;
	Thu, 11 Oct 2012 21:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=CQZSms7aH9iOAX1v9KvzYuVP6a5pdSm8X/qaYmtukkA=;
	b=Pb4frGpHJwT+93JD3FiWIrPNlhCcCII1cZdMr5ZlkAT0umPZYSPu5J18jKp6Doim20
	2cmMxKQpd2ivPM3JoDh9yDdcgOeKCXtAlTXLnjPXpEiSlvl9GP1EH7TJw7qHpFVvwmov
	W154xlxHAk1qNIXEtBC/YQ7qUwqkdbGYOsWhGfwRP6+9gm/K0apsoBzGGH2Y5cuzm7fh
	/KDInt+YjFfzNM8lhQUkDWMdzDVxGKu/YdR2l3rVUGPTMtbv7VSZWifVe2kKzSPJRtPa
	TeF4A/9nd1/EQIbJxV+whBEOxTKe0jPfy43ag1qONS4raXS+XCIqqacW84WV0wHRBjys
	sO9g==
Received: by 10.182.150.105 with SMTP id uh9mr2497857obb.85.1350017853641;
	Thu, 11 Oct 2012 21:57:33 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id fo6sm5949533obc.20.2012.10.11.21.57.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 11 Oct 2012 21:57:32 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Fri, 12 Oct 2012 00:28:23 -0500
Message-Id: <1350019703-10480-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [PATCH v3] task-arago-tisdk-connectivity: Create new connectivity tasks
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
X-List-Received-Date: Fri, 12 Oct 2012 04:57:34 -0000

From: Franklin S Cooper Jr <fcooper@ti.com>

* Create new task-arago-tisdk-connectivity task including host and target
  versions. The contents of these tasks were originally located in
  task-arago-tisdk-crypto and task-arago-toolchain-tisdk-crypto-host and also
  the target version.

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
Version 3 changes:
Removed bt-obex since it was renamed to bluez-tools which was already added.
Removed recieps from the RDEPENDS if they still haven't been commited to
meta-ti. Only firmware/drivers related recipes fall under this catagory.

 .../task-arago-tisdk-connectivity-sdk-host.bb      |   19 ++++++
 .../task-arago-tisdk-connectivity-sdk-target.bb    |   19 ++++++
 .../tasks/task-arago-tisdk-connectivity.bb         |   65 ++++++++++++++++++++
 3 files changed, 103 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity-sdk-host.bb
 create mode 100644 meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity-sdk-target.bb
 create mode 100644 meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity.bb

diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity-sdk-host.bb b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity-sdk-host.bb
new file mode 100644
index 0000000..14e793a
--- /dev/null
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity-sdk-host.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "Task to install wlan and bluetooth sources in SDK"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+COMPATIBLE_MACHINE = "(am37x-evm|am180x-evm|ti33x)"
+
+PR = "r0"
+
+inherit task
+
+FIRMWARE_AND_DRIVERS_SRC = "ti-compat-wireless-wl12xx-src \
+                            ti-compat-bluetooth-src \
+                            bt-firmware-src \
+                            bt-enable-src \
+"
+
+# Need to add ${FIRMWARE_AND_DRIVERS_SRC} to the below list once the recipes have
+# been added to meta-ti
+RDEPENDS_${PN} = "\
+"
diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity-sdk-target.bb b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity-sdk-target.bb
new file mode 100644
index 0000000..c1ad218
--- /dev/null
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity-sdk-target.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "Task to install wlan and bluetooth sources in SDK"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+COMPATIBLE_MACHINE = "(am37x-evm|am180x-evm|ti33x)"
+
+PR = "r0"
+
+inherit task
+
+# Bluetooth development packages
+BLUETOOTH_STACK = "\
+    bluez4-dev \
+    openobex-dev \
+"
+
+RDEPENDS_${PN} = "\
+    ${BLUETOOTH_STACK} \
+    wpa-supplicant-dev \
+"
diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity.bb
new file mode 100644
index 0000000..ecb86a9
--- /dev/null
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity.bb
@@ -0,0 +1,65 @@
+DESCRIPTION = "Task to install wlan and bluetooth packages into target FS"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+COMPATIBLE_MACHINE = "(am37x-evm|am180x-evm|ti33x)"
+
+PR = "r0"
+
+inherit task
+
+# WLAN support packages.
+# These are the packages that all platforms use for WLAN support
+WLAN_COMMON = "hostap-daemon \
+               ti-wifi-utils \
+               wireless-tools \
+               htop \
+               netperf \
+               iw \
+               crda \
+               softap-udhcpd-config \
+               oppserver \
+               bluez-tools \
+               obexd \
+               pulseaudio \
+               pulseaudio-server \
+               pulseaudio-module-loopback \
+               pulseaudio-module-bluetooth-discover \
+               pulseaudio-module-bluetooth-device \
+               eventdump \
+               wpa-supplicant \
+"
+
+FIRMWARE_AND_DRIVERS = "ti-compat-wireless-wl12xx \
+                        ti-compat-bluetooth \
+                        bt-firmware \
+                        bt-enable \
+                        wl12xx-firmware \
+"
+
+BLUETOOTH_STACK = "\
+    bluez4 \
+    bluez4-agent \
+    libasound-module-bluez \
+    bluez-hcidump \
+    openobex \
+    openobex-apps \
+    obexftp \
+    ussp-push \
+"
+
+# Need to add battleship to the below list once the application has been fixed
+DEMO_APPS = "\
+    bluetooth-gui \
+    wifi-direct-demo \
+    wpa-gui-e \
+    wl1271-demo \
+"
+
+# Need to add ${FIRMWARE_AND_DRIVERS} to the below list once the recipes have
+# been added to meta-ti
+RDEPENDS_${PN} = "\
+    ${WLAN_COMMON} \
+    ${WLAN_COMPAT} \
+    ${BLUETOOTH_STACK} \
+    ${DEMO_APPS} \
+"
-- 
1.7.0.4


