Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id 832AE529A1
	for <meta-arago@arago-project.org>;
	Fri,  5 Oct 2012 06:14:22 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so1317326oag.38
	for <meta-arago@arago-project.org>;
	Thu, 04 Oct 2012 23:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=HfM7d6y3xY5qRhljOGe8VJnYFau7Ym/B6q1YyIRfRrg=;
	b=RWckn6vzyeK698p1m13qBX8hegyzXTB/C88LYBBzC+XXxpVVrpfSkH91SlNGYrZG+X
	NTOoSqx/pv9D3UJ3o1QKjILl9gjcKhd3TIncKQ0sumHqVXnfnjZDiXeCYrHRFKJK80Oc
	A5b0r8fuaLWpF1dPYI7ACqKEgWm70Vu91CAfEh+DaFAd09TdK7pDW/vsG6oECfbdVwLy
	jXSdrVGBPCQ9k+Afw0qUARPL/UgW79mbnVnDyhsGYUHMygXwL0xUosNZOrX6WGWNpxi7
	J85+dygeIPYKti4VTl6QBT792i02TUqKliTqzc5LcbnmJ4QuqgimQpIAmDAhILI1OuGM
	RtCw==
Received: by 10.60.28.68 with SMTP id z4mr6213406oeg.119.1349417661949;
	Thu, 04 Oct 2012 23:14:21 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id ig3sm8721699obb.0.2012.10.04.23.14.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 04 Oct 2012 23:14:21 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Fri,  5 Oct 2012 01:42:41 -0500
Message-Id: <1349419361-21472-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH v2] task-arago-tisdk-connectivity: Create new connectivity tasks
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
X-List-Received-Date: Fri, 05 Oct 2012 06:14:22 -0000

From: Franklin S Cooper Jr <fcooper@ti.com>

* Create new task-arago-tisdk-connectivity task including host and target
  versions. The contents of these tasks were originally located in
  task-arago-tisdk-crypto and task-arago-toolchain-tisdk-crypto-host and also
  the target version.

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
Version 2 changes:
Use new task naming convention.
Added bt-obex

 .../task-arago-tisdk-connectivity-sdk-host.bb      |   18 ++++++
 .../task-arago-tisdk-connectivity-sdk-target.bb    |   19 ++++++
 .../tasks/task-arago-tisdk-connectivity.bb         |   65 ++++++++++++++++++++
 3 files changed, 102 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity-sdk-host.bb
 create mode 100644 meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity-sdk-target.bb
 create mode 100644 meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity.bb

diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity-sdk-host.bb b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity-sdk-host.bb
new file mode 100644
index 0000000..74e4f3f
--- /dev/null
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity-sdk-host.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "Task to install wlan and bluetooth sources in SDK"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+PR = "r0"
+
+inherit task
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+COMPATIBLE_MACHINE = "(am37x-evm|am180x-evm|ti33x)"
+
+WLAN_SOURCES = "ti-compat-wireless-wl12xx-src \
+                ti-compat-bluetooth-src \
+                bt-firmware-src \
+                bt-enable-src \
+               "
+
+RDEPENDS_${PN} = "\
+    ${WLAN_SOURCES} \
+    "
diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity-sdk-target.bb b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity-sdk-target.bb
new file mode 100644
index 0000000..a63c801
--- /dev/null
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity-sdk-target.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "Task to install wlan and bluetooth sources in SDK"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+PR = "r1"
+
+inherit task
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+COMPATIBLE_MACHINE = "(am37x-evm|am180x-evm|ti33x)"
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
+    "
diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity.bb
new file mode 100644
index 0000000..e0aa0bd
--- /dev/null
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity.bb
@@ -0,0 +1,65 @@
+DESCRIPTION = "Task to install wlan and bluetooth packages into target FS"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+PR = "r0"
+
+inherit task
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+COMPATIBLE_MACHINE = "(am37x-evm|am180x-evm|ti33x)"
+
+# WLAN support packages.
+# These are the packages that all platforms use for WLAN support
+WLAN_COMMON = "hostap-daemon \
+               ti-wifi-utils \
+               wireless-tools \
+               htop \
+               netperf \
+               iw \
+               wl12xx-firmware \
+               crda \
+               softap-udhcpd-config \
+               oppserver \
+               bt-obex \
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
+# These are the WLAN packages that are used for compatibility with the
+# 2.6.37 kernel used by some devices
+WLAN_COMPAT = "ti-compat-wireless-wl12xx \
+               ti-compat-bluetooth \
+               bt-firmware \
+               wl1271-demo \
+               bt-enable \
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
+# battleship is not included since it doesn't compile with Qt 4.8
+DEMO_APPS = "\
+    bluetooth-gui \
+    wifi-direct-demo \
+    wpa-gui-e \
+"
+
+RDEPENDS_${PN} = "\
+    ${WLAN_COMMON} \
+    ${WLAN_COMPAT} \
+    ${BLUETOOTH_STACK} \
+    ${DEMO_APPS} \
+"
-- 
1.7.0.4


