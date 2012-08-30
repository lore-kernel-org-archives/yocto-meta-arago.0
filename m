Return-Path: <a0273011@sdit-build02.dal.design.ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 434AB52A00
	for <meta-arago@arago-project.org>;
	Thu, 30 Aug 2012 01:06:56 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q7U16tu4007365
	for <meta-arago@arago-project.org>; Wed, 29 Aug 2012 20:06:55 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q7U16tuD028055
	for <meta-arago@arago-project.org>; Wed, 29 Aug 2012 20:06:55 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 29 Aug 2012 20:06:55 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	q7U16t9p012341;	Wed, 29 Aug 2012 20:06:55 -0500
Received: from a0273011 by sdit-build02.dal.design.ti.com with local (Exim
	4.71)	(envelope-from <a0273011@sdit-build02.dal.design.ti.com>)	id
	1T6tS9-0006Xn-RE; Wed, 29 Aug 2012 20:21:49 -0500
From: Franklin S Cooper Jr <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 29 Aug 2012 20:21:48 -0500
Message-ID: <1346289708-25120-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [meta-arago-distro][PATCH] task-arago-tisdk-connectivity: Create new connectivity tasks
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
X-List-Received-Date: Thu, 30 Aug 2012 01:06:56 -0000
Content-Type: text/plain

* Create new task-arago-tisdk-connectivity task including host and target
  versions. The contents of these tasks were originally located in
  task-arago-tisdk-crypto and task-arago-toolchain-tisdk-crypto-host and also
  the target version.

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
 .../tasks/task-arago-tisdk-connectivity-host.bb    |   18 +++++++
 .../tasks/task-arago-tisdk-connectivity-target.bb  |   12 +++++
 .../tasks/task-arago-tisdk-connectivity.bb         |   51 ++++++++++++++++++++
 3 files changed, 81 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity-host.bb
 create mode 100644 meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity-target.bb
 create mode 100644 meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity.bb

diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity-host.bb b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity-host.bb
new file mode 100644
index 0000000..74e4f3f
--- /dev/null
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity-host.bb
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
diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity-target.bb b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity-target.bb
new file mode 100644
index 0000000..deb7b7b
--- /dev/null
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity-target.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = "Task to install wlan and bluetooth sources in SDK"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+PR = "r0"
+
+inherit task
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+COMPATIBLE_MACHINE = "(am37x-evm|am180x-evm|ti33x)"
+
+RDEPENDS_${PN} = "\
+    wpa-supplicant-dev \
+    "
diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity.bb
new file mode 100644
index 0000000..1ff849c
--- /dev/null
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity.bb
@@ -0,0 +1,51 @@
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
+               linux-firmware-wl12xx \
+               wpa-gui-e \
+               crda \
+               softap-udhcpd-config \
+               oppserver \
+               bt-obex \
+               obexd \
+               pulseaudio \
+               pulseaudio-server \
+               pulseaudio-module-loopback \
+               pulseaudio-module-bluetooth-discover \
+               pulseaudio-module-bluetooth-device \
+               eventdump \
+               battleship \
+               wifi-direct-demo \
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
+BLUETOOTH = "bluetooth-gui"
+
+RDEPENDS_${PN} = "\
+    ${WLAN_COMMON} \
+    ${WLAN_COMPAT} \
+    ${BLUETOOTH} \
+"
-- 
1.7.0.4


