Return-Path: <fcooperjr27@gmail.com>
Received: from mail-gg0-f182.google.com (mail-gg0-f182.google.com
	[209.85.161.182])
	by arago-project.org (Postfix) with ESMTPS id 4EEF552A2C
	for <meta-arago@arago-project.org>;
	Sun, 17 Feb 2013 22:54:01 +0000 (UTC)
Received: by mail-gg0-f182.google.com with SMTP id d1so466083ggn.27
	for <meta-arago@arago-project.org>;
	Sun, 17 Feb 2013 14:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=g/J9i3rZ0/6TpO0TkaWjXmawwPYrHuaLqyoxNViM0cg=;
	b=b6b7RzaGSrQsCbeKKxWxVbX+eNxyzewsbFZUBDpjcRuSRNjLyhVQn+gAwOcyOU3mP/
	xHsCKlrIb2Cs1p9ajc/WsbiAMQNeYzSdjq0MflW5BE8cukvtc+lAIk0UVff0eZf6HUs+
	n7sKFcG2LpxBh5SzFIC92sL2yJ1j+Sljh+JBAHf1Kl0FnewU7wOdy1pfaz2lRMpm/2/l
	2EytgMZGUqeoUycMdZoAsPpUETP3ynZHGr3oo/SumUrwNkvSvvNV6YvmXRKQ9MwoR4RK
	VPIy92Ew8K9bTQT3f8dSr7XycJVmHjClJJrL+WYAgwBdvde4GKH+aJNfO/8H/Befghre
	33lQ==
X-Received: by 10.236.158.138 with SMTP id q10mr16619592yhk.59.1361141640822; 
	Sun, 17 Feb 2013 14:54:00 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id s74sm3456861yhh.5.2013.02.17.14.53.59
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sun, 17 Feb 2013 14:53:59 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Sun, 17 Feb 2013 16:53:15 -0600
Message-Id: <1361141595-1687-20-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1361141595-1687-1-git-send-email-fcooper@ti.com>
References: <1361141595-1687-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 20/20] linux-am335x: "Add Remove check for GP-nly device type in RNG driver" patch
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
X-List-Received-Date: Sun, 17 Feb 2013 22:54:01 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 ...emove-check-for-GP-only-device-type-in-RN.patch |   29 ++++++++++++++++++++
 .../linux/linux-am335x_3.2.0-psp05.06.00.00.bb     |    3 +-
 2 files changed, 31 insertions(+), 1 deletions(-)
 create mode 100644 meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0001-omap4-rng-Remove-check-for-GP-only-device-type-in-RN.patch

diff --git a/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0001-omap4-rng-Remove-check-for-GP-only-device-type-in-RN.patch b/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0001-omap4-rng-Remove-check-for-GP-only-device-type-in-RN.patch
new file mode 100644
index 0000000..de2d841
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0001-omap4-rng-Remove-check-for-GP-only-device-type-in-RN.patch
@@ -0,0 +1,29 @@
+From 13d5d52eda239b752b249b0f1b3b01b93a890b55 Mon Sep 17 00:00:00 2001
+From: Joel A Fernandes <joelagnel@ti.com>
+Date: Wed, 13 Feb 2013 15:37:15 -0600
+Subject: [PATCH] omap4-rng: Remove check for GP-only device type in RNG driver
+
+HS devices can support RNG due to recent changes in firewall settings on L4.
+The patch enables RNG support on HS device.
+
+Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
+---
+ drivers/char/hw_random/omap4-rng.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/drivers/char/hw_random/omap4-rng.c b/drivers/char/hw_random/omap4-rng.c
+index 523ec63..9c3b87a 100644
+--- a/drivers/char/hw_random/omap4-rng.c
++++ b/drivers/char/hw_random/omap4-rng.c
+@@ -285,7 +285,7 @@ static struct platform_driver omap4_rng_driver = {
+ 
+ static int __init omap4_rng_init(void)
+ {
+-	if (!cpu_is_am33xx()  || omap_type() != OMAP2_DEVICE_TYPE_GP)
++	if (!cpu_is_am33xx())
+ 		return -ENODEV;
+ 
+ 	return platform_driver_register(&omap4_rng_driver);
+-- 
+1.7.4.1
+
diff --git a/meta-arago-distro/recipes-kernel/linux/linux-am335x_3.2.0-psp05.06.00.00.bb b/meta-arago-distro/recipes-kernel/linux/linux-am335x_3.2.0-psp05.06.00.00.bb
index 5e41d1b..e487f43 100644
--- a/meta-arago-distro/recipes-kernel/linux/linux-am335x_3.2.0-psp05.06.00.00.bb
+++ b/meta-arago-distro/recipes-kernel/linux/linux-am335x_3.2.0-psp05.06.00.00.bb
@@ -25,7 +25,7 @@ DEPENDS += "am33x-cm3"
 KERNEL_IMAGETYPE = "uImage"
 
 # The main PR is now using MACHINE_KERNEL_PR, for ti33x see conf/machine/include/ti33x.inc
-MACHINE_KERNEL_PR_append = "g+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "h+gitr${SRCPV}"
 
 BRANCH = "v3.2-staging"
 
@@ -72,6 +72,7 @@ PATCHES += "file://0001-am33x-Add-memory-addresses-for-crypto-modules.patch \
                 file://0008-crypto-omap4-aes-Don-t-use-hardcoded-base-address.patch \
                 file://0009-ARM-AM33xx-hwmod-Convert-RNG-device-data-to-hwmod.patch \
                 file://0010-hwrng-omap4-rng-Convert-to-use-pm_runtime-API.patch \
+                file://0001-omap4-rng-Remove-check-for-GP-only-device-type-in-RN.patch \
                "
 
 # Add SmartReflex support early driver patches while working to get the driver
-- 
1.7.0.4


