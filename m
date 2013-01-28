Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f180.google.com (mail-ob0-f180.google.com
	[209.85.214.180])
	by arago-project.org (Postfix) with ESMTPS id 774CD52A6F
	for <meta-arago@arago-project.org>;
	Mon, 28 Jan 2013 17:26:25 +0000 (UTC)
Received: by mail-ob0-f180.google.com with SMTP id ef5so3064000obb.11
	for <meta-arago@arago-project.org>;
	Mon, 28 Jan 2013 09:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=LTYzcuSsRsM7F7PDpPEU3H3g/u/NJ6K8uaHscA+7DRw=;
	b=iQRkFHod0BDCaRSmSFCpaTYqoSps8rilwSer0q053JOP2zoUpjdlunvyxKpE1P11nr
	j/h9LeTLb2GPU8R70SCHShQXMwcd/VqZMztTc3RXrA2c4HWJfGHwJ4to3FEObJtwejsS
	1pffdCCJtGVyGmdwWgWUefHe7yPo1a9vAPTq2kZ+vYFGF7x+vpHVFmE+2LZVCKgry/Vp
	ttpkNzXGIQN8vnAlFoBl0Y9axgdzxh03HJ9PmaKxssjbWT9Ev0NXGOvjArbAGrIlLB9D
	nn/OW0FcUhsjK7PN8lQ5uikaYppMPl88Bpks/MLt+6TEihNFDURaJVTgj49y+58BWooY
	J0ow==
X-Received: by 10.60.172.131 with SMTP id bc3mr4665655oec.79.1359393984993;
	Mon, 28 Jan 2013 09:26:24 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id m3sm8149180obm.21.2013.01.28.09.26.23
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 28 Jan 2013 09:26:24 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Mon, 28 Jan 2013 11:25:26 -0600
Message-Id: <1359393932-31361-26-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1359393932-31361-1-git-send-email-fcooper@ti.com>
References: <1359393932-31361-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 26/32] linux-am335x-3.2.0-psp05.06.00.00: Fix Suspend and Resume
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
X-List-Received-Date: Mon, 28 Jan 2013 17:26:25 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* Suspend and resume was failing due to the crypto driver.
* Add a series of patches that properly handles power management within the
  crypto drivers.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 ...hwmod-Convert-SHA0-crypto-device-data-to-.patch |  168 +++++++++++++++++++
 ...map4-sham-Use-finer-grained-PM-management.patch |   98 +++++++++++
 ...-omap4-sham-Add-suspend-resume-PM-support.patch |   56 ++++++
 ...ap4-sham-Don-t-use-hardcoded-base-address.patch |   45 +++++
 ...hwmod-Convert-AES0-crypto-device-data-to-.patch |  165 ++++++++++++++++++
 ...map4-aes-User-finer-grained-PM-management.patch |  127 ++++++++++++++
 ...o-omap4-aes-Add-suspend-resume-PM-support.patch |   56 ++++++
 ...map4-aes-Don-t-use-hardcoded-base-address.patch |   45 +++++
 ...xx-hwmod-Convert-RNG-device-data-to-hwmod.patch |  176 ++++++++++++++++++++
 ...g-omap4-rng-Convert-to-use-pm_runtime-API.patch |   91 ++++++++++
 .../linux/linux-am335x_3.2.0-psp05.06.00.00.bb     |   12 ++-
 11 files changed, 1038 insertions(+), 1 deletions(-)
 create mode 100644 meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0001-ARM-AM33xx-hwmod-Convert-SHA0-crypto-device-data-to-.patch
 create mode 100644 meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0002-crypto-omap4-sham-Use-finer-grained-PM-management.patch
 create mode 100644 meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0003-crypto-omap4-sham-Add-suspend-resume-PM-support.patch
 create mode 100644 meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0004-crypto-omap4-sham-Don-t-use-hardcoded-base-address.patch
 create mode 100644 meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0005-ARM-AM33xx-hwmod-Convert-AES0-crypto-device-data-to-.patch
 create mode 100644 meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0006-crypto-omap4-aes-User-finer-grained-PM-management.patch
 create mode 100644 meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0007-crypto-omap4-aes-Add-suspend-resume-PM-support.patch
 create mode 100644 meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0008-crypto-omap4-aes-Don-t-use-hardcoded-base-address.patch
 create mode 100644 meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0009-ARM-AM33xx-hwmod-Convert-RNG-device-data-to-hwmod.patch
 create mode 100644 meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0010-hwrng-omap4-rng-Convert-to-use-pm_runtime-API.patch

diff --git a/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0001-ARM-AM33xx-hwmod-Convert-SHA0-crypto-device-data-to-.patch b/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0001-ARM-AM33xx-hwmod-Convert-SHA0-crypto-device-data-to-.patch
new file mode 100644
index 0000000..3fe831c
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0001-ARM-AM33xx-hwmod-Convert-SHA0-crypto-device-data-to-.patch
@@ -0,0 +1,168 @@
+From 9193aa814bde2b56aaae1949d42d8849cb60260e Mon Sep 17 00:00:00 2001
+From: "Mark A. Greer" <mgreer@animalcreek.com>
+Date: Tue, 11 Dec 2012 09:20:16 -0700
+Subject: [PATCH 01/10] ARM: AM33xx: hwmod: Convert SHA0 crypto device data to
+ hwmod
+
+Convert the device data for the AM33xx SHA0 crypto modules
+from explicit platform_data to hwmod.
+
+Signed-off-by: Mark A. Greer <mgreer@animalcreek.com>
+---
+ arch/arm/mach-omap2/devices.c              | 68 +++---------------------------
+ arch/arm/mach-omap2/omap_hwmod_33xx_data.c | 32 ++++++++++++++
+ 2 files changed, 39 insertions(+), 61 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/devices.c b/arch/arm/mach-omap2/devices.c
+index c2e1d84..3679369 100644
+--- a/arch/arm/mach-omap2/devices.c
++++ b/arch/arm/mach-omap2/devices.c
+@@ -726,72 +726,18 @@ static void omap_init_sham(void)
+ }
+ 
+ #elif defined(CONFIG_CRYPTO_DEV_OMAP4_SHAM) || defined(CONFIG_CRYPTO_DEV_OMAP4_SHAM_MODULE)
+-
+-static struct resource omap4_sham_resources[] = {
+-	{
+-		.start	= AM33XX_SHA1MD5_P_BASE,
+-		.end	= AM33XX_SHA1MD5_P_BASE + 0x120,
+-		.flags	= IORESOURCE_MEM,
+-	},
+-	{
+-		.start	= AM33XX_IRQ_SHAEIP57t0_P,
+-		.flags	= IORESOURCE_IRQ,
+-	},
+-	{
+-		.start	= AM33XX_DMA_SHAEIP57T0_DIN,
+-		.flags	= IORESOURCE_DMA,
+-	}
+-};
+-
+-static int omap4_sham_resources_sz = ARRAY_SIZE(omap4_sham_resources);
+-
+-
+-static struct platform_device sham_device = {
+-	.name		= "omap4-sham",
+-	.id		= -1,
+-};
+-
+-#if 0
+-static void omap_init_sham(void)
+-{
+-	sham_device.resource = omap4_sham_resources;
+-	sham_device.num_resources = omap4_sham_resources_sz;
+-
+-	platform_device_register(&sham_device);
+-}
+-#endif
+-
+-int __init omap_init_sham(void)
++static void __init omap_init_sham(void)
+ {
+-	int id = -1;
+-	struct platform_device *pdev;
+ 	struct omap_hwmod *oh;
+-	char *oh_name = "sha0";
+-	char *name = "omap4-sham";
+-
+-	oh = omap_hwmod_lookup(oh_name);
+-	if (!oh) {
+-		pr_err("Could not look up %s\n", oh_name);
+-		return -ENODEV;
+-	}
+-
+-	pdev = omap_device_build(name, id, oh, NULL, 0, NULL, 0, 0);
+-	//pdev.resource = omap4_sham_resources;
+-	//pdev.num_resources = omap4_sham_resources_sz;
++	struct platform_device *pdev;
+ 
+-	if (IS_ERR(pdev)) {
+-		WARN(1, "Can't build omap_device for %s:%s.\n",
+-						name, oh->name);
+-		return PTR_ERR(pdev);
+-	}
++	oh = omap_hwmod_lookup("sha0");
++	if (!oh)
++		return;
+ 
+-	return 0;
++	pdev = omap_device_build("omap4-sham", -1, oh, NULL, 0, NULL, 0, 0);
++	WARN(IS_ERR(pdev), "Can't build omap_device for omap-sham\n");
+ }
+-
+-
+-
+-
+-
+ #else
+ static inline void omap_init_sham(void) { }
+ #endif
+diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
+index ee3ebd9..ad606c6 100644
+--- a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
++++ b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
+@@ -79,6 +79,7 @@ static struct omap_hwmod am33xx_spi1_hwmod;
+ static struct omap_hwmod am33xx_elm_hwmod;
+ static struct omap_hwmod am33xx_adc_tsc_hwmod;
+ static struct omap_hwmod am33xx_rtc_hwmod;
++static struct omap_hwmod am33xx_sha0_hwmod;
+ static struct omap_hwmod am33xx_mcasp0_hwmod;
+ static struct omap_hwmod am33xx_mcasp1_hwmod;
+ static struct omap_hwmod am33xx_ehrpwm0_hwmod;
+@@ -2167,8 +2168,16 @@ static struct omap_hwmod am33xx_rtc_hwmod = {
+ };
+ 
+ /* sha0 */
++static struct omap_hwmod_class_sysconfig am33xx_sha0_sysc = {
++	.rev_offs	= 0x100,
++	.sysc_offs	= 0x110,
++	.syss_offs	= 0x114,
++	.sysc_flags	= SYSS_HAS_RESET_STATUS,
++};
++
+ static struct omap_hwmod_class am33xx_sha0_hwmod_class = {
+ 	.name		= "sha0",
++	.sysc		= &am33xx_sha0_sysc,
+ };
+ 
+ static struct omap_hwmod_irq_info am33xx_sha0_irqs[] = {
+@@ -2181,6 +2190,27 @@ static struct omap_hwmod_dma_info am33xx_sha0_dma[] = {
+ 	{ .dma_req = -1 }
+ };
+ 
++struct omap_hwmod_addr_space am33xx_sha0_addr_space[] = {
++	{
++		.pa_start	= 0x53100000,
++		.pa_end		= 0x53100000 + SZ_1M - 1,
++		.flags		= ADDR_TYPE_RT,
++	},
++	{ }
++};
++
++struct omap_hwmod_ocp_if am33xx_l3_core__sha0 = {
++	.master		= &am33xx_l3_main_hwmod,
++	.slave		= &am33xx_sha0_hwmod,
++	.clk		= "sha0_fck",
++	.addr		= am33xx_sha0_addr_space,
++	.user		= OCP_USER_MPU,
++};
++
++static struct omap_hwmod_ocp_if *am33xx_sha0_slaves[] = {
++	&am33xx_l3_core__sha0,
++};
++
+ static struct omap_hwmod am33xx_sha0_hwmod = {
+ 	.name		= "sha0",
+ 	.class		= &am33xx_sha0_hwmod_class,
+@@ -2194,6 +2224,8 @@ static struct omap_hwmod am33xx_sha0_hwmod = {
+ 			.modulemode	= MODULEMODE_SWCTRL,
+ 		},
+ 	},
++	.slaves		= am33xx_sha0_slaves,
++	.slaves_cnt	= ARRAY_SIZE(am33xx_sha0_slaves),
+ };
+ 
+ /* 'smartreflex' class */
+-- 
+1.7.12
+
diff --git a/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0002-crypto-omap4-sham-Use-finer-grained-PM-management.patch b/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0002-crypto-omap4-sham-Use-finer-grained-PM-management.patch
new file mode 100644
index 0000000..8890f3b
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0002-crypto-omap4-sham-Use-finer-grained-PM-management.patch
@@ -0,0 +1,98 @@
+From 0c910915e0b14538e4a539a26a1c632d29ed7131 Mon Sep 17 00:00:00 2001
+From: "Mark A. Greer" <mgreer@animalcreek.com>
+Date: Tue, 11 Dec 2012 09:40:05 -0700
+Subject: [PATCH 02/10] crypto: omap4-sham: Use finer-grained PM management
+
+Currently, the pm_runtime calls in omap4-sham enable
+things when the driver is probed and leave them enabled
+until the driver is removed.  To fix this, move the
+pm_runtime calls to only enable the sham module when
+its actually in use.
+
+Signed-off-by: Mark A. Greer <mgreer@animalcreek.com>
+---
+ drivers/crypto/omap4-sham.c | 23 ++++++++---------------
+ 1 file changed, 8 insertions(+), 15 deletions(-)
+
+diff --git a/drivers/crypto/omap4-sham.c b/drivers/crypto/omap4-sham.c
+index 2fb71b9..6985c87 100644
+--- a/drivers/crypto/omap4-sham.c
++++ b/drivers/crypto/omap4-sham.c
+@@ -138,7 +138,6 @@ struct omap4_sham_dev {
+ 	struct device		*dev;
+ 	void __iomem		*io_base;
+ 	int			irq;
+-	struct clk		*iclk;
+ 	spinlock_t		lock;
+ 	int			err;
+ 	int			dma;
+@@ -701,6 +700,8 @@ static void omap4_sham_finish_req(struct ahash_request *req, int err)
+ 	dd->dflags &= ~(BIT(FLAGS_BUSY) | BIT(FLAGS_FINAL) | BIT(FLAGS_CPU) |
+ 			BIT(FLAGS_DMA_READY) | BIT(FLAGS_OUTPUT_READY));
+ 
++	pm_runtime_put_sync(dd->dev);
++
+ 	if (req->base.complete)
+ 		req->base.complete(&req->base, err);
+ 
+@@ -742,6 +743,8 @@ static int omap4_sham_handle_queue(struct omap4_sham_dev *dd,
+ 	dev_dbg(dd->dev, "handling new req, op: %lu, nbytes: %d\n",
+ 						ctx->op, req->nbytes);
+ 
++	pm_runtime_get_sync(dd->dev);
++
+ 	if (!test_bit(FLAGS_INIT, &dd->dflags)) {
+ 		set_bit(FLAGS_INIT, &dd->dflags);
+ 		dd->err = 0;
+@@ -1306,11 +1309,6 @@ static int __devinit omap4_sham_probe(struct platform_device *pdev)
+ 	if (err)
+ 		goto dma_err;
+ 
+-	pm_runtime_enable(dev);
+-	udelay(1);
+-	pm_runtime_get_sync(dev);
+-	udelay(1);
+-
+ 	dd->io_base = ioremap(dd->phys_base, SZ_4K);
+ 	if (!dd->io_base) {
+ 		dev_err(dev, "can't ioremap\n");
+@@ -1318,7 +1316,11 @@ static int __devinit omap4_sham_probe(struct platform_device *pdev)
+ 		goto io_err;
+ 	}
+ 
++
++	pm_runtime_enable(dev);
++	pm_runtime_get_sync(dev);
+ 	reg = omap4_sham_read(dd, SHA_REG_REV);
++	pm_runtime_put_sync(&pdev->dev);
+ 
+ 	dev_info(dev, "AM33X SHA/MD5 hw accel rev: %u.%02u\n",
+ 		 (reg & SHA_REG_REV_X_MAJOR_MASK) >> 8, reg & SHA_REG_REV_Y_MINOR_MASK);
+@@ -1342,13 +1344,7 @@ err_algs:
+ 		crypto_unregister_ahash(&algs[j]);
+ 	iounmap(dd->io_base);
+ io_err:
+-	pm_runtime_put_sync(dev);
+-	udelay(1);
+ 	pm_runtime_disable(dev);
+-	udelay(1);
+-
+-//clk_err:
+-//	omap4_sham_dma_cleanup(dd);
+ 
+ dma_err:
+ 	if (dd->irq >= 0)
+@@ -1377,10 +1373,7 @@ static int __devexit omap4_sham_remove(struct platform_device *pdev)
+ 		crypto_unregister_ahash(&algs[i]);
+ 	tasklet_kill(&dd->done_task);
+ 	iounmap(dd->io_base);
+-	pm_runtime_put_sync(&pdev->dev);
+-	udelay(1);
+ 	pm_runtime_disable(&pdev->dev);
+-	udelay(1);
+ 
+ 	omap4_sham_dma_cleanup(dd);
+ 	if (dd->irq >= 0)
+-- 
+1.7.12
+
diff --git a/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0003-crypto-omap4-sham-Add-suspend-resume-PM-support.patch b/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0003-crypto-omap4-sham-Add-suspend-resume-PM-support.patch
new file mode 100644
index 0000000..4b9a9bc
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0003-crypto-omap4-sham-Add-suspend-resume-PM-support.patch
@@ -0,0 +1,56 @@
+From b0a47b49a61db95fdb2340548b967bdfe085df2d Mon Sep 17 00:00:00 2001
+From: "Mark A. Greer" <mgreer@animalcreek.com>
+Date: Wed, 12 Dec 2012 00:43:45 -0700
+Subject: [PATCH 03/10] crypto: omap4-sham: Add suspend/resume PM support
+
+Add suspend/resume PM support to the omap4-sham driver
+
+Signed-off-by: Mark A. Greer <mgreer@animalcreek.com>
+---
+ drivers/crypto/omap4-sham.c | 13 ++++---------
+ 1 file changed, 4 insertions(+), 9 deletions(-)
+
+diff --git a/drivers/crypto/omap4-sham.c b/drivers/crypto/omap4-sham.c
+index 6985c87..963d0e1 100644
+--- a/drivers/crypto/omap4-sham.c
++++ b/drivers/crypto/omap4-sham.c
+@@ -1386,24 +1386,19 @@ static int __devexit omap4_sham_remove(struct platform_device *pdev)
+ 
+ static int omap4_sham_suspend(struct device *dev)
+ {
+-	pr_debug("#### Crypto: Suspend call ####\n");
+-
++	pm_runtime_put_sync(dev);
+ 	return 0;
+ }
+ 
+ 
+ static int omap4_sham_resume(struct device *dev)
+ {
+-	pr_debug("#### Crypto: resume call ####\n");
+-
++	pm_runtime_get_sync(dev);
+ 	return 0;
+ }
+ 
+ static struct dev_pm_ops omap4_sham_dev_pm_ops = {
+-	.suspend	= omap4_sham_suspend,
+-	.resume		= omap4_sham_resume,
+-	.runtime_suspend = omap4_sham_suspend,
+-	.runtime_resume = omap4_sham_resume,
++	SET_SYSTEM_SLEEP_PM_OPS(omap4_sham_suspend, omap4_sham_resume)
+ };
+ 
+ static struct platform_driver omap4_sham_driver = {
+@@ -1412,7 +1407,7 @@ static struct platform_driver omap4_sham_driver = {
+ 	.driver	= {
+ 		.name	= "omap4-sham",
+ 		.owner	= THIS_MODULE,
+-		.pm		= &omap4_sham_dev_pm_ops
++		.pm	= &omap4_sham_dev_pm_ops
+ 	},
+ };
+ 
+-- 
+1.7.12
+
diff --git a/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0004-crypto-omap4-sham-Don-t-use-hardcoded-base-address.patch b/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0004-crypto-omap4-sham-Don-t-use-hardcoded-base-address.patch
new file mode 100644
index 0000000..76c7027
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0004-crypto-omap4-sham-Don-t-use-hardcoded-base-address.patch
@@ -0,0 +1,45 @@
+From 08ea4b77652956c07b91b4de670ebc44f1395840 Mon Sep 17 00:00:00 2001
+From: "Mark A. Greer" <mgreer@animalcreek.com>
+Date: Tue, 11 Dec 2012 20:33:15 -0700
+Subject: [PATCH 04/10] crypto: omap4-sham: Don't use hardcoded base address
+
+The omap4-sham driver currently uses a hardcoded base
+address for its register set instead of the address
+passed in by the system.  Instead, use the address
+passed in by the system.
+
+Signed-off-by: Mark A. Greer <mgreer@animalcreek.com>
+---
+ drivers/crypto/omap4-sham.c | 16 +++++++---------
+ 1 file changed, 7 insertions(+), 9 deletions(-)
+
+diff --git a/drivers/crypto/omap4-sham.c b/drivers/crypto/omap4-sham.c
+index 963d0e1..b2fc03a 100644
+--- a/drivers/crypto/omap4-sham.c
++++ b/drivers/crypto/omap4-sham.c
+@@ -1271,15 +1271,13 @@ static int __devinit omap4_sham_probe(struct platform_device *pdev)
+ 	dd->irq = -1;
+ 
+ 	/* Get the base address */
+-	//res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+-	//if (!res) {
+-	//	dev_err(dev, "no MEM resource info\n");
+-	//	err = -ENODEV;
+-	//	goto res_err;
+-	//}
+-
+-	//dd->phys_base = res->start;
+-	dd->phys_base = AM33XX_SHA1MD5_P_BASE;
++	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
++	if (!res) {
++		dev_err(dev, "no MEM resource info\n");
++		err = -ENODEV;
++		goto res_err;
++	}
++	dd->phys_base = res->start;
+ 
+ 	/* Get the DMA */
+ 	res = platform_get_resource(pdev, IORESOURCE_DMA, 0);
+-- 
+1.7.12
+
diff --git a/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0005-ARM-AM33xx-hwmod-Convert-AES0-crypto-device-data-to-.patch b/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0005-ARM-AM33xx-hwmod-Convert-AES0-crypto-device-data-to-.patch
new file mode 100644
index 0000000..6aebef6
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0005-ARM-AM33xx-hwmod-Convert-AES0-crypto-device-data-to-.patch
@@ -0,0 +1,165 @@
+From ff9e06c41de00f281dd21ed66e8477d933ce69dd Mon Sep 17 00:00:00 2001
+From: "Mark A. Greer" <mgreer@animalcreek.com>
+Date: Tue, 11 Dec 2012 20:46:49 -0700
+Subject: [PATCH 05/10] ARM: AM33xx: hwmod: Convert AES0 crypto device data to
+ hwmod
+
+Convert the device data for the AM33xx AES0 crypto modules
+from explicit platform_data to hwmod.
+
+Signed-off-by: Mark A. Greer <mgreer@animalcreek.com>
+---
+ arch/arm/mach-omap2/devices.c              | 65 ++++--------------------------
+ arch/arm/mach-omap2/omap_hwmod_33xx_data.c | 32 +++++++++++++++
+ 2 files changed, 39 insertions(+), 58 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/devices.c b/arch/arm/mach-omap2/devices.c
+index 3679369..e4caa06 100644
+--- a/arch/arm/mach-omap2/devices.c
++++ b/arch/arm/mach-omap2/devices.c
+@@ -809,69 +809,18 @@ static void omap_init_aes(void)
+ }
+ 
+ #elif defined(CONFIG_CRYPTO_DEV_OMAP4_AES) || defined(CONFIG_CRYPTO_DEV_OMAP4_AES_MODULE)
+-
+-static struct resource omap4_aes_resources[] = {
+-	{
+-		.start	= AM33XX_AES0_P_BASE,
+-		.end	= AM33XX_AES0_P_BASE + 0x4C,
+-		.flags	= IORESOURCE_MEM,
+-	},
+-	{
+-		.start	= AM33XX_DMA_AESEIP36T0_DOUT,
+-		.flags	= IORESOURCE_DMA,
+-	},
+-	{
+-		.start	= AM33XX_DMA_AESEIP36T0_DIN,
+-		.flags	= IORESOURCE_DMA,
+-	}
+-};
+-static int omap4_aes_resources_sz = ARRAY_SIZE(omap4_aes_resources);
+-
+-static struct platform_device aes_device = {
+-	.name		= "omap4-aes",
+-	.id		= -1,
+-};
+-
+-#if 0
+-static void omap_init_aes(void)
++static void __init omap_init_aes(void)
+ {
+-	aes_device.resource = omap4_aes_resources;
+-	aes_device.num_resources = omap4_aes_resources_sz;
+-	platform_device_register(&aes_device);
+-}
+-#endif
+-
+-int __init omap_init_aes(void)
+-{
+-	int id = -1;
+-	struct platform_device *pdev;
+ 	struct omap_hwmod *oh;
+-	char *oh_name = "aes0";
+-	char *name = "omap4-aes";
+-
+-	oh = omap_hwmod_lookup(oh_name);
+-	if (!oh) {
+-		pr_err("Could not look up %s\n", oh_name);
+-		return -ENODEV;
+-	}
+-
+-	pdev = omap_device_build(name, id, oh, NULL, 0, NULL, 0, 0);
+-	//pdev.resource = omap4_sham_resources;
+-	//pdev.num_resources = omap4_sham_resources_sz;
++	struct platform_device *pdev;
+ 
+-	if (IS_ERR(pdev)) {
+-		WARN(1, "Can't build omap_device for %s:%s.\n",
+-						name, oh->name);
+-		return PTR_ERR(pdev);
+-	}
++	oh = omap_hwmod_lookup("aes0");
++	if (!oh)
++		return;
+ 
+-	return 0;
++	pdev = omap_device_build("omap4-aes", -1, oh, NULL, 0, NULL, 0, 0);
++	WARN(IS_ERR(pdev), "Can't build omap_device for omap-aes\n");
+ }
+-
+-
+-
+-
+-
+ #else
+ static inline void omap_init_aes(void) { }
+ #endif
+diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
+index ad606c6..90e25d7 100644
+--- a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
++++ b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
+@@ -78,6 +78,7 @@ static struct omap_hwmod am33xx_spi0_hwmod;
+ static struct omap_hwmod am33xx_spi1_hwmod;
+ static struct omap_hwmod am33xx_elm_hwmod;
+ static struct omap_hwmod am33xx_adc_tsc_hwmod;
++static struct omap_hwmod am33xx_aes0_hwmod;
+ static struct omap_hwmod am33xx_rtc_hwmod;
+ static struct omap_hwmod am33xx_sha0_hwmod;
+ static struct omap_hwmod am33xx_mcasp0_hwmod;
+@@ -427,8 +428,16 @@ static struct omap_hwmod am33xx_adc_tsc_hwmod = {
+ };
+ 
+ /* 'aes' class */
++static struct omap_hwmod_class_sysconfig am33xx_aes_sysc = {
++	.rev_offs	= 0x80,
++	.sysc_offs	= 0x84,
++	.syss_offs	= 0x88,
++	.sysc_flags	= SYSS_HAS_RESET_STATUS,
++};
++
+ static struct omap_hwmod_class am33xx_aes_hwmod_class = {
+ 	.name		= "aes",
++	.sysc		= &am33xx_aes_sysc,
+ };
+ 
+ /* aes0 */
+@@ -443,6 +452,27 @@ static struct omap_hwmod_dma_info am33xx_aes0_dma[] = {
+ 	{ .dma_req = -1 }
+ };
+ 
++static struct omap_hwmod_addr_space am33xx_aes0_addrs[] = {
++	{
++		.pa_start	= 0x53500000,
++		.pa_end		= 0x53500000 + SZ_1M - 1,
++		.flags		= ADDR_TYPE_RT
++	},
++	{ }
++};
++
++static struct omap_hwmod_ocp_if am33xx_l3_main__aes0 = {
++	.master		= &am33xx_l3_main_hwmod,
++	.slave		= &am33xx_aes0_hwmod,
++	.clk		= "aes0_fck",
++	.addr		= am33xx_aes0_addrs,
++	.user		= OCP_USER_MPU | OCP_USER_SDMA,
++};
++
++static struct omap_hwmod_ocp_if *am33xx_aes0_slaves[] = {
++	&am33xx_l3_main__aes0,
++};
++
+ static struct omap_hwmod am33xx_aes0_hwmod = {
+ 	.name		= "aes0",
+ 	.class		= &am33xx_aes_hwmod_class,
+@@ -456,6 +486,8 @@ static struct omap_hwmod am33xx_aes0_hwmod = {
+ 			.modulemode	= MODULEMODE_SWCTRL,
+ 		},
+ 	},
++	.slaves		= am33xx_aes0_slaves,
++	.slaves_cnt	= ARRAY_SIZE(am33xx_aes0_slaves),
+ };
+ 
+ /* cefuse */
+-- 
+1.7.12
+
diff --git a/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0006-crypto-omap4-aes-User-finer-grained-PM-management.patch b/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0006-crypto-omap4-aes-User-finer-grained-PM-management.patch
new file mode 100644
index 0000000..94fb7b6
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0006-crypto-omap4-aes-User-finer-grained-PM-management.patch
@@ -0,0 +1,127 @@
+From 5f56e1d486aaef9bcfaa57129c493a95185043fd Mon Sep 17 00:00:00 2001
+From: "Mark A. Greer" <mgreer@animalcreek.com>
+Date: Tue, 11 Dec 2012 21:00:13 -0700
+Subject: [PATCH 06/10] crypto: omap4-aes: User finer-grained PM management
+
+Currently, the pm_runtime calls in omap4-aes enable
+things when the driver is probed and leave them enabled
+until the driver is removed.  To fix this, move the
+pm_runtime calls to only enable the aes module when
+its actually in use.
+
+Signed-off-by: Mark A. Greer <mgreer@animalcreek.com>
+---
+ drivers/crypto/omap4-aes.c | 39 ++++++++++++++++-----------------------
+ 1 file changed, 16 insertions(+), 23 deletions(-)
+
+diff --git a/drivers/crypto/omap4-aes.c b/drivers/crypto/omap4-aes.c
+index dec2de4..a957709 100644
+--- a/drivers/crypto/omap4-aes.c
++++ b/drivers/crypto/omap4-aes.c
+@@ -80,7 +80,6 @@ struct omap4_aes_dev {
+ 	struct list_head		list;
+ 	unsigned long			phys_base;
+ 	void __iomem			*io_base;
+-	struct clk			*iclk;
+ 	struct omap4_aes_ctx		*ctx;
+ 	struct device			*dev;
+ 	unsigned long			flags;
+@@ -146,7 +145,7 @@ static void omap4_aes_write_n(struct omap4_aes_dev *dd, u32 offset,
+ 
+ static int omap4_aes_hw_init(struct omap4_aes_dev *dd)
+ {
+-	omap4_aes_write(dd, AES_REG_SYSCFG, 0);
++	pm_runtime_get_sync(dd->dev);
+ 
+ 	if (!(dd->flags & FLAGS_INIT)) {
+ 		dd->flags |= FLAGS_INIT;
+@@ -489,11 +488,17 @@ static void omap4_aes_finish_req(struct omap4_aes_dev *dd, int err)
+ 
+ 	pr_debug("err: %d\n", err);
+ 
++	pm_runtime_put_sync(dd->dev);
+ 	dd->flags &= ~FLAGS_BUSY;
+ 
+ 	req->base.complete(&req->base, err);
+ }
+ 
++static void omap4_aes_dma_stop(struct omap4_aes_dev *dd)
++{
++	omap4_aes_write_mask(dd, AES_REG_SYSCFG, 0, AES_REG_SYSCFG_DREQ_MASK);
++}
++
+ static int omap4_aes_crypt_dma_stop(struct omap4_aes_dev *dd)
+ {
+ 	int err = 0;
+@@ -501,7 +506,7 @@ static int omap4_aes_crypt_dma_stop(struct omap4_aes_dev *dd)
+ 
+ 	pr_debug("total: %d\n", dd->total);
+ 
+-	omap4_aes_write_mask(dd, AES_REG_SYSCFG, 0, AES_REG_SYSCFG_DREQ_MASK);
++	omap4_aes_dma_stop(dd);
+ 
+ 	edma_stop(dd->dma_lch_in);
+ 	edma_clean_channel(dd->dma_lch_in);
+@@ -819,21 +824,22 @@ static int omap4_aes_probe(struct platform_device *pdev)
+ 	else
+ 		dd->dma_in = res->start;
+ 
+-	pm_runtime_enable(dev);
+-	udelay(1);
+-	pm_runtime_get_sync(dev);
+-	udelay(1);
+-
+ 	dd->io_base = ioremap(dd->phys_base, SZ_4K);
+ 	if (!dd->io_base) {
+ 		dev_err(dev, "can't ioremap\n");
+ 		err = -ENOMEM;
+-		goto err_io;
++		goto err_data;
+ 	}
+ 
+-	omap4_aes_hw_init(dd);
++	pm_runtime_enable(dev);
++	pm_runtime_get_sync(dev);
++
++	omap4_aes_dma_stop(dd);
++
+ 	reg = omap4_aes_read(dd, AES_REG_REV);
+ 
++	pm_runtime_put_sync(dev);
++
+ 	dev_info(dev, "AM33X AES hw accel rev: %u.%02u\n",
+ 		 ((reg & AES_REG_REV_X_MAJOR_MASK) >> 8),
+ 		 (reg & AES_REG_REV_Y_MINOR_MASK));
+@@ -870,17 +876,8 @@ err_dma:
+ 	tasklet_kill(&dd->done_task);
+ 	tasklet_kill(&dd->queue_task);
+ 	iounmap(dd->io_base);
+-
+-err_io:
+-	pm_runtime_put_sync(dev);
+-	udelay(1);
+ 	pm_runtime_disable(dev);
+-	udelay(1);
+ 
+-
+-//err_res:
+-	//kfree(dd);
+-	//dd = NULL;
+ err_data:
+ 	dev_err(dev, "initialization failed.\n");
+ 	return err;
+@@ -905,11 +902,7 @@ static int omap4_aes_remove(struct platform_device *pdev)
+ 	tasklet_kill(&dd->queue_task);
+ 	omap4_aes_dma_cleanup(dd);
+ 	iounmap(dd->io_base);
+-	pm_runtime_put_sync(&pdev->dev);
+-	udelay(1);
+ 	pm_runtime_disable(&pdev->dev);
+-	udelay(1);
+-
+ 	kfree(dd);
+ 	dd = NULL;
+ 
+-- 
+1.7.12
+
diff --git a/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0007-crypto-omap4-aes-Add-suspend-resume-PM-support.patch b/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0007-crypto-omap4-aes-Add-suspend-resume-PM-support.patch
new file mode 100644
index 0000000..cce7691
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0007-crypto-omap4-aes-Add-suspend-resume-PM-support.patch
@@ -0,0 +1,56 @@
+From 90b8eaec8de51fab15872f8737a5148b99f80282 Mon Sep 17 00:00:00 2001
+From: "Mark A. Greer" <mgreer@animalcreek.com>
+Date: Wed, 12 Dec 2012 00:46:52 -0700
+Subject: [PATCH 07/10] crypto: omap4-aes: Add suspend/resume PM support
+
+Add suspend/resume PM support to the omap4-aes driver
+
+Signed-off-by: Mark A. Greer <mgreer@animalcreek.com>
+---
+ drivers/crypto/omap4-aes.c | 13 ++++---------
+ 1 file changed, 4 insertions(+), 9 deletions(-)
+
+diff --git a/drivers/crypto/omap4-aes.c b/drivers/crypto/omap4-aes.c
+index a957709..941b8a1 100644
+--- a/drivers/crypto/omap4-aes.c
++++ b/drivers/crypto/omap4-aes.c
+@@ -911,24 +911,19 @@ static int omap4_aes_remove(struct platform_device *pdev)
+ 
+ static int omap4_aes_suspend(struct device *dev)
+ {
+-	pr_debug("#### Crypto: Suspend call ####\n");
+-
++	pm_runtime_put_sync(dev);
+ 	return 0;
+ }
+ 
+ 
+ static int omap4_aes_resume(struct device *dev)
+ {
+-	pr_debug("#### Crypto: resume call ####\n");
+-
++	pm_runtime_get_sync(dev);
+ 	return 0;
+ }
+ 
+ static struct dev_pm_ops omap4_aes_dev_pm_ops = {
+-	.suspend	= omap4_aes_suspend,
+-	.resume		= omap4_aes_resume,
+-	.runtime_suspend = omap4_aes_suspend,
+-	.runtime_resume = omap4_aes_resume,
++	SET_SYSTEM_SLEEP_PM_OPS(omap4_aes_suspend, omap4_aes_resume)
+ };
+ 
+ static struct platform_driver omap4_aes_driver = {
+@@ -937,7 +932,7 @@ static struct platform_driver omap4_aes_driver = {
+ 	.driver	= {
+ 		.name	= "omap4-aes",
+ 		.owner	= THIS_MODULE,
+-		.pm		= &omap4_aes_dev_pm_ops
++		.pm	= &omap4_aes_dev_pm_ops
+ 	},
+ };
+ 
+-- 
+1.7.12
+
diff --git a/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0008-crypto-omap4-aes-Don-t-use-hardcoded-base-address.patch b/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0008-crypto-omap4-aes-Don-t-use-hardcoded-base-address.patch
new file mode 100644
index 0000000..348ac52
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0008-crypto-omap4-aes-Don-t-use-hardcoded-base-address.patch
@@ -0,0 +1,45 @@
+From 8084600ca78354fad147593256b9e32ef5d15148 Mon Sep 17 00:00:00 2001
+From: "Mark A. Greer" <mgreer@animalcreek.com>
+Date: Tue, 11 Dec 2012 21:09:58 -0700
+Subject: [PATCH 08/10] crypto: omap4-aes: Don't use hardcoded base address
+
+The omap4-aes driver currently uses a hardcoded base
+address for its register set instead of the address
+passed in by the system.  Instead, use the address
+passed in by the system.
+
+Signed-off-by: Mark A. Greer <mgreer@animalcreek.com>
+---
+ drivers/crypto/omap4-aes.c | 16 +++++++---------
+ 1 file changed, 7 insertions(+), 9 deletions(-)
+
+diff --git a/drivers/crypto/omap4-aes.c b/drivers/crypto/omap4-aes.c
+index 941b8a1..984a15e 100644
+--- a/drivers/crypto/omap4-aes.c
++++ b/drivers/crypto/omap4-aes.c
+@@ -800,15 +800,13 @@ static int omap4_aes_probe(struct platform_device *pdev)
+ 	crypto_init_queue(&dd->queue, AM33X_AES_QUEUE_LENGTH);
+ 
+ 	/* Get the base address */
+-	//res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+-	//if (!res) {
+-	//	dev_err(dev, "invalid resource type\n");
+-	//	err = -ENODEV;
+-	//	goto err_res;
+-	//}
+-
+-	//dd->phys_base = res->start;
+-	dd->phys_base = AM33XX_AES0_P_BASE;
++	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
++	if (!res) {
++		dev_err(dev, "invalid resource type\n");
++		err = -ENODEV;
++		goto err_data;
++	}
++	dd->phys_base = res->start;
+ 
+ 	/* Get the DMA */
+ 	res = platform_get_resource(pdev, IORESOURCE_DMA, 0);
+-- 
+1.7.12
+
diff --git a/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0009-ARM-AM33xx-hwmod-Convert-RNG-device-data-to-hwmod.patch b/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0009-ARM-AM33xx-hwmod-Convert-RNG-device-data-to-hwmod.patch
new file mode 100644
index 0000000..31094b0
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0009-ARM-AM33xx-hwmod-Convert-RNG-device-data-to-hwmod.patch
@@ -0,0 +1,176 @@
+From 45cc04d9de2820cba138d5782e7c568edf0078a0 Mon Sep 17 00:00:00 2001
+From: "Mark A. Greer" <mgreer@animalcreek.com>
+Date: Wed, 12 Dec 2012 16:17:12 -0700
+Subject: [PATCH 09/10] ARM: AM33xx: hwmod: Convert RNG device data to hwmod
+
+Convert the device data for the AM33xx RNG module
+from explicit platform_data to hwmod.
+
+Signed-off-by: Mark A. Greer <mgreer@animalcreek.com>
+---
+ arch/arm/mach-omap2/devices.c              | 18 +++++++++
+ arch/arm/mach-omap2/omap_hwmod_33xx_data.c | 64 ++++++++++++++++++++++++++++++
+ arch/arm/plat-omap/devices.c               | 22 ----------
+ 3 files changed, 82 insertions(+), 22 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/devices.c b/arch/arm/mach-omap2/devices.c
+index e4caa06..8e2f4a0 100644
+--- a/arch/arm/mach-omap2/devices.c
++++ b/arch/arm/mach-omap2/devices.c
+@@ -825,6 +825,23 @@ static void __init omap_init_aes(void)
+ static inline void omap_init_aes(void) { }
+ #endif
+ 
++#if IS_ENABLED(CONFIG_HW_RANDOM_OMAP4)
++static void __init omap_init_rng(void)
++{
++	struct omap_hwmod *oh;
++	struct platform_device *pdev;
++
++	oh = omap_hwmod_lookup("rng");
++	if (!oh)
++		return;
++
++	pdev = omap_device_build("omap4_rng", -1, oh, NULL, 0, NULL, 0, 0);
++	WARN(IS_ERR(pdev), "Can't build omap_device for omap-rng\n");
++}
++#else
++static inline void omap_init_rng(void) {}
++#endif
++
+ /*-------------------------------------------------------------------------*/
+ 
+ #if defined(CONFIG_MMC_OMAP) || defined(CONFIG_MMC_OMAP_MODULE)
+@@ -1475,6 +1492,7 @@ static int __init omap2_init_devices(void)
+ 	omap_init_sti();
+ 	omap_init_sham();
+ 	omap_init_aes();
++	omap_init_rng();
+ 	omap_init_vout();
+ 	am33xx_register_edma();
+ 	am33xx_init_pcm();
+diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
+index 90e25d7..6c5ebc7 100644
+--- a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
++++ b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
+@@ -94,6 +94,7 @@ static struct omap_hwmod am33xx_lcdc_hwmod;
+ static struct omap_hwmod am33xx_mailbox_hwmod;
+ static struct omap_hwmod am33xx_cpgmac0_hwmod;
+ static struct omap_hwmod am33xx_mdio_hwmod;
++static struct omap_hwmod am33xx_rng_hwmod;
+ 
+ /*
+  * ERRATA: (Yet to conform from IP team)
+@@ -3541,6 +3542,67 @@ static struct omap_hwmod am33xx_pruss_hwmod = {
+ 	.rst_lines_cnt	= ARRAY_SIZE(am33xx_pruss_resets),
+ };
+ 
++/* rng */
++static struct omap_hwmod_sysc_fields omap3_rng_sysc_fields = {
++	.sidle_shift	= 3,
++	.autoidle_shift	= 0,
++};
++
++static struct omap_hwmod_class_sysconfig am33xx_rng_sysc = {
++	.rev_offs	= 0x1fe0,
++	.sysc_offs	= 0x1fe4,
++	.rst_offs	= 0x1ff0,
++	.sysc_flags	= SYSC_HAS_AUTOIDLE,
++	.sysc_fields	= &omap3_rng_sysc_fields,
++};
++
++static struct omap_hwmod_class am33xx_rng_hwmod_class = {
++	.name		= "rng",
++	.sysc		= &am33xx_rng_sysc,
++};
++
++static struct omap_hwmod_irq_info am33xx_rng_irqs[] = {
++	{ .irq = 111 },
++	{ .irq = -1 }
++};
++
++struct omap_hwmod_addr_space am33xx_rng_addr_space[] = {
++	{
++		.pa_start	= 0x48310000,
++		.pa_end		= 0x48310000 + SZ_8K - 1,
++		.flags		= ADDR_TYPE_RT,
++	},
++	{ }
++};
++
++struct omap_hwmod_ocp_if am33xx_l4per__rng = {
++	.master		= &am33xx_l4per_hwmod,
++	.slave		= &am33xx_rng_hwmod,
++	.clk		= "rng_fck",
++	.addr		= am33xx_rng_addr_space,
++	.user		= OCP_USER_MPU,
++};
++
++static struct omap_hwmod_ocp_if *am33xx_rng_slaves[] = {
++	&am33xx_l4per__rng,
++};
++
++static struct omap_hwmod am33xx_rng_hwmod = {
++	.name		= "rng",
++	.class		= &am33xx_rng_hwmod_class,
++	.clkdm_name	= "l4ls_clkdm",
++	.mpu_irqs	= am33xx_rng_irqs,
++	.main_clk	= "rng_fck",
++	.prcm		= {
++		.omap4	= {
++			.clkctrl_offs	= AM33XX_CM_PER_RNG_CLKCTRL_OFFSET,
++			.modulemode	= MODULEMODE_SWCTRL,
++		},
++	},
++	.slaves		= am33xx_rng_slaves,
++	.slaves_cnt	= ARRAY_SIZE(am33xx_rng_slaves),
++};
++
+ static __initdata struct omap_hwmod *am33xx_hwmods[] = {
+ 	/* l3 class */
+ 	&am33xx_l3_instr_hwmod,
+@@ -3661,6 +3723,8 @@ static __initdata struct omap_hwmod *am33xx_hwmods[] = {
+ 	&am33xx_gfx_hwmod,
+ 	/* pruss */
+ 	&am33xx_pruss_hwmod,
++	/* rng */
++	&am33xx_rng_hwmod,
+ 	NULL,
+ };
+ 
+diff --git a/arch/arm/plat-omap/devices.c b/arch/arm/plat-omap/devices.c
+index 52720b4..52d7ad4 100644
+--- a/arch/arm/plat-omap/devices.c
++++ b/arch/arm/plat-omap/devices.c
+@@ -105,28 +105,6 @@ static void omap_init_rng(void)
+ {
+ 	(void) platform_device_register(&omap_rng_device);
+ }
+-#elif defined(CONFIG_HW_RANDOM_OMAP4) || defined(CONFIG_HW_RANDOM_OMAP4_MODULE)
+-
+-static struct resource rng_resources[] = {
+-	{
+-		.start		= AM33XX_RNG_BASE,
+-		.end		= AM33XX_RNG_BASE + 0x1FFC,
+-		.flags		= IORESOURCE_MEM,
+-	},
+-};
+-
+-static struct platform_device omap4_rng_device = {
+-	.name		= "omap4_rng",
+-	.id		= -1,
+-	.num_resources	= ARRAY_SIZE(rng_resources),
+-	.resource	= rng_resources,
+-};
+-
+-static void omap_init_rng(void)
+-{
+-	(void) platform_device_register(&omap4_rng_device);
+-}
+-
+ #else
+ static inline void omap_init_rng(void) {}
+ #endif
+-- 
+1.7.12
+
diff --git a/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0010-hwrng-omap4-rng-Convert-to-use-pm_runtime-API.patch b/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0010-hwrng-omap4-rng-Convert-to-use-pm_runtime-API.patch
new file mode 100644
index 0000000..28bc326
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0010-hwrng-omap4-rng-Convert-to-use-pm_runtime-API.patch
@@ -0,0 +1,91 @@
+From 1b4d57c404a14b263b39e251e0bc5dc76fc95932 Mon Sep 17 00:00:00 2001
+From: "Mark A. Greer" <mgreer@animalcreek.com>
+Date: Wed, 12 Dec 2012 20:13:49 -0700
+Subject: [PATCH 10/10] hwrng: omap4-rng: Convert to use pm_runtime API
+
+Convert the omap4-rng driver to use the pm_runtime
+API instead of the clk API.
+
+Signed-off-by: Mark A. Greer <mgreer@animalcreek.com>
+---
+ drivers/char/hw_random/omap4-rng.c | 24 +++++++++++-------------
+ 1 file changed, 11 insertions(+), 13 deletions(-)
+
+diff --git a/drivers/char/hw_random/omap4-rng.c b/drivers/char/hw_random/omap4-rng.c
+index 523ec63..98c96c1 100644
+--- a/drivers/char/hw_random/omap4-rng.c
++++ b/drivers/char/hw_random/omap4-rng.c
+@@ -23,7 +23,7 @@
+ #include <linux/module.h>
+ #include <linux/init.h>
+ #include <linux/random.h>
+-#include <linux/clk.h>
++#include <linux/pm_runtime.h>
+ #include <linux/err.h>
+ #include <linux/platform_device.h>
+ #include <linux/hw_random.h>
+@@ -111,7 +111,6 @@
+ 
+ 
+ static void __iomem *rng_base;
+-static struct clk *rng_fck;
+ static struct platform_device *rng_dev;
+ 
+ #define trng_read(reg)						\
+@@ -172,13 +171,8 @@ static int __devinit omap4_rng_probe(struct platform_device *pdev)
+ 	if (rng_dev)
+ 		return -EBUSY;
+ 
+-	rng_fck = clk_get(&pdev->dev, "rng_fck");
+-	if (IS_ERR(rng_fck)) {
+-		dev_err(&pdev->dev, "Could not get rng_fck\n");
+-		ret = PTR_ERR(rng_fck);
+-		return ret;
+-	} else
+-		clk_enable(rng_fck);
++	pm_runtime_enable(&pdev->dev);
++	pm_runtime_get_sync(&pdev->dev);
+ 
+ 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+ 	if (!res) {
+@@ -223,8 +217,8 @@ err_register:
+ err_ioremap:
+ 	release_mem_region(res->start, resource_size(res));
+ err_region:
+-	clk_disable(rng_fck);
+-	clk_put(rng_fck);
++	pm_runtime_put_sync(&pdev->dev);
++	pm_runtime_disable(&pdev->dev);
+ 	return ret;
+ }
+ 
+@@ -238,8 +232,8 @@ static int __exit omap4_rng_remove(struct platform_device *pdev)
+ 
+ 	iounmap(rng_base);
+ 
+-	clk_disable(rng_fck);
+-	clk_put(rng_fck);
++	pm_runtime_put_sync(&pdev->dev);
++	pm_runtime_disable(&pdev->dev);
+ 	release_mem_region(res->start, resource_size(res));
+ 	rng_base = NULL;
+ 
+@@ -252,11 +246,15 @@ static int omap4_rng_suspend(struct platform_device *pdev, pm_message_t message)
+ {
+ 	trng_write(trng_read(CONTROL) & ~RNG_REG_CONTROL_ENABLE_TRNG, CONTROL);
+ 
++	pm_runtime_put_sync(&pdev->dev);
++
+ 	return 0;
+ }
+ 
+ static int omap4_rng_resume(struct platform_device *pdev)
+ {
++	pm_runtime_get_sync(&pdev->dev);
++
+ 	trng_write(trng_read(CONTROL) | RNG_REG_CONTROL_ENABLE_TRNG, CONTROL);
+ 
+ 	return 0;
+-- 
+1.7.12
+
diff --git a/meta-arago-distro/recipes-kernel/linux/linux-am335x_3.2.0-psp05.06.00.00.bb b/meta-arago-distro/recipes-kernel/linux/linux-am335x_3.2.0-psp05.06.00.00.bb
index ad20c69..5e41d1b 100644
--- a/meta-arago-distro/recipes-kernel/linux/linux-am335x_3.2.0-psp05.06.00.00.bb
+++ b/meta-arago-distro/recipes-kernel/linux/linux-am335x_3.2.0-psp05.06.00.00.bb
@@ -25,7 +25,7 @@ DEPENDS += "am33x-cm3"
 KERNEL_IMAGETYPE = "uImage"
 
 # The main PR is now using MACHINE_KERNEL_PR, for ti33x see conf/machine/include/ti33x.inc
-MACHINE_KERNEL_PR_append = "f+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "g+gitr${SRCPV}"
 
 BRANCH = "v3.2-staging"
 
@@ -62,6 +62,16 @@ PATCHES += "file://0001-am33x-Add-memory-addresses-for-crypto-modules.patch \
                 file://0001-am335x-Add-crypto-driver-settings-to-defconfig.patch \
                 file://0001-am335x-Add-pm_runtime-API-to-crypto-driver.patch \
                 file://0002-am335x-Add-suspend-resume-routines-to-crypto-driver.patch \
+                file://0001-ARM-AM33xx-hwmod-Convert-SHA0-crypto-device-data-to-.patch \
+                file://0002-crypto-omap4-sham-Use-finer-grained-PM-management.patch \
+                file://0003-crypto-omap4-sham-Add-suspend-resume-PM-support.patch \
+                file://0004-crypto-omap4-sham-Don-t-use-hardcoded-base-address.patch \
+                file://0005-ARM-AM33xx-hwmod-Convert-AES0-crypto-device-data-to-.patch \
+                file://0006-crypto-omap4-aes-User-finer-grained-PM-management.patch \
+                file://0007-crypto-omap4-aes-Add-suspend-resume-PM-support.patch \
+                file://0008-crypto-omap4-aes-Don-t-use-hardcoded-base-address.patch \
+                file://0009-ARM-AM33xx-hwmod-Convert-RNG-device-data-to-hwmod.patch \
+                file://0010-hwrng-omap4-rng-Convert-to-use-pm_runtime-API.patch \
                "
 
 # Add SmartReflex support early driver patches while working to get the driver
-- 
1.7.0.4


