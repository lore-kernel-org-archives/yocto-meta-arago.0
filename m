Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f171.google.com (mail-ob0-f171.google.com
	[209.85.214.171])
	by arago-project.org (Postfix) with ESMTPS id CEA7B52A85
	for <meta-arago@arago-project.org>;
	Mon, 28 Jan 2013 17:25:53 +0000 (UTC)
Received: by mail-ob0-f171.google.com with SMTP id lz20so3027394obb.30
	for <meta-arago@arago-project.org>;
	Mon, 28 Jan 2013 09:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=dtBzGKs2KJLAFfyxJ/rYHjU6rfDIfIX6QfBfoAY2EWU=;
	b=sd6lZgAbdZNF78zkLoCsns+SRVtWcEw7QeGeDEN8U8n91uTzF8QmcCkvCoZ3AD4nEc
	QivFUknI41EvkxTZI3eReuIVlIrK3B/2TezUXUYRq8hDqbsRNc9iFkYA1yPVsTZft0gY
	DSuONrlZcNvnwf1V+1Hu3jmRSof6E+rD/t4pIhc3zZ5knt0ISz55ZVJbAV37llb5XCMA
	RjpNKFcRCQzJSkZtlrck6RWXIdF69xZkN8Ai0MZkor10HcMBBQXEONG2LC6aQRTbsC2m
	S4Lq59vHffGk/JTbdedAO2tm9NnDghUbKY3pYUb0vN2iDMiN5tqsSZR0U2RqeR8nyOIE
	97hQ==
X-Received: by 10.182.78.228 with SMTP id e4mr11768122obx.77.1359393953014;
	Mon, 28 Jan 2013 09:25:53 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id m3sm8149180obm.21.2013.01.28.09.25.51
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 28 Jan 2013 09:25:51 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Mon, 28 Jan 2013 11:25:08 -0600
Message-Id: <1359393932-31361-8-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1359393932-31361-1-git-send-email-fcooper@ti.com>
References: <1359393932-31361-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 08/32] linux-am335x: Add patch to Update SPI flash layout
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
X-List-Received-Date: Mon, 28 Jan 2013 17:25:53 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* Patch commit message:
  Current U-Boot has grown, and our size of the environment was never
  correct, rework the offsets for minimal impact.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 ...-ARM-OMAP2-AM335x-Update-SPI-flash-layout.patch |   40 ++++++++++++++++++++
 .../linux/linux-am335x_3.2.0-psp05.06.00.00.bb     |    5 ++-
 2 files changed, 44 insertions(+), 1 deletions(-)
 create mode 100644 meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0001-ARM-OMAP2-AM335x-Update-SPI-flash-layout.patch

diff --git a/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0001-ARM-OMAP2-AM335x-Update-SPI-flash-layout.patch b/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0001-ARM-OMAP2-AM335x-Update-SPI-flash-layout.patch
new file mode 100644
index 0000000..afa55dd
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0001-ARM-OMAP2-AM335x-Update-SPI-flash-layout.patch
@@ -0,0 +1,40 @@
+From 54690cd10741ec54acc2555c3b699de310571a49 Mon Sep 17 00:00:00 2001
+From: Tom Rini <trini@ti.com>
+Date: Fri, 7 Dec 2012 14:01:51 -0700
+Subject: [PATCH] ARM: OMAP2+: AM335x: Update SPI flash layout
+
+Current U-Boot has grown, and our size of the environment was never
+correct, rework the offsets for minimal impact.
+
+Signed-off-by: Tom Rini <trini@ti.com>
+
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index 50e1d9b..3357d88 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -1201,17 +1201,17 @@ static struct mtd_partition am335x_spi_partitions[] = {
+ 	{
+ 		.name       = "U-Boot",
+ 		.offset     = MTDPART_OFS_APPEND,	/* Offset = 0x20000 */
+-		.size       = 2 * SZ_128K,
++		.size       = (3 * SZ_128K) - SZ_4K,
+ 	},
+ 	{
+ 		.name       = "U-Boot Env",
+-		.offset     = MTDPART_OFS_APPEND,	/* Offset = 0x60000 */
+-		.size       = 2 * SZ_4K,
++		.offset     = MTDPART_OFS_APPEND,	/* Offset = 0x7F000 */
++		.size       = SZ_4K,
+ 	},
+ 	{
+ 		.name       = "Kernel",
+-		.offset     = MTDPART_OFS_APPEND,	/* Offset = 0x62000 */
+-		.size       = 28 * SZ_128K,
++		.offset     = MTDPART_OFS_APPEND,	/* Offset = 0x80000 */
++		.size       = 866 * SZ_4K,		/* size = 0x362000 */
+ 	},
+ 	{
+ 		.name       = "File System",
+-- 
+1.7.9.5
+
diff --git a/meta-arago-distro/recipes-kernel/linux/linux-am335x_3.2.0-psp05.06.00.00.bb b/meta-arago-distro/recipes-kernel/linux/linux-am335x_3.2.0-psp05.06.00.00.bb
index aefa361..bc27dfb 100644
--- a/meta-arago-distro/recipes-kernel/linux/linux-am335x_3.2.0-psp05.06.00.00.bb
+++ b/meta-arago-distro/recipes-kernel/linux/linux-am335x_3.2.0-psp05.06.00.00.bb
@@ -25,7 +25,7 @@ DEPENDS += "am33x-cm3"
 KERNEL_IMAGETYPE = "uImage"
 
 # The main PR is now using MACHINE_KERNEL_PR, for ti33x see conf/machine/include/ti33x.inc
-MACHINE_KERNEL_PR_append = "d+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "e+gitr${SRCPV}"
 
 BRANCH = "v3.2-staging"
 
@@ -83,6 +83,9 @@ PATCHES += "file://0001-am335xevm-using-edge-triggered-interrupts-for-WLAN.patch
 # Add patch to enable pullup on WLAN enable
 PATCHES += "file://0001-am335x-enable-pullup-on-the-WLAN-enable-pin-fo.patch"
 
+# Update SPI flash layout. Increase space allocated for u-boot
+PATCHES += "file://0001-ARM-OMAP2-AM335x-Update-SPI-flash-layout.patch"
+
 # Copy the am33x-cm3 firmware if it is available
 do_compile_prepend() {
     if [ -e "${STAGING_DIR_HOST}/${base_libdir}/firmware/am335x-pm-firmware.bin" ]
-- 
1.7.0.4


