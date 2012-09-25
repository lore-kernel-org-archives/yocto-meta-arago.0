Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id 85547529B2
	for <meta-arago@arago-project.org>;
	Tue, 25 Sep 2012 14:37:07 +0000 (UTC)
Received: by obblz20 with SMTP id lz20so1246241obb.38
	for <meta-arago@arago-project.org>;
	Tue, 25 Sep 2012 07:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=2zsz1EN0iDK8njGdBAxVBTDt+kCbpI7fl2leBRBJ6fE=;
	b=UaC5gt966rZ0x/DFAYY8vRRylleuY1Ic/9Xr1M2KEPgMv4tsFBr+GkbhAVtRn9amz4
	jGj2spvvEIr7ZsL+qRUkt0PrIYXVTV5gjNP1oVScqfRKgD4zvPigGeHbw5kcU118Heah
	aKS9aabVX3mYU3nQoGz2wkMKsH6yoI+yULmE4aM/XbdpgDWgFFbcE6OOOgnuMX92/mLX
	MNmJSRAVAeztV7iu6Sst2MCs0LVCSUN67CMv1sS0lbHbGtN19Xp0dXDrDoxfu9DACoQV
	sYIfG0cY4P/0x5PcXUhB9ph52rR5/9pD50OCq+uGAhmzJ9LTPBRoHhweENYAlQDMaIhO
	0PSw==
Received: by 10.60.12.8 with SMTP id u8mr12492402oeb.46.1348583826639;
	Tue, 25 Sep 2012 07:37:06 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id zn9sm375257obb.23.2012.09.25.07.37.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 25 Sep 2012 07:37:06 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Tue, 25 Sep 2012 10:01:50 -0500
Message-Id: <1348585310-23666-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH v2] bluez: Disable hid2hci and add test/agent
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
X-List-Received-Date: Tue, 25 Sep 2012 14:37:08 -0000

* This append is based on changes to the bluez4 recipe that were
  made in arago.
* Disable hid2hci since udev 164 which is currently being used
  already provides hid2hci.
* Package test/agent which is used for testing.
* Add additional patches which fix unwanted behavior or enable features.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
Version 2 addresses the following comments:
Removing --enable-hid2hci from EXTRA_OECONF via oe_filter_out rather
than using replace.
By default hid2hci is not enabled. Therefore, adding --disable-hid2hci is
not needed.

 .../0001-bluez-enable-source-interface.patch       |   30 ++++++++++++
 .../bluez4/0001-socket-enable-for-bluez-4_98.patch |   24 ++++++++++
 ...synchronization-between-bluetoothd-and-dr.patch |   49 ++++++++++++++++++++
 .../bluez/bluez4_4.99.bbappend                     |   21 ++++++++
 4 files changed, 124 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-connectivity/bluez/bluez4/0001-bluez-enable-source-interface.patch
 create mode 100644 meta-arago-distro/recipes-connectivity/bluez/bluez4/0001-socket-enable-for-bluez-4_98.patch
 create mode 100755 meta-arago-distro/recipes-connectivity/bluez/bluez4/bluez4-fix-synchronization-between-bluetoothd-and-dr.patch
 create mode 100644 meta-arago-distro/recipes-connectivity/bluez/bluez4_4.99.bbappend

diff --git a/meta-arago-distro/recipes-connectivity/bluez/bluez4/0001-bluez-enable-source-interface.patch b/meta-arago-distro/recipes-connectivity/bluez/bluez4/0001-bluez-enable-source-interface.patch
new file mode 100644
index 0000000..a705c4e
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/bluez/bluez4/0001-bluez-enable-source-interface.patch
@@ -0,0 +1,30 @@
+From 87bcf52a6e9f2ec018bab9dd0da2a2b844b37108 Mon Sep 17 00:00:00 2001
+From: Moosa <moosab@ti.com>
+Date: Wed, 14 Mar 2012 16:43:57 +0200
+Subject: [PATCH] bluez: enable source interface
+
+Enable Source interface on D-Bus that can be used to access
+the Sink functionality
+
+Upstream-Status: Inappropriate [enable feature]
+
+Signed-off-by: Moosa Baransi <moosab@ti.com>
+---
+ audio/audio.conf |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/audio/audio.conf b/audio/audio.conf
+index 9533ada..b554936 100644
+--- a/audio/audio.conf
++++ b/audio/audio.conf
+@@ -3,7 +3,7 @@
+ # This section contains options which are not specific to any
+ # particular interface
+ [General]
+-Enable=Socket
++Enable=Socket,Source
+
+ # Switch to master role for incoming connections (defaults to true)
+ #Master=true
+--
+1.7.1
diff --git a/meta-arago-distro/recipes-connectivity/bluez/bluez4/0001-socket-enable-for-bluez-4_98.patch b/meta-arago-distro/recipes-connectivity/bluez/bluez4/0001-socket-enable-for-bluez-4_98.patch
new file mode 100644
index 0000000..025e7fa
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/bluez/bluez4/0001-socket-enable-for-bluez-4_98.patch
@@ -0,0 +1,24 @@
+From e142a28897c0b0fe9e61259a96dad6fb9f818ecd Mon Sep 17 00:00:00 2001
+From: Moosa <moosa.baransi@babcomsoftware.com>
+Date: Wed, 22 Feb 2012 10:06:37 +0200
+Subject: [PATCH] socket enable for bluez 0_98
+
+* This is necessary for working with A2DP
+---
+ audio/audio.conf |    1 +
+ 1 files changed, 1 insertions(+), 0 deletions(-)
+
+diff --git a/audio/audio.conf b/audio/audio.conf
+index 302e046..9533ada 100644
+--- a/audio/audio.conf
++++ b/audio/audio.conf
+@@ -3,6 +3,7 @@
+ # This section contains options which are not specific to any
+ # particular interface
+ [General]
++Enable=Socket
+
+ # Switch to master role for incoming connections (defaults to true)
+ #Master=true
+--
+1.7.1
diff --git a/meta-arago-distro/recipes-connectivity/bluez/bluez4/bluez4-fix-synchronization-between-bluetoothd-and-dr.patch b/meta-arago-distro/recipes-connectivity/bluez/bluez4/bluez4-fix-synchronization-between-bluetoothd-and-dr.patch
new file mode 100755
index 0000000..7ca0bd7
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/bluez/bluez4/bluez4-fix-synchronization-between-bluetoothd-and-dr.patch
@@ -0,0 +1,49 @@
+From ddca351e504dc3cb8d91ea10a1863949699c6e50 Mon Sep 17 00:00:00 2001
+From: Vita Preskovsky <vitap@ti.com>
+Date: Tue, 13 Dec 2011 22:54:47 +0200
+Subject: [PATCH] bluez4: fix synchronization between bluetoothd and driver
+  * To fix situation when bluetoothd doesn't get messages
+    it expects to receive from the kernel. Therefore the
+    the required requests are sent again at the stage when device
+    is up. The mismatch caused to the list of adapters to be
+    empty.
+
+Signed-off-by: Vita Preskovsky <vitap@ti.com>
+---
+ plugins/hciops.c |   21 +++++++++++++++++++++
+ 1 files changed, 21 insertions(+), 0 deletions(-)
+
+diff --git a/plugins/hciops.c b/plugins/hciops.c
+index ecc0e86..e2198ee 100644
+--- a/plugins/hciops.c
++++ b/plugins/hciops.c
+@@ -2512,6 +2512,27 @@ static void device_devup_setup(int index)
+	hci_send_cmd(dev->sk, OGF_HOST_CTL, OCF_READ_STORED_LINK_KEY,
+					READ_STORED_LINK_KEY_CP_SIZE, &cp);
+
++	/* Even though it shouldn't happen it seems like we might miss
++	 * initialization commands that kernel sends. So we check it here
++	 * to avoid situation when we have device but it is not in the list
++	 * of adapters. */
++       if (hci_test_bit(PENDING_FEATURES, &dev->pending))
++               hci_send_cmd(dev->sk, OGF_INFO_PARAM,
++                                       OCF_READ_LOCAL_FEATURES, 0, NULL);
++
++       if (hci_test_bit(PENDING_VERSION, &dev->pending))
++               hci_send_cmd(dev->sk, OGF_INFO_PARAM,
++                                       OCF_READ_LOCAL_VERSION, 0, NULL);
++
++       if (hci_test_bit(PENDING_NAME, &dev->pending))
++               hci_send_cmd(dev->sk, OGF_HOST_CTL,
++                                       OCF_READ_LOCAL_NAME, 0, NULL);
++
++       if (hci_test_bit(PENDING_BDADDR, &dev->pending))
++               hci_send_cmd(dev->sk, OGF_INFO_PARAM,
++                                       OCF_READ_BD_ADDR, 0, NULL);
++
++
+	if (!dev->pending)
+		init_adapter(index);
+ }
+--
+1.7.0.4
diff --git a/meta-arago-distro/recipes-connectivity/bluez/bluez4_4.99.bbappend b/meta-arago-distro/recipes-connectivity/bluez/bluez4_4.99.bbappend
new file mode 100644
index 0000000..63fcb4f
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/bluez/bluez4_4.99.bbappend
@@ -0,0 +1,21 @@
+PR_append = "-arago0"
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+SRC_URI += "file://bluez4-fix-synchronization-between-bluetoothd-and-dr.patch \
+            file://0001-socket-enable-for-bluez-4_98.patch \
+            file://0001-bluez-enable-source-interface.patch \
+"
+# udev 150-170 provide its on hid2hci tool and udev rules for it. Therefore,
+# disabling hid2hci from bluez4.
+EXTRA_OECONF := "${@oe_filter_out('--enable-hid2hci', '${EXTRA_OECONF}', d)}"
+DEPENDS += "libsndfile1"
+
+# Add test/agent for testing
+PACKAGES =+ "bluez4-agent"
+
+do_install_append () {
+	${TARGET_SYS}-libtool --mode=install install -c 'test/agent' ${D}${bindir}/agent
+}
+
+FILES_bluez4-agent = "${bindir}/agent"
-- 
1.7.0.4


