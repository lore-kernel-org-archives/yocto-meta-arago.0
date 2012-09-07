Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id 796CB529AB
	for <meta-arago@arago-project.org>;
	Thu,  6 Sep 2012 23:46:11 +0000 (UTC)
Received: by obbeh20 with SMTP id eh20so3410782obb.38
	for <meta-arago@arago-project.org>;
	Thu, 06 Sep 2012 16:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=IcnIhJ+98g7WmUHhX5LLzKUMhzEySjHo8bAR7Uzbt+8=;
	b=QUv/34I+rtZ61cLgnIy1tQZ5ULj69t0/OVqR68soRMvwjBDTddTCoLiml+xrng23im
	IVhpTVO0iDNqe4n8SW8MpIlOa03uuUq5T9i8H5Akd6PCciTZcjNe3VW2QpPM3mlFydCI
	6JQzc829uTQZKYt1AhYCwFnd/zaFzH82BeN7050SJ1pF9cJyCywaZG4TZqq+rldaDL/e
	3zfECzUpdqzFEaq10fEK7gwZjxZ6tapA70fqyFkFyFplcWGyTvvArMS3m4F4ocgaDaqw
	EpcNvJ/mYcZaG7p4PHMxLAUlE6qB1RN8SWDMgjC7xopFDxBZq2VRQzwX4WoDvA7E9Pij
	D1ng==
Received: by 10.182.192.101 with SMTP id hf5mr3928653obc.96.1346975169726;
	Thu, 06 Sep 2012 16:46:09 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id d4sm3297205obx.3.2012.09.06.16.46.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Sep 2012 16:46:09 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Thu,  6 Sep 2012 19:03:57 -0500
Message-Id: <1346976237-18449-1-git-send-email-fcooper27jr@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper27jr@gmail.com>
Subject: [meta-arago-distro][PATCH] task-arago-tisdk-connectivity: Add bluetooth stack
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
X-List-Received-Date: Thu, 06 Sep 2012 23:46:12 -0000

* Add list of bluetooth stack libraries to task-arago-tisdk-connectivity.
* This list was previously located in task-arago-tisdk-bsp and
  task-arago-toolchain-tisdk-bsp-target in arago.

Signed-off-by: Franklin S. Cooper Jr <fcooper27jr@gmail.com>
---
 .../tasks/task-arago-tisdk-connectivity-target.bb  |    9 ++++++++-
 .../tasks/task-arago-tisdk-connectivity.bb         |   16 +++++++++++++---
 2 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity-target.bb b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity-target.bb
index deb7b7b..a63c801 100644
--- a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity-target.bb
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity-target.bb
@@ -1,12 +1,19 @@
 DESCRIPTION = "Task to install wlan and bluetooth sources in SDK"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r0"
+PR = "r1"
 
 inherit task
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 COMPATIBLE_MACHINE = "(am37x-evm|am180x-evm|ti33x)"
 
+# Bluetooth development packages
+BLUETOOTH_STACK = "\
+    bluez4-dev \
+    openobex-dev \
+"
+
 RDEPENDS_${PN} = "\
+    ${BLUETOOTH_STACK} \
     wpa-supplicant-dev \
     "
diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity.bb
index 1ff849c..17f97d1 100644
--- a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity.bb
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Task to install wlan and bluetooth packages into target FS"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r0"
+PR = "r1"
 
 inherit task
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -42,10 +42,20 @@ WLAN_COMPAT = "ti-compat-wireless-wl12xx \
                bt-enable \
 "
 
-BLUETOOTH = "bluetooth-gui"
+BLUETOOTH_STACK = "\
+    bluez4 \
+    bluez4-agent \
+    libasound-module-bluez \
+    bluez-hcidump \
+    openobex \
+    openobex-apps \
+    obexftp \
+    ussp-push \
+    "
 
 RDEPENDS_${PN} = "\
     ${WLAN_COMMON} \
     ${WLAN_COMPAT} \
-    ${BLUETOOTH} \
+    ${BLUETOOTH_STACK} \
+    bluetooth-gui \
 "
-- 
1.7.0.4


