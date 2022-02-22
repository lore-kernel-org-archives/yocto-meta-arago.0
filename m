Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.9106.1645504914170660622
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 20:41:54 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9D02A40CA5
	for <meta-arago@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:41:53 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G-ru5skub6zi for <meta-arago@lists.yoctoproject.org>;
	Tue, 22 Feb 2022 04:41:53 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A704B40C7B
	for <meta-arago@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:41:51 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 6DEF5174771
	for <meta-arago@lists.yoctoproject.org>; Mon, 21 Feb 2022 23:41:51 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [PATCH 06/23] conf/machine: remove generic arago machines
Date: Tue, 22 Feb 2022 04:41:34 +0000
Message-Id: <20220222044151.2844138-7-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222044151.2844138-1-denis@denix.org>
References: <20220222044151.2844138-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Denys Dmytriyenko <denys@konsulko.com>

These haven't been tested in long time and corresponding generic or qemu
machine from OE-Core or meta-arm should be used instead these days.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../conf/machine/arago-armv5.conf             | 18 ----------------
 .../conf/machine/arago-armv7.conf             | 18 ----------------
 .../conf/machine/arago-armv8.conf             | 21 -------------------
 meta-arago-distro/conf/machine/arago.conf     |  1 -
 4 files changed, 58 deletions(-)
 delete mode 100644 meta-arago-distro/conf/machine/arago-armv5.conf
 delete mode 100644 meta-arago-distro/conf/machine/arago-armv7.conf
 delete mode 100644 meta-arago-distro/conf/machine/arago-armv8.conf
 delete mode 120000 meta-arago-distro/conf/machine/arago.conf

diff --git a/meta-arago-distro/conf/machine/arago-armv5.conf b/meta-arago=
-distro/conf/machine/arago-armv5.conf
deleted file mode 100644
index 6f1c1aa8..00000000
--- a/meta-arago-distro/conf/machine/arago-armv5.conf
+++ /dev/null
@@ -1,18 +0,0 @@
-#@TYPE: Machine
-#@NAME: Arago unified/fake machine
-#@DESCRIPTION: Unified/fake Arago machine configuration for TI/Arago ARM=
v5 platforms
-
-include conf/machine/include/tune-arm926ejs.inc
-
-IMAGE_FSTYPES =3D "tar.xz"
-
-KERNEL_IMAGETYPE =3D "zImage"
-UBOOT_LOADADDRESS =3D "0"
-
-SERIAL_CONSOLE =3D ""
-SERIAL_CONSOLES =3D "115200;ttyS0 115200;ttyS1 115200;ttyS2 115200;ttyS3=
 115200;ttyO0 115200;ttyO1 115200;ttyO2 115200;ttyO3"
-SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"
-
-PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-arago"
-
-MACHINE_FEATURES =3D "kernel26 apm usbgadget usbhost vfat ext2 screen al=
sa ethernet touchscreen"
diff --git a/meta-arago-distro/conf/machine/arago-armv7.conf b/meta-arago=
-distro/conf/machine/arago-armv7.conf
deleted file mode 100644
index 408064fa..00000000
--- a/meta-arago-distro/conf/machine/arago-armv7.conf
+++ /dev/null
@@ -1,18 +0,0 @@
-#@TYPE: Machine
-#@NAME: Arago unified/fake machine
-#@DESCRIPTION: Unified/fake Arago machine configuration for TI/Arago ARM=
v7 platforms
-
-include conf/machine/include/tune-cortexa8.inc
-
-IMAGE_FSTYPES =3D "tar.xz"
-
-KERNEL_IMAGETYPE =3D "zImage"
-UBOOT_LOADADDRESS =3D "0"
-
-SERIAL_CONSOLE =3D ""
-SERIAL_CONSOLES =3D "115200;ttyS0 115200;ttyS1 115200;ttyS2  115200;ttyS=
3 115200;ttyO0 115200;ttyO1 115200;ttyO2 115200;ttyO3"
-SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"
-
-PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-arago"
-
-MACHINE_FEATURES =3D "kernel26 apm usbgadget usbhost vfat ext2 screen al=
sa ethernet touchscreen"
diff --git a/meta-arago-distro/conf/machine/arago-armv8.conf b/meta-arago=
-distro/conf/machine/arago-armv8.conf
deleted file mode 100644
index fd6147fe..00000000
--- a/meta-arago-distro/conf/machine/arago-armv8.conf
+++ /dev/null
@@ -1,21 +0,0 @@
-#@TYPE: Machine
-#@NAME: Arago unified/fake machine
-#@DESCRIPTION: Unified/fake Arago machine configuration for TI/Arago ARM=
v7 platforms
-
-include conf/machine/include/arm/arch-armv8.inc
-
-IMAGE_FSTYPES =3D "tar.xz cpio.xz"
-
-KERNEL_IMAGETYPE =3D "Image"
-UBOOT_LOADADDRESS =3D "0"
-
-SERIAL_CONSOLE =3D ""
-SERIAL_CONSOLES =3D "115200;ttyS0 115200;ttyS1 115200;ttyS2  115200;ttyS=
3 115200;ttyO0 115200;ttyO1 115200;ttyO2 115200;ttyO3"
-SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"
-
-#PREFERRED_PROVIDER_virtual/kernel =3D "linux-dummy"
-
-MACHINE_FEATURES =3D ""
-MACHINE_FEATURES_BACKFILL_CONSIDERED =3D "rtc"
-
-RDEPENDS:kernel-base =3D ""
diff --git a/meta-arago-distro/conf/machine/arago.conf b/meta-arago-distr=
o/conf/machine/arago.conf
deleted file mode 120000
index e8069af4..00000000
--- a/meta-arago-distro/conf/machine/arago.conf
+++ /dev/null
@@ -1 +0,0 @@
-arago-armv5.conf
\ No newline at end of file
--=20
2.25.1

