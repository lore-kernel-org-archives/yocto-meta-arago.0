Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 3177152A6D
	for <meta-arago@arago-project.org>;
	Wed, 12 Jul 2017 23:36:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 09D2B20C20;
	Wed, 12 Jul 2017 23:36:38 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id BQN8Hdc1Y2wo; Wed, 12 Jul 2017 23:36:37 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DC37620645;
	Wed, 12 Jul 2017 23:36:36 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 4E4691624E5;
	Wed, 12 Jul 2017 19:36:36 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Wed, 12 Jul 2017 19:36:35 -0400
Message-Id: <1499902595-114800-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [morty/master][PATCH] packagegroup-*-connectivity: add more pulseaudio/bluetooth packages
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
X-List-Received-Date: Wed, 12 Jul 2017 23:36:39 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-connectivity.bb | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
index 7180a8b..8c852cf 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install wireless packages into the target FS"
 LICENSE = "MIT"
-PR = "r36"
+PR = "r37"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -12,9 +12,6 @@ WLAN_COMMON = "\
     wireless-tools \
     iw \
     softap-udhcpd-config \
-    pulseaudio \
-    pulseaudio-server \
-    pulseaudio-module-loopback \
     eventdump \
     wlconf \
     wpa-supplicant-wl18xx \
@@ -43,6 +40,15 @@ BLUETOOTH_STACK = "\
     bluez5-testtools \
     uim \
     bt-enable \
+    pulseaudio \
+    pulseaudio-server \
+    pulseaudio-module-loopback \
+    pulseaudio-module-bluetooth-discover \
+    pulseaudio-module-bluetooth-policy \
+    pulseaudio-module-bluez5-device \
+    pulseaudio-module-bluez5-discover \
+    pulseaudio-lib-bluez5-util \
+    sbc \
 "
 
 CONNECTIVITY_RDEPENDS = " \
-- 
2.7.4


