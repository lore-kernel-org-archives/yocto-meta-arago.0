Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id 29A065208C
	for <meta-arago@arago-project.org>;
	Mon, 12 Nov 2012 22:46:41 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so6217172oag.38
	for <meta-arago@arago-project.org>;
	Mon, 12 Nov 2012 14:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=KfALzhQVsa5y2N0oAIwPJNLb3dnF3R6vjzWGg0Ys4/0=;
	b=s45QhovNgukyR8Xzmc2tJXeJwpDD2b5ZoUF1/BICz97MBxWVMNO7zCWqXR77DpyWgH
	UVSejmWxMiztVIFFqX+omM3KAi9uHpgRJsFVFloia9IaAe3KTCDxhA9UIYPozRgyuyyV
	kRD2STrADsX1unrL+Iha/sA3rghYxlWekHvvZZPjLVrZEei/I/1jJUyeJ4WeZCVVzKT0
	PTSu1UrclgEMzKVSRlLv26S7xpavXf4uBMji4SoelAPntIBxFLcB9TJ7vnitc1CZPmet
	eOo3N5NIwOpqR/pNj5zD2FeO4w5S0cn2eV20+Get0epbVHNl5lamZmD9/xpzNpRcDjd6
	7bMw==
Received: by 10.182.192.74 with SMTP id he10mr16665471obc.87.1352760400633;
	Mon, 12 Nov 2012 14:46:40 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id nd14sm8285868obb.14.2012.11.12.14.46.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 12 Nov 2012 14:46:40 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Mon, 12 Nov 2012 16:46:32 -0600
Message-Id: <1352760396-7331-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 1/5] u-boot_2012.10-psp05.06.00.00: Fix mmc boot environment settings
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
X-List-Received-Date: Mon, 12 Nov 2012 22:46:41 -0000

* Add patch that tweaks environment settings for mmc.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 ...35x_evm-fix-mmc-boot-environment-settings.patch |   87 ++++++++++++++++++++
 .../u-boot/u-boot_2012.10-psp05.06.00.00.bb        |    6 +-
 2 files changed, 91 insertions(+), 2 deletions(-)
 create mode 100644 meta-arago-distro/recipes-bsp/u-boot/u-boot-2012.10-psp05.06.00.00/0001-am335x_evm-fix-mmc-boot-environment-settings.patch

diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot-2012.10-psp05.06.00.00/0001-am335x_evm-fix-mmc-boot-environment-settings.patch b/meta-arago-distro/recipes-bsp/u-boot/u-boot-2012.10-psp05.06.00.00/0001-am335x_evm-fix-mmc-boot-environment-settings.patch
new file mode 100644
index 0000000..1a4f4b3
--- /dev/null
+++ b/meta-arago-distro/recipes-bsp/u-boot/u-boot-2012.10-psp05.06.00.00/0001-am335x_evm-fix-mmc-boot-environment-settings.patch
@@ -0,0 +1,87 @@
+From aecef85a39d4839d91e526b88264596417e66c45 Mon Sep 17 00:00:00 2001
+From: Chase Maupin <Chase.Maupin@ti.com>
+Date: Mon, 5 Nov 2012 15:13:05 -0600
+Subject: [PATCH 1/4] am335x_evm: fix mmc boot environment settings
+
+* Fixed the MMC boot environment settings to try first loading
+  the uImage from the FAT partition instead of the ext2 partition.
+* Changed to load the kernel image a kloadaddr to avoid the need
+  to relocate the kernel image during boot.
+* Added ip_method to mmc_args
+* Use bootargs_defaults to set common variables
+
+Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
+---
+ include/configs/am335x_evm.h |   33 +++++++++++++++++++++------------
+ 1 files changed, 21 insertions(+), 12 deletions(-)
+
+diff --git a/include/configs/am335x_evm.h b/include/configs/am335x_evm.h
+index ec2d835..bd9473b 100644
+--- a/include/configs/am335x_evm.h
++++ b/include/configs/am335x_evm.h
+@@ -46,20 +46,25 @@
+ 
+ #define CONFIG_EXTRA_ENV_SETTINGS \
+ 	"loadaddr=0x80200000\0" \
++    "kloadaddr=0x80007fc0\0" \
+ 	"fdtaddr=0x80F80000\0" \
+ 	"rdaddr=0x81000000\0" \
+-	"bootfile=/boot/uImage\0" \
++	"bootfile=uImage\0" \
+ 	"console=ttyO0,115200n8\0" \
+ 	"optargs=\0" \
+ 	"mmcdev=0\0" \
+-	"mmcroot=/dev/mmcblk0p2 ro\0" \
+-	"mmcrootfstype=ext3 rootwait\0" \
++	"mmc_root=/dev/mmcblk0p2 ro\0" \
++	"mmc_root_fs_type=ext3 rootwait\0" \
+ 	"ramroot=/dev/ram0 rw ramdisk_size=65536 initrd=${rdaddr},64M\0" \
+ 	"ramrootfstype=ext2\0" \
+-	"mmcargs=setenv bootargs console=${console} " \
+-		"${optargs} " \
+-		"root=${mmcroot} " \
+-		"rootfstype=${mmcrootfstype}\0" \
++    "ip_method=none\0" \
++    "bootargs_defaults=setenv bootargs " \
++        "console=${console} " \
++        "${optargs}\0" \
++    "mmc_args=run bootargs_defaults;" \
++        "setenv bootargs ${bootargs} " \
++        "root=${mmc_root} " \
++        "rootfstype=${mmc_root_fs_type} ip=${ip_method}\0" \
+ 	"bootenv=uEnv.txt\0" \
+ 	"loadbootenv=fatload mmc ${mmcdev} ${loadaddr} ${bootenv}\0" \
+ 	"importbootenv=echo Importing environment from mmc ...; " \
+@@ -69,11 +74,11 @@
+ 		"root=${ramroot} " \
+ 		"rootfstype=${ramrootfstype}\0" \
+ 	"loadramdisk=fatload mmc ${mmcdev} ${rdaddr} ramdisk.gz\0" \
+-	"loaduimagefat=fatload mmc ${mmcdev} ${loadaddr} ${bootfile}\0" \
+-	"loaduimage=ext2load mmc ${mmcdev}:2 ${loadaddr} ${bootfile}\0" \
++	"loaduimagefat=fatload mmc ${mmcdev} ${kloadaddr} ${bootfile}\0" \
++	"loaduimage=ext2load mmc ${mmcdev}:2 ${kloadaddr} /boot/${bootfile}\0" \
+ 	"mmcboot=echo Booting from mmc ...; " \
+-		"run mmcargs; " \
+-		"bootm ${loadaddr}\0" \
++		"run mmc_args; " \
++		"bootm ${kloadaddr}\0" \
+ 	"ramboot=echo Booting from ramdisk ...; " \
+ 		"run ramargs; " \
+ 		"bootm ${loadaddr}\0" \
+@@ -93,8 +98,12 @@
+ 			"echo Running uenvcmd ...;" \
+ 			"run uenvcmd;" \
+ 		"fi;" \
+-		"if run loaduimage; then " \
++		"if run loaduimagefat; then " \
+ 			"run mmcboot;" \
++        "elif run loaduimage; then " \
++            "run mmcboot;" \
++        "else " \
++            "echo Cound not find ${bootfile} ;" \
+ 		"fi;" \
+ 	"fi;" \
+ 
+-- 
+1.7.0.4
+
diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot_2012.10-psp05.06.00.00.bb b/meta-arago-distro/recipes-bsp/u-boot/u-boot_2012.10-psp05.06.00.00.bb
index 31e64db..889f298 100644
--- a/meta-arago-distro/recipes-bsp/u-boot/u-boot_2012.10-psp05.06.00.00.bb
+++ b/meta-arago-distro/recipes-bsp/u-boot/u-boot_2012.10-psp05.06.00.00.bb
@@ -23,9 +23,11 @@ DEFAULT_PREFERENCE = "-1"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-PR = "r1+gitr${SRCPV}"
+PR = "r2+gitr${SRCPV}"
 
-SRC_URI = "git://arago-project.org/git/projects/u-boot-am33x.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://arago-project.org/git/projects/u-boot-am33x.git;protocol=git;branch=${BRANCH} \
+           file://0001-am335x_evm-fix-mmc-boot-environment-settings.patch \
+"
 
 BRANCH = "amsdk-05.06.00.00"
 
-- 
1.7.0.4


