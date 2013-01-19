Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f54.google.com (mail-oa0-f54.google.com
	[209.85.219.54])
	by arago-project.org (Postfix) with ESMTPS id A054852AAE
	for <meta-arago@arago-project.org>;
	Sat, 19 Jan 2013 21:52:23 +0000 (UTC)
Received: by mail-oa0-f54.google.com with SMTP id n9so4948262oag.27
	for <meta-arago@arago-project.org>;
	Sat, 19 Jan 2013 13:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=YwjSuFkyo1qAjjElyeKMK/tuPLFkQTPrkxh4Z9dcQS8=;
	b=B8BQ4woD7MUC2wCt4mlcKyZw6VHfSUumUY3R4862RFAjj76O6MqyRNYhNI0yL+ORLt
	gGDp29wUhD20gaTmV0rLMuDINN5izrnViO+LtpgV7MabuqmgXnFiwXCN3G2ekn3PWpTa
	A3R3kwJjNiLZUru4n+fXtuihizsT7eCOQWN/TyNNHZBl+pvBZ3q2gR1MW2Zck5+0uqRG
	2Ve5UJoyL7vdnMBQZ0mu7i+JaMB8p412i3Xxfu5I2qDtQPGeRknr3iGDcgkwMccQrWEV
	qY50NUXic/uc8On9O6eJiTBb8pfUCbpphlUBbQ2Apt3uHMiFlymFbKExMZy37oVgXJNz
	XIbQ==
X-Received: by 10.60.170.10 with SMTP id ai10mr10689518oec.72.1358632342918;
	Sat, 19 Jan 2013 13:52:22 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id b3sm6845496obo.6.2013.01.19.13.52.21
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sat, 19 Jan 2013 13:52:22 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Sat, 19 Jan 2013 15:51:37 -0600
Message-Id: <1358632316-12266-12-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1358632316-12266-1-git-send-email-fcooper@ti.com>
References: <1358632316-12266-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 12/31] bluez4: Pull in bluez4 from Arago
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
X-List-Received-Date: Sat, 19 Jan 2013 21:52:23 -0000

* Pull in bluez4 version 4.98 which was used in the Sitara SDK.
* The software and scripts included in this SDK for the WL1271 daughter card
  depends on older versions of various wlan and bluetooth libraries and
  applications.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../bluez/bluez4/bluetooth.conf                    |   16 +++++++++
 .../recipes-connectivity/bluez/bluez4_4.98.bb      |   35 ++++++++++++++++++++
 2 files changed, 51 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-extras/recipes-connectivity/bluez/bluez4/bluetooth.conf
 create mode 100644 meta-arago-extras/recipes-connectivity/bluez/bluez4_4.98.bb

diff --git a/meta-arago-extras/recipes-connectivity/bluez/bluez4/bluetooth.conf b/meta-arago-extras/recipes-connectivity/bluez/bluez4/bluetooth.conf
new file mode 100644
index 0000000..ca5e9e4
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/bluez/bluez4/bluetooth.conf
@@ -0,0 +1,16 @@
+<!-- This configuration file specifies the required security policies
+     for Bluetooth core daemon to work. -->
+
+<!DOCTYPE busconfig PUBLIC "-//freedesktop//DTD D-BUS Bus Configuration 1.0//EN"
+ "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
+<busconfig>
+
+  <!-- ../system.conf have denied everything, so we just punch some holes -->
+
+  <policy context="default">
+    <allow own="org.bluez"/>
+    <allow send_destination="org.bluez"/>
+    <allow send_interface="org.bluez.Agent"/>
+  </policy>
+
+</busconfig>
diff --git a/meta-arago-extras/recipes-connectivity/bluez/bluez4_4.98.bb b/meta-arago-extras/recipes-connectivity/bluez/bluez4_4.98.bb
new file mode 100644
index 0000000..2cb8618
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/bluez/bluez4_4.98.bb
@@ -0,0 +1,35 @@
+require recipes-connectivity/bluez/bluez4.inc
+
+PR = "r0"
+
+SRC_URI += "file://bluetooth.conf \
+"
+
+SRC_URI[md5sum] = "362864b716950baa04797de735fc237b"
+SRC_URI[sha256sum] = "9a5b655bada7c7a1921cb3bac83b8a32bbe49893e4c7a1377cdc1b0d35f7d233"
+
+do_install_append() {
+    install -m 0644 ${S}/audio/audio.conf ${D}/${sysconfdir}/bluetooth/
+    install -m 0644 ${S}/network/network.conf ${D}/${sysconfdir}/bluetooth/
+    install -m 0644 ${S}/input/input.conf ${D}/${sysconfdir}/bluetooth/
+    # at_console doesn't really work with the current state of OE, so punch some more holes so people can actually use BT
+    install -m 0644 ${WORKDIR}/bluetooth.conf ${D}/${sysconfdir}/dbus-1/system.d/
+}
+
+RDEPENDS_${PN}-dev = "bluez-hcidump"
+
+ALLOW_EMPTY_libasound-module-bluez = "1"
+PACKAGES =+ "libasound-module-bluez"
+
+FILES_libasound-module-bluez = "${libdir}/alsa-lib/lib*.so ${datadir}/alsa"
+FILES_${PN} += "${libdir}/bluetooth/plugins ${libdir}/bluetooth/plugins/*.so ${base_libdir}/udev/ ${systemd_unitdir}/ ${datadir}/dbus-1"
+FILES_${PN}-dev += "\
+  ${libdir}/bluetooth/plugins/*.la \
+  ${libdir}/alsa-lib/*.la \
+"
+
+FILES_${PN}-dbg += "\
+  ${libdir}/bluetooth/plugins/.debug \
+  ${libdir}/*/.debug \
+  ${base_libdir}/udev/.debug \
+"
-- 
1.7.0.4


