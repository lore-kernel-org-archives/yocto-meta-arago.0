Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id 1985B5208C
	for <meta-arago@arago-project.org>;
	Mon, 12 Nov 2012 22:46:47 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id eq6so2776625obc.38
	for <meta-arago@arago-project.org>;
	Mon, 12 Nov 2012 14:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=10U5R/YVcar+1CT0h1wRMlxmYEj6anE+W3zIs0WIzRw=;
	b=dHGptp8OMxOfueTayqBCeIK1gHHNBa5te8oGEQvYpXa6zYnhlM8p6jHknaFqyD1IjU
	BuofCwN+OdB471sbRSNiqzcLgUGUzU7C/eQ8ndbcxaLRR8RWhivP+wR7xtOsKKVr0Up+
	qSVBSqgAktVuqg0hdaoOzY3Qn/qIarB5tLZEoWGjrX3NP6MN4D8x6/uiwHjdJiVlXNxR
	MVJUtAg29HCFnDi9KE8XsQRfgKUhq9AjOW+iGzfmnEZVtq0WSa3TTRhSmIPaize0Qzkq
	DsQ5OHV11wtrUZhT/uSDPtQemcGSbyPtWWTPbTmZDSjw9OvS2E+BQ5qZSS/H95baGG5P
	/J2w==
Received: by 10.60.4.136 with SMTP id k8mr15896686oek.94.1352760406944;
	Mon, 12 Nov 2012 14:46:46 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id nd14sm8285868obb.14.2012.11.12.14.46.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 12 Nov 2012 14:46:46 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Mon, 12 Nov 2012 16:46:35 -0600
Message-Id: <1352760396-7331-4-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1352760396-7331-1-git-send-email-fcooper@ti.com>
References: <1352760396-7331-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 4/5] u-boot_2012.10-psp05.06.00.00: Add NET environment variables
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
X-List-Received-Date: Mon, 12 Nov 2012 22:46:47 -0000

* Add environment variables to support network booting

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 ...-am335x_evm-Add-NET-environment-variables.patch |   57 ++++++++++++++++++++
 .../u-boot/u-boot_2012.10-psp05.06.00.00.bb        |    3 +-
 2 files changed, 59 insertions(+), 1 deletions(-)
 create mode 100644 meta-arago-distro/recipes-bsp/u-boot/u-boot-2012.10-psp05.06.00.00/0004-am335x_evm-Add-NET-environment-variables.patch

diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot-2012.10-psp05.06.00.00/0004-am335x_evm-Add-NET-environment-variables.patch b/meta-arago-distro/recipes-bsp/u-boot/u-boot-2012.10-psp05.06.00.00/0004-am335x_evm-Add-NET-environment-variables.patch
new file mode 100644
index 0000000..0f9feb2
--- /dev/null
+++ b/meta-arago-distro/recipes-bsp/u-boot/u-boot-2012.10-psp05.06.00.00/0004-am335x_evm-Add-NET-environment-variables.patch
@@ -0,0 +1,57 @@
+From 1bd4ad389742f470124226c7d9c6ffcb0a004a61 Mon Sep 17 00:00:00 2001
+From: Chase Maupin <Chase.Maupin@ti.com>
+Date: Mon, 5 Nov 2012 15:32:53 -0600
+Subject: [PATCH 4/4] am335x_evm: Add NET environment variables
+
+* Add environment variables to support network booting
+
+Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
+---
+ include/configs/am335x_evm.h |   15 +++++++++++++++
+ 1 files changed, 15 insertions(+), 0 deletions(-)
+
+diff --git a/include/configs/am335x_evm.h b/include/configs/am335x_evm.h
+index 95e9914..954fae1 100644
+--- a/include/configs/am335x_evm.h
++++ b/include/configs/am335x_evm.h
+@@ -64,8 +64,12 @@
+     "spi_src_addr=0x62000\0" \
+     "spi_img_siz=0x380000\0" \
+     "spi_bus_no=0\0" \
++    "rootpath=/export/rootfs\0" \
++    "nfsopts=nolock\0" \
+ 	"ramroot=/dev/ram0 rw ramdisk_size=65536 initrd=${rdaddr},64M\0" \
+ 	"ramrootfstype=ext2\0" \
++    "static_ip=${ipaddr}:${serverip}:${gatewayip}:${netmask}:${hostname}" \
++            "::off\0" \
+     "ip_method=none\0" \
+     "bootargs_defaults=setenv bootargs " \
+         "console=${console} " \
+@@ -82,6 +86,11 @@
+         "setenv bootargs ${bootargs} " \
+         "root=${spi_root} " \
+         "rootfstype=${spi_root_fs_type} ip=${ip_method}\0" \
++    "net_args=run bootargs_defaults;" \
++        "setenv bootargs ${bootargs} " \
++        "root=/dev/nfs " \
++        "nfsroot=${serverip}:${rootpath},${nfsopts} rw " \
++        "ip=dhcp\0" \
+ 	"bootenv=uEnv.txt\0" \
+ 	"loadbootenv=fatload mmc ${mmcdev} ${loadaddr} ${bootenv}\0" \
+ 	"importbootenv=echo Importing environment from mmc ...; " \
+@@ -106,6 +115,12 @@
+         "sf probe ${spi_bus_no}:0; " \
+         "sf read ${kloadaddr} ${spi_src_addr} ${spi_img_siz}; " \
+         "bootm ${kloadaddr}\0" \
++    "net_boot=echo Booting from network ...; " \
++        "setenv autoload no; " \
++        "dhcp; " \
++        "tftp ${kloadaddr} ${bootfile}; " \
++        "run net_args; " \
++        "bootm ${kloadaddr}\0" \
+ 	"ramboot=echo Booting from ramdisk ...; " \
+ 		"run ramargs; " \
+ 		"bootm ${loadaddr}\0" \
+-- 
+1.7.0.4
+
diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot_2012.10-psp05.06.00.00.bb b/meta-arago-distro/recipes-bsp/u-boot/u-boot_2012.10-psp05.06.00.00.bb
index 920b087..3c2ef4b 100644
--- a/meta-arago-distro/recipes-bsp/u-boot/u-boot_2012.10-psp05.06.00.00.bb
+++ b/meta-arago-distro/recipes-bsp/u-boot/u-boot_2012.10-psp05.06.00.00.bb
@@ -23,12 +23,13 @@ DEFAULT_PREFERENCE = "-1"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-PR = "r4+gitr${SRCPV}"
+PR = "r5+gitr${SRCPV}"
 
 SRC_URI = "git://arago-project.org/git/projects/u-boot-am33x.git;protocol=git;branch=${BRANCH} \
            file://0001-am335x_evm-fix-mmc-boot-environment-settings.patch \
            file://0002-am335x_evm-Add-NAND-environment-variables.patch \
            file://0003-am335x_evm-Add-SPI-environment-variables.patch \
+           file://0004-am335x_evm-Add-NET-environment-variables.patch \
 "
 
 BRANCH = "amsdk-05.06.00.00"
-- 
1.7.0.4


