Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id 7E6BD52AB9
	for <meta-arago@arago-project.org>;
	Fri, 30 Nov 2012 16:31:40 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id x4so541426obh.38
	for <meta-arago@arago-project.org>;
	Fri, 30 Nov 2012 08:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=mo6DQstcW4yXN3i/pWTcpyc5vele/Bf/P2Q6Z2GDUOY=;
	b=Z+7j8G9MtyKTX9s3J26coJJFYL+/zG2dq1rsvXZseeC4NDkKrnxdncnQR9mG56ZPlb
	GEUH6fILhgNSMZqyaYeDQ0OQBGehE26yrbfdWD835QqLZMwBKtAvsAUxuSvb8RMcOY5i
	Iaa9/UM4lMJvcSyXQDNLjXOusl4Vx1x9PAo/N6689GZklqy/SAdmxEjIVaRbLjWy520E
	vGyRFc4mz5zdpIC822f3ydV8NGKsLlER8d8pQHd4b9hojCwHefzbeqecqU4Ofb45Pw5i
	+lqmXz82oSK9fQEmqk6kuqpIDY6s0AkRg/NllXGtGsJmIc7Sob7d76e0RsmV8EGCllhS
	CKVQ==
Received: by 10.60.171.201 with SMTP id aw9mr1381147oec.126.1354293099251;
	Fri, 30 Nov 2012 08:31:39 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id d17sm5302239obu.0.2012.11.30.08.31.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Nov 2012 08:31:38 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Fri, 30 Nov 2012 10:31:34 -0600
Message-Id: <1354293094-29835-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH] u-boot_2012.10-psp05.06.00.00: Remove environment variables patches
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
X-List-Received-Date: Fri, 30 Nov 2012 16:31:41 -0000

* Tom committed these environment variables patches to the git tree.
* No need to carry these patches in the recipe anymore.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 ...35x_evm-fix-mmc-boot-environment-settings.patch |   87 --------------------
 ...am335x_evm-Add-NAND-environment-variables.patch |   54 ------------
 ...-am335x_evm-Add-SPI-environment-variables.patch |   54 ------------
 ...-am335x_evm-Add-NET-environment-variables.patch |   57 -------------
 .../u-boot/u-boot_2012.10-psp05.06.00.00.bb        |    6 +-
 5 files changed, 1 insertions(+), 257 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-bsp/u-boot/u-boot-2012.10-psp05.06.00.00/0001-am335x_evm-fix-mmc-boot-environment-settings.patch
 delete mode 100644 meta-arago-distro/recipes-bsp/u-boot/u-boot-2012.10-psp05.06.00.00/0002-am335x_evm-Add-NAND-environment-variables.patch
 delete mode 100644 meta-arago-distro/recipes-bsp/u-boot/u-boot-2012.10-psp05.06.00.00/0003-am335x_evm-Add-SPI-environment-variables.patch
 delete mode 100644 meta-arago-distro/recipes-bsp/u-boot/u-boot-2012.10-psp05.06.00.00/0004-am335x_evm-Add-NET-environment-variables.patch

diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot-2012.10-psp05.06.00.00/0001-am335x_evm-fix-mmc-boot-environment-settings.patch b/meta-arago-distro/recipes-bsp/u-boot/u-boot-2012.10-psp05.06.00.00/0001-am335x_evm-fix-mmc-boot-environment-settings.patch
deleted file mode 100644
index 1a4f4b3..0000000
--- a/meta-arago-distro/recipes-bsp/u-boot/u-boot-2012.10-psp05.06.00.00/0001-am335x_evm-fix-mmc-boot-environment-settings.patch
+++ /dev/null
@@ -1,87 +0,0 @@
-From aecef85a39d4839d91e526b88264596417e66c45 Mon Sep 17 00:00:00 2001
-From: Chase Maupin <Chase.Maupin@ti.com>
-Date: Mon, 5 Nov 2012 15:13:05 -0600
-Subject: [PATCH 1/4] am335x_evm: fix mmc boot environment settings
-
-* Fixed the MMC boot environment settings to try first loading
-  the uImage from the FAT partition instead of the ext2 partition.
-* Changed to load the kernel image a kloadaddr to avoid the need
-  to relocate the kernel image during boot.
-* Added ip_method to mmc_args
-* Use bootargs_defaults to set common variables
-
-Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
----
- include/configs/am335x_evm.h |   33 +++++++++++++++++++++------------
- 1 files changed, 21 insertions(+), 12 deletions(-)
-
-diff --git a/include/configs/am335x_evm.h b/include/configs/am335x_evm.h
-index ec2d835..bd9473b 100644
---- a/include/configs/am335x_evm.h
-+++ b/include/configs/am335x_evm.h
-@@ -46,20 +46,25 @@
- 
- #define CONFIG_EXTRA_ENV_SETTINGS \
- 	"loadaddr=0x80200000\0" \
-+    "kloadaddr=0x80007fc0\0" \
- 	"fdtaddr=0x80F80000\0" \
- 	"rdaddr=0x81000000\0" \
--	"bootfile=/boot/uImage\0" \
-+	"bootfile=uImage\0" \
- 	"console=ttyO0,115200n8\0" \
- 	"optargs=\0" \
- 	"mmcdev=0\0" \
--	"mmcroot=/dev/mmcblk0p2 ro\0" \
--	"mmcrootfstype=ext3 rootwait\0" \
-+	"mmc_root=/dev/mmcblk0p2 ro\0" \
-+	"mmc_root_fs_type=ext3 rootwait\0" \
- 	"ramroot=/dev/ram0 rw ramdisk_size=65536 initrd=${rdaddr},64M\0" \
- 	"ramrootfstype=ext2\0" \
--	"mmcargs=setenv bootargs console=${console} " \
--		"${optargs} " \
--		"root=${mmcroot} " \
--		"rootfstype=${mmcrootfstype}\0" \
-+    "ip_method=none\0" \
-+    "bootargs_defaults=setenv bootargs " \
-+        "console=${console} " \
-+        "${optargs}\0" \
-+    "mmc_args=run bootargs_defaults;" \
-+        "setenv bootargs ${bootargs} " \
-+        "root=${mmc_root} " \
-+        "rootfstype=${mmc_root_fs_type} ip=${ip_method}\0" \
- 	"bootenv=uEnv.txt\0" \
- 	"loadbootenv=fatload mmc ${mmcdev} ${loadaddr} ${bootenv}\0" \
- 	"importbootenv=echo Importing environment from mmc ...; " \
-@@ -69,11 +74,11 @@
- 		"root=${ramroot} " \
- 		"rootfstype=${ramrootfstype}\0" \
- 	"loadramdisk=fatload mmc ${mmcdev} ${rdaddr} ramdisk.gz\0" \
--	"loaduimagefat=fatload mmc ${mmcdev} ${loadaddr} ${bootfile}\0" \
--	"loaduimage=ext2load mmc ${mmcdev}:2 ${loadaddr} ${bootfile}\0" \
-+	"loaduimagefat=fatload mmc ${mmcdev} ${kloadaddr} ${bootfile}\0" \
-+	"loaduimage=ext2load mmc ${mmcdev}:2 ${kloadaddr} /boot/${bootfile}\0" \
- 	"mmcboot=echo Booting from mmc ...; " \
--		"run mmcargs; " \
--		"bootm ${loadaddr}\0" \
-+		"run mmc_args; " \
-+		"bootm ${kloadaddr}\0" \
- 	"ramboot=echo Booting from ramdisk ...; " \
- 		"run ramargs; " \
- 		"bootm ${loadaddr}\0" \
-@@ -93,8 +98,12 @@
- 			"echo Running uenvcmd ...;" \
- 			"run uenvcmd;" \
- 		"fi;" \
--		"if run loaduimage; then " \
-+		"if run loaduimagefat; then " \
- 			"run mmcboot;" \
-+        "elif run loaduimage; then " \
-+            "run mmcboot;" \
-+        "else " \
-+            "echo Cound not find ${bootfile} ;" \
- 		"fi;" \
- 	"fi;" \
- 
--- 
-1.7.0.4
-
diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot-2012.10-psp05.06.00.00/0002-am335x_evm-Add-NAND-environment-variables.patch b/meta-arago-distro/recipes-bsp/u-boot/u-boot-2012.10-psp05.06.00.00/0002-am335x_evm-Add-NAND-environment-variables.patch
deleted file mode 100644
index 840f202..0000000
--- a/meta-arago-distro/recipes-bsp/u-boot/u-boot-2012.10-psp05.06.00.00/0002-am335x_evm-Add-NAND-environment-variables.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From d2d417573964616b13bfc4738c2b21e187d3145c Mon Sep 17 00:00:00 2001
-From: Chase Maupin <Chase.Maupin@ti.com>
-Date: Mon, 5 Nov 2012 15:20:27 -0600
-Subject: [PATCH 2/4] am335x_evm: Add NAND environment variables
-
-* Added support to the default environment variables for NAND
-  boot.
-
-Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
----
- include/configs/am335x_evm.h |   13 +++++++++++++
- 1 files changed, 13 insertions(+), 0 deletions(-)
-
-diff --git a/include/configs/am335x_evm.h b/include/configs/am335x_evm.h
-index bd9473b..c7f542c 100644
---- a/include/configs/am335x_evm.h
-+++ b/include/configs/am335x_evm.h
-@@ -55,6 +55,10 @@
- 	"mmcdev=0\0" \
- 	"mmc_root=/dev/mmcblk0p2 ro\0" \
- 	"mmc_root_fs_type=ext3 rootwait\0" \
-+    "nand_root=ubi0:rootfs rw ubi.mtd=7,2048\0" \
-+    "nand_root_fs_type=ubifs rootwait=1\0" \
-+    "nand_src_addr=0x280000\0" \
-+    "nand_img_siz=0x500000\0" \
- 	"ramroot=/dev/ram0 rw ramdisk_size=65536 initrd=${rdaddr},64M\0" \
- 	"ramrootfstype=ext2\0" \
-     "ip_method=none\0" \
-@@ -65,6 +69,10 @@
-         "setenv bootargs ${bootargs} " \
-         "root=${mmc_root} " \
-         "rootfstype=${mmc_root_fs_type} ip=${ip_method}\0" \
-+    "nand_args=run bootargs_defaults;" \
-+        "setenv bootargs ${bootargs} " \
-+        "root=${nand_root} noinitrd " \
-+        "rootfstype=${nand_root_fs_type} ip=${ip_method}\0" \
- 	"bootenv=uEnv.txt\0" \
- 	"loadbootenv=fatload mmc ${mmcdev} ${loadaddr} ${bootenv}\0" \
- 	"importbootenv=echo Importing environment from mmc ...; " \
-@@ -79,6 +87,11 @@
- 	"mmcboot=echo Booting from mmc ...; " \
- 		"run mmc_args; " \
- 		"bootm ${kloadaddr}\0" \
-+    "nand_boot=echo Booting from nand ...; " \
-+        "run nand_args; " \
-+        "nandecc hw 2; " \
-+        "nand read.i ${kloadaddr} ${nand_src_addr} ${nand_img_siz}; " \
-+        "bootm ${kloadaddr}\0" \
- 	"ramboot=echo Booting from ramdisk ...; " \
- 		"run ramargs; " \
- 		"bootm ${loadaddr}\0" \
--- 
-1.7.0.4
-
diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot-2012.10-psp05.06.00.00/0003-am335x_evm-Add-SPI-environment-variables.patch b/meta-arago-distro/recipes-bsp/u-boot/u-boot-2012.10-psp05.06.00.00/0003-am335x_evm-Add-SPI-environment-variables.patch
deleted file mode 100644
index 316bd22..0000000
--- a/meta-arago-distro/recipes-bsp/u-boot/u-boot-2012.10-psp05.06.00.00/0003-am335x_evm-Add-SPI-environment-variables.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From c2f5b8e4caf33ccd62ba9b245a28d56e3d814471 Mon Sep 17 00:00:00 2001
-From: Chase Maupin <Chase.Maupin@ti.com>
-Date: Mon, 5 Nov 2012 15:26:51 -0600
-Subject: [PATCH 3/4] am335x_evm: Add SPI environment variables
-
-* Added variables to support SPI booting
-
-Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
----
- include/configs/am335x_evm.h |   14 ++++++++++++++
- 1 files changed, 14 insertions(+), 0 deletions(-)
-
-diff --git a/include/configs/am335x_evm.h b/include/configs/am335x_evm.h
-index c7f542c..95e9914 100644
---- a/include/configs/am335x_evm.h
-+++ b/include/configs/am335x_evm.h
-@@ -59,6 +59,11 @@
-     "nand_root_fs_type=ubifs rootwait=1\0" \
-     "nand_src_addr=0x280000\0" \
-     "nand_img_siz=0x500000\0" \
-+    "spi_root=/dev/mtdblock4 rw\0" \
-+    "spi_root_fs_type=jffs2\0" \
-+    "spi_src_addr=0x62000\0" \
-+    "spi_img_siz=0x380000\0" \
-+    "spi_bus_no=0\0" \
- 	"ramroot=/dev/ram0 rw ramdisk_size=65536 initrd=${rdaddr},64M\0" \
- 	"ramrootfstype=ext2\0" \
-     "ip_method=none\0" \
-@@ -73,6 +78,10 @@
-         "setenv bootargs ${bootargs} " \
-         "root=${nand_root} noinitrd " \
-         "rootfstype=${nand_root_fs_type} ip=${ip_method}\0" \
-+    "spi_args=run bootargs_defaults;" \
-+        "setenv bootargs ${bootargs} " \
-+        "root=${spi_root} " \
-+        "rootfstype=${spi_root_fs_type} ip=${ip_method}\0" \
- 	"bootenv=uEnv.txt\0" \
- 	"loadbootenv=fatload mmc ${mmcdev} ${loadaddr} ${bootenv}\0" \
- 	"importbootenv=echo Importing environment from mmc ...; " \
-@@ -92,6 +101,11 @@
-         "nandecc hw 2; " \
-         "nand read.i ${kloadaddr} ${nand_src_addr} ${nand_img_siz}; " \
-         "bootm ${kloadaddr}\0" \
-+    "spi_boot=echo Booting from spi ...; " \
-+        "run spi_args; " \
-+        "sf probe ${spi_bus_no}:0; " \
-+        "sf read ${kloadaddr} ${spi_src_addr} ${spi_img_siz}; " \
-+        "bootm ${kloadaddr}\0" \
- 	"ramboot=echo Booting from ramdisk ...; " \
- 		"run ramargs; " \
- 		"bootm ${loadaddr}\0" \
--- 
-1.7.0.4
-
diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot-2012.10-psp05.06.00.00/0004-am335x_evm-Add-NET-environment-variables.patch b/meta-arago-distro/recipes-bsp/u-boot/u-boot-2012.10-psp05.06.00.00/0004-am335x_evm-Add-NET-environment-variables.patch
deleted file mode 100644
index 0f9feb2..0000000
--- a/meta-arago-distro/recipes-bsp/u-boot/u-boot-2012.10-psp05.06.00.00/0004-am335x_evm-Add-NET-environment-variables.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 1bd4ad389742f470124226c7d9c6ffcb0a004a61 Mon Sep 17 00:00:00 2001
-From: Chase Maupin <Chase.Maupin@ti.com>
-Date: Mon, 5 Nov 2012 15:32:53 -0600
-Subject: [PATCH 4/4] am335x_evm: Add NET environment variables
-
-* Add environment variables to support network booting
-
-Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
----
- include/configs/am335x_evm.h |   15 +++++++++++++++
- 1 files changed, 15 insertions(+), 0 deletions(-)
-
-diff --git a/include/configs/am335x_evm.h b/include/configs/am335x_evm.h
-index 95e9914..954fae1 100644
---- a/include/configs/am335x_evm.h
-+++ b/include/configs/am335x_evm.h
-@@ -64,8 +64,12 @@
-     "spi_src_addr=0x62000\0" \
-     "spi_img_siz=0x380000\0" \
-     "spi_bus_no=0\0" \
-+    "rootpath=/export/rootfs\0" \
-+    "nfsopts=nolock\0" \
- 	"ramroot=/dev/ram0 rw ramdisk_size=65536 initrd=${rdaddr},64M\0" \
- 	"ramrootfstype=ext2\0" \
-+    "static_ip=${ipaddr}:${serverip}:${gatewayip}:${netmask}:${hostname}" \
-+            "::off\0" \
-     "ip_method=none\0" \
-     "bootargs_defaults=setenv bootargs " \
-         "console=${console} " \
-@@ -82,6 +86,11 @@
-         "setenv bootargs ${bootargs} " \
-         "root=${spi_root} " \
-         "rootfstype=${spi_root_fs_type} ip=${ip_method}\0" \
-+    "net_args=run bootargs_defaults;" \
-+        "setenv bootargs ${bootargs} " \
-+        "root=/dev/nfs " \
-+        "nfsroot=${serverip}:${rootpath},${nfsopts} rw " \
-+        "ip=dhcp\0" \
- 	"bootenv=uEnv.txt\0" \
- 	"loadbootenv=fatload mmc ${mmcdev} ${loadaddr} ${bootenv}\0" \
- 	"importbootenv=echo Importing environment from mmc ...; " \
-@@ -106,6 +115,12 @@
-         "sf probe ${spi_bus_no}:0; " \
-         "sf read ${kloadaddr} ${spi_src_addr} ${spi_img_siz}; " \
-         "bootm ${kloadaddr}\0" \
-+    "net_boot=echo Booting from network ...; " \
-+        "setenv autoload no; " \
-+        "dhcp; " \
-+        "tftp ${kloadaddr} ${bootfile}; " \
-+        "run net_args; " \
-+        "bootm ${kloadaddr}\0" \
- 	"ramboot=echo Booting from ramdisk ...; " \
- 		"run ramargs; " \
- 		"bootm ${loadaddr}\0" \
--- 
-1.7.0.4
-
diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot_2012.10-psp05.06.00.00.bb b/meta-arago-distro/recipes-bsp/u-boot/u-boot_2012.10-psp05.06.00.00.bb
index 3c2ef4b..d18af34 100644
--- a/meta-arago-distro/recipes-bsp/u-boot/u-boot_2012.10-psp05.06.00.00.bb
+++ b/meta-arago-distro/recipes-bsp/u-boot/u-boot_2012.10-psp05.06.00.00.bb
@@ -23,13 +23,9 @@ DEFAULT_PREFERENCE = "-1"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-PR = "r5+gitr${SRCPV}"
+PR = "r6+gitr${SRCPV}"
 
 SRC_URI = "git://arago-project.org/git/projects/u-boot-am33x.git;protocol=git;branch=${BRANCH} \
-           file://0001-am335x_evm-fix-mmc-boot-environment-settings.patch \
-           file://0002-am335x_evm-Add-NAND-environment-variables.patch \
-           file://0003-am335x_evm-Add-SPI-environment-variables.patch \
-           file://0004-am335x_evm-Add-NET-environment-variables.patch \
 "
 
 BRANCH = "amsdk-05.06.00.00"
-- 
1.7.0.4


