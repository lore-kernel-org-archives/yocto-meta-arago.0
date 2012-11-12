Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id 084CC5208C
	for <meta-arago@arago-project.org>;
	Mon, 12 Nov 2012 22:46:43 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so6217172oag.38
	for <meta-arago@arago-project.org>;
	Mon, 12 Nov 2012 14:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=Qi+Tg4VO+USF4+twpGBa0g9zh7Z2TlL404Dmc6S7W/c=;
	b=ClSkFLib3jfIUuuF9tx2vffZ9cFXnJblfm6i2WxmxDgEOfZJtpMu5rom0sxQGTw66o
	iT9IZ6DCkmP+K5QOBzOlQOqehzEq6Ts+WAgCe0K1tnXnETQ4W7IOA+Vf5t37Wp4l83nJ
	qqDsdsGCn7J2W4mc8sscQ59EgfWGHc5LPncXFgtHyJUTbBJ/DXVcgzqfPTlMpad+C+7s
	HjTbnmVvK2pWHyhFm6F35T81C5Mrie0kBpc/X0O2dqvF7KwT+mtRhpT5sRvpDwy/bOTg
	M/bTuLDcUOiu5DUAfslbNslJR7L9sHMdOPLRlRIA6ZBrb+qGgSGnrZ5P2Yp4KrDPn2O6
	mYsg==
Received: by 10.182.146.46 with SMTP id sz14mr16302652obb.76.1352760403841;
	Mon, 12 Nov 2012 14:46:43 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id nd14sm8285868obb.14.2012.11.12.14.46.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 12 Nov 2012 14:46:43 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Mon, 12 Nov 2012 16:46:33 -0600
Message-Id: <1352760396-7331-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1352760396-7331-1-git-send-email-fcooper@ti.com>
References: <1352760396-7331-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 2/5] u-boot_2012.10-psp05.06.00.00: Add NAND environment variables
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
X-List-Received-Date: Mon, 12 Nov 2012 22:46:44 -0000

* Add support to the default environment variables for NAND boot

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 ...am335x_evm-Add-NAND-environment-variables.patch |   54 ++++++++++++++++++++
 .../u-boot/u-boot_2012.10-psp05.06.00.00.bb        |    3 +-
 2 files changed, 56 insertions(+), 1 deletions(-)
 create mode 100644 meta-arago-distro/recipes-bsp/u-boot/u-boot-2012.10-psp05.06.00.00/0002-am335x_evm-Add-NAND-environment-variables.patch

diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot-2012.10-psp05.06.00.00/0002-am335x_evm-Add-NAND-environment-variables.patch b/meta-arago-distro/recipes-bsp/u-boot/u-boot-2012.10-psp05.06.00.00/0002-am335x_evm-Add-NAND-environment-variables.patch
new file mode 100644
index 0000000..840f202
--- /dev/null
+++ b/meta-arago-distro/recipes-bsp/u-boot/u-boot-2012.10-psp05.06.00.00/0002-am335x_evm-Add-NAND-environment-variables.patch
@@ -0,0 +1,54 @@
+From d2d417573964616b13bfc4738c2b21e187d3145c Mon Sep 17 00:00:00 2001
+From: Chase Maupin <Chase.Maupin@ti.com>
+Date: Mon, 5 Nov 2012 15:20:27 -0600
+Subject: [PATCH 2/4] am335x_evm: Add NAND environment variables
+
+* Added support to the default environment variables for NAND
+  boot.
+
+Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
+---
+ include/configs/am335x_evm.h |   13 +++++++++++++
+ 1 files changed, 13 insertions(+), 0 deletions(-)
+
+diff --git a/include/configs/am335x_evm.h b/include/configs/am335x_evm.h
+index bd9473b..c7f542c 100644
+--- a/include/configs/am335x_evm.h
++++ b/include/configs/am335x_evm.h
+@@ -55,6 +55,10 @@
+ 	"mmcdev=0\0" \
+ 	"mmc_root=/dev/mmcblk0p2 ro\0" \
+ 	"mmc_root_fs_type=ext3 rootwait\0" \
++    "nand_root=ubi0:rootfs rw ubi.mtd=7,2048\0" \
++    "nand_root_fs_type=ubifs rootwait=1\0" \
++    "nand_src_addr=0x280000\0" \
++    "nand_img_siz=0x500000\0" \
+ 	"ramroot=/dev/ram0 rw ramdisk_size=65536 initrd=${rdaddr},64M\0" \
+ 	"ramrootfstype=ext2\0" \
+     "ip_method=none\0" \
+@@ -65,6 +69,10 @@
+         "setenv bootargs ${bootargs} " \
+         "root=${mmc_root} " \
+         "rootfstype=${mmc_root_fs_type} ip=${ip_method}\0" \
++    "nand_args=run bootargs_defaults;" \
++        "setenv bootargs ${bootargs} " \
++        "root=${nand_root} noinitrd " \
++        "rootfstype=${nand_root_fs_type} ip=${ip_method}\0" \
+ 	"bootenv=uEnv.txt\0" \
+ 	"loadbootenv=fatload mmc ${mmcdev} ${loadaddr} ${bootenv}\0" \
+ 	"importbootenv=echo Importing environment from mmc ...; " \
+@@ -79,6 +87,11 @@
+ 	"mmcboot=echo Booting from mmc ...; " \
+ 		"run mmc_args; " \
+ 		"bootm ${kloadaddr}\0" \
++    "nand_boot=echo Booting from nand ...; " \
++        "run nand_args; " \
++        "nandecc hw 2; " \
++        "nand read.i ${kloadaddr} ${nand_src_addr} ${nand_img_siz}; " \
++        "bootm ${kloadaddr}\0" \
+ 	"ramboot=echo Booting from ramdisk ...; " \
+ 		"run ramargs; " \
+ 		"bootm ${loadaddr}\0" \
+-- 
+1.7.0.4
+
diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot_2012.10-psp05.06.00.00.bb b/meta-arago-distro/recipes-bsp/u-boot/u-boot_2012.10-psp05.06.00.00.bb
index 889f298..2923616 100644
--- a/meta-arago-distro/recipes-bsp/u-boot/u-boot_2012.10-psp05.06.00.00.bb
+++ b/meta-arago-distro/recipes-bsp/u-boot/u-boot_2012.10-psp05.06.00.00.bb
@@ -23,10 +23,11 @@ DEFAULT_PREFERENCE = "-1"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-PR = "r2+gitr${SRCPV}"
+PR = "r3+gitr${SRCPV}"
 
 SRC_URI = "git://arago-project.org/git/projects/u-boot-am33x.git;protocol=git;branch=${BRANCH} \
            file://0001-am335x_evm-fix-mmc-boot-environment-settings.patch \
+           file://0002-am335x_evm-Add-NAND-environment-variables.patch \
 "
 
 BRANCH = "amsdk-05.06.00.00"
-- 
1.7.0.4


