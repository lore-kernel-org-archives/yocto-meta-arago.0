Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id F41365208C
	for <meta-arago@arago-project.org>;
	Mon, 12 Nov 2012 22:46:45 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id eq6so2776625obc.38
	for <meta-arago@arago-project.org>;
	Mon, 12 Nov 2012 14:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=tAbR080cmuB5cVj/v6Duok0NoAol7FWvRpCJBa4zCU0=;
	b=fnhXw/EdAkN+nOwERsCM7eNN6yMIsia9M7FeffgXQeAHoruBEd8WGNB2HgZiTeF8qD
	/Z4LQr2BlKWeJD4QQhSDxjljmH5Qs+tfgX9IAGP4WAkBnllQemi09iUlyrv5rz85H8IX
	/nlupY6paBr3NusbaZNwkaDgpbqi5pqokoe25N7N35OZ60QrPETEUYAkAxLulUTxa2RU
	kMf7UcbbC9wcWybw05NjC2SQ+4/LuNsf04n/T7yodo0wRCZpB6Pq+fd52oRtE8weWenQ
	Sp9vrXGwvXLPRPLn+XybfM0RavxtrGBimgMg3VajLjQ77R93ZirotjFOEYTCayBmbUBr
	T9bg==
Received: by 10.182.113.5 with SMTP id iu5mr16593535obb.36.1352760405564;
	Mon, 12 Nov 2012 14:46:45 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id nd14sm8285868obb.14.2012.11.12.14.46.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 12 Nov 2012 14:46:45 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Mon, 12 Nov 2012 16:46:34 -0600
Message-Id: <1352760396-7331-3-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1352760396-7331-1-git-send-email-fcooper@ti.com>
References: <1352760396-7331-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 3/5] u-boot_2012.10-psp05.06.00.00: Add SPI environment variables
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
X-List-Received-Date: Mon, 12 Nov 2012 22:46:46 -0000

* Add variables to support SPI booting

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 ...-am335x_evm-Add-SPI-environment-variables.patch |   54 ++++++++++++++++++++
 .../u-boot/u-boot_2012.10-psp05.06.00.00.bb        |    3 +-
 2 files changed, 56 insertions(+), 1 deletions(-)
 create mode 100644 meta-arago-distro/recipes-bsp/u-boot/u-boot-2012.10-psp05.06.00.00/0003-am335x_evm-Add-SPI-environment-variables.patch

diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot-2012.10-psp05.06.00.00/0003-am335x_evm-Add-SPI-environment-variables.patch b/meta-arago-distro/recipes-bsp/u-boot/u-boot-2012.10-psp05.06.00.00/0003-am335x_evm-Add-SPI-environment-variables.patch
new file mode 100644
index 0000000..316bd22
--- /dev/null
+++ b/meta-arago-distro/recipes-bsp/u-boot/u-boot-2012.10-psp05.06.00.00/0003-am335x_evm-Add-SPI-environment-variables.patch
@@ -0,0 +1,54 @@
+From c2f5b8e4caf33ccd62ba9b245a28d56e3d814471 Mon Sep 17 00:00:00 2001
+From: Chase Maupin <Chase.Maupin@ti.com>
+Date: Mon, 5 Nov 2012 15:26:51 -0600
+Subject: [PATCH 3/4] am335x_evm: Add SPI environment variables
+
+* Added variables to support SPI booting
+
+Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
+---
+ include/configs/am335x_evm.h |   14 ++++++++++++++
+ 1 files changed, 14 insertions(+), 0 deletions(-)
+
+diff --git a/include/configs/am335x_evm.h b/include/configs/am335x_evm.h
+index c7f542c..95e9914 100644
+--- a/include/configs/am335x_evm.h
++++ b/include/configs/am335x_evm.h
+@@ -59,6 +59,11 @@
+     "nand_root_fs_type=ubifs rootwait=1\0" \
+     "nand_src_addr=0x280000\0" \
+     "nand_img_siz=0x500000\0" \
++    "spi_root=/dev/mtdblock4 rw\0" \
++    "spi_root_fs_type=jffs2\0" \
++    "spi_src_addr=0x62000\0" \
++    "spi_img_siz=0x380000\0" \
++    "spi_bus_no=0\0" \
+ 	"ramroot=/dev/ram0 rw ramdisk_size=65536 initrd=${rdaddr},64M\0" \
+ 	"ramrootfstype=ext2\0" \
+     "ip_method=none\0" \
+@@ -73,6 +78,10 @@
+         "setenv bootargs ${bootargs} " \
+         "root=${nand_root} noinitrd " \
+         "rootfstype=${nand_root_fs_type} ip=${ip_method}\0" \
++    "spi_args=run bootargs_defaults;" \
++        "setenv bootargs ${bootargs} " \
++        "root=${spi_root} " \
++        "rootfstype=${spi_root_fs_type} ip=${ip_method}\0" \
+ 	"bootenv=uEnv.txt\0" \
+ 	"loadbootenv=fatload mmc ${mmcdev} ${loadaddr} ${bootenv}\0" \
+ 	"importbootenv=echo Importing environment from mmc ...; " \
+@@ -92,6 +101,11 @@
+         "nandecc hw 2; " \
+         "nand read.i ${kloadaddr} ${nand_src_addr} ${nand_img_siz}; " \
+         "bootm ${kloadaddr}\0" \
++    "spi_boot=echo Booting from spi ...; " \
++        "run spi_args; " \
++        "sf probe ${spi_bus_no}:0; " \
++        "sf read ${kloadaddr} ${spi_src_addr} ${spi_img_siz}; " \
++        "bootm ${kloadaddr}\0" \
+ 	"ramboot=echo Booting from ramdisk ...; " \
+ 		"run ramargs; " \
+ 		"bootm ${loadaddr}\0" \
+-- 
+1.7.0.4
+
diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot_2012.10-psp05.06.00.00.bb b/meta-arago-distro/recipes-bsp/u-boot/u-boot_2012.10-psp05.06.00.00.bb
index 2923616..920b087 100644
--- a/meta-arago-distro/recipes-bsp/u-boot/u-boot_2012.10-psp05.06.00.00.bb
+++ b/meta-arago-distro/recipes-bsp/u-boot/u-boot_2012.10-psp05.06.00.00.bb
@@ -23,11 +23,12 @@ DEFAULT_PREFERENCE = "-1"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-PR = "r3+gitr${SRCPV}"
+PR = "r4+gitr${SRCPV}"
 
 SRC_URI = "git://arago-project.org/git/projects/u-boot-am33x.git;protocol=git;branch=${BRANCH} \
            file://0001-am335x_evm-fix-mmc-boot-environment-settings.patch \
            file://0002-am335x_evm-Add-NAND-environment-variables.patch \
+           file://0003-am335x_evm-Add-SPI-environment-variables.patch \
 "
 
 BRANCH = "amsdk-05.06.00.00"
-- 
1.7.0.4


