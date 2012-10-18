Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id 2A1CE52980
	for <meta-arago@arago-project.org>;
	Thu, 18 Oct 2012 22:11:51 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so8915212oag.38
	for <meta-arago@arago-project.org>;
	Thu, 18 Oct 2012 15:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=k/EYv3OivIpLdeMMm1Jq+tFvMvDtl/8iPNsAvrCYUcI=;
	b=jozHmIZBYxrfk1DDjl9sAfk5bMLDHtoelwshBbh9UdQBG99Yr2j2Kjj+4sRny94qPd
	C7KsXrq8JVq3QR7iWQCsqEsYecTvixwzphHJy08c0wkvHym32N6gj45JKhwmrjSGRM9R
	I/BYUnobNE0vzVR2wSOJIdxnNcnrDgw4jAVzjtcbowoaNphg59/HR0dTiDTLMNVgnabR
	UojTBdaFxz3brFZhxHn/inOrlVuq7poc1ZMud0iMo7FyWNoWJCH3sMlvom+rf4u1v+ku
	zCrA/l2ZrKrbX5hAw/RwwYTp3kDe9ctVe/rPeAd2XBM+xH1Ap9dEu3hkIVExd7YYODf9
	9wmQ==
Received: by 10.60.171.164 with SMTP id av4mr20067943oec.59.1350598309957;
	Thu, 18 Oct 2012 15:11:49 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id zn9sm24588926obb.23.2012.10.18.15.11.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 18 Oct 2012 15:11:49 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Thu, 18 Oct 2012 17:11:41 -0500
Message-Id: <1350598301-17285-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [PATCH v4] task-arago-tisdk-connectivity: Create new connectivity tasks
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
X-List-Received-Date: Thu, 18 Oct 2012 22:11:52 -0000

From: Franklin S Cooper Jr <fcooper@ti.com>

* Create new task-arago-tisdk-connectivity task including host and target
  versions. The contents of these tasks were originally located in
  task-arago-tisdk-crypto and task-arago-toolchain-tisdk-crypto-host and also
  the target version.

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
Version 4 changes:
 Removed COMPATIBLE_MACHINE.
 Added PACKAGE_ARCH and ALLOW_EMPTY when needed.

Version 3 changes:
 Removed bt-obex since it was renamed to bluez-tools which was
 already added.
 Removed recieps from the RDEPENDS if they still haven't been
 commited to
 meta-ti. Only firmware/drivers related recipes fall under this
 catagory.

 .../task-arago-tisdk-connectivity-sdk-host.bb      |   29 +++++++
 .../task-arago-tisdk-connectivity-sdk-target.bb    |   37 +++++++++
 .../tasks/task-arago-tisdk-connectivity.bb         |   85 ++++++++++++++++++++
 3 files changed, 151 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity-sdk-host.bb
 create mode 100644 meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity-sdk-target.bb
 create mode 100644 meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity.bb

diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity-sdk-host.bb b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity-sdk-host.bb
new file mode 100644
index 0000000..f2f3929
--- /dev/null
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity-sdk-host.bb
@@ -0,0 +1,29 @@
+DESCRIPTION = "Task to install wlan and bluetooth sources in SDK"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+PR = "r0"
+
+inherit task
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+ALLOW_EMPTY = "1"
+
+FIRMWARE_AND_DRIVERS_SRC = "ti-compat-wireless-wl12xx-src \
+                            ti-compat-bluetooth-src \
+                            bt-firmware-src \
+                            bt-enable-src \
+"
+
+CONNECTIVITY_RDEPENDS = ""
+
+# Need to add ${FIRMWARE_AND_DRIVERS_SRC} to the below lists once the recipes
+# have been added to meta-ti
+
+CONNECTIVITY_RDEPENDS_am37x-evm = ""
+CONNECTIVITY_RDEPENDS_am180x-evm = ""
+CONNECTIVITY_RDEPENDS_ti33x = ""
+
+RDEPENDS_${PN} = "\
+    ${CONNECTIVITY_RDEPENDS} \
+"
diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity-sdk-target.bb b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity-sdk-target.bb
new file mode 100644
index 0000000..29fd828
--- /dev/null
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity-sdk-target.bb
@@ -0,0 +1,37 @@
+DESCRIPTION = "Task to install wlan and bluetooth sources in SDK"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+PR = "r0"
+
+inherit task
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+ALLOW_EMPTY = "1"
+
+# Bluetooth development packages
+BLUETOOTH_STACK = "\
+    bluez4-dev \
+    openobex-dev \
+"
+
+CONNECTIVITY_RDEPENDS = ""
+
+CONNECTIVITY_RDEPENDS_am37x-evm = "\
+    ${BLUETOOTH_STACK} \
+     wpa-supplicant-dev \
+"
+
+CONNECTIVITY_RDEPENDS_am180x-evm = "\
+    ${BLUETOOTH_STACK} \
+     wpa-supplicant-dev \
+"
+
+CONNECTIVITY_RDEPENDS_ti33x  = "\
+    ${BLUETOOTH_STACK} \
+     wpa-supplicant-dev \
+"
+
+RDEPENDS_${PN} = "\
+    ${CONNECTIVITY_RDEPENDS} \
+"
diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity.bb
new file mode 100644
index 0000000..8c838f7
--- /dev/null
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity.bb
@@ -0,0 +1,85 @@
+DESCRIPTION = "Task to install wlan and bluetooth packages into target FS"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+PR = "r0"
+
+inherit task
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+ALLOW_EMPTY = "1"
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
+CONNECTIVITY_RDEPENDS = ""
+
+# Need to add ${FIRMWARE_AND_DRIVERS} to the below lists once the recipes have
+# been added to meta-ti
+
+CONNECTIVITY_RDEPENDS_am37x-evm = "\
+      ${WLAN_COMMON} \
+      ${BLUETOOTH_STACK} \
+      ${DEMO_APPS} \
+"
+
+CONNECTIVITY_RDEPENDS_am180x-evm  = "\
+    ${WLAN_COMMON} \
+    ${BLUETOOTH_STACK} \
+    ${DEMO_APPS} \
+"
+
+CONNECTIVITY_RDEPENDS_ti33x = "\
+    ${WLAN_COMMON} \
+    ${BLUETOOTH_STACK} \
+    ${DEMO_APPS} \
+"
+
+RDEPENDS_${PN} = "\
+    ${CONNECTIVITY_RDEPENDS} \
+"
-- 
1.7.0.4


