Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id CB3D352094
	for <meta-arago@arago-project.org>;
	Tue, 16 May 2017 02:50:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C525720B95;
	Tue, 16 May 2017 02:50:45 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id t--KVDUsfPUl; Tue, 16 May 2017 02:50:45 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A06C9200CD;
	Tue, 16 May 2017 02:50:44 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 17A961624C1;
	Mon, 15 May 2017 22:50:44 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 15 May 2017 22:50:37 -0400
Message-Id: <1494903038-55614-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/2] arago-armv5/armv7: update to match the current configuration
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
X-List-Received-Date: Tue, 16 May 2017 02:50:46 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/machine/arago-armv5.conf | 7 +++----
 meta-arago-distro/conf/machine/arago-armv7.conf | 7 +++----
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/meta-arago-distro/conf/machine/arago-armv5.conf b/meta-arago-distro/conf/machine/arago-armv5.conf
index e5eea16..6f1c1aa 100644
--- a/meta-arago-distro/conf/machine/arago-armv5.conf
+++ b/meta-arago-distro/conf/machine/arago-armv5.conf
@@ -1,19 +1,18 @@
 #@TYPE: Machine
 #@NAME: Arago unified/fake machine
 #@DESCRIPTION: Unified/fake Arago machine configuration for TI/Arago ARMv5 platforms
-TARGET_ARCH = "arm"
 
 include conf/machine/include/tune-arm926ejs.inc
 
-IMAGE_FSTYPES = "tar.gz"
+IMAGE_FSTYPES = "tar.xz"
 
 KERNEL_IMAGETYPE = "zImage"
 UBOOT_LOADADDRESS = "0"
 
 SERIAL_CONSOLE = ""
-SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS1 115200;ttyS2 115200;ttyO0 115200;ttyO1 115200;ttyO2"
+SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS1 115200;ttyS2 115200;ttyS3 115200;ttyO0 115200;ttyO1 115200;ttyO2 115200;ttyO3"
 SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 
 PREFERRED_PROVIDER_virtual/kernel ?= "linux-arago"
 
-MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen touchscreen"
+MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen alsa ethernet touchscreen"
diff --git a/meta-arago-distro/conf/machine/arago-armv7.conf b/meta-arago-distro/conf/machine/arago-armv7.conf
index 4b8aa38..408064f 100644
--- a/meta-arago-distro/conf/machine/arago-armv7.conf
+++ b/meta-arago-distro/conf/machine/arago-armv7.conf
@@ -1,19 +1,18 @@
 #@TYPE: Machine
 #@NAME: Arago unified/fake machine
 #@DESCRIPTION: Unified/fake Arago machine configuration for TI/Arago ARMv7 platforms
-TARGET_ARCH = "arm"
 
 include conf/machine/include/tune-cortexa8.inc
 
-IMAGE_FSTYPES = "tar.gz"
+IMAGE_FSTYPES = "tar.xz"
 
 KERNEL_IMAGETYPE = "zImage"
 UBOOT_LOADADDRESS = "0"
 
 SERIAL_CONSOLE = ""
-SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS1 115200;ttyS2 115200;ttyO0 115200;ttyO1 115200;ttyO2"
+SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS1 115200;ttyS2  115200;ttyS3 115200;ttyO0 115200;ttyO1 115200;ttyO2 115200;ttyO3"
 SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 
 PREFERRED_PROVIDER_virtual/kernel ?= "linux-arago"
 
-MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen touchscreen"
+MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen alsa ethernet touchscreen"
-- 
2.7.4


