Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id 408935208C
	for <meta-arago@arago-project.org>;
	Mon,  5 Nov 2012 01:54:25 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so4861422oag.38
	for <meta-arago@arago-project.org>;
	Sun, 04 Nov 2012 17:54:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=XATZfGEMcmqIh3MqTatgerLjkrHjeoRVTiK48Wnv7eI=;
	b=XfR6Z7a4ofL3OLc2/4rtnXlRBdsgff1Ojd7NANM/TF35ZejZ/iZ5/2+3ja+ebmiBHb
	BQvhkzALdLeLKTNiYgEjB0I+1ICV8ADvQTu81oTe8r8eIau8HkoPlVPDJRhNWhBeLs9H
	yu2en1ETM9sTevyK9eRr11orl/PbDG0rHZdNK8bYJ1wF9t52j6s01T4sdna1RzBUiFZj
	HxJSX4V4/gywalOcdocB1aQbQOl/6tJOUOmuXGpQeIGHXmKd2s85e6+enXE8wTXqash6
	k6FqDK3pFEjzot9X9jCpB1qj29yJDzq1c7o3TtxLP4knjTOXBImU/fOLLKy/faiBVfny
	GmHw==
Received: by 10.182.240.45 with SMTP id vx13mr6895462obc.21.1352080464766;
	Sun, 04 Nov 2012 17:54:24 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id v6sm12820300oeh.13.2012.11.04.17.54.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 04 Nov 2012 17:54:23 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Sun,  4 Nov 2012 19:53:28 -0600
Message-Id: <1352080417-9792-31-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1352080417-9792-1-git-send-email-fcooper@ti.com>
References: <1352080417-9792-1-git-send-email-fcooper@ti.com>
X-Mailman-Approved-At: Mon, 05 Nov 2012 18:15:24 +0000
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 33/42] linux-am335x: Add PSP v05.06.00.00 of the Linux kernel
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
X-List-Received-Date: Mon, 05 Nov 2012 01:54:26 -0000

* Add PSP kernel version 05.06.00.00
* Since this kernel is still in development AUTOREV is enabled
* Adding code to this recipe which should be placed in a bbappend when
  this recipe is eventually pushed to meta-ti.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 ...odified-WLAN-enable-and-irq-to-match-boar.patch |   62 +
 ...x-Add-crypto-driver-settings-to-defconfig.patch |  132 +
 ...m335x-Add-pm_runtime-API-to-crypto-driver.patch |  405 ++
 ...x-enable-pullup-on-the-WLAN-enable-pin-fo.patch |   57 +
 ...01-am335x_evm_defconfig-turn-off-MUSB-DMA.patch |   35 +
 ...-using-edge-triggered-interrupts-for-WLAN.patch |   35 +
 ...x-Add-memory-addresses-for-crypto-modules.patch |   41 +
 .../0001-am33xx-Add-SmartReflex-support.patch      | 2014 ++++++
 .../0001-mach-omap2-pm33xx-Disable-VT-switch.patch |   71 +
 ...date-PIO-mode-help-information-in-Kconfig.patch |   45 +
 ...1-omap-serial-add-delay-before-suspending.patch |   42 +
 .../0002-AM335x-OCF-Driver-for-Linux-3.patch       | 7228 ++++++++++++++++++++
 ...-suspend-resume-routines-to-crypto-driver.patch |  147 +
 ...Add-crypto-device-and-resource-structures.patch |  111 +
 ...2-am33xx-Enable-CONFIG_AM33XX_SMARTREFLEX.patch |   26 +
 ...rypto-device-and-resource-structure-for-T.patch |   60 +
 ...d-crypto-drivers-to-Kconfig-and-Makefiles.patch |  124 +
 ...eate-header-file-for-OMAP4-crypto-modules.patch |  213 +
 ...m33x-Create-driver-for-TRNG-crypto-module.patch |  324 +
 ...am33x-Create-driver-for-AES-crypto-module.patch |  971 +++
 ...x-Create-driver-for-SHA-MD5-crypto-module.patch | 1444 ++++
 .../linux-am335x-3.2.0-psp05.06.00.00/defconfig    |    1 +
 .../linux/linux-am335x_3.2.0-psp05.06.00.00.bb     |   91 +
 23 files changed, 13679 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0001-am3358-sk-modified-WLAN-enable-and-irq-to-match-boar.patch
 create mode 100644 meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0001-am335x-Add-crypto-driver-settings-to-defconfig.patch
 create mode 100644 meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0001-am335x-Add-pm_runtime-API-to-crypto-driver.patch
 create mode 100644 meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0001-am335x-enable-pullup-on-the-WLAN-enable-pin-fo.patch
 create mode 100644 meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0001-am335x_evm_defconfig-turn-off-MUSB-DMA.patch
 create mode 100644 meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0001-am335xevm-using-edge-triggered-interrupts-for-WLAN.patch
 create mode 100644 meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0001-am33x-Add-memory-addresses-for-crypto-modules.patch
 create mode 100644 meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0001-am33xx-Add-SmartReflex-support.patch
 create mode 100644 meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0001-mach-omap2-pm33xx-Disable-VT-switch.patch
 create mode 100644 meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0001-musb-update-PIO-mode-help-information-in-Kconfig.patch
 create mode 100644 meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0001-omap-serial-add-delay-before-suspending.patch
 create mode 100644 meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0002-AM335x-OCF-Driver-for-Linux-3.patch
 create mode 100644 meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0002-am335x-Add-suspend-resume-routines-to-crypto-driver.patch
 create mode 100644 meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0002-am33x-Add-crypto-device-and-resource-structures.patch
 create mode 100644 meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0002-am33xx-Enable-CONFIG_AM33XX_SMARTREFLEX.patch
 create mode 100644 meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0003-am33x-Add-crypto-device-and-resource-structure-for-T.patch
 create mode 100644 meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0004-am33x-Add-crypto-drivers-to-Kconfig-and-Makefiles.patch
 create mode 100644 meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0005-am33x-Create-header-file-for-OMAP4-crypto-modules.patch
 create mode 100644 meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0006-am33x-Create-driver-for-TRNG-crypto-module.patch
 create mode 100644 meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0007-am33x-Create-driver-for-AES-crypto-module.patch
 create mode 100644 meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0008-am33x-Create-driver-for-SHA-MD5-crypto-module.patch
 create mode 100644 meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/defconfig
 create mode 100644 meta-arago-distro/recipes-kernel/linux/linux-am335x_3.2.0-psp05.06.00.00.bb

diff --git a/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0001-am3358-sk-modified-WLAN-enable-and-irq-to-match-boar.patch b/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0001-am3358-sk-modified-WLAN-enable-and-irq-to-match-boar.patch
new file mode 100644
index 0000000..25d2fdf
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0001-am3358-sk-modified-WLAN-enable-and-irq-to-match-boar.patch
@@ -0,0 +1,62 @@
+From 69c82f68876d24e798388fc053c8d6766236ac65 Mon Sep 17 00:00:00 2001
+From: Vita Preskovsky <vitap@ti.com>
+Date: Thu, 28 Jun 2012 14:53:12 +0300
+Subject: [PATCH] am3358-sk: modified WLAN enable and irq to match board revision 1.2
+	* 1. WLAN enable and irq are modified to match board revision 1.2
+	  2. support suspend/resume for SK board
+
+Upstream-Status: Pending
+
+Signed-off-by: Vita Preskovsky <vitap@ti.com>
+---
+ arch/arm/mach-omap2/board-am335xevm.c |   11 +++++++----
+ 1 files changed, 7 insertions(+), 4 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index 64f7547..6ae4e68 100755
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -905,7 +905,7 @@ static struct pinmux_config ecap2_pin_mux[] = {
+
+ #define AM335XEVM_WLAN_PMENA_GPIO	GPIO_TO_PIN(1, 30)
+ #define AM335XEVM_WLAN_IRQ_GPIO		GPIO_TO_PIN(3, 17)
+-#define AM335XEVM_SK_WLAN_IRQ_GPIO      GPIO_TO_PIN(1, 29)
++#define AM335XEVM_SK_WLAN_IRQ_GPIO      GPIO_TO_PIN(0, 31)
+
+ struct wl12xx_platform_data am335xevm_wlan_data = {
+	.irq = OMAP_GPIO_IRQ(AM335XEVM_WLAN_IRQ_GPIO),
+@@ -941,8 +941,8 @@ static struct pinmux_config wl12xx_pin_mux[] = {
+  };
+
+ static struct pinmux_config wl12xx_pin_mux_sk[] = {
+-	{"gpmc_wpn.gpio0_31", OMAP_MUX_MODE7 | AM33XX_PIN_OUTPUT},
+-	{"gpmc_csn0.gpio1_29", OMAP_MUX_MODE7 | AM33XX_PIN_INPUT},
++	{"gpmc_wpn.gpio0_31", OMAP_MUX_MODE7 | AM33XX_PIN_INPUT},
++	{"gpmc_csn0.gpio1_29", OMAP_MUX_MODE7 | AM33XX_PIN_OUTPUT_PULLUP},
+	{"mcasp0_ahclkx.gpio3_21", OMAP_MUX_MODE7 | AM33XX_PIN_OUTPUT},
+	{NULL, 0},
+ };
+@@ -1618,6 +1618,7 @@ static void mmc1_wl12xx_init(int evm_id, int profile)
+	am335x_mmc[1].name = "wl1271";
+	am335x_mmc[1].caps = MMC_CAP_4_BIT_DATA | MMC_CAP_POWER_OFF_CARD;
+	am335x_mmc[1].nonremovable = true;
++	am335x_mmc[1].pm_caps = MMC_PM_KEEP_POWER;
+	am335x_mmc[1].gpio_cd = -EINVAL;
+	am335x_mmc[1].gpio_wp = -EINVAL;
+	am335x_mmc[1].ocr_mask = MMC_VDD_32_33 | MMC_VDD_33_34; /* 3V3 */
+@@ -1674,10 +1675,12 @@ static void wl12xx_init(int evm_id, int profile)
+	int ret;
+
+	if (evm_id == EVM_SK) {
+-		am335xevm_wlan_data.wlan_enable_gpio = GPIO_TO_PIN(0, 31);
++		am335xevm_wlan_data.wlan_enable_gpio = GPIO_TO_PIN(1, 29);
+		am335xevm_wlan_data.bt_enable_gpio = GPIO_TO_PIN(3, 21);
+		am335xevm_wlan_data.irq =
+				OMAP_GPIO_IRQ(AM335XEVM_SK_WLAN_IRQ_GPIO);
++		am335xevm_wlan_data.platform_quirks =
++				WL12XX_PLATFORM_QUIRK_EDGE_IRQ;
+		setup_pin_mux(wl12xx_pin_mux_sk);
+	} else {
+		setup_pin_mux(wl12xx_pin_mux);
+--
+1.7.0.4
diff --git a/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0001-am335x-Add-crypto-driver-settings-to-defconfig.patch b/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0001-am335x-Add-crypto-driver-settings-to-defconfig.patch
new file mode 100644
index 0000000..bb48d69
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0001-am335x-Add-crypto-driver-settings-to-defconfig.patch
@@ -0,0 +1,132 @@
+From cf67829e0c0cccb06a9f33d40fe43a122e8a5178 Mon Sep 17 00:00:00 2001
+From: Greg Turner <gregturner@ti.com>
+Date: Fri, 8 Jun 2012 13:54:13 -0500
+Subject: [PATCH] Add crypto driver settings to defconfig
+
+* Add Crypto Driver and configuration to defconfig
+---
+ arch/arm/configs/am335x_evm_defconfig |   40 +++++++++++++++++++++++----------
+ 1 files changed, 28 insertions(+), 12 deletions(-)
+ mode change 100644 => 100755 arch/arm/configs/am335x_evm_defconfig
+
+diff --git a/arch/arm/configs/am335x_evm_defconfig b/arch/arm/configs/am335x_evm_defconfig
+old mode 100644
+new mode 100755
+index 9f45503..46528c4
+--- a/arch/arm/configs/am335x_evm_defconfig
++++ b/arch/arm/configs/am335x_evm_defconfig
+@@ -1278,7 +1278,9 @@ CONFIG_SERIAL_OMAP_CONSOLE=y
+ # CONFIG_SERIAL_XILINX_PS_UART is not set
+ # CONFIG_HVC_DCC is not set
+ # CONFIG_IPMI_HANDLER is not set
+-# CONFIG_HW_RANDOM is not set
++CONFIG_HW_RANDOM=y
++# CONFIG_HW_RANDOM_TIMERIOMEM is not set
++CONFIG_HW_RANDOM_OMAP4=y
+ # CONFIG_R3964 is not set
+ # CONFIG_RAW_DRIVER is not set
+ # CONFIG_TCG_TPM is not set
+@@ -2473,36 +2475,38 @@ CONFIG_CRYPTO=y
+ #
+ CONFIG_CRYPTO_ALGAPI=y
+ CONFIG_CRYPTO_ALGAPI2=y
++CONFIG_CRYPTO_AEAD=y
+ CONFIG_CRYPTO_AEAD2=y
+ CONFIG_CRYPTO_BLKCIPHER=y
+ CONFIG_CRYPTO_BLKCIPHER2=y
+ CONFIG_CRYPTO_HASH=y
+ CONFIG_CRYPTO_HASH2=y
++CONFIG_CRYPTO_RNG=y
+ CONFIG_CRYPTO_RNG2=y
+ CONFIG_CRYPTO_PCOMP2=y
+ CONFIG_CRYPTO_MANAGER=y
+ CONFIG_CRYPTO_MANAGER2=y
+ # CONFIG_CRYPTO_USER is not set
+-CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
++# CONFIG_CRYPTO_MANAGER_DISABLE_TESTS is not set
+ # CONFIG_CRYPTO_GF128MUL is not set
+ # CONFIG_CRYPTO_NULL is not set
+ CONFIG_CRYPTO_WORKQUEUE=y
+ # CONFIG_CRYPTO_CRYPTD is not set
+ # CONFIG_CRYPTO_AUTHENC is not set
+-# CONFIG_CRYPTO_TEST is not set
++CONFIG_CRYPTO_TEST=m
+ 
+ #
+ # Authenticated Encryption with Associated Data
+ #
+ # CONFIG_CRYPTO_CCM is not set
+ # CONFIG_CRYPTO_GCM is not set
+-# CONFIG_CRYPTO_SEQIV is not set
++CONFIG_CRYPTO_SEQIV=y
+ 
+ #
+ # Block modes
+ #
+-# CONFIG_CRYPTO_CBC is not set
+-# CONFIG_CRYPTO_CTR is not set
++CONFIG_CRYPTO_CBC=y
++CONFIG_CRYPTO_CTR=y
+ # CONFIG_CRYPTO_CTS is not set
+ CONFIG_CRYPTO_ECB=y
+ # CONFIG_CRYPTO_LRW is not set
+@@ -2512,7 +2516,7 @@ CONFIG_CRYPTO_ECB=y
+ #
+ # Hash modes
+ #
+-# CONFIG_CRYPTO_HMAC is not set
++CONFIG_CRYPTO_HMAC=y
+ # CONFIG_CRYPTO_XCBC is not set
+ # CONFIG_CRYPTO_VMAC is not set
+ 
+@@ -2522,14 +2526,14 @@ CONFIG_CRYPTO_ECB=y
+ CONFIG_CRYPTO_CRC32C=y
+ # CONFIG_CRYPTO_GHASH is not set
+ # CONFIG_CRYPTO_MD4 is not set
+-# CONFIG_CRYPTO_MD5 is not set
++CONFIG_CRYPTO_MD5=y
+ CONFIG_CRYPTO_MICHAEL_MIC=y
+ # CONFIG_CRYPTO_RMD128 is not set
+ # CONFIG_CRYPTO_RMD160 is not set
+ # CONFIG_CRYPTO_RMD256 is not set
+ # CONFIG_CRYPTO_RMD320 is not set
+-# CONFIG_CRYPTO_SHA1 is not set
+-# CONFIG_CRYPTO_SHA256 is not set
++CONFIG_CRYPTO_SHA1=y
++CONFIG_CRYPTO_SHA256=y
+ # CONFIG_CRYPTO_SHA512 is not set
+ # CONFIG_CRYPTO_TGR192 is not set
+ # CONFIG_CRYPTO_WP512 is not set
+@@ -2544,7 +2548,7 @@ CONFIG_CRYPTO_ARC4=y
+ # CONFIG_CRYPTO_CAMELLIA is not set
+ # CONFIG_CRYPTO_CAST5 is not set
+ # CONFIG_CRYPTO_CAST6 is not set
+-# CONFIG_CRYPTO_DES is not set
++CONFIG_CRYPTO_DES=y
+ # CONFIG_CRYPTO_FCRYPT is not set
+ # CONFIG_CRYPTO_KHAZAD is not set
+ # CONFIG_CRYPTO_SALSA20 is not set
+@@ -2566,7 +2570,19 @@ CONFIG_CRYPTO_LZO=y
+ # CONFIG_CRYPTO_ANSI_CPRNG is not set
+ # CONFIG_CRYPTO_USER_API_HASH is not set
+ # CONFIG_CRYPTO_USER_API_SKCIPHER is not set
+-# CONFIG_CRYPTO_HW is not set
++CONFIG_CRYPTO_HW=y
++CONFIG_CRYPTO_DEV_OMAP4_AES=y
++CONFIG_CRYPTO_DEV_OMAP4_SHAM=y
++
++#
++# OCF Configuration
++#
++CONFIG_OCF_OCF=y
++# CONFIG_OCF_RANDOMHARVEST is not set
++CONFIG_OCF_CRYPTODEV=y
++CONFIG_OCF_CRYPTOSOFT=y
++# CONFIG_OCF_OCFNULL is not set
++# CONFIG_OCF_BENCH is not set
+ # CONFIG_BINARY_PRINTF is not set
+ 
+ #
+-- 
+1.7.0.4
+
diff --git a/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0001-am335x-Add-pm_runtime-API-to-crypto-driver.patch b/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0001-am335x-Add-pm_runtime-API-to-crypto-driver.patch
new file mode 100644
index 0000000..cef94b7
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0001-am335x-Add-pm_runtime-API-to-crypto-driver.patch
@@ -0,0 +1,405 @@
+From 7cb6dbae57e2bb5d237bb88f6eb40971cf8fc3b5 Mon Sep 17 00:00:00 2001
+From: Greg Turner <gregturner@ti.com>
+Date: Wed, 18 Jul 2012 09:15:18 -0500
+Subject: [PATCH] [am335x]: Add pm_runtime API to crypto driver
+
+* Add pm_runtime API to crypto driver AES and SHA
+* Mod devices.c file to add pm_runtime for crypto
+* Mod omap_hwmod_33xx_data.c to add resources structures
+* Crypto module clocks are enabled in probe function
+  and disabled only on remove or other error.
+---
+ arch/arm/mach-omap2/devices.c              |   66 ++++++++++++++++++++++++++++
+ arch/arm/mach-omap2/omap_hwmod_33xx_data.c |   15 ++++++-
+ drivers/crypto/omap4-aes.c                 |   52 +++++++++++----------
+ drivers/crypto/omap4-sham.c                |   45 ++++++++++---------
+ 4 files changed, 131 insertions(+), 47 deletions(-)
+ mode change 100644 => 100755 arch/arm/mach-omap2/devices.c
+ mode change 100644 => 100755 arch/arm/mach-omap2/omap_hwmod_33xx_data.c
+ mode change 100644 => 100755 drivers/crypto/omap4-aes.c
+ mode change 100644 => 100755 drivers/crypto/omap4-sham.c
+
+diff --git a/arch/arm/mach-omap2/devices.c b/arch/arm/mach-omap2/devices.c
+old mode 100644
+new mode 100755
+index ebf0d9e..156e363
+--- a/arch/arm/mach-omap2/devices.c
++++ b/arch/arm/mach-omap2/devices.c
+@@ -751,6 +751,7 @@ static struct platform_device sham_device = {
+	.id		= -1,
+ };
+
++#if 0
+ static void omap_init_sham(void)
+ {
+	sham_device.resource = omap4_sham_resources;
+@@ -758,6 +759,38 @@ static void omap_init_sham(void)
+
+	platform_device_register(&sham_device);
+ }
++#endif
++
++int __init omap_init_sham(void)
++{
++	int id = -1;
++	struct platform_device *pdev;
++	struct omap_hwmod *oh;
++	char *oh_name = "sha0";
++	char *name = "omap4-sham";
++
++	oh = omap_hwmod_lookup(oh_name);
++	if (!oh) {
++		pr_err("Could not look up %s\n", oh_name);
++		return -ENODEV;
++	}
++
++	pdev = omap_device_build(name, id, oh, NULL, 0, NULL, 0, 0);
++	//pdev.resource = omap4_sham_resources;
++	//pdev.num_resources = omap4_sham_resources_sz;
++
++	if (IS_ERR(pdev)) {
++		WARN(1, "Can't build omap_device for %s:%s.\n",
++						name, oh->name);
++		return PTR_ERR(pdev);
++	}
++
++	return 0;
++}
++
++
++
++
+
+ #else
+ static inline void omap_init_sham(void) { }
+@@ -853,12 +886,45 @@ static struct platform_device aes_device = {
+	.id		= -1,
+ };
+
++#if 0
+ static void omap_init_aes(void)
+ {
+	aes_device.resource = omap4_aes_resources;
+	aes_device.num_resources = omap4_aes_resources_sz;
+	platform_device_register(&aes_device);
+ }
++#endif
++
++int __init omap_init_aes(void)
++{
++	int id = -1;
++	struct platform_device *pdev;
++	struct omap_hwmod *oh;
++	char *oh_name = "aes0";
++	char *name = "omap4-aes";
++
++	oh = omap_hwmod_lookup(oh_name);
++	if (!oh) {
++		pr_err("Could not look up %s\n", oh_name);
++		return -ENODEV;
++	}
++
++	pdev = omap_device_build(name, id, oh, NULL, 0, NULL, 0, 0);
++	//pdev.resource = omap4_sham_resources;
++	//pdev.num_resources = omap4_sham_resources_sz;
++
++	if (IS_ERR(pdev)) {
++		WARN(1, "Can't build omap_device for %s:%s.\n",
++						name, oh->name);
++		return PTR_ERR(pdev);
++	}
++
++	return 0;
++}
++
++
++
++
+
+ #else
+ static inline void omap_init_aes(void) { }
+diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
+old mode 100644
+new mode 100755
+index 995b73f..2f9982c
+--- a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
++++ b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
+@@ -434,11 +434,18 @@ static struct omap_hwmod_irq_info am33xx_aes0_irqs[] = {
+	{ .irq = -1 }
+ };
+
++static struct omap_hwmod_dma_info am33xx_aes0_dma[] = {
++	{ .dma_req = AM33XX_DMA_AESEIP36T0_DOUT },
++	{ .dma_req = AM33XX_DMA_AESEIP36T0_DIN },
++	{ .dma_req = -1 }
++};
++
+ static struct omap_hwmod am33xx_aes0_hwmod = {
+	.name		= "aes0",
+	.class		= &am33xx_aes_hwmod_class,
+	.clkdm_name	= "l3_clkdm",
+	.mpu_irqs	= am33xx_aes0_irqs,
++	.sdma_reqs	= am33xx_aes0_dma,
+	.main_clk	= "aes0_fck",
+	.prcm		= {
+		.omap4	= {
+@@ -2165,15 +2172,21 @@ static struct omap_hwmod_class am33xx_sha0_hwmod_class = {
+ };
+
+ static struct omap_hwmod_irq_info am33xx_sha0_irqs[] = {
+-	{ .irq = 108 },
++	{ .irq = AM33XX_IRQ_SHAEIP57t0_P },
+	{ .irq = -1 }
+ };
+
++static struct omap_hwmod_dma_info am33xx_sha0_dma[] = {
++	{ .dma_req = AM33XX_DMA_SHAEIP57T0_DIN },
++	{ .dma_req = -1 }
++};
++
+ static struct omap_hwmod am33xx_sha0_hwmod = {
+	.name		= "sha0",
+	.class		= &am33xx_sha0_hwmod_class,
+	.clkdm_name	= "l3_clkdm",
+	.mpu_irqs	= am33xx_sha0_irqs,
++	.sdma_reqs	= am33xx_sha0_dma,
+	.main_clk	= "sha0_fck",
+	.prcm		= {
+		.omap4	= {
+diff --git a/drivers/crypto/omap4-aes.c b/drivers/crypto/omap4-aes.c
+old mode 100644
+new mode 100755
+index f0b3fe2..76f988a
+--- a/drivers/crypto/omap4-aes.c
++++ b/drivers/crypto/omap4-aes.c
+@@ -32,13 +32,14 @@
+ #include <linux/init.h>
+ #include <linux/errno.h>
+ #include <linux/kernel.h>
+-#include <linux/clk.h>
+ #include <linux/platform_device.h>
+ #include <linux/scatterlist.h>
+ #include <linux/dma-mapping.h>
+ #include <linux/io.h>
+ #include <linux/crypto.h>
++#include <linux/pm_runtime.h>
+ #include <linux/interrupt.h>
++#include <linux/delay.h>
+ #include <crypto/scatterwalk.h>
+ #include <crypto/aes.h>
+
+@@ -145,12 +146,6 @@ static void omap4_aes_write_n(struct omap4_aes_dev *dd, u32 offset,
+
+ static int omap4_aes_hw_init(struct omap4_aes_dev *dd)
+ {
+-	/*
+-	 * clocks are enabled when request starts and disabled when finished.
+-	 * It may be long delays between requests.
+-	 * Device might go to off mode to save power.
+-	 */
+-	clk_enable(dd->iclk);
+	omap4_aes_write(dd, AES_REG_SYSCFG, 0);
+
+	if (!(dd->flags & FLAGS_INIT)) {
+@@ -494,7 +489,6 @@ static void omap4_aes_finish_req(struct omap4_aes_dev *dd, int err)
+
+	pr_debug("err: %d\n", err);
+
+-	clk_disable(dd->iclk);
+	dd->flags &= ~FLAGS_BUSY;
+
+	req->base.complete(&req->base, err);
+@@ -801,13 +795,15 @@ static int omap4_aes_probe(struct platform_device *pdev)
+	crypto_init_queue(&dd->queue, AM33X_AES_QUEUE_LENGTH);
+
+	/* Get the base address */
+-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+-	if (!res) {
+-		dev_err(dev, "invalid resource type\n");
+-		err = -ENODEV;
+-		goto err_res;
+-	}
+-	dd->phys_base = res->start;
++	//res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
++	//if (!res) {
++	//	dev_err(dev, "invalid resource type\n");
++	//	err = -ENODEV;
++	//	goto err_res;
++	//}
++
++	//dd->phys_base = res->start;
++	dd->phys_base = AM33XX_AES0_P_BASE;
+
+	/* Get the DMA */
+	res = platform_get_resource(pdev, IORESOURCE_DMA, 0);
+@@ -823,13 +819,10 @@ static int omap4_aes_probe(struct platform_device *pdev)
+	else
+		dd->dma_in = res->start;
+
+-	/* Initializing the clock */
+-	dd->iclk = clk_get(dev, "aes0_fck");
+-	if (IS_ERR(dd->iclk)) {
+-		dev_err(dev, "clock initialization failed.\n");
+-		err = PTR_ERR(dd->iclk);
+-		goto err_res;
+-	}
++	pm_runtime_enable(dev);
++	udelay(1);
++	pm_runtime_get_sync(dev);
++	udelay(1);
+
+	dd->io_base = ioremap(dd->phys_base, SZ_4K);
+	if (!dd->io_base) {
+@@ -840,7 +833,7 @@ static int omap4_aes_probe(struct platform_device *pdev)
+
+	omap4_aes_hw_init(dd);
+	reg = omap4_aes_read(dd, AES_REG_REV);
+-	clk_disable(dd->iclk);
++
+	dev_info(dev, "AM33X AES hw accel rev: %u.%02u\n",
+		 ((reg & AES_REG_REV_X_MAJOR_MASK) >> 8),
+		 (reg & AES_REG_REV_Y_MINOR_MASK));
+@@ -879,7 +872,12 @@ err_dma:
+	iounmap(dd->io_base);
+
+ err_io:
+-	clk_put(dd->iclk);
++	pm_runtime_put_sync(dev);
++	udelay(1);
++	pm_runtime_disable(dev);
++	udelay(1);
++
++
+ err_res:
+	kfree(dd);
+	dd = NULL;
+@@ -907,7 +905,11 @@ static int omap4_aes_remove(struct platform_device *pdev)
+	tasklet_kill(&dd->queue_task);
+	omap4_aes_dma_cleanup(dd);
+	iounmap(dd->io_base);
+-	clk_put(dd->iclk);
++	pm_runtime_put_sync(&pdev->dev);
++	udelay(1);
++	pm_runtime_disable(&pdev->dev);
++	udelay(1);
++
+	kfree(dd);
+	dd = NULL;
+
+diff --git a/drivers/crypto/omap4-sham.c b/drivers/crypto/omap4-sham.c
+old mode 100644
+new mode 100755
+index 79f6be9..21f1b48
+--- a/drivers/crypto/omap4-sham.c
++++ b/drivers/crypto/omap4-sham.c
+@@ -31,7 +31,6 @@
+ #include <linux/errno.h>
+ #include <linux/interrupt.h>
+ #include <linux/kernel.h>
+-#include <linux/clk.h>
+ #include <linux/irq.h>
+ #include <linux/io.h>
+ #include <linux/platform_device.h>
+@@ -40,6 +39,7 @@
+ #include <linux/delay.h>
+ #include <linux/crypto.h>
+ #include <linux/cryptohash.h>
++#include <linux/pm_runtime.h>
+ #include <crypto/scatterwalk.h>
+ #include <crypto/algapi.h>
+ #include <crypto/sha.h>
+@@ -700,7 +700,6 @@ static void omap4_sham_finish_req(struct ahash_request *req, int err)
+	/* atomic operation is not needed here */
+	dd->dflags &= ~(BIT(FLAGS_BUSY) | BIT(FLAGS_FINAL) | BIT(FLAGS_CPU) |
+			BIT(FLAGS_DMA_READY) | BIT(FLAGS_OUTPUT_READY));
+-	clk_disable(dd->iclk);
+
+	if (req->base.complete)
+		req->base.complete(&req->base, err);
+@@ -743,7 +742,6 @@ static int omap4_sham_handle_queue(struct omap4_sham_dev *dd,
+	dev_dbg(dd->dev, "handling new req, op: %lu, nbytes: %d\n",
+						ctx->op, req->nbytes);
+
+-	clk_enable(dd->iclk);
+	if (!test_bit(FLAGS_INIT, &dd->dflags)) {
+		set_bit(FLAGS_INIT, &dd->dflags);
+		dd->err = 0;
+@@ -1272,13 +1270,15 @@ static int __devinit omap4_sham_probe(struct platform_device *pdev)
+	dd->irq = -1;
+
+	/* Get the base address */
+-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+-	if (!res) {
+-		dev_err(dev, "no MEM resource info\n");
+-		err = -ENODEV;
+-		goto res_err;
+-	}
+-	dd->phys_base = res->start;
++	//res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
++	//if (!res) {
++	//	dev_err(dev, "no MEM resource info\n");
++	//	err = -ENODEV;
++	//	goto res_err;
++	//}
++
++	//dd->phys_base = res->start;
++	dd->phys_base = AM33XX_SHA1MD5_P_BASE;
+
+	/* Get the DMA */
+	res = platform_get_resource(pdev, IORESOURCE_DMA, 0);
+@@ -1308,13 +1308,10 @@ static int __devinit omap4_sham_probe(struct platform_device *pdev)
+	if (err)
+		goto dma_err;
+
+-	/* Initializing the clock */
+-	dd->iclk = clk_get(dev, "sha0_fck");
+-	if (IS_ERR(dd->iclk)) {
+-		dev_err(dev, "clock initialization failed.\n");
+-		err = PTR_ERR(dd->iclk);
+-		goto clk_err;
+-	}
++	pm_runtime_enable(dev);
++	udelay(1);
++	pm_runtime_get_sync(dev);
++	udelay(1);
+
+	dd->io_base = ioremap(dd->phys_base, SZ_4K);
+	if (!dd->io_base) {
+@@ -1323,9 +1320,7 @@ static int __devinit omap4_sham_probe(struct platform_device *pdev)
+		goto io_err;
+	}
+
+-	clk_enable(dd->iclk);
+	reg = omap4_sham_read(dd, SHA_REG_REV);
+-	clk_disable(dd->iclk);
+
+	dev_info(dev, "AM33X SHA/MD5 hw accel rev: %u.%02u\n",
+		 (reg & SHA_REG_REV_X_MAJOR_MASK) >> 8, reg & SHA_REG_REV_Y_MINOR_MASK);
+@@ -1349,7 +1344,11 @@ err_algs:
+		crypto_unregister_ahash(&algs[j]);
+	iounmap(dd->io_base);
+ io_err:
+-	clk_put(dd->iclk);
++	pm_runtime_put_sync(dev);
++	udelay(1);
++	pm_runtime_disable(dev);
++	udelay(1);
++
+ clk_err:
+	omap4_sham_dma_cleanup(dd);
+ dma_err:
+@@ -1379,7 +1378,11 @@ static int __devexit omap4_sham_remove(struct platform_device *pdev)
+		crypto_unregister_ahash(&algs[i]);
+	tasklet_kill(&dd->done_task);
+	iounmap(dd->io_base);
+-	clk_put(dd->iclk);
++	pm_runtime_put_sync(&pdev->dev);
++	udelay(1);
++	pm_runtime_disable(&pdev->dev);
++	udelay(1);
++
+	omap4_sham_dma_cleanup(dd);
+	if (dd->irq >= 0)
+		free_irq(dd->irq, dd);
+--
+1.7.0.4
diff --git a/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0001-am335x-enable-pullup-on-the-WLAN-enable-pin-fo.patch b/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0001-am335x-enable-pullup-on-the-WLAN-enable-pin-fo.patch
new file mode 100644
index 0000000..863fe37
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0001-am335x-enable-pullup-on-the-WLAN-enable-pin-fo.patch
@@ -0,0 +1,57 @@
+From f69ffbef6793b7238a8518481735fd53326e0cdf Mon Sep 17 00:00:00 2001
+From: Vita Preskovsky <vitap@ti.com>
+Date: Tue, 24 Jul 2012 20:02:28 +0300
+Subject: [PATCH] am335x: enable pullup on the WLAN enable pin for keeping wlan
+
+  * Enable pullup on the WLAN enable pin for keeping wlan active
+    during suspend in wowlan mode. The fix is relevant only in the case
+    of am335x-SK board.
+
+
+Signed-off-by: Vita Preskovsky <vitap@ti.com>
+---
+ arch/arm/mach-omap2/board-am335xevm.c |   22 ++++++++++++++++++++++
+ 1 files changed, 22 insertions(+), 0 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index f68710c..f263f84 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -1673,13 +1673,35 @@ static void wl12xx_bluetooth_enable(void)
+	gpio_direction_output(am335xevm_wlan_data.bt_enable_gpio, 0);
+ }
+
++#define AM33XX_CTRL_REGADDR(reg)					\
++		AM33XX_L4_WK_IO_ADDRESS(AM33XX_SCM_BASE + (reg))
++
++/* wlan enable pin */
++#define AM33XX_CONTROL_PADCONF_GPMC_CSN0_OFFSET		0x087C
+ static int wl12xx_set_power(struct device *dev, int slot, int on, int vdd)
+ {
++	int pad_mux_value;
++
+	if (on) {
+		gpio_direction_output(am335xevm_wlan_data.wlan_enable_gpio, 1);
++
++		/* Enable pullup on the WLAN enable pin for keeping wlan active during suspend
++		   in wowlan mode */
++		if ( am335x_evm_get_id() == EVM_SK ) {
++			pad_mux_value = readl(AM33XX_CTRL_REGADDR(AM33XX_CONTROL_PADCONF_GPMC_CSN0_OFFSET));
++			pad_mux_value &= (~AM33XX_PULL_DISA);
++			writel(pad_mux_value, AM33XX_CTRL_REGADDR(AM33XX_CONTROL_PADCONF_GPMC_CSN0_OFFSET));
++		}
++
+		mdelay(70);
+	} else {
+		gpio_direction_output(am335xevm_wlan_data.wlan_enable_gpio, 0);
++		/* Disable pullup on the WLAN enable when WLAN is off */
++		if ( am335x_evm_get_id() == EVM_SK ) {
++			pad_mux_value = readl(AM33XX_CTRL_REGADDR(AM33XX_CONTROL_PADCONF_GPMC_CSN0_OFFSET));
++			pad_mux_value |= AM33XX_PULL_DISA;
++			writel(pad_mux_value, AM33XX_CTRL_REGADDR(AM33XX_CONTROL_PADCONF_GPMC_CSN0_OFFSET));
++		}
+	}
+
+	return 0;
+--
+1.7.0.4
diff --git a/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0001-am335x_evm_defconfig-turn-off-MUSB-DMA.patch b/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0001-am335x_evm_defconfig-turn-off-MUSB-DMA.patch
new file mode 100644
index 0000000..6a32c2c
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0001-am335x_evm_defconfig-turn-off-MUSB-DMA.patch
@@ -0,0 +1,35 @@
+From 95eca5a896c96d0af7188c97825a3b3ef5313ed3 Mon Sep 17 00:00:00 2001
+From: Chase Maupin <Chase.Maupin@ti.com>
+Date: Thu, 2 Feb 2012 16:38:51 -0600
+Subject: [PATCH] am335x_evm_defconfig: turn off MUSB DMA
+
+* Turn off the MUSB DMA in the am335x_evm_defconfig.  This way
+  we can pull the default defconfig without enabling the
+  faulty USB DMA.
+
+Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
+---
+ arch/arm/configs/am335x_evm_defconfig |    6 +++---
+ 1 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/arch/arm/configs/am335x_evm_defconfig b/arch/arm/configs/am335x_evm_defconfig
+index d105c61..121dc7f 100644
+--- a/arch/arm/configs/am335x_evm_defconfig
++++ b/arch/arm/configs/am335x_evm_defconfig
+@@ -1982,11 +1982,11 @@ CONFIG_USB_MUSB_TI81XX_GLUE=y
+ CONFIG_USB_MUSB_TI81XX=y
+ # CONFIG_USB_MUSB_BLACKFIN is not set
+ # CONFIG_USB_MUSB_UX500 is not set
+-CONFIG_USB_TI_CPPI41_DMA_HW=y
+-# CONFIG_MUSB_PIO_ONLY is not set
++# CONFIG_USB_TI_CPPI41_DMA_HW is not set
++CONFIG_MUSB_PIO_ONLY=y
+ # CONFIG_USB_INVENTRA_DMA is not set
+ # CONFIG_USB_TI_CPPI_DMA is not set
+-CONFIG_USB_TI_CPPI41_DMA=y
++# CONFIG_USB_TI_CPPI41_DMA is not set
+ # CONFIG_USB_TUSB_OMAP_DMA is not set
+ # CONFIG_USB_UX500_DMA is not set
+ # CONFIG_USB_RENESAS_USBHS is not set
+--
+1.7.0.4
diff --git a/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0001-am335xevm-using-edge-triggered-interrupts-for-WLAN.patch b/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0001-am335xevm-using-edge-triggered-interrupts-for-WLAN.patch
new file mode 100644
index 0000000..98b3a31
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0001-am335xevm-using-edge-triggered-interrupts-for-WLAN.patch
@@ -0,0 +1,35 @@
+From be52bac69dfe6a56276b16ccd234970c4f7b1255 Mon Sep 17 00:00:00 2001
+From: Vita Preskovsky <vitap@ti.com>
+Date: Wed, 18 Jul 2012 16:20:36 +0300
+Subject: [PATCH] am335xevm: using edge triggered interrupts for WLAN
+
+  *using edge triggered interrupts instead of default level triggered in
+   all platforms supporting WLAN. This reduces CPU cycles and possibility
+   for missed interrupts.
+
+
+Signed-off-by: Vita Preskovsky <vitap@ti.com>
+---
+ arch/arm/mach-omap2/board-am335xevm.c |    3 +--
+ 1 files changed, 1 insertions(+), 2 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index 6ae4e68..ac005c8 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -1679,12 +1679,11 @@ static void wl12xx_init(int evm_id, int profile)
+		am335xevm_wlan_data.bt_enable_gpio = GPIO_TO_PIN(3, 21);
+		am335xevm_wlan_data.irq =
+				OMAP_GPIO_IRQ(AM335XEVM_SK_WLAN_IRQ_GPIO);
+-		am335xevm_wlan_data.platform_quirks =
+-				WL12XX_PLATFORM_QUIRK_EDGE_IRQ;
+		setup_pin_mux(wl12xx_pin_mux_sk);
+	} else {
+		setup_pin_mux(wl12xx_pin_mux);
+	}
++	am335xevm_wlan_data.platform_quirks = WL12XX_PLATFORM_QUIRK_EDGE_IRQ;
+	wl12xx_bluetooth_enable();
+
+	if (wl12xx_set_platform_data(&am335xevm_wlan_data))
+--
+1.7.0.4
diff --git a/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0001-am33x-Add-memory-addresses-for-crypto-modules.patch b/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0001-am33x-Add-memory-addresses-for-crypto-modules.patch
new file mode 100644
index 0000000..f92a7fc
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0001-am33x-Add-memory-addresses-for-crypto-modules.patch
@@ -0,0 +1,41 @@
+From 5f2f17a488aba4319b537aed040ea13607af128b Mon Sep 17 00:00:00 2001
+From: Greg Turner <gregturner@ti.com>
+Date: Thu, 17 May 2012 14:25:40 -0500
+Subject: [PATCH 1/8] am33x: Add memory addresses for crypto modules
+
+* Add base memory addresses to the am33xx.h header file
+
+These addresses are for the HW crypto modules including TRNG, AES, and SHA/MD5
+
+Signed-off-by: Greg Turner <gregturner@ti.com>
+---
+ arch/arm/plat-omap/include/plat/am33xx.h |   11 +++++++++++
+ 1 files changed, 11 insertions(+), 0 deletions(-)
+ mode change 100644 => 100755 arch/arm/plat-omap/include/plat/am33xx.h
+
+diff --git a/arch/arm/plat-omap/include/plat/am33xx.h b/arch/arm/plat-omap/include/plat/am33xx.h
+old mode 100644
+new mode 100755
+index a16e72c..96ab1c3
+--- a/arch/arm/plat-omap/include/plat/am33xx.h
++++ b/arch/arm/plat-omap/include/plat/am33xx.h
+@@ -65,6 +65,17 @@
+
+ #define AM33XX_ELM_BASE		0x48080000
+
++/* Base address for crypto modules */
++#define AM33XX_SHA1MD5_S_BASE	0x53000000
++#define AM33XX_SHA1MD5_P_BASE	0x53100000
++
++#define	AM33XX_AES0_S_BASE	0x53400000
++#define	AM33XX_AES0_P_BASE	0x53500000
++#define	AM33XX_AES1_S_BASE	0x53600000
++#define	AM33XX_AES1_P_BASE	0x53700000
++
++#define	AM33XX_RNG_BASE		0x48310000
++
+ #define AM33XX_ASP0_BASE	0x48038000
+ #define AM33XX_ASP1_BASE	0x4803C000
+
+--
+1.7.0.4
diff --git a/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0001-am33xx-Add-SmartReflex-support.patch b/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0001-am33xx-Add-SmartReflex-support.patch
new file mode 100644
index 0000000..a17f62c
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0001-am33xx-Add-SmartReflex-support.patch
@@ -0,0 +1,2014 @@
+From 35ae6b61d349e5b4efd1c6337a0d1e23b6e86899 Mon Sep 17 00:00:00 2001
+From: Greg Guyotte <gguyotte@ti.com>
+Date: Thu, 7 Jun 2012 18:05:31 -0500
+Subject: [PATCH] am33xx: Add SmartReflex support.
+
+This patch introduces SmartReflex support to AM33XX devices.  The
+purpose of SmartReflex is to optimize (lower) voltage based upon
+silicon process and temperature.
+
+The SmartReflex driver requires the silicon to be programmed with
+"nTarget" EFUSE values.  If the values are not present (as with
+pre-RTP samples), the driver will simply fail to load and kernel
+boot will continue normally.
+
+The SR driver logs several items in the debugfs at /debug/smartreflex.
+To disable SmartReflex, use the command 'echo 0 > /debug/smartreflex/autocomp'.
+The node /debug/smartreflex/smartreflex0 gives information about
+the CORE voltage domain, and /smartreflex1 is related to the MPU voltage
+domain.
+
+To determine the effectiveness of SmartReflex, you can compare the
+initial voltage with the current voltage for a given OPP.  For example,
+'cat /debug/smartreflex/smartreflex1/current_voltage' gives the current
+MPU voltage.  Comparing that with 'cat /debug/smartreflex/smartreflex1/
+initial_voltage' will show you the voltage drop associated with SR
+operation.
+
+Signed-off-by: Greg Guyotte <gguyotte@ti.com>
+---
+ arch/arm/mach-omap2/Makefile                       |    1 +
+ arch/arm/mach-omap2/am33xx-smartreflex-class2.c    | 1055 ++++++++++++++++++++
+ arch/arm/mach-omap2/board-am335xevm.c              |    7 +
+ arch/arm/mach-omap2/devices.c                      |  269 +++++
+ arch/arm/mach-omap2/include/mach/board-am335xevm.h |    1 +
+ arch/arm/plat-omap/Kconfig                         |   21 +
+ arch/arm/plat-omap/include/plat/am33xx.h           |    3 +
+ arch/arm/plat-omap/include/plat/smartreflex.h      |  431 ++++++++
+ drivers/regulator/core.c                           |    4 +
+ include/linux/regulator/driver.h                   |    2 +-
+ include/linux/regulator/machine.h                  |    3 +-
+ 11 files changed, 1795 insertions(+), 2 deletions(-)
+ create mode 100644 arch/arm/mach-omap2/am33xx-smartreflex-class2.c
+ create mode 100644 arch/arm/plat-omap/include/plat/smartreflex.h
+
+diff --git a/arch/arm/mach-omap2/Makefile b/arch/arm/mach-omap2/Makefile
+index f275e74..c01b62d 100644
+--- a/arch/arm/mach-omap2/Makefile
++++ b/arch/arm/mach-omap2/Makefile
+@@ -73,6 +73,7 @@ obj-$(CONFIG_SOC_OMAPAM33XX)		+= cpuidle33xx.o pm33xx.o \
+ obj-$(CONFIG_PM_DEBUG)			+= pm-debug.o
+ obj-$(CONFIG_OMAP_SMARTREFLEX)          += sr_device.o smartreflex.o
+ obj-$(CONFIG_OMAP_SMARTREFLEX_CLASS3)	+= smartreflex-class3.o
++obj-$(CONFIG_AM33XX_SMARTREFLEX)        += am33xx-smartreflex-class2.o
+
+ AFLAGS_sleep24xx.o			:=-Wa,-march=armv6
+ AFLAGS_sleep34xx.o			:=-Wa,-march=armv7-a$(plus_sec)
+diff --git a/arch/arm/mach-omap2/am33xx-smartreflex-class2.c b/arch/arm/mach-omap2/am33xx-smartreflex-class2.c
+new file mode 100644
+index 0000000..66f98b7
+--- /dev/null
++++ b/arch/arm/mach-omap2/am33xx-smartreflex-class2.c
+@@ -0,0 +1,1055 @@
++/*
++ * SmartReflex Voltage Control driver
++ *
++ * Copyright (C) 2012 Texas Instruments, Inc. - http://www.ti.com/
++ * Author: Greg Guyotte <gguyotte@ti.com> (modified for AM33xx)
++ *
++ * Copyright (C) 2011 Texas Instruments, Inc. - http://www.ti.com/
++ * Author: AnilKumar Ch <anilkumar@ti.com>
++ *
++ * This program is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU General Public License as
++ * published by the Free Software Foundation version 2.
++ *
++ * This program is distributed "as is" WITHOUT ANY WARRANTY of any
++ * kind, whether express or implied; without even the implied warranty
++ * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ * GNU General Public License for more details.
++ */
++
++#include <linux/kernel.h>
++#include <linux/init.h>
++#include <linux/module.h>
++#include <linux/interrupt.h>
++#include <linux/clk.h>
++#include <linux/io.h>
++#include <linux/debugfs.h>
++#include <linux/slab.h>
++#include <linux/regulator/consumer.h>
++#include <linux/cpufreq.h>
++#include <linux/opp.h>
++
++#include <plat/common.h>
++#include <plat/smartreflex.h>
++
++#include "control.h"
++#include "voltage.h"
++
++#define CLK_NAME_LEN		40
++
++static inline void sr_write_reg(struct am33xx_sr *sr, int offset, u32 value,
++					u32 srid)
++{
++	writel(value, sr->sen[srid].base + offset);
++}
++
++static inline void sr_modify_reg(struct am33xx_sr *sr, int offset, u32 mask,
++				u32 value, u32 srid)
++{
++	u32 reg_val;
++
++	reg_val = readl(sr->sen[srid].base + offset);
++	reg_val &= ~mask;
++	reg_val |= (value&mask);
++
++	writel(reg_val, sr->sen[srid].base + offset);
++}
++
++static inline u32 sr_read_reg(struct am33xx_sr *sr, int offset, u32 srid)
++{
++	return readl(sr->sen[srid].base + offset);
++}
++
++static void cal_reciprocal(u32 sensor, u32 *sengain, u32 *rnsen) {
++         u32 gn, rn, mul;
++
++         for (gn = 0; gn < GAIN_MAXLIMIT; gn++) {
++                 mul = 1 << (gn + 8);
++                 rn = mul / sensor;
++                 if (rn < R_MAXLIMIT) {
++                         *sengain = gn;
++                         *rnsen = rn;
++                 }
++         }
++}
++
++static u32 cal_test_nvalue(u32 sennval, u32 senpval) {
++         u32 senpgain=0, senngain=0;
++         u32 rnsenp=0, rnsenn=0;
++
++         /* Calculating the gain and reciprocal of the SenN and SenP values */
++         cal_reciprocal(senpval, &senpgain, &rnsenp);
++         cal_reciprocal(sennval, &senngain, &rnsenn);
++
++         return (senpgain << NVALUERECIPROCAL_SENPGAIN_SHIFT) |
++                 (senngain << NVALUERECIPROCAL_SENNGAIN_SHIFT) |
++                 (rnsenp << NVALUERECIPROCAL_RNSENP_SHIFT) |
++                 (rnsenn << NVALUERECIPROCAL_RNSENN_SHIFT);
++}
++
++static unsigned int sr_adjust_efuse_nvalue(unsigned int opp_no,
++                                                 unsigned int orig_opp_nvalue,
++                                                 unsigned int mv_delta) {
++         unsigned int new_opp_nvalue;
++         unsigned int senp_gain, senn_gain, rnsenp, rnsenn, pnt_delta, nnt_delta;
++         unsigned int new_senn, new_senp, senn, senp;
++
++         /* calculate SenN and SenP from the efuse value */
++         senp_gain = ((orig_opp_nvalue >> 20) & 0xf);
++         senn_gain = ((orig_opp_nvalue >> 16) & 0xf);
++         rnsenp = ((orig_opp_nvalue >> 8) & 0xff);
++         rnsenn = (orig_opp_nvalue & 0xff);
++
++         senp = ((1<<(senp_gain+8))/(rnsenp));
++         senn = ((1<<(senn_gain+8))/(rnsenn));
++
++         /* calculate the voltage delta */
++         pnt_delta = (26 * mv_delta)/10;
++         nnt_delta = (3 * mv_delta);
++
++         /* now lets add the voltage delta to the sensor values */
++         new_senn = senn + nnt_delta;
++         new_senp = senp + pnt_delta;
++
++         new_opp_nvalue = cal_test_nvalue(new_senn, new_senp);
++
++         printk("Compensating OPP%d for %dmV Orig nvalue:0x%x New nvalue:0x%x \n",
++                         opp_no, mv_delta, orig_opp_nvalue, new_opp_nvalue);
++
++         return new_opp_nvalue;
++}
++
++/* irq_sr_reenable - Re-enable SR interrupts (triggered by delayed work queue)
++ * @work:	pointer to work_struct embedded in am33xx_sr_sensor struct
++ *
++ * While servicing the IRQ, this function is added to the delayed work queue.
++ * This gives time for the voltage change to settle before we re-enable
++ * the interrupt.
++ */
++static void irq_sr_reenable(struct work_struct *work)
++{
++        u32 srid;
++	struct am33xx_sr_sensor *sens;
++        struct am33xx_sr *sr;
++
++        sens = container_of((void *)work, struct am33xx_sr_sensor,
++                work_reenable);
++
++        srid = sens->sr_id;
++
++        sr = container_of((void *)sens, struct am33xx_sr, sen[srid]);
++
++        dev_dbg(&sr->pdev->dev, "%s: SR %d\n", __func__, srid);
++
++        /* Must clear IRQ status */
++        sens->irq_status = 0;
++
++        /* Re-enable the interrupt */
++	sr_modify_reg(sr, IRQENABLE_SET, IRQENABLE_MCUBOUNDSINT,
++		IRQENABLE_MCUBOUNDSINT, srid);
++
++	/* Restart the module after voltage set */
++	sr_modify_reg(sr, SRCONFIG, SRCONFIG_SRENABLE,
++		SRCONFIG_SRENABLE, srid);
++}
++
++/* get_errvolt - get error voltage from SR error register
++ * @sr:		contains SR driver data
++ * @srid:	contains the srid, indicates which SR moduel lswe are using
++ *
++ * Read the error from SENSOR error register and then convert
++ * to voltage delta, return value is the voltage delta in micro
++ * volt.
++ */
++static int get_errvolt(struct am33xx_sr *sr, s32 srid)
++{
++        struct am33xx_sr_sensor *sens;
++	int senerror_reg;
++	s32 uvoltage;
++	s8 terror;
++
++        sens = &sr->sen[srid];
++
++	senerror_reg = sr_read_reg(sr, SENERROR_V2, srid);
++	senerror_reg = (senerror_reg & 0x0000FF00);
++	terror = (s8)(senerror_reg >> 8);
++
++        /* math defined in SR functional spec */
++	uvoltage = ((terror) * sr->uvoltage_step_size) >> 7;
++	uvoltage = uvoltage * sens->opp_data[sens->curr_opp].e2v_gain;
++
++	return uvoltage;
++}
++
++/* set_voltage - Schedule task for setting the voltage
++ * @work:	pointer to the work structure
++ *
++ * Voltage is set based on previous voltage and calculated
++ * voltage error.
++ *
++ * Generic voltage regulator set voltage is used for changing
++ * the voltage to new value.  Could potentially use voltdm_scale
++ * but at time of testing voltdm was not populated with volt_data.
++ *
++ * Disabling the module before changing the voltage, this is
++ * needed for not generating interrupt during voltage change,
++ * enabling after voltage change. This will also take care of
++ * resetting the SR registers.
++ */
++static void set_voltage(struct work_struct *work)
++{
++	struct am33xx_sr *sr;
++	int prev_volt, new_volt, i, ret;
++	s32 delta_v;
++
++	sr = container_of((void *)work, struct am33xx_sr, work);
++
++        for (i = 0; i < sr->no_of_sens; i++) {
++                if (sr->sen[i].irq_status != 1)
++                        continue;
++
++                /* Get the current voltage from PMIC */
++                prev_volt = regulator_get_voltage(sr->sen[i].reg);
++
++                if (prev_volt < 0) {
++                        dev_err(&sr->pdev->dev,
++                                "%s: SR %d: regulator_get_voltage error %d\n",
++                                __func__, i, prev_volt);
++
++                        goto reenable;
++                }
++
++        	delta_v = get_errvolt(sr, i);
++                new_volt = prev_volt + delta_v;
++
++                /* this is the primary output for debugging SR activity */
++                dev_dbg(&sr->pdev->dev,
++                        "%s: SR %d: prev volt=%d, delta_v=%d, req_volt=%d\n",
++                         __func__, i, prev_volt, delta_v, new_volt);
++
++	        /* Clear the counter, SR module disable */
++	        sr_modify_reg(sr, SRCONFIG, SRCONFIG_SRENABLE,
++			~SRCONFIG_SRENABLE, i);
++
++                if (delta_v != 0) {
++	                ret = regulator_set_voltage(sr->sen[i].reg, new_volt,
++                                new_volt + sr->uvoltage_step_size);
++
++                        if (ret < 0)
++                                dev_err(&sr->pdev->dev,
++                                "%s: regulator_set_voltage failed! (err %d)\n",
++                                __func__, ret);
++                }
++reenable:
++                /* allow time for voltage to settle before re-enabling SR
++                   module and interrupt */
++                schedule_delayed_work(&sr->sen[i].work_reenable,
++                        msecs_to_jiffies(sr->irq_delay));
++        }
++}
++
++/* sr_class2_irq - sr irq handling
++ * @irq:	Number of the irq serviced
++ * @data:	data contains the SR driver structure
++ *
++ * Smartreflex IRQ handling for class2 IP, once the IRQ handler
++ * is here then disable the interrupt and re-enable after some
++ * time. This is the work around for handling both interrupts,
++ * while one got satisfied with the voltage change but not the
++ * other. The same logic helps the case where PMIC cannot set
++ * the exact voltage requested by SR IP
++ *
++ * Schedule work only if both interrupts are serviced
++ *
++ * Note that same irq handler is used for both the interrupts,
++ * needed for decision making for voltage change
++ */
++static irqreturn_t sr_class2_irq(int irq, void *data)
++{
++	u32 srid;
++        struct am33xx_sr *sr;
++        struct am33xx_sr_sensor *sr_sensor = (struct am33xx_sr_sensor *)data;
++
++        srid = sr_sensor->sr_id;
++
++        sr = container_of(data, struct am33xx_sr, sen[srid]);
++
++	sr->sen[srid].irq_status = 1;
++
++	/* Clear MCUBounds Interrupt */
++	sr_modify_reg(sr, IRQSTATUS, IRQSTATUS_MCBOUNDSINT,
++			IRQSTATUS_MCBOUNDSINT, srid);
++
++	/* Disable the interrupt and re-enable in set_voltage() */
++	sr_modify_reg(sr, IRQENABLE_CLR, IRQENABLE_MCUBOUNDSINT,
++			IRQENABLE_MCUBOUNDSINT, srid);
++
++        /* Causes set_voltage() to get called at a later time.  Set_voltage()
++           will check the irq_status flags to determine which SR needs to
++           be serviced.  This was previously done with schedule_work, but
++           I observed a crash in set_voltage() when changing OPPs on weak
++           silicon, which may have been related to insufficient voltage
++           settling time for OPP change.  This additional delay avoids the
++           crash. */
++        schedule_delayed_work(&sr->work,
++                        msecs_to_jiffies(250));
++
++	return IRQ_HANDLED;
++}
++
++static int sr_clk_enable(struct am33xx_sr *sr, u32 srid)
++{
++	if (clk_enable(sr->sen[srid].fck) != 0) {
++		dev_err(&sr->pdev->dev, "%s: Could not enable sr_fck\n",
++					__func__);
++		return -EINVAL;
++	}
++
++	return 0;
++}
++
++static int sr_clk_disable(struct am33xx_sr *sr, u32 srid)
++{
++	clk_disable(sr->sen[srid].fck);
++
++	return 0;
++}
++
++static inline int sr_set_nvalues(struct am33xx_sr *sr, u32 srid)
++{
++        int i;
++        struct am33xx_sr_sensor *sens = &sr->sen[srid];
++
++        for (i = 0; i < sens->no_of_opps; i++) {
++        	/* Read nTarget value form EFUSE register*/
++	        sens->opp_data[i].nvalue = readl(AM33XX_CTRL_REGADDR
++			(sens->opp_data[i].efuse_offs)) & 0xFFFFFF;
++
++                /* validate nTarget value */
++                if (sens->opp_data[i].nvalue == 0)
++                        return -EINVAL;
++
++                /* adjust nTarget based on margin in mv */
++                sens->opp_data[i].adj_nvalue = sr_adjust_efuse_nvalue(i,
++                        sens->opp_data[i].nvalue,
++                        sens->opp_data[i].margin);
++
++                dev_dbg(&sr->pdev->dev,
++                        "NValueReciprocal value (from efuse) = %08x\n",
++                        sens->opp_data[i].nvalue);
++
++                dev_dbg(&sr->pdev->dev,
++                        "Adjusted NValueReciprocal value = %08x\n",
++                        sens->opp_data[i].adj_nvalue);
++        }
++	return 0;
++}
++
++/* sr_configure - Configure SR module to work in Error generator mode
++ * @sr:		contains SR driver data
++ * @srid:	contains the srid, specify whether it is CORE or MPU
++ *
++ * Configure the corresponding values to SR module registers for
++ * operating SR module in Error Generator mode.
++ */
++static void sr_configure(struct am33xx_sr *sr, u32 srid)
++{
++        struct am33xx_sr_sensor *sens = &sr->sen[srid];
++
++	/* Configuring the SR module with clock length, enabling the
++	 * error generator, enable SR module, enable individual N and P
++	 * sensors
++	 */
++	sr_write_reg(sr, SRCONFIG, (SRCLKLENGTH_125MHZ_SYSCLK |
++		SRCONFIG_SENENABLE | SRCONFIG_ERRGEN_EN |
++		(sens->senn_en << SRCONFIG_SENNENABLE_V2_SHIFT) |
++		(sens->senp_en << SRCONFIG_SENPENABLE_V2_SHIFT)),
++		srid);
++
++	/* Configuring the Error Generator */
++	sr_modify_reg(sr, ERRCONFIG_V2, (SR_ERRWEIGHT_MASK |
++		SR_ERRMAXLIMIT_MASK | SR_ERRMINLIMIT_MASK),
++		((sens->opp_data[sens->curr_opp].err_weight <<
++                        ERRCONFIG_ERRWEIGHT_SHIFT) |
++		(sens->opp_data[sens->curr_opp].err_maxlimit <<
++                        ERRCONFIG_ERRMAXLIMIT_SHIFT) |
++		(sens->opp_data[sens->curr_opp].err_minlimit <<
++                        ERRCONFIG_ERRMINLIMIT_SHIFT)),
++		srid);
++}
++
++/* sr_enable - Enable SR module
++ * @sr:		contains SR driver data
++ * @srid:	contains the srid, specify whether it is CORE or MPU
++ *
++ * Enable SR module by writing nTarget values to corresponding SR
++ * NVALUERECIPROCAL register, enable the interrupt and enable SR
++ */
++static void sr_enable(struct am33xx_sr *sr, u32 srid)
++{
++        struct am33xx_sr_sensor *sens;
++
++        sens = &sr->sen[srid];
++
++	/* Check if SR is already enabled. If yes do nothing */
++	if (sr_read_reg(sr, SRCONFIG, srid) & SRCONFIG_SRENABLE)
++		return;
++
++	if (sens->opp_data[sens->curr_opp].nvalue == 0)
++		dev_err(&sr->pdev->dev,
++                        "%s: OPP doesn't support SmartReflex\n", __func__);
++
++	/* Writing the nReciprocal value to the register */
++	sr_write_reg(sr, NVALUERECIPROCAL,
++                sens->opp_data[sens->curr_opp].adj_nvalue, srid);
++
++	/* Enable the interrupt */
++	sr_modify_reg(sr, IRQENABLE_SET, IRQENABLE_MCUBOUNDSINT,
++				IRQENABLE_MCUBOUNDSINT, srid);
++
++	/* SRCONFIG - enable SR */
++	sr_modify_reg(sr, SRCONFIG, SRCONFIG_SRENABLE,
++				SRCONFIG_SRENABLE, srid);
++}
++
++/* sr_disable - Disable SR module
++ * @sr:		contains SR driver data
++ * @srid:	contains the srid, specify whether it is CORE or MPU
++ *
++ * Disable SR module by disabling the interrupt and Smartreflex module
++ */
++static void sr_disable(struct am33xx_sr *sr, u32 srid)
++{
++	/* Disable the interrupt */
++	sr_modify_reg(sr, IRQENABLE_CLR, IRQENABLE_MCUBOUNDSINT,
++				IRQENABLE_MCUBOUNDSINT, srid);
++
++	/* SRCONFIG - disable SR */
++	sr_modify_reg(sr, SRCONFIG, SRCONFIG_SRENABLE,
++				~SRCONFIG_SRENABLE, srid);
++}
++
++/* sr_start_vddautocomp - Start VDD auto compensation
++ * @sr:		contains SR driver data
++ *
++ * This is the starting point for AVS enable from user space.
++ * Also used to re-enable SR after OPP change.
++ */
++static void sr_start_vddautocomp(struct am33xx_sr *sr)
++{
++	int i;
++
++	if ((sr->sen[SR_CORE].opp_data[0].nvalue == 0) ||
++                (sr->sen[SR_MPU].opp_data[0].nvalue == 0)) {
++		dev_err(&sr->pdev->dev, "SR module not enabled, nTarget"
++					" values are not found\n");
++		return;
++	}
++
++	if (sr->autocomp_active == 1) {
++		dev_warn(&sr->pdev->dev, "SR VDD autocomp already active\n");
++		return;
++	}
++
++	for (i = 0; i < sr->no_of_sens; i++) {
++               	/* Read current regulator value and voltage */
++	        sr->sen[i].init_volt_mv = regulator_get_voltage(sr->sen[i].reg);
++
++                dev_dbg(&sr->pdev->dev, "%s: regulator %d, init_volt = %d\n",
++                        __func__, i, sr->sen[i].init_volt_mv);
++
++		if (sr_clk_enable(sr, i))
++                        return;
++		sr_configure(sr, i);
++		sr_enable(sr, i);
++	}
++
++	sr->autocomp_active = 1;
++}
++
++/* sr_stop_vddautocomp - Stop VDD auto compensation
++ * @sr:		contains SR driver data
++ *
++ * This is the ending point during SR disable from user space.
++ * Also used to disable SR after OPP change.
++ */
++static void sr_stop_vddautocomp(struct am33xx_sr *sr)
++{
++	int i;
++
++	if (sr->autocomp_active == 0) {
++		dev_warn(&sr->pdev->dev, "SR VDD autocomp is not active\n");
++		return;
++	}
++
++        /* cancel bottom half interrupt handlers that haven't run yet */
++	cancel_delayed_work_sync(&sr->work);
++
++	for (i = 0; i < sr->no_of_sens; i++) {
++                /* cancel any outstanding SR IRQ re-enables on work queue */
++                cancel_delayed_work_sync(&sr->sen[i].work_reenable);
++		sr_disable(sr, i);
++		sr_clk_disable(sr, i);
++	}
++
++	sr->autocomp_active = 0;
++}
++
++/* am33xx_sr_autocomp_show - Store user input value and stop SR
++ * @data:		contains SR driver data
++ * @val:		pointer to store autocomp_active status
++ *
++ * This is the Debug Fs enteries to show whether SR is enabled
++ * or disabled
++ */
++static int am33xx_sr_autocomp_show(void *data, u64 *val)
++{
++	struct am33xx_sr *sr_info = (struct am33xx_sr *) data;
++
++	*val = (u64) sr_info->autocomp_active;
++
++	return 0;
++}
++
++static int am33xx_sr_margin_show(void *data, u64 *val)
++{
++        struct am33xx_sr_opp_data *sr_opp_data = (struct am33xx_sr_opp_data *)data;
++
++	*val = (u64) sr_opp_data->margin;
++
++	return 0;
++}
++
++static int am33xx_sr_margin_update(void *data, u64 val)
++{
++        struct am33xx_sr_opp_data *sr_opp_data =
++                (struct am33xx_sr_opp_data *)data;
++        struct am33xx_sr_sensor *sr_sensor;
++        struct am33xx_sr *sr_info;
++
++        /* work back to the sr_info pointer */
++        sr_sensor = container_of((void *)sr_opp_data, struct am33xx_sr_sensor,
++                opp_data[sr_opp_data->opp_id]);
++
++        sr_info = container_of((void *)sr_sensor, struct am33xx_sr,
++                sen[sr_sensor->sr_id]);
++
++        /* store the value of margin */
++        sr_opp_data->margin = (s32)val;
++
++        dev_warn(&sr_info->pdev->dev, "%s: new margin=%d, srid=%d, opp=%d\n",
++                __func__, sr_opp_data->margin, sr_sensor->sr_id,
++                sr_opp_data->opp_id);
++
++        /* updata ntarget values based upon new margin */
++        if (sr_set_nvalues(sr_info, sr_sensor->sr_id) == -EINVAL)
++                dev_err(&sr_info->pdev->dev,
++                        "%s: Zero NValue read from EFUSE\n", __func__);
++
++        /* restart SmartReflex to adapt to new values */
++        sr_stop_vddautocomp(sr_info);
++        sr_start_vddautocomp(sr_info);
++
++        return 0;
++}
++
++/* am33xx_sr_autocomp_store - Store user input and start SR
++ * @data:		contains SR driver data
++ * @val:		contains the value pased by user
++ *
++ * This is the Debug Fs enteries to store user input and
++ * enable smartreflex.
++ */
++static int am33xx_sr_autocomp_store(void *data, u64 val)
++{
++	struct am33xx_sr *sr_info = (struct am33xx_sr *) data;
++
++	/* Sanity check */
++	if (val && (val != 1)) {
++		dev_warn(&sr_info->pdev->dev, "%s: Invalid argument %llu\n",
++		        __func__, val);
++		return -EINVAL;
++	}
++
++	if (!val) {
++                sr_info->disabled_by_user = 1;
++		sr_stop_vddautocomp(sr_info);
++        }
++	else {
++                sr_info->disabled_by_user = 0;
++		sr_start_vddautocomp(sr_info);
++        }
++
++	return 0;
++}
++
++DEFINE_SIMPLE_ATTRIBUTE(sr_fops, am33xx_sr_autocomp_show,
++		am33xx_sr_autocomp_store, "%llu\n");
++
++/* sr_curr_volt_show - Show current voltage value
++ * @data:		contains SR driver data
++ * @val:		pointer to store current voltage value
++ *
++ * Read the current voltage value and display the same on console
++ * This is used in debugfs entries
++ */
++static int am33xx_sr_curr_volt_show(void *data, u64 *val)
++{
++	struct am33xx_sr_sensor *sr_sensor = (struct am33xx_sr_sensor *) data;
++
++	*val = (u64) regulator_get_voltage(sr_sensor->reg);
++
++	return 0;
++}
++
++DEFINE_SIMPLE_ATTRIBUTE(curr_volt_fops, am33xx_sr_curr_volt_show,
++		NULL, "%llu\n");
++
++DEFINE_SIMPLE_ATTRIBUTE(margin_fops, am33xx_sr_margin_show,
++		am33xx_sr_margin_update, "%llu\n");
++
++#ifdef CONFIG_DEBUG_FS
++/* sr_debugfs_entries - Create debugfs entries
++ * @sr_info:		contains SR driver data
++ *
++ * Create debugfs entries, which is exposed to user for knowing
++ * the current status. Some of the parameters can change during
++ * run time
++ */
++static int sr_debugfs_entries(struct am33xx_sr *sr_info)
++{
++        struct am33xx_sr_sensor *sens;
++	struct dentry *dbg_dir, *sen_dir, *opp_dir;
++	int i, j;
++
++	dbg_dir = debugfs_create_dir("smartreflex", NULL);
++	if (IS_ERR(dbg_dir)) {
++		dev_err(&sr_info->pdev->dev, "%s: Unable to create debugfs"
++				" directory\n", __func__);
++		return PTR_ERR(dbg_dir);
++	}
++
++	(void) debugfs_create_file("autocomp", S_IRUGO | S_IWUGO, dbg_dir,
++				(void *)sr_info, &sr_fops);
++        (void) debugfs_create_u32("interrupt_delay", S_IRUGO | S_IWUGO,
++				dbg_dir, &sr_info->irq_delay);
++
++	for (i = 0; i < sr_info->no_of_sens; i++) {
++                sens = &sr_info->sen[i];
++		sen_dir = debugfs_create_dir(sens->name, dbg_dir);
++		if (IS_ERR(sen_dir)) {
++			dev_err(&sr_info->pdev->dev, "%s: Unable to create"
++				" debugfs directory\n", __func__);
++			return PTR_ERR(sen_dir);
++		}
++
++                (void)debugfs_create_u32("initial_voltage", S_IRUGO, sen_dir,
++				&sens->init_volt_mv);
++	        (void)debugfs_create_file("current_voltage", S_IRUGO, sen_dir,
++				(void *)sens, &curr_volt_fops);
++
++                for (j = 0; j < sr_info->sen[i].no_of_opps; j++) {
++                        char tmp[20];
++
++                        sprintf(&tmp[0], "opp%d", j);
++                        opp_dir = debugfs_create_dir(tmp, sen_dir);
++                        if (IS_ERR(opp_dir)) {
++        			dev_err(&sr_info->pdev->dev,
++                                        "%s: Unable to create debugfs directory\n",
++                                        __func__);
++        			return PTR_ERR(opp_dir);
++        		}
++
++                        (void)debugfs_create_file("margin", S_IRUGO | S_IWUGO,
++	        	       opp_dir, (void *)&sens->opp_data[j],
++                               &margin_fops);
++                        (void)debugfs_create_x32("err2voltgain",
++                               S_IRUGO | S_IWUGO,
++        		       opp_dir,
++                               &sens->opp_data[j].e2v_gain);
++        		(void)debugfs_create_x32("nvalue", S_IRUGO,
++        		       opp_dir,
++                               &sens->opp_data[j].nvalue);
++                        (void)debugfs_create_x32("adj_nvalue", S_IRUGO,
++        		       opp_dir,
++                               &sens->opp_data[j].adj_nvalue);
++                }
++	}
++	return 0;
++}
++#else
++static int sr_debugfs_entries(struct am33xx_sr *sr_info)
++{
++	return 0;
++}
++#endif
++
++#ifdef CONFIG_CPU_FREQ
++
++/* Find and return current OPP.  This should change to use system APIs,
++   but voltdm is not currently populated, and opp APIs are also not working. */
++static int get_current_opp(struct am33xx_sr *sr, u32 srid, u32 freq)  {
++        int i;
++
++        for (i = 0; i < sr->sen[srid].no_of_opps; i++) {
++                if (sr->sen[srid].opp_data[i].frequency == freq)
++                        return i;
++        }
++
++        return -EINVAL;
++}
++
++static int am33xx_sr_cpufreq_transition(struct notifier_block *nb,
++					  unsigned long val, void *data)
++{
++        struct am33xx_sr *sr;
++        struct cpufreq_freqs *cpu;
++
++	sr = container_of(nb, struct am33xx_sr, freq_transition);
++
++        /* We are required to disable SR while OPP change is occurring */
++	if (val == CPUFREQ_PRECHANGE) {
++                dev_dbg(&sr->pdev->dev, "%s: prechange\n", __func__);
++                sr_stop_vddautocomp(sr);
++	} else if (val == CPUFREQ_POSTCHANGE) {
++                cpu = (struct cpufreq_freqs *)data;
++                dev_dbg(&sr->pdev->dev,
++                        "%s: postchange, cpu=%d, old=%d, new=%d\n",
++                        __func__, cpu->cpu, cpu->old, cpu->new);
++
++                /* update current OPP */
++                sr->sen[SR_MPU].curr_opp = get_current_opp(sr, SR_MPU,
++                        cpu->new*1000);
++                if (sr->sen[SR_MPU].curr_opp == -EINVAL) {
++                        dev_err(&sr->pdev->dev, "%s: cannot determine opp\n",
++                                __func__);
++                        return -EINVAL;
++                }
++
++                dev_dbg(&sr->pdev->dev, "%s: postchange, new opp=%d\n",
++                        __func__, sr->sen[SR_MPU].curr_opp);
++
++                /* this handles the case when the user has disabled SR via
++                   debugfs, therefore we do not want to enable SR */
++                if (sr->disabled_by_user == 0)
++                        sr_start_vddautocomp(sr);
++	}
++
++	return 0;
++}
++
++static inline int am33xx_sr_cpufreq_register(struct am33xx_sr *sr)
++{
++        sr->freq_transition.notifier_call = am33xx_sr_cpufreq_transition;
++
++	return cpufreq_register_notifier(&sr->freq_transition,
++					 CPUFREQ_TRANSITION_NOTIFIER);
++}
++
++static inline void am33xx_sr_cpufreq_deregister(struct am33xx_sr *sr)
++{
++	cpufreq_unregister_notifier(&sr->freq_transition,
++				    CPUFREQ_TRANSITION_NOTIFIER);
++}
++
++#endif
++
++static int __init am33xx_sr_probe(struct platform_device *pdev)
++{
++	struct am33xx_sr *sr_info;
++	struct am33xx_sr_platform_data *pdata;
++	struct resource *res[MAX_SENSORS];
++	int irq;
++	int ret;
++	int i,j;
++
++	sr_info = kzalloc(sizeof(struct am33xx_sr), GFP_KERNEL);
++	if (!sr_info) {
++		dev_err(&pdev->dev, "%s: unable to allocate sr_info\n",
++					__func__);
++		return -ENOMEM;
++	}
++
++	pdata = pdev->dev.platform_data;
++	if (!pdata) {
++		dev_err(&pdev->dev, "%s: platform data missing\n", __func__);
++		ret = -EINVAL;
++		goto err_free_sr_info;
++	}
++
++	sr_info->pdev = pdev;
++	sr_info->sen[SR_CORE].name = "smartreflex0";
++	sr_info->sen[SR_MPU].name = "smartreflex1";
++	sr_info->ip_type = pdata->ip_type;
++        sr_info->irq_delay = pdata->irq_delay;
++        sr_info->no_of_sens = pdata->no_of_sens;
++        sr_info->no_of_vds = pdata->no_of_vds;
++	sr_info->uvoltage_step_size = pdata->vstep_size_uv;
++	sr_info->autocomp_active = false;
++        sr_info->disabled_by_user = false;
++
++	for (i = 0; i < sr_info->no_of_sens; i++) {
++                u32 curr_freq=0;
++
++                sr_info->sen[i].reg_name = pdata->vd_name[i];
++
++                /* this should be determined from voltdm or opp layer, but
++                   those approaches are not working */
++                sr_info->sen[i].no_of_opps = pdata->sr_sdata[i].no_of_opps;
++                sr_info->sen[i].sr_id = i;
++
++                /* Reading per OPP Values */
++                for (j = 0; j < sr_info->sen[i].no_of_opps; j++) {
++        		sr_info->sen[i].opp_data[j].efuse_offs =
++                                pdata->sr_sdata[i].sr_opp_data[j].efuse_offs;
++                        sr_info->sen[i].opp_data[j].e2v_gain =
++                                pdata->sr_sdata[i].sr_opp_data[j].e2v_gain;
++        		sr_info->sen[i].opp_data[j].err_weight =
++                                pdata->sr_sdata[i].sr_opp_data[j].err_weight;
++        		sr_info->sen[i].opp_data[j].err_minlimit =
++                                pdata->sr_sdata[i].sr_opp_data[j].err_minlimit;
++        		sr_info->sen[i].opp_data[j].err_maxlimit =
++                                pdata->sr_sdata[i].sr_opp_data[j].err_maxlimit;
++                        sr_info->sen[i].opp_data[j].margin =
++                                pdata->sr_sdata[i].sr_opp_data[j].margin;
++                        sr_info->sen[i].opp_data[j].nominal_volt =
++                                pdata->sr_sdata[i].sr_opp_data[j].nominal_volt;
++                        sr_info->sen[i].opp_data[j].frequency =
++                                pdata->sr_sdata[i].sr_opp_data[j].frequency;
++                        sr_info->sen[i].opp_data[j].opp_id = j;
++                }
++
++                if (i == SR_MPU) {
++                        /* hardcoded CPU NR */
++                        curr_freq = cpufreq_get(0);
++
++                        /* update current OPP */
++                        sr_info->sen[i].curr_opp = get_current_opp(sr_info, i,
++                                        curr_freq*1000);
++                        if (sr_info->sen[i].curr_opp == -EINVAL) {
++                                dev_err(&sr_info->pdev->dev,
++                                        "%s: cannot determine opp\n",__func__);
++                                ret = -EINVAL;
++                                goto err_free_sr_info;
++                        }
++                } else {
++                        sr_info->sen[i].curr_opp =
++                                pdata->sr_sdata[i].default_opp;
++                }
++
++                dev_dbg(&pdev->dev,
++                        "%s: SR%d, curr_opp=%d, no_of_opps=%d, step_size=%d\n",
++                        __func__, i, sr_info->sen[i].curr_opp,
++                        sr_info->sen[i].no_of_opps,
++                        sr_info->uvoltage_step_size);
++
++                ret = sr_set_nvalues(sr_info, i);
++                if (ret == -EINVAL) {
++                        dev_err(&sr_info->pdev->dev,
++                                "%s: Zero NValue read from EFUSE\n", __func__);
++                        goto err_free_sr_info;
++                }
++
++                INIT_DELAYED_WORK(&sr_info->sen[i].work_reenable,
++                        irq_sr_reenable);
++
++		sr_info->res_name[i] = kzalloc(CLK_NAME_LEN + 1, GFP_KERNEL);
++
++		/* resources */
++		res[i] = platform_get_resource_byname(pdev, IORESOURCE_MEM,
++					sr_info->sen[i].name);
++		if (!res[i]) {
++			dev_err(&pdev->dev, "%s: no mem resource\n", __func__);
++			ret = -ENOENT;
++			goto err_free_mem;
++		}
++
++		irq = platform_get_irq_byname(pdev, sr_info->sen[i].name);
++		if (irq < 0) {
++			dev_err(&pdev->dev, "Can't get interrupt resource\n");
++			ret = irq;
++			goto err_free_mem;
++		}
++		sr_info->sen[i].irq = irq;
++
++		res[i] = request_mem_region(res[i]->start,
++				resource_size(res[i]), pdev->name);
++		if (!res[i]) {
++			dev_err(&pdev->dev, "can't request mem region\n");
++			ret = -EBUSY;
++			goto err_free_mem;
++		}
++
++		sr_info->sen[i].base = ioremap(res[i]->start,
++				resource_size(res[i]));
++		if (!sr_info->sen[i].base) {
++			dev_err(&pdev->dev, "%s: ioremap fail\n", __func__);
++			ret = -ENOMEM;
++			goto err_release_mem;
++		}
++
++		strcat(sr_info->res_name[i], sr_info->sen[i].name);
++		strcat(sr_info->res_name[i], "_fck");
++
++		sr_info->sen[i].fck = clk_get(NULL, sr_info->res_name[i]);
++		if (IS_ERR(sr_info->sen[i].fck)) {
++			dev_err(&pdev->dev, "%s: Could not get sr fck\n",
++						__func__);
++			ret = PTR_ERR(sr_info->sen[i].fck);
++			goto err_unmap;
++		}
++
++		ret = request_irq(sr_info->sen[i].irq, sr_class2_irq,
++			IRQF_DISABLED, sr_info->sen[i].name,
++                        (void *)&sr_info->sen[i]);
++		if (ret) {
++			dev_err(&pdev->dev, "%s: Could not install SR ISR\n",
++						__func__);
++			goto err_put_clock;
++		}
++
++		sr_info->sen[i].senn_en = pdata->sr_sdata[i].senn_mod;
++		sr_info->sen[i].senp_en = pdata->sr_sdata[i].senp_mod;
++
++                sr_info->sen[i].reg =
++                        regulator_get(NULL, sr_info->sen[i].reg_name);
++               	if (IS_ERR(sr_info->sen[i].reg)) {
++                        ret = -EINVAL;
++	                goto err_free_irq;
++                }
++
++               	/* Read current regulator value and voltage */
++	        sr_info->sen[i].init_volt_mv =
++                        regulator_get_voltage(sr_info->sen[i].reg);
++
++                dev_dbg(&pdev->dev, "%s: regulator %d, init_volt = %d\n",
++                        __func__, i, sr_info->sen[i].init_volt_mv);
++	} /* for() */
++
++        /* set_voltage() will be used as the bottom half IRQ handler */
++	INIT_DELAYED_WORK(&sr_info->work, set_voltage);
++
++#ifdef CONFIG_CPU_FREQ
++	ret = am33xx_sr_cpufreq_register(sr_info);
++	if (ret) {
++		dev_err(&pdev->dev, "failed to register cpufreq\n");
++		goto err_reg_put;
++	}
++#endif
++
++	/* debugfs entries */
++	ret = sr_debugfs_entries(sr_info);
++	if (ret)
++		dev_warn(&pdev->dev, "%s: Debugfs entries are not created\n",
++						__func__);
++
++	platform_set_drvdata(pdev, sr_info);
++
++	dev_info(&pdev->dev, "%s: Driver initialized\n", __func__);
++
++        /* disabled_by_user used to ensure SR doesn't come on via CPUFREQ
++           scaling if user has disabled SR via debugfs on enable_on_init */
++	if (pdata->enable_on_init)
++		sr_start_vddautocomp(sr_info);
++        else
++                sr_info->disabled_by_user = 1;
++
++	return ret;
++
++#ifdef CONFIG_CPU_FREQ
++	am33xx_sr_cpufreq_deregister(sr_info);
++#endif
++
++err_reg_put:
++        i--; /* back up i by one to walk back through the for loop */
++        regulator_put(sr_info->sen[i].reg);
++err_free_irq:
++	free_irq(sr_info->sen[i].irq, (void *)sr_info);
++err_put_clock:
++	clk_put(sr_info->sen[i].fck);
++err_unmap:
++	iounmap(sr_info->sen[i].base);
++err_release_mem:
++	release_mem_region(res[i]->start, resource_size(res[i]));
++err_free_mem:
++        kfree(sr_info->res_name[i]);
++        /* unwind back through the for loop */
++        if (i != 0) {
++                goto err_reg_put;
++        }
++
++err_free_sr_info:
++	kfree(sr_info);
++	return ret;
++}
++
++static int __devexit am33xx_sr_remove(struct platform_device *pdev)
++{
++	struct am33xx_sr *sr_info;
++	struct resource *res[MAX_SENSORS];
++	int irq;
++	int i;
++
++	sr_info = dev_get_drvdata(&pdev->dev);
++	if (!sr_info) {
++		dev_err(&pdev->dev, "%s: sr_info missing\n", __func__);
++		return -EINVAL;
++	}
++
++	if (sr_info->autocomp_active)
++		sr_stop_vddautocomp(sr_info);
++
++#ifdef CONFIG_CPU_FREQ
++	am33xx_sr_cpufreq_deregister(sr_info);
++#endif
++
++	for (i = 0; i < sr_info->no_of_sens; i++) {
++                regulator_put(sr_info->sen[i].reg);
++                irq = platform_get_irq_byname(pdev, sr_info->sen[i].name);
++		free_irq(irq, (void *)sr_info);
++		clk_put(sr_info->sen[i].fck);
++		iounmap(sr_info->sen[i].base);
++		res[i] = platform_get_resource_byname(pdev,
++				IORESOURCE_MEM, sr_info->sen[i].name);
++		release_mem_region(res[i]->start, resource_size(res[i]));
++                kfree(sr_info->res_name[i]);
++	}
++
++	kfree(sr_info);
++
++        dev_info(&pdev->dev, "%s: SR has been removed\n", __func__);
++	return 0;
++}
++
++static struct platform_driver smartreflex_driver = {
++	.driver		= {
++		.name	= "smartreflex",
++		.owner	= THIS_MODULE,
++	},
++	.remove		= am33xx_sr_remove,
++};
++
++static int __init sr_init(void)
++{
++	int ret;
++
++	ret = platform_driver_probe(&smartreflex_driver, am33xx_sr_probe);
++	if (ret) {
++		pr_err("%s: platform driver register failed\n", __func__);
++		return ret;
++	}
++
++	return 0;
++}
++
++static void __exit sr_exit(void)
++{
++	platform_driver_unregister(&smartreflex_driver);
++}
++late_initcall(sr_init);
++module_exit(sr_exit);
++
++MODULE_DESCRIPTION("AM33XX Smartreflex Class2 Driver");
++MODULE_LICENSE("GPL");
++MODULE_ALIAS("platform:" DRIVER_NAME);
++MODULE_AUTHOR("Texas Instruments Inc");
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index 0bcadd7..6e1c026 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -1410,6 +1410,7 @@ static struct regulator_init_data tps65217_regulator_data[] = {
+		.num_consumer_supplies = ARRAY_SIZE(tps65217_dcdc2_consumers),
+		.consumer_supplies = tps65217_dcdc2_consumers,
+		.driver_data = &dcdc2_ramp_delay,
++		.ignore_check_consumers = 1,
+	},
+
+	/* dcdc3 */
+@@ -1424,6 +1425,7 @@ static struct regulator_init_data tps65217_regulator_data[] = {
+		},
+		.num_consumer_supplies = ARRAY_SIZE(tps65217_dcdc3_consumers),
+		.consumer_supplies = tps65217_dcdc3_consumers,
++		.ignore_check_consumers = 1,
+	},
+
+	/* ldo1 */
+@@ -2214,6 +2216,9 @@ static void am335x_evm_setup(struct memory_accessor *mem_acc, void *context)
+			goto out;
+	}
+
++	/* SmartReflex also requires board information. */
++	am33xx_sr_init();
++
+	return;
+
+ out:
+@@ -2265,6 +2270,7 @@ static struct regulator_init_data am335x_vdd1 = {
+	},
+	.num_consumer_supplies	= ARRAY_SIZE(am335x_vdd1_supply),
+	.consumer_supplies	= am335x_vdd1_supply,
++	.ignore_check_consumers = 1,
+ };
+
+ static struct regulator_consumer_supply am335x_vdd2_supply[] = {
+@@ -2281,6 +2287,7 @@ static struct regulator_init_data am335x_vdd2 = {
+	},
+	.num_consumer_supplies	= ARRAY_SIZE(am335x_vdd2_supply),
+	.consumer_supplies	= am335x_vdd2_supply,
++	.ignore_check_consumers = 1,
+ };
+
+ static struct tps65910_board am335x_tps65910_info = {
+diff --git a/arch/arm/mach-omap2/devices.c b/arch/arm/mach-omap2/devices.c
+index 6113654..ebf0d9e 100644
+--- a/arch/arm/mach-omap2/devices.c
++++ b/arch/arm/mach-omap2/devices.c
+@@ -52,6 +52,7 @@
+ #include <plat/config_pwm.h>
+ #include <plat/cpu.h>
+ #include <plat/gpmc.h>
++#include <plat/smartreflex.h>
+ #include <plat/am33xx.h>
+
+ /* LCD controller similar DA8xx */
+@@ -60,10 +61,28 @@
+ #include "mux.h"
+ #include "control.h"
+ #include "devices.h"
++#include "omap_opp_data.h"
+
+ #define L3_MODULES_MAX_LEN 12
+ #define L3_MODULES 3
+
++static unsigned int   am33xx_evmid;
++
++/*
++ * am33xx_evmid_fillup - set up board evmid
++ * @evmid - evm id which needs to be configured
++ *
++ * This function is called to configure board evm id.
++ * IA Motor Control EVM needs special setting of MAC PHY Id.
++ * This function is called when IA Motor Control EVM is detected
++ * during boot-up.
++ */
++void am33xx_evmid_fillup(unsigned int evmid)
++{
++       am33xx_evmid = evmid;
++       return;
++}
++
+ static int __init omap3_l3_init(void)
+ {
+	int l;
+@@ -1226,6 +1245,256 @@ static struct platform_device am335x_sgx = {
+
+ #endif
+
++#ifdef CONFIG_AM33XX_SMARTREFLEX
++
++/* smartreflex platform data */
++
++/* The values below are based upon silicon characterization data.
++ * Each OPP and sensor combination potentially has different values.
++ * The values of ERR2VOLT_GAIN and ERR_MIN_LIMIT also change based on
++ * the PMIC step size.  Values have been given to cover the AM335 EVM
++ * (12.5mV step) and the Beaglebone (25mV step).  If the step
++ * size changes, you should update these values, and don't forget to
++ * change the step size in the platform data structure, am33xx_sr_pdata.
++ */
++
++#define AM33XX_SR0_OPP50_CNTRL_OFFSET          0x07B8
++#define AM33XX_SR0_OPP50_EVM_ERR2VOLT_GAIN     0xC
++#define AM33XX_SR0_OPP50_EVM_ERR_MIN_LIMIT     0xF5
++#define AM33XX_SR0_OPP50_BB_ERR2VOLT_GAIN      0x6
++#define AM33XX_SR0_OPP50_BB_ERR_MIN_LIMIT      0xEA
++#define AM33XX_SR0_OPP50_ERR_MAX_LIMIT         0x2
++#define AM33XX_SR0_OPP50_ERR_WEIGHT             0x4
++#define AM33XX_SR0_OPP50_MARGIN                 0
++
++#define AM33XX_SR0_OPP100_CNTRL_OFFSET         0x07BC
++#define AM33XX_SR0_OPP100_EVM_ERR2VOLT_GAIN     0x12
++#define AM33XX_SR0_OPP100_EVM_ERR_MIN_LIMIT    0xF8
++#define AM33XX_SR0_OPP100_BB_ERR2VOLT_GAIN      0x9
++#define AM33XX_SR0_OPP100_BB_ERR_MIN_LIMIT     0xF1
++#define AM33XX_SR0_OPP100_ERR_MAX_LIMIT                0x2
++#define AM33XX_SR0_OPP100_ERR_WEIGHT            0x4
++#define AM33XX_SR0_OPP100_MARGIN                0
++
++#define AM33XX_SR1_OPP50_CNTRL_OFFSET          0x0770
++#define AM33XX_SR1_OPP50_EVM_ERR2VOLT_GAIN     0x5
++#define AM33XX_SR1_OPP50_EVM_ERR_MIN_LIMIT     0xE6
++#define AM33XX_SR1_OPP50_BB_ERR2VOLT_GAIN      0x2
++#define AM33XX_SR1_OPP50_BB_ERR_MIN_LIMIT      0xC0
++#define AM33XX_SR1_OPP50_ERR_MAX_LIMIT         0x2
++#define AM33XX_SR1_OPP50_ERR_WEIGHT             0x4
++#define AM33XX_SR1_OPP50_MARGIN                 0
++
++#define AM33XX_SR1_OPP100_CNTRL_OFFSET         0x0774
++#define AM33XX_SR1_OPP100_EVM_ERR2VOLT_GAIN    0x8
++#define AM33XX_SR1_OPP100_EVM_ERR_MIN_LIMIT    0xF0
++#define AM33XX_SR1_OPP100_BB_ERR2VOLT_GAIN     0x4
++#define AM33XX_SR1_OPP100_BB_ERR_MIN_LIMIT     0xDF
++#define AM33XX_SR1_OPP100_ERR_MAX_LIMIT                0x2
++#define AM33XX_SR1_OPP100_ERR_WEIGHT            0x4
++#define AM33XX_SR1_OPP100_MARGIN                0
++
++#define AM33XX_SR1_OPP120_CNTRL_OFFSET         0x0778
++#define AM33XX_SR1_OPP120_EVM_ERR2VOLT_GAIN    0xB
++#define AM33XX_SR1_OPP120_EVM_ERR_MIN_LIMIT    0xF4
++#define AM33XX_SR1_OPP120_BB_ERR2VOLT_GAIN     0x5
++#define AM33XX_SR1_OPP120_BB_ERR_MIN_LIMIT     0xE6
++#define AM33XX_SR1_OPP120_ERR_MAX_LIMIT                0x2
++#define AM33XX_SR1_OPP120_ERR_WEIGHT            0x4
++#define AM33XX_SR1_OPP120_MARGIN                0
++
++#define AM33XX_SR1_OPPTURBO_CNTRL_OFFSET        0x077C
++#define AM33XX_SR1_OPPTURBO_EVM_ERR2VOLT_GAIN  0xC
++#define AM33XX_SR1_OPPTURBO_EVM_ERR_MIN_LIMIT  0xF5
++#define AM33XX_SR1_OPPTURBO_BB_ERR2VOLT_GAIN   0x6
++#define AM33XX_SR1_OPPTURBO_BB_ERR_MIN_LIMIT   0xEA
++#define AM33XX_SR1_OPPTURBO_ERR_MAX_LIMIT      0x2
++#define AM33XX_SR1_OPPTURBO_ERR_WEIGHT          0x4
++#define AM33XX_SR1_OPPTURBO_MARGIN              0
++
++/* the voltages and frequencies should probably be defined in opp3xxx_data.c.
++   Once SR is integrated to the mainline driver, and voltdm is working
++   correctly in AM335x, these can be removed.  */
++#define AM33XX_VDD_MPU_OPP50_UV                950000
++#define AM33XX_VDD_MPU_OPP100_UV       1100000
++#define AM33XX_VDD_MPU_OPP120_UV       1200000
++#define AM33XX_VDD_MPU_OPPTURBO_UV     1260000
++#define AM33XX_VDD_CORE_OPP50_UV        950000
++#define AM33XX_VDD_CORE_OPP100_UV       1100000
++
++#define AM33XX_VDD_MPU_OPP50_FREQ      275000000
++#define AM33XX_VDD_MPU_OPP100_FREQ     500000000
++#define AM33XX_VDD_MPU_OPP120_FREQ     600000000
++#define AM33XX_VDD_MPU_OPPTURBO_FREQ   720000000
++
++static struct am33xx_sr_opp_data sr1_opp_data[] = {
++        {
++                .efuse_offs    = AM33XX_SR1_OPP50_CNTRL_OFFSET,
++               .e2v_gain       = AM33XX_SR1_OPP50_EVM_ERR2VOLT_GAIN,
++               .err_minlimit   = AM33XX_SR1_OPP50_EVM_ERR_MIN_LIMIT,
++               .err_maxlimit   = AM33XX_SR1_OPP50_ERR_MAX_LIMIT,
++               .err_weight     = AM33XX_SR1_OPP50_ERR_WEIGHT,
++                .margin         = AM33XX_SR1_OPP50_MARGIN,
++                .nominal_volt   = AM33XX_VDD_MPU_OPP50_UV,
++                .frequency      = AM33XX_VDD_MPU_OPP50_FREQ,
++        },
++        {
++                .efuse_offs    = AM33XX_SR1_OPP100_CNTRL_OFFSET,
++               .e2v_gain       = AM33XX_SR1_OPP100_EVM_ERR2VOLT_GAIN,
++               .err_minlimit   = AM33XX_SR1_OPP100_EVM_ERR_MIN_LIMIT,
++               .err_maxlimit   = AM33XX_SR1_OPP100_ERR_MAX_LIMIT,
++               .err_weight     = AM33XX_SR1_OPP100_ERR_WEIGHT,
++                .margin         = AM33XX_SR1_OPP100_MARGIN,
++                .nominal_volt   = AM33XX_VDD_MPU_OPP100_UV,
++                .frequency      = AM33XX_VDD_MPU_OPP100_FREQ,
++        },
++        {
++                .efuse_offs    = AM33XX_SR1_OPP120_CNTRL_OFFSET,
++               .e2v_gain       = AM33XX_SR1_OPP120_EVM_ERR2VOLT_GAIN,
++               .err_minlimit   = AM33XX_SR1_OPP120_EVM_ERR_MIN_LIMIT,
++               .err_maxlimit   = AM33XX_SR1_OPP120_ERR_MAX_LIMIT,
++               .err_weight     = AM33XX_SR1_OPP120_ERR_WEIGHT,
++                .margin         = AM33XX_SR1_OPP120_MARGIN,
++                .nominal_volt   = AM33XX_VDD_MPU_OPP120_UV,
++                .frequency      = AM33XX_VDD_MPU_OPP120_FREQ,
++        },
++        {
++                .efuse_offs    = AM33XX_SR1_OPPTURBO_CNTRL_OFFSET,
++               .e2v_gain       = AM33XX_SR1_OPPTURBO_EVM_ERR2VOLT_GAIN,
++               .err_minlimit   = AM33XX_SR1_OPPTURBO_EVM_ERR_MIN_LIMIT,
++               .err_maxlimit   = AM33XX_SR1_OPPTURBO_ERR_MAX_LIMIT,
++               .err_weight     = AM33XX_SR1_OPPTURBO_ERR_WEIGHT,
++                .margin         = AM33XX_SR1_OPPTURBO_MARGIN,
++                .nominal_volt   = AM33XX_VDD_MPU_OPPTURBO_UV,
++                .frequency      = AM33XX_VDD_MPU_OPPTURBO_FREQ,
++        },
++};
++
++static struct am33xx_sr_opp_data sr0_opp_data[] = {
++        {
++                .efuse_offs    = AM33XX_SR0_OPP50_CNTRL_OFFSET,
++               .e2v_gain       = AM33XX_SR0_OPP50_EVM_ERR2VOLT_GAIN,
++               .err_minlimit   = AM33XX_SR0_OPP50_EVM_ERR_MIN_LIMIT,
++               .err_maxlimit   = AM33XX_SR0_OPP50_ERR_MAX_LIMIT,
++               .err_weight     = AM33XX_SR0_OPP50_ERR_WEIGHT,
++                .margin         = AM33XX_SR0_OPP50_MARGIN,
++                .nominal_volt   = AM33XX_VDD_CORE_OPP50_UV,
++        },
++        {
++                .efuse_offs    = AM33XX_SR0_OPP100_CNTRL_OFFSET,
++               .e2v_gain       = AM33XX_SR0_OPP100_EVM_ERR2VOLT_GAIN,
++               .err_minlimit   = AM33XX_SR0_OPP100_EVM_ERR_MIN_LIMIT,
++               .err_maxlimit   = AM33XX_SR0_OPP100_ERR_MAX_LIMIT,
++               .err_weight     = AM33XX_SR0_OPP100_ERR_WEIGHT,
++                .margin         = AM33XX_SR0_OPP100_MARGIN,
++                .nominal_volt   = AM33XX_VDD_CORE_OPP100_UV,
++        },
++};
++
++static struct am33xx_sr_sdata sr_sensor_data[] = {
++       {
++                .sr_opp_data    = sr0_opp_data,
++                /* note that OPP50 is NOT used in Linux kernel for AM335x */
++                .no_of_opps     = 0x2,
++                .default_opp    = 0x1,
++               .senn_mod       = 0x1,
++               .senp_mod       = 0x1,
++       },
++       {
++               .sr_opp_data    = sr1_opp_data,
++                /* the opp data below should be determined
++                   dynamically during SR probe */
++                .no_of_opps     = 0x4,
++                .default_opp    = 0x3,
++               .senn_mod       = 0x1,
++               .senp_mod       = 0x1,
++       },
++};
++
++static struct am33xx_sr_platform_data am33xx_sr_pdata = {
++       .vd_name[0]             = "vdd_core",
++        .vd_name[1]             = "vdd_mpu",
++       .ip_type                = 2,
++        .irq_delay              = 1000,
++       .no_of_vds              = 2,
++       .no_of_sens             = ARRAY_SIZE(sr_sensor_data),
++       .vstep_size_uv          = 12500,
++       .enable_on_init         = true,
++       .sr_sdata               = sr_sensor_data,
++};
++
++static struct resource am33xx_sr_resources[] = {
++       {
++               .name   =       "smartreflex0",
++               .start  =       AM33XX_SR0_BASE,
++               .end    =       AM33XX_SR0_BASE + SZ_4K - 1,
++               .flags  =       IORESOURCE_MEM,
++       },
++       {
++               .name   =       "smartreflex0",
++               .start  =       AM33XX_IRQ_SMARTREFLEX0,
++               .end    =       AM33XX_IRQ_SMARTREFLEX0,
++               .flags  =       IORESOURCE_IRQ,
++       },
++       {
++               .name   =       "smartreflex1",
++               .start  =       AM33XX_SR1_BASE,
++               .end    =       AM33XX_SR1_BASE + SZ_4K - 1,
++               .flags  =       IORESOURCE_MEM,
++       },
++       {
++               .name   =       "smartreflex1",
++               .start  =       AM33XX_IRQ_SMARTREFLEX1,
++               .end    =       AM33XX_IRQ_SMARTREFLEX1,
++               .flags  =       IORESOURCE_IRQ,
++       },
++};
++
++/* VCORE for SR regulator init */
++static struct platform_device am33xx_sr_device = {
++       .name           = "smartreflex",
++       .id             = -1,
++       .num_resources  = ARRAY_SIZE(am33xx_sr_resources),
++       .resource       = am33xx_sr_resources,
++       .dev = {
++               .platform_data = &am33xx_sr_pdata,
++       },
++};
++
++void __init am33xx_sr_init(void)
++{
++        /* For beaglebone, update voltage step size and related parameters
++           appropriately.  All other AM33XX platforms are good with the
++           structure defaults as initialized above. */
++        if ((am33xx_evmid == BEAGLE_BONE_OLD) ||
++                        (am33xx_evmid == BEAGLE_BONE_A3)) {
++                printk(KERN_ERR "address of pdata = %08x\n", (u32)&am33xx_sr_pdata);
++                am33xx_sr_pdata.vstep_size_uv = 25000;
++                /* CORE */
++                sr0_opp_data[0].e2v_gain     = AM33XX_SR0_OPP50_BB_ERR2VOLT_GAIN;
++                sr0_opp_data[0].err_minlimit = AM33XX_SR0_OPP50_BB_ERR_MIN_LIMIT;
++                sr0_opp_data[1].e2v_gain     = AM33XX_SR0_OPP100_BB_ERR2VOLT_GAIN;
++                sr0_opp_data[1].err_minlimit = AM33XX_SR0_OPP100_BB_ERR_MIN_LIMIT;
++                /* MPU */
++                sr1_opp_data[0].e2v_gain     = AM33XX_SR1_OPP50_BB_ERR2VOLT_GAIN;
++                sr1_opp_data[0].err_minlimit = AM33XX_SR1_OPP50_BB_ERR_MIN_LIMIT;
++                sr1_opp_data[1].e2v_gain     = AM33XX_SR1_OPP100_BB_ERR2VOLT_GAIN;
++                sr1_opp_data[1].err_minlimit = AM33XX_SR1_OPP100_BB_ERR_MIN_LIMIT;
++                sr1_opp_data[2].e2v_gain     = AM33XX_SR1_OPP120_BB_ERR2VOLT_GAIN;
++                sr1_opp_data[2].err_minlimit = AM33XX_SR1_OPP120_BB_ERR_MIN_LIMIT;
++                sr1_opp_data[3].e2v_gain     = AM33XX_SR1_OPPTURBO_BB_ERR2VOLT_GAIN;
++                sr1_opp_data[3].err_minlimit = AM33XX_SR1_OPPTURBO_BB_ERR_MIN_LIMIT;
++        }
++
++       if (platform_device_register(&am33xx_sr_device))
++               printk(KERN_ERR "failed to register am33xx_sr device\n");
++       else
++               printk(KERN_INFO "registered am33xx_sr device\n");
++}
++#else
++inline void am33xx_sr_init(void) {}
++#endif
++
+ /*-------------------------------------------------------------------------*/
+
+ static int __init omap2_init_devices(void)
+diff --git a/arch/arm/mach-omap2/include/mach/board-am335xevm.h b/arch/arm/mach-omap2/include/mach/board-am335xevm.h
+index 1d24495..85a8df0 100644
+--- a/arch/arm/mach-omap2/include/mach/board-am335xevm.h
++++ b/arch/arm/mach-omap2/include/mach/board-am335xevm.h
+@@ -41,6 +41,7 @@
+ void am335x_evm_set_id(unsigned int evmid);
+ int am335x_evm_get_id(void);
+ void am33xx_cpsw_macidfillup(char *eeprommacid0, char *eeprommacid1);
++void am33xx_sr_init(void);
+ void am33xx_d_can_init(unsigned int instance);
+
+ #endif
+diff --git a/arch/arm/plat-omap/Kconfig b/arch/arm/plat-omap/Kconfig
+index 734009a..33f17f2 100644
+--- a/arch/arm/plat-omap/Kconfig
++++ b/arch/arm/plat-omap/Kconfig
+@@ -43,6 +43,27 @@ config OMAP_DEBUG_LEDS
+	depends on OMAP_DEBUG_DEVICES
+	default y if LEDS_CLASS
+
++config AM33XX_SMARTREFLEX
++	bool "AM33XX SmartReflex support"
++	depends on (SOC_OMAPAM33XX) && PM
++	help
++	  Say Y if you want to enable SmartReflex.
++
++	  SmartReflex can perform continuous dynamic voltage
++	  scaling around the nominal operating point voltage
++	  according to silicon characteristics and operating
++	  conditions. Enabling SmartReflex reduces active power
++	  consumption.
++
++	  Please note, that by default SmartReflex is enabled.
++          To disable the automatic voltage compensation for
++          vdd mpu and vdd core from user space, user must
++          write 1 to /debug/smartreflex/autocomp.
++
++	  Optionally autocompensation can be disabled in the kernel
++	  by default during system init via the enable_on_init flag
++	  which an be passed as platform data to the smartreflex driver.
++
+ config OMAP_SMARTREFLEX
+	bool "SmartReflex support"
+	depends on (ARCH_OMAP3 || ARCH_OMAP4) && PM
+diff --git a/arch/arm/plat-omap/include/plat/am33xx.h b/arch/arm/plat-omap/include/plat/am33xx.h
+index 32522df..a628b1f 100644
+--- a/arch/arm/plat-omap/include/plat/am33xx.h
++++ b/arch/arm/plat-omap/include/plat/am33xx.h
+@@ -43,6 +43,9 @@
+ #define AM33XX_TSC_BASE		0x44E0D000
+ #define AM33XX_RTC_BASE		0x44E3E000
+
++#define AM33XX_SR0_BASE         0x44E37000
++#define AM33XX_SR1_BASE         0x44E39000
++
+ #define AM33XX_ASP0_BASE	0x48038000
+ #define AM33XX_ASP1_BASE	0x4803C000
+
+diff --git a/arch/arm/plat-omap/include/plat/smartreflex.h b/arch/arm/plat-omap/include/plat/smartreflex.h
+new file mode 100644
+index 0000000..36338f7
+--- /dev/null
++++ b/arch/arm/plat-omap/include/plat/smartreflex.h
+@@ -0,0 +1,431 @@
++/*
++ * OMAP Smartreflex Defines and Routines
++ *
++ * Author: Thara Gopinath	<thara@ti.com>
++ *
++ * Copyright (C) 2010 Texas Instruments, Inc.
++ * Thara Gopinath <thara@ti.com>
++ *
++ * Copyright (C) 2008 Nokia Corporation
++ * Kalle Jokiniemi
++ *
++ * Copyright (C) 2007 Texas Instruments, Inc.
++ * Lesly A M <x0080970@ti.com>
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ */
++
++#ifndef __ASM_ARM_OMAP_SMARTREFLEX_H
++#define __ASM_ARM_OMAP_SMARTREFLEX_H
++
++#include <linux/platform_device.h>
++#include <plat/voltage.h>
++
++/*
++ * Different Smartreflex IPs version. The v1 is the 65nm version used in
++ * OMAP3430. The v2 is the update for the 45nm version of the IP
++ * used in OMAP3630 and OMAP4430
++ */
++#define SR_TYPE_V1	1
++#define SR_TYPE_V2	2
++
++/* SMART REFLEX REG ADDRESS OFFSET */
++#define SRCONFIG		0x00
++#define SRSTATUS		0x04
++#define SENVAL			0x08
++#define SENMIN			0x0C
++#define SENMAX			0x10
++#define SENAVG			0x14
++#define AVGWEIGHT		0x18
++#define NVALUERECIPROCAL	0x1c
++#define SENERROR_V1		0x20
++#define ERRCONFIG_V1		0x24
++#define IRQ_EOI			0x20
++#define IRQSTATUS_RAW		0x24
++#define IRQSTATUS		0x28
++#define IRQENABLE_SET		0x2C
++#define IRQENABLE_CLR		0x30
++#define SENERROR_V2		0x34
++#define ERRCONFIG_V2		0x38
++
++/* Bit/Shift Positions */
++
++/* SRCONFIG */
++#define SRCONFIG_ACCUMDATA_SHIFT	22
++#define SRCONFIG_SRCLKLENGTH_SHIFT	12
++#define SRCONFIG_SENNENABLE_V1_SHIFT	5
++#define SRCONFIG_SENPENABLE_V1_SHIFT	3
++#define SRCONFIG_SENNENABLE_V2_SHIFT	1
++#define SRCONFIG_SENPENABLE_V2_SHIFT	0
++#define SRCONFIG_CLKCTRL_SHIFT		0
++
++#define SRCONFIG_ACCUMDATA_MASK		(0x3ff << 22)
++
++#define SRCONFIG_SRENABLE		BIT(11)
++#define SRCONFIG_SENENABLE		BIT(10)
++#define SRCONFIG_ERRGEN_EN		BIT(9)
++#define SRCONFIG_MINMAXAVG_EN		BIT(8)
++#define SRCONFIG_DELAYCTRL		BIT(2)
++
++/* AVGWEIGHT */
++#define AVGWEIGHT_SENPAVGWEIGHT_SHIFT	2
++#define AVGWEIGHT_SENNAVGWEIGHT_SHIFT	0
++
++/* NVALUERECIPROCAL */
++#define NVALUERECIPROCAL_SENPGAIN_SHIFT	20
++#define NVALUERECIPROCAL_SENNGAIN_SHIFT	16
++#define NVALUERECIPROCAL_RNSENP_SHIFT	8
++#define NVALUERECIPROCAL_RNSENN_SHIFT	0
++
++/* ERRCONFIG */
++#define ERRCONFIG_ERRWEIGHT_SHIFT	16
++#define ERRCONFIG_ERRMAXLIMIT_SHIFT	8
++#define ERRCONFIG_ERRMINLIMIT_SHIFT	0
++
++#define SR_ERRWEIGHT_MASK		(0x07 << 16)
++#define SR_ERRMAXLIMIT_MASK		(0xff << 8)
++#define SR_ERRMINLIMIT_MASK		(0xff << 0)
++
++#define ERRCONFIG_VPBOUNDINTEN_V1	BIT(31)
++#define ERRCONFIG_VPBOUNDINTST_V1	BIT(30)
++#define	ERRCONFIG_MCUACCUMINTEN		BIT(29)
++#define ERRCONFIG_MCUACCUMINTST		BIT(28)
++#define	ERRCONFIG_MCUVALIDINTEN		BIT(27)
++#define ERRCONFIG_MCUVALIDINTST		BIT(26)
++#define ERRCONFIG_MCUBOUNDINTEN		BIT(25)
++#define	ERRCONFIG_MCUBOUNDINTST		BIT(24)
++#define	ERRCONFIG_MCUDISACKINTEN	BIT(23)
++#define ERRCONFIG_VPBOUNDINTST_V2	BIT(23)
++#define ERRCONFIG_MCUDISACKINTST	BIT(22)
++#define ERRCONFIG_VPBOUNDINTEN_V2	BIT(22)
++
++#define ERRCONFIG_STATUS_V1_MASK	(ERRCONFIG_VPBOUNDINTST_V1 | \
++					ERRCONFIG_MCUACCUMINTST | \
++					ERRCONFIG_MCUVALIDINTST | \
++					ERRCONFIG_MCUBOUNDINTST | \
++					ERRCONFIG_MCUDISACKINTST)
++/* IRQSTATUS */
++#define IRQSTATUS_MCUACCUMINT		BIT(3)
++#define IRQSTATUS_MCVALIDINT		BIT(2)
++#define IRQSTATUS_MCBOUNDSINT		BIT(1)
++#define IRQSTATUS_MCUDISABLEACKINT	BIT(0)
++
++/* IRQENABLE_SET and IRQENABLE_CLEAR */
++#define IRQENABLE_MCUACCUMINT		BIT(3)
++#define IRQENABLE_MCUVALIDINT		BIT(2)
++#define IRQENABLE_MCUBOUNDSINT		BIT(1)
++#define IRQENABLE_MCUDISABLEACKINT	BIT(0)
++
++/* Common Bit values */
++
++#define SRCLKLENGTH_12MHZ_SYSCLK	0x3c
++#define SRCLKLENGTH_13MHZ_SYSCLK	0x41
++#define SRCLKLENGTH_19MHZ_SYSCLK	0x60
++#define SRCLKLENGTH_26MHZ_SYSCLK	0x82
++#define SRCLKLENGTH_38MHZ_SYSCLK	0xC0
++
++/*
++ * 3430 specific values. Maybe these should be passed from board file or
++ * pmic structures.
++ */
++#define OMAP3430_SR_ACCUMDATA		0x1f4
++
++#define OMAP3430_SR1_SENPAVGWEIGHT	0x03
++#define OMAP3430_SR1_SENNAVGWEIGHT	0x03
++
++#define OMAP3430_SR2_SENPAVGWEIGHT	0x01
++#define OMAP3430_SR2_SENNAVGWEIGHT	0x01
++
++#define OMAP3430_SR_ERRWEIGHT		0x04
++#define OMAP3430_SR_ERRMAXLIMIT		0x02
++
++/**
++ * struct omap_sr_pmic_data - Strucutre to be populated by pmic code to pass
++ *				pmic specific info to smartreflex driver
++ *
++ * @sr_pmic_init:	API to initialize smartreflex on the PMIC side.
++ */
++struct omap_sr_pmic_data {
++	void (*sr_pmic_init) (void);
++};
++
++#ifdef CONFIG_OMAP_SMARTREFLEX
++/*
++ * The smart reflex driver supports CLASS1 CLASS2 and CLASS3 SR.
++ * The smartreflex class driver should pass the class type.
++ * Should be used to populate the class_type field of the
++ * omap_smartreflex_class_data structure.
++ */
++#define SR_CLASS1	0x1
++#define SR_CLASS2	0x2
++#define SR_CLASS3	0x3
++
++/**
++ * struct omap_sr_class_data - Smartreflex class driver info
++ *
++ * @enable:		API to enable a particular class smaartreflex.
++ * @disable:		API to disable a particular class smartreflex.
++ * @configure:		API to configure a particular class smartreflex.
++ * @notify:		API to notify the class driver about an event in SR.
++ *			Not needed for class3.
++ * @notify_flags:	specify the events to be notified to the class driver
++ * @class_type:		specify which smartreflex class.
++ *			Can be used by the SR driver to take any class
++ *			based decisions.
++ */
++struct omap_sr_class_data {
++	int (*enable)(struct voltagedomain *voltdm);
++	int (*disable)(struct voltagedomain *voltdm, int is_volt_reset);
++	int (*configure)(struct voltagedomain *voltdm);
++	int (*notify)(struct voltagedomain *voltdm, u32 status);
++	u8 notify_flags;
++	u8 class_type;
++};
++
++/**
++ * struct omap_sr_nvalue_table	- Smartreflex n-target value info
++ *
++ * @efuse_offs:	The offset of the efuse where n-target values are stored.
++ * @nvalue:	The n-target value.
++ */
++struct omap_sr_nvalue_table {
++	u32 efuse_offs;
++	u32 nvalue;
++};
++
++/**
++ * struct omap_sr_data - Smartreflex platform data.
++ *
++ * @ip_type:		Smartreflex IP type.
++ * @senp_mod:		SENPENABLE value for the sr
++ * @senn_mod:		SENNENABLE value for sr
++ * @nvalue_count:	Number of distinct nvalues in the nvalue table
++ * @enable_on_init:	whether this sr module needs to enabled at
++ *			boot up or not.
++ * @nvalue_table:	table containing the  efuse offsets and nvalues
++ *			corresponding to them.
++ * @voltdm:		Pointer to the voltage domain associated with the SR
++ */
++struct omap_sr_data {
++	int				ip_type;
++	u32				senp_mod;
++	u32				senn_mod;
++	int				nvalue_count;
++	bool				enable_on_init;
++	struct omap_sr_nvalue_table	*nvalue_table;
++	struct voltagedomain		*voltdm;
++};
++
++/* Smartreflex module enable/disable interface */
++void omap_sr_enable(struct voltagedomain *voltdm);
++void omap_sr_disable(struct voltagedomain *voltdm);
++void omap_sr_disable_reset_volt(struct voltagedomain *voltdm);
++
++/* API to register the pmic specific data with the smartreflex driver. */
++void omap_sr_register_pmic(struct omap_sr_pmic_data *pmic_data);
++
++/* Smartreflex driver hooks to be called from Smartreflex class driver */
++int sr_enable(struct voltagedomain *voltdm, unsigned long volt);
++void sr_disable(struct voltagedomain *voltdm);
++int sr_configure_errgen(struct voltagedomain *voltdm);
++int sr_configure_minmax(struct voltagedomain *voltdm);
++
++/* API to register the smartreflex class driver with the smartreflex driver */
++int sr_register_class(struct omap_sr_class_data *class_data);
++#else
++
++#ifdef CONFIG_AM33XX_SMARTREFLEX
++
++#define SR_CORE                         (0)
++#define SR_MPU                          (1)
++#define SRCLKLENGTH_125MHZ_SYSCLK	(0x78 << 12)
++#define GAIN_MAXLIMIT                   (16)
++#define R_MAXLIMIT                      (256)
++#define MAX_SENSORS                     2
++/* GG: eventually this should be determined at runtime */
++#define AM33XX_OPP_COUNT                4
++
++/**
++ * struct am33xx_sr_opp_data	- Smartreflex data per OPP
++ * @efuse_offs:		The offset of the efuse where n-target values are
++ *			stored.
++ * @nvalue:             NTarget as stored in EFUSE.
++ * @adj_nvalue:         Adjusted NTarget (adjusted by margin)
++ * @e2v_gain:		Error to voltage gain for changing the percentage
++ *			error into voltage delta
++ * @err_weight:		Average sensor error weight
++ * @err_minlimit:	Minimum error limit of the sensor
++ * @err_maxlimit:	Maximum error limit of the sensor
++ * @margin:             Voltage margin to apply
++ * @nominal_volt:       Nominal voltage for this OPP
++ * @frequency:          Defined frequency for this OPP (in KHz)
++ */
++struct am33xx_sr_opp_data {
++	u32	efuse_offs;
++        u32     nvalue;
++        u32     adj_nvalue;
++	s32	e2v_gain;
++	u32	err_weight;
++	u32	err_minlimit;
++	u32	err_maxlimit;
++        s32     margin;
++        u32     nominal_volt; /* nominal_volt and frequency may be removed
++                                 once am33xx voltdm layer works */
++        u32     frequency;
++        u32     opp_id;
++};
++
++/**
++ * struct am33xx_sr_sdata	- Smartreflex sensors data
++ * @sr_opp_data:	Pointer to data structure containing per OPP data
++ *                      for this SR module.
++ * @no_of_opps:         Number of OPP's supported for this sensor -
++ *                       determined dynamically when possible.
++ * @default_opp:        Defines the opp to use on startup if OPP is fixed
++ *                       or cannot be determined dynamically.
++ * @senn_mod:		Enable bit for N sensor
++ * @senp_mod:		Enable bit for P sensor
++ */
++struct am33xx_sr_sdata {
++	struct am33xx_sr_opp_data *sr_opp_data;
++        u32     no_of_opps;
++        u32     default_opp;
++	u32	senn_mod;
++	u32	senp_mod;
++};
++
++struct am33xx_sr_sensor {
++        u32                             sr_id;
++	u32			        irq;
++	u32			        irq_status;
++	u32			        senn_en;
++	u32			        senp_en;
++	char			        *name;
++        char                            *reg_name;
++	void __iomem		        *base;
++        int				init_volt_mv;
++        int                             curr_opp;
++        u32                             no_of_opps;
++        struct delayed_work             work_reenable;
++        struct regulator		*reg;
++        struct am33xx_sr_opp_data       opp_data[AM33XX_OPP_COUNT];
++	struct clk		        *fck;
++        struct voltagedomain		*voltdm;
++        struct omap_volt_data           *volt_data;
++};
++
++struct am33xx_sr {
++	u32				autocomp_active;
++	u32				sens_per_vd;
++        u32                             no_of_sens;
++        u32                             no_of_vds;
++	u32				ip_type;
++        u32				irq_delay;
++        u32                             disabled_by_user;
++	int				uvoltage_step_size;
++        char                            *res_name[MAX_SENSORS];
++#ifdef CONFIG_CPU_FREQ
++	struct notifier_block	        freq_transition;
++#endif
++	/*struct work_struct		work;*/
++        struct delayed_work             work;
++	struct sr_platform_data		*sr_data;
++	struct am33xx_sr_sensor		sen[MAX_SENSORS];
++	struct platform_device		*pdev;
++};
++
++/**
++ * struct am33xx_sr_platform_data - Smartreflex platform data.
++ * @sr_sdata:		SR per sensor details, contains the efuse off-sets,
++ *			error to voltage gain factor, minimum error limits
++ * @vd_name:		Name of the voltage domain.
++ * @ip_type:		Smartreflex IP type, class1 or class2 or class3.
++ * @irq_delay:          Amount of time required for changed voltage to settle.
++ * @no_of_vds:		Number of voltage domains to which SR applicable
++ * @no_of_sens:		Number of SR sensors used to monitor the device
++ *			performance, temp etc...
++ * @vstep_size_uv:	PMIC voltage step size in micro volts
++ * @enable_on_init:	whether this sr module needs to enabled at
++ *			boot up or not.
++ */
++struct am33xx_sr_platform_data {
++	struct am33xx_sr_sdata	*sr_sdata;
++	char			*vd_name[2];
++	u32			ip_type;
++        u32                     irq_delay;
++	u32			no_of_vds;
++	u32			no_of_sens;
++	u32			vstep_size_uv;
++	bool			enable_on_init;
++};
++
++#endif /*CONFIG_AM33XX_SMARTREFLEX*/
++
++#ifdef CONFIG_TI816X_SMARTREFLEX
++
++#define SRHVT				0
++#define SRSVT				1
++
++/* SRClk = 100KHz */
++#define SRCLKLENGTH_125MHZ_SYSCLK	(0x271 << 12)
++
++/**
++ * struct ti816x_sr_sdata	- Smartreflex sensors data
++ * @efuse_offs:		The offset of the efuse where n-target values are
++ *			stored.
++ * @e2v_gain:		Error to voltage gain for changing the percentage
++ *			error into voltage delta
++ * @err_weight:		Average sensor error weight
++ * @err_minlimit:	Minimum error limit of the sensor
++ * @err_maxlimit:	Maximum error limit of the sensor
++ * @senn_mod:		Enable bit for N sensor
++ * @senp_mod:		Enable bit for P sensor
++ */
++struct ti816x_sr_sdata {
++	u32	efuse_offs;
++	u32	e2v_gain;
++	u32	err_weight;
++	u32	err_minlimit;
++	u32	err_maxlimit;
++	u32	senn_mod;
++	u32	senp_mod;
++};
++
++/**
++ * struct ti816x_sr_platform_data - Smartreflex platform data.
++ * @sr_sdata:		SR per sensor details, contains the efuse off-sets,
++ *			error to voltage gain factor, minimum error limits
++ * @vd_name:		Name of the voltage domain.
++ * @ip_type:		Smartreflex IP type, class1 or class2 or class3.
++ * @irq_delay:		Time delay between disable and re-enable the
++ *			interrupts, in msec
++ * @no_of_vds:		Number of voltage domains to which SR applicable
++ * @no_of_sens:		Number of SR sensors used to monitor the device
++ *			performance, temp etc...
++ * @vstep_size_uv:	PMIC voltage step size in micro volts
++ * @enable_on_init:	whether this sr module needs to enabled at
++ *			boot up or not.
++ */
++struct ti816x_sr_platform_data {
++	struct ti816x_sr_sdata	*sr_sdata;
++	char			*vd_name;
++	u32			ip_type;
++	u32			irq_delay;
++	u32			no_of_vds;
++	u32			no_of_sens;
++	u32			vstep_size_uv;
++	bool			enable_on_init;
++};
++
++#endif /* CONFIG_TI816X_SMARTREFLEX */
++
++static inline void omap_sr_enable(struct voltagedomain *voltdm) {}
++static inline void omap_sr_disable(struct voltagedomain *voltdm) {}
++static inline void omap_sr_disable_reset_volt(
++		struct voltagedomain *voltdm) {}
++static inline void omap_sr_register_pmic(
++		struct omap_sr_pmic_data *pmic_data) {}
++#endif
++#endif
+diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
+index 00706c6..382ce2d 100644
+--- a/drivers/regulator/core.c
++++ b/drivers/regulator/core.c
+@@ -169,6 +169,9 @@ static int regulator_check_consumers(struct regulator_dev *rdev,
+ {
+	struct regulator *regulator;
+
++        if (rdev->ignore_check_consumers)
++                return 0;
++
+	list_for_each_entry(regulator, &rdev->consumer_list, list) {
+		/*
+		 * Assume consumers that didn't say anything are OK
+@@ -2688,6 +2691,7 @@ struct regulator_dev *regulator_register(struct regulator_desc *regulator_desc,
+	rdev->reg_data = driver_data;
+	rdev->owner = regulator_desc->owner;
+	rdev->desc = regulator_desc;
++        rdev->ignore_check_consumers = init_data->ignore_check_consumers;
+	INIT_LIST_HEAD(&rdev->consumer_list);
+	INIT_LIST_HEAD(&rdev->list);
+	BLOCKING_INIT_NOTIFIER_HEAD(&rdev->notifier);
+diff --git a/include/linux/regulator/driver.h b/include/linux/regulator/driver.h
+index 52c89ae..6176167 100644
+--- a/include/linux/regulator/driver.h
++++ b/include/linux/regulator/driver.h
+@@ -204,7 +204,7 @@ struct regulator_dev {
+	int deferred_disables;
+
+	void *reg_data;		/* regulator_dev data */
+-
++        int ignore_check_consumers;
+ #ifdef CONFIG_DEBUG_FS
+	struct dentry *debugfs;
+ #endif
+diff --git a/include/linux/regulator/machine.h b/include/linux/regulator/machine.h
+index f3f13fd..0de52a3 100644
+--- a/include/linux/regulator/machine.h
++++ b/include/linux/regulator/machine.h
+@@ -169,7 +169,7 @@ struct regulator_consumer_supply {
+  *               be usable.
+  * @num_consumer_supplies: Number of consumer device supplies.
+  * @consumer_supplies: Consumer device supply configuration.
+- *
++ * @ignore_check_consumers: If != 0, regulator_check_consumers() is disabled.
+  * @regulator_init: Callback invoked when the regulator has been registered.
+  * @driver_data: Data passed to regulator_init.
+  */
+@@ -181,6 +181,7 @@ struct regulator_init_data {
+	int num_consumer_supplies;
+	struct regulator_consumer_supply *consumer_supplies;
+
++        int ignore_check_consumers;
+	/* optional regulator machine specific init */
+	int (*regulator_init)(void *driver_data);
+	void *driver_data;	/* core does not touch this */
+--
+1.7.0.4
diff --git a/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0001-mach-omap2-pm33xx-Disable-VT-switch.patch b/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0001-mach-omap2-pm33xx-Disable-VT-switch.patch
new file mode 100644
index 0000000..66c643e
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0001-mach-omap2-pm33xx-Disable-VT-switch.patch
@@ -0,0 +1,71 @@
+From 31ec2850e89414efb30accb9d8b5228257e507b1 Mon Sep 17 00:00:00 2001
+From: Chase Maupin <Chase.Maupin@ti.com>
+Date: Wed, 21 Mar 2012 10:18:03 -0500
+Subject: [PATCH 1/1] mach-omap2: pm33xx: Disable VT switch
+
+* Added a new config option TI_PM_DISABLE_VT_SWITCH which
+  disables the VT console switch which normally occurs during
+  suspend.  This console switch can cause a hange when performed
+  with applications like Matrix running.  The VT switch is
+  considered unnecessary.
+* Modified the am335x_evm_defconfig file to default the
+  TI_PM_DISABLE_VT_SWITCH to "y".
+* Based on a patch for the linux-omap3 kernel by Greg Guyotte
+
+Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
+---
+ arch/arm/configs/am335x_evm_defconfig |    1 +
+ arch/arm/mach-omap2/Kconfig           |    9 +++++++++
+ arch/arm/mach-omap2/pm33xx.c          |    5 +++++
+ 3 files changed, 15 insertions(+), 0 deletions(-)
+
+diff --git a/arch/arm/configs/am335x_evm_defconfig b/arch/arm/configs/am335x_evm_defconfig
+index 53d1b6a..7a5e7ad 100644
+--- a/arch/arm/configs/am335x_evm_defconfig
++++ b/arch/arm/configs/am335x_evm_defconfig
+@@ -325,6 +325,7 @@ CONFIG_MACH_TI8148EVM=y
+ CONFIG_MACH_AM335XEVM=y
+ CONFIG_MACH_AM335XIAEVM=y
+ # CONFIG_OMAP3_EMU is not set
++CONFIG_TI_PM_DISABLE_VT_SWITCH=y
+ # CONFIG_OMAP3_SDRC_AC_TIMING is not set
+ CONFIG_OMAP3_EDMA=y
+
+diff --git a/arch/arm/mach-omap2/Kconfig b/arch/arm/mach-omap2/Kconfig
+index e44e942..f13e9dc 100644
+--- a/arch/arm/mach-omap2/Kconfig
++++ b/arch/arm/mach-omap2/Kconfig
+@@ -372,6 +372,15 @@ config OMAP3_EMU
+	help
+	  Say Y here to enable debugging hardware of omap3
+
++config TI_PM_DISABLE_VT_SWITCH
++	bool "TI Disable PM Console Switch"
++	depends on ARCH_OMAP3
++	default y
++	help
++	  This option disables the default PM VT switch behavior for TI devices.
++	  Some platforms hang during suspend due to a failed attempt to
++	  perform the VT switch.  The VT switch is unnecessary on many platforms.
++
+ config OMAP3_SDRC_AC_TIMING
+	bool "Enable SDRC AC timing register changes"
+	depends on ARCH_OMAP3
+diff --git a/arch/arm/mach-omap2/pm33xx.c b/arch/arm/mach-omap2/pm33xx.c
+index 70bcb42..019ae46 100644
+--- a/arch/arm/mach-omap2/pm33xx.c
++++ b/arch/arm/mach-omap2/pm33xx.c
+@@ -502,6 +502,11 @@ static int __init am33xx_pm_init(void)
+	pr_info("Power Management for AM33XX family\n");
+
+ #ifdef CONFIG_SUSPEND
++
++#ifdef CONFIG_TI_PM_DISABLE_VT_SWITCH
++	pm_set_vt_switch(0);
++#endif
++
+ /* Read SDRAM_CONFIG register to determine Memory Type */
+	base = am33xx_get_ram_base();
+	reg = readl(base + EMIF4_0_SDRAM_CONFIG);
+--
+1.7.0.4
diff --git a/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0001-musb-update-PIO-mode-help-information-in-Kconfig.patch b/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0001-musb-update-PIO-mode-help-information-in-Kconfig.patch
new file mode 100644
index 0000000..f7652bd
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0001-musb-update-PIO-mode-help-information-in-Kconfig.patch
@@ -0,0 +1,45 @@
+From 214f6b2fee005dba5e01b3b434f184adf4386a25 Mon Sep 17 00:00:00 2001
+From: Chase Maupin <Chase.Maupin@ti.com>
+Date: Thu, 2 Feb 2012 15:52:10 -0600
+Subject: [PATCH] musb: update PIO mode help information in Kconfig
+
+* Updated the Kconfig help information for the PIO mode for MUSB
+  to make it more clear to the customer when to select this option
+  and which devices currently have issues with this option.
+* This is in accordance with the findings for CPPI4.1 DMA usage
+  for MUSB
+
+Upstream-Status: Submitted
+    * Submitted to the PSP team using the lpr list
+
+Signed-off-by: Matt Porter <mporter@ti.com>
+Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
+---
+ drivers/usb/musb/Kconfig |   12 ++++++++----
+ 1 files changed, 8 insertions(+), 4 deletions(-)
+
+diff --git a/drivers/usb/musb/Kconfig b/drivers/usb/musb/Kconfig
+index a06335f..3576afe 100644
+--- a/drivers/usb/musb/Kconfig
++++ b/drivers/usb/musb/Kconfig
+@@ -159,10 +159,14 @@ config MUSB_PIO_ONLY
+	  All data is copied between memory and FIFO by the CPU.
+	  DMA controllers are ignored.
+
+-	  Do not choose this unless DMA support for your SOC or board
+-	  is unavailable (or unstable).  When DMA is enabled at compile time,
+-	  you can still disable it at run time using the "use_dma=n" module
+-	  parameter.
++	  Select 'y' here if DMA support for your SOC or board
++	  is unavailable (or unstable). On CPPI 4.1 DMA based
++	  systems (AM335x, AM35x, and AM180x) DMA support is
++	  considered unstable and this option should be enabled
++	  in production systems so that DMA is disabled, unless DMA
++	  has been validated for all use cases. When DMA is enabled at
++	  compile time, you can still disable it at run time using the
++	  "use_dma=n" module parameter.
+
+ endchoice
+
+--
+1.7.0.4
diff --git a/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0001-omap-serial-add-delay-before-suspending.patch b/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0001-omap-serial-add-delay-before-suspending.patch
new file mode 100644
index 0000000..7780786
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0001-omap-serial-add-delay-before-suspending.patch
@@ -0,0 +1,42 @@
+From 0f62d1f4d4543a315815b8eb15ea9cdad25d16c8 Mon Sep 17 00:00:00 2001
+From: Eyal Reizer <eyalr@ti.com>
+Date: Wed, 27 Jun 2012 16:08:53 +0300
+Subject: [PATCH] omap-serial: add delay before suspending
+
+In case suspending during Bluetooth traffic, after resume the bluetooth is
+stuck.
+It was identified that suspend is happening before the UART buffer was
+fully drained which caused this hang after resume.
+The folliwng delay is a temporary workaround until the issue is resolved
+properly.
+
+Upstream Status: Pending
+
+Signed-off-by: Eyal Reizer <eyalr@ti.com>
+---
+ drivers/tty/serial/omap-serial.c |   10 ++++++++++
+ 1 files changed, 10 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/tty/serial/omap-serial.c b/drivers/tty/serial/omap-serial.c
+index ca24ab3..108ea2b 100755
+--- a/drivers/tty/serial/omap-serial.c
++++ b/drivers/tty/serial/omap-serial.c
+@@ -1166,6 +1166,16 @@ static int serial_omap_suspend(struct device *dev)
+	struct uart_omap_port *up = dev_get_drvdata(dev);
+
+	if (up) {
++                /*
++                  In case suspending during Bluetooth traffic, after resume
++                  the bluetooth is stuck.
++                  It was identified that suspend is happening before the
++                  UART buffer was fully drained which caused this hang after
++                  resume. The following delay is a temporary workaround until
++                  the issue is resolved properly.
++                */
++                msleep(10);
++
+		uart_suspend_port(&serial_omap_reg, &up->port);
+		flush_work_sync(&up->qos_work);
+	}
+--
+1.7.0.4
diff --git a/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0002-AM335x-OCF-Driver-for-Linux-3.patch b/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0002-AM335x-OCF-Driver-for-Linux-3.patch
new file mode 100644
index 0000000..916b190
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0002-AM335x-OCF-Driver-for-Linux-3.patch
@@ -0,0 +1,7228 @@
+From a97aac248717d62bdbf322c1d6d422ddfde87de0 Mon Sep 17 00:00:00 2001
+From: Greg Turner <gregturner@ti.com>
+Date: Thu, 3 May 2012 10:33:13 -0500
+Subject: [PATCH 2/2] AM335x OCF Driver for Linux 3
+
+---
+ crypto/Kconfig               |    3 +
+ crypto/Makefile              |    2 +
+ crypto/ocf/Config.in         |   20 +
+ crypto/ocf/Kconfig           |   48 ++
+ crypto/ocf/Makefile          |  138 ++++
+ crypto/ocf/criov.c           |  215 +++++
+ crypto/ocf/crypto.c          | 1766 ++++++++++++++++++++++++++++++++++++++++++
+ crypto/ocf/cryptodev.c       | 1069 +++++++++++++++++++++++++
+ crypto/ocf/cryptodev.h       |  480 ++++++++++++
+ crypto/ocf/cryptosoft.c      | 1322 +++++++++++++++++++++++++++++++
+ crypto/ocf/ocf-bench.c       |  514 ++++++++++++
+ crypto/ocf/ocf-compat.h      |  372 +++++++++
+ crypto/ocf/ocfnull/Makefile  |   12 +
+ crypto/ocf/ocfnull/ocfnull.c |  204 +++++
+ crypto/ocf/random.c          |  317 ++++++++
+ crypto/ocf/rndtest.c         |  300 +++++++
+ crypto/ocf/rndtest.h         |   54 ++
+ crypto/ocf/uio.h             |   54 ++
+ drivers/char/random.c        |   67 ++
+ fs/fcntl.c                   |    1 +
+ include/linux/miscdevice.h   |    1 +
+ include/linux/random.h       |   28 +
+ kernel/pid.c                 |    1 +
+ 23 files changed, 6988 insertions(+), 0 deletions(-)
+ create mode 100755 crypto/ocf/Config.in
+ create mode 100755 crypto/ocf/Kconfig
+ create mode 100755 crypto/ocf/Makefile
+ create mode 100644 crypto/ocf/criov.c
+ create mode 100644 crypto/ocf/crypto.c
+ create mode 100644 crypto/ocf/cryptodev.c
+ create mode 100644 crypto/ocf/cryptodev.h
+ create mode 100644 crypto/ocf/cryptosoft.c
+ create mode 100644 crypto/ocf/ocf-bench.c
+ create mode 100644 crypto/ocf/ocf-compat.h
+ create mode 100644 crypto/ocf/ocfnull/Makefile
+ create mode 100644 crypto/ocf/ocfnull/ocfnull.c
+ create mode 100644 crypto/ocf/random.c
+ create mode 100644 crypto/ocf/rndtest.c
+ create mode 100644 crypto/ocf/rndtest.h
+ create mode 100644 crypto/ocf/uio.h
+
+diff --git a/crypto/Kconfig b/crypto/Kconfig
+index 527a857..8871f10 100644
+--- a/crypto/Kconfig
++++ b/crypto/Kconfig
+@@ -923,3 +923,6 @@ config CRYPTO_USER_API_SKCIPHER
+ source "drivers/crypto/Kconfig"
+
+ endif	# if CRYPTO
++
++source "crypto/ocf/Kconfig"
++
+diff --git a/crypto/Makefile b/crypto/Makefile
+index 9e6eee2..3cde9f8 100644
+--- a/crypto/Makefile
++++ b/crypto/Makefile
+@@ -91,6 +91,8 @@ obj-$(CONFIG_CRYPTO_USER_API) += af_alg.o
+ obj-$(CONFIG_CRYPTO_USER_API_HASH) += algif_hash.o
+ obj-$(CONFIG_CRYPTO_USER_API_SKCIPHER) += algif_skcipher.o
+
++obj-$(CONFIG_OCF_OCF) += ocf/
++
+ #
+ # generic algorithms and the async_tx api
+ #
+diff --git a/crypto/ocf/Config.in b/crypto/ocf/Config.in
+new file mode 100755
+index 0000000..423d11f
+--- /dev/null
++++ b/crypto/ocf/Config.in
+@@ -0,0 +1,20 @@
++#############################################################################
++
++mainmenu_option next_comment
++comment 'OCF Configuration'
++tristate 'OCF (Open Cryptograhic Framework)' CONFIG_OCF_OCF
++dep_mbool '  enable fips RNG checks (fips check on RNG data before use)' \
++				CONFIG_OCF_FIPS $CONFIG_OCF_OCF
++dep_mbool '  enable harvesting entropy for /dev/random' \
++				CONFIG_OCF_RANDOMHARVEST $CONFIG_OCF_OCF
++dep_tristate '  cryptodev (user space support)' \
++				CONFIG_OCF_CRYPTODEV $CONFIG_OCF_OCF
++dep_tristate '  cryptosoft (software crypto engine)' \
++				CONFIG_OCF_CRYPTOSOFT $CONFIG_OCF_OCF
++dep_tristate '  ocfnull (does no crypto)' \
++				CONFIG_OCF_OCFNULL $CONFIG_OCF_OCF
++dep_tristate '  ocf-bench (HW crypto in-kernel benchmark)' \
++				CONFIG_OCF_BENCH $CONFIG_OCF_OCF
++endmenu
++
++#############################################################################
+diff --git a/crypto/ocf/Kconfig b/crypto/ocf/Kconfig
+new file mode 100755
+index 0000000..44459f4
+--- /dev/null
++++ b/crypto/ocf/Kconfig
+@@ -0,0 +1,48 @@
++menu "OCF Configuration"
++
++config OCF_OCF
++	tristate "OCF (Open Cryptograhic Framework)"
++	help
++	  A linux port of the OpenBSD/FreeBSD crypto framework.
++
++config OCF_RANDOMHARVEST
++	bool "crypto random --- harvest entropy for /dev/random"
++	depends on OCF_OCF
++	help
++	  Includes code to harvest random numbers from devices that support it.
++
++config OCF_FIPS
++	bool "enable fips RNG checks"
++	depends on OCF_OCF && OCF_RANDOMHARVEST
++	help
++	  Run all RNG provided data through a fips check before
++	  adding it /dev/random's entropy pool.
++
++config OCF_CRYPTODEV
++	tristate "cryptodev (user space support)"
++	depends on OCF_OCF
++	help
++	  The user space API to access crypto hardware.
++
++config OCF_CRYPTOSOFT
++	tristate "cryptosoft (software crypto engine)"
++	depends on OCF_OCF
++	help
++	  A software driver for the OCF framework that uses
++	  the kernel CryptoAPI.
++
++config OCF_OCFNULL
++	tristate "ocfnull (fake crypto engine)"
++	depends on OCF_OCF
++	help
++	  OCF driver for measuring ipsec overheads (does no crypto)
++
++config OCF_BENCH
++	tristate "ocf-bench (HW crypto in-kernel benchmark)"
++	depends on OCF_OCF
++	help
++	  A very simple encryption test for the in-kernel interface
++	  of OCF.  Also includes code to benchmark the IXP Access library
++	  for comparison.
++
++endmenu
+diff --git a/crypto/ocf/Makefile b/crypto/ocf/Makefile
+new file mode 100755
+index 0000000..29ac280
+--- /dev/null
++++ b/crypto/ocf/Makefile
+@@ -0,0 +1,138 @@
++# for SGlinux builds
++-include $(ROOTDIR)/modules/.config
++
++OCF_OBJS = crypto.o criov.o
++
++ifdef CONFIG_OCF_RANDOMHARVEST
++	OCF_OBJS += random.o
++endif
++
++ifdef CONFIG_OCF_FIPS
++	OCF_OBJS += rndtest.o
++endif
++
++# Add in autoconf.h to get #defines for CONFIG_xxx
++AUTOCONF_H=$(ROOTDIR)/modules/autoconf.h
++ifeq ($(AUTOCONF_H), $(wildcard $(AUTOCONF_H)))
++	EXTRA_CFLAGS += -include $(AUTOCONF_H)
++	export EXTRA_CFLAGS
++endif
++
++ifndef obj
++	obj ?= .
++	_obj = subdir
++	mod-subdirs := safe hifn ixp4xx talitos ocfnull
++	export-objs += crypto.o criov.o random.o
++	list-multi += ocf.o
++	_slash :=
++else
++	_obj = obj
++	_slash := /
++endif
++
++EXTRA_CFLAGS += -I$(obj)/.
++
++obj-$(CONFIG_OCF_OCF)         += ocf.o
++obj-$(CONFIG_OCF_CRYPTODEV)   += cryptodev.o
++obj-$(CONFIG_OCF_CRYPTOSOFT)  += cryptosoft.o
++obj-$(CONFIG_OCF_BENCH)       += ocf-bench.o
++
++$(_obj)-$(CONFIG_OCF_OCFNULL) += ocfnull$(_slash)
++
++ocf-objs := $(OCF_OBJS)
++
++dummy:
++	@echo "Please consult the README for how to build OCF."
++	@echo "If you can't wait then the following should do it:"
++	@echo ""
++	@echo "    make ocf_modules"
++	@echo "    sudo make ocf_install"
++	@echo ""
++	@exit 1
++
++$(list-multi) dummy1: $(ocf-objs)
++	$(LD) -r -o $@ $(ocf-objs)
++
++.PHONY:
++clean:
++	rm -f *.o *.ko .*.o.flags .*.ko.cmd .*.o.cmd .*.mod.o.cmd *.mod.c
++	rm -f */*.o */*.ko */.*.o.cmd */.*.ko.cmd */.*.mod.o.cmd */*.mod.c */.*.o.flags
++	rm -f */modules.order */modules.builtin modules.order modules.builtin
++
++ifdef TOPDIR
++-include $(TOPDIR)/Rules.make
++endif
++
++#
++# targets to build easily on the current machine
++#
++
++ocf_make:
++	make -C /lib/modules/$(shell uname -r)/build M=`pwd` $(OCF_TARGET) CONFIG_OCF_OCF=m
++	make -C /lib/modules/$(shell uname -r)/build M=`pwd` $(OCF_TARGET) CONFIG_OCF_OCF=m CONFIG_OCF_CRYPTOSOFT=m
++	-make -C /lib/modules/$(shell uname -r)/build M=`pwd` $(OCF_TARGET) CONFIG_OCF_OCF=m CONFIG_OCF_BENCH=m
++	-make -C /lib/modules/$(shell uname -r)/build M=`pwd` $(OCF_TARGET) CONFIG_OCF_OCF=m CONFIG_OCF_OCFNULL=m
++	-make -C /lib/modules/$(shell uname -r)/build M=`pwd` $(OCF_TARGET) CONFIG_OCF_OCF=m CONFIG_OCF_HIFN=m
++
++ocf_modules:
++	$(MAKE) ocf_make OCF_TARGET=modules
++
++ocf_install:
++	$(MAKE) ocf_make OCF_TARGET="modules modules_install"
++	depmod
++	mkdir -p /usr/include/crypto
++	cp cryptodev.h /usr/include/crypto/.
++
++#
++# generate full kernel patches for 2.4 and 2.6 kernels to make patching
++# your kernel easier
++#
++
++.PHONY: patch
++patch:
++	patchbase=.; \
++		[ -d $$patchbase/patches ] || patchbase=..; \
++		patch=ocf-linux-base.patch; \
++		patch24=ocf-linux-24.patch; \
++		patch26=ocf-linux-26.patch; \
++		patch3=ocf-linux-3.patch; \
++		( \
++			find . -name Makefile; \
++			find . -name Config.in; \
++			find . -name Kconfig; \
++			find . -name README; \
++			find . -name '*.[ch]' | grep -v '.mod.c'; \
++		) | while read t; do \
++			diff -Nau /dev/null $$t | sed 's?^+++ \./?+++ linux/crypto/ocf/?'; \
++		done > $$patch; \
++		cat $$patchbase/patches/linux-2.4.35-ocf.patch $$patch > $$patch24; \
++		cat $$patchbase/patches/linux-2.6.38-ocf.patch $$patch > $$patch26; \
++		cat $$patchbase/patches/linux-3.2.1-ocf.patch $$patch > $$patch3; \
++
++
++#
++# this target probably does nothing for anyone but me - davidm
++#
++
++.PHONY: release
++release:
++	REL=`date +%Y%m%d`; RELDIR=/tmp/ocf-linux-$$REL; \
++		CURDIR=`pwd`; \
++		rm -rf /tmp/ocf-linux-$$REL*; \
++		mkdir -p $$RELDIR/ocf; \
++		mkdir -p $$RELDIR/patches; \
++		mkdir -p $$RELDIR/crypto-tools; \
++		cp README* $$RELDIR/.; \
++		cp patches/[!C]* $$RELDIR/patches/.; \
++		cp tools/[!C]* $$RELDIR/crypto-tools/.; \
++		cp -r [!C]* Config.in $$RELDIR/ocf/.; \
++		rm -rf $$RELDIR/ocf/patches $$RELDIR/ocf/tools; \
++		rm -f $$RELDIR/ocf/README*; \
++		cp $$CURDIR/../../user/crypto-tools/[!C]* $$RELDIR/crypto-tools/.; \
++		make -C $$RELDIR/crypto-tools clean; \
++		make -C $$RELDIR/ocf clean; \
++		find $$RELDIR/ocf -name CVS | xargs rm -rf; \
++		cd $$RELDIR/..; \
++		tar cvf ocf-linux-$$REL.tar ocf-linux-$$REL; \
++		gzip -9 ocf-linux-$$REL.tar
++
+diff --git a/crypto/ocf/criov.c b/crypto/ocf/criov.c
+new file mode 100644
+index 0000000..a8c1a8c
+--- /dev/null
++++ b/crypto/ocf/criov.c
+@@ -0,0 +1,215 @@
++/*      $OpenBSD: criov.c,v 1.9 2002/01/29 15:48:29 jason Exp $	*/
++
++/*
++ * Linux port done by David McCullough <david_mccullough@mcafee.com>
++ * Copyright (C) 2006-2010 David McCullough
++ * Copyright (C) 2004-2005 Intel Corporation.
++ * The license and original author are listed below.
++ *
++ * Copyright (c) 1999 Theo de Raadt
++ *
++ * Redistribution and use in source and binary forms, with or without
++ * modification, are permitted provided that the following conditions
++ * are met:
++ *
++ * 1. Redistributions of source code must retain the above copyright
++ *   notice, this list of conditions and the following disclaimer.
++ * 2. Redistributions in binary form must reproduce the above copyright
++ *   notice, this list of conditions and the following disclaimer in the
++ *   documentation and/or other materials provided with the distribution.
++ * 3. The name of the author may not be used to endorse or promote products
++ *   derived from this software without specific prior written permission.
++ *
++ * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
++ * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
++ * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
++ * IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
++ * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
++ * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
++ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
++ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
++ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
++ * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
++ *
++__FBSDID("$FreeBSD: src/sys/opencrypto/criov.c,v 1.5 2006/06/04 22:15:13 pjd Exp $");
++ */
++
++#include <linux/version.h>
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,38) && !defined(AUTOCONF_INCLUDED)
++#include <linux/config.h>
++#endif
++#include <linux/module.h>
++#include <linux/init.h>
++#include <linux/slab.h>
++#include <linux/uio.h>
++#include <linux/skbuff.h>
++#include <linux/kernel.h>
++#include <linux/mm.h>
++#include <asm/io.h>
++
++#include <uio.h>
++#include <cryptodev.h>
++
++/*
++ * This macro is only for avoiding code duplication, as we need to skip
++ * given number of bytes in the same way in three functions below.
++ */
++#define	CUIO_SKIP()	do {						\
++	KASSERT(off >= 0, ("%s: off %d < 0", __func__, off));		\
++	KASSERT(len >= 0, ("%s: len %d < 0", __func__, len));		\
++	while (off > 0) {						\
++		KASSERT(iol >= 0, ("%s: empty in skip", __func__));	\
++		if (off < iov->iov_len)					\
++			break;						\
++		off -= iov->iov_len;					\
++		iol--;							\
++		iov++;							\
++	}								\
++} while (0)
++
++void
++cuio_copydata(struct uio* uio, int off, int len, caddr_t cp)
++{
++	struct iovec *iov = uio->uio_iov;
++	int iol = uio->uio_iovcnt;
++	unsigned count;
++
++	CUIO_SKIP();
++	while (len > 0) {
++		KASSERT(iol >= 0, ("%s: empty", __func__));
++		count = min((int)(iov->iov_len - off), len);
++		memcpy(cp, ((caddr_t)iov->iov_base) + off, count);
++		len -= count;
++		cp += count;
++		off = 0;
++		iol--;
++		iov++;
++	}
++}
++
++void
++cuio_copyback(struct uio* uio, int off, int len, caddr_t cp)
++{
++	struct iovec *iov = uio->uio_iov;
++	int iol = uio->uio_iovcnt;
++	unsigned count;
++
++	CUIO_SKIP();
++	while (len > 0) {
++		KASSERT(iol >= 0, ("%s: empty", __func__));
++		count = min((int)(iov->iov_len - off), len);
++		memcpy(((caddr_t)iov->iov_base) + off, cp, count);
++		len -= count;
++		cp += count;
++		off = 0;
++		iol--;
++		iov++;
++	}
++}
++
++/*
++ * Return a pointer to iov/offset of location in iovec list.
++ */
++struct iovec *
++cuio_getptr(struct uio *uio, int loc, int *off)
++{
++	struct iovec *iov = uio->uio_iov;
++	int iol = uio->uio_iovcnt;
++
++	while (loc >= 0) {
++		/* Normal end of search */
++		if (loc < iov->iov_len) {
++	    		*off = loc;
++	    		return (iov);
++		}
++
++		loc -= iov->iov_len;
++		if (iol == 0) {
++			if (loc == 0) {
++				/* Point at the end of valid data */
++				*off = iov->iov_len;
++				return (iov);
++			} else
++				return (NULL);
++		} else {
++			iov++, iol--;
++		}
++    	}
++
++	return (NULL);
++}
++
++EXPORT_SYMBOL(cuio_copyback);
++EXPORT_SYMBOL(cuio_copydata);
++EXPORT_SYMBOL(cuio_getptr);
++
++static void
++skb_copy_bits_back(struct sk_buff *skb, int offset, caddr_t cp, int len)
++{
++	int i;
++	if (offset < skb_headlen(skb)) {
++		memcpy(skb->data + offset, cp, min_t(int, skb_headlen(skb), len));
++		len -= skb_headlen(skb);
++		cp += skb_headlen(skb);
++	}
++	offset -= skb_headlen(skb);
++	for (i = 0; len > 0 && i < skb_shinfo(skb)->nr_frags; i++) {
++		if (offset < skb_shinfo(skb)->frags[i].size) {
++			memcpy(page_address(skb_frag_page(&skb_shinfo(skb)->frags[i])) +
++					skb_shinfo(skb)->frags[i].page_offset,
++					cp, min_t(int, skb_shinfo(skb)->frags[i].size, len));
++			len -= skb_shinfo(skb)->frags[i].size;
++			cp += skb_shinfo(skb)->frags[i].size;
++		}
++		offset -= skb_shinfo(skb)->frags[i].size;
++	}
++}
++
++void
++crypto_copyback(int flags, caddr_t buf, int off, int size, caddr_t in)
++{
++
++	if ((flags & CRYPTO_F_SKBUF) != 0)
++		skb_copy_bits_back((struct sk_buff *)buf, off, in, size);
++	else if ((flags & CRYPTO_F_IOV) != 0)
++		cuio_copyback((struct uio *)buf, off, size, in);
++	else
++		bcopy(in, buf + off, size);
++}
++
++void
++crypto_copydata(int flags, caddr_t buf, int off, int size, caddr_t out)
++{
++
++	if ((flags & CRYPTO_F_SKBUF) != 0)
++		skb_copy_bits((struct sk_buff *)buf, off, out, size);
++	else if ((flags & CRYPTO_F_IOV) != 0)
++		cuio_copydata((struct uio *)buf, off, size, out);
++	else
++		bcopy(buf + off, out, size);
++}
++
++int
++crypto_apply(int flags, caddr_t buf, int off, int len,
++    int (*f)(void *, void *, u_int), void *arg)
++{
++#if 0
++	int error;
++
++	if ((flags & CRYPTO_F_SKBUF) != 0)
++		error = XXXXXX((struct mbuf *)buf, off, len, f, arg);
++	else if ((flags & CRYPTO_F_IOV) != 0)
++		error = cuio_apply((struct uio *)buf, off, len, f, arg);
++	else
++		error = (*f)(arg, buf + off, len);
++	return (error);
++#else
++	KASSERT(0, ("crypto_apply not implemented!\n"));
++#endif
++	return 0;
++}
++
++EXPORT_SYMBOL(crypto_copyback);
++EXPORT_SYMBOL(crypto_copydata);
++EXPORT_SYMBOL(crypto_apply);
++
+diff --git a/crypto/ocf/crypto.c b/crypto/ocf/crypto.c
+new file mode 100644
+index 0000000..f48210d
+--- /dev/null
++++ b/crypto/ocf/crypto.c
+@@ -0,0 +1,1766 @@
++/*-
++ * Linux port done by David McCullough <david_mccullough@mcafee.com>
++ * Copyright (C) 2006-2010 David McCullough
++ * Copyright (C) 2004-2005 Intel Corporation.
++ * The license and original author are listed below.
++ *
++ * Redistribution and use in source and binary forms, with or without
++ * Copyright (c) 2002-2006 Sam Leffler.  All rights reserved.
++ *
++ * modification, are permitted provided that the following conditions
++ * are met:
++ * 1. Redistributions of source code must retain the above copyright
++ *    notice, this list of conditions and the following disclaimer.
++ * 2. Redistributions in binary form must reproduce the above copyright
++ *    notice, this list of conditions and the following disclaimer in the
++ *    documentation and/or other materials provided with the distribution.
++ *
++ * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
++ * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
++ * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
++ * IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
++ * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
++ * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
++ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
++ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
++ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
++ * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
++ */
++
++#if 0
++#include <sys/cdefs.h>
++__FBSDID("$FreeBSD: src/sys/opencrypto/crypto.c,v 1.27 2007/03/21 03:42:51 sam Exp $");
++#endif
++
++/*
++ * Cryptographic Subsystem.
++ *
++ * This code is derived from the Openbsd Cryptographic Framework (OCF)
++ * that has the copyright shown below.  Very little of the original
++ * code remains.
++ */
++/*-
++ * The author of this code is Angelos D. Keromytis (angelos@cis.upenn.edu)
++ *
++ * This code was written by Angelos D. Keromytis in Athens, Greece, in
++ * February 2000. Network Security Technologies Inc. (NSTI) kindly
++ * supported the development of this code.
++ *
++ * Copyright (c) 2000, 2001 Angelos D. Keromytis
++ *
++ * Permission to use, copy, and modify this software with or without fee
++ * is hereby granted, provided that this entire notice is included in
++ * all source code copies of any software which is or includes a copy or
++ * modification of this software.
++ *
++ * THIS SOFTWARE IS BEING PROVIDED "AS IS", WITHOUT ANY EXPRESS OR
++ * IMPLIED WARRANTY. IN PARTICULAR, NONE OF THE AUTHORS MAKES ANY
++ * REPRESENTATION OR WARRANTY OF ANY KIND CONCERNING THE
++ * MERCHANTABILITY OF THIS SOFTWARE OR ITS FITNESS FOR ANY PARTICULAR
++ * PURPOSE.
++ *
++__FBSDID("$FreeBSD: src/sys/opencrypto/crypto.c,v 1.16 2005/01/07 02:29:16 imp Exp $");
++ */
++
++
++#include <linux/version.h>
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,38) && !defined(AUTOCONF_INCLUDED)
++#include <linux/config.h>
++#endif
++#include <linux/module.h>
++#include <linux/init.h>
++#include <linux/list.h>
++#include <linux/slab.h>
++#include <linux/wait.h>
++#include <linux/sched.h>
++#include <linux/spinlock.h>
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,4)
++#include <linux/kthread.h>
++#endif
++#include <cryptodev.h>
++
++/*
++ * keep track of whether or not we have been initialised, a big
++ * issue if we are linked into the kernel and a driver gets started before
++ * us
++ */
++static int crypto_initted = 0;
++
++/*
++ * Crypto drivers register themselves by allocating a slot in the
++ * crypto_drivers table with crypto_get_driverid() and then registering
++ * each algorithm they support with crypto_register() and crypto_kregister().
++ */
++
++/*
++ * lock on driver table
++ * we track its state as spin_is_locked does not do anything on non-SMP boxes
++ */
++static spinlock_t	crypto_drivers_lock;
++static int			crypto_drivers_locked;		/* for non-SMP boxes */
++
++#define	CRYPTO_DRIVER_LOCK() \
++			({ \
++				spin_lock_irqsave(&crypto_drivers_lock, d_flags); \
++			 	crypto_drivers_locked = 1; \
++				dprintk("%s,%d: DRIVER_LOCK()\n", __FILE__, __LINE__); \
++			 })
++#define	CRYPTO_DRIVER_UNLOCK() \
++			({ \
++			 	dprintk("%s,%d: DRIVER_UNLOCK()\n", __FILE__, __LINE__); \
++			 	crypto_drivers_locked = 0; \
++				spin_unlock_irqrestore(&crypto_drivers_lock, d_flags); \
++			 })
++#define	CRYPTO_DRIVER_ASSERT() \
++			({ \
++			 	if (!crypto_drivers_locked) { \
++					dprintk("%s,%d: DRIVER_ASSERT!\n", __FILE__, __LINE__); \
++			 	} \
++			 })
++
++/*
++ * Crypto device/driver capabilities structure.
++ *
++ * Synchronization:
++ * (d) - protected by CRYPTO_DRIVER_LOCK()
++ * (q) - protected by CRYPTO_Q_LOCK()
++ * Not tagged fields are read-only.
++ */
++struct cryptocap {
++	device_t	cc_dev;			/* (d) device/driver */
++	u_int32_t	cc_sessions;		/* (d) # of sessions */
++	u_int32_t	cc_koperations;		/* (d) # os asym operations */
++	/*
++	 * Largest possible operator length (in bits) for each type of
++	 * encryption algorithm. XXX not used
++	 */
++	u_int16_t	cc_max_op_len[CRYPTO_ALGORITHM_MAX + 1];
++	u_int8_t	cc_alg[CRYPTO_ALGORITHM_MAX + 1];
++	u_int8_t	cc_kalg[CRK_ALGORITHM_MAX + 1];
++
++	int		cc_flags;		/* (d) flags */
++#define CRYPTOCAP_F_CLEANUP	0x80000000	/* needs resource cleanup */
++	int		cc_qblocked;		/* (q) symmetric q blocked */
++	int		cc_kqblocked;		/* (q) asymmetric q blocked */
++
++	int		cc_unqblocked;		/* (q) symmetric q blocked */
++	int		cc_unkqblocked;		/* (q) asymmetric q blocked */
++};
++static struct cryptocap *crypto_drivers = NULL;
++static int crypto_drivers_num = 0;
++
++/*
++ * There are two queues for crypto requests; one for symmetric (e.g.
++ * cipher) operations and one for asymmetric (e.g. MOD)operations.
++ * A single mutex is used to lock access to both queues.  We could
++ * have one per-queue but having one simplifies handling of block/unblock
++ * operations.
++ */
++static LIST_HEAD(crp_q);		/* crypto request queue */
++static LIST_HEAD(crp_kq);		/* asym request queue */
++
++static spinlock_t crypto_q_lock;
++
++int crypto_all_qblocked = 0;  /* protect with Q_LOCK */
++module_param(crypto_all_qblocked, int, 0444);
++MODULE_PARM_DESC(crypto_all_qblocked, "Are all crypto queues blocked");
++
++int crypto_all_kqblocked = 0; /* protect with Q_LOCK */
++module_param(crypto_all_kqblocked, int, 0444);
++MODULE_PARM_DESC(crypto_all_kqblocked, "Are all asym crypto queues blocked");
++
++#define	CRYPTO_Q_LOCK() \
++			({ \
++				spin_lock_irqsave(&crypto_q_lock, q_flags); \
++			 	dprintk("%s,%d: Q_LOCK()\n", __FILE__, __LINE__); \
++			 })
++#define	CRYPTO_Q_UNLOCK() \
++			({ \
++			 	dprintk("%s,%d: Q_UNLOCK()\n", __FILE__, __LINE__); \
++				spin_unlock_irqrestore(&crypto_q_lock, q_flags); \
++			 })
++
++/*
++ * There are two queues for processing completed crypto requests; one
++ * for the symmetric and one for the asymmetric ops.  We only need one
++ * but have two to avoid type futzing (cryptop vs. cryptkop).  A single
++ * mutex is used to lock access to both queues.  Note that this lock
++ * must be separate from the lock on request queues to insure driver
++ * callbacks don't generate lock order reversals.
++ */
++static LIST_HEAD(crp_ret_q);		/* callback queues */
++static LIST_HEAD(crp_ret_kq);
++
++static spinlock_t crypto_ret_q_lock;
++#define	CRYPTO_RETQ_LOCK() \
++			({ \
++				spin_lock_irqsave(&crypto_ret_q_lock, r_flags); \
++				dprintk("%s,%d: RETQ_LOCK\n", __FILE__, __LINE__); \
++			 })
++#define	CRYPTO_RETQ_UNLOCK() \
++			({ \
++			 	dprintk("%s,%d: RETQ_UNLOCK\n", __FILE__, __LINE__); \
++				spin_unlock_irqrestore(&crypto_ret_q_lock, r_flags); \
++			 })
++#define	CRYPTO_RETQ_EMPTY()	(list_empty(&crp_ret_q) && list_empty(&crp_ret_kq))
++
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,20)
++static kmem_cache_t *cryptop_zone;
++static kmem_cache_t *cryptodesc_zone;
++#else
++static struct kmem_cache *cryptop_zone;
++static struct kmem_cache *cryptodesc_zone;
++#endif
++
++#define debug crypto_debug
++int crypto_debug = 0;
++module_param(crypto_debug, int, 0644);
++MODULE_PARM_DESC(crypto_debug, "Enable debug");
++EXPORT_SYMBOL(crypto_debug);
++
++/*
++ * Maximum number of outstanding crypto requests before we start
++ * failing requests.  We need this to prevent DOS when too many
++ * requests are arriving for us to keep up.  Otherwise we will
++ * run the system out of memory.  Since crypto is slow,  we are
++ * usually the bottleneck that needs to say, enough is enough.
++ *
++ * We cannot print errors when this condition occurs,  we are already too
++ * slow,  printing anything will just kill us
++ */
++
++static int crypto_q_cnt = 0;
++module_param(crypto_q_cnt, int, 0444);
++MODULE_PARM_DESC(crypto_q_cnt,
++		"Current number of outstanding crypto requests");
++
++static int crypto_q_max = 1000;
++module_param(crypto_q_max, int, 0644);
++MODULE_PARM_DESC(crypto_q_max,
++		"Maximum number of outstanding crypto requests");
++
++#define bootverbose crypto_verbose
++static int crypto_verbose = 0;
++module_param(crypto_verbose, int, 0644);
++MODULE_PARM_DESC(crypto_verbose,
++		"Enable verbose crypto startup");
++
++int	crypto_usercrypto = 1;	/* userland may do crypto reqs */
++module_param(crypto_usercrypto, int, 0644);
++MODULE_PARM_DESC(crypto_usercrypto,
++	   "Enable/disable user-mode access to crypto support");
++
++int	crypto_userasymcrypto = 1;	/* userland may do asym crypto reqs */
++module_param(crypto_userasymcrypto, int, 0644);
++MODULE_PARM_DESC(crypto_userasymcrypto,
++	   "Enable/disable user-mode access to asymmetric crypto support");
++
++int	crypto_devallowsoft = 0;	/* only use hardware crypto */
++module_param(crypto_devallowsoft, int, 0644);
++MODULE_PARM_DESC(crypto_devallowsoft,
++	   "Enable/disable use of software crypto support");
++
++/*
++ * This parameter controls the maximum number of crypto operations to
++ * do consecutively in the crypto kernel thread before scheduling to allow
++ * other processes to run. Without it, it is possible to get into a
++ * situation where the crypto thread never allows any other processes to run.
++ * Default to 1000 which should be less than one second.
++ */
++static int crypto_max_loopcount = 1000;
++module_param(crypto_max_loopcount, int, 0644);
++MODULE_PARM_DESC(crypto_max_loopcount,
++	   "Maximum number of crypto ops to do before yielding to other processes");
++
++#ifndef CONFIG_NR_CPUS
++#define CONFIG_NR_CPUS 1
++#endif
++
++static struct task_struct *cryptoproc[CONFIG_NR_CPUS];
++static struct task_struct *cryptoretproc[CONFIG_NR_CPUS];
++static DECLARE_WAIT_QUEUE_HEAD(cryptoproc_wait);
++static DECLARE_WAIT_QUEUE_HEAD(cryptoretproc_wait);
++
++static	int crypto_proc(void *arg);
++static	int crypto_ret_proc(void *arg);
++static	int crypto_invoke(struct cryptocap *cap, struct cryptop *crp, int hint);
++static	int crypto_kinvoke(struct cryptkop *krp, int flags);
++static	void crypto_exit(void);
++static  int crypto_init(void);
++
++static	struct cryptostats cryptostats;
++
++static struct cryptocap *
++crypto_checkdriver(u_int32_t hid)
++{
++	if (crypto_drivers == NULL)
++		return NULL;
++	return (hid >= crypto_drivers_num ? NULL : &crypto_drivers[hid]);
++}
++
++/*
++ * Compare a driver's list of supported algorithms against another
++ * list; return non-zero if all algorithms are supported.
++ */
++static int
++driver_suitable(const struct cryptocap *cap, const struct cryptoini *cri)
++{
++	const struct cryptoini *cr;
++
++	/* See if all the algorithms are supported. */
++	for (cr = cri; cr; cr = cr->cri_next)
++		if (cap->cc_alg[cr->cri_alg] == 0)
++			return 0;
++	return 1;
++}
++
++
++/*
++ * Select a driver for a new session that supports the specified
++ * algorithms and, optionally, is constrained according to the flags.
++ * The algorithm we use here is pretty stupid; just use the
++ * first driver that supports all the algorithms we need. If there
++ * are multiple drivers we choose the driver with the fewest active
++ * sessions.  We prefer hardware-backed drivers to software ones.
++ *
++ * XXX We need more smarts here (in real life too, but that's
++ * XXX another story altogether).
++ */
++static struct cryptocap *
++crypto_select_driver(const struct cryptoini *cri, int flags)
++{
++	struct cryptocap *cap, *best;
++	int match, hid;
++
++	CRYPTO_DRIVER_ASSERT();
++
++	/*
++	 * Look first for hardware crypto devices if permitted.
++	 */
++	if (flags & CRYPTOCAP_F_HARDWARE)
++		match = CRYPTOCAP_F_HARDWARE;
++	else
++		match = CRYPTOCAP_F_SOFTWARE;
++	best = NULL;
++again:
++	for (hid = 0; hid < crypto_drivers_num; hid++) {
++		cap = &crypto_drivers[hid];
++		/*
++		 * If it's not initialized, is in the process of
++		 * going away, or is not appropriate (hardware
++		 * or software based on match), then skip.
++		 */
++		if (cap->cc_dev == NULL ||
++		    (cap->cc_flags & CRYPTOCAP_F_CLEANUP) ||
++		    (cap->cc_flags & match) == 0)
++			continue;
++
++		/* verify all the algorithms are supported. */
++		if (driver_suitable(cap, cri)) {
++			if (best == NULL ||
++			    cap->cc_sessions < best->cc_sessions)
++				best = cap;
++		}
++	}
++	if (best != NULL)
++		return best;
++	if (match == CRYPTOCAP_F_HARDWARE && (flags & CRYPTOCAP_F_SOFTWARE)) {
++		/* sort of an Algol 68-style for loop */
++		match = CRYPTOCAP_F_SOFTWARE;
++		goto again;
++	}
++	return best;
++}
++
++/*
++ * Create a new session.  The crid argument specifies a crypto
++ * driver to use or constraints on a driver to select (hardware
++ * only, software only, either).  Whatever driver is selected
++ * must be capable of the requested crypto algorithms.
++ */
++int
++crypto_newsession(u_int64_t *sid, struct cryptoini *cri, int crid)
++{
++	struct cryptocap *cap;
++	u_int32_t hid, lid;
++	int err;
++	unsigned long d_flags;
++
++	CRYPTO_DRIVER_LOCK();
++	if ((crid & (CRYPTOCAP_F_HARDWARE | CRYPTOCAP_F_SOFTWARE)) == 0) {
++		/*
++		 * Use specified driver; verify it is capable.
++		 */
++		cap = crypto_checkdriver(crid);
++		if (cap != NULL && !driver_suitable(cap, cri))
++			cap = NULL;
++	} else {
++		/*
++		 * No requested driver; select based on crid flags.
++		 */
++		cap = crypto_select_driver(cri, crid);
++		/*
++		 * if NULL then can't do everything in one session.
++		 * XXX Fix this. We need to inject a "virtual" session
++		 * XXX layer right about here.
++		 */
++	}
++	if (cap != NULL) {
++		/* Call the driver initialization routine. */
++		hid = cap - crypto_drivers;
++		lid = hid;		/* Pass the driver ID. */
++		cap->cc_sessions++;
++		CRYPTO_DRIVER_UNLOCK();
++		err = CRYPTODEV_NEWSESSION(cap->cc_dev, &lid, cri);
++		CRYPTO_DRIVER_LOCK();
++		if (err == 0) {
++			(*sid) = (cap->cc_flags & 0xff000000)
++			       | (hid & 0x00ffffff);
++			(*sid) <<= 32;
++			(*sid) |= (lid & 0xffffffff);
++		} else
++			cap->cc_sessions--;
++	} else
++		err = EINVAL;
++	CRYPTO_DRIVER_UNLOCK();
++	return err;
++}
++
++static void
++crypto_remove(struct cryptocap *cap)
++{
++	CRYPTO_DRIVER_ASSERT();
++	if (cap->cc_sessions == 0 && cap->cc_koperations == 0)
++		bzero(cap, sizeof(*cap));
++}
++
++/*
++ * Delete an existing session (or a reserved session on an unregistered
++ * driver).
++ */
++int
++crypto_freesession(u_int64_t sid)
++{
++	struct cryptocap *cap;
++	u_int32_t hid;
++	int err = 0;
++	unsigned long d_flags;
++
++	dprintk("%s()\n", __FUNCTION__);
++	CRYPTO_DRIVER_LOCK();
++
++	if (crypto_drivers == NULL) {
++		err = EINVAL;
++		goto done;
++	}
++
++	/* Determine two IDs. */
++	hid = CRYPTO_SESID2HID(sid);
++
++	if (hid >= crypto_drivers_num) {
++		dprintk("%s - INVALID DRIVER NUM %d\n", __FUNCTION__, hid);
++		err = ENOENT;
++		goto done;
++	}
++	cap = &crypto_drivers[hid];
++
++	if (cap->cc_dev) {
++		CRYPTO_DRIVER_UNLOCK();
++		/* Call the driver cleanup routine, if available, unlocked. */
++		err = CRYPTODEV_FREESESSION(cap->cc_dev, sid);
++		CRYPTO_DRIVER_LOCK();
++	}
++
++	if (cap->cc_sessions)
++		cap->cc_sessions--;
++
++	if (cap->cc_flags & CRYPTOCAP_F_CLEANUP)
++		crypto_remove(cap);
++
++done:
++	CRYPTO_DRIVER_UNLOCK();
++	return err;
++}
++
++/*
++ * Return an unused driver id.  Used by drivers prior to registering
++ * support for the algorithms they handle.
++ */
++int32_t
++crypto_get_driverid(device_t dev, int flags)
++{
++	struct cryptocap *newdrv;
++	int i;
++	unsigned long d_flags;
++
++	if ((flags & (CRYPTOCAP_F_HARDWARE | CRYPTOCAP_F_SOFTWARE)) == 0) {
++		printf("%s: no flags specified when registering driver\n",
++		    device_get_nameunit(dev));
++		return -1;
++	}
++
++	CRYPTO_DRIVER_LOCK();
++
++	for (i = 0; i < crypto_drivers_num; i++) {
++		if (crypto_drivers[i].cc_dev == NULL &&
++		    (crypto_drivers[i].cc_flags & CRYPTOCAP_F_CLEANUP) == 0) {
++			break;
++		}
++	}
++
++	/* Out of entries, allocate some more. */
++	if (i == crypto_drivers_num) {
++		/* Be careful about wrap-around. */
++		if (2 * crypto_drivers_num <= crypto_drivers_num) {
++			CRYPTO_DRIVER_UNLOCK();
++			printk("crypto: driver count wraparound!\n");
++			return -1;
++		}
++
++		newdrv = kmalloc(2 * crypto_drivers_num * sizeof(struct cryptocap),
++				GFP_KERNEL);
++		if (newdrv == NULL) {
++			CRYPTO_DRIVER_UNLOCK();
++			printk("crypto: no space to expand driver table!\n");
++			return -1;
++		}
++
++		memcpy(newdrv, crypto_drivers,
++				crypto_drivers_num * sizeof(struct cryptocap));
++		memset(&newdrv[crypto_drivers_num], 0,
++				crypto_drivers_num * sizeof(struct cryptocap));
++
++		crypto_drivers_num *= 2;
++
++		kfree(crypto_drivers);
++		crypto_drivers = newdrv;
++	}
++
++	/* NB: state is zero'd on free */
++	crypto_drivers[i].cc_sessions = 1;	/* Mark */
++	crypto_drivers[i].cc_dev = dev;
++	crypto_drivers[i].cc_flags = flags;
++	if (bootverbose)
++		printf("crypto: assign %s driver id %u, flags %u\n",
++		    device_get_nameunit(dev), i, flags);
++
++	CRYPTO_DRIVER_UNLOCK();
++
++	return i;
++}
++
++/*
++ * Lookup a driver by name.  We match against the full device
++ * name and unit, and against just the name.  The latter gives
++ * us a simple widlcarding by device name.  On success return the
++ * driver/hardware identifier; otherwise return -1.
++ */
++int
++crypto_find_driver(const char *match)
++{
++	int i, len = strlen(match);
++	unsigned long d_flags;
++
++	CRYPTO_DRIVER_LOCK();
++	for (i = 0; i < crypto_drivers_num; i++) {
++		device_t dev = crypto_drivers[i].cc_dev;
++		if (dev == NULL ||
++		    (crypto_drivers[i].cc_flags & CRYPTOCAP_F_CLEANUP))
++			continue;
++		if (strncmp(match, device_get_nameunit(dev), len) == 0 ||
++		    strncmp(match, device_get_name(dev), len) == 0)
++			break;
++	}
++	CRYPTO_DRIVER_UNLOCK();
++	return i < crypto_drivers_num ? i : -1;
++}
++
++/*
++ * Return the device_t for the specified driver or NULL
++ * if the driver identifier is invalid.
++ */
++device_t
++crypto_find_device_byhid(int hid)
++{
++	struct cryptocap *cap = crypto_checkdriver(hid);
++	return cap != NULL ? cap->cc_dev : NULL;
++}
++
++/*
++ * Return the device/driver capabilities.
++ */
++int
++crypto_getcaps(int hid)
++{
++	struct cryptocap *cap = crypto_checkdriver(hid);
++	return cap != NULL ? cap->cc_flags : 0;
++}
++
++/*
++ * Register support for a key-related algorithm.  This routine
++ * is called once for each algorithm supported a driver.
++ */
++int
++crypto_kregister(u_int32_t driverid, int kalg, u_int32_t flags)
++{
++	struct cryptocap *cap;
++	int err;
++	unsigned long d_flags;
++
++	dprintk("%s()\n", __FUNCTION__);
++	CRYPTO_DRIVER_LOCK();
++
++	cap = crypto_checkdriver(driverid);
++	if (cap != NULL &&
++	    (CRK_ALGORITM_MIN <= kalg && kalg <= CRK_ALGORITHM_MAX)) {
++		/*
++		 * XXX Do some performance testing to determine placing.
++		 * XXX We probably need an auxiliary data structure that
++		 * XXX describes relative performances.
++		 */
++
++		cap->cc_kalg[kalg] = flags | CRYPTO_ALG_FLAG_SUPPORTED;
++		if (bootverbose)
++			printf("crypto: %s registers key alg %u flags %u\n"
++				, device_get_nameunit(cap->cc_dev)
++				, kalg
++				, flags
++			);
++		err = 0;
++	} else
++		err = EINVAL;
++
++	CRYPTO_DRIVER_UNLOCK();
++	return err;
++}
++
++/*
++ * Register support for a non-key-related algorithm.  This routine
++ * is called once for each such algorithm supported by a driver.
++ */
++int
++crypto_register(u_int32_t driverid, int alg, u_int16_t maxoplen,
++    u_int32_t flags)
++{
++	struct cryptocap *cap;
++	int err;
++	unsigned long d_flags;
++
++	dprintk("%s(id=0x%x, alg=%d, maxoplen=%d, flags=0x%x)\n", __FUNCTION__,
++			driverid, alg, maxoplen, flags);
++
++	CRYPTO_DRIVER_LOCK();
++
++	cap = crypto_checkdriver(driverid);
++	/* NB: algorithms are in the range [1..max] */
++	if (cap != NULL &&
++	    (CRYPTO_ALGORITHM_MIN <= alg && alg <= CRYPTO_ALGORITHM_MAX)) {
++		/*
++		 * XXX Do some performance testing to determine placing.
++		 * XXX We probably need an auxiliary data structure that
++		 * XXX describes relative performances.
++		 */
++
++		cap->cc_alg[alg] = flags | CRYPTO_ALG_FLAG_SUPPORTED;
++		cap->cc_max_op_len[alg] = maxoplen;
++		if (bootverbose)
++			printf("crypto: %s registers alg %u flags %u maxoplen %u\n"
++				, device_get_nameunit(cap->cc_dev)
++				, alg
++				, flags
++				, maxoplen
++			);
++		cap->cc_sessions = 0;		/* Unmark */
++		err = 0;
++	} else
++		err = EINVAL;
++
++	CRYPTO_DRIVER_UNLOCK();
++	return err;
++}
++
++static void
++driver_finis(struct cryptocap *cap)
++{
++	u_int32_t ses, kops;
++
++	CRYPTO_DRIVER_ASSERT();
++
++	ses = cap->cc_sessions;
++	kops = cap->cc_koperations;
++	bzero(cap, sizeof(*cap));
++	if (ses != 0 || kops != 0) {
++		/*
++		 * If there are pending sessions,
++		 * just mark as invalid.
++		 */
++		cap->cc_flags |= CRYPTOCAP_F_CLEANUP;
++		cap->cc_sessions = ses;
++		cap->cc_koperations = kops;
++	}
++}
++
++/*
++ * Unregister a crypto driver. If there are pending sessions using it,
++ * leave enough information around so that subsequent calls using those
++ * sessions will correctly detect the driver has been unregistered and
++ * reroute requests.
++ */
++int
++crypto_unregister(u_int32_t driverid, int alg)
++{
++	struct cryptocap *cap;
++	int i, err;
++	unsigned long d_flags;
++
++	dprintk("%s()\n", __FUNCTION__);
++	CRYPTO_DRIVER_LOCK();
++
++	cap = crypto_checkdriver(driverid);
++	if (cap != NULL &&
++	    (CRYPTO_ALGORITHM_MIN <= alg && alg <= CRYPTO_ALGORITHM_MAX) &&
++	    cap->cc_alg[alg] != 0) {
++		cap->cc_alg[alg] = 0;
++		cap->cc_max_op_len[alg] = 0;
++
++		/* Was this the last algorithm ? */
++		for (i = 1; i <= CRYPTO_ALGORITHM_MAX; i++)
++			if (cap->cc_alg[i] != 0)
++				break;
++
++		if (i == CRYPTO_ALGORITHM_MAX + 1)
++			driver_finis(cap);
++		err = 0;
++	} else
++		err = EINVAL;
++	CRYPTO_DRIVER_UNLOCK();
++	return err;
++}
++
++/*
++ * Unregister all algorithms associated with a crypto driver.
++ * If there are pending sessions using it, leave enough information
++ * around so that subsequent calls using those sessions will
++ * correctly detect the driver has been unregistered and reroute
++ * requests.
++ */
++int
++crypto_unregister_all(u_int32_t driverid)
++{
++	struct cryptocap *cap;
++	int err;
++	unsigned long d_flags;
++
++	dprintk("%s()\n", __FUNCTION__);
++	CRYPTO_DRIVER_LOCK();
++	cap = crypto_checkdriver(driverid);
++	if (cap != NULL) {
++		driver_finis(cap);
++		err = 0;
++	} else
++		err = EINVAL;
++	CRYPTO_DRIVER_UNLOCK();
++
++	return err;
++}
++
++/*
++ * Clear blockage on a driver.  The what parameter indicates whether
++ * the driver is now ready for cryptop's and/or cryptokop's.
++ */
++int
++crypto_unblock(u_int32_t driverid, int what)
++{
++	struct cryptocap *cap;
++	int err;
++	unsigned long q_flags;
++
++	CRYPTO_Q_LOCK();
++	cap = crypto_checkdriver(driverid);
++	if (cap != NULL) {
++		if (what & CRYPTO_SYMQ) {
++			cap->cc_qblocked = 0;
++			cap->cc_unqblocked = 0;
++			crypto_all_qblocked = 0;
++		}
++		if (what & CRYPTO_ASYMQ) {
++			cap->cc_kqblocked = 0;
++			cap->cc_unkqblocked = 0;
++			crypto_all_kqblocked = 0;
++		}
++		wake_up_interruptible(&cryptoproc_wait);
++		err = 0;
++	} else
++		err = EINVAL;
++	CRYPTO_Q_UNLOCK(); //DAVIDM should this be a driver lock
++
++	return err;
++}
++
++/*
++ * Add a crypto request to a queue, to be processed by the kernel thread.
++ */
++int
++crypto_dispatch(struct cryptop *crp)
++{
++	struct cryptocap *cap;
++	int result = -1;
++	unsigned long q_flags;
++
++	dprintk("%s()\n", __FUNCTION__);
++
++	cryptostats.cs_ops++;
++
++	CRYPTO_Q_LOCK();
++	if (crypto_q_cnt >= crypto_q_max) {
++		cryptostats.cs_drops++;
++		CRYPTO_Q_UNLOCK();
++		return ENOMEM;
++	}
++	crypto_q_cnt++;
++
++	/* make sure we are starting a fresh run on this crp. */
++	crp->crp_flags &= ~CRYPTO_F_DONE;
++	crp->crp_etype = 0;
++
++	/*
++	 * Caller marked the request to be processed immediately; dispatch
++	 * it directly to the driver unless the driver is currently blocked.
++	 */
++	if ((crp->crp_flags & CRYPTO_F_BATCH) == 0) {
++		int hid = CRYPTO_SESID2HID(crp->crp_sid);
++		cap = crypto_checkdriver(hid);
++		/* Driver cannot disappear when there is an active session. */
++		KASSERT(cap != NULL, ("%s: Driver disappeared.", __func__));
++		if (!cap->cc_qblocked) {
++			crypto_all_qblocked = 0;
++			crypto_drivers[hid].cc_unqblocked = 1;
++			CRYPTO_Q_UNLOCK();
++			result = crypto_invoke(cap, crp, 0);
++			CRYPTO_Q_LOCK();
++			if (result == ERESTART)
++				if (crypto_drivers[hid].cc_unqblocked)
++					crypto_drivers[hid].cc_qblocked = 1;
++			crypto_drivers[hid].cc_unqblocked = 0;
++		}
++	}
++	if (result == ERESTART) {
++		/*
++		 * The driver ran out of resources, mark the
++		 * driver ``blocked'' for cryptop's and put
++		 * the request back in the queue.  It would
++		 * best to put the request back where we got
++		 * it but that's hard so for now we put it
++		 * at the front.  This should be ok; putting
++		 * it at the end does not work.
++		 */
++		list_add(&crp->crp_next, &crp_q);
++		cryptostats.cs_blocks++;
++		result = 0;
++	} else if (result == -1) {
++		TAILQ_INSERT_TAIL(&crp_q, crp, crp_next);
++		result = 0;
++	}
++	wake_up_interruptible(&cryptoproc_wait);
++	CRYPTO_Q_UNLOCK();
++	return result;
++}
++
++/*
++ * Add an asymetric crypto request to a queue,
++ * to be processed by the kernel thread.
++ */
++int
++crypto_kdispatch(struct cryptkop *krp)
++{
++	int error;
++	unsigned long q_flags;
++
++	cryptostats.cs_kops++;
++
++	error = crypto_kinvoke(krp, krp->krp_crid);
++	if (error == ERESTART) {
++		CRYPTO_Q_LOCK();
++		TAILQ_INSERT_TAIL(&crp_kq, krp, krp_next);
++		wake_up_interruptible(&cryptoproc_wait);
++		CRYPTO_Q_UNLOCK();
++		error = 0;
++	}
++	return error;
++}
++
++/*
++ * Verify a driver is suitable for the specified operation.
++ */
++static __inline int
++kdriver_suitable(const struct cryptocap *cap, const struct cryptkop *krp)
++{
++	return (cap->cc_kalg[krp->krp_op] & CRYPTO_ALG_FLAG_SUPPORTED) != 0;
++}
++
++/*
++ * Select a driver for an asym operation.  The driver must
++ * support the necessary algorithm.  The caller can constrain
++ * which device is selected with the flags parameter.  The
++ * algorithm we use here is pretty stupid; just use the first
++ * driver that supports the algorithms we need. If there are
++ * multiple suitable drivers we choose the driver with the
++ * fewest active operations.  We prefer hardware-backed
++ * drivers to software ones when either may be used.
++ */
++static struct cryptocap *
++crypto_select_kdriver(const struct cryptkop *krp, int flags)
++{
++	struct cryptocap *cap, *best, *blocked;
++	int match, hid;
++
++	CRYPTO_DRIVER_ASSERT();
++
++	/*
++	 * Look first for hardware crypto devices if permitted.
++	 */
++	if (flags & CRYPTOCAP_F_HARDWARE)
++		match = CRYPTOCAP_F_HARDWARE;
++	else
++		match = CRYPTOCAP_F_SOFTWARE;
++	best = NULL;
++	blocked = NULL;
++again:
++	for (hid = 0; hid < crypto_drivers_num; hid++) {
++		cap = &crypto_drivers[hid];
++		/*
++		 * If it's not initialized, is in the process of
++		 * going away, or is not appropriate (hardware
++		 * or software based on match), then skip.
++		 */
++		if (cap->cc_dev == NULL ||
++		    (cap->cc_flags & CRYPTOCAP_F_CLEANUP) ||
++		    (cap->cc_flags & match) == 0)
++			continue;
++
++		/* verify all the algorithms are supported. */
++		if (kdriver_suitable(cap, krp)) {
++			if (best == NULL ||
++			    cap->cc_koperations < best->cc_koperations)
++				best = cap;
++		}
++	}
++	if (best != NULL)
++		return best;
++	if (match == CRYPTOCAP_F_HARDWARE && (flags & CRYPTOCAP_F_SOFTWARE)) {
++		/* sort of an Algol 68-style for loop */
++		match = CRYPTOCAP_F_SOFTWARE;
++		goto again;
++	}
++	return best;
++}
++
++/*
++ * Dispatch an assymetric crypto request.
++ */
++static int
++crypto_kinvoke(struct cryptkop *krp, int crid)
++{
++	struct cryptocap *cap = NULL;
++	int error;
++	unsigned long d_flags;
++
++	KASSERT(krp != NULL, ("%s: krp == NULL", __func__));
++	KASSERT(krp->krp_callback != NULL,
++	    ("%s: krp->crp_callback == NULL", __func__));
++
++	CRYPTO_DRIVER_LOCK();
++	if ((crid & (CRYPTOCAP_F_HARDWARE | CRYPTOCAP_F_SOFTWARE)) == 0) {
++		cap = crypto_checkdriver(crid);
++		if (cap != NULL) {
++			/*
++			 * Driver present, it must support the necessary
++			 * algorithm and, if s/w drivers are excluded,
++			 * it must be registered as hardware-backed.
++			 */
++			if (!kdriver_suitable(cap, krp) ||
++			    (!crypto_devallowsoft &&
++			     (cap->cc_flags & CRYPTOCAP_F_HARDWARE) == 0))
++				cap = NULL;
++		}
++	} else {
++		/*
++		 * No requested driver; select based on crid flags.
++		 */
++		if (!crypto_devallowsoft)	/* NB: disallow s/w drivers */
++			crid &= ~CRYPTOCAP_F_SOFTWARE;
++		cap = crypto_select_kdriver(krp, crid);
++	}
++	if (cap != NULL && !cap->cc_kqblocked) {
++		krp->krp_hid = cap - crypto_drivers;
++		cap->cc_koperations++;
++		CRYPTO_DRIVER_UNLOCK();
++		error = CRYPTODEV_KPROCESS(cap->cc_dev, krp, 0);
++		CRYPTO_DRIVER_LOCK();
++		if (error == ERESTART) {
++			cap->cc_koperations--;
++			CRYPTO_DRIVER_UNLOCK();
++			return (error);
++		}
++		/* return the actual device used */
++		krp->krp_crid = krp->krp_hid;
++	} else {
++		/*
++		 * NB: cap is !NULL if device is blocked; in
++		 *     that case return ERESTART so the operation
++		 *     is resubmitted if possible.
++		 */
++		error = (cap == NULL) ? ENODEV : ERESTART;
++	}
++	CRYPTO_DRIVER_UNLOCK();
++
++	if (error) {
++		krp->krp_status = error;
++		crypto_kdone(krp);
++	}
++	return 0;
++}
++
++
++/*
++ * Dispatch a crypto request to the appropriate crypto devices.
++ */
++static int
++crypto_invoke(struct cryptocap *cap, struct cryptop *crp, int hint)
++{
++	KASSERT(crp != NULL, ("%s: crp == NULL", __func__));
++	KASSERT(crp->crp_callback != NULL,
++	    ("%s: crp->crp_callback == NULL", __func__));
++	KASSERT(crp->crp_desc != NULL, ("%s: crp->crp_desc == NULL", __func__));
++
++	dprintk("%s()\n", __FUNCTION__);
++
++#ifdef CRYPTO_TIMING
++	if (crypto_timing)
++		crypto_tstat(&cryptostats.cs_invoke, &crp->crp_tstamp);
++#endif
++	if (cap->cc_flags & CRYPTOCAP_F_CLEANUP) {
++		struct cryptodesc *crd;
++		u_int64_t nid;
++
++		/*
++		 * Driver has unregistered; migrate the session and return
++		 * an error to the caller so they'll resubmit the op.
++		 *
++		 * XXX: What if there are more already queued requests for this
++		 *      session?
++		 */
++		crypto_freesession(crp->crp_sid);
++
++		for (crd = crp->crp_desc; crd->crd_next; crd = crd->crd_next)
++			crd->CRD_INI.cri_next = &(crd->crd_next->CRD_INI);
++
++		/* XXX propagate flags from initial session? */
++		if (crypto_newsession(&nid, &(crp->crp_desc->CRD_INI),
++		    CRYPTOCAP_F_HARDWARE | CRYPTOCAP_F_SOFTWARE) == 0)
++			crp->crp_sid = nid;
++
++		crp->crp_etype = EAGAIN;
++		crypto_done(crp);
++		return 0;
++	} else {
++		/*
++		 * Invoke the driver to process the request.
++		 */
++		return CRYPTODEV_PROCESS(cap->cc_dev, crp, hint);
++	}
++}
++
++/*
++ * Release a set of crypto descriptors.
++ */
++void
++crypto_freereq(struct cryptop *crp)
++{
++	struct cryptodesc *crd;
++
++	if (crp == NULL)
++		return;
++
++#ifdef DIAGNOSTIC
++	{
++		struct cryptop *crp2;
++		unsigned long q_flags;
++
++		CRYPTO_Q_LOCK();
++		TAILQ_FOREACH(crp2, &crp_q, crp_next) {
++			KASSERT(crp2 != crp,
++			    ("Freeing cryptop from the crypto queue (%p).",
++			    crp));
++		}
++		CRYPTO_Q_UNLOCK();
++		CRYPTO_RETQ_LOCK();
++		TAILQ_FOREACH(crp2, &crp_ret_q, crp_next) {
++			KASSERT(crp2 != crp,
++			    ("Freeing cryptop from the return queue (%p).",
++			    crp));
++		}
++		CRYPTO_RETQ_UNLOCK();
++	}
++#endif
++
++	while ((crd = crp->crp_desc) != NULL) {
++		crp->crp_desc = crd->crd_next;
++		kmem_cache_free(cryptodesc_zone, crd);
++	}
++	kmem_cache_free(cryptop_zone, crp);
++}
++
++/*
++ * Acquire a set of crypto descriptors.
++ */
++struct cryptop *
++crypto_getreq(int num)
++{
++	struct cryptodesc *crd;
++	struct cryptop *crp;
++
++	crp = kmem_cache_alloc(cryptop_zone, SLAB_ATOMIC);
++	if (crp != NULL) {
++		memset(crp, 0, sizeof(*crp));
++		INIT_LIST_HEAD(&crp->crp_next);
++		init_waitqueue_head(&crp->crp_waitq);
++		while (num--) {
++			crd = kmem_cache_alloc(cryptodesc_zone, SLAB_ATOMIC);
++			if (crd == NULL) {
++				crypto_freereq(crp);
++				return NULL;
++			}
++			memset(crd, 0, sizeof(*crd));
++			crd->crd_next = crp->crp_desc;
++			crp->crp_desc = crd;
++		}
++	}
++	return crp;
++}
++
++/*
++ * Invoke the callback on behalf of the driver.
++ */
++void
++crypto_done(struct cryptop *crp)
++{
++	unsigned long q_flags;
++
++	dprintk("%s()\n", __FUNCTION__);
++	if ((crp->crp_flags & CRYPTO_F_DONE) == 0) {
++		crp->crp_flags |= CRYPTO_F_DONE;
++		CRYPTO_Q_LOCK();
++		crypto_q_cnt--;
++		CRYPTO_Q_UNLOCK();
++	} else
++		printk("crypto: crypto_done op already done, flags 0x%x",
++				crp->crp_flags);
++	if (crp->crp_etype != 0)
++		cryptostats.cs_errs++;
++	/*
++	 * CBIMM means unconditionally do the callback immediately;
++	 * CBIFSYNC means do the callback immediately only if the
++	 * operation was done synchronously.  Both are used to avoid
++	 * doing extraneous context switches; the latter is mostly
++	 * used with the software crypto driver.
++	 */
++	if ((crp->crp_flags & CRYPTO_F_CBIMM) ||
++	    ((crp->crp_flags & CRYPTO_F_CBIFSYNC) &&
++	     (CRYPTO_SESID2CAPS(crp->crp_sid) & CRYPTOCAP_F_SYNC))) {
++		/*
++		 * Do the callback directly.  This is ok when the
++		 * callback routine does very little (e.g. the
++		 * /dev/crypto callback method just does a wakeup).
++		 */
++		crp->crp_callback(crp);
++	} else {
++		unsigned long r_flags;
++		/*
++		 * Normal case; queue the callback for the thread.
++		 */
++		CRYPTO_RETQ_LOCK();
++		wake_up_interruptible(&cryptoretproc_wait);/* shared wait channel */
++		TAILQ_INSERT_TAIL(&crp_ret_q, crp, crp_next);
++		CRYPTO_RETQ_UNLOCK();
++	}
++}
++
++/*
++ * Invoke the callback on behalf of the driver.
++ */
++void
++crypto_kdone(struct cryptkop *krp)
++{
++	struct cryptocap *cap;
++	unsigned long d_flags;
++
++	if ((krp->krp_flags & CRYPTO_KF_DONE) != 0)
++		printk("crypto: crypto_kdone op already done, flags 0x%x",
++				krp->krp_flags);
++	krp->krp_flags |= CRYPTO_KF_DONE;
++	if (krp->krp_status != 0)
++		cryptostats.cs_kerrs++;
++
++	CRYPTO_DRIVER_LOCK();
++	/* XXX: What if driver is loaded in the meantime? */
++	if (krp->krp_hid < crypto_drivers_num) {
++		cap = &crypto_drivers[krp->krp_hid];
++		cap->cc_koperations--;
++		KASSERT(cap->cc_koperations >= 0, ("cc_koperations < 0"));
++		if (cap->cc_flags & CRYPTOCAP_F_CLEANUP)
++			crypto_remove(cap);
++	}
++	CRYPTO_DRIVER_UNLOCK();
++
++	/*
++	 * CBIMM means unconditionally do the callback immediately;
++	 * This is used to avoid doing extraneous context switches
++	 */
++	if ((krp->krp_flags & CRYPTO_KF_CBIMM)) {
++		/*
++		 * Do the callback directly.  This is ok when the
++		 * callback routine does very little (e.g. the
++		 * /dev/crypto callback method just does a wakeup).
++		 */
++		krp->krp_callback(krp);
++	} else {
++		unsigned long r_flags;
++		/*
++		 * Normal case; queue the callback for the thread.
++		 */
++		CRYPTO_RETQ_LOCK();
++		wake_up_interruptible(&cryptoretproc_wait);/* shared wait channel */
++		TAILQ_INSERT_TAIL(&crp_ret_kq, krp, krp_next);
++		CRYPTO_RETQ_UNLOCK();
++	}
++}
++
++int
++crypto_getfeat(int *featp)
++{
++	int hid, kalg, feat = 0;
++	unsigned long d_flags;
++
++	CRYPTO_DRIVER_LOCK();
++	for (hid = 0; hid < crypto_drivers_num; hid++) {
++		const struct cryptocap *cap = &crypto_drivers[hid];
++
++		if ((cap->cc_flags & CRYPTOCAP_F_SOFTWARE) &&
++		    !crypto_devallowsoft) {
++			continue;
++		}
++		for (kalg = 0; kalg < CRK_ALGORITHM_MAX; kalg++)
++			if (cap->cc_kalg[kalg] & CRYPTO_ALG_FLAG_SUPPORTED)
++				feat |=  1 << kalg;
++	}
++	CRYPTO_DRIVER_UNLOCK();
++	*featp = feat;
++	return (0);
++}
++
++/*
++ * Crypto thread, dispatches crypto requests.
++ */
++static int
++crypto_proc(void *arg)
++{
++	struct cryptop *crp, *submit;
++	struct cryptkop *krp, *krpp;
++	struct cryptocap *cap;
++	u_int32_t hid;
++	int result, hint;
++	unsigned long q_flags;
++	int loopcount = 0;
++
++	set_current_state(TASK_INTERRUPTIBLE);
++
++	CRYPTO_Q_LOCK();
++	for (;;) {
++		/*
++		 * we need to make sure we don't get into a busy loop with nothing
++		 * to do,  the two crypto_all_*blocked vars help us find out when
++		 * we are all full and can do nothing on any driver or Q.  If so we
++		 * wait for an unblock.
++		 */
++		crypto_all_qblocked  = !list_empty(&crp_q);
++
++		/*
++		 * Find the first element in the queue that can be
++		 * processed and look-ahead to see if multiple ops
++		 * are ready for the same driver.
++		 */
++		submit = NULL;
++		hint = 0;
++		list_for_each_entry(crp, &crp_q, crp_next) {
++			hid = CRYPTO_SESID2HID(crp->crp_sid);
++			cap = crypto_checkdriver(hid);
++			/*
++			 * Driver cannot disappear when there is an active
++			 * session.
++			 */
++			KASSERT(cap != NULL, ("%s:%u Driver disappeared.",
++			    __func__, __LINE__));
++			if (cap == NULL || cap->cc_dev == NULL) {
++				/* Op needs to be migrated, process it. */
++				if (submit == NULL)
++					submit = crp;
++				break;
++			}
++			if (!cap->cc_qblocked) {
++				if (submit != NULL) {
++					/*
++					 * We stop on finding another op,
++					 * regardless whether its for the same
++					 * driver or not.  We could keep
++					 * searching the queue but it might be
++					 * better to just use a per-driver
++					 * queue instead.
++					 */
++					if (CRYPTO_SESID2HID(submit->crp_sid) == hid)
++						hint = CRYPTO_HINT_MORE;
++					break;
++				} else {
++					submit = crp;
++					if ((submit->crp_flags & CRYPTO_F_BATCH) == 0)
++						break;
++					/* keep scanning for more are q'd */
++				}
++			}
++		}
++		if (submit != NULL) {
++			hid = CRYPTO_SESID2HID(submit->crp_sid);
++			crypto_all_qblocked = 0;
++			list_del(&submit->crp_next);
++			crypto_drivers[hid].cc_unqblocked = 1;
++			cap = crypto_checkdriver(hid);
++			CRYPTO_Q_UNLOCK();
++			KASSERT(cap != NULL, ("%s:%u Driver disappeared.",
++			    __func__, __LINE__));
++			result = crypto_invoke(cap, submit, hint);
++			CRYPTO_Q_LOCK();
++			if (result == ERESTART) {
++				/*
++				 * The driver ran out of resources, mark the
++				 * driver ``blocked'' for cryptop's and put
++				 * the request back in the queue.  It would
++				 * best to put the request back where we got
++				 * it but that's hard so for now we put it
++				 * at the front.  This should be ok; putting
++				 * it at the end does not work.
++				 */
++				/* XXX validate sid again? */
++				list_add(&submit->crp_next, &crp_q);
++				cryptostats.cs_blocks++;
++				if (crypto_drivers[hid].cc_unqblocked)
++					crypto_drivers[hid].cc_qblocked=0;
++				crypto_drivers[hid].cc_unqblocked=0;
++			}
++			crypto_drivers[hid].cc_unqblocked = 0;
++		}
++
++		crypto_all_kqblocked = !list_empty(&crp_kq);
++
++		/* As above, but for key ops */
++		krp = NULL;
++		list_for_each_entry(krpp, &crp_kq, krp_next) {
++			cap = crypto_checkdriver(krpp->krp_hid);
++			if (cap == NULL || cap->cc_dev == NULL) {
++				/*
++				 * Operation needs to be migrated, invalidate
++				 * the assigned device so it will reselect a
++				 * new one below.  Propagate the original
++				 * crid selection flags if supplied.
++				 */
++				krp->krp_hid = krp->krp_crid &
++				    (CRYPTOCAP_F_SOFTWARE|CRYPTOCAP_F_HARDWARE);
++				if (krp->krp_hid == 0)
++					krp->krp_hid =
++				    CRYPTOCAP_F_SOFTWARE|CRYPTOCAP_F_HARDWARE;
++				break;
++			}
++			if (!cap->cc_kqblocked) {
++				krp = krpp;
++				break;
++			}
++		}
++		if (krp != NULL) {
++			crypto_all_kqblocked = 0;
++			list_del(&krp->krp_next);
++			crypto_drivers[krp->krp_hid].cc_kqblocked = 1;
++			CRYPTO_Q_UNLOCK();
++			result = crypto_kinvoke(krp, krp->krp_hid);
++			CRYPTO_Q_LOCK();
++			if (result == ERESTART) {
++				/*
++				 * The driver ran out of resources, mark the
++				 * driver ``blocked'' for cryptkop's and put
++				 * the request back in the queue.  It would
++				 * best to put the request back where we got
++				 * it but that's hard so for now we put it
++				 * at the front.  This should be ok; putting
++				 * it at the end does not work.
++				 */
++				/* XXX validate sid again? */
++				list_add(&krp->krp_next, &crp_kq);
++				cryptostats.cs_kblocks++;
++			} else
++				crypto_drivers[krp->krp_hid].cc_kqblocked = 0;
++		}
++
++		if (submit == NULL && krp == NULL) {
++			/*
++			 * Nothing more to be processed.  Sleep until we're
++			 * woken because there are more ops to process.
++			 * This happens either by submission or by a driver
++			 * becoming unblocked and notifying us through
++			 * crypto_unblock.  Note that when we wakeup we
++			 * start processing each queue again from the
++			 * front. It's not clear that it's important to
++			 * preserve this ordering since ops may finish
++			 * out of order if dispatched to different devices
++			 * and some become blocked while others do not.
++			 */
++			dprintk("%s - sleeping (qe=%d qb=%d kqe=%d kqb=%d)\n",
++					__FUNCTION__,
++					list_empty(&crp_q), crypto_all_qblocked,
++					list_empty(&crp_kq), crypto_all_kqblocked);
++			loopcount = 0;
++			CRYPTO_Q_UNLOCK();
++			wait_event_interruptible(cryptoproc_wait,
++					!(list_empty(&crp_q) || crypto_all_qblocked) ||
++					!(list_empty(&crp_kq) || crypto_all_kqblocked) ||
++					kthread_should_stop());
++			if (signal_pending (current)) {
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,0)
++				spin_lock_irq(&current->sigmask_lock);
++#endif
++				flush_signals(current);
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,0)
++				spin_unlock_irq(&current->sigmask_lock);
++#endif
++			}
++			CRYPTO_Q_LOCK();
++			dprintk("%s - awake\n", __FUNCTION__);
++			if (kthread_should_stop())
++				break;
++			cryptostats.cs_intrs++;
++		} else if (loopcount > crypto_max_loopcount) {
++			/*
++			 * Give other processes a chance to run if we've
++			 * been using the CPU exclusively for a while.
++			 */
++			loopcount = 0;
++			CRYPTO_Q_UNLOCK();
++			schedule();
++			CRYPTO_Q_LOCK();
++		}
++		loopcount++;
++	}
++	CRYPTO_Q_UNLOCK();
++	return 0;
++}
++
++/*
++ * Crypto returns thread, does callbacks for processed crypto requests.
++ * Callbacks are done here, rather than in the crypto drivers, because
++ * callbacks typically are expensive and would slow interrupt handling.
++ */
++static int
++crypto_ret_proc(void *arg)
++{
++	struct cryptop *crpt;
++	struct cryptkop *krpt;
++	unsigned long  r_flags;
++
++	set_current_state(TASK_INTERRUPTIBLE);
++
++	CRYPTO_RETQ_LOCK();
++	for (;;) {
++		/* Harvest return q's for completed ops */
++		crpt = NULL;
++		if (!list_empty(&crp_ret_q))
++			crpt = list_entry(crp_ret_q.next, typeof(*crpt), crp_next);
++		if (crpt != NULL)
++			list_del(&crpt->crp_next);
++
++		krpt = NULL;
++		if (!list_empty(&crp_ret_kq))
++			krpt = list_entry(crp_ret_kq.next, typeof(*krpt), krp_next);
++		if (krpt != NULL)
++			list_del(&krpt->krp_next);
++
++		if (crpt != NULL || krpt != NULL) {
++			CRYPTO_RETQ_UNLOCK();
++			/*
++			 * Run callbacks unlocked.
++			 */
++			if (crpt != NULL)
++				crpt->crp_callback(crpt);
++			if (krpt != NULL)
++				krpt->krp_callback(krpt);
++			CRYPTO_RETQ_LOCK();
++		} else {
++			/*
++			 * Nothing more to be processed.  Sleep until we're
++			 * woken because there are more returns to process.
++			 */
++			dprintk("%s - sleeping\n", __FUNCTION__);
++			CRYPTO_RETQ_UNLOCK();
++			wait_event_interruptible(cryptoretproc_wait,
++					!list_empty(&crp_ret_q) ||
++					!list_empty(&crp_ret_kq) ||
++					kthread_should_stop());
++			if (signal_pending (current)) {
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,0)
++				spin_lock_irq(&current->sigmask_lock);
++#endif
++				flush_signals(current);
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,0)
++				spin_unlock_irq(&current->sigmask_lock);
++#endif
++			}
++			CRYPTO_RETQ_LOCK();
++			dprintk("%s - awake\n", __FUNCTION__);
++			if (kthread_should_stop()) {
++				dprintk("%s - EXITING!\n", __FUNCTION__);
++				break;
++			}
++			cryptostats.cs_rets++;
++		}
++	}
++	CRYPTO_RETQ_UNLOCK();
++	return 0;
++}
++
++
++#if 0 /* should put this into /proc or something */
++static void
++db_show_drivers(void)
++{
++	int hid;
++
++	db_printf("%12s %4s %4s %8s %2s %2s\n"
++		, "Device"
++		, "Ses"
++		, "Kops"
++		, "Flags"
++		, "QB"
++		, "KB"
++	);
++	for (hid = 0; hid < crypto_drivers_num; hid++) {
++		const struct cryptocap *cap = &crypto_drivers[hid];
++		if (cap->cc_dev == NULL)
++			continue;
++		db_printf("%-12s %4u %4u %08x %2u %2u\n"
++		    , device_get_nameunit(cap->cc_dev)
++		    , cap->cc_sessions
++		    , cap->cc_koperations
++		    , cap->cc_flags
++		    , cap->cc_qblocked
++		    , cap->cc_kqblocked
++		);
++	}
++}
++
++DB_SHOW_COMMAND(crypto, db_show_crypto)
++{
++	struct cryptop *crp;
++
++	db_show_drivers();
++	db_printf("\n");
++
++	db_printf("%4s %8s %4s %4s %4s %4s %8s %8s\n",
++	    "HID", "Caps", "Ilen", "Olen", "Etype", "Flags",
++	    "Desc", "Callback");
++	TAILQ_FOREACH(crp, &crp_q, crp_next) {
++		db_printf("%4u %08x %4u %4u %4u %04x %8p %8p\n"
++		    , (int) CRYPTO_SESID2HID(crp->crp_sid)
++		    , (int) CRYPTO_SESID2CAPS(crp->crp_sid)
++		    , crp->crp_ilen, crp->crp_olen
++		    , crp->crp_etype
++		    , crp->crp_flags
++		    , crp->crp_desc
++		    , crp->crp_callback
++		);
++	}
++	if (!TAILQ_EMPTY(&crp_ret_q)) {
++		db_printf("\n%4s %4s %4s %8s\n",
++		    "HID", "Etype", "Flags", "Callback");
++		TAILQ_FOREACH(crp, &crp_ret_q, crp_next) {
++			db_printf("%4u %4u %04x %8p\n"
++			    , (int) CRYPTO_SESID2HID(crp->crp_sid)
++			    , crp->crp_etype
++			    , crp->crp_flags
++			    , crp->crp_callback
++			);
++		}
++	}
++}
++
++DB_SHOW_COMMAND(kcrypto, db_show_kcrypto)
++{
++	struct cryptkop *krp;
++
++	db_show_drivers();
++	db_printf("\n");
++
++	db_printf("%4s %5s %4s %4s %8s %4s %8s\n",
++	    "Op", "Status", "#IP", "#OP", "CRID", "HID", "Callback");
++	TAILQ_FOREACH(krp, &crp_kq, krp_next) {
++		db_printf("%4u %5u %4u %4u %08x %4u %8p\n"
++		    , krp->krp_op
++		    , krp->krp_status
++		    , krp->krp_iparams, krp->krp_oparams
++		    , krp->krp_crid, krp->krp_hid
++		    , krp->krp_callback
++		);
++	}
++	if (!TAILQ_EMPTY(&crp_ret_q)) {
++		db_printf("%4s %5s %8s %4s %8s\n",
++		    "Op", "Status", "CRID", "HID", "Callback");
++		TAILQ_FOREACH(krp, &crp_ret_kq, krp_next) {
++			db_printf("%4u %5u %08x %4u %8p\n"
++			    , krp->krp_op
++			    , krp->krp_status
++			    , krp->krp_crid, krp->krp_hid
++			    , krp->krp_callback
++			);
++		}
++	}
++}
++#endif
++
++
++static int
++crypto_init(void)
++{
++	int error;
++	unsigned long cpu;
++
++	dprintk("%s(%p)\n", __FUNCTION__, (void *) crypto_init);
++
++	if (crypto_initted)
++		return 0;
++	crypto_initted = 1;
++
++	spin_lock_init(&crypto_drivers_lock);
++	spin_lock_init(&crypto_q_lock);
++	spin_lock_init(&crypto_ret_q_lock);
++
++	cryptop_zone = kmem_cache_create("cryptop", sizeof(struct cryptop),
++				       0, SLAB_HWCACHE_ALIGN, NULL
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,23)
++				       , NULL
++#endif
++					);
++
++	cryptodesc_zone = kmem_cache_create("cryptodesc", sizeof(struct cryptodesc),
++				       0, SLAB_HWCACHE_ALIGN, NULL
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,23)
++				       , NULL
++#endif
++					);
++
++	if (cryptodesc_zone == NULL || cryptop_zone == NULL) {
++		printk("crypto: crypto_init cannot setup crypto zones\n");
++		error = ENOMEM;
++		goto bad;
++	}
++
++	crypto_drivers_num = CRYPTO_DRIVERS_INITIAL;
++	crypto_drivers = kmalloc(crypto_drivers_num * sizeof(struct cryptocap),
++			GFP_KERNEL);
++	if (crypto_drivers == NULL) {
++		printk("crypto: crypto_init cannot setup crypto drivers\n");
++		error = ENOMEM;
++		goto bad;
++	}
++
++	memset(crypto_drivers, 0, crypto_drivers_num * sizeof(struct cryptocap));
++
++	ocf_for_each_cpu(cpu) {
++		cryptoproc[cpu] = kthread_create(crypto_proc, (void *) cpu,
++									"ocf_%d", (int) cpu);
++		if (IS_ERR(cryptoproc[cpu])) {
++			error = PTR_ERR(cryptoproc[cpu]);
++			printk("crypto: crypto_init cannot start crypto thread; error %d",
++				error);
++			goto bad;
++		}
++		kthread_bind(cryptoproc[cpu], cpu);
++		wake_up_process(cryptoproc[cpu]);
++
++		cryptoretproc[cpu] = kthread_create(crypto_ret_proc, (void *) cpu,
++									"ocf_ret_%d", (int) cpu);
++		if (IS_ERR(cryptoretproc[cpu])) {
++			error = PTR_ERR(cryptoretproc[cpu]);
++			printk("crypto: crypto_init cannot start cryptoret thread; error %d",
++					error);
++			goto bad;
++		}
++		kthread_bind(cryptoretproc[cpu], cpu);
++		wake_up_process(cryptoretproc[cpu]);
++	}
++
++	return 0;
++bad:
++	crypto_exit();
++	return error;
++}
++
++
++static void
++crypto_exit(void)
++{
++	int cpu;
++
++	dprintk("%s()\n", __FUNCTION__);
++
++	/*
++	 * Terminate any crypto threads.
++	 */
++	ocf_for_each_cpu(cpu) {
++		kthread_stop(cryptoproc[cpu]);
++		kthread_stop(cryptoretproc[cpu]);
++	}
++
++	/*
++	 * Reclaim dynamically allocated resources.
++	 */
++	if (crypto_drivers != NULL)
++		kfree(crypto_drivers);
++
++	if (cryptodesc_zone != NULL)
++		kmem_cache_destroy(cryptodesc_zone);
++	if (cryptop_zone != NULL)
++		kmem_cache_destroy(cryptop_zone);
++}
++
++
++EXPORT_SYMBOL(crypto_newsession);
++EXPORT_SYMBOL(crypto_freesession);
++EXPORT_SYMBOL(crypto_get_driverid);
++EXPORT_SYMBOL(crypto_kregister);
++EXPORT_SYMBOL(crypto_register);
++EXPORT_SYMBOL(crypto_unregister);
++EXPORT_SYMBOL(crypto_unregister_all);
++EXPORT_SYMBOL(crypto_unblock);
++EXPORT_SYMBOL(crypto_dispatch);
++EXPORT_SYMBOL(crypto_kdispatch);
++EXPORT_SYMBOL(crypto_freereq);
++EXPORT_SYMBOL(crypto_getreq);
++EXPORT_SYMBOL(crypto_done);
++EXPORT_SYMBOL(crypto_kdone);
++EXPORT_SYMBOL(crypto_getfeat);
++EXPORT_SYMBOL(crypto_userasymcrypto);
++EXPORT_SYMBOL(crypto_getcaps);
++EXPORT_SYMBOL(crypto_find_driver);
++EXPORT_SYMBOL(crypto_find_device_byhid);
++
++module_init(crypto_init);
++module_exit(crypto_exit);
++
++MODULE_LICENSE("BSD");
++MODULE_AUTHOR("David McCullough <david_mccullough@mcafee.com>");
++MODULE_DESCRIPTION("OCF (OpenBSD Cryptographic Framework)");
+diff --git a/crypto/ocf/cryptodev.c b/crypto/ocf/cryptodev.c
+new file mode 100644
+index 0000000..2ee3618
+--- /dev/null
++++ b/crypto/ocf/cryptodev.c
+@@ -0,0 +1,1069 @@
++/*	$OpenBSD: cryptodev.c,v 1.52 2002/06/19 07:22:46 deraadt Exp $	*/
++
++/*-
++ * Linux port done by David McCullough <david_mccullough@mcafee.com>
++ * Copyright (C) 2006-2010 David McCullough
++ * Copyright (C) 2004-2005 Intel Corporation.
++ * The license and original author are listed below.
++ *
++ * Copyright (c) 2001 Theo de Raadt
++ * Copyright (c) 2002-2006 Sam Leffler, Errno Consulting
++ *
++ * Redistribution and use in source and binary forms, with or without
++ * modification, are permitted provided that the following conditions
++ * are met:
++ *
++ * 1. Redistributions of source code must retain the above copyright
++ *   notice, this list of conditions and the following disclaimer.
++ * 2. Redistributions in binary form must reproduce the above copyright
++ *   notice, this list of conditions and the following disclaimer in the
++ *   documentation and/or other materials provided with the distribution.
++ * 3. The name of the author may not be used to endorse or promote products
++ *   derived from this software without specific prior written permission.
++ *
++ * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
++ * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
++ * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
++ * IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
++ * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
++ * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
++ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
++ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
++ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
++ * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
++ *
++ * Effort sponsored in part by the Defense Advanced Research Projects
++ * Agency (DARPA) and Air Force Research Laboratory, Air Force
++ * Materiel Command, USAF, under agreement number F30602-01-2-0537.
++ *
++__FBSDID("$FreeBSD: src/sys/opencrypto/cryptodev.c,v 1.34 2007/05/09 19:37:02 gnn Exp $");
++ */
++
++#include <linux/version.h>
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,38) && !defined(AUTOCONF_INCLUDED)
++#include <linux/config.h>
++#endif
++#include <linux/types.h>
++#include <linux/time.h>
++#include <linux/delay.h>
++#include <linux/list.h>
++#include <linux/init.h>
++#include <linux/sched.h>
++#include <linux/unistd.h>
++#include <linux/module.h>
++#include <linux/wait.h>
++#include <linux/slab.h>
++#include <linux/fs.h>
++#include <linux/dcache.h>
++#include <linux/file.h>
++#include <linux/mount.h>
++#include <linux/miscdevice.h>
++#include <asm/uaccess.h>
++
++#include <cryptodev.h>
++#include <uio.h>
++
++extern asmlinkage long sys_dup(unsigned int fildes);
++
++#define debug cryptodev_debug
++int cryptodev_debug = 0;
++module_param(cryptodev_debug, int, 0644);
++MODULE_PARM_DESC(cryptodev_debug, "Enable cryptodev debug");
++
++struct csession_info {
++	u_int16_t	blocksize;
++	u_int16_t	minkey, maxkey;
++
++	u_int16_t	keysize;
++	/* u_int16_t	hashsize;  */
++	u_int16_t	authsize;
++	u_int16_t	authkey;
++	/* u_int16_t	ctxsize; */
++};
++
++struct csession {
++	struct list_head	list;
++	u_int64_t	sid;
++	u_int32_t	ses;
++
++	wait_queue_head_t waitq;
++
++	u_int32_t	cipher;
++
++	u_int32_t	mac;
++
++	caddr_t		key;
++	int		keylen;
++	u_char		tmp_iv[EALG_MAX_BLOCK_LEN];
++
++	caddr_t		mackey;
++	int		mackeylen;
++
++	struct csession_info info;
++
++	struct iovec	iovec;
++	struct uio	uio;
++	int		error;
++};
++
++struct fcrypt {
++	struct list_head	csessions;
++	int		sesn;
++};
++
++static struct csession *csefind(struct fcrypt *, u_int);
++static int csedelete(struct fcrypt *, struct csession *);
++static struct csession *cseadd(struct fcrypt *, struct csession *);
++static struct csession *csecreate(struct fcrypt *, u_int64_t,
++		struct cryptoini *crie, struct cryptoini *cria, struct csession_info *);
++static int csefree(struct csession *);
++
++static	int cryptodev_op(struct csession *, struct crypt_op *);
++static	int cryptodev_key(struct crypt_kop *);
++static	int cryptodev_find(struct crypt_find_op *);
++
++static int cryptodev_cb(void *);
++static int cryptodev_open(struct inode *inode, struct file *filp);
++
++/*
++ * Check a crypto identifier to see if it requested
++ * a valid crid and it's capabilities match.
++ */
++static int
++checkcrid(int crid)
++{
++	int hid = crid & ~(CRYPTOCAP_F_SOFTWARE | CRYPTOCAP_F_HARDWARE);
++	int typ = crid & (CRYPTOCAP_F_SOFTWARE | CRYPTOCAP_F_HARDWARE);
++	int caps = 0;
++
++	/* if the user hasn't selected a driver, then just call newsession */
++	if (hid == 0 && typ != 0)
++		return 0;
++
++	caps = crypto_getcaps(hid);
++
++	/* didn't find anything with capabilities */
++	if (caps == 0) {
++		dprintk("%s: hid=%x typ=%x not matched\n", __FUNCTION__, hid, typ);
++		return EINVAL;
++	}
++
++	/* the user didn't specify SW or HW, so the driver is ok */
++	if (typ == 0)
++		return 0;
++
++	/* if the type specified didn't match */
++	if (typ != (caps & (CRYPTOCAP_F_SOFTWARE | CRYPTOCAP_F_HARDWARE))) {
++		dprintk("%s: hid=%x typ=%x caps=%x not matched\n", __FUNCTION__,
++				hid, typ, caps);
++		return EINVAL;
++	}
++
++	return 0;
++}
++
++static int
++cryptodev_op(struct csession *cse, struct crypt_op *cop)
++{
++	struct cryptop *crp = NULL;
++	struct cryptodesc *crde = NULL, *crda = NULL;
++	int error = 0;
++
++	dprintk("%s()\n", __FUNCTION__);
++	if (cop->len > CRYPTO_MAX_DATA_LEN) {
++		dprintk("%s: %d > %d\n", __FUNCTION__, cop->len, CRYPTO_MAX_DATA_LEN);
++		return (E2BIG);
++	}
++
++	if (cse->info.blocksize && (cop->len % cse->info.blocksize) != 0) {
++		dprintk("%s: blocksize=%d len=%d\n", __FUNCTION__, cse->info.blocksize,
++				cop->len);
++		return (EINVAL);
++	}
++
++	cse->uio.uio_iov = &cse->iovec;
++	cse->uio.uio_iovcnt = 1;
++	cse->uio.uio_offset = 0;
++#if 0
++	cse->uio.uio_resid = cop->len;
++	cse->uio.uio_segflg = UIO_SYSSPACE;
++	cse->uio.uio_rw = UIO_WRITE;
++	cse->uio.uio_td = td;
++#endif
++	cse->uio.uio_iov[0].iov_len = cop->len;
++	if (cse->info.authsize)
++		cse->uio.uio_iov[0].iov_len += cse->info.authsize;
++	cse->uio.uio_iov[0].iov_base = kmalloc(cse->uio.uio_iov[0].iov_len,
++			GFP_KERNEL);
++
++	if (cse->uio.uio_iov[0].iov_base == NULL) {
++		dprintk("%s: iov_base kmalloc(%d) failed\n", __FUNCTION__,
++				(int)cse->uio.uio_iov[0].iov_len);
++		return (ENOMEM);
++	}
++
++	crp = crypto_getreq((cse->info.blocksize != 0) + (cse->info.authsize != 0));
++	if (crp == NULL) {
++		dprintk("%s: ENOMEM\n", __FUNCTION__);
++		error = ENOMEM;
++		goto bail;
++	}
++
++	if (cse->info.authsize && cse->info.blocksize) {
++		if (cop->op == COP_ENCRYPT) {
++			crde = crp->crp_desc;
++			crda = crde->crd_next;
++		} else {
++			crda = crp->crp_desc;
++			crde = crda->crd_next;
++		}
++	} else if (cse->info.authsize) {
++		crda = crp->crp_desc;
++	} else if (cse->info.blocksize) {
++		crde = crp->crp_desc;
++	} else {
++		dprintk("%s: bad request\n", __FUNCTION__);
++		error = EINVAL;
++		goto bail;
++	}
++
++	if ((error = copy_from_user(cse->uio.uio_iov[0].iov_base, cop->src,
++					cop->len))) {
++		dprintk("%s: bad copy\n", __FUNCTION__);
++		goto bail;
++	}
++
++	if (crda) {
++		crda->crd_skip = 0;
++		crda->crd_len = cop->len;
++		crda->crd_inject = cop->len;
++
++		crda->crd_alg = cse->mac;
++		crda->crd_key = cse->mackey;
++		crda->crd_klen = cse->mackeylen * 8;
++	}
++
++	if (crde) {
++		if (cop->op == COP_ENCRYPT)
++			crde->crd_flags |= CRD_F_ENCRYPT;
++		else
++			crde->crd_flags &= ~CRD_F_ENCRYPT;
++		crde->crd_len = cop->len;
++		crde->crd_inject = 0;
++
++		crde->crd_alg = cse->cipher;
++		crde->crd_key = cse->key;
++		crde->crd_klen = cse->keylen * 8;
++	}
++
++	crp->crp_ilen = cse->uio.uio_iov[0].iov_len;
++	crp->crp_flags = CRYPTO_F_IOV | CRYPTO_F_CBIMM
++		       | (cop->flags & COP_F_BATCH);
++	crp->crp_buf = (caddr_t)&cse->uio;
++	crp->crp_callback = (int (*) (struct cryptop *)) cryptodev_cb;
++	crp->crp_sid = cse->sid;
++	crp->crp_opaque = (void *)cse;
++
++	if (cop->iv) {
++		if (crde == NULL) {
++			error = EINVAL;
++			dprintk("%s no crde\n", __FUNCTION__);
++			goto bail;
++		}
++		if (cse->cipher == CRYPTO_ARC4) { /* XXX use flag? */
++			error = EINVAL;
++			dprintk("%s arc4 with IV\n", __FUNCTION__);
++			goto bail;
++		}
++		if ((error = copy_from_user(cse->tmp_iv, cop->iv,
++						cse->info.blocksize))) {
++			dprintk("%s bad iv copy\n", __FUNCTION__);
++			goto bail;
++		}
++		memcpy(crde->crd_iv, cse->tmp_iv, cse->info.blocksize);
++		crde->crd_flags |= CRD_F_IV_EXPLICIT | CRD_F_IV_PRESENT;
++		crde->crd_skip = 0;
++	} else if (cse->cipher == CRYPTO_ARC4) { /* XXX use flag? */
++		crde->crd_skip = 0;
++	} else if (crde) {
++		crde->crd_flags |= CRD_F_IV_PRESENT;
++		crde->crd_skip = cse->info.blocksize;
++		crde->crd_len -= cse->info.blocksize;
++	}
++
++	if (cop->mac && crda == NULL) {
++		error = EINVAL;
++		dprintk("%s no crda\n", __FUNCTION__);
++		goto bail;
++	}
++
++	/*
++	 * Let the dispatch run unlocked, then, interlock against the
++	 * callback before checking if the operation completed and going
++	 * to sleep.  This insures drivers don't inherit our lock which
++	 * results in a lock order reversal between crypto_dispatch forced
++	 * entry and the crypto_done callback into us.
++	 */
++	error = crypto_dispatch(crp);
++	if (error) {
++		dprintk("%s error in crypto_dispatch\n", __FUNCTION__);
++		goto bail;
++	}
++
++	dprintk("%s about to WAIT\n", __FUNCTION__);
++	/*
++	 * we really need to wait for driver to complete to maintain
++	 * state,  luckily interrupts will be remembered
++	 */
++	do {
++		error = wait_event_interruptible(crp->crp_waitq,
++				((crp->crp_flags & CRYPTO_F_DONE) != 0));
++		/*
++		 * we can't break out of this loop or we will leave behind
++		 * a huge mess,  however,  staying here means if your driver
++		 * is broken user applications can hang and not be killed.
++		 * The solution,  fix your driver :-)
++		 */
++		if (error) {
++			schedule();
++			error = 0;
++		}
++	} while ((crp->crp_flags & CRYPTO_F_DONE) == 0);
++	dprintk("%s finished WAITING error=%d\n", __FUNCTION__, error);
++
++	if (crp->crp_etype != 0) {
++		error = crp->crp_etype;
++		dprintk("%s error in crp processing\n", __FUNCTION__);
++		goto bail;
++	}
++
++	if (cse->error) {
++		error = cse->error;
++		dprintk("%s error in cse processing\n", __FUNCTION__);
++		goto bail;
++	}
++
++	if (cop->dst && (error = copy_to_user(cop->dst,
++					cse->uio.uio_iov[0].iov_base, cop->len))) {
++		dprintk("%s bad dst copy\n", __FUNCTION__);
++		goto bail;
++	}
++
++	if (cop->mac &&
++			(error=copy_to_user(cop->mac,
++				(caddr_t)cse->uio.uio_iov[0].iov_base + cop->len,
++				cse->info.authsize))) {
++		dprintk("%s bad mac copy\n", __FUNCTION__);
++		goto bail;
++	}
++
++bail:
++	if (crp)
++		crypto_freereq(crp);
++	if (cse->uio.uio_iov[0].iov_base)
++		kfree(cse->uio.uio_iov[0].iov_base);
++
++	return (error);
++}
++
++static int
++cryptodev_cb(void *op)
++{
++	struct cryptop *crp = (struct cryptop *) op;
++	struct csession *cse = (struct csession *)crp->crp_opaque;
++	int error;
++
++	dprintk("%s()\n", __FUNCTION__);
++	error = crp->crp_etype;
++	if (error == EAGAIN) {
++		crp->crp_flags &= ~CRYPTO_F_DONE;
++#ifdef NOTYET
++		/*
++		 * DAVIDM I am fairly sure that we should turn this into a batch
++		 * request to stop bad karma/lockup, revisit
++		 */
++		crp->crp_flags |= CRYPTO_F_BATCH;
++#endif
++		return crypto_dispatch(crp);
++	}
++	if (error != 0 || (crp->crp_flags & CRYPTO_F_DONE)) {
++		cse->error = error;
++		wake_up_interruptible(&crp->crp_waitq);
++	}
++	return (0);
++}
++
++static int
++cryptodevkey_cb(void *op)
++{
++	struct cryptkop *krp = (struct cryptkop *) op;
++	dprintk("%s()\n", __FUNCTION__);
++	wake_up_interruptible(&krp->krp_waitq);
++	return (0);
++}
++
++static int
++cryptodev_key(struct crypt_kop *kop)
++{
++	struct cryptkop *krp = NULL;
++	int error = EINVAL;
++	int in, out, size, i;
++
++	dprintk("%s()\n", __FUNCTION__);
++	if (kop->crk_iparams + kop->crk_oparams > CRK_MAXPARAM) {
++		dprintk("%s params too big\n", __FUNCTION__);
++		return (EFBIG);
++	}
++
++	in = kop->crk_iparams;
++	out = kop->crk_oparams;
++	switch (kop->crk_op) {
++	case CRK_MOD_EXP:
++		if (in == 3 && out == 1)
++			break;
++		return (EINVAL);
++	case CRK_MOD_EXP_CRT:
++		if (in == 6 && out == 1)
++			break;
++		return (EINVAL);
++	case CRK_DSA_SIGN:
++		if (in == 5 && out == 2)
++			break;
++		return (EINVAL);
++	case CRK_DSA_VERIFY:
++		if (in == 7 && out == 0)
++			break;
++		return (EINVAL);
++	case CRK_DH_COMPUTE_KEY:
++		if (in == 3 && out == 1)
++			break;
++		return (EINVAL);
++	default:
++		return (EINVAL);
++	}
++
++	krp = (struct cryptkop *)kmalloc(sizeof *krp, GFP_KERNEL);
++	if (!krp)
++		return (ENOMEM);
++	bzero(krp, sizeof *krp);
++	krp->krp_op = kop->crk_op;
++	krp->krp_status = kop->crk_status;
++	krp->krp_iparams = kop->crk_iparams;
++	krp->krp_oparams = kop->crk_oparams;
++	krp->krp_crid = kop->crk_crid;
++	krp->krp_status = 0;
++	krp->krp_flags = CRYPTO_KF_CBIMM;
++	krp->krp_callback = (int (*) (struct cryptkop *)) cryptodevkey_cb;
++	init_waitqueue_head(&krp->krp_waitq);
++
++	for (i = 0; i < CRK_MAXPARAM; i++)
++		krp->krp_param[i].crp_nbits = kop->crk_param[i].crp_nbits;
++	for (i = 0; i < krp->krp_iparams + krp->krp_oparams; i++) {
++		size = (krp->krp_param[i].crp_nbits + 7) / 8;
++		if (size == 0)
++			continue;
++		krp->krp_param[i].crp_p = (caddr_t) kmalloc(size, GFP_KERNEL);
++		if (i >= krp->krp_iparams)
++			continue;
++		error = copy_from_user(krp->krp_param[i].crp_p,
++				kop->crk_param[i].crp_p, size);
++		if (error)
++			goto fail;
++	}
++
++	error = crypto_kdispatch(krp);
++	if (error)
++		goto fail;
++
++	do {
++		error = wait_event_interruptible(krp->krp_waitq,
++				((krp->krp_flags & CRYPTO_KF_DONE) != 0));
++		/*
++		 * we can't break out of this loop or we will leave behind
++		 * a huge mess,  however,  staying here means if your driver
++		 * is broken user applications can hang and not be killed.
++		 * The solution,  fix your driver :-)
++		 */
++		if (error) {
++			schedule();
++			error = 0;
++		}
++	} while ((krp->krp_flags & CRYPTO_KF_DONE) == 0);
++
++	dprintk("%s finished WAITING error=%d\n", __FUNCTION__, error);
++
++	kop->crk_crid = krp->krp_crid;		/* device that did the work */
++	if (krp->krp_status != 0) {
++		error = krp->krp_status;
++		goto fail;
++	}
++
++	for (i = krp->krp_iparams; i < krp->krp_iparams + krp->krp_oparams; i++) {
++		size = (krp->krp_param[i].crp_nbits + 7) / 8;
++		if (size == 0)
++			continue;
++		error = copy_to_user(kop->crk_param[i].crp_p, krp->krp_param[i].crp_p,
++				size);
++		if (error)
++			goto fail;
++	}
++
++fail:
++	if (krp) {
++		kop->crk_status = krp->krp_status;
++		for (i = 0; i < CRK_MAXPARAM; i++) {
++			if (krp->krp_param[i].crp_p)
++				kfree(krp->krp_param[i].crp_p);
++		}
++		kfree(krp);
++	}
++	return (error);
++}
++
++static int
++cryptodev_find(struct crypt_find_op *find)
++{
++	device_t dev;
++
++	if (find->crid != -1) {
++		dev = crypto_find_device_byhid(find->crid);
++		if (dev == NULL)
++			return (ENOENT);
++		strlcpy(find->name, device_get_nameunit(dev),
++		    sizeof(find->name));
++	} else {
++		find->crid = crypto_find_driver(find->name);
++		if (find->crid == -1)
++			return (ENOENT);
++	}
++	return (0);
++}
++
++static struct csession *
++csefind(struct fcrypt *fcr, u_int ses)
++{
++	struct csession *cse;
++
++	dprintk("%s()\n", __FUNCTION__);
++	list_for_each_entry(cse, &fcr->csessions, list)
++		if (cse->ses == ses)
++			return (cse);
++	return (NULL);
++}
++
++static int
++csedelete(struct fcrypt *fcr, struct csession *cse_del)
++{
++	struct csession *cse;
++
++	dprintk("%s()\n", __FUNCTION__);
++	list_for_each_entry(cse, &fcr->csessions, list) {
++		if (cse == cse_del) {
++			list_del(&cse->list);
++			return (1);
++		}
++	}
++	return (0);
++}
++
++static struct csession *
++cseadd(struct fcrypt *fcr, struct csession *cse)
++{
++	dprintk("%s()\n", __FUNCTION__);
++	list_add_tail(&cse->list, &fcr->csessions);
++	cse->ses = fcr->sesn++;
++	return (cse);
++}
++
++static struct csession *
++csecreate(struct fcrypt *fcr, u_int64_t sid, struct cryptoini *crie,
++	struct cryptoini *cria, struct csession_info *info)
++{
++	struct csession *cse;
++
++	dprintk("%s()\n", __FUNCTION__);
++	cse = (struct csession *) kmalloc(sizeof(struct csession), GFP_KERNEL);
++	if (cse == NULL)
++		return NULL;
++	memset(cse, 0, sizeof(struct csession));
++
++	INIT_LIST_HEAD(&cse->list);
++	init_waitqueue_head(&cse->waitq);
++
++	cse->key = crie->cri_key;
++	cse->keylen = crie->cri_klen/8;
++	cse->mackey = cria->cri_key;
++	cse->mackeylen = cria->cri_klen/8;
++	cse->sid = sid;
++	cse->cipher = crie->cri_alg;
++	cse->mac = cria->cri_alg;
++	cse->info = *info;
++	cseadd(fcr, cse);
++	return (cse);
++}
++
++static int
++csefree(struct csession *cse)
++{
++	int error;
++
++	dprintk("%s()\n", __FUNCTION__);
++	error = crypto_freesession(cse->sid);
++	if (cse->key)
++		kfree(cse->key);
++	if (cse->mackey)
++		kfree(cse->mackey);
++	kfree(cse);
++	return(error);
++}
++
++static int
++cryptodev_ioctl(
++	struct inode *inode,
++	struct file *filp,
++	unsigned int cmd,
++	unsigned long arg)
++{
++	struct cryptoini cria, crie;
++	struct fcrypt *fcr = filp->private_data;
++	struct csession *cse;
++	struct csession_info info;
++	struct session2_op sop;
++	struct crypt_op cop;
++	struct crypt_kop kop;
++	struct crypt_find_op fop;
++	u_int64_t sid;
++	u_int32_t ses = 0;
++	int feat, fd, error = 0, crid;
++	mm_segment_t fs;
++
++	dprintk("%s(cmd=%x arg=%lx)\n", __FUNCTION__, cmd, arg);
++
++	switch (cmd) {
++
++	case CRIOGET: {
++		dprintk("%s(CRIOGET)\n", __FUNCTION__);
++		fs = get_fs();
++		set_fs(get_ds());
++		for (fd = 0; fd < files_fdtable(current->files)->max_fds; fd++)
++			if (files_fdtable(current->files)->fd[fd] == filp)
++				break;
++		fd = sys_dup(fd);
++		set_fs(fs);
++		put_user(fd, (int *) arg);
++		return IS_ERR_VALUE(fd) ? fd : 0;
++		}
++
++#define	CIOCGSESSSTR	(cmd == CIOCGSESSION ? "CIOCGSESSION" : "CIOCGSESSION2")
++	case CIOCGSESSION:
++	case CIOCGSESSION2:
++		dprintk("%s(%s)\n", __FUNCTION__, CIOCGSESSSTR);
++		memset(&crie, 0, sizeof(crie));
++		memset(&cria, 0, sizeof(cria));
++		memset(&info, 0, sizeof(info));
++		memset(&sop, 0, sizeof(sop));
++
++		if (copy_from_user(&sop, (void*)arg, (cmd == CIOCGSESSION) ?
++					sizeof(struct session_op) : sizeof(sop))) {
++			dprintk("%s(%s) - bad copy\n", __FUNCTION__, CIOCGSESSSTR);
++			error = EFAULT;
++			goto bail;
++		}
++
++		switch (sop.cipher) {
++		case 0:
++			dprintk("%s(%s) - no cipher\n", __FUNCTION__, CIOCGSESSSTR);
++			break;
++		case CRYPTO_NULL_CBC:
++			info.blocksize = NULL_BLOCK_LEN;
++			info.minkey = NULL_MIN_KEY_LEN;
++			info.maxkey = NULL_MAX_KEY_LEN;
++			break;
++		case CRYPTO_DES_CBC:
++			info.blocksize = DES_BLOCK_LEN;
++			info.minkey = DES_MIN_KEY_LEN;
++			info.maxkey = DES_MAX_KEY_LEN;
++			break;
++		case CRYPTO_3DES_CBC:
++			info.blocksize = DES3_BLOCK_LEN;
++			info.minkey = DES3_MIN_KEY_LEN;
++			info.maxkey = DES3_MAX_KEY_LEN;
++			break;
++		case CRYPTO_BLF_CBC:
++			info.blocksize = BLOWFISH_BLOCK_LEN;
++			info.minkey = BLOWFISH_MIN_KEY_LEN;
++			info.maxkey = BLOWFISH_MAX_KEY_LEN;
++			break;
++		case CRYPTO_CAST_CBC:
++			info.blocksize = CAST128_BLOCK_LEN;
++			info.minkey = CAST128_MIN_KEY_LEN;
++			info.maxkey = CAST128_MAX_KEY_LEN;
++			break;
++		case CRYPTO_SKIPJACK_CBC:
++			info.blocksize = SKIPJACK_BLOCK_LEN;
++			info.minkey = SKIPJACK_MIN_KEY_LEN;
++			info.maxkey = SKIPJACK_MAX_KEY_LEN;
++			break;
++		case CRYPTO_AES_CBC:
++			info.blocksize = AES_BLOCK_LEN;
++			info.minkey = AES_MIN_KEY_LEN;
++			info.maxkey = AES_MAX_KEY_LEN;
++			break;
++		case CRYPTO_ARC4:
++			info.blocksize = ARC4_BLOCK_LEN;
++			info.minkey = ARC4_MIN_KEY_LEN;
++			info.maxkey = ARC4_MAX_KEY_LEN;
++			break;
++		case CRYPTO_CAMELLIA_CBC:
++			info.blocksize = CAMELLIA_BLOCK_LEN;
++			info.minkey = CAMELLIA_MIN_KEY_LEN;
++			info.maxkey = CAMELLIA_MAX_KEY_LEN;
++			break;
++		default:
++			dprintk("%s(%s) - bad cipher\n", __FUNCTION__, CIOCGSESSSTR);
++			error = EINVAL;
++			goto bail;
++		}
++
++		switch (sop.mac) {
++		case 0:
++			dprintk("%s(%s) - no mac\n", __FUNCTION__, CIOCGSESSSTR);
++			break;
++		case CRYPTO_NULL_HMAC:
++			info.authsize = NULL_HASH_LEN;
++			break;
++		case CRYPTO_MD5:
++			info.authsize = MD5_HASH_LEN;
++			break;
++		case CRYPTO_SHA1:
++			info.authsize = SHA1_HASH_LEN;
++			break;
++		case CRYPTO_SHA2_256:
++			info.authsize = SHA2_256_HASH_LEN;
++			break;
++		case CRYPTO_SHA2_384:
++			info.authsize = SHA2_384_HASH_LEN;
++  			break;
++		case CRYPTO_SHA2_512:
++			info.authsize = SHA2_512_HASH_LEN;
++			break;
++		case CRYPTO_RIPEMD160:
++			info.authsize = RIPEMD160_HASH_LEN;
++			break;
++		case CRYPTO_MD5_HMAC:
++			info.authsize = MD5_HASH_LEN;
++			info.authkey = 16;
++			break;
++		case CRYPTO_SHA1_HMAC:
++			info.authsize = SHA1_HASH_LEN;
++			info.authkey = 20;
++			break;
++		case CRYPTO_SHA2_256_HMAC:
++			info.authsize = SHA2_256_HASH_LEN;
++			info.authkey = 32;
++			break;
++		case CRYPTO_SHA2_384_HMAC:
++			info.authsize = SHA2_384_HASH_LEN;
++			info.authkey = 48;
++  			break;
++		case CRYPTO_SHA2_512_HMAC:
++			info.authsize = SHA2_512_HASH_LEN;
++			info.authkey = 64;
++			break;
++		case CRYPTO_RIPEMD160_HMAC:
++			info.authsize = RIPEMD160_HASH_LEN;
++			info.authkey = 20;
++			break;
++		default:
++			dprintk("%s(%s) - bad mac\n", __FUNCTION__, CIOCGSESSSTR);
++			error = EINVAL;
++			goto bail;
++		}
++
++		if (info.blocksize) {
++			crie.cri_alg = sop.cipher;
++			crie.cri_klen = sop.keylen * 8;
++			if ((info.maxkey && sop.keylen > info.maxkey) ||
++				   	sop.keylen < info.minkey) {
++				dprintk("%s(%s) - bad key\n", __FUNCTION__, CIOCGSESSSTR);
++				error = EINVAL;
++				goto bail;
++			}
++
++			crie.cri_key = (u_int8_t *) kmalloc(crie.cri_klen/8+1, GFP_KERNEL);
++			if (copy_from_user(crie.cri_key, sop.key,
++							crie.cri_klen/8)) {
++				dprintk("%s(%s) - bad copy\n", __FUNCTION__, CIOCGSESSSTR);
++				error = EFAULT;
++				goto bail;
++			}
++			if (info.authsize)
++				crie.cri_next = &cria;
++		}
++
++		if (info.authsize) {
++			cria.cri_alg = sop.mac;
++			cria.cri_klen = sop.mackeylen * 8;
++			if (info.authkey && sop.mackeylen != info.authkey) {
++				dprintk("%s(%s) - mackeylen %d != %d\n", __FUNCTION__,
++						CIOCGSESSSTR, sop.mackeylen, info.authkey);
++				error = EINVAL;
++				goto bail;
++			}
++
++			if (cria.cri_klen) {
++				cria.cri_key = (u_int8_t *) kmalloc(cria.cri_klen/8,GFP_KERNEL);
++				if (copy_from_user(cria.cri_key, sop.mackey,
++								cria.cri_klen / 8)) {
++					dprintk("%s(%s) - bad copy\n", __FUNCTION__, CIOCGSESSSTR);
++					error = EFAULT;
++					goto bail;
++				}
++			}
++		}
++
++		/* NB: CIOGSESSION2 has the crid */
++		if (cmd == CIOCGSESSION2) {
++			crid = sop.crid;
++			error = checkcrid(crid);
++			if (error) {
++				dprintk("%s(%s) - checkcrid %x\n", __FUNCTION__,
++						CIOCGSESSSTR, error);
++				goto bail;
++			}
++		} else {
++			/* allow either HW or SW to be used */
++			crid = CRYPTOCAP_F_HARDWARE | CRYPTOCAP_F_SOFTWARE;
++		}
++		error = crypto_newsession(&sid, (info.blocksize ? &crie : &cria), crid);
++		if (error) {
++			dprintk("%s(%s) - newsession %d\n",__FUNCTION__,CIOCGSESSSTR,error);
++			goto bail;
++		}
++
++		cse = csecreate(fcr, sid, &crie, &cria, &info);
++		if (cse == NULL) {
++			crypto_freesession(sid);
++			error = EINVAL;
++			dprintk("%s(%s) - csecreate failed\n", __FUNCTION__, CIOCGSESSSTR);
++			goto bail;
++		}
++		sop.ses = cse->ses;
++
++		if (cmd == CIOCGSESSION2) {
++			/* return hardware/driver id */
++			sop.crid = CRYPTO_SESID2HID(cse->sid);
++		}
++
++		if (copy_to_user((void*)arg, &sop, (cmd == CIOCGSESSION) ?
++					sizeof(struct session_op) : sizeof(sop))) {
++			dprintk("%s(%s) - bad copy\n", __FUNCTION__, CIOCGSESSSTR);
++			error = EFAULT;
++		}
++bail:
++		if (error) {
++			dprintk("%s(%s) - bail %d\n", __FUNCTION__, CIOCGSESSSTR, error);
++			if (crie.cri_key)
++				kfree(crie.cri_key);
++			if (cria.cri_key)
++				kfree(cria.cri_key);
++		}
++		break;
++	case CIOCFSESSION:
++		dprintk("%s(CIOCFSESSION)\n", __FUNCTION__);
++		get_user(ses, (uint32_t*)arg);
++		cse = csefind(fcr, ses);
++		if (cse == NULL) {
++			error = EINVAL;
++			dprintk("%s(CIOCFSESSION) - Fail %d\n", __FUNCTION__, error);
++			break;
++		}
++		csedelete(fcr, cse);
++		error = csefree(cse);
++		break;
++	case CIOCCRYPT:
++		dprintk("%s(CIOCCRYPT)\n", __FUNCTION__);
++		if(copy_from_user(&cop, (void*)arg, sizeof(cop))) {
++			dprintk("%s(CIOCCRYPT) - bad copy\n", __FUNCTION__);
++			error = EFAULT;
++			goto bail;
++		}
++		cse = csefind(fcr, cop.ses);
++		if (cse == NULL) {
++			error = EINVAL;
++			dprintk("%s(CIOCCRYPT) - Fail %d\n", __FUNCTION__, error);
++			break;
++		}
++		error = cryptodev_op(cse, &cop);
++		if(copy_to_user((void*)arg, &cop, sizeof(cop))) {
++			dprintk("%s(CIOCCRYPT) - bad return copy\n", __FUNCTION__);
++			error = EFAULT;
++			goto bail;
++		}
++		break;
++	case CIOCKEY:
++	case CIOCKEY2:
++		dprintk("%s(CIOCKEY)\n", __FUNCTION__);
++		if (!crypto_userasymcrypto)
++			return (EPERM);		/* XXX compat? */
++		if(copy_from_user(&kop, (void*)arg, sizeof(kop))) {
++			dprintk("%s(CIOCKEY) - bad copy\n", __FUNCTION__);
++			error = EFAULT;
++			goto bail;
++		}
++		if (cmd == CIOCKEY) {
++			/* NB: crypto core enforces s/w driver use */
++			kop.crk_crid =
++			    CRYPTOCAP_F_HARDWARE | CRYPTOCAP_F_SOFTWARE;
++		}
++		error = cryptodev_key(&kop);
++		if(copy_to_user((void*)arg, &kop, sizeof(kop))) {
++			dprintk("%s(CIOCGKEY) - bad return copy\n", __FUNCTION__);
++			error = EFAULT;
++			goto bail;
++		}
++		break;
++	case CIOCASYMFEAT:
++		dprintk("%s(CIOCASYMFEAT)\n", __FUNCTION__);
++		if (!crypto_userasymcrypto) {
++			/*
++			 * NB: if user asym crypto operations are
++			 * not permitted return "no algorithms"
++			 * so well-behaved applications will just
++			 * fallback to doing them in software.
++			 */
++			feat = 0;
++		} else
++			error = crypto_getfeat(&feat);
++		if (!error) {
++		  error = copy_to_user((void*)arg, &feat, sizeof(feat));
++		}
++		break;
++	case CIOCFINDDEV:
++		if (copy_from_user(&fop, (void*)arg, sizeof(fop))) {
++			dprintk("%s(CIOCFINDDEV) - bad copy\n", __FUNCTION__);
++			error = EFAULT;
++			goto bail;
++		}
++		error = cryptodev_find(&fop);
++		if (copy_to_user((void*)arg, &fop, sizeof(fop))) {
++			dprintk("%s(CIOCFINDDEV) - bad return copy\n", __FUNCTION__);
++			error = EFAULT;
++			goto bail;
++		}
++		break;
++	default:
++		dprintk("%s(unknown ioctl 0x%x)\n", __FUNCTION__, cmd);
++		error = EINVAL;
++		break;
++	}
++	return(-error);
++}
++
++#ifdef HAVE_UNLOCKED_IOCTL
++static long
++cryptodev_unlocked_ioctl(
++	struct file *filp,
++	unsigned int cmd,
++	unsigned long arg)
++{
++	return cryptodev_ioctl(NULL, filp, cmd, arg);
++}
++#endif
++
++static int
++cryptodev_open(struct inode *inode, struct file *filp)
++{
++	struct fcrypt *fcr;
++
++	dprintk("%s()\n", __FUNCTION__);
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,35)
++	/*
++	 * on 2.6.35 private_data points to a miscdevice structure, we override
++	 * it,  which is currently safe to do.
++	 */
++	if (filp->private_data) {
++		printk("cryptodev: Private data already exists - %p!\n", filp->private_data);
++		return(-ENODEV);
++	}
++#endif
++
++	fcr = kmalloc(sizeof(*fcr), GFP_KERNEL);
++	if (!fcr) {
++		dprintk("%s() - malloc failed\n", __FUNCTION__);
++		return(-ENOMEM);
++	}
++	memset(fcr, 0, sizeof(*fcr));
++
++	INIT_LIST_HEAD(&fcr->csessions);
++	filp->private_data = fcr;
++	return(0);
++}
++
++static int
++cryptodev_release(struct inode *inode, struct file *filp)
++{
++	struct fcrypt *fcr = filp->private_data;
++	struct csession *cse, *tmp;
++
++	dprintk("%s()\n", __FUNCTION__);
++	if (!filp) {
++		printk("cryptodev: No private data on release\n");
++		return(0);
++	}
++
++	list_for_each_entry_safe(cse, tmp, &fcr->csessions, list) {
++		list_del(&cse->list);
++		(void)csefree(cse);
++	}
++	filp->private_data = NULL;
++	kfree(fcr);
++	return(0);
++}
++
++static struct file_operations cryptodev_fops = {
++	.owner = THIS_MODULE,
++	.open = cryptodev_open,
++	.release = cryptodev_release,
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,36)
++	.ioctl = cryptodev_ioctl,
++#endif
++#ifdef HAVE_UNLOCKED_IOCTL
++	.unlocked_ioctl = cryptodev_unlocked_ioctl,
++#endif
++};
++
++static struct miscdevice cryptodev = {
++	.minor = CRYPTODEV_MINOR,
++	.name = "crypto",
++	.fops = &cryptodev_fops,
++};
++
++static int __init
++cryptodev_init(void)
++{
++	int rc;
++
++	dprintk("%s(%p)\n", __FUNCTION__, cryptodev_init);
++	rc = misc_register(&cryptodev);
++	if (rc) {
++		printk(KERN_ERR "cryptodev: registration of /dev/crypto failed\n");
++		return(rc);
++	}
++
++	return(0);
++}
++
++static void __exit
++cryptodev_exit(void)
++{
++	dprintk("%s()\n", __FUNCTION__);
++	misc_deregister(&cryptodev);
++}
++
++module_init(cryptodev_init);
++module_exit(cryptodev_exit);
++
++MODULE_LICENSE("BSD");
++MODULE_AUTHOR("David McCullough <david_mccullough@mcafee.com>");
++MODULE_DESCRIPTION("Cryptodev (user interface to OCF)");
+diff --git a/crypto/ocf/cryptodev.h b/crypto/ocf/cryptodev.h
+new file mode 100644
+index 0000000..cca0ec8
+--- /dev/null
++++ b/crypto/ocf/cryptodev.h
+@@ -0,0 +1,480 @@
++/*	$FreeBSD: src/sys/opencrypto/cryptodev.h,v 1.25 2007/05/09 19:37:02 gnn Exp $	*/
++/*	$OpenBSD: cryptodev.h,v 1.31 2002/06/11 11:14:29 beck Exp $	*/
++
++/*-
++ * Linux port done by David McCullough <david_mccullough@mcafee.com>
++ * Copyright (C) 2006-2010 David McCullough
++ * Copyright (C) 2004-2005 Intel Corporation.
++ * The license and original author are listed below.
++ *
++ * The author of this code is Angelos D. Keromytis (angelos@cis.upenn.edu)
++ * Copyright (c) 2002-2006 Sam Leffler, Errno Consulting
++ *
++ * This code was written by Angelos D. Keromytis in Athens, Greece, in
++ * February 2000. Network Security Technologies Inc. (NSTI) kindly
++ * supported the development of this code.
++ *
++ * Copyright (c) 2000 Angelos D. Keromytis
++ *
++ * Permission to use, copy, and modify this software with or without fee
++ * is hereby granted, provided that this entire notice is included in
++ * all source code copies of any software which is or includes a copy or
++ * modification of this software.
++ *
++ * THIS SOFTWARE IS BEING PROVIDED "AS IS", WITHOUT ANY EXPRESS OR
++ * IMPLIED WARRANTY. IN PARTICULAR, NONE OF THE AUTHORS MAKES ANY
++ * REPRESENTATION OR WARRANTY OF ANY KIND CONCERNING THE
++ * MERCHANTABILITY OF THIS SOFTWARE OR ITS FITNESS FOR ANY PARTICULAR
++ * PURPOSE.
++ *
++ * Copyright (c) 2001 Theo de Raadt
++ *
++ * Redistribution and use in source and binary forms, with or without
++ * modification, are permitted provided that the following conditions
++ * are met:
++ *
++ * 1. Redistributions of source code must retain the above copyright
++ *   notice, this list of conditions and the following disclaimer.
++ * 2. Redistributions in binary form must reproduce the above copyright
++ *   notice, this list of conditions and the following disclaimer in the
++ *   documentation and/or other materials provided with the distribution.
++ * 3. The name of the author may not be used to endorse or promote products
++ *   derived from this software without specific prior written permission.
++ *
++ * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
++ * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
++ * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
++ * IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
++ * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
++ * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
++ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
++ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
++ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
++ * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
++ *
++ * Effort sponsored in part by the Defense Advanced Research Projects
++ * Agency (DARPA) and Air Force Research Laboratory, Air Force
++ * Materiel Command, USAF, under agreement number F30602-01-2-0537.
++ *
++ */
++
++#ifndef _CRYPTO_CRYPTO_H_
++#define _CRYPTO_CRYPTO_H_
++
++/* Some initial values */
++#define CRYPTO_DRIVERS_INITIAL	4
++#define CRYPTO_SW_SESSIONS	32
++
++/* Hash values */
++#define NULL_HASH_LEN		0
++#define MD5_HASH_LEN		16
++#define SHA1_HASH_LEN		20
++#define RIPEMD160_HASH_LEN	20
++#define SHA2_256_HASH_LEN	32
++#define SHA2_384_HASH_LEN	48
++#define SHA2_512_HASH_LEN	64
++#define MD5_KPDK_HASH_LEN	16
++#define SHA1_KPDK_HASH_LEN	20
++/* Maximum hash algorithm result length */
++#define HASH_MAX_LEN		SHA2_512_HASH_LEN /* Keep this updated */
++
++/* HMAC values */
++#define NULL_HMAC_BLOCK_LEN			1
++#define MD5_HMAC_BLOCK_LEN			64
++#define SHA1_HMAC_BLOCK_LEN			64
++#define RIPEMD160_HMAC_BLOCK_LEN	64
++#define SHA2_256_HMAC_BLOCK_LEN		64
++#define SHA2_384_HMAC_BLOCK_LEN		128
++#define SHA2_512_HMAC_BLOCK_LEN		128
++/* Maximum HMAC block length */
++#define HMAC_MAX_BLOCK_LEN		SHA2_512_HMAC_BLOCK_LEN /* Keep this updated */
++#define HMAC_IPAD_VAL			0x36
++#define HMAC_OPAD_VAL			0x5C
++
++/* Encryption algorithm block sizes */
++#define NULL_BLOCK_LEN			1
++#define DES_BLOCK_LEN			8
++#define DES3_BLOCK_LEN			8
++#define BLOWFISH_BLOCK_LEN		8
++#define SKIPJACK_BLOCK_LEN		8
++#define CAST128_BLOCK_LEN		8
++#define RIJNDAEL128_BLOCK_LEN	16
++#define AES_BLOCK_LEN			RIJNDAEL128_BLOCK_LEN
++#define CAMELLIA_BLOCK_LEN		16
++#define ARC4_BLOCK_LEN			1
++#define EALG_MAX_BLOCK_LEN		AES_BLOCK_LEN /* Keep this updated */
++
++/* Encryption algorithm min and max key sizes */
++#define NULL_MIN_KEY_LEN		0
++#define NULL_MAX_KEY_LEN		0
++#define DES_MIN_KEY_LEN			8
++#define DES_MAX_KEY_LEN			8
++#define DES3_MIN_KEY_LEN		24
++#define DES3_MAX_KEY_LEN		24
++#define BLOWFISH_MIN_KEY_LEN	4
++#define BLOWFISH_MAX_KEY_LEN	56
++#define SKIPJACK_MIN_KEY_LEN	10
++#define SKIPJACK_MAX_KEY_LEN	10
++#define CAST128_MIN_KEY_LEN		5
++#define CAST128_MAX_KEY_LEN		16
++#define RIJNDAEL128_MIN_KEY_LEN	16
++#define RIJNDAEL128_MAX_KEY_LEN	32
++#define AES_MIN_KEY_LEN			RIJNDAEL128_MIN_KEY_LEN
++#define AES_MAX_KEY_LEN			RIJNDAEL128_MAX_KEY_LEN
++#define CAMELLIA_MIN_KEY_LEN	16
++#define CAMELLIA_MAX_KEY_LEN	32
++#define ARC4_MIN_KEY_LEN		1
++#define ARC4_MAX_KEY_LEN		256
++
++/* Max size of data that can be processed */
++#define CRYPTO_MAX_DATA_LEN		64*1024 - 1
++
++#define CRYPTO_ALGORITHM_MIN	1
++#define CRYPTO_DES_CBC			1
++#define CRYPTO_3DES_CBC			2
++#define CRYPTO_BLF_CBC			3
++#define CRYPTO_CAST_CBC			4
++#define CRYPTO_SKIPJACK_CBC		5
++#define CRYPTO_MD5_HMAC			6
++#define CRYPTO_SHA1_HMAC		7
++#define CRYPTO_RIPEMD160_HMAC	8
++#define CRYPTO_MD5_KPDK			9
++#define CRYPTO_SHA1_KPDK		10
++#define CRYPTO_RIJNDAEL128_CBC	11 /* 128 bit blocksize */
++#define CRYPTO_AES_CBC			11 /* 128 bit blocksize -- the same as above */
++#define CRYPTO_ARC4				12
++#define CRYPTO_MD5				13
++#define CRYPTO_SHA1				14
++#define CRYPTO_NULL_HMAC		15
++#define CRYPTO_NULL_CBC			16
++#define CRYPTO_DEFLATE_COMP		17 /* Deflate compression algorithm */
++#define CRYPTO_SHA2_256_HMAC	18
++#define CRYPTO_SHA2_384_HMAC	19
++#define CRYPTO_SHA2_512_HMAC	20
++#define CRYPTO_CAMELLIA_CBC		21
++#define CRYPTO_SHA2_256			22
++#define CRYPTO_SHA2_384			23
++#define CRYPTO_SHA2_512			24
++#define CRYPTO_RIPEMD160		25
++#define	CRYPTO_LZS_COMP			26
++#define CRYPTO_ALGORITHM_MAX	26 /* Keep updated - see above */
++
++/* Algorithm flags */
++#define CRYPTO_ALG_FLAG_SUPPORTED	0x01 /* Algorithm is supported */
++#define CRYPTO_ALG_FLAG_RNG_ENABLE	0x02 /* Has HW RNG for DH/DSA */
++#define CRYPTO_ALG_FLAG_DSA_SHA		0x04 /* Can do SHA on msg */
++
++/*
++ * Crypto driver/device flags.  They can set in the crid
++ * parameter when creating a session or submitting a key
++ * op to affect the device/driver assigned.  If neither
++ * of these are specified then the crid is assumed to hold
++ * the driver id of an existing (and suitable) device that
++ * must be used to satisfy the request.
++ */
++#define CRYPTO_FLAG_HARDWARE	0x01000000	/* hardware accelerated */
++#define CRYPTO_FLAG_SOFTWARE	0x02000000	/* software implementation */
++
++/* NB: deprecated */
++struct session_op {
++	u_int32_t	cipher;		/* ie. CRYPTO_DES_CBC */
++	u_int32_t	mac;		/* ie. CRYPTO_MD5_HMAC */
++
++	u_int32_t	keylen;		/* cipher key */
++	caddr_t		key;
++	int		mackeylen;	/* mac key */
++	caddr_t		mackey;
++
++  	u_int32_t	ses;		/* returns: session # */
++};
++
++struct session2_op {
++	u_int32_t	cipher;		/* ie. CRYPTO_DES_CBC */
++	u_int32_t	mac;		/* ie. CRYPTO_MD5_HMAC */
++
++	u_int32_t	keylen;		/* cipher key */
++	caddr_t		key;
++	int		mackeylen;	/* mac key */
++	caddr_t		mackey;
++
++  	u_int32_t	ses;		/* returns: session # */
++	int		crid;		/* driver id + flags (rw) */
++	int		pad[4];		/* for future expansion */
++};
++
++struct crypt_op {
++	u_int32_t	ses;
++	u_int16_t	op;		/* i.e. COP_ENCRYPT */
++#define COP_NONE	0
++#define COP_ENCRYPT	1
++#define COP_DECRYPT	2
++	u_int16_t	flags;
++#define	COP_F_BATCH	0x0008		/* Batch op if possible */
++	u_int		len;
++	caddr_t		src, dst;	/* become iov[] inside kernel */
++	caddr_t		mac;		/* must be big enough for chosen MAC */
++	caddr_t		iv;
++};
++
++/*
++ * Parameters for looking up a crypto driver/device by
++ * device name or by id.  The latter are returned for
++ * created sessions (crid) and completed key operations.
++ */
++struct crypt_find_op {
++	int		crid;		/* driver id + flags */
++	char		name[32];	/* device/driver name */
++};
++
++/* bignum parameter, in packed bytes, ... */
++struct crparam {
++	caddr_t		crp_p;
++	u_int		crp_nbits;
++};
++
++#define CRK_MAXPARAM	8
++
++struct crypt_kop {
++	u_int		crk_op;		/* ie. CRK_MOD_EXP or other */
++	u_int		crk_status;	/* return status */
++	u_short		crk_iparams;	/* # of input parameters */
++	u_short		crk_oparams;	/* # of output parameters */
++	u_int		crk_crid;	/* NB: only used by CIOCKEY2 (rw) */
++	struct crparam	crk_param[CRK_MAXPARAM];
++};
++#define CRK_ALGORITM_MIN	0
++#define CRK_MOD_EXP		0
++#define CRK_MOD_EXP_CRT		1
++#define CRK_DSA_SIGN		2
++#define CRK_DSA_VERIFY		3
++#define CRK_DH_COMPUTE_KEY	4
++#define CRK_ALGORITHM_MAX	4 /* Keep updated - see below */
++
++#define CRF_MOD_EXP		(1 << CRK_MOD_EXP)
++#define CRF_MOD_EXP_CRT		(1 << CRK_MOD_EXP_CRT)
++#define CRF_DSA_SIGN		(1 << CRK_DSA_SIGN)
++#define CRF_DSA_VERIFY		(1 << CRK_DSA_VERIFY)
++#define CRF_DH_COMPUTE_KEY	(1 << CRK_DH_COMPUTE_KEY)
++
++/*
++ * done against open of /dev/crypto, to get a cloned descriptor.
++ * Please use F_SETFD against the cloned descriptor.
++ */
++#define CRIOGET		_IOWR('c', 100, u_int32_t)
++#define CRIOASYMFEAT	CIOCASYMFEAT
++#define CRIOFINDDEV	CIOCFINDDEV
++
++/* the following are done against the cloned descriptor */
++#define CIOCGSESSION	_IOWR('c', 101, struct session_op)
++#define CIOCFSESSION	_IOW('c', 102, u_int32_t)
++#define CIOCCRYPT	_IOWR('c', 103, struct crypt_op)
++#define CIOCKEY		_IOWR('c', 104, struct crypt_kop)
++#define CIOCASYMFEAT	_IOR('c', 105, u_int32_t)
++#define CIOCGSESSION2	_IOWR('c', 106, struct session2_op)
++#define CIOCKEY2	_IOWR('c', 107, struct crypt_kop)
++#define CIOCFINDDEV	_IOWR('c', 108, struct crypt_find_op)
++
++struct cryptotstat {
++	struct timespec	acc;		/* total accumulated time */
++	struct timespec	min;		/* min time */
++	struct timespec	max;		/* max time */
++	u_int32_t	count;		/* number of observations */
++};
++
++struct cryptostats {
++	u_int32_t	cs_ops;		/* symmetric crypto ops submitted */
++	u_int32_t	cs_errs;	/* symmetric crypto ops that failed */
++	u_int32_t	cs_kops;	/* asymetric/key ops submitted */
++	u_int32_t	cs_kerrs;	/* asymetric/key ops that failed */
++	u_int32_t	cs_intrs;	/* crypto swi thread activations */
++	u_int32_t	cs_rets;	/* crypto return thread activations */
++	u_int32_t	cs_blocks;	/* symmetric op driver block */
++	u_int32_t	cs_kblocks;	/* symmetric op driver block */
++	/*
++	 * When CRYPTO_TIMING is defined at compile time and the
++	 * sysctl debug.crypto is set to 1, the crypto system will
++	 * accumulate statistics about how long it takes to process
++	 * crypto requests at various points during processing.
++	 */
++	struct cryptotstat cs_invoke;	/* crypto_dipsatch -> crypto_invoke */
++	struct cryptotstat cs_done;	/* crypto_invoke -> crypto_done */
++	struct cryptotstat cs_cb;	/* crypto_done -> callback */
++	struct cryptotstat cs_finis;	/* callback -> callback return */
++
++	u_int32_t	cs_drops;		/* crypto ops dropped due to congestion */
++};
++
++#ifdef __KERNEL__
++
++/* Standard initialization structure beginning */
++struct cryptoini {
++	int		cri_alg;	/* Algorithm to use */
++	int		cri_klen;	/* Key length, in bits */
++	int		cri_mlen;	/* Number of bytes we want from the
++					   entire hash. 0 means all. */
++	caddr_t		cri_key;	/* key to use */
++	u_int8_t	cri_iv[EALG_MAX_BLOCK_LEN];	/* IV to use */
++	struct cryptoini *cri_next;
++};
++
++/* Describe boundaries of a single crypto operation */
++struct cryptodesc {
++	int		crd_skip;	/* How many bytes to ignore from start */
++	int		crd_len;	/* How many bytes to process */
++	int		crd_inject;	/* Where to inject results, if applicable */
++	int		crd_flags;
++
++#define CRD_F_ENCRYPT		0x01	/* Set when doing encryption */
++#define CRD_F_IV_PRESENT	0x02	/* When encrypting, IV is already in
++					   place, so don't copy. */
++#define CRD_F_IV_EXPLICIT	0x04	/* IV explicitly provided */
++#define CRD_F_DSA_SHA_NEEDED	0x08	/* Compute SHA-1 of buffer for DSA */
++#define CRD_F_KEY_EXPLICIT	0x10	/* Key explicitly provided */
++#define CRD_F_COMP		0x0f    /* Set when doing compression */
++
++	struct cryptoini	CRD_INI; /* Initialization/context data */
++#define crd_iv		CRD_INI.cri_iv
++#define crd_key		CRD_INI.cri_key
++#define crd_alg		CRD_INI.cri_alg
++#define crd_klen	CRD_INI.cri_klen
++#define crd_mlen	CRD_INI.cri_mlen
++
++	struct cryptodesc *crd_next;
++};
++
++/* Structure describing complete operation */
++struct cryptop {
++	struct list_head crp_next;
++	wait_queue_head_t crp_waitq;
++
++	u_int64_t	crp_sid;	/* Session ID */
++	int		crp_ilen;	/* Input data total length */
++	int		crp_olen;	/* Result total length */
++
++	int		crp_etype;	/*
++					 * Error type (zero means no error).
++					 * All error codes except EAGAIN
++					 * indicate possible data corruption (as in,
++					 * the data have been touched). On all
++					 * errors, the crp_sid may have changed
++					 * (reset to a new one), so the caller
++					 * should always check and use the new
++					 * value on future requests.
++					 */
++	int		crp_flags;
++
++#define CRYPTO_F_SKBUF		0x0001	/* Input/output are skbuf chains */
++#define CRYPTO_F_IOV		0x0002	/* Input/output are uio */
++#define CRYPTO_F_REL		0x0004	/* Must return data in same place */
++#define CRYPTO_F_BATCH		0x0008	/* Batch op if possible */
++#define CRYPTO_F_CBIMM		0x0010	/* Do callback immediately */
++#define CRYPTO_F_DONE		0x0020	/* Operation completed */
++#define CRYPTO_F_CBIFSYNC	0x0040	/* Do CBIMM if op is synchronous */
++
++	caddr_t		crp_buf;	/* Data to be processed */
++	caddr_t		crp_opaque;	/* Opaque pointer, passed along */
++	struct cryptodesc *crp_desc;	/* Linked list of processing descriptors */
++
++	int (*crp_callback)(struct cryptop *); /* Callback function */
++};
++
++#define CRYPTO_BUF_CONTIG	0x0
++#define CRYPTO_BUF_IOV		0x1
++#define CRYPTO_BUF_SKBUF		0x2
++
++#define CRYPTO_OP_DECRYPT	0x0
++#define CRYPTO_OP_ENCRYPT	0x1
++
++/*
++ * Hints passed to process methods.
++ */
++#define CRYPTO_HINT_MORE	0x1	/* more ops coming shortly */
++
++struct cryptkop {
++	struct list_head krp_next;
++	wait_queue_head_t krp_waitq;
++
++	int		krp_flags;
++#define CRYPTO_KF_DONE		0x0001	/* Operation completed */
++#define CRYPTO_KF_CBIMM		0x0002	/* Do callback immediately */
++
++	u_int		krp_op;		/* ie. CRK_MOD_EXP or other */
++	u_int		krp_status;	/* return status */
++	u_short		krp_iparams;	/* # of input parameters */
++	u_short		krp_oparams;	/* # of output parameters */
++	u_int		krp_crid;	/* desired device, etc. */
++	u_int32_t	krp_hid;
++	struct crparam	krp_param[CRK_MAXPARAM];	/* kvm */
++	int		(*krp_callback)(struct cryptkop *);
++};
++
++#include <ocf-compat.h>
++
++/*
++ * Session ids are 64 bits.  The lower 32 bits contain a "local id" which
++ * is a driver-private session identifier.  The upper 32 bits contain a
++ * "hardware id" used by the core crypto code to identify the driver and
++ * a copy of the driver's capabilities that can be used by client code to
++ * optimize operation.
++ */
++#define CRYPTO_SESID2HID(_sid)	(((_sid) >> 32) & 0x00ffffff)
++#define CRYPTO_SESID2CAPS(_sid)	(((_sid) >> 32) & 0xff000000)
++#define CRYPTO_SESID2LID(_sid)	(((u_int32_t) (_sid)) & 0xffffffff)
++
++extern	int crypto_newsession(u_int64_t *sid, struct cryptoini *cri, int hard);
++extern	int crypto_freesession(u_int64_t sid);
++#define CRYPTOCAP_F_HARDWARE	CRYPTO_FLAG_HARDWARE
++#define CRYPTOCAP_F_SOFTWARE	CRYPTO_FLAG_SOFTWARE
++#define CRYPTOCAP_F_SYNC	0x04000000	/* operates synchronously */
++extern	int32_t crypto_get_driverid(device_t dev, int flags);
++extern	int crypto_find_driver(const char *);
++extern	device_t crypto_find_device_byhid(int hid);
++extern	int crypto_getcaps(int hid);
++extern	int crypto_register(u_int32_t driverid, int alg, u_int16_t maxoplen,
++	    u_int32_t flags);
++extern	int crypto_kregister(u_int32_t, int, u_int32_t);
++extern	int crypto_unregister(u_int32_t driverid, int alg);
++extern	int crypto_unregister_all(u_int32_t driverid);
++extern	int crypto_dispatch(struct cryptop *crp);
++extern	int crypto_kdispatch(struct cryptkop *);
++#define CRYPTO_SYMQ	0x1
++#define CRYPTO_ASYMQ	0x2
++extern	int crypto_unblock(u_int32_t, int);
++extern	void crypto_done(struct cryptop *crp);
++extern	void crypto_kdone(struct cryptkop *);
++extern	int crypto_getfeat(int *);
++
++extern	void crypto_freereq(struct cryptop *crp);
++extern	struct cryptop *crypto_getreq(int num);
++
++extern  int crypto_usercrypto;      /* userland may do crypto requests */
++extern  int crypto_userasymcrypto;  /* userland may do asym crypto reqs */
++extern  int crypto_devallowsoft;    /* only use hardware crypto */
++
++/*
++ * random number support,  crypto_unregister_all will unregister
++ */
++extern int crypto_rregister(u_int32_t driverid,
++		int (*read_random)(void *arg, u_int32_t *buf, int len), void *arg);
++extern int crypto_runregister_all(u_int32_t driverid);
++
++/*
++ * Crypto-related utility routines used mainly by drivers.
++ *
++ * XXX these don't really belong here; but for now they're
++ *     kept apart from the rest of the system.
++ */
++struct uio;
++extern	void cuio_copydata(struct uio* uio, int off, int len, caddr_t cp);
++extern	void cuio_copyback(struct uio* uio, int off, int len, caddr_t cp);
++extern	struct iovec *cuio_getptr(struct uio *uio, int loc, int *off);
++
++extern	void crypto_copyback(int flags, caddr_t buf, int off, int size,
++	    caddr_t in);
++extern	void crypto_copydata(int flags, caddr_t buf, int off, int size,
++	    caddr_t out);
++extern	int crypto_apply(int flags, caddr_t buf, int off, int len,
++	    int (*f)(void *, void *, u_int), void *arg);
++
++#endif /* __KERNEL__ */
++#endif /* _CRYPTO_CRYPTO_H_ */
+diff --git a/crypto/ocf/cryptosoft.c b/crypto/ocf/cryptosoft.c
+new file mode 100644
+index 0000000..aa2383d
+--- /dev/null
++++ b/crypto/ocf/cryptosoft.c
+@@ -0,0 +1,1322 @@
++/*
++ * An OCF module that uses the linux kernel cryptoapi, based on the
++ * original cryptosoft for BSD by Angelos D. Keromytis (angelos@cis.upenn.edu)
++ * but is mostly unrecognisable,
++ *
++ * Written by David McCullough <david_mccullough@mcafee.com>
++ * Copyright (C) 2004-2011 David McCullough
++ * Copyright (C) 2004-2005 Intel Corporation.
++ *
++ * LICENSE TERMS
++ *
++ * The free distribution and use of this software in both source and binary
++ * form is allowed (with or without changes) provided that:
++ *
++ *   1. distributions of this source code include the above copyright
++ *      notice, this list of conditions and the following disclaimer;
++ *
++ *   2. distributions in binary form include the above copyright
++ *      notice, this list of conditions and the following disclaimer
++ *      in the documentation and/or other associated materials;
++ *
++ *   3. the copyright holder's name is not used to endorse products
++ *      built using this software without specific written permission.
++ *
++ * ALTERNATIVELY, provided that this notice is retained in full, this product
++ * may be distributed under the terms of the GNU General Public License (GPL),
++ * in which case the provisions of the GPL apply INSTEAD OF those given above.
++ *
++ * DISCLAIMER
++ *
++ * This software is provided 'as is' with no explicit or implied warranties
++ * in respect of its properties, including, but not limited to, correctness
++ * and/or fitness for purpose.
++ * ---------------------------------------------------------------------------
++ */
++
++#include <linux/version.h>
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,38) && !defined(AUTOCONF_INCLUDED)
++#include <linux/config.h>
++#endif
++#include <linux/module.h>
++#include <linux/init.h>
++#include <linux/list.h>
++#include <linux/slab.h>
++#include <linux/sched.h>
++#include <linux/wait.h>
++#include <linux/crypto.h>
++#include <linux/mm.h>
++#include <linux/skbuff.h>
++#include <linux/random.h>
++#include <linux/interrupt.h>
++#include <linux/spinlock.h>
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,10)
++#include <linux/scatterlist.h>
++#endif
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,29)
++#include <crypto/hash.h>
++#endif
++
++#include <cryptodev.h>
++#include <uio.h>
++
++struct {
++	softc_device_decl	sc_dev;
++} swcr_softc;
++
++#define offset_in_page(p) ((unsigned long)(p) & ~PAGE_MASK)
++
++#define SW_TYPE_CIPHER		0x01
++#define SW_TYPE_HMAC		0x02
++#define SW_TYPE_HASH		0x04
++#define SW_TYPE_COMP		0x08
++#define SW_TYPE_BLKCIPHER	0x10
++#define SW_TYPE_ALG_MASK	0x1f
++
++#define SW_TYPE_ASYNC		0x8000
++
++#define SW_TYPE_INUSE		0x10000000
++
++/* We change some of the above if we have an async interface */
++
++#define SW_TYPE_ALG_AMASK	(SW_TYPE_ALG_MASK | SW_TYPE_ASYNC)
++
++#define SW_TYPE_ABLKCIPHER	(SW_TYPE_BLKCIPHER | SW_TYPE_ASYNC)
++#define SW_TYPE_AHASH		(SW_TYPE_HASH | SW_TYPE_ASYNC)
++#define SW_TYPE_AHMAC		(SW_TYPE_HMAC | SW_TYPE_ASYNC)
++
++#define SCATTERLIST_MAX 16
++
++struct swcr_data {
++	struct work_struct  workq;
++	int					sw_type;
++	int					sw_alg;
++	struct crypto_tfm	*sw_tfm;
++	spinlock_t			sw_tfm_lock;
++	union {
++		struct {
++			char *sw_key;
++			int  sw_klen;
++			int  sw_mlen;
++		} hmac;
++		void *sw_comp_buf;
++	} u;
++	struct swcr_data	*sw_next;
++};
++
++struct swcr_req {
++	struct swcr_data	*sw_head;
++	struct swcr_data	*sw;
++	struct cryptop		*crp;
++	struct cryptodesc	*crd;
++	struct scatterlist	 sg[SCATTERLIST_MAX];
++	unsigned char		 iv[EALG_MAX_BLOCK_LEN];
++	char				 result[HASH_MAX_LEN];
++	void				*crypto_req;
++};
++
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,20)
++static kmem_cache_t *swcr_req_cache;
++#else
++static struct kmem_cache *swcr_req_cache;
++#endif
++
++#ifndef CRYPTO_TFM_MODE_CBC
++/*
++ * As of linux-2.6.21 this is no longer defined, and presumably no longer
++ * needed to be passed into the crypto core code.
++ */
++#define	CRYPTO_TFM_MODE_CBC	0
++#define	CRYPTO_TFM_MODE_ECB	0
++#endif
++
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,19)
++	/*
++	 * Linux 2.6.19 introduced a new Crypto API, setup macro's to convert new
++	 * API into old API.
++	 */
++
++	/* Symmetric/Block Cipher */
++	struct blkcipher_desc
++	{
++		struct crypto_tfm *tfm;
++		void *info;
++	};
++	#define ecb(X)								#X , CRYPTO_TFM_MODE_ECB
++	#define cbc(X)								#X , CRYPTO_TFM_MODE_CBC
++	#define crypto_has_blkcipher(X, Y, Z)		crypto_alg_available(X, 0)
++	#define crypto_blkcipher_cast(X)			X
++	#define crypto_blkcipher_tfm(X)				X
++	#define crypto_alloc_blkcipher(X, Y, Z)		crypto_alloc_tfm(X, mode)
++	#define crypto_blkcipher_ivsize(X)			crypto_tfm_alg_ivsize(X)
++	#define crypto_blkcipher_blocksize(X)		crypto_tfm_alg_blocksize(X)
++	#define crypto_blkcipher_setkey(X, Y, Z)	crypto_cipher_setkey(X, Y, Z)
++	#define crypto_blkcipher_encrypt_iv(W, X, Y, Z)	\
++				crypto_cipher_encrypt_iv((W)->tfm, X, Y, Z, (u8 *)((W)->info))
++	#define crypto_blkcipher_decrypt_iv(W, X, Y, Z)	\
++				crypto_cipher_decrypt_iv((W)->tfm, X, Y, Z, (u8 *)((W)->info))
++	#define crypto_blkcipher_set_flags(x, y)	/* nop */
++	#define crypto_free_blkcipher(x)			crypto_free_tfm(x)
++	#define crypto_free_comp					crypto_free_tfm
++	#define crypto_free_hash					crypto_free_tfm
++
++	/* Hash/HMAC/Digest */
++	struct hash_desc
++	{
++		struct crypto_tfm *tfm;
++	};
++	#define hmac(X)							#X , 0
++	#define crypto_has_hash(X, Y, Z)		crypto_alg_available(X, 0)
++	#define crypto_hash_cast(X)				X
++	#define crypto_hash_tfm(X)				X
++	#define crypto_alloc_hash(X, Y, Z)		crypto_alloc_tfm(X, mode)
++	#define crypto_hash_digestsize(X)		crypto_tfm_alg_digestsize(X)
++	#define crypto_hash_digest(W, X, Y, Z)	\
++				crypto_digest_digest((W)->tfm, X, sg_num, Z)
++
++	/* Asymmetric Cipher */
++	#define crypto_has_cipher(X, Y, Z)		crypto_alg_available(X, 0)
++
++	/* Compression */
++	#define crypto_has_comp(X, Y, Z)		crypto_alg_available(X, 0)
++	#define crypto_comp_tfm(X)				X
++	#define crypto_comp_cast(X)				X
++	#define crypto_alloc_comp(X, Y, Z)		crypto_alloc_tfm(X, mode)
++	#define plain(X)	#X , 0
++#else
++	#define ecb(X)	"ecb(" #X ")" , 0
++	#define cbc(X)	"cbc(" #X ")" , 0
++	#define hmac(X)	"hmac(" #X ")" , 0
++	#define plain(X)	#X , 0
++#endif /* if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,19) */
++
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,22)
++/* no ablkcipher in older kernels */
++#define crypto_alloc_ablkcipher(a,b,c)		(NULL)
++#define crypto_ablkcipher_tfm(x)			((struct crypto_tfm *)(x))
++#define crypto_ablkcipher_set_flags(a, b)	/* nop */
++#define crypto_ablkcipher_setkey(x, y, z)	(-EINVAL)
++#define	crypto_has_ablkcipher(a,b,c)		(0)
++#else
++#define	HAVE_ABLKCIPHER
++#endif
++
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,32)
++/* no ahash in older kernels */
++#define crypto_ahash_tfm(x)					((struct crypto_tfm *)(x))
++#define	crypto_alloc_ahash(a,b,c)			(NULL)
++#define	crypto_ahash_digestsize(x)			0
++#else
++#define	HAVE_AHASH
++#endif
++
++struct crypto_details {
++	char *alg_name;
++	int mode;
++	int sw_type;
++};
++
++static struct crypto_details crypto_details[] = {
++	[CRYPTO_DES_CBC]         = { cbc(des),          SW_TYPE_BLKCIPHER, },
++	[CRYPTO_3DES_CBC]        = { cbc(des3_ede),     SW_TYPE_BLKCIPHER, },
++	[CRYPTO_BLF_CBC]         = { cbc(blowfish),     SW_TYPE_BLKCIPHER, },
++	[CRYPTO_CAST_CBC]        = { cbc(cast5),        SW_TYPE_BLKCIPHER, },
++	[CRYPTO_SKIPJACK_CBC]    = { cbc(skipjack),     SW_TYPE_BLKCIPHER, },
++	[CRYPTO_MD5_HMAC]        = { hmac(md5),         SW_TYPE_HMAC, },
++	[CRYPTO_SHA1_HMAC]       = { hmac(sha1),        SW_TYPE_HMAC, },
++	[CRYPTO_RIPEMD160_HMAC]  = { hmac(ripemd160),   SW_TYPE_HMAC, },
++	[CRYPTO_MD5_KPDK]        = { plain(md5-kpdk),   SW_TYPE_HASH, },
++	[CRYPTO_SHA1_KPDK]       = { plain(sha1-kpdk),  SW_TYPE_HASH, },
++	[CRYPTO_AES_CBC]         = { cbc(aes),          SW_TYPE_BLKCIPHER, },
++	[CRYPTO_ARC4]            = { ecb(arc4),         SW_TYPE_BLKCIPHER, },
++	[CRYPTO_MD5]             = { plain(md5),        SW_TYPE_HASH, },
++	[CRYPTO_SHA1]            = { plain(sha1),       SW_TYPE_HASH, },
++	[CRYPTO_NULL_HMAC]       = { hmac(digest_null), SW_TYPE_HMAC, },
++	[CRYPTO_NULL_CBC]        = { cbc(cipher_null),  SW_TYPE_BLKCIPHER, },
++	[CRYPTO_DEFLATE_COMP]    = { plain(deflate),    SW_TYPE_COMP, },
++	[CRYPTO_SHA2_256_HMAC]   = { hmac(sha256),      SW_TYPE_HMAC, },
++	[CRYPTO_SHA2_384_HMAC]   = { hmac(sha384),      SW_TYPE_HMAC, },
++	[CRYPTO_SHA2_512_HMAC]   = { hmac(sha512),      SW_TYPE_HMAC, },
++	[CRYPTO_CAMELLIA_CBC]    = { cbc(camellia),     SW_TYPE_BLKCIPHER, },
++	[CRYPTO_SHA2_256]        = { plain(sha256),     SW_TYPE_HASH, },
++	[CRYPTO_SHA2_384]        = { plain(sha384),     SW_TYPE_HASH, },
++	[CRYPTO_SHA2_512]        = { plain(sha512),     SW_TYPE_HASH, },
++	[CRYPTO_RIPEMD160]       = { plain(ripemd160),  SW_TYPE_HASH, },
++};
++
++int32_t swcr_id = -1;
++module_param(swcr_id, int, 0444);
++MODULE_PARM_DESC(swcr_id, "Read-Only OCF ID for cryptosoft driver");
++
++int swcr_fail_if_compression_grows = 1;
++module_param(swcr_fail_if_compression_grows, int, 0644);
++MODULE_PARM_DESC(swcr_fail_if_compression_grows,
++                "Treat compression that results in more data as a failure");
++
++int swcr_no_ahash = 0;
++module_param(swcr_no_ahash, int, 0644);
++MODULE_PARM_DESC(swcr_no_ahash,
++                "Do not use async hash/hmac even if available");
++
++int swcr_no_ablk = 0;
++module_param(swcr_no_ablk, int, 0644);
++MODULE_PARM_DESC(swcr_no_ablk,
++                "Do not use async blk ciphers even if available");
++
++static struct swcr_data **swcr_sessions = NULL;
++static u_int32_t swcr_sesnum = 0;
++
++static	int swcr_process(device_t, struct cryptop *, int);
++static	int swcr_newsession(device_t, u_int32_t *, struct cryptoini *);
++static	int swcr_freesession(device_t, u_int64_t);
++
++static device_method_t swcr_methods = {
++	/* crypto device methods */
++	DEVMETHOD(cryptodev_newsession,	swcr_newsession),
++	DEVMETHOD(cryptodev_freesession,swcr_freesession),
++	DEVMETHOD(cryptodev_process,	swcr_process),
++};
++
++#define debug swcr_debug
++int swcr_debug = 0;
++module_param(swcr_debug, int, 0644);
++MODULE_PARM_DESC(swcr_debug, "Enable debug");
++
++static void swcr_process_req(struct swcr_req *req);
++
++/*
++ * somethings just need to be run with user context no matter whether
++ * the kernel compression libs use vmalloc/vfree for example.
++ */
++
++typedef struct {
++	struct work_struct wq;
++	void	(*func)(void *arg);
++	void	*arg;
++} execute_later_t;
++
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,20)
++static void
++doing_it_now(struct work_struct *wq)
++{
++	execute_later_t *w = container_of(wq, execute_later_t, wq);
++	(w->func)(w->arg);
++	kfree(w);
++}
++#else
++static void
++doing_it_now(void *arg)
++{
++	execute_later_t *w = (execute_later_t *) arg;
++	(w->func)(w->arg);
++	kfree(w);
++}
++#endif
++
++static void
++execute_later(void (fn)(void *), void *arg)
++{
++	execute_later_t *w;
++
++	w = (execute_later_t *) kmalloc(sizeof(execute_later_t), SLAB_ATOMIC);
++	if (w) {
++		memset(w, '\0', sizeof(w));
++		w->func = fn;
++		w->arg = arg;
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,20)
++		INIT_WORK(&w->wq, doing_it_now);
++#else
++		INIT_WORK(&w->wq, doing_it_now, w);
++#endif
++		schedule_work(&w->wq);
++	}
++}
++
++/*
++ * Generate a new software session.
++ */
++static int
++swcr_newsession(device_t dev, u_int32_t *sid, struct cryptoini *cri)
++{
++	struct swcr_data **swd;
++	u_int32_t i;
++	int error;
++	char *algo;
++	int mode;
++
++	dprintk("%s()\n", __FUNCTION__);
++	if (sid == NULL || cri == NULL) {
++		dprintk("%s,%d - EINVAL\n", __FILE__, __LINE__);
++		return EINVAL;
++	}
++
++	if (swcr_sessions) {
++		for (i = 1; i < swcr_sesnum; i++)
++			if (swcr_sessions[i] == NULL)
++				break;
++	} else
++		i = 1;		/* NB: to silence compiler warning */
++
++	if (swcr_sessions == NULL || i == swcr_sesnum) {
++		if (swcr_sessions == NULL) {
++			i = 1; /* We leave swcr_sessions[0] empty */
++			swcr_sesnum = CRYPTO_SW_SESSIONS;
++		} else
++			swcr_sesnum *= 2;
++
++		swd = kmalloc(swcr_sesnum * sizeof(struct swcr_data *), SLAB_ATOMIC);
++		if (swd == NULL) {
++			/* Reset session number */
++			if (swcr_sesnum == CRYPTO_SW_SESSIONS)
++				swcr_sesnum = 0;
++			else
++				swcr_sesnum /= 2;
++			dprintk("%s,%d: ENOBUFS\n", __FILE__, __LINE__);
++			return ENOBUFS;
++		}
++		memset(swd, 0, swcr_sesnum * sizeof(struct swcr_data *));
++
++		/* Copy existing sessions */
++		if (swcr_sessions) {
++			memcpy(swd, swcr_sessions,
++			    (swcr_sesnum / 2) * sizeof(struct swcr_data *));
++			kfree(swcr_sessions);
++		}
++
++		swcr_sessions = swd;
++	}
++
++	swd = &swcr_sessions[i];
++	*sid = i;
++
++	while (cri) {
++		*swd = (struct swcr_data *) kmalloc(sizeof(struct swcr_data),
++				SLAB_ATOMIC);
++		if (*swd == NULL) {
++			swcr_freesession(NULL, i);
++			dprintk("%s,%d: ENOBUFS\n", __FILE__, __LINE__);
++			return ENOBUFS;
++		}
++		memset(*swd, 0, sizeof(struct swcr_data));
++
++		if (cri->cri_alg < 0 ||
++				cri->cri_alg>=sizeof(crypto_details)/sizeof(crypto_details[0])){
++			printk("cryptosoft: Unknown algorithm 0x%x\n", cri->cri_alg);
++			swcr_freesession(NULL, i);
++			return EINVAL;
++		}
++
++		algo = crypto_details[cri->cri_alg].alg_name;
++		if (!algo || !*algo) {
++			printk("cryptosoft: Unsupported algorithm 0x%x\n", cri->cri_alg);
++			swcr_freesession(NULL, i);
++			return EINVAL;
++		}
++
++		mode = crypto_details[cri->cri_alg].mode;
++		(*swd)->sw_type = crypto_details[cri->cri_alg].sw_type;
++		(*swd)->sw_alg = cri->cri_alg;
++
++		spin_lock_init(&(*swd)->sw_tfm_lock);
++
++		/* Algorithm specific configuration */
++		switch (cri->cri_alg) {
++		case CRYPTO_NULL_CBC:
++			cri->cri_klen = 0; /* make it work with crypto API */
++			break;
++		default:
++			break;
++		}
++
++		if ((*swd)->sw_type & SW_TYPE_BLKCIPHER) {
++			dprintk("%s crypto_alloc_*blkcipher(%s, 0x%x)\n", __FUNCTION__,
++					algo, mode);
++
++			/* try async first */
++			(*swd)->sw_tfm = swcr_no_ablk ? NULL :
++					crypto_ablkcipher_tfm(crypto_alloc_ablkcipher(algo, 0, 0));
++			if ((*swd)->sw_tfm && !IS_ERR((*swd)->sw_tfm)) {
++				dprintk("%s %s cipher is async\n", __FUNCTION__, algo);
++				(*swd)->sw_type |= SW_TYPE_ASYNC;
++			} else {
++				(*swd)->sw_tfm = crypto_blkcipher_tfm(
++						crypto_alloc_blkcipher(algo, 0, CRYPTO_ALG_ASYNC));
++				if ((*swd)->sw_tfm && !IS_ERR((*swd)->sw_tfm))
++					dprintk("%s %s cipher is sync\n", __FUNCTION__, algo);
++			}
++			if (!(*swd)->sw_tfm || IS_ERR((*swd)->sw_tfm)) {
++				int err;
++				dprintk("cryptosoft: crypto_alloc_blkcipher failed(%s, 0x%x)\n",
++						algo,mode);
++				err = IS_ERR((*swd)->sw_tfm) ? -(PTR_ERR((*swd)->sw_tfm)) : EINVAL;
++				(*swd)->sw_tfm = NULL; /* ensure NULL */
++				swcr_freesession(NULL, i);
++				return err;
++			}
++
++			if (debug) {
++				dprintk("%s key:cri->cri_klen=%d,(cri->cri_klen + 7)/8=%d",
++						__FUNCTION__, cri->cri_klen, (cri->cri_klen + 7) / 8);
++				for (i = 0; i < (cri->cri_klen + 7) / 8; i++)
++					dprintk("%s0x%x", (i % 8) ? " " : "\n    ",
++							cri->cri_key[i] & 0xff);
++				dprintk("\n");
++			}
++			if ((*swd)->sw_type & SW_TYPE_ASYNC) {
++				/* OCF doesn't enforce keys */
++				crypto_ablkcipher_set_flags(
++						__crypto_ablkcipher_cast((*swd)->sw_tfm),
++							CRYPTO_TFM_REQ_WEAK_KEY);
++				error = crypto_ablkcipher_setkey(
++							__crypto_ablkcipher_cast((*swd)->sw_tfm),
++								cri->cri_key, (cri->cri_klen + 7) / 8);
++			} else {
++				/* OCF doesn't enforce keys */
++				crypto_blkcipher_set_flags(
++						crypto_blkcipher_cast((*swd)->sw_tfm),
++							CRYPTO_TFM_REQ_WEAK_KEY);
++				error = crypto_blkcipher_setkey(
++							crypto_blkcipher_cast((*swd)->sw_tfm),
++								cri->cri_key, (cri->cri_klen + 7) / 8);
++			}
++			if (error) {
++				printk("cryptosoft: setkey failed %d (crt_flags=0x%x)\n", error,
++						(*swd)->sw_tfm->crt_flags);
++				swcr_freesession(NULL, i);
++				return error;
++			}
++		} else if ((*swd)->sw_type & (SW_TYPE_HMAC | SW_TYPE_HASH)) {
++			dprintk("%s crypto_alloc_*hash(%s, 0x%x)\n", __FUNCTION__,
++					algo, mode);
++
++			/* try async first */
++			(*swd)->sw_tfm = swcr_no_ahash ? NULL :
++					crypto_ahash_tfm(crypto_alloc_ahash(algo, 0, 0));
++			if ((*swd)->sw_tfm) {
++				dprintk("%s %s hash is async\n", __FUNCTION__, algo);
++				(*swd)->sw_type |= SW_TYPE_ASYNC;
++			} else {
++				dprintk("%s %s hash is sync\n", __FUNCTION__, algo);
++				(*swd)->sw_tfm = crypto_hash_tfm(
++						crypto_alloc_hash(algo, 0, CRYPTO_ALG_ASYNC));
++			}
++
++			if (!(*swd)->sw_tfm) {
++				dprintk("cryptosoft: crypto_alloc_hash failed(%s,0x%x)\n",
++						algo, mode);
++				swcr_freesession(NULL, i);
++				return EINVAL;
++			}
++
++			(*swd)->u.hmac.sw_klen = (cri->cri_klen + 7) / 8;
++			(*swd)->u.hmac.sw_key = (char *)kmalloc((*swd)->u.hmac.sw_klen,
++					SLAB_ATOMIC);
++			if ((*swd)->u.hmac.sw_key == NULL) {
++				swcr_freesession(NULL, i);
++				dprintk("%s,%d: ENOBUFS\n", __FILE__, __LINE__);
++				return ENOBUFS;
++			}
++			memcpy((*swd)->u.hmac.sw_key, cri->cri_key, (*swd)->u.hmac.sw_klen);
++			if (cri->cri_mlen) {
++				(*swd)->u.hmac.sw_mlen = cri->cri_mlen;
++			} else if ((*swd)->sw_type & SW_TYPE_ASYNC) {
++				(*swd)->u.hmac.sw_mlen = crypto_ahash_digestsize(
++						__crypto_ahash_cast((*swd)->sw_tfm));
++			} else  {
++				(*swd)->u.hmac.sw_mlen = crypto_hash_digestsize(
++						crypto_hash_cast((*swd)->sw_tfm));
++			}
++		} else if ((*swd)->sw_type & SW_TYPE_COMP) {
++			(*swd)->sw_tfm = crypto_comp_tfm(
++					crypto_alloc_comp(algo, 0, CRYPTO_ALG_ASYNC));
++			if (!(*swd)->sw_tfm) {
++				dprintk("cryptosoft: crypto_alloc_comp failed(%s,0x%x)\n",
++						algo, mode);
++				swcr_freesession(NULL, i);
++				return EINVAL;
++			}
++			(*swd)->u.sw_comp_buf = kmalloc(CRYPTO_MAX_DATA_LEN, SLAB_ATOMIC);
++			if ((*swd)->u.sw_comp_buf == NULL) {
++				swcr_freesession(NULL, i);
++				dprintk("%s,%d: ENOBUFS\n", __FILE__, __LINE__);
++				return ENOBUFS;
++			}
++		} else {
++			printk("cryptosoft: Unhandled sw_type %d\n", (*swd)->sw_type);
++			swcr_freesession(NULL, i);
++			return EINVAL;
++		}
++
++		cri = cri->cri_next;
++		swd = &((*swd)->sw_next);
++	}
++	return 0;
++}
++
++/*
++ * Free a session.
++ */
++static int
++swcr_freesession(device_t dev, u_int64_t tid)
++{
++	struct swcr_data *swd;
++	u_int32_t sid = CRYPTO_SESID2LID(tid);
++
++	dprintk("%s()\n", __FUNCTION__);
++	if (sid > swcr_sesnum || swcr_sessions == NULL ||
++			swcr_sessions[sid] == NULL) {
++		dprintk("%s,%d: EINVAL\n", __FILE__, __LINE__);
++		return(EINVAL);
++	}
++
++	/* Silently accept and return */
++	if (sid == 0)
++		return(0);
++
++	while ((swd = swcr_sessions[sid]) != NULL) {
++		swcr_sessions[sid] = swd->sw_next;
++		if (swd->sw_tfm) {
++			switch (swd->sw_type & SW_TYPE_ALG_AMASK) {
++#ifdef HAVE_AHASH
++			case SW_TYPE_AHMAC:
++			case SW_TYPE_AHASH:
++				crypto_free_ahash(__crypto_ahash_cast(swd->sw_tfm));
++				break;
++#endif
++#ifdef HAVE_ABLKCIPHER
++			case SW_TYPE_ABLKCIPHER:
++				crypto_free_ablkcipher(__crypto_ablkcipher_cast(swd->sw_tfm));
++				break;
++#endif
++			case SW_TYPE_BLKCIPHER:
++				crypto_free_blkcipher(crypto_blkcipher_cast(swd->sw_tfm));
++				break;
++			case SW_TYPE_HMAC:
++			case SW_TYPE_HASH:
++				crypto_free_hash(crypto_hash_cast(swd->sw_tfm));
++				break;
++			case SW_TYPE_COMP:
++				if (in_interrupt())
++					execute_later((void (*)(void *))crypto_free_comp, (void *)crypto_comp_cast(swd->sw_tfm));
++				else
++					crypto_free_comp(crypto_comp_cast(swd->sw_tfm));
++				break;
++			default:
++				crypto_free_tfm(swd->sw_tfm);
++				break;
++			}
++			swd->sw_tfm = NULL;
++		}
++		if (swd->sw_type & SW_TYPE_COMP) {
++			if (swd->u.sw_comp_buf)
++				kfree(swd->u.sw_comp_buf);
++		} else {
++			if (swd->u.hmac.sw_key)
++				kfree(swd->u.hmac.sw_key);
++		}
++		kfree(swd);
++	}
++	return 0;
++}
++
++static void swcr_process_req_complete(struct swcr_req *req)
++{
++	dprintk("%s()\n", __FUNCTION__);
++
++	if (req->sw->sw_type & SW_TYPE_INUSE) {
++		unsigned long flags;
++		spin_lock_irqsave(&req->sw->sw_tfm_lock, flags);
++		req->sw->sw_type &= ~SW_TYPE_INUSE;
++		spin_unlock_irqrestore(&req->sw->sw_tfm_lock, flags);
++	}
++
++	if (req->crp->crp_etype)
++		goto done;
++
++	switch (req->sw->sw_type & SW_TYPE_ALG_AMASK) {
++#if defined(HAVE_AHASH)
++	case SW_TYPE_AHMAC:
++	case SW_TYPE_AHASH:
++		crypto_copyback(req->crp->crp_flags, req->crp->crp_buf,
++				req->crd->crd_inject, req->sw->u.hmac.sw_mlen, req->result);
++		ahash_request_free(req->crypto_req);
++		break;
++#endif
++#if defined(HAVE_ABLKCIPHER)
++	case SW_TYPE_ABLKCIPHER:
++		ablkcipher_request_free(req->crypto_req);
++		break;
++#endif
++	case SW_TYPE_CIPHER:
++	case SW_TYPE_HMAC:
++	case SW_TYPE_HASH:
++	case SW_TYPE_COMP:
++	case SW_TYPE_BLKCIPHER:
++		break;
++	default:
++		req->crp->crp_etype = EINVAL;
++		goto done;
++	}
++
++	req->crd = req->crd->crd_next;
++	if (req->crd) {
++		swcr_process_req(req);
++		return;
++	}
++
++done:
++	dprintk("%s crypto_done %p\n", __FUNCTION__, req);
++	crypto_done(req->crp);
++	kmem_cache_free(swcr_req_cache, req);
++}
++
++#if defined(HAVE_ABLKCIPHER) || defined(HAVE_AHASH)
++static void swcr_process_callback(struct crypto_async_request *creq, int err)
++{
++	struct swcr_req *req = creq->data;
++
++	dprintk("%s()\n", __FUNCTION__);
++	if (err) {
++		if (err == -EINPROGRESS)
++			return;
++		dprintk("%s() fail %d\n", __FUNCTION__, -err);
++		req->crp->crp_etype = -err;
++	}
++
++	swcr_process_req_complete(req);
++}
++#endif /* defined(HAVE_ABLKCIPHER) || defined(HAVE_AHASH) */
++
++
++static void swcr_process_req(struct swcr_req *req)
++{
++	struct swcr_data *sw;
++	struct cryptop *crp = req->crp;
++	struct cryptodesc *crd = req->crd;
++	struct sk_buff *skb = (struct sk_buff *) crp->crp_buf;
++	struct uio *uiop = (struct uio *) crp->crp_buf;
++	int sg_num, sg_len, skip;
++
++	dprintk("%s()\n", __FUNCTION__);
++
++	/*
++	 * Find the crypto context.
++	 *
++	 * XXX Note that the logic here prevents us from having
++	 * XXX the same algorithm multiple times in a session
++	 * XXX (or rather, we can but it won't give us the right
++	 * XXX results). To do that, we'd need some way of differentiating
++	 * XXX between the various instances of an algorithm (so we can
++	 * XXX locate the correct crypto context).
++	 */
++	for (sw = req->sw_head; sw && sw->sw_alg != crd->crd_alg; sw = sw->sw_next)
++		;
++
++	/* No such context ? */
++	if (sw == NULL) {
++		crp->crp_etype = EINVAL;
++		dprintk("%s,%d: EINVAL\n", __FILE__, __LINE__);
++		goto done;
++	}
++
++	/*
++	 * for some types we need to ensure only one user as info is stored in
++	 * the tfm during an operation that can get corrupted
++	 */
++	switch (sw->sw_type & SW_TYPE_ALG_AMASK) {
++#ifdef HAVE_AHASH
++	case SW_TYPE_AHMAC:
++	case SW_TYPE_AHASH:
++#endif
++	case SW_TYPE_HMAC:
++	case SW_TYPE_HASH: {
++		unsigned long flags;
++		spin_lock_irqsave(&sw->sw_tfm_lock, flags);
++		if (sw->sw_type & SW_TYPE_INUSE) {
++			spin_unlock_irqrestore(&sw->sw_tfm_lock, flags);
++			execute_later((void (*)(void *))swcr_process_req, (void *)req);
++			return;
++		}
++		sw->sw_type |= SW_TYPE_INUSE;
++		spin_unlock_irqrestore(&sw->sw_tfm_lock, flags);
++		} break;
++	}
++
++	req->sw = sw;
++	skip = crd->crd_skip;
++
++	/*
++	 * setup the SG list skip from the start of the buffer
++	 */
++	memset(req->sg, 0, sizeof(req->sg));
++	sg_init_table(req->sg, SCATTERLIST_MAX);
++	if (crp->crp_flags & CRYPTO_F_SKBUF) {
++		int i, len;
++
++		sg_num = 0;
++		sg_len = 0;
++
++		if (skip < skb_headlen(skb)) {
++			len = skb_headlen(skb) - skip;
++			if (len + sg_len > crd->crd_len)
++				len = crd->crd_len - sg_len;
++			sg_set_page(&req->sg[sg_num],
++				virt_to_page(skb->data + skip), len,
++				offset_in_page(skb->data + skip));
++			sg_len += len;
++			sg_num++;
++			skip = 0;
++		} else
++			skip -= skb_headlen(skb);
++
++		for (i = 0; sg_len < crd->crd_len &&
++					i < skb_shinfo(skb)->nr_frags &&
++					sg_num < SCATTERLIST_MAX; i++) {
++			if (skip < skb_shinfo(skb)->frags[i].size) {
++				len = skb_shinfo(skb)->frags[i].size - skip;
++				if (len + sg_len > crd->crd_len)
++					len = crd->crd_len - sg_len;
++				sg_set_page(&req->sg[sg_num],
++					skb_frag_page(&skb_shinfo(skb)->frags[i]),
++					len,
++					skb_shinfo(skb)->frags[i].page_offset + skip);
++				sg_len += len;
++				sg_num++;
++				skip = 0;
++			} else
++				skip -= skb_shinfo(skb)->frags[i].size;
++		}
++	} else if (crp->crp_flags & CRYPTO_F_IOV) {
++		int len;
++
++		sg_len = 0;
++		for (sg_num = 0; sg_len < crd->crd_len &&
++				sg_num < uiop->uio_iovcnt &&
++				sg_num < SCATTERLIST_MAX; sg_num++) {
++			if (skip <= uiop->uio_iov[sg_num].iov_len) {
++				len = uiop->uio_iov[sg_num].iov_len - skip;
++				if (len + sg_len > crd->crd_len)
++					len = crd->crd_len - sg_len;
++				sg_set_page(&req->sg[sg_num],
++					virt_to_page(uiop->uio_iov[sg_num].iov_base+skip),
++					len,
++					offset_in_page(uiop->uio_iov[sg_num].iov_base+skip));
++				sg_len += len;
++				skip = 0;
++			} else
++				skip -= uiop->uio_iov[sg_num].iov_len;
++		}
++	} else {
++		sg_len = (crp->crp_ilen - skip);
++		if (sg_len > crd->crd_len)
++			sg_len = crd->crd_len;
++		sg_set_page(&req->sg[0], virt_to_page(crp->crp_buf + skip),
++			sg_len, offset_in_page(crp->crp_buf + skip));
++		sg_num = 1;
++	}
++	if (sg_num > 0)
++		sg_mark_end(&req->sg[sg_num-1]);
++
++	switch (sw->sw_type & SW_TYPE_ALG_AMASK) {
++
++#ifdef HAVE_AHASH
++	case SW_TYPE_AHMAC:
++	case SW_TYPE_AHASH:
++		{
++		int ret;
++
++		/* check we have room for the result */
++		if (crp->crp_ilen - crd->crd_inject < sw->u.hmac.sw_mlen) {
++			dprintk("cryptosoft: EINVAL crp_ilen=%d, len=%d, inject=%d "
++					"digestsize=%d\n", crp->crp_ilen, crd->crd_skip + sg_len,
++					crd->crd_inject, sw->u.hmac.sw_mlen);
++			crp->crp_etype = EINVAL;
++			goto done;
++		}
++
++		req->crypto_req =
++				ahash_request_alloc(__crypto_ahash_cast(sw->sw_tfm),GFP_ATOMIC);
++		if (!req->crypto_req) {
++			crp->crp_etype = ENOMEM;
++			dprintk("%s,%d: ENOMEM ahash_request_alloc", __FILE__, __LINE__);
++			goto done;
++		}
++
++		ahash_request_set_callback(req->crypto_req,
++				CRYPTO_TFM_REQ_MAY_BACKLOG, swcr_process_callback, req);
++
++		memset(req->result, 0, sizeof(req->result));
++
++		if (sw->sw_type & SW_TYPE_AHMAC)
++			crypto_ahash_setkey(__crypto_ahash_cast(sw->sw_tfm),
++					sw->u.hmac.sw_key, sw->u.hmac.sw_klen);
++		ahash_request_set_crypt(req->crypto_req, req->sg, req->result, sg_len);
++		ret = crypto_ahash_digest(req->crypto_req);
++		switch (ret) {
++		case -EINPROGRESS:
++		case -EBUSY:
++			return;
++		default:
++		case 0:
++			dprintk("hash OP %s %d\n", ret ? "failed" : "success", ret);
++			crp->crp_etype = ret;
++			goto done;
++		}
++		} break;
++#endif /* HAVE_AHASH */
++
++#ifdef HAVE_ABLKCIPHER
++	case SW_TYPE_ABLKCIPHER: {
++		int ret;
++		unsigned char *ivp = req->iv;
++		int ivsize =
++			crypto_ablkcipher_ivsize(__crypto_ablkcipher_cast(sw->sw_tfm));
++
++		if (sg_len < crypto_ablkcipher_blocksize(
++				__crypto_ablkcipher_cast(sw->sw_tfm))) {
++			crp->crp_etype = EINVAL;
++			dprintk("%s,%d: EINVAL len %d < %d\n", __FILE__, __LINE__,
++					sg_len, crypto_ablkcipher_blocksize(
++						__crypto_ablkcipher_cast(sw->sw_tfm)));
++			goto done;
++		}
++
++		if (ivsize > sizeof(req->iv)) {
++			crp->crp_etype = EINVAL;
++			dprintk("%s,%d: EINVAL\n", __FILE__, __LINE__);
++			goto done;
++		}
++
++		req->crypto_req = ablkcipher_request_alloc(
++				__crypto_ablkcipher_cast(sw->sw_tfm), GFP_ATOMIC);
++		if (!req->crypto_req) {
++			crp->crp_etype = ENOMEM;
++			dprintk("%s,%d: ENOMEM ablkcipher_request_alloc",
++					__FILE__, __LINE__);
++			goto done;
++		}
++
++		ablkcipher_request_set_callback(req->crypto_req,
++				CRYPTO_TFM_REQ_MAY_BACKLOG, swcr_process_callback, req);
++
++		if (crd->crd_flags & CRD_F_KEY_EXPLICIT) {
++			int i, error;
++
++			if (debug) {
++				dprintk("%s key:", __FUNCTION__);
++				for (i = 0; i < (crd->crd_klen + 7) / 8; i++)
++					dprintk("%s0x%x", (i % 8) ? " " : "\n    ",
++							crd->crd_key[i] & 0xff);
++				dprintk("\n");
++			}
++			/* OCF doesn't enforce keys */
++			crypto_ablkcipher_set_flags(__crypto_ablkcipher_cast(sw->sw_tfm),
++					CRYPTO_TFM_REQ_WEAK_KEY);
++			error = crypto_ablkcipher_setkey(
++						__crypto_ablkcipher_cast(sw->sw_tfm), crd->crd_key,
++						(crd->crd_klen + 7) / 8);
++			if (error) {
++				dprintk("cryptosoft: setkey failed %d (crt_flags=0x%x)\n",
++						error, sw->sw_tfm->crt_flags);
++				crp->crp_etype = -error;
++			}
++		}
++
++		if (crd->crd_flags & CRD_F_ENCRYPT) { /* encrypt */
++
++			if (crd->crd_flags & CRD_F_IV_EXPLICIT)
++				ivp = crd->crd_iv;
++			else
++				get_random_bytes(ivp, ivsize);
++			/*
++			 * do we have to copy the IV back to the buffer ?
++			 */
++			if ((crd->crd_flags & CRD_F_IV_PRESENT) == 0) {
++				crypto_copyback(crp->crp_flags, crp->crp_buf,
++						crd->crd_inject, ivsize, (caddr_t)ivp);
++			}
++			ablkcipher_request_set_crypt(req->crypto_req, req->sg, req->sg,
++					sg_len, ivp);
++			ret = crypto_ablkcipher_encrypt(req->crypto_req);
++
++		} else { /*decrypt */
++
++			if (crd->crd_flags & CRD_F_IV_EXPLICIT)
++				ivp = crd->crd_iv;
++			else
++				crypto_copydata(crp->crp_flags, crp->crp_buf,
++						crd->crd_inject, ivsize, (caddr_t)ivp);
++			ablkcipher_request_set_crypt(req->crypto_req, req->sg, req->sg,
++					sg_len, ivp);
++			ret = crypto_ablkcipher_decrypt(req->crypto_req);
++		}
++
++		switch (ret) {
++		case -EINPROGRESS:
++		case -EBUSY:
++			return;
++		default:
++		case 0:
++			dprintk("crypto OP %s %d\n", ret ? "failed" : "success", ret);
++			crp->crp_etype = ret;
++			goto done;
++		}
++		} break;
++#endif /* HAVE_ABLKCIPHER */
++
++	case SW_TYPE_BLKCIPHER: {
++		unsigned char iv[EALG_MAX_BLOCK_LEN];
++		unsigned char *ivp = iv;
++		struct blkcipher_desc desc;
++		int ivsize = crypto_blkcipher_ivsize(crypto_blkcipher_cast(sw->sw_tfm));
++
++		if (sg_len < crypto_blkcipher_blocksize(
++				crypto_blkcipher_cast(sw->sw_tfm))) {
++			crp->crp_etype = EINVAL;
++			dprintk("%s,%d: EINVAL len %d < %d\n", __FILE__, __LINE__,
++					sg_len, crypto_blkcipher_blocksize(
++						crypto_blkcipher_cast(sw->sw_tfm)));
++			goto done;
++		}
++
++		if (ivsize > sizeof(iv)) {
++			crp->crp_etype = EINVAL;
++			dprintk("%s,%d: EINVAL\n", __FILE__, __LINE__);
++			goto done;
++		}
++
++		if (crd->crd_flags & CRD_F_KEY_EXPLICIT) {
++			int i, error;
++
++			if (debug) {
++				dprintk("%s key:", __FUNCTION__);
++				for (i = 0; i < (crd->crd_klen + 7) / 8; i++)
++					dprintk("%s0x%x", (i % 8) ? " " : "\n    ",
++							crd->crd_key[i] & 0xff);
++				dprintk("\n");
++			}
++			/* OCF doesn't enforce keys */
++			crypto_blkcipher_set_flags(crypto_blkcipher_cast(sw->sw_tfm),
++					CRYPTO_TFM_REQ_WEAK_KEY);
++			error = crypto_blkcipher_setkey(
++						crypto_blkcipher_cast(sw->sw_tfm), crd->crd_key,
++						(crd->crd_klen + 7) / 8);
++			if (error) {
++				dprintk("cryptosoft: setkey failed %d (crt_flags=0x%x)\n",
++						error, sw->sw_tfm->crt_flags);
++				crp->crp_etype = -error;
++			}
++		}
++
++		memset(&desc, 0, sizeof(desc));
++		desc.tfm = crypto_blkcipher_cast(sw->sw_tfm);
++
++		if (crd->crd_flags & CRD_F_ENCRYPT) { /* encrypt */
++
++			if (crd->crd_flags & CRD_F_IV_EXPLICIT) {
++				ivp = crd->crd_iv;
++			} else {
++				get_random_bytes(ivp, ivsize);
++			}
++			/*
++			 * do we have to copy the IV back to the buffer ?
++			 */
++			if ((crd->crd_flags & CRD_F_IV_PRESENT) == 0) {
++				crypto_copyback(crp->crp_flags, crp->crp_buf,
++						crd->crd_inject, ivsize, (caddr_t)ivp);
++			}
++			desc.info = ivp;
++			crypto_blkcipher_encrypt_iv(&desc, req->sg, req->sg, sg_len);
++
++		} else { /*decrypt */
++
++			if (crd->crd_flags & CRD_F_IV_EXPLICIT) {
++				ivp = crd->crd_iv;
++			} else {
++				crypto_copydata(crp->crp_flags, crp->crp_buf,
++						crd->crd_inject, ivsize, (caddr_t)ivp);
++			}
++			desc.info = ivp;
++			crypto_blkcipher_decrypt_iv(&desc, req->sg, req->sg, sg_len);
++		}
++		} break;
++
++	case SW_TYPE_HMAC:
++	case SW_TYPE_HASH:
++		{
++		char result[HASH_MAX_LEN];
++		struct hash_desc desc;
++
++		/* check we have room for the result */
++		if (crp->crp_ilen - crd->crd_inject < sw->u.hmac.sw_mlen) {
++			dprintk("cryptosoft: EINVAL crp_ilen=%d, len=%d, inject=%d "
++					"digestsize=%d\n", crp->crp_ilen, crd->crd_skip + sg_len,
++					crd->crd_inject, sw->u.hmac.sw_mlen);
++			crp->crp_etype = EINVAL;
++			goto done;
++		}
++
++		memset(&desc, 0, sizeof(desc));
++		desc.tfm = crypto_hash_cast(sw->sw_tfm);
++
++		memset(result, 0, sizeof(result));
++
++		if (sw->sw_type & SW_TYPE_HMAC) {
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,19)
++			crypto_hmac(sw->sw_tfm, sw->u.hmac.sw_key, &sw->u.hmac.sw_klen,
++					req->sg, sg_num, result);
++#else
++			crypto_hash_setkey(desc.tfm, sw->u.hmac.sw_key,
++					sw->u.hmac.sw_klen);
++			crypto_hash_digest(&desc, req->sg, sg_len, result);
++#endif /* LINUX_VERSION_CODE < KERNEL_VERSION(2,6,19) */
++
++		} else { /* SW_TYPE_HASH */
++			crypto_hash_digest(&desc, req->sg, sg_len, result);
++		}
++
++		crypto_copyback(crp->crp_flags, crp->crp_buf,
++				crd->crd_inject, sw->u.hmac.sw_mlen, result);
++		}
++		break;
++
++	case SW_TYPE_COMP: {
++		void *ibuf = NULL;
++		void *obuf = sw->u.sw_comp_buf;
++		int ilen = sg_len, olen = CRYPTO_MAX_DATA_LEN;
++		int ret = 0;
++
++		/*
++		 * we need to use an additional copy if there is more than one
++		 * input chunk since the kernel comp routines do not handle
++		 * SG yet.  Otherwise we just use the input buffer as is.
++		 * Rather than allocate another buffer we just split the tmp
++		 * buffer we already have.
++		 * Perhaps we should just use zlib directly ?
++		 */
++		if (sg_num > 1) {
++			int blk;
++
++			ibuf = obuf;
++			for (blk = 0; blk < sg_num; blk++) {
++				memcpy(obuf, sg_virt(&req->sg[blk]),
++						req->sg[blk].length);
++				obuf += req->sg[blk].length;
++			}
++			olen -= sg_len;
++		} else
++			ibuf = sg_virt(&req->sg[0]);
++
++		if (crd->crd_flags & CRD_F_ENCRYPT) { /* compress */
++			ret = crypto_comp_compress(crypto_comp_cast(sw->sw_tfm),
++					ibuf, ilen, obuf, &olen);
++			if (!ret && olen > crd->crd_len) {
++				dprintk("cryptosoft: ERANGE compress %d into %d\n",
++						crd->crd_len, olen);
++				if (swcr_fail_if_compression_grows)
++					ret = ERANGE;
++			}
++		} else { /* decompress */
++			ret = crypto_comp_decompress(crypto_comp_cast(sw->sw_tfm),
++					ibuf, ilen, obuf, &olen);
++			if (!ret && (olen + crd->crd_inject) > crp->crp_olen) {
++				dprintk("cryptosoft: ETOOSMALL decompress %d into %d, "
++						"space for %d,at offset %d\n",
++						crd->crd_len, olen, crp->crp_olen, crd->crd_inject);
++				ret = ETOOSMALL;
++			}
++		}
++		if (ret)
++			dprintk("%s,%d: ret = %d\n", __FILE__, __LINE__, ret);
++
++		/*
++		 * on success copy result back,
++		 * linux crpyto API returns -errno,  we need to fix that
++		 */
++		crp->crp_etype = ret < 0 ? -ret : ret;
++		if (ret == 0) {
++			/* copy back the result and return it's size */
++			crypto_copyback(crp->crp_flags, crp->crp_buf,
++					crd->crd_inject, olen, obuf);
++			crp->crp_olen = olen;
++		}
++		} break;
++
++	default:
++		/* Unknown/unsupported algorithm */
++		dprintk("%s,%d: EINVAL\n", __FILE__, __LINE__);
++		crp->crp_etype = EINVAL;
++		goto done;
++	}
++
++done:
++	swcr_process_req_complete(req);
++}
++
++
++/*
++ * Process a crypto request.
++ */
++static int
++swcr_process(device_t dev, struct cryptop *crp, int hint)
++{
++	struct swcr_req *req = NULL;
++	u_int32_t lid;
++
++	dprintk("%s()\n", __FUNCTION__);
++	/* Sanity check */
++	if (crp == NULL) {
++		dprintk("%s,%d: EINVAL\n", __FILE__, __LINE__);
++		return EINVAL;
++	}
++
++	crp->crp_etype = 0;
++
++	if (crp->crp_desc == NULL || crp->crp_buf == NULL) {
++		dprintk("%s,%d: EINVAL\n", __FILE__, __LINE__);
++		crp->crp_etype = EINVAL;
++		goto done;
++	}
++
++	lid = crp->crp_sid & 0xffffffff;
++	if (lid >= swcr_sesnum || lid == 0 || swcr_sessions == NULL ||
++			swcr_sessions[lid] == NULL) {
++		crp->crp_etype = ENOENT;
++		dprintk("%s,%d: ENOENT\n", __FILE__, __LINE__);
++		goto done;
++	}
++
++	/*
++	 * do some error checking outside of the loop for SKB and IOV processing
++	 * this leaves us with valid skb or uiop pointers for later
++	 */
++	if (crp->crp_flags & CRYPTO_F_SKBUF) {
++		struct sk_buff *skb = (struct sk_buff *) crp->crp_buf;
++		if (skb_shinfo(skb)->nr_frags >= SCATTERLIST_MAX) {
++			printk("%s,%d: %d nr_frags > SCATTERLIST_MAX", __FILE__, __LINE__,
++					skb_shinfo(skb)->nr_frags);
++			goto done;
++		}
++	} else if (crp->crp_flags & CRYPTO_F_IOV) {
++		struct uio *uiop = (struct uio *) crp->crp_buf;
++		if (uiop->uio_iovcnt > SCATTERLIST_MAX) {
++			printk("%s,%d: %d uio_iovcnt > SCATTERLIST_MAX", __FILE__, __LINE__,
++					uiop->uio_iovcnt);
++			goto done;
++		}
++	}
++
++	/*
++	 * setup a new request ready for queuing
++	 */
++	req = kmem_cache_alloc(swcr_req_cache, SLAB_ATOMIC);
++	if (req == NULL) {
++		dprintk("%s,%d: ENOMEM\n", __FILE__, __LINE__);
++		crp->crp_etype = ENOMEM;
++		goto done;
++	}
++	memset(req, 0, sizeof(*req));
++
++	req->sw_head = swcr_sessions[lid];
++	req->crp = crp;
++	req->crd = crp->crp_desc;
++
++	swcr_process_req(req);
++	return 0;
++
++done:
++	crypto_done(crp);
++	if (req)
++		kmem_cache_free(swcr_req_cache, req);
++	return 0;
++}
++
++
++static int
++cryptosoft_init(void)
++{
++	int i, sw_type, mode;
++	char *algo;
++
++	dprintk("%s(%p)\n", __FUNCTION__, cryptosoft_init);
++
++	swcr_req_cache = kmem_cache_create("cryptosoft_req",
++				sizeof(struct swcr_req), 0, SLAB_HWCACHE_ALIGN, NULL
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,23)
++				, NULL
++#endif
++				);
++	if (!swcr_req_cache) {
++		printk("cryptosoft: failed to create request cache\n");
++		return -ENOENT;
++	}
++
++	softc_device_init(&swcr_softc, "cryptosoft", 0, swcr_methods);
++
++	swcr_id = crypto_get_driverid(softc_get_device(&swcr_softc),
++			CRYPTOCAP_F_SOFTWARE | CRYPTOCAP_F_SYNC);
++	if (swcr_id < 0) {
++		printk("cryptosoft: Software crypto device cannot initialize!");
++		return -ENODEV;
++	}
++
++#define	REGISTER(alg) \
++		crypto_register(swcr_id, alg, 0,0)
++
++	for (i = 0; i < sizeof(crypto_details)/sizeof(crypto_details[0]); i++) {
++		int found;
++
++		algo = crypto_details[i].alg_name;
++		if (!algo || !*algo) {
++			dprintk("%s:Algorithm %d not supported\n", __FUNCTION__, i);
++			continue;
++		}
++
++		mode = crypto_details[i].mode;
++		sw_type = crypto_details[i].sw_type;
++
++		found = 0;
++		switch (sw_type & SW_TYPE_ALG_MASK) {
++		case SW_TYPE_CIPHER:
++			found = crypto_has_cipher(algo, 0, CRYPTO_ALG_ASYNC);
++			break;
++		case SW_TYPE_HMAC:
++			found = crypto_has_hash(algo, 0, swcr_no_ahash?CRYPTO_ALG_ASYNC:0);
++			break;
++		case SW_TYPE_HASH:
++			found = crypto_has_hash(algo, 0, swcr_no_ahash?CRYPTO_ALG_ASYNC:0);
++			break;
++		case SW_TYPE_COMP:
++			found = crypto_has_comp(algo, 0, CRYPTO_ALG_ASYNC);
++			break;
++		case SW_TYPE_BLKCIPHER:
++			found = crypto_has_blkcipher(algo, 0, CRYPTO_ALG_ASYNC);
++			if (!found && !swcr_no_ablk)
++				found = crypto_has_ablkcipher(algo, 0, 0);
++			break;
++		}
++		if (found) {
++			REGISTER(i);
++		} else {
++			dprintk("%s:Algorithm Type %d not supported (algorithm %d:'%s')\n",
++					__FUNCTION__, sw_type, i, algo);
++		}
++	}
++	return 0;
++}
++
++static void
++cryptosoft_exit(void)
++{
++	dprintk("%s()\n", __FUNCTION__);
++	crypto_unregister_all(swcr_id);
++	swcr_id = -1;
++	kmem_cache_destroy(swcr_req_cache);
++}
++
++late_initcall(cryptosoft_init);
++module_exit(cryptosoft_exit);
++
++MODULE_LICENSE("Dual BSD/GPL");
++MODULE_AUTHOR("David McCullough <david_mccullough@mcafee.com>");
++MODULE_DESCRIPTION("Cryptosoft (OCF module for kernel crypto)");
+diff --git a/crypto/ocf/ocf-bench.c b/crypto/ocf/ocf-bench.c
+new file mode 100644
+index 0000000..f3fe9d0
+--- /dev/null
++++ b/crypto/ocf/ocf-bench.c
+@@ -0,0 +1,514 @@
++/*
++ * A loadable module that benchmarks the OCF crypto speed from kernel space.
++ *
++ * Copyright (C) 2004-2010 David McCullough <david_mccullough@mcafee.com>
++ *
++ * LICENSE TERMS
++ *
++ * The free distribution and use of this software in both source and binary
++ * form is allowed (with or without changes) provided that:
++ *
++ *   1. distributions of this source code include the above copyright
++ *      notice, this list of conditions and the following disclaimer;
++ *
++ *   2. distributions in binary form include the above copyright
++ *      notice, this list of conditions and the following disclaimer
++ *      in the documentation and/or other associated materials;
++ *
++ *   3. the copyright holder's name is not used to endorse products
++ *      built using this software without specific written permission.
++ *
++ * ALTERNATIVELY, provided that this notice is retained in full, this product
++ * may be distributed under the terms of the GNU General Public License (GPL),
++ * in which case the provisions of the GPL apply INSTEAD OF those given above.
++ *
++ * DISCLAIMER
++ *
++ * This software is provided 'as is' with no explicit or implied warranties
++ * in respect of its properties, including, but not limited to, correctness
++ * and/or fitness for purpose.
++ */
++
++
++#include <linux/version.h>
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,38) && !defined(AUTOCONF_INCLUDED)
++#include <linux/config.h>
++#endif
++#include <linux/module.h>
++#include <linux/init.h>
++#include <linux/list.h>
++#include <linux/slab.h>
++#include <linux/wait.h>
++#include <linux/sched.h>
++#include <linux/spinlock.h>
++#include <linux/interrupt.h>
++#include <cryptodev.h>
++
++#ifdef I_HAVE_AN_XSCALE_WITH_INTEL_SDK
++#define BENCH_IXP_ACCESS_LIB 1
++#endif
++#ifdef BENCH_IXP_ACCESS_LIB
++#include <IxTypes.h>
++#include <IxOsBuffMgt.h>
++#include <IxNpeDl.h>
++#include <IxCryptoAcc.h>
++#include <IxQMgr.h>
++#include <IxOsServices.h>
++#include <IxOsCacheMMU.h>
++#endif
++
++/*
++ * support for access lib version 1.4
++ */
++#ifndef IX_MBUF_PRIV
++#define IX_MBUF_PRIV(x) ((x)->priv)
++#endif
++
++/*
++ * the number of simultaneously active requests
++ */
++static int request_q_len = 40;
++module_param(request_q_len, int, 0);
++MODULE_PARM_DESC(request_q_len, "Number of outstanding requests");
++
++/*
++ * how many requests we want to have processed
++ */
++static int request_num = 1024;
++module_param(request_num, int, 0);
++MODULE_PARM_DESC(request_num, "run for at least this many requests");
++
++/*
++ * the size of each request
++ */
++static int request_size = 1488;
++module_param(request_size, int, 0);
++MODULE_PARM_DESC(request_size, "size of each request");
++
++/*
++ * OCF batching of requests
++ */
++static int request_batch = 1;
++module_param(request_batch, int, 0);
++MODULE_PARM_DESC(request_batch, "enable OCF request batching");
++
++/*
++ * OCF immediate callback on completion
++ */
++static int request_cbimm = 1;
++module_param(request_cbimm, int, 0);
++MODULE_PARM_DESC(request_cbimm, "enable OCF immediate callback on completion");
++
++/*
++ * a structure for each request
++ */
++typedef struct  {
++	struct work_struct work;
++#ifdef BENCH_IXP_ACCESS_LIB
++	IX_MBUF mbuf;
++#endif
++	unsigned char *buffer;
++} request_t;
++
++static request_t *requests;
++
++static spinlock_t ocfbench_counter_lock;
++static int outstanding;
++static int total;
++
++/*************************************************************************/
++/*
++ * OCF benchmark routines
++ */
++
++static uint64_t ocf_cryptoid;
++static unsigned long jstart, jstop;
++
++static int ocf_init(void);
++static int ocf_cb(struct cryptop *crp);
++static void ocf_request(void *arg);
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,20)
++static void ocf_request_wq(struct work_struct *work);
++#endif
++
++static int
++ocf_init(void)
++{
++	int error;
++	struct cryptoini crie, cria;
++	struct cryptodesc crda, crde;
++
++	memset(&crie, 0, sizeof(crie));
++	memset(&cria, 0, sizeof(cria));
++	memset(&crde, 0, sizeof(crde));
++	memset(&crda, 0, sizeof(crda));
++
++	cria.cri_alg  = CRYPTO_SHA1_HMAC;
++	cria.cri_klen = 20 * 8;
++	cria.cri_key  = "0123456789abcdefghij";
++
++	//crie.cri_alg  = CRYPTO_3DES_CBC;
++	crie.cri_alg  = CRYPTO_AES_CBC;
++	crie.cri_klen = 24 * 8;
++	crie.cri_key  = "0123456789abcdefghijklmn";
++
++	crie.cri_next = &cria;
++
++	error = crypto_newsession(&ocf_cryptoid, &crie,
++				CRYPTOCAP_F_HARDWARE | CRYPTOCAP_F_SOFTWARE);
++	if (error) {
++		printk("crypto_newsession failed %d\n", error);
++		return -1;
++	}
++	return 0;
++}
++
++static int
++ocf_cb(struct cryptop *crp)
++{
++	request_t *r = (request_t *) crp->crp_opaque;
++	unsigned long flags;
++
++	if (crp->crp_etype)
++		printk("Error in OCF processing: %d\n", crp->crp_etype);
++	crypto_freereq(crp);
++	crp = NULL;
++
++	/* do all requests  but take at least 1 second */
++	spin_lock_irqsave(&ocfbench_counter_lock, flags);
++	total++;
++	if (total > request_num && jstart + HZ < jiffies) {
++		outstanding--;
++		spin_unlock_irqrestore(&ocfbench_counter_lock, flags);
++		return 0;
++	}
++	spin_unlock_irqrestore(&ocfbench_counter_lock, flags);
++
++	schedule_work(&r->work);
++	return 0;
++}
++
++
++static void
++ocf_request(void *arg)
++{
++	request_t *r = arg;
++	struct cryptop *crp = crypto_getreq(2);
++	struct cryptodesc *crde, *crda;
++	unsigned long flags;
++
++	if (!crp) {
++		spin_lock_irqsave(&ocfbench_counter_lock, flags);
++		outstanding--;
++		spin_unlock_irqrestore(&ocfbench_counter_lock, flags);
++		return;
++	}
++
++	crde = crp->crp_desc;
++	crda = crde->crd_next;
++
++	crda->crd_skip = 0;
++	crda->crd_flags = 0;
++	crda->crd_len = request_size;
++	crda->crd_inject = request_size;
++	crda->crd_alg = CRYPTO_SHA1_HMAC;
++	crda->crd_key = "0123456789abcdefghij";
++	crda->crd_klen = 20 * 8;
++
++	crde->crd_skip = 0;
++	crde->crd_flags = CRD_F_IV_EXPLICIT | CRD_F_ENCRYPT;
++	crde->crd_len = request_size;
++	crde->crd_inject = request_size;
++	//crde->crd_alg = CRYPTO_3DES_CBC;
++	crde->crd_alg = CRYPTO_AES_CBC;
++	crde->crd_key = "0123456789abcdefghijklmn";
++	crde->crd_klen = 24 * 8;
++
++	crp->crp_ilen = request_size + 64;
++	crp->crp_flags = 0;
++	if (request_batch)
++		crp->crp_flags |= CRYPTO_F_BATCH;
++	if (request_cbimm)
++		crp->crp_flags |= CRYPTO_F_CBIMM;
++	crp->crp_buf = (caddr_t) r->buffer;
++	crp->crp_callback = ocf_cb;
++	crp->crp_sid = ocf_cryptoid;
++	crp->crp_opaque = (caddr_t) r;
++	crypto_dispatch(crp);
++}
++
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,20)
++static void
++ocf_request_wq(struct work_struct *work)
++{
++	request_t *r = container_of(work, request_t, work);
++	ocf_request(r);
++}
++#endif
++
++static void
++ocf_done(void)
++{
++	crypto_freesession(ocf_cryptoid);
++}
++
++/*************************************************************************/
++#ifdef BENCH_IXP_ACCESS_LIB
++/*************************************************************************/
++/*
++ * CryptoAcc benchmark routines
++ */
++
++static IxCryptoAccCtx ixp_ctx;
++static UINT32 ixp_ctx_id;
++static IX_MBUF ixp_pri;
++static IX_MBUF ixp_sec;
++static int ixp_registered = 0;
++
++static void ixp_register_cb(UINT32 ctx_id, IX_MBUF *bufp,
++					IxCryptoAccStatus status);
++static void ixp_perform_cb(UINT32 ctx_id, IX_MBUF *sbufp, IX_MBUF *dbufp,
++					IxCryptoAccStatus status);
++static void ixp_request(void *arg);
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,20)
++static void ixp_request_wq(struct work_struct *work);
++#endif
++
++static int
++ixp_init(void)
++{
++	IxCryptoAccStatus status;
++
++	ixp_ctx.cipherCtx.cipherAlgo = IX_CRYPTO_ACC_CIPHER_3DES;
++	ixp_ctx.cipherCtx.cipherMode = IX_CRYPTO_ACC_MODE_CBC;
++	ixp_ctx.cipherCtx.cipherKeyLen = 24;
++	ixp_ctx.cipherCtx.cipherBlockLen = IX_CRYPTO_ACC_DES_BLOCK_64;
++	ixp_ctx.cipherCtx.cipherInitialVectorLen = IX_CRYPTO_ACC_DES_IV_64;
++	memcpy(ixp_ctx.cipherCtx.key.cipherKey, "0123456789abcdefghijklmn", 24);
++
++	ixp_ctx.authCtx.authAlgo = IX_CRYPTO_ACC_AUTH_SHA1;
++	ixp_ctx.authCtx.authDigestLen = 12;
++	ixp_ctx.authCtx.aadLen = 0;
++	ixp_ctx.authCtx.authKeyLen = 20;
++	memcpy(ixp_ctx.authCtx.key.authKey, "0123456789abcdefghij", 20);
++
++	ixp_ctx.useDifferentSrcAndDestMbufs = 0;
++	ixp_ctx.operation = IX_CRYPTO_ACC_OP_ENCRYPT_AUTH ;
++
++	IX_MBUF_MLEN(&ixp_pri)  = IX_MBUF_PKT_LEN(&ixp_pri) = 128;
++	IX_MBUF_MDATA(&ixp_pri) = (unsigned char *) kmalloc(128, SLAB_ATOMIC);
++	IX_MBUF_MLEN(&ixp_sec)  = IX_MBUF_PKT_LEN(&ixp_sec) = 128;
++	IX_MBUF_MDATA(&ixp_sec) = (unsigned char *) kmalloc(128, SLAB_ATOMIC);
++
++	status = ixCryptoAccCtxRegister(&ixp_ctx, &ixp_pri, &ixp_sec,
++			ixp_register_cb, ixp_perform_cb, &ixp_ctx_id);
++
++	if (IX_CRYPTO_ACC_STATUS_SUCCESS == status) {
++		while (!ixp_registered)
++			schedule();
++		return ixp_registered < 0 ? -1 : 0;
++	}
++
++	printk("ixp: ixCryptoAccCtxRegister failed %d\n", status);
++	return -1;
++}
++
++static void
++ixp_register_cb(UINT32 ctx_id, IX_MBUF *bufp, IxCryptoAccStatus status)
++{
++	if (bufp) {
++		IX_MBUF_MLEN(bufp) = IX_MBUF_PKT_LEN(bufp) = 0;
++		kfree(IX_MBUF_MDATA(bufp));
++		IX_MBUF_MDATA(bufp) = NULL;
++	}
++
++	if (IX_CRYPTO_ACC_STATUS_WAIT == status)
++		return;
++	if (IX_CRYPTO_ACC_STATUS_SUCCESS == status)
++		ixp_registered = 1;
++	else
++		ixp_registered = -1;
++}
++
++static void
++ixp_perform_cb(
++	UINT32 ctx_id,
++	IX_MBUF *sbufp,
++	IX_MBUF *dbufp,
++	IxCryptoAccStatus status)
++{
++	request_t *r = NULL;
++	unsigned long flags;
++
++	/* do all requests  but take at least 1 second */
++	spin_lock_irqsave(&ocfbench_counter_lock, flags);
++	total++;
++	if (total > request_num && jstart + HZ < jiffies) {
++		outstanding--;
++		spin_unlock_irqrestore(&ocfbench_counter_lock, flags);
++		return;
++	}
++
++	if (!sbufp || !(r = IX_MBUF_PRIV(sbufp))) {
++		printk("crappo %p %p\n", sbufp, r);
++		outstanding--;
++		spin_unlock_irqrestore(&ocfbench_counter_lock, flags);
++		return;
++	}
++	spin_unlock_irqrestore(&ocfbench_counter_lock, flags);
++
++	schedule_work(&r->work);
++}
++
++static void
++ixp_request(void *arg)
++{
++	request_t *r = arg;
++	IxCryptoAccStatus status;
++	unsigned long flags;
++
++	memset(&r->mbuf, 0, sizeof(r->mbuf));
++	IX_MBUF_MLEN(&r->mbuf) = IX_MBUF_PKT_LEN(&r->mbuf) = request_size + 64;
++	IX_MBUF_MDATA(&r->mbuf) = r->buffer;
++	IX_MBUF_PRIV(&r->mbuf) = r;
++	status = ixCryptoAccAuthCryptPerform(ixp_ctx_id, &r->mbuf, NULL,
++			0, request_size, 0, request_size, request_size, r->buffer);
++	if (IX_CRYPTO_ACC_STATUS_SUCCESS != status) {
++		printk("status1 = %d\n", status);
++		spin_lock_irqsave(&ocfbench_counter_lock, flags);
++		outstanding--;
++		spin_unlock_irqrestore(&ocfbench_counter_lock, flags);
++		return;
++	}
++	return;
++}
++
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,20)
++static void
++ixp_request_wq(struct work_struct *work)
++{
++	request_t *r = container_of(work, request_t, work);
++	ixp_request(r);
++}
++#endif
++
++static void
++ixp_done(void)
++{
++	/* we should free the session here but I am lazy :-) */
++}
++
++/*************************************************************************/
++#endif /* BENCH_IXP_ACCESS_LIB */
++/*************************************************************************/
++
++int
++ocfbench_init(void)
++{
++	int i;
++	unsigned long mbps;
++	unsigned long flags;
++
++	printk("Crypto Speed tests\n");
++
++	requests = kmalloc(sizeof(request_t) * request_q_len, GFP_KERNEL);
++	if (!requests) {
++		printk("malloc failed\n");
++		return -EINVAL;
++	}
++
++	for (i = 0; i < request_q_len; i++) {
++		/* +64 for return data */
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,20)
++		INIT_WORK(&requests[i].work, ocf_request_wq);
++#else
++		INIT_WORK(&requests[i].work, ocf_request, &requests[i]);
++#endif
++		requests[i].buffer = kmalloc(request_size + 128, GFP_DMA);
++		if (!requests[i].buffer) {
++			printk("malloc failed\n");
++			return -EINVAL;
++		}
++		memset(requests[i].buffer, '0' + i, request_size + 128);
++	}
++
++	/*
++	 * OCF benchmark
++	 */
++	printk("OCF: testing ...\n");
++	if (ocf_init() == -1)
++		return -EINVAL;
++
++	spin_lock_init(&ocfbench_counter_lock);
++	total = outstanding = 0;
++	jstart = jiffies;
++	for (i = 0; i < request_q_len; i++) {
++		spin_lock_irqsave(&ocfbench_counter_lock, flags);
++		outstanding++;
++		spin_unlock_irqrestore(&ocfbench_counter_lock, flags);
++		ocf_request(&requests[i]);
++	}
++	while (outstanding > 0)
++		schedule();
++	jstop = jiffies;
++
++	mbps = 0;
++	if (jstop > jstart) {
++		mbps = (unsigned long) total * (unsigned long) request_size * 8;
++		mbps /= ((jstop - jstart) * 1000) / HZ;
++	}
++	printk("OCF: %d requests of %d bytes in %d jiffies (%d.%03d Mbps)\n",
++			total, request_size, (int)(jstop - jstart),
++			((int)mbps) / 1000, ((int)mbps) % 1000);
++	ocf_done();
++
++#ifdef BENCH_IXP_ACCESS_LIB
++	/*
++	 * IXP benchmark
++	 */
++	printk("IXP: testing ...\n");
++	ixp_init();
++	total = outstanding = 0;
++	jstart = jiffies;
++	for (i = 0; i < request_q_len; i++) {
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,20)
++		INIT_WORK(&requests[i].work, ixp_request_wq);
++#else
++		INIT_WORK(&requests[i].work, ixp_request, &requests[i]);
++#endif
++		spin_lock_irqsave(&ocfbench_counter_lock, flags);
++		outstanding++;
++		spin_unlock_irqrestore(&ocfbench_counter_lock, flags);
++		ixp_request(&requests[i]);
++	}
++	while (outstanding > 0)
++		schedule();
++	jstop = jiffies;
++
++	mbps = 0;
++	if (jstop > jstart) {
++		mbps = (unsigned long) total * (unsigned long) request_size * 8;
++		mbps /= ((jstop - jstart) * 1000) / HZ;
++	}
++	printk("IXP: %d requests of %d bytes in %d jiffies (%d.%03d Mbps)\n",
++			total, request_size, jstop - jstart,
++			((int)mbps) / 1000, ((int)mbps) % 1000);
++	ixp_done();
++#endif /* BENCH_IXP_ACCESS_LIB */
++
++	for (i = 0; i < request_q_len; i++)
++		kfree(requests[i].buffer);
++	kfree(requests);
++	return -EINVAL; /* always fail to load so it can be re-run quickly ;-) */
++}
++
++static void __exit ocfbench_exit(void)
++{
++}
++
++module_init(ocfbench_init);
++module_exit(ocfbench_exit);
++
++MODULE_LICENSE("BSD");
++MODULE_AUTHOR("David McCullough <david_mccullough@mcafee.com>");
++MODULE_DESCRIPTION("Benchmark various in-kernel crypto speeds");
+diff --git a/crypto/ocf/ocf-compat.h b/crypto/ocf/ocf-compat.h
+new file mode 100644
+index 0000000..4ad1223
+--- /dev/null
++++ b/crypto/ocf/ocf-compat.h
+@@ -0,0 +1,372 @@
++#ifndef _BSD_COMPAT_H_
++#define _BSD_COMPAT_H_ 1
++/****************************************************************************/
++/*
++ * Provide compat routines for older linux kernels and BSD kernels
++ *
++ * Written by David McCullough <david_mccullough@mcafee.com>
++ * Copyright (C) 2010 David McCullough <david_mccullough@mcafee.com>
++ *
++ * LICENSE TERMS
++ *
++ * The free distribution and use of this software in both source and binary
++ * form is allowed (with or without changes) provided that:
++ *
++ *   1. distributions of this source code include the above copyright
++ *      notice, this list of conditions and the following disclaimer;
++ *
++ *   2. distributions in binary form include the above copyright
++ *      notice, this list of conditions and the following disclaimer
++ *      in the documentation and/or other associated materials;
++ *
++ *   3. the copyright holder's name is not used to endorse products
++ *      built using this software without specific written permission.
++ *
++ * ALTERNATIVELY, provided that this notice is retained in full, this file
++ * may be distributed under the terms of the GNU General Public License (GPL),
++ * in which case the provisions of the GPL apply INSTEAD OF those given above.
++ *
++ * DISCLAIMER
++ *
++ * This software is provided 'as is' with no explicit or implied warranties
++ * in respect of its properties, including, but not limited to, correctness
++ * and/or fitness for purpose.
++ */
++/****************************************************************************/
++#ifdef __KERNEL__
++#include <linux/version.h>
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,38) && !defined(AUTOCONF_INCLUDED)
++#include <linux/config.h>
++#endif
++
++/*
++ * fake some BSD driver interface stuff specifically for OCF use
++ */
++
++typedef struct ocf_device *device_t;
++
++typedef struct {
++	int (*cryptodev_newsession)(device_t dev, u_int32_t *sidp, struct cryptoini *cri);
++	int (*cryptodev_freesession)(device_t dev, u_int64_t tid);
++	int (*cryptodev_process)(device_t dev, struct cryptop *crp, int hint);
++	int (*cryptodev_kprocess)(device_t dev, struct cryptkop *krp, int hint);
++} device_method_t;
++#define DEVMETHOD(id, func)	id: func
++
++struct ocf_device {
++	char name[32];		/* the driver name */
++	char nameunit[32];	/* the driver name + HW instance */
++	int  unit;
++	device_method_t	methods;
++	void *softc;
++};
++
++#define CRYPTODEV_NEWSESSION(dev, sid, cri) \
++	((*(dev)->methods.cryptodev_newsession)(dev,sid,cri))
++#define CRYPTODEV_FREESESSION(dev, sid) \
++	((*(dev)->methods.cryptodev_freesession)(dev, sid))
++#define CRYPTODEV_PROCESS(dev, crp, hint) \
++	((*(dev)->methods.cryptodev_process)(dev, crp, hint))
++#define CRYPTODEV_KPROCESS(dev, krp, hint) \
++	((*(dev)->methods.cryptodev_kprocess)(dev, krp, hint))
++
++#define device_get_name(dev)	((dev)->name)
++#define device_get_nameunit(dev)	((dev)->nameunit)
++#define device_get_unit(dev)	((dev)->unit)
++#define device_get_softc(dev)	((dev)->softc)
++
++#define	softc_device_decl \
++		struct ocf_device _device; \
++		device_t
++
++#define	softc_device_init(_sc, _name, _unit, _methods) \
++	if (1) {\
++	strncpy((_sc)->_device.name, _name, sizeof((_sc)->_device.name) - 1); \
++	snprintf((_sc)->_device.nameunit, sizeof((_sc)->_device.name), "%s%d", _name, _unit); \
++	(_sc)->_device.unit = _unit; \
++	(_sc)->_device.methods = _methods; \
++	(_sc)->_device.softc = (void *) _sc; \
++	*(device_t *)((softc_get_device(_sc))+1) = &(_sc)->_device; \
++	} else
++
++#define	softc_get_device(_sc)	(&(_sc)->_device)
++
++/*
++ * iomem support for 2.4 and 2.6 kernels
++ */
++#include <linux/version.h>
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,0)
++#define ocf_iomem_t	unsigned long
++
++/*
++ * implement simple workqueue like support for older kernels
++ */
++
++#include <linux/tqueue.h>
++
++#define work_struct tq_struct
++
++#define INIT_WORK(wp, fp, ap) \
++	do { \
++		(wp)->sync = 0; \
++		(wp)->routine = (fp); \
++		(wp)->data = (ap); \
++	} while (0)
++
++#define schedule_work(wp) \
++	do { \
++		queue_task((wp), &tq_immediate); \
++		mark_bh(IMMEDIATE_BH); \
++	} while (0)
++
++#define flush_scheduled_work()	run_task_queue(&tq_immediate)
++
++#else
++#define ocf_iomem_t	void __iomem *
++
++#include <linux/workqueue.h>
++
++#endif
++
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,26)
++#include <linux/fdtable.h>
++#elif LINUX_VERSION_CODE < KERNEL_VERSION(2,6,11)
++#define files_fdtable(files)	(files)
++#endif
++
++#ifdef MODULE_PARM
++#undef module_param	/* just in case */
++#define	module_param(a,b,c)		MODULE_PARM(a,"i")
++#endif
++
++#define bzero(s,l)		memset(s,0,l)
++#define bcopy(s,d,l)	memcpy(d,s,l)
++#define bcmp(x, y, l)	memcmp(x,y,l)
++
++#define MIN(x,y)	((x) < (y) ? (x) : (y))
++
++#define device_printf(dev, a...) ({ \
++				printk("%s: ", device_get_nameunit(dev)); printk(a); \
++			})
++
++#undef printf
++#define printf(fmt...)	printk(fmt)
++
++#define KASSERT(c,p)	if (!(c)) { printk p ; } else
++
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,0)
++#define ocf_daemonize(str) \
++	daemonize(); \
++	spin_lock_irq(&current->sigmask_lock); \
++	sigemptyset(&current->blocked); \
++	recalc_sigpending(current); \
++	spin_unlock_irq(&current->sigmask_lock); \
++	sprintf(current->comm, str);
++#else
++#define ocf_daemonize(str) daemonize(str);
++#endif
++
++#define	TAILQ_INSERT_TAIL(q,d,m) list_add_tail(&(d)->m, (q))
++#define	TAILQ_EMPTY(q)	list_empty(q)
++#define	TAILQ_FOREACH(v, q, m) list_for_each_entry(v, q, m)
++
++#define read_random(p,l) get_random_bytes(p,l)
++
++#define DELAY(x)	((x) > 2000 ? mdelay((x)/1000) : udelay(x))
++#define strtoul simple_strtoul
++
++#define pci_get_vendor(dev)	((dev)->vendor)
++#define pci_get_device(dev)	((dev)->device)
++
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,0)
++#define pci_set_consistent_dma_mask(dev, mask) (0)
++#endif
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,10)
++#define pci_dma_sync_single_for_cpu pci_dma_sync_single
++#endif
++
++#ifndef DMA_32BIT_MASK
++#define DMA_32BIT_MASK  0x00000000ffffffffULL
++#endif
++
++#ifndef htole32
++#define htole32(x)	cpu_to_le32(x)
++#endif
++#ifndef htobe32
++#define htobe32(x)	cpu_to_be32(x)
++#endif
++#ifndef htole16
++#define htole16(x)	cpu_to_le16(x)
++#endif
++#ifndef htobe16
++#define htobe16(x)	cpu_to_be16(x)
++#endif
++
++/* older kernels don't have these */
++
++#include <asm/irq.h>
++#if !defined(IRQ_NONE) && !defined(IRQ_RETVAL)
++#define IRQ_NONE
++#define IRQ_HANDLED
++#define IRQ_WAKE_THREAD
++#define IRQ_RETVAL
++#define irqreturn_t void
++typedef irqreturn_t (*irq_handler_t)(int irq, void *arg, struct pt_regs *regs);
++#endif
++#ifndef IRQF_SHARED
++#define IRQF_SHARED	SA_SHIRQ
++#endif
++
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,5,0)
++# define strlcpy(dest,src,len) \
++		({strncpy(dest,src,(len)-1); ((char *)dest)[(len)-1] = '\0'; })
++#endif
++
++#ifndef MAX_ERRNO
++#define MAX_ERRNO	4095
++#endif
++#ifndef IS_ERR_VALUE
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,5,5)
++#include <linux/err.h>
++#endif
++#ifndef IS_ERR_VALUE
++#define IS_ERR_VALUE(x) ((unsigned long)(x) >= (unsigned long)-MAX_ERRNO)
++#endif
++#endif
++
++/*
++ * common debug for all
++ */
++#if 1
++#define dprintk(a...)	do { if (debug) printk(a); } while(0)
++#else
++#define dprintk(a...)
++#endif
++
++#ifndef SLAB_ATOMIC
++/* Changed in 2.6.20, must use GFP_ATOMIC now */
++#define	SLAB_ATOMIC	GFP_ATOMIC
++#endif
++
++/*
++ * need some additional support for older kernels */
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,2)
++#define pci_register_driver_compat(driver, rc) \
++	do { \
++		if ((rc) > 0) { \
++			(rc) = 0; \
++		} else if (rc == 0) { \
++			(rc) = -ENODEV; \
++		} else { \
++			pci_unregister_driver(driver); \
++		} \
++	} while (0)
++#elif LINUX_VERSION_CODE < KERNEL_VERSION(2,6,10)
++#define pci_register_driver_compat(driver,rc) ((rc) = (rc) < 0 ? (rc) : 0)
++#else
++#define pci_register_driver_compat(driver,rc)
++#endif
++
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,24)
++
++#include <linux/mm.h>
++#include <asm/scatterlist.h>
++
++static inline void sg_set_page(struct scatterlist *sg,  struct page *page,
++			       unsigned int len, unsigned int offset)
++{
++	sg->page = page;
++	sg->offset = offset;
++	sg->length = len;
++}
++
++static inline void *sg_virt(struct scatterlist *sg)
++{
++	return page_address(sg->page) + sg->offset;
++}
++
++#define sg_init_table(sg, n)
++
++#define sg_mark_end(sg)
++
++#endif
++
++#ifndef late_initcall
++#define late_initcall(init) module_init(init)
++#endif
++
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,4) || !defined(CONFIG_SMP)
++#define ocf_for_each_cpu(cpu) for ((cpu) = 0; (cpu) == 0; (cpu)++)
++#else
++#define ocf_for_each_cpu(cpu) for_each_present_cpu(cpu)
++#endif
++
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,27)
++#include <linux/sched.h>
++#define	kill_proc(p,s,v)	send_sig(s,find_task_by_vpid(p),0)
++#endif
++
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,4)
++
++struct ocf_thread {
++	struct task_struct	*task;
++	int					(*func)(void *arg);
++	void				*arg;
++};
++
++/* thread startup helper func */
++static inline int ocf_run_thread(void *arg)
++{
++	struct ocf_thread *t = (struct ocf_thread *) arg;
++	if (!t)
++		return -1; /* very bad */
++	t->task = current;
++	daemonize();
++	spin_lock_irq(&current->sigmask_lock);
++	sigemptyset(&current->blocked);
++	recalc_sigpending(current);
++	spin_unlock_irq(&current->sigmask_lock);
++	return (*t->func)(t->arg);
++}
++
++#define kthread_create(f,a,fmt...) \
++	({ \
++		struct ocf_thread t; \
++		pid_t p; \
++		t.task = NULL; \
++		t.func = (f); \
++		t.arg = (a); \
++		p = kernel_thread(ocf_run_thread, &t, CLONE_FS|CLONE_FILES); \
++		while (p != (pid_t) -1 && t.task == NULL) \
++			schedule(); \
++		if (t.task) \
++			snprintf(t.task->comm, sizeof(t.task->comm), fmt); \
++		(t.task); \
++	})
++
++#define kthread_bind(t,cpu)	/**/
++
++#define kthread_should_stop()	(strcmp(current->comm, "stopping") == 0)
++
++#define kthread_stop(t) \
++	({ \
++		strcpy((t)->comm, "stopping"); \
++		kill_proc((t)->pid, SIGTERM, 1); \
++		do { \
++			schedule(); \
++		} while (kill_proc((t)->pid, SIGTERM, 1) == 0); \
++	})
++
++#else
++#include <linux/kthread.h>
++#endif
++
++
++#if LINUX_VERSION_CODE < KERNEL_VERSION(3,2,0)
++#define	skb_frag_page(x)	((x)->page)
++#endif
++
++#endif /* __KERNEL__ */
++
++/****************************************************************************/
++#endif /* _BSD_COMPAT_H_ */
+diff --git a/crypto/ocf/ocfnull/Makefile b/crypto/ocf/ocfnull/Makefile
+new file mode 100644
+index 0000000..044bcac
+--- /dev/null
++++ b/crypto/ocf/ocfnull/Makefile
+@@ -0,0 +1,12 @@
++# for SGlinux builds
++-include $(ROOTDIR)/modules/.config
++
++obj-$(CONFIG_OCF_OCFNULL) += ocfnull.o
++
++obj ?= .
++EXTRA_CFLAGS += -I$(obj)/..
++
++ifdef TOPDIR
++-include $(TOPDIR)/Rules.make
++endif
++
+diff --git a/crypto/ocf/ocfnull/ocfnull.c b/crypto/ocf/ocfnull/ocfnull.c
+new file mode 100644
+index 0000000..9cf3f6e
+--- /dev/null
++++ b/crypto/ocf/ocfnull/ocfnull.c
+@@ -0,0 +1,204 @@
++/*
++ * An OCF module for determining the cost of crypto versus the cost of
++ * IPSec processing outside of OCF.  This modules gives us the effect of
++ * zero cost encryption,  of course you will need to run it at both ends
++ * since it does no crypto at all.
++ *
++ * Written by David McCullough <david_mccullough@mcafee.com>
++ * Copyright (C) 2006-2010 David McCullough
++ *
++ * LICENSE TERMS
++ *
++ * The free distribution and use of this software in both source and binary
++ * form is allowed (with or without changes) provided that:
++ *
++ *   1. distributions of this source code include the above copyright
++ *      notice, this list of conditions and the following disclaimer;
++ *
++ *   2. distributions in binary form include the above copyright
++ *      notice, this list of conditions and the following disclaimer
++ *      in the documentation and/or other associated materials;
++ *
++ *   3. the copyright holder's name is not used to endorse products
++ *      built using this software without specific written permission.
++ *
++ * ALTERNATIVELY, provided that this notice is retained in full, this product
++ * may be distributed under the terms of the GNU General Public License (GPL),
++ * in which case the provisions of the GPL apply INSTEAD OF those given above.
++ *
++ * DISCLAIMER
++ *
++ * This software is provided 'as is' with no explicit or implied warranties
++ * in respect of its properties, including, but not limited to, correctness
++ * and/or fitness for purpose.
++ */
++
++#include <linux/version.h>
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,38) && !defined(AUTOCONF_INCLUDED)
++#include <linux/config.h>
++#endif
++#include <linux/module.h>
++#include <linux/init.h>
++#include <linux/list.h>
++#include <linux/slab.h>
++#include <linux/sched.h>
++#include <linux/wait.h>
++#include <linux/crypto.h>
++#include <linux/interrupt.h>
++
++#include <cryptodev.h>
++#include <uio.h>
++
++static int32_t			 null_id = -1;
++static u_int32_t		 null_sesnum = 0;
++
++static int null_process(device_t, struct cryptop *, int);
++static int null_newsession(device_t, u_int32_t *, struct cryptoini *);
++static int null_freesession(device_t, u_int64_t);
++
++#define debug ocfnull_debug
++int ocfnull_debug = 0;
++module_param(ocfnull_debug, int, 0644);
++MODULE_PARM_DESC(ocfnull_debug, "Enable debug");
++
++/*
++ * dummy device structure
++ */
++
++static struct {
++	softc_device_decl	sc_dev;
++} nulldev;
++
++static device_method_t null_methods = {
++	/* crypto device methods */
++	DEVMETHOD(cryptodev_newsession,	null_newsession),
++	DEVMETHOD(cryptodev_freesession,null_freesession),
++	DEVMETHOD(cryptodev_process,	null_process),
++};
++
++/*
++ * Generate a new software session.
++ */
++static int
++null_newsession(device_t arg, u_int32_t *sid, struct cryptoini *cri)
++{
++	dprintk("%s()\n", __FUNCTION__);
++	if (sid == NULL || cri == NULL) {
++		dprintk("%s,%d - EINVAL\n", __FILE__, __LINE__);
++		return EINVAL;
++	}
++
++	if (null_sesnum == 0)
++		null_sesnum++;
++	*sid = null_sesnum++;
++	return 0;
++}
++
++
++/*
++ * Free a session.
++ */
++static int
++null_freesession(device_t arg, u_int64_t tid)
++{
++	u_int32_t sid = CRYPTO_SESID2LID(tid);
++
++	dprintk("%s()\n", __FUNCTION__);
++	if (sid > null_sesnum) {
++		dprintk("%s,%d: EINVAL\n", __FILE__, __LINE__);
++		return EINVAL;
++	}
++
++	/* Silently accept and return */
++	if (sid == 0)
++		return 0;
++	return 0;
++}
++
++
++/*
++ * Process a request.
++ */
++static int
++null_process(device_t arg, struct cryptop *crp, int hint)
++{
++	unsigned int lid;
++
++	dprintk("%s()\n", __FUNCTION__);
++
++	/* Sanity check */
++	if (crp == NULL) {
++		dprintk("%s,%d: EINVAL\n", __FILE__, __LINE__);
++		return EINVAL;
++	}
++
++	crp->crp_etype = 0;
++
++	if (crp->crp_desc == NULL || crp->crp_buf == NULL) {
++		dprintk("%s,%d: EINVAL\n", __FILE__, __LINE__);
++		crp->crp_etype = EINVAL;
++		goto done;
++	}
++
++	/*
++	 * find the session we are using
++	 */
++
++	lid = crp->crp_sid & 0xffffffff;
++	if (lid >= null_sesnum || lid == 0) {
++		crp->crp_etype = ENOENT;
++		dprintk("%s,%d: ENOENT\n", __FILE__, __LINE__);
++		goto done;
++	}
++
++done:
++	crypto_done(crp);
++	return 0;
++}
++
++
++/*
++ * our driver startup and shutdown routines
++ */
++
++static int
++null_init(void)
++{
++	dprintk("%s(%p)\n", __FUNCTION__, null_init);
++
++	memset(&nulldev, 0, sizeof(nulldev));
++	softc_device_init(&nulldev, "ocfnull", 0, null_methods);
++
++	null_id = crypto_get_driverid(softc_get_device(&nulldev),
++				CRYPTOCAP_F_HARDWARE);
++	if (null_id < 0)
++		panic("ocfnull: crypto device cannot initialize!");
++
++#define	REGISTER(alg) \
++	crypto_register(null_id,alg,0,0)
++	REGISTER(CRYPTO_DES_CBC);
++	REGISTER(CRYPTO_3DES_CBC);
++	REGISTER(CRYPTO_RIJNDAEL128_CBC);
++	REGISTER(CRYPTO_MD5);
++	REGISTER(CRYPTO_SHA1);
++	REGISTER(CRYPTO_MD5_HMAC);
++	REGISTER(CRYPTO_SHA1_HMAC);
++#undef REGISTER
++
++	return 0;
++}
++
++static void
++null_exit(void)
++{
++	dprintk("%s()\n", __FUNCTION__);
++	crypto_unregister_all(null_id);
++	null_id = -1;
++}
++
++module_init(null_init);
++module_exit(null_exit);
++
++MODULE_LICENSE("Dual BSD/GPL");
++MODULE_AUTHOR("David McCullough <david_mccullough@mcafee.com>");
++MODULE_DESCRIPTION("ocfnull - claims a lot but does nothing");
+diff --git a/crypto/ocf/random.c b/crypto/ocf/random.c
+new file mode 100644
+index 0000000..4bb773f
+--- /dev/null
++++ b/crypto/ocf/random.c
+@@ -0,0 +1,317 @@
++/*
++ * A system independant way of adding entropy to the kernels pool
++ * this way the drivers can focus on the real work and we can take
++ * care of pushing it to the appropriate place in the kernel.
++ *
++ * This should be fast and callable from timers/interrupts
++ *
++ * Written by David McCullough <david_mccullough@mcafee.com>
++ * Copyright (C) 2006-2010 David McCullough
++ * Copyright (C) 2004-2005 Intel Corporation.
++ *
++ * LICENSE TERMS
++ *
++ * The free distribution and use of this software in both source and binary
++ * form is allowed (with or without changes) provided that:
++ *
++ *   1. distributions of this source code include the above copyright
++ *      notice, this list of conditions and the following disclaimer;
++ *
++ *   2. distributions in binary form include the above copyright
++ *      notice, this list of conditions and the following disclaimer
++ *      in the documentation and/or other associated materials;
++ *
++ *   3. the copyright holder's name is not used to endorse products
++ *      built using this software without specific written permission.
++ *
++ * ALTERNATIVELY, provided that this notice is retained in full, this product
++ * may be distributed under the terms of the GNU General Public License (GPL),
++ * in which case the provisions of the GPL apply INSTEAD OF those given above.
++ *
++ * DISCLAIMER
++ *
++ * This software is provided 'as is' with no explicit or implied warranties
++ * in respect of its properties, including, but not limited to, correctness
++ * and/or fitness for purpose.
++ */
++
++#include <linux/version.h>
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,38) && !defined(AUTOCONF_INCLUDED)
++#include <linux/config.h>
++#endif
++#include <linux/module.h>
++#include <linux/init.h>
++#include <linux/list.h>
++#include <linux/slab.h>
++#include <linux/wait.h>
++#include <linux/sched.h>
++#include <linux/spinlock.h>
++#include <linux/unistd.h>
++#include <linux/poll.h>
++#include <linux/random.h>
++#include <cryptodev.h>
++
++#ifdef CONFIG_OCF_FIPS
++#include "rndtest.h"
++#endif
++
++#ifndef HAS_RANDOM_INPUT_WAIT
++#error "Please do not enable OCF_RANDOMHARVEST unless you have applied patches"
++#endif
++
++/*
++ * a hack to access the debug levels from the crypto driver
++ */
++extern int crypto_debug;
++#define debug crypto_debug
++
++/*
++ * a list of all registered random providers
++ */
++static LIST_HEAD(random_ops);
++static int started = 0;
++static int initted = 0;
++
++struct random_op {
++	struct list_head random_list;
++	u_int32_t driverid;
++	int (*read_random)(void *arg, u_int32_t *buf, int len);
++	void *arg;
++};
++
++static int random_proc(void *arg);
++
++static pid_t		randomproc = (pid_t) -1;
++static spinlock_t	random_lock;
++
++/*
++ * just init the spin locks
++ */
++static int
++crypto_random_init(void)
++{
++	spin_lock_init(&random_lock);
++	initted = 1;
++	return(0);
++}
++
++/*
++ * Add the given random reader to our list (if not present)
++ * and start the thread (if not already started)
++ *
++ * we have to assume that driver id is ok for now
++ */
++int
++crypto_rregister(
++	u_int32_t driverid,
++	int (*read_random)(void *arg, u_int32_t *buf, int len),
++	void *arg)
++{
++	unsigned long flags;
++	int ret = 0;
++	struct random_op	*rops, *tmp;
++
++	dprintk("%s,%d: %s(0x%x, %p, %p)\n", __FILE__, __LINE__,
++			__FUNCTION__, driverid, read_random, arg);
++
++	if (!initted)
++		crypto_random_init();
++
++#if 0
++	struct cryptocap	*cap;
++
++	cap = crypto_checkdriver(driverid);
++	if (!cap)
++		return EINVAL;
++#endif
++
++	list_for_each_entry_safe(rops, tmp, &random_ops, random_list) {
++		if (rops->driverid == driverid && rops->read_random == read_random)
++			return EEXIST;
++	}
++
++	rops = (struct random_op *) kmalloc(sizeof(*rops), GFP_KERNEL);
++	if (!rops)
++		return ENOMEM;
++
++	rops->driverid    = driverid;
++	rops->read_random = read_random;
++	rops->arg = arg;
++
++	spin_lock_irqsave(&random_lock, flags);
++	list_add_tail(&rops->random_list, &random_ops);
++	if (!started) {
++		randomproc = kernel_thread(random_proc, NULL, CLONE_FS|CLONE_FILES);
++		if (randomproc < 0) {
++			ret = randomproc;
++			printk("crypto: crypto_rregister cannot start random thread; "
++					"error %d", ret);
++		} else
++			started = 1;
++	}
++	spin_unlock_irqrestore(&random_lock, flags);
++
++	return ret;
++}
++EXPORT_SYMBOL(crypto_rregister);
++
++int
++crypto_runregister_all(u_int32_t driverid)
++{
++	struct random_op *rops, *tmp;
++	unsigned long flags;
++
++	dprintk("%s,%d: %s(0x%x)\n", __FILE__, __LINE__, __FUNCTION__, driverid);
++
++	list_for_each_entry_safe(rops, tmp, &random_ops, random_list) {
++		if (rops->driverid == driverid) {
++			list_del(&rops->random_list);
++			kfree(rops);
++		}
++	}
++
++	spin_lock_irqsave(&random_lock, flags);
++	if (list_empty(&random_ops) && started)
++		kill_proc(randomproc, SIGKILL, 1);
++	spin_unlock_irqrestore(&random_lock, flags);
++	return(0);
++}
++EXPORT_SYMBOL(crypto_runregister_all);
++
++/*
++ * while we can add entropy to random.c continue to read random data from
++ * the drivers and push it to random.
++ */
++static int
++random_proc(void *arg)
++{
++	int n;
++	int wantcnt;
++	int bufcnt = 0;
++	int retval = 0;
++	int *buf = NULL;
++
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,0)
++	daemonize();
++	spin_lock_irq(&current->sigmask_lock);
++	sigemptyset(&current->blocked);
++	recalc_sigpending(current);
++	spin_unlock_irq(&current->sigmask_lock);
++	sprintf(current->comm, "ocf-random");
++#else
++	daemonize("ocf-random");
++	allow_signal(SIGKILL);
++#endif
++
++	(void) get_fs();
++	set_fs(get_ds());
++
++#ifdef CONFIG_OCF_FIPS
++#define NUM_INT (RNDTEST_NBYTES/sizeof(int))
++#else
++#define NUM_INT 32
++#endif
++
++	/*
++	 * some devices can transferr their RNG data direct into memory,
++	 * so make sure it is device friendly
++	 */
++	buf = kmalloc(NUM_INT * sizeof(int), GFP_DMA);
++	if (NULL == buf) {
++		printk("crypto: RNG could not allocate memory\n");
++		retval = -ENOMEM;
++		goto bad_alloc;
++	}
++
++	wantcnt = NUM_INT;   /* start by adding some entropy */
++
++	/*
++	 * its possible due to errors or driver removal that we no longer
++	 * have anything to do,  if so exit or we will consume all the CPU
++	 * doing nothing
++	 */
++	while (!list_empty(&random_ops)) {
++		struct random_op	*rops, *tmp;
++
++#ifdef CONFIG_OCF_FIPS
++		if (wantcnt)
++			wantcnt = NUM_INT; /* FIPs mode can do 20000 bits or none */
++#endif
++
++		/* see if we can get enough entropy to make the world
++		 * a better place.
++		 */
++		while (bufcnt < wantcnt && bufcnt < NUM_INT) {
++			list_for_each_entry_safe(rops, tmp, &random_ops, random_list) {
++
++				n = (*rops->read_random)(rops->arg, &buf[bufcnt],
++							 NUM_INT - bufcnt);
++
++				/* on failure remove the random number generator */
++				if (n == -1) {
++					list_del(&rops->random_list);
++					printk("crypto: RNG (driverid=0x%x) failed, disabling\n",
++							rops->driverid);
++					kfree(rops);
++				} else if (n > 0)
++					bufcnt += n;
++			}
++			/* give up CPU for a bit, just in case as this is a loop */
++			schedule();
++		}
++
++
++#ifdef CONFIG_OCF_FIPS
++		if (bufcnt > 0 && rndtest_buf((unsigned char *) &buf[0])) {
++			dprintk("crypto: buffer had fips errors, discarding\n");
++			bufcnt = 0;
++		}
++#endif
++
++		/*
++		 * if we have a certified buffer,  we can send some data
++		 * to /dev/random and move along
++		 */
++		if (bufcnt > 0) {
++			/* add what we have */
++			random_input_words(buf, bufcnt, bufcnt*sizeof(int)*8);
++			bufcnt = 0;
++		}
++
++		/* give up CPU for a bit so we don't hog while filling */
++		schedule();
++
++		/* wait for needing more */
++		wantcnt = random_input_wait();
++
++		if (wantcnt <= 0)
++			wantcnt = 0; /* try to get some info again */
++		else
++		 	/* round up to one word or we can loop forever */
++			wantcnt = (wantcnt + (sizeof(int)*8)) / (sizeof(int)*8);
++		if (wantcnt > NUM_INT) {
++			wantcnt = NUM_INT;
++		}
++
++		if (signal_pending(current)) {
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,0)
++			spin_lock_irq(&current->sigmask_lock);
++#endif
++			flush_signals(current);
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,0)
++			spin_unlock_irq(&current->sigmask_lock);
++#endif
++		}
++	}
++
++	kfree(buf);
++
++bad_alloc:
++	spin_lock_irq(&random_lock);
++	randomproc = (pid_t) -1;
++	started = 0;
++	spin_unlock_irq(&random_lock);
++
++	return retval;
++}
++
+diff --git a/crypto/ocf/rndtest.c b/crypto/ocf/rndtest.c
+new file mode 100644
+index 0000000..7bed6a1
+--- /dev/null
++++ b/crypto/ocf/rndtest.c
+@@ -0,0 +1,300 @@
++/*	$OpenBSD$	*/
++
++/*
++ * OCF/Linux port done by David McCullough <david_mccullough@mcafee.com>
++ * Copyright (C) 2006-2010 David McCullough
++ * Copyright (C) 2004-2005 Intel Corporation.
++ * The license and original author are listed below.
++ *
++ * Copyright (c) 2002 Jason L. Wright (jason@thought.net)
++ * All rights reserved.
++ *
++ * Redistribution and use in source and binary forms, with or without
++ * modification, are permitted provided that the following conditions
++ * are met:
++ * 1. Redistributions of source code must retain the above copyright
++ *    notice, this list of conditions and the following disclaimer.
++ * 2. Redistributions in binary form must reproduce the above copyright
++ *    notice, this list of conditions and the following disclaimer in the
++ *    documentation and/or other materials provided with the distribution.
++ * 3. All advertising materials mentioning features or use of this software
++ *    must display the following acknowledgement:
++ *	This product includes software developed by Jason L. Wright
++ * 4. The name of the author may not be used to endorse or promote products
++ *    derived from this software without specific prior written permission.
++ *
++ * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
++ * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
++ * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
++ * DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT,
++ * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
++ * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
++ * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
++ * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
++ * STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
++ * ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
++ * POSSIBILITY OF SUCH DAMAGE.
++ */
++
++#include <linux/version.h>
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,38) && !defined(AUTOCONF_INCLUDED)
++#include <linux/config.h>
++#endif
++#include <linux/module.h>
++#include <linux/list.h>
++#include <linux/wait.h>
++#include <linux/time.h>
++#include <linux/unistd.h>
++#include <linux/kernel.h>
++#include <linux/string.h>
++#include <linux/time.h>
++#include <cryptodev.h>
++#include "rndtest.h"
++
++static struct rndtest_stats rndstats;
++
++static	void rndtest_test(struct rndtest_state *);
++
++/* The tests themselves */
++static	int rndtest_monobit(struct rndtest_state *);
++static	int rndtest_runs(struct rndtest_state *);
++static	int rndtest_longruns(struct rndtest_state *);
++static	int rndtest_chi_4(struct rndtest_state *);
++
++static	int rndtest_runs_check(struct rndtest_state *, int, int *);
++static	void rndtest_runs_record(struct rndtest_state *, int, int *);
++
++static const struct rndtest_testfunc {
++	int (*test)(struct rndtest_state *);
++} rndtest_funcs[] = {
++	{ rndtest_monobit },
++	{ rndtest_runs },
++	{ rndtest_chi_4 },
++	{ rndtest_longruns },
++};
++
++#define	RNDTEST_NTESTS	(sizeof(rndtest_funcs)/sizeof(rndtest_funcs[0]))
++
++static void
++rndtest_test(struct rndtest_state *rsp)
++{
++	int i, rv = 0;
++
++	rndstats.rst_tests++;
++	for (i = 0; i < RNDTEST_NTESTS; i++)
++		rv |= (*rndtest_funcs[i].test)(rsp);
++	rsp->rs_discard = (rv != 0);
++}
++
++
++extern int crypto_debug;
++#define rndtest_verbose 2
++#define rndtest_report(rsp, failure, fmt, a...) \
++	{ if (failure || crypto_debug) { printk("rng_test: " fmt "\n", a); } else; }
++
++#define	RNDTEST_MONOBIT_MINONES	9725
++#define	RNDTEST_MONOBIT_MAXONES	10275
++
++static int
++rndtest_monobit(struct rndtest_state *rsp)
++{
++	int i, ones = 0, j;
++	u_int8_t r;
++
++	for (i = 0; i < RNDTEST_NBYTES; i++) {
++		r = rsp->rs_buf[i];
++		for (j = 0; j < 8; j++, r <<= 1)
++			if (r & 0x80)
++				ones++;
++	}
++	if (ones > RNDTEST_MONOBIT_MINONES &&
++	    ones < RNDTEST_MONOBIT_MAXONES) {
++		if (rndtest_verbose > 1)
++			rndtest_report(rsp, 0, "monobit pass (%d < %d < %d)",
++			    RNDTEST_MONOBIT_MINONES, ones,
++			    RNDTEST_MONOBIT_MAXONES);
++		return (0);
++	} else {
++		if (rndtest_verbose)
++			rndtest_report(rsp, 1,
++			    "monobit failed (%d ones)", ones);
++		rndstats.rst_monobit++;
++		return (-1);
++	}
++}
++
++#define	RNDTEST_RUNS_NINTERVAL	6
++
++static const struct rndtest_runs_tabs {
++	u_int16_t min, max;
++} rndtest_runs_tab[] = {
++	{ 2343, 2657 },
++	{ 1135, 1365 },
++	{ 542, 708 },
++	{ 251, 373 },
++	{ 111, 201 },
++	{ 111, 201 },
++};
++
++static int
++rndtest_runs(struct rndtest_state *rsp)
++{
++	int i, j, ones, zeros, rv = 0;
++	int onei[RNDTEST_RUNS_NINTERVAL], zeroi[RNDTEST_RUNS_NINTERVAL];
++	u_int8_t c;
++
++	bzero(onei, sizeof(onei));
++	bzero(zeroi, sizeof(zeroi));
++	ones = zeros = 0;
++	for (i = 0; i < RNDTEST_NBYTES; i++) {
++		c = rsp->rs_buf[i];
++		for (j = 0; j < 8; j++, c <<= 1) {
++			if (c & 0x80) {
++				ones++;
++				rndtest_runs_record(rsp, zeros, zeroi);
++				zeros = 0;
++			} else {
++				zeros++;
++				rndtest_runs_record(rsp, ones, onei);
++				ones = 0;
++			}
++		}
++	}
++	rndtest_runs_record(rsp, ones, onei);
++	rndtest_runs_record(rsp, zeros, zeroi);
++
++	rv |= rndtest_runs_check(rsp, 0, zeroi);
++	rv |= rndtest_runs_check(rsp, 1, onei);
++
++	if (rv)
++		rndstats.rst_runs++;
++
++	return (rv);
++}
++
++static void
++rndtest_runs_record(struct rndtest_state *rsp, int len, int *intrv)
++{
++	if (len == 0)
++		return;
++	if (len > RNDTEST_RUNS_NINTERVAL)
++		len = RNDTEST_RUNS_NINTERVAL;
++	len -= 1;
++	intrv[len]++;
++}
++
++static int
++rndtest_runs_check(struct rndtest_state *rsp, int val, int *src)
++{
++	int i, rv = 0;
++
++	for (i = 0; i < RNDTEST_RUNS_NINTERVAL; i++) {
++		if (src[i] < rndtest_runs_tab[i].min ||
++		    src[i] > rndtest_runs_tab[i].max) {
++			rndtest_report(rsp, 1,
++			    "%s interval %d failed (%d, %d-%d)",
++			    val ? "ones" : "zeros",
++			    i + 1, src[i], rndtest_runs_tab[i].min,
++			    rndtest_runs_tab[i].max);
++			rv = -1;
++		} else {
++			rndtest_report(rsp, 0,
++			    "runs pass %s interval %d (%d < %d < %d)",
++			    val ? "ones" : "zeros",
++			    i + 1, rndtest_runs_tab[i].min, src[i],
++			    rndtest_runs_tab[i].max);
++		}
++	}
++	return (rv);
++}
++
++static int
++rndtest_longruns(struct rndtest_state *rsp)
++{
++	int i, j, ones = 0, zeros = 0, maxones = 0, maxzeros = 0;
++	u_int8_t c;
++
++	for (i = 0; i < RNDTEST_NBYTES; i++) {
++		c = rsp->rs_buf[i];
++		for (j = 0; j < 8; j++, c <<= 1) {
++			if (c & 0x80) {
++				zeros = 0;
++				ones++;
++				if (ones > maxones)
++					maxones = ones;
++			} else {
++				ones = 0;
++				zeros++;
++				if (zeros > maxzeros)
++					maxzeros = zeros;
++			}
++		}
++	}
++
++	if (maxones < 26 && maxzeros < 26) {
++		rndtest_report(rsp, 0, "longruns pass (%d ones, %d zeros)",
++			maxones, maxzeros);
++		return (0);
++	} else {
++		rndtest_report(rsp, 1, "longruns fail (%d ones, %d zeros)",
++			maxones, maxzeros);
++		rndstats.rst_longruns++;
++		return (-1);
++	}
++}
++
++/*
++ * chi^2 test over 4 bits: (this is called the poker test in FIPS 140-2,
++ * but it is really the chi^2 test over 4 bits (the poker test as described
++ * by Knuth vol 2 is something different, and I take him as authoritative
++ * on nomenclature over NIST).
++ */
++#define	RNDTEST_CHI4_K	16
++#define	RNDTEST_CHI4_K_MASK	(RNDTEST_CHI4_K - 1)
++
++/*
++ * The unnormalized values are used so that we don't have to worry about
++ * fractional precision.  The "real" value is found by:
++ *	(V - 1562500) * (16 / 5000) = Vn   (where V is the unnormalized value)
++ */
++#define	RNDTEST_CHI4_VMIN	1563181		/* 2.1792 */
++#define	RNDTEST_CHI4_VMAX	1576929		/* 46.1728 */
++
++static int
++rndtest_chi_4(struct rndtest_state *rsp)
++{
++	unsigned int freq[RNDTEST_CHI4_K], i, sum;
++
++	for (i = 0; i < RNDTEST_CHI4_K; i++)
++		freq[i] = 0;
++
++	/* Get number of occurances of each 4 bit pattern */
++	for (i = 0; i < RNDTEST_NBYTES; i++) {
++		freq[(rsp->rs_buf[i] >> 4) & RNDTEST_CHI4_K_MASK]++;
++		freq[(rsp->rs_buf[i] >> 0) & RNDTEST_CHI4_K_MASK]++;
++	}
++
++	for (i = 0, sum = 0; i < RNDTEST_CHI4_K; i++)
++		sum += freq[i] * freq[i];
++
++	if (sum >= 1563181 && sum <= 1576929) {
++		rndtest_report(rsp, 0, "chi^2(4): pass (sum %u)", sum);
++		return (0);
++	} else {
++		rndtest_report(rsp, 1, "chi^2(4): failed (sum %u)", sum);
++		rndstats.rst_chi++;
++		return (-1);
++	}
++}
++
++int
++rndtest_buf(unsigned char *buf)
++{
++	struct rndtest_state rsp;
++
++	memset(&rsp, 0, sizeof(rsp));
++	rsp.rs_buf = buf;
++	rndtest_test(&rsp);
++	return(rsp.rs_discard);
++}
++
+diff --git a/crypto/ocf/rndtest.h b/crypto/ocf/rndtest.h
+new file mode 100644
+index 0000000..e9d8ec8
+--- /dev/null
++++ b/crypto/ocf/rndtest.h
+@@ -0,0 +1,54 @@
++/*	$FreeBSD: src/sys/dev/rndtest/rndtest.h,v 1.1 2003/03/11 22:54:44 sam Exp $	*/
++/*	$OpenBSD$	*/
++
++/*
++ * Copyright (c) 2002 Jason L. Wright (jason@thought.net)
++ * All rights reserved.
++ *
++ * Redistribution and use in source and binary forms, with or without
++ * modification, are permitted provided that the following conditions
++ * are met:
++ * 1. Redistributions of source code must retain the above copyright
++ *    notice, this list of conditions and the following disclaimer.
++ * 2. Redistributions in binary form must reproduce the above copyright
++ *    notice, this list of conditions and the following disclaimer in the
++ *    documentation and/or other materials provided with the distribution.
++ * 3. All advertising materials mentioning features or use of this software
++ *    must display the following acknowledgement:
++ *	This product includes software developed by Jason L. Wright
++ * 4. The name of the author may not be used to endorse or promote products
++ *    derived from this software without specific prior written permission.
++ *
++ * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
++ * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
++ * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
++ * DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT,
++ * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
++ * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
++ * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
++ * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
++ * STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
++ * ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
++ * POSSIBILITY OF SUCH DAMAGE.
++ */
++
++
++/* Some of the tests depend on these values */
++#define	RNDTEST_NBYTES	2500
++#define	RNDTEST_NBITS	(8 * RNDTEST_NBYTES)
++
++struct rndtest_state {
++	int		rs_discard;	/* discard/accept random data */
++	u_int8_t	*rs_buf;
++};
++
++struct rndtest_stats {
++	u_int32_t	rst_discard;	/* number of bytes discarded */
++	u_int32_t	rst_tests;	/* number of test runs */
++	u_int32_t	rst_monobit;	/* monobit test failures */
++	u_int32_t	rst_runs;	/* 0/1 runs failures */
++	u_int32_t	rst_longruns;	/* longruns failures */
++	u_int32_t	rst_chi;	/* chi^2 failures */
++};
++
++extern int rndtest_buf(unsigned char *buf);
+diff --git a/crypto/ocf/uio.h b/crypto/ocf/uio.h
+new file mode 100644
+index 0000000..03a6249
+--- /dev/null
++++ b/crypto/ocf/uio.h
+@@ -0,0 +1,54 @@
++#ifndef _OCF_UIO_H_
++#define _OCF_UIO_H_
++
++#include <linux/uio.h>
++
++/*
++ * The linux uio.h doesn't have all we need.  To be fully api compatible
++ * with the BSD cryptodev,  we need to keep this around.  Perhaps this can
++ * be moved back into the linux/uio.h
++ *
++ * Linux port done by David McCullough <david_mccullough@mcafee.com>
++ * Copyright (C) 2006-2010 David McCullough
++ * Copyright (C) 2004-2005 Intel Corporation.
++ *
++ * LICENSE TERMS
++ *
++ * The free distribution and use of this software in both source and binary
++ * form is allowed (with or without changes) provided that:
++ *
++ *   1. distributions of this source code include the above copyright
++ *      notice, this list of conditions and the following disclaimer;
++ *
++ *   2. distributions in binary form include the above copyright
++ *      notice, this list of conditions and the following disclaimer
++ *      in the documentation and/or other associated materials;
++ *
++ *   3. the copyright holder's name is not used to endorse products
++ *      built using this software without specific written permission.
++ *
++ * ALTERNATIVELY, provided that this notice is retained in full, this product
++ * may be distributed under the terms of the GNU General Public License (GPL),
++ * in which case the provisions of the GPL apply INSTEAD OF those given above.
++ *
++ * DISCLAIMER
++ *
++ * This software is provided 'as is' with no explicit or implied warranties
++ * in respect of its properties, including, but not limited to, correctness
++ * and/or fitness for purpose.
++ * ---------------------------------------------------------------------------
++ */
++
++struct uio {
++	struct	iovec *uio_iov;
++	int		uio_iovcnt;
++	off_t	uio_offset;
++	int		uio_resid;
++#if 0
++	enum	uio_seg uio_segflg;
++	enum	uio_rw uio_rw;
++	struct  thread *uio_td;
++#endif
++};
++
++#endif
+diff --git a/drivers/char/random.c b/drivers/char/random.c
+index 6035ab8..8c3acdf 100644
+--- a/drivers/char/random.c
++++ b/drivers/char/random.c
+@@ -130,6 +130,9 @@
+  * 	void add_interrupt_randomness(int irq);
+  * 	void add_disk_randomness(struct gendisk *disk);
+  *
++ *      void random_input_words(__u32 *buf, size_t wordcount, int ent_count)
++ *      int random_input_wait(void);
++ *
+  * add_input_randomness() uses the input layer interrupt timing, as well as
+  * the event type information from the hardware.
+  *
+@@ -147,6 +150,13 @@
+  * seek times do not make for good sources of entropy, as their seek
+  * times are usually fairly consistent.
+  *
++ * random_input_words() just provides a raw block of entropy to the input
++ * pool, such as from a hardware entropy generator.
++ *
++ * random_input_wait() suspends the caller until such time as the
++ * entropy pool falls below the write threshold, and returns a count of how
++ * much entropy (in bits) is needed to sustain the pool.
++ *
+  * All of these routines try to estimate how many bits of randomness a
+  * particular randomness source.  They do this by keeping track of the
+  * first and second order deltas of the event timings.
+@@ -722,6 +732,63 @@ void add_disk_randomness(struct gendisk *disk)
+ }
+ #endif
+
++/*
++ * random_input_words - add bulk entropy to pool
++ *
++ * @buf: buffer to add
++ * @wordcount: number of __u32 words to add
++ * @ent_count: total amount of entropy (in bits) to credit
++ *
++ * this provides bulk input of entropy to the input pool
++ *
++ */
++void random_input_words(__u32 *buf, size_t wordcount, int ent_count)
++{
++	mix_pool_bytes(&input_pool, buf, wordcount*4);
++
++	credit_entropy_bits(&input_pool, ent_count);
++
++	DEBUG_ENT("crediting %d bits => %d\n",
++		  ent_count, input_pool.entropy_count);
++	/*
++	 * Wake up waiting processes if we have enough
++	 * entropy.
++	 */
++	if (input_pool.entropy_count >= random_read_wakeup_thresh)
++		wake_up_interruptible(&random_read_wait);
++}
++EXPORT_SYMBOL(random_input_words);
++
++/*
++ * random_input_wait - wait until random needs entropy
++ *
++ * this function sleeps until the /dev/random subsystem actually
++ * needs more entropy, and then return the amount of entropy
++ * that it would be nice to have added to the system.
++ */
++int random_input_wait(void)
++{
++	int count;
++
++	wait_event_interruptible(random_write_wait,
++			 input_pool.entropy_count < random_write_wakeup_thresh);
++
++	count = random_write_wakeup_thresh - input_pool.entropy_count;
++
++        /* likely we got woken up due to a signal */
++	if (count <= 0) count = random_read_wakeup_thresh;
++
++	DEBUG_ENT("requesting %d bits from input_wait()er %d<%d\n",
++		  count,
++		  input_pool.entropy_count, random_write_wakeup_thresh);
++
++	return count;
++}
++EXPORT_SYMBOL(random_input_wait);
++
++
++#define EXTRACT_SIZE 10
++
+ /*********************************************************************
+  *
+  * Entropy extraction routines
+diff --git a/fs/fcntl.c b/fs/fcntl.c
+index 22764c7..0ffe61f 100644
+--- a/fs/fcntl.c
++++ b/fs/fcntl.c
+@@ -142,6 +142,7 @@ SYSCALL_DEFINE1(dup, unsigned int, fildes)
+	}
+	return ret;
+ }
++EXPORT_SYMBOL(sys_dup);
+
+ #define SETFL_MASK (O_APPEND | O_NONBLOCK | O_NDELAY | O_DIRECT | O_NOATIME)
+
+diff --git a/include/linux/miscdevice.h b/include/linux/miscdevice.h
+index c41d727..24b73c0 100644
+--- a/include/linux/miscdevice.h
++++ b/include/linux/miscdevice.h
+@@ -19,6 +19,7 @@
+ #define APOLLO_MOUSE_MINOR	7
+ #define PC110PAD_MINOR		9
+ /*#define ADB_MOUSE_MINOR	10	FIXME OBSOLETE */
++#define CRYPTODEV_MINOR		70	/* /dev/crypto */
+ #define WATCHDOG_MINOR		130	/* Watchdog timer     */
+ #define TEMP_MINOR		131	/* Temperature Sensor */
+ #define RTC_MINOR		135
+diff --git a/include/linux/random.h b/include/linux/random.h
+index 8f74538..0ff31a9 100644
+--- a/include/linux/random.h
++++ b/include/linux/random.h
+@@ -34,6 +34,30 @@
+ /* Clear the entropy pool and associated counters.  (Superuser only.) */
+ #define RNDCLEARPOOL	_IO( 'R', 0x06 )
+
++#ifdef CONFIG_FIPS_RNG
++
++/* Size of seed value - equal to AES blocksize */
++#define AES_BLOCK_SIZE_BYTES	16
++#define SEED_SIZE_BYTES			AES_BLOCK_SIZE_BYTES
++/* Size of AES key */
++#define KEY_SIZE_BYTES		16
++
++/* ioctl() structure used by FIPS 140-2 Tests */
++struct rand_fips_test {
++	unsigned char key[KEY_SIZE_BYTES];			/* Input */
++	unsigned char datetime[SEED_SIZE_BYTES];	/* Input */
++	unsigned char seed[SEED_SIZE_BYTES];		/* Input */
++	unsigned char result[SEED_SIZE_BYTES];		/* Output */
++};
++
++/* FIPS 140-2 RNG Variable Seed Test. (Superuser only.) */
++#define RNDFIPSVST	_IOWR('R', 0x10, struct rand_fips_test)
++
++/* FIPS 140-2 RNG Monte Carlo Test. (Superuser only.) */
++#define RNDFIPSMCT	_IOWR('R', 0x11, struct rand_fips_test)
++
++#endif /* #ifdef CONFIG_FIPS_RNG */
++
+ struct rand_pool_info {
+	int	entropy_count;
+	int	buf_size;
+@@ -54,6 +78,10 @@ extern void add_input_randomness(unsigned int type, unsigned int code,
+				 unsigned int value);
+ extern void add_interrupt_randomness(int irq);
+
++extern void random_input_words(__u32 *buf, size_t wordcount, int ent_count);
++extern int random_input_wait(void);
++#define HAS_RANDOM_INPUT_WAIT 1
++
+ extern void get_random_bytes(void *buf, int nbytes);
+ void generate_random_uuid(unsigned char uuid_out[16]);
+
+diff --git a/kernel/pid.c b/kernel/pid.c
+index fa5f722..2bf49fd 100644
+--- a/kernel/pid.c
++++ b/kernel/pid.c
+@@ -428,6 +428,7 @@ struct task_struct *find_task_by_vpid(pid_t vnr)
+ {
+	return find_task_by_pid_ns(vnr, current->nsproxy->pid_ns);
+ }
++EXPORT_SYMBOL(find_task_by_vpid);
+
+ struct pid *get_task_pid(struct task_struct *task, enum pid_type type)
+ {
+--
+1.7.0.4
diff --git a/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0002-am335x-Add-suspend-resume-routines-to-crypto-driver.patch b/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0002-am335x-Add-suspend-resume-routines-to-crypto-driver.patch
new file mode 100644
index 0000000..6066c0a
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0002-am335x-Add-suspend-resume-routines-to-crypto-driver.patch
@@ -0,0 +1,147 @@
+From 0fb328ec0a5ba8a1440336c8dc7a029cfffa4529 Mon Sep 17 00:00:00 2001
+From: Greg Turner <gregturner@ti.com>
+Date: Thu, 19 Jul 2012 15:27:59 -0500
+Subject: [PATCH 2/2] [am335x]: Add suspend resume routines to crypto driver
+
+* Add suspend resume routines to AES crypto driver
+* Add suspend resume routines to SHA crypto driver
+* Cleaned up some build warnings
+---
+ drivers/crypto/omap4-aes.c  |   31 ++++++++++++++++++++++++++++---
+ drivers/crypto/omap4-sham.c |   32 +++++++++++++++++++++++++++-----
+ 2 files changed, 55 insertions(+), 8 deletions(-)
+
+diff --git a/drivers/crypto/omap4-aes.c b/drivers/crypto/omap4-aes.c
+index 76f988a..c7d08df 100755
+--- a/drivers/crypto/omap4-aes.c
++++ b/drivers/crypto/omap4-aes.c
+@@ -878,9 +878,9 @@ err_io:
+	udelay(1);
+
+
+-err_res:
+-	kfree(dd);
+-	dd = NULL;
++//err_res:
++	//kfree(dd);
++	//dd = NULL;
+ err_data:
+	dev_err(dev, "initialization failed.\n");
+	return err;
+@@ -916,12 +916,35 @@ static int omap4_aes_remove(struct platform_device *pdev)
+	return 0;
+ }
+
++static int omap4_aes_suspend(struct device *dev)
++{
++	pr_debug("#### Crypto: Suspend call ####\n");
++
++	return 0;
++}
++
++
++static int omap4_aes_resume(struct device *dev)
++{
++	pr_debug("#### Crypto: resume call ####\n");
++
++	return 0;
++}
++
++static struct dev_pm_ops omap4_aes_dev_pm_ops = {
++	.suspend	= omap4_aes_suspend,
++	.resume		= omap4_aes_resume,
++	.runtime_suspend = omap4_aes_suspend,
++	.runtime_resume = omap4_aes_resume,
++};
++
+ static struct platform_driver omap4_aes_driver = {
+	.probe	= omap4_aes_probe,
+	.remove	= omap4_aes_remove,
+	.driver	= {
+		.name	= "omap4-aes",
+		.owner	= THIS_MODULE,
++		.pm		= &omap4_aes_dev_pm_ops
+	},
+ };
+
+@@ -944,6 +967,8 @@ static void __exit omap4_aes_mod_exit(void)
+	platform_driver_unregister(&omap4_aes_driver);
+ }
+
++
++
+ module_init(omap4_aes_mod_init);
+ module_exit(omap4_aes_mod_exit);
+
+diff --git a/drivers/crypto/omap4-sham.c b/drivers/crypto/omap4-sham.c
+index 21f1b48..2fb71b9 100755
+--- a/drivers/crypto/omap4-sham.c
++++ b/drivers/crypto/omap4-sham.c
+@@ -239,7 +239,7 @@ static void omap4_sham_copy_ready_hash(struct ahash_request *req)
+	struct omap4_sham_reqctx *ctx = ahash_request_ctx(req);
+	u32 *in = (u32 *)ctx->digest;
+	u32 *hash = (u32 *)req->result;
+-	int i, d;
++	int i, d = 0;
+
+	if (!hash)
+		return;
+@@ -1224,8 +1224,6 @@ static void omap4_sham_dma_callback(unsigned int lch, u16 ch_status, void *data)
+
+ static int omap4_sham_dma_init(struct omap4_sham_dev *dd)
+ {
+-	int err;
+-
+	dd->dma_lch = -1;
+
+	dd->dma_lch = edma_alloc_channel(dd->dma, omap4_sham_dma_callback, dd, EVENTQ_2);
+@@ -1349,8 +1347,9 @@ io_err:
+	pm_runtime_disable(dev);
+	udelay(1);
+
+-clk_err:
+-	omap4_sham_dma_cleanup(dd);
++//clk_err:
++//	omap4_sham_dma_cleanup(dd);
++
+ dma_err:
+	if (dd->irq >= 0)
+		free_irq(dd->irq, dd);
+@@ -1392,12 +1391,35 @@ static int __devexit omap4_sham_remove(struct platform_device *pdev)
+	return 0;
+ }
+
++static int omap4_sham_suspend(struct device *dev)
++{
++	pr_debug("#### Crypto: Suspend call ####\n");
++
++	return 0;
++}
++
++
++static int omap4_sham_resume(struct device *dev)
++{
++	pr_debug("#### Crypto: resume call ####\n");
++
++	return 0;
++}
++
++static struct dev_pm_ops omap4_sham_dev_pm_ops = {
++	.suspend	= omap4_sham_suspend,
++	.resume		= omap4_sham_resume,
++	.runtime_suspend = omap4_sham_suspend,
++	.runtime_resume = omap4_sham_resume,
++};
++
+ static struct platform_driver omap4_sham_driver = {
+	.probe	= omap4_sham_probe,
+	.remove	= omap4_sham_remove,
+	.driver	= {
+		.name	= "omap4-sham",
+		.owner	= THIS_MODULE,
++		.pm		= &omap4_sham_dev_pm_ops
+	},
+ };
+
+--
+1.7.0.4
diff --git a/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0002-am33x-Add-crypto-device-and-resource-structures.patch b/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0002-am33x-Add-crypto-device-and-resource-structures.patch
new file mode 100644
index 0000000..eb0223c
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0002-am33x-Add-crypto-device-and-resource-structures.patch
@@ -0,0 +1,111 @@
+From 8c0f7553e75774849463f90b0135874754650386 Mon Sep 17 00:00:00 2001
+From: Greg Turner <gregturner@ti.com>
+Date: Thu, 17 May 2012 14:45:05 -0500
+Subject: [PATCH 2/8] am33x: Add crypto device and resource structures
+
+* Add platform device and resource structures to devices.c
+* Structures are for the AES and SHA/MD5 crypto modules
+* Used in the OMAP4 crypto driver
+
+Signed-off-by: Greg Turner <gregturner@ti.com>
+---
+ arch/arm/mach-omap2/devices.c |   67 +++++++++++++++++++++++++++++++++++++++++
+ 1 files changed, 67 insertions(+), 0 deletions(-)
+ mode change 100644 => 100755 arch/arm/mach-omap2/devices.c
+
+diff --git a/arch/arm/mach-omap2/devices.c b/arch/arm/mach-omap2/devices.c
+old mode 100644
+new mode 100755
+index 9e029da..5c6e3e2
+--- a/arch/arm/mach-omap2/devices.c
++++ b/arch/arm/mach-omap2/devices.c
+@@ -47,6 +47,7 @@
+ #include <plat/omap_hwmod.h>
+ #include <plat/omap_device.h>
+ #include <plat/omap4-keypad.h>
++#include <plat/am33xx.h>
+ #include <plat/config_pwm.h>
+ #include <plat/cpu.h>
+ #include <plat/gpmc.h>
+@@ -702,6 +703,41 @@ static void omap_init_sham(void)
+	}
+	platform_device_register(&sham_device);
+ }
++
++#elif defined(CONFIG_CRYPTO_DEV_OMAP4_SHAM) || defined(CONFIG_CRYPTO_DEV_OMAP4_SHAM_MODULE)
++
++static struct resource omap4_sham_resources[] = {
++	{
++		.start	= AM33XX_SHA1MD5_P_BASE,
++		.end	= AM33XX_SHA1MD5_P_BASE + 0x120,
++		.flags	= IORESOURCE_MEM,
++	},
++	{
++		.start	= AM33XX_IRQ_SHAEIP57t0_P,
++		.flags	= IORESOURCE_IRQ,
++	},
++	{
++		.start	= AM33XX_DMA_SHAEIP57T0_DIN,
++		.flags	= IORESOURCE_DMA,
++	}
++};
++
++static int omap4_sham_resources_sz = ARRAY_SIZE(omap4_sham_resources);
++
++
++static struct platform_device sham_device = {
++	.name		= "omap4-sham",
++	.id		= -1,
++};
++
++static void omap_init_sham(void)
++{
++	sham_device.resource = omap4_sham_resources;
++	sham_device.num_resources = omap4_sham_resources_sz;
++
++	platform_device_register(&sham_device);
++}
++
+ #else
+ static inline void omap_init_sham(void) { }
+ #endif
+@@ -772,6 +808,37 @@ static void omap_init_aes(void)
+	platform_device_register(&aes_device);
+ }
+
++#elif defined(CONFIG_CRYPTO_DEV_OMAP4_AES) || defined(CONFIG_CRYPTO_DEV_OMAP4_AES_MODULE)
++
++static struct resource omap4_aes_resources[] = {
++	{
++		.start	= AM33XX_AES0_P_BASE,
++		.end	= AM33XX_AES0_P_BASE + 0x4C,
++		.flags	= IORESOURCE_MEM,
++	},
++	{
++		.start	= AM33XX_DMA_AESEIP36T0_DOUT,
++		.flags	= IORESOURCE_DMA,
++	},
++	{
++		.start	= AM33XX_DMA_AESEIP36T0_DIN,
++		.flags	= IORESOURCE_DMA,
++	}
++};
++static int omap4_aes_resources_sz = ARRAY_SIZE(omap4_aes_resources);
++
++static struct platform_device aes_device = {
++	.name		= "omap4-aes",
++	.id		= -1,
++};
++
++static void omap_init_aes(void)
++{
++	aes_device.resource = omap4_aes_resources;
++	aes_device.num_resources = omap4_aes_resources_sz;
++	platform_device_register(&aes_device);
++}
++
+ #else
+ static inline void omap_init_aes(void) { }
+ #endif
+--
+1.7.0.4
diff --git a/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0002-am33xx-Enable-CONFIG_AM33XX_SMARTREFLEX.patch b/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0002-am33xx-Enable-CONFIG_AM33XX_SMARTREFLEX.patch
new file mode 100644
index 0000000..04e3bee
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0002-am33xx-Enable-CONFIG_AM33XX_SMARTREFLEX.patch
@@ -0,0 +1,26 @@
+From e1b7a67fc82991a633f0ed615d69157c98c1c35d Mon Sep 17 00:00:00 2001
+From: Greg Guyotte <gguyotte@ti.com>
+Date: Thu, 7 Jun 2012 18:15:21 -0500
+Subject: [PATCH 2/2] am33xx: Enable CONFIG_AM33XX_SMARTREFLEX
+
+Simply enables the SmartReflex driver in the defconfig file.
+
+Signed-off-by: Greg Guyotte <gguyotte@ti.com>
+---
+ arch/arm/configs/am335x_evm_defconfig |    1 +
+ 1 files changed, 1 insertions(+), 0 deletions(-)
+
+diff --git a/arch/arm/configs/am335x_evm_defconfig b/arch/arm/configs/am335x_evm_defconfig
+index de1eaad..ce5d1d6 100644
+--- a/arch/arm/configs/am335x_evm_defconfig
++++ b/arch/arm/configs/am335x_evm_defconfig
+@@ -269,6 +269,7 @@ CONFIG_ARCH_OMAP2PLUS=y
+ # OMAP Feature Selections
+ #
+ # CONFIG_OMAP_SMARTREFLEX is not set
++CONFIG_AM33XX_SMARTREFLEX=y
+ CONFIG_OMAP_RESET_CLOCKS=y
+ CONFIG_OMAP_MUX=y
+ CONFIG_OMAP_MUX_DEBUG=y
+--
+1.7.0.4
diff --git a/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0003-am33x-Add-crypto-device-and-resource-structure-for-T.patch b/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0003-am33x-Add-crypto-device-and-resource-structure-for-T.patch
new file mode 100644
index 0000000..def61d5
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0003-am33x-Add-crypto-device-and-resource-structure-for-T.patch
@@ -0,0 +1,60 @@
+From b7477dd40221a91af286bffa110879075a498943 Mon Sep 17 00:00:00 2001
+From: Greg Turner <gregturner@ti.com>
+Date: Thu, 17 May 2012 14:49:39 -0500
+Subject: [PATCH 3/8] am33x: Add crypto device and resource structure for TRNG
+
+* Add platform device and resource structure to devices.c
+* Structures are for the TRNG crypto module
+* Used in the OMAP4 crypto driver
+
+Signed-off-by: Greg Turner <gregturner@ti.com>
+---
+ arch/arm/plat-omap/devices.c |   23 +++++++++++++++++++++++
+ 1 files changed, 23 insertions(+), 0 deletions(-)
+ mode change 100644 => 100755 arch/arm/plat-omap/devices.c
+
+diff --git a/arch/arm/plat-omap/devices.c b/arch/arm/plat-omap/devices.c
+old mode 100644
+new mode 100755
+index 1971932..52720b4
+--- a/arch/arm/plat-omap/devices.c
++++ b/arch/arm/plat-omap/devices.c
+@@ -26,6 +26,7 @@
+ #include <plat/mmc.h>
+ #include <plat/menelaus.h>
+ #include <plat/omap44xx.h>
++#include <plat/am33xx.h>
+
+ #if defined(CONFIG_MMC_OMAP) || defined(CONFIG_MMC_OMAP_MODULE) || \
+	defined(CONFIG_MMC_OMAP_HS) || defined(CONFIG_MMC_OMAP_HS_MODULE)
+@@ -104,6 +105,28 @@ static void omap_init_rng(void)
+ {
+	(void) platform_device_register(&omap_rng_device);
+ }
++#elif defined(CONFIG_HW_RANDOM_OMAP4) || defined(CONFIG_HW_RANDOM_OMAP4_MODULE)
++
++static struct resource rng_resources[] = {
++	{
++		.start		= AM33XX_RNG_BASE,
++		.end		= AM33XX_RNG_BASE + 0x1FFC,
++		.flags		= IORESOURCE_MEM,
++	},
++};
++
++static struct platform_device omap4_rng_device = {
++	.name		= "omap4_rng",
++	.id		= -1,
++	.num_resources	= ARRAY_SIZE(rng_resources),
++	.resource	= rng_resources,
++};
++
++static void omap_init_rng(void)
++{
++	(void) platform_device_register(&omap4_rng_device);
++}
++
+ #else
+ static inline void omap_init_rng(void) {}
+ #endif
+--
+1.7.0.4
diff --git a/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0004-am33x-Add-crypto-drivers-to-Kconfig-and-Makefiles.patch b/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0004-am33x-Add-crypto-drivers-to-Kconfig-and-Makefiles.patch
new file mode 100644
index 0000000..31d8363
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0004-am33x-Add-crypto-drivers-to-Kconfig-and-Makefiles.patch
@@ -0,0 +1,124 @@
+From e49e6dcff5665cb2f132d9654a060fa43a382810 Mon Sep 17 00:00:00 2001
+From: Greg Turner <gregturner@ti.com>
+Date: Thu, 17 May 2012 14:53:25 -0500
+Subject: [PATCH 4/8] am33x: Add crypto drivers to Kconfig and Makefiles
+
+* Add OMAP4 TRNG driver to hw_random Kconfig and Makefile
+* Add OMAP4 AES and SHA/MD5 driver to crypto Kconfig and Makefile
+* Needed so that drivers can be selected during kernel config
+
+Signed-off-by: Greg Turner <gregturner@ti.com>
+---
+ drivers/char/hw_random/Kconfig  |   13 +++++++++++++
+ drivers/char/hw_random/Makefile |    1 +
+ drivers/crypto/Kconfig          |   22 ++++++++++++++++++++--
+ drivers/crypto/Makefile         |    2 ++
+ 4 files changed, 36 insertions(+), 2 deletions(-)
+ mode change 100644 => 100755 drivers/char/hw_random/Kconfig
+ mode change 100644 => 100755 drivers/char/hw_random/Makefile
+ mode change 100644 => 100755 drivers/crypto/Kconfig
+ mode change 100644 => 100755 drivers/crypto/Makefile
+
+diff --git a/drivers/char/hw_random/Kconfig b/drivers/char/hw_random/Kconfig
+old mode 100644
+new mode 100755
+index 0689bf6..207e3e7
+--- a/drivers/char/hw_random/Kconfig
++++ b/drivers/char/hw_random/Kconfig
+@@ -139,6 +139,19 @@ config HW_RANDOM_OMAP
+
+	  If unsure, say Y.
+
++config HW_RANDOM_OMAP4
++	tristate "OMAP4 Random Number Generator support"
++	depends on HW_RANDOM && SOC_OMAPAM33XX
++	default HW_RANDOM
++	---help---
++	  This driver provides kernel-side support for the Random Number
++	  Generator hardware found on OMAP4 derived processors.
++
++	  To compile this driver as a module, choose M here: the
++	  module will be called omap4-rng.
++
++	  If unsure, say Y.
++
+ config HW_RANDOM_OCTEON
+	tristate "Octeon Random Number Generator support"
+	depends on HW_RANDOM && CPU_CAVIUM_OCTEON
+diff --git a/drivers/char/hw_random/Makefile b/drivers/char/hw_random/Makefile
+old mode 100644
+new mode 100755
+index b2ff526..fecced0
+--- a/drivers/char/hw_random/Makefile
++++ b/drivers/char/hw_random/Makefile
+@@ -14,6 +14,7 @@ n2-rng-y := n2-drv.o n2-asm.o
+ obj-$(CONFIG_HW_RANDOM_VIA) += via-rng.o
+ obj-$(CONFIG_HW_RANDOM_IXP4XX) += ixp4xx-rng.o
+ obj-$(CONFIG_HW_RANDOM_OMAP) += omap-rng.o
++obj-$(CONFIG_HW_RANDOM_OMAP4) += omap4-rng.o
+ obj-$(CONFIG_HW_RANDOM_PASEMI) += pasemi-rng.o
+ obj-$(CONFIG_HW_RANDOM_VIRTIO) += virtio-rng.o
+ obj-$(CONFIG_HW_RANDOM_TX4939) += tx4939-rng.o
+diff --git a/drivers/crypto/Kconfig b/drivers/crypto/Kconfig
+old mode 100644
+new mode 100755
+index 6d16b4b..6c1331a
+--- a/drivers/crypto/Kconfig
++++ b/drivers/crypto/Kconfig
+@@ -250,7 +250,7 @@ config CRYPTO_DEV_PPC4XX
+
+ config CRYPTO_DEV_OMAP_SHAM
+	tristate "Support for OMAP SHA1/MD5 hw accelerator"
+-	depends on ARCH_OMAP2 || ARCH_OMAP3
++	depends on (ARCH_OMAP2) || (ARCH_OMAP3) && (!SOC_OMAPAM33XX)
+	select CRYPTO_SHA1
+	select CRYPTO_MD5
+	help
+@@ -259,12 +259,30 @@ config CRYPTO_DEV_OMAP_SHAM
+
+ config CRYPTO_DEV_OMAP_AES
+	tristate "Support for OMAP AES hw engine"
+-	depends on ARCH_OMAP2 || ARCH_OMAP3
++	depends on (ARCH_OMAP2) || (ARCH_OMAP3) && (!SOC_OMAPAM33XX)
+	select CRYPTO_AES
+	help
+	  OMAP processors have AES module accelerator. Select this if you
+	  want to use the OMAP module for AES algorithms.
+
++config CRYPTO_DEV_OMAP4_AES
++	tristate "Support for OMAP4 AES hw engine"
++	depends on SOC_OMAPAM33XX
++	select CRYPTO_AES
++	help
++	  OMAP4 -based processors have AES module accelerators. Select this if you
++	  want to use the OMAP4 module for AES algorithms.
++
++config CRYPTO_DEV_OMAP4_SHAM
++	tristate "Support for OMAP4 SHA/MD5 hw engine"
++	depends on SOC_OMAPAM33XX
++	select CRYPTO_SHA1
++	select CRYPTO_SHA256
++	select CRYPTO_MD5
++	help
++	  OMAP4 -based processors have SHA/MD5 module accelerators. Select this if you
++	  want to use the OMAP4 module for SHA/MD5 algorithms.
++
+ config CRYPTO_DEV_PICOXCELL
+	tristate "Support for picoXcell IPSEC and Layer2 crypto engines"
+	depends on ARCH_PICOXCELL && HAVE_CLK
+diff --git a/drivers/crypto/Makefile b/drivers/crypto/Makefile
+old mode 100644
+new mode 100755
+index 53ea501..5b420a5
+--- a/drivers/crypto/Makefile
++++ b/drivers/crypto/Makefile
+@@ -11,5 +11,7 @@ obj-$(CONFIG_CRYPTO_DEV_IXP4XX) += ixp4xx_crypto.o
+ obj-$(CONFIG_CRYPTO_DEV_PPC4XX) += amcc/
+ obj-$(CONFIG_CRYPTO_DEV_OMAP_SHAM) += omap-sham.o
+ obj-$(CONFIG_CRYPTO_DEV_OMAP_AES) += omap-aes.o
++obj-$(CONFIG_CRYPTO_DEV_OMAP4_AES) += omap4-aes.o
++obj-$(CONFIG_CRYPTO_DEV_OMAP4_SHAM) += omap4-sham.o
+ obj-$(CONFIG_CRYPTO_DEV_PICOXCELL) += picoxcell_crypto.o
+ obj-$(CONFIG_CRYPTO_DEV_S5P) += s5p-sss.o
+--
+1.7.0.4
diff --git a/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0005-am33x-Create-header-file-for-OMAP4-crypto-modules.patch b/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0005-am33x-Create-header-file-for-OMAP4-crypto-modules.patch
new file mode 100644
index 0000000..94d89e5
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0005-am33x-Create-header-file-for-OMAP4-crypto-modules.patch
@@ -0,0 +1,213 @@
+From 2dc9dec7510746b3c3f5420f4f3ab8395cc7b012 Mon Sep 17 00:00:00 2001
+From: Greg Turner <gregturner@ti.com>
+Date: Thu, 17 May 2012 14:59:38 -0500
+Subject: [PATCH 5/8] am33x: Create header file for OMAP4 crypto modules
+
+* This header file defines addresses and macros used to access crypto modules on OMAP4 derivative SOC's like AM335x.
+
+Signed-off-by: Greg Turner <gregturner@ti.com>
+---
+ drivers/crypto/omap4.h |  192 ++++++++++++++++++++++++++++++++++++++++++++++++
+ 1 files changed, 192 insertions(+), 0 deletions(-)
+ create mode 100644 drivers/crypto/omap4.h
+
+diff --git a/drivers/crypto/omap4.h b/drivers/crypto/omap4.h
+new file mode 100644
+index 0000000..d9d6315
+--- /dev/null
++++ b/drivers/crypto/omap4.h
+@@ -0,0 +1,192 @@
++/*
++ * drivers/crypto/omap4.h
++ *
++ * Copyright © 2011 Texas Instruments Incorporated
++ * Author: Greg Turner
++ *
++ * Adapted from Netra/Centaurus crypto driver
++ * Copyright © 2011 Texas Instruments Incorporated
++ * Author: Herman Schuurman
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License as published by
++ * the Free Software Foundation; either version 2 of the License, or
++ * (at your option) any later version.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
++ * GNU General Public License for more details.
++ *
++ * You should have received a copy of the GNU General Public License
++ * along with this program; if not, write to the Free Software
++ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
++ */
++#ifndef __DRIVERS_CRYPTO_AM33X_H
++#define __DRIVERS_CRYPTO_AM33X_H
++
++/* ==================================================================== */
++/** Crypto subsystem module layout
++ */
++/* ==================================================================== */
++
++#define AM33X_AES_CLKCTRL	(AM33XX_PRCM_BASE + 0x00000094)
++#define AM33X_SHA_CLKCTRL	(AM33XX_PRCM_BASE + 0x000000A0)
++
++#define FLD_MASK(start, end)		(((1 << ((start) - (end) + 1)) - 1) << (end))
++#define FLD_VAL(val, start, end)	(((val) << (end)) & FLD_MASK(start, end))
++
++/* ==================================================================== */
++/** AES module layout
++ */
++/* ==================================================================== */
++
++#define	AES_REG_KEY2(x)			(0x1C - ((x ^ 0x01) * 0x04))
++#define	AES_REG_KEY1(x)			(0x3C - ((x ^ 0x01) * 0x04))
++#define	AES_REG_IV(x)			(0x40 + ((x) * 0x04))
++
++#define	AES_REG_CTRL			0x50
++#define	AES_REG_CTRL_CTX_RDY		(1 << 31)
++#define	AES_REG_CTRL_SAVE_CTX_RDY	(1 << 30)
++#define	AES_REG_CTRL_SAVE_CTX		(1 << 29)
++#define	AES_REG_CTRL_CCM_M_MASK		(7 << 22)
++#define	AES_REG_CTRL_CCM_M_SHFT		22
++#define	AES_REG_CTRL_CCM_L_MASK		(7 << 19)
++#define	AES_REG_CTRL_CCM_L_SHFT		19
++#define	AES_REG_CTRL_CCM		(1 << 18)
++#define	AES_REG_CTRL_GCM		(3 << 16)
++#define	AES_REG_CTRL_CBCMAC		(1 << 15)
++#define	AES_REG_CTRL_F9			(1 << 14)
++#define	AES_REG_CTRL_F8			(1 << 13)
++#define	AES_REG_CTRL_XTS_MASK		(3 << 11)
++#define	 AES_REG_CTRL_XTS_01		(1 << 11)
++#define	 AES_REG_CTRL_XTS_10		(2 << 11)
++#define	 AES_REG_CTRL_XTS_11		(3 << 11)
++#define	AES_REG_CTRL_CFB		(1 << 10)
++#define	AES_REG_CTRL_ICM		(1 << 9)
++#define	AES_REG_CTRL_CTR_WIDTH_MASK	(3 << 7)
++#define	 AES_REG_CTRL_CTR_WIDTH_32	(0 << 7)
++#define	 AES_REG_CTRL_CTR_WIDTH_64	(1 << 7)
++#define	 AES_REG_CTRL_CTR_WIDTH_96	(2 << 7)
++#define	 AES_REG_CTRL_CTR_WIDTH_128	(3 << 7)
++#define	AES_REG_CTRL_CTR		(1 << 6)
++#define	AES_REG_CTRL_CBC		(1 << 5)
++#define	AES_REG_CTRL_KEY_SIZE_MASK	(3 << 3)
++#define	 AES_REG_CTRL_KEY_SIZE_128	(1 << 3)
++#define	 AES_REG_CTRL_KEY_SIZE_192	(2 << 3)
++#define	 AES_REG_CTRL_KEY_SIZE_256	(3 << 3)
++#define	AES_REG_CTRL_DIRECTION		(1 << 2)
++#define	AES_REG_CTRL_INPUT_RDY		(1 << 1)
++#define	AES_REG_CTRL_OUTPUT_RDY		(1 << 0)
++
++#define	AES_REG_LENGTH_N(x)		(0x54 + ((x) * 0x04))
++#define	AES_REG_AUTH_LENGTH		0x5C
++#define	AES_REG_DATA			0x60
++#define	AES_REG_DATA_N(x)		(0x60 + ((x) * 0x04))
++#define	AES_REG_TAG			0x70
++#define	AES_REG_TAG_N(x)		(0x70 + ((x) * 0x04))
++
++#define AES_REG_REV			0x80
++#define	 AES_REG_REV_SCHEME_MASK	(3 << 30)
++#define	 AES_REG_REV_FUNC_MASK		(0xFFF << 16)
++#define	 AES_REG_REV_R_RTL_MASK		(0x1F << 11)
++#define	 AES_REG_REV_X_MAJOR_MASK	(7 << 8)
++#define	 AES_REG_REV_CUSTOM_MASK	(3 << 6)
++#define	 AES_REG_REV_Y_MINOR_MASK	(0x3F << 0)
++
++#define	AES_REG_SYSCFG			0x84
++#define	AES_REG_SYSCFG_K3		(1 << 12)
++#define	AES_REG_SYSCFG_KEY_ENC		(1 << 11)
++#define	AES_REG_SYSCFG_KEK_MODE		(1 << 10)
++#define	AES_REG_SYSCFG_MAP_CTX_OUT	(1 << 9)
++#define	AES_REG_SYSCFG_DREQ_MASK	(15 << 5)
++#define	 AES_REG_SYSCFG_DREQ_CTX_OUT_EN	(1 << 8)
++#define	 AES_REG_SYSCFG_DREQ_CTX_IN_EN	(1 << 7)
++#define	 AES_REG_SYSCFG_DREQ_DATA_OUT_EN (1 << 6)
++#define	 AES_REG_SYSCFG_DREQ_DATA_IN_EN	(1 << 5)
++#define	AES_REG_SYSCFG_DIRECTBUSEN	(1 << 4)
++#define	AES_REG_SYSCFG_SIDLE_MASK	(3 << 2)
++#define	 AES_REG_SYSCFG_SIDLE_FORCEIDLE	(0 << 2)
++#define	 AES_REG_SYSCFG_SIDLE_NOIDLE	(1 << 2)
++#define	 AES_REG_SYSCFG_SIDLE_SMARTIDLE	(2 << 2)
++#define	AES_REG_SYSCFG_SOFTRESET	(1 << 1)
++#define	AES_REG_SYSCFG_AUTOIDLE		(1 << 0)
++
++#define	AES_REG_SYSSTATUS		0x88
++#define	AES_REG_SYSSTATUS_RESETDONE	(1 << 0)
++
++#define	AES_REG_IRQSTATUS		0x8C
++#define	AES_REG_IRQSTATUS_CTX_OUT	(1 << 3)
++#define	AES_REG_IRQSTATUS_DATA_OUT	(1 << 2)
++#define	AES_REG_IRQSTATUS_DATA_IN	(1 << 1)
++#define	AES_REG_IRQSTATUS_CTX_IN	(1 << 0)
++
++#define	AES_REG_IRQENA			0x90
++#define	AES_REG_IRQENA_CTX_OUT		(1 << 3)
++#define	AES_REG_IRQENA_DATA_OUT		(1 << 2)
++#define	AES_REG_IRQENA_DATA_IN		(1 << 1)
++#define	AES_REG_IRQENA_CTX_IN		(1 << 0)
++
++/* ==================================================================== */
++/** SHA / MD5 module layout.
++ */
++/* ==================================================================== */
++
++#define	SHA_REG_ODIGEST			0x00
++#define	SHA_REG_ODIGEST_N(x)		(0x00 + ((x) * 0x04))
++#define	SHA_REG_IDIGEST			0x20
++#define	SHA_REG_IDIGEST_N(x)		(0x20 + ((x) * 0x04))
++
++#define SHA_REG_DIGEST_COUNT		0x40
++#define SHA_REG_MODE			0x44
++#define SHA_REG_MODE_HMAC_OUTER_HASH	(1 << 7)
++#define SHA_REG_MODE_HMAC_KEY_PROC	(1 << 5)
++#define SHA_REG_MODE_CLOSE_HASH		(1 << 4)
++#define SHA_REG_MODE_ALGO_CONSTANT	(1 << 3)
++#define SHA_REG_MODE_ALGO_MASK		(3 << 1)
++#define  SHA_REG_MODE_ALGO_MD5_128	(0 << 1)
++#define  SHA_REG_MODE_ALGO_SHA1_160	(1 << 1)
++#define  SHA_REG_MODE_ALGO_SHA2_224	(2 << 1)
++#define  SHA_REG_MODE_ALGO_SHA2_256	(3 << 1)
++
++#define SHA_REG_LENGTH			0x48
++
++#define	SHA_REG_DATA			0x80
++#define	SHA_REG_DATA_N(x)		(0x80 + ((x) * 0x04))
++
++#define SHA_REG_REV			0x100
++#define	 SHA_REG_REV_SCHEME_MASK	(3 << 30)
++#define	 SHA_REG_REV_FUNC_MASK		(0xFFF << 16)
++#define	 SHA_REG_REV_R_RTL_MASK		(0x1F << 11)
++#define	 SHA_REG_REV_X_MAJOR_MASK	(7 << 8)
++#define	 SHA_REG_REV_CUSTOM_MASK	(3 << 6)
++#define	 SHA_REG_REV_Y_MINOR_MASK	(0x3F << 0)
++
++#define	SHA_REG_SYSCFG			0x110
++#define	SHA_REG_SYSCFG_SADVANCED	(1 << 7)
++#define	SHA_REG_SYSCFG_SCONT_SWT	(1 << 6)
++#define	SHA_REG_SYSCFG_SIDLE_MASK	(3 << 4)
++#define	 SHA_REG_SYSCFG_SIDLE_FORCEIDLE	(0 << 4)
++#define	 SHA_REG_SYSCFG_SIDLE_NOIDLE	(1 << 4)
++#define	 SHA_REG_SYSCFG_SIDLE_SMARTIDLE	(2 << 4)
++#define	SHA_REG_SYSCFG_SDMA_EN		(1 << 3)
++#define	SHA_REG_SYSCFG_SIT_EN		(1 << 2)
++#define	SHA_REG_SYSCFG_SOFTRESET	(1 << 1)
++#define	SHA_REG_SYSCFG_AUTOIDLE		(1 << 0)
++
++#define SHA_REG_SYSSTATUS		0x114
++#define SHA_REG_SYSSTATUS_RESETDONE	(1 << 0)
++
++#define SHA_REG_IRQSTATUS		0x118
++#define SHA_REG_IRQSTATUS_CTX_RDY	(1 << 3)
++#define SHA_REG_IRQSTATUS_PARTHASH_RDY (1 << 2)
++#define SHA_REG_IRQSTATUS_INPUT_RDY	(1 << 1)
++#define SHA_REG_IRQSTATUS_OUTPUT_RDY	(1 << 0)
++
++#define SHA_REG_IRQENA			0x11C
++#define SHA_REG_IRQENA_CTX_RDY		(1 << 3)
++#define SHA_REG_IRQENA_PARTHASH_RDY	(1 << 2)
++#define SHA_REG_IRQENA_INPUT_RDY	(1 << 1)
++#define SHA_REG_IRQENA_OUTPUT_RDY	(1 << 0)
++
++#endif /* __DRIVERS_CRYPTO_AM33X_H */
+--
+1.7.0.4
diff --git a/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0006-am33x-Create-driver-for-TRNG-crypto-module.patch b/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0006-am33x-Create-driver-for-TRNG-crypto-module.patch
new file mode 100644
index 0000000..7d0023a
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0006-am33x-Create-driver-for-TRNG-crypto-module.patch
@@ -0,0 +1,324 @@
+From d56c0ab935577ef32ffdf23a62d2e1cecc391730 Mon Sep 17 00:00:00 2001
+From: Greg Turner <gregturner@ti.com>
+Date: Thu, 17 May 2012 15:11:26 -0500
+Subject: [PATCH 6/8] am33x: Create driver for TRNG crypto module
+
+This is the initial version of the driver for the TRNG crypto module for a GP version of OMAP4 derivative SOC's such as AM335x.
+
+Signed-off-by: Greg Turner <gregturner@ti.com>
+---
+ drivers/char/hw_random/omap4-rng.c |  303 ++++++++++++++++++++++++++++++++++++
+ 1 files changed, 303 insertions(+), 0 deletions(-)
+ create mode 100755 drivers/char/hw_random/omap4-rng.c
+
+diff --git a/drivers/char/hw_random/omap4-rng.c b/drivers/char/hw_random/omap4-rng.c
+new file mode 100755
+index 0000000..523ec63
+--- /dev/null
++++ b/drivers/char/hw_random/omap4-rng.c
+@@ -0,0 +1,303 @@
++/*
++ * drivers/char/hw_random/omap4-rng.c
++ *
++ * Copyright (c) 2012 Texas Instruments
++ * TRNG driver for OMAP4 derivatives (AM33x, etc) -  Herman Schuurman <herman@ti.com>
++ *
++ * derived from omap-rng.c.
++ *
++ * Author: Deepak Saxena <dsaxena@plexity.net>
++ *
++ * Copyright 2005 (c) MontaVista Software, Inc.
++ *
++ * Mostly based on original driver:
++ *
++ * Copyright (C) 2005 Nokia Corporation
++ * Author: Juha Yrjölä <juha.yrjola@nokia.com>
++ *
++ * This file is licensed under  the terms of the GNU General Public
++ * License version 2. This program is licensed "as is" without any
++ * warranty of any kind, whether express or implied.
++ */
++
++#include <linux/module.h>
++#include <linux/init.h>
++#include <linux/random.h>
++#include <linux/clk.h>
++#include <linux/err.h>
++#include <linux/platform_device.h>
++#include <linux/hw_random.h>
++#include <linux/delay.h>
++
++#include <mach/hardware.h>
++#include <asm/io.h>
++
++/* ==================================================================== */
++/** RNG module layout.
++ */
++/* ==================================================================== */
++#define	RNG_REG_OUTPUT_L		0x00
++#define	RNG_REG_OUTPUT_H		0x04
++
++#define	RNG_REG_STATUS			0x08
++#define	RNG_REG_STATUS_NEED_CLK		(1 << 31)
++#define	RNG_REG_STATUS_SHUTDOWN_OFLO	(1 << 1)
++#define	RNG_REG_STATUS_RDY		(1 << 0)
++
++#define	RNG_REG_IMASK			0x0C
++#define	RNG_REG_IMASK_SHUTDOWN_OFLO	(1 << 1)
++#define	RNG_REG_IMASK_RDY		(1 << 0)
++
++#define	RNG_REG_INTACK			0x10
++#define	RNG_REG_INTACK_SHUTDOWN_OFLO	(1 << 1)
++#define	RNG_REG_INTACK_RDY		(1 << 0)
++
++#define	RNG_REG_CONTROL			0x14
++#define	RNG_REG_CONTROL_STARTUP_MASK	0xFFFF0000
++#define	RNG_REG_CONTROL_ENABLE_TRNG	(1 << 10)
++#define	RNG_REG_CONTROL_NO_LFSR_FB	(1 << 2)
++
++#define	RNG_REG_CONFIG			0x18
++#define	RNG_REG_CONFIG_MAX_REFILL_MASK	0xFFFF0000
++#define	RNG_REG_CONFIG_SAMPLE_DIV	0x00000F00
++#define	RNG_REG_CONFIG_MIN_REFILL_MASK	0x000000FF
++
++#define	RNG_REG_ALARMCNT		0x1C
++#define	RNG_REG_ALARMCNT_SHTDWN_MASK	0x3F000000
++#define	RNG_REG_ALARMCNT_SD_THLD_MASK	0x001F0000
++#define	RNG_REG_ALARMCNT_ALM_THLD_MASK	0x000000FF
++
++#define	RNG_REG_FROENABLE		0x20
++#define	RNG_REG_FRODETUNE		0x24
++#define	RNG_REG_ALARMMASK		0x28
++#define	RNG_REG_ALARMSTOP		0x2C
++#define	RNG_REG_LFSR_L			0x30
++#define	RNG_REG_LFSR_M			0x34
++#define	RNG_REG_LFSR_H			0x38
++#define	RNG_REG_COUNT			0x3C
++#define	RNG_REG_TEST			0x40
++
++#define	RNG_REG_OPTIONS			0x78
++#define	RNG_REG_OPTIONS_NUM_FROS_MASK	0x00000FC0
++
++#define	RNG_REG_EIP_REV			0x7C
++#define	RNG_REG_STATUS_EN		0x1FD8
++#define	RNG_REG_STATUS_EN_SHUTDOWN_OFLO	(1 << 1)
++#define	RNG_REG_STATUS_EN_RDY		(1 << 0)
++
++#define	RNG_REG_REV			0x1FE0
++#define	 RNG_REG_REV_X_MAJOR_MASK	(0x0F << 4)
++#define	 RNG_REG_REV_Y_MINOR_MASK	(0x0F << 0)
++
++#define	RNG_REG_SYSCFG			0x1FE4
++#define	RNG_REG_SYSCFG_SIDLEMODE_MASK	(3 << 3)
++#define	 RNG_REG_SYSCFG_SIDLEMODE_FORCE	(0 << 3)
++#define	 RNG_REG_SYSCFG_SIDLEMODE_NO	(1 << 3)
++#define	 RNG_REG_SYSCFG_SIDLEMODE_SMART	(2 << 3)
++#define	RNG_REG_SYSCFG_AUTOIDLE		(1 << 0)
++
++#define	RNG_REG_STATUS_SET		0x1FEC
++#define	RNG_REG_STATUS_SET_SHUTDOWN_OFLO (1 << 1)
++#define	RNG_REG_STATUS_SET_RDY		(1 << 0)
++
++#define	RNG_REG_SOFT_RESET		0x1FF0
++#define	RNG_REG_SOFTRESET		(1 << 0)
++
++#define	RNG_REG_IRQ_EOI			0x1FF4
++#define	RNG_REG_IRQ_EOI_PULSE_INT_CLEAR	(1 << 0)
++
++#define	RNG_REG_IRQSTATUS		0x1FF8
++#define	RNG_REG_IRQSTATUS_IRQ_EN	(1 << 0)
++
++
++static void __iomem *rng_base;
++static struct clk *rng_fck;
++static struct platform_device *rng_dev;
++
++#define trng_read(reg)						\
++({								\
++	u32 __val;						\
++	__val = __raw_readl(rng_base + RNG_REG_##reg);		\
++})
++
++#define trng_write(val, reg)					\
++({								\
++	__raw_writel((val), rng_base + RNG_REG_##reg);		\
++})
++
++static int omap4_rng_data_read(struct hwrng *rng, void *buf, size_t max, bool wait)
++{
++	int res, i;
++
++	for (i = 0; i < 20; i++) {
++		res = trng_read(STATUS) & RNG_REG_STATUS_RDY;
++		if (res || !wait)
++			break;
++		/* RNG produces data fast enough (2+ MBit/sec, even
++		 * during "rngtest" loads, that these delays don't
++		 * seem to trigger.  We *could* use the RNG IRQ, but
++		 * that'd be higher overhead ... so why bother?
++		 */
++		udelay(10);
++	}
++
++	/* If we have data waiting, collect it... */
++	if (res) {
++		*(u32 *)buf = trng_read(OUTPUT_L);
++		buf += sizeof(u32);
++		*(u32 *)buf = trng_read(OUTPUT_H);
++
++		trng_write(RNG_REG_INTACK_RDY, INTACK);
++
++		res = 2  * sizeof(u32);
++	}
++	return res;
++}
++
++static struct hwrng omap4_rng_ops = {
++	.name		= "omap4",
++	.read		= omap4_rng_data_read,
++};
++
++static int __devinit omap4_rng_probe(struct platform_device *pdev)
++{
++	struct resource *res;
++	int ret;
++	u32 reg;
++
++	/*
++	 * A bit ugly, and it will never actually happen but there can
++	 * be only one RNG and this catches any bork
++	 */
++	if (rng_dev)
++		return -EBUSY;
++
++	rng_fck = clk_get(&pdev->dev, "rng_fck");
++	if (IS_ERR(rng_fck)) {
++		dev_err(&pdev->dev, "Could not get rng_fck\n");
++		ret = PTR_ERR(rng_fck);
++		return ret;
++	} else
++		clk_enable(rng_fck);
++
++	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
++	if (!res) {
++		ret = -ENOENT;
++		goto err_region;
++	}
++
++	if (!request_mem_region(res->start, resource_size(res), pdev->name)) {
++		ret = -EBUSY;
++		goto err_region;
++	}
++
++	dev_set_drvdata(&pdev->dev, res);
++	rng_base = ioremap(res->start, resource_size(res));
++	if (!rng_base) {
++		ret = -ENOMEM;
++		goto err_ioremap;
++	}
++
++	ret = hwrng_register(&omap4_rng_ops);
++	if (ret)
++		goto err_register;
++
++	reg = trng_read(REV);
++	dev_info(&pdev->dev, "OMAP4 Random Number Generator ver. %u.%02u\n",
++		 ((reg & RNG_REG_REV_X_MAJOR_MASK) >> 4),
++		 (reg & RNG_REG_REV_Y_MINOR_MASK));
++
++	rng_dev = pdev;
++
++	/* start TRNG if not running yet */
++	if (!(trng_read(CONTROL) & RNG_REG_CONTROL_ENABLE_TRNG)) {
++		trng_write(0x00220021, CONFIG);
++		trng_write(0x00210400, CONTROL);
++	}
++
++	return 0;
++
++err_register:
++	iounmap(rng_base);
++	rng_base = NULL;
++err_ioremap:
++	release_mem_region(res->start, resource_size(res));
++err_region:
++	clk_disable(rng_fck);
++	clk_put(rng_fck);
++	return ret;
++}
++
++static int __exit omap4_rng_remove(struct platform_device *pdev)
++{
++	struct resource *res = dev_get_drvdata(&pdev->dev);
++
++	hwrng_unregister(&omap4_rng_ops);
++
++	trng_write(trng_read(CONTROL) & ~RNG_REG_CONTROL_ENABLE_TRNG, CONTROL);
++
++	iounmap(rng_base);
++
++	clk_disable(rng_fck);
++	clk_put(rng_fck);
++	release_mem_region(res->start, resource_size(res));
++	rng_base = NULL;
++
++	return 0;
++}
++
++#ifdef CONFIG_PM
++
++static int omap4_rng_suspend(struct platform_device *pdev, pm_message_t message)
++{
++	trng_write(trng_read(CONTROL) & ~RNG_REG_CONTROL_ENABLE_TRNG, CONTROL);
++
++	return 0;
++}
++
++static int omap4_rng_resume(struct platform_device *pdev)
++{
++	trng_write(trng_read(CONTROL) | RNG_REG_CONTROL_ENABLE_TRNG, CONTROL);
++
++	return 0;
++}
++
++#else
++
++#define	omap4_rng_suspend	NULL
++#define	omap4_rng_resume	NULL
++
++#endif
++
++/* work with hotplug and coldplug */
++MODULE_ALIAS("platform:omap4_rng");
++
++static struct platform_driver omap4_rng_driver = {
++	.driver = {
++		.name		= "omap4_rng",
++		.owner		= THIS_MODULE,
++	},
++	.probe		= omap4_rng_probe,
++	.remove		= __exit_p(omap4_rng_remove),
++	.suspend	= omap4_rng_suspend,
++	.resume		= omap4_rng_resume
++};
++
++static int __init omap4_rng_init(void)
++{
++	if (!cpu_is_am33xx()  || omap_type() != OMAP2_DEVICE_TYPE_GP)
++		return -ENODEV;
++
++	return platform_driver_register(&omap4_rng_driver);
++}
++
++static void __exit omap4_rng_exit(void)
++{
++	platform_driver_unregister(&omap4_rng_driver);
++}
++
++module_init(omap4_rng_init);
++module_exit(omap4_rng_exit);
++
++MODULE_LICENSE("GPL");
++MODULE_DESCRIPTION("AM33X TRNG driver");
+--
+1.7.0.4
diff --git a/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0007-am33x-Create-driver-for-AES-crypto-module.patch b/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0007-am33x-Create-driver-for-AES-crypto-module.patch
new file mode 100644
index 0000000..85173a5
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0007-am33x-Create-driver-for-AES-crypto-module.patch
@@ -0,0 +1,971 @@
+From 501def5dd499457a38e6284f9780ba169284e530 Mon Sep 17 00:00:00 2001
+From: Greg Turner <gregturner@ti.com>
+Date: Thu, 17 May 2012 15:17:13 -0500
+Subject: [PATCH 7/8] am33x: Create driver for AES crypto module
+
+This is the initial version of the driver for the AES crypto module for a GP version of OMAP4 derivative SOC's such as AM335x.
+
+Signed-off-by: Greg Turner <gregturner@ti.com>
+---
+ drivers/crypto/omap4-aes.c |  950 ++++++++++++++++++++++++++++++++++++++++++++
+ 1 files changed, 950 insertions(+), 0 deletions(-)
+ create mode 100755 drivers/crypto/omap4-aes.c
+
+diff --git a/drivers/crypto/omap4-aes.c b/drivers/crypto/omap4-aes.c
+new file mode 100755
+index 0000000..f0b3fe2
+--- /dev/null
++++ b/drivers/crypto/omap4-aes.c
+@@ -0,0 +1,950 @@
++/*
++ * Cryptographic API.
++ *
++ * Support for OMAP AES HW acceleration.
++ *
++ * Copyright (c) 2010 Nokia Corporation
++ * Author: Dmitry Kasatkin <dmitry.kasatkin@nokia.com>
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as published
++ * by the Free Software Foundation.
++ *
++ */
++/*
++ * Copyright © 2011 Texas Instruments Incorporated
++ * Author: Herman Schuurman
++ * Change: July 2011 - Adapted the omap-aes.c driver to support Netra
++ *	implementation of AES hardware accelerator.
++ */
++/*
++ * Copyright © 2011 Texas Instruments Incorporated
++ * Author: Greg Turner
++ * Change: November 2011 - Adapted for AM33x support HW accelerator.
++ */
++
++//#define	DEBUG
++
++#define pr_fmt(fmt) "%s: " fmt, __func__
++
++#include <linux/err.h>
++#include <linux/module.h>
++#include <linux/init.h>
++#include <linux/errno.h>
++#include <linux/kernel.h>
++#include <linux/clk.h>
++#include <linux/platform_device.h>
++#include <linux/scatterlist.h>
++#include <linux/dma-mapping.h>
++#include <linux/io.h>
++#include <linux/crypto.h>
++#include <linux/interrupt.h>
++#include <crypto/scatterwalk.h>
++#include <crypto/aes.h>
++
++#include <plat/cpu.h>
++#include <plat/dma.h>
++#include <mach/edma.h>
++#include <mach/hardware.h>
++#include "omap4.h"
++
++#define DEFAULT_TIMEOUT		(5*HZ)
++
++#define FLAGS_MODE_MASK		0x000f
++#define FLAGS_ENCRYPT		BIT(0)
++#define FLAGS_CBC		BIT(1)
++#define	FLAGS_CTR		BIT(2)
++#define FLAGS_GIV		BIT(3)
++
++#define FLAGS_INIT		BIT(4)
++#define FLAGS_FAST		BIT(5)
++#define FLAGS_BUSY		BIT(6)
++
++struct omap4_aes_ctx {
++	struct omap4_aes_dev *dd;
++
++	int		keylen;
++	u32		key[AES_KEYSIZE_256 / sizeof(u32)];
++	unsigned long	flags;
++};
++
++struct omap4_aes_reqctx {
++	unsigned long mode;
++};
++
++#define AM33X_AES_QUEUE_LENGTH	1
++#define AM33X_AES_CACHE_SIZE	0
++
++struct omap4_aes_dev {
++	struct list_head		list;
++	unsigned long			phys_base;
++	void __iomem			*io_base;
++	struct clk			*iclk;
++	struct omap4_aes_ctx		*ctx;
++	struct device			*dev;
++	unsigned long			flags;
++	int				err;
++
++	spinlock_t			lock;
++	struct crypto_queue		queue;
++
++	struct tasklet_struct		done_task;
++	struct tasklet_struct		queue_task;
++
++	struct ablkcipher_request	*req;
++	size_t				total;
++	struct scatterlist		*in_sg;
++	size_t				in_offset;
++	struct scatterlist		*out_sg;
++	size_t				out_offset;
++
++	size_t				buflen;
++	void				*buf_in;
++	size_t				dma_size;
++	int				dma_in;
++	int				dma_lch_in;
++	dma_addr_t			dma_addr_in;
++	void				*buf_out;
++	int				dma_out;
++	int				dma_lch_out;
++	dma_addr_t			dma_addr_out;
++};
++
++/* keep registered devices data here */
++static LIST_HEAD(dev_list);
++static DEFINE_SPINLOCK(list_lock);
++
++static inline u32 omap4_aes_read(struct omap4_aes_dev *dd, u32 offset)
++{
++	return __raw_readl(dd->io_base + offset);
++}
++
++static inline void omap4_aes_write(struct omap4_aes_dev *dd, u32 offset,
++				  u32 value)
++{
++	__raw_writel(value, dd->io_base + offset);
++}
++
++static inline void omap4_aes_write_mask(struct omap4_aes_dev *dd, u32 offset,
++				       u32 value, u32 mask)
++{
++	u32 val;
++
++	val = omap4_aes_read(dd, offset);
++	val &= ~mask;
++	val |= value;
++	omap4_aes_write(dd, offset, val);
++}
++
++static void omap4_aes_write_n(struct omap4_aes_dev *dd, u32 offset,
++			     u32 *value, int count)
++{
++	for (; count--; value++, offset += 4)
++		omap4_aes_write(dd, offset, *value);
++}
++
++static int omap4_aes_hw_init(struct omap4_aes_dev *dd)
++{
++	/*
++	 * clocks are enabled when request starts and disabled when finished.
++	 * It may be long delays between requests.
++	 * Device might go to off mode to save power.
++	 */
++	clk_enable(dd->iclk);
++	omap4_aes_write(dd, AES_REG_SYSCFG, 0);
++
++	if (!(dd->flags & FLAGS_INIT)) {
++		dd->flags |= FLAGS_INIT;
++		dd->err = 0;
++	}
++
++	return 0;
++}
++
++static int omap4_aes_write_ctrl(struct omap4_aes_dev *dd)
++{
++	unsigned int key32;
++	int i, err;
++	u32 val, mask;
++
++	err = omap4_aes_hw_init(dd);
++	if (err)
++		return err;
++
++	pr_debug("Set key\n");
++	key32 = dd->ctx->keylen / sizeof(u32);
++
++	/* set a key */
++	for (i = 0; i < key32; i++) {
++		omap4_aes_write(dd, AES_REG_KEY1(i),
++			       __le32_to_cpu(dd->ctx->key[i]));
++	}
++
++	if ((dd->flags & (FLAGS_CBC | FLAGS_CTR)) && dd->req->info)
++		omap4_aes_write_n(dd, AES_REG_IV(0), dd->req->info, 4);
++
++	val = FLD_VAL(((dd->ctx->keylen >> 3) - 1), 4, 3);
++	if (dd->flags & FLAGS_CBC)
++		val |= AES_REG_CTRL_CBC;
++	else if (dd->flags & FLAGS_CTR)
++		val |= AES_REG_CTRL_CTR | AES_REG_CTRL_CTR_WIDTH_32;
++	if (dd->flags & FLAGS_ENCRYPT)
++		val |= AES_REG_CTRL_DIRECTION;
++
++	mask = AES_REG_CTRL_CBC | AES_REG_CTRL_CTR | AES_REG_CTRL_DIRECTION |
++		AES_REG_CTRL_KEY_SIZE_MASK | AES_REG_CTRL_CTR_WIDTH_MASK;
++
++	omap4_aes_write_mask(dd, AES_REG_CTRL, val, mask);
++
++	return 0;
++}
++
++static struct omap4_aes_dev *omap4_aes_find_dev(struct omap4_aes_ctx *ctx)
++{
++	struct omap4_aes_dev *dd = NULL, *tmp;
++
++	spin_lock_bh(&list_lock);
++	if (!ctx->dd) {
++		list_for_each_entry(tmp, &dev_list, list) {
++			/* FIXME: take fist available aes core */
++			dd = tmp;
++			break;
++		}
++		ctx->dd = dd;
++	} else {
++		/* already found before */
++		dd = ctx->dd;
++	}
++	spin_unlock_bh(&list_lock);
++
++	return dd;
++}
++
++static void omap4_aes_dma_callback(unsigned int lch, u16 ch_status, void *data)
++{
++	struct omap4_aes_dev *dd = data;
++
++	edma_stop(lch);
++
++	if (ch_status != DMA_COMPLETE) {
++		pr_err("omap4-aes DMA error status: 0x%hx\n", ch_status);
++		dd->err = -EIO;
++		dd->flags &= ~FLAGS_INIT; /* request to re-initialize */
++	} else if (lch == dd->dma_lch_in) {
++		return;
++	}
++
++	/* dma_lch_out - completed */
++	tasklet_schedule(&dd->done_task);
++}
++
++static int omap4_aes_dma_init(struct omap4_aes_dev *dd)
++{
++	int err = -ENOMEM;
++
++	dd->dma_lch_out = -1;
++	dd->dma_lch_in = -1;
++
++	dd->buf_in = (void *)__get_free_pages(GFP_KERNEL, AM33X_AES_CACHE_SIZE);
++	dd->buf_out = (void *)__get_free_pages(GFP_KERNEL, AM33X_AES_CACHE_SIZE);
++	dd->buflen = PAGE_SIZE << AM33X_AES_CACHE_SIZE;
++	dd->buflen &= ~(AES_BLOCK_SIZE - 1);
++
++	if (!dd->buf_in || !dd->buf_out) {
++		dev_err(dd->dev, "unable to alloc pages.\n");
++		goto err_alloc;
++	}
++
++	/* MAP here */
++	dd->dma_addr_in = dma_map_single(dd->dev, dd->buf_in, dd->buflen,
++					 DMA_TO_DEVICE);
++	if (dma_mapping_error(dd->dev, dd->dma_addr_in)) {
++		dev_err(dd->dev, "dma %d bytes error\n", dd->buflen);
++		err = -EINVAL;
++		goto err_map_in;
++	}
++
++	dd->dma_addr_out = dma_map_single(dd->dev, dd->buf_out, dd->buflen,
++					  DMA_FROM_DEVICE);
++	if (dma_mapping_error(dd->dev, dd->dma_addr_out)) {
++		dev_err(dd->dev, "dma %d bytes error\n", dd->buflen);
++		err = -EINVAL;
++		goto err_map_out;
++	}
++
++	dd->dma_lch_in = edma_alloc_channel(dd->dma_in, omap4_aes_dma_callback,
++					    dd, EVENTQ_DEFAULT);
++
++	if (dd->dma_lch_in < 0) {
++		dev_err(dd->dev, "Unable to request DMA channel\n");
++		goto err_dma_in;
++	}
++
++	dd->dma_lch_out = edma_alloc_channel(dd->dma_out, omap4_aes_dma_callback, dd, EVENTQ_2);
++
++	if (dd->dma_lch_out < 0) {
++		dev_err(dd->dev, "Unable to request DMA channel\n");
++		goto err_dma_out;
++	}
++
++	return 0;
++
++err_dma_out:
++	edma_free_channel(dd->dma_lch_in);
++err_dma_in:
++	dma_unmap_single(dd->dev, dd->dma_addr_out, dd->buflen,
++			 DMA_FROM_DEVICE);
++err_map_out:
++	dma_unmap_single(dd->dev, dd->dma_addr_in, dd->buflen, DMA_TO_DEVICE);
++err_map_in:
++	free_pages((unsigned long)dd->buf_out, AM33X_AES_CACHE_SIZE);
++	free_pages((unsigned long)dd->buf_in, AM33X_AES_CACHE_SIZE);
++err_alloc:
++	if (err)
++		pr_err("error: %d\n", err);
++	return err;
++}
++
++static void omap4_aes_dma_cleanup(struct omap4_aes_dev *dd)
++{
++	edma_free_channel(dd->dma_lch_out);
++	edma_free_channel(dd->dma_lch_in);
++	dma_unmap_single(dd->dev, dd->dma_addr_out, dd->buflen,
++			 DMA_FROM_DEVICE);
++	dma_unmap_single(dd->dev, dd->dma_addr_in, dd->buflen, DMA_TO_DEVICE);
++	free_pages((unsigned long)dd->buf_out, AM33X_AES_CACHE_SIZE);
++	free_pages((unsigned long)dd->buf_in, AM33X_AES_CACHE_SIZE);
++}
++
++static void sg_copy_buf(void *buf, struct scatterlist *sg,
++			unsigned int start, unsigned int nbytes, int out)
++{
++	struct scatter_walk walk;
++
++	if (!nbytes)
++		return;
++
++	scatterwalk_start(&walk, sg);
++	scatterwalk_advance(&walk, start);
++	scatterwalk_copychunks(buf, &walk, nbytes, out);
++	scatterwalk_done(&walk, out, 0);
++}
++
++static int sg_copy(struct scatterlist **sg, size_t *offset, void *buf,
++		   size_t buflen, size_t total, int out)
++{
++	unsigned int count, off = 0;
++
++	while (buflen && total) {
++		count = min((*sg)->length - *offset, total);
++		count = min(count, buflen);
++
++		if (!count)
++			return off;
++
++		/*
++		 * buflen and total are AES_BLOCK_SIZE size aligned,
++		 * so count should be also aligned
++		 */
++
++		sg_copy_buf(buf + off, *sg, *offset, count, out);
++
++		off += count;
++		buflen -= count;
++		*offset += count;
++		total -= count;
++
++		if (*offset == (*sg)->length) {
++			*sg = sg_next(*sg);
++			if (*sg)
++				*offset = 0;
++			else
++				total = 0;
++		}
++	}
++
++	return off;
++}
++
++static int omap4_aes_crypt_dma(struct crypto_tfm *tfm, dma_addr_t dma_addr_in,
++			      dma_addr_t dma_addr_out, int length)
++{
++	struct omap4_aes_ctx *ctx = crypto_tfm_ctx(tfm);
++	struct omap4_aes_dev *dd = ctx->dd;
++	int nblocks;
++	struct edmacc_param p_ram;
++
++	pr_debug("len: %d\n", length);
++
++	dd->dma_size = length;
++
++	if (!(dd->flags & FLAGS_FAST))
++		dma_sync_single_for_device(dd->dev, dma_addr_in, length,
++					   DMA_TO_DEVICE);
++
++	nblocks = DIV_ROUND_UP(length, AES_BLOCK_SIZE);
++
++	/* EDMA IN */
++	p_ram.opt	   = TCINTEN |
++		EDMA_TCC(EDMA_CHAN_SLOT(dd->dma_lch_in));
++	p_ram.src	   = dma_addr_in;
++	p_ram.a_b_cnt      = AES_BLOCK_SIZE | nblocks << 16;
++	p_ram.dst          = dd->phys_base + AES_REG_DATA;
++	p_ram.src_dst_bidx = AES_BLOCK_SIZE;
++	p_ram.link_bcntrld = 1 << 16 | 0xFFFF;
++	p_ram.src_dst_cidx = 0;
++	p_ram.ccnt         = 1;
++	edma_write_slot(dd->dma_lch_in, &p_ram);
++
++	/* EDMA OUT */
++	p_ram.opt	   = TCINTEN |
++		EDMA_TCC(EDMA_CHAN_SLOT(dd->dma_lch_out));
++	p_ram.src	   = dd->phys_base + AES_REG_DATA;
++	p_ram.dst          = dma_addr_out;
++	p_ram.src_dst_bidx = AES_BLOCK_SIZE << 16;
++	edma_write_slot(dd->dma_lch_out, &p_ram);
++
++	edma_start(dd->dma_lch_in);
++	edma_start(dd->dma_lch_out);
++
++	/* write data length info out */
++	omap4_aes_write(dd, AES_REG_LENGTH_N(0), length);
++	omap4_aes_write(dd, AES_REG_LENGTH_N(1), 0);
++	/* start DMA or disable idle mode */
++	omap4_aes_write_mask(dd, AES_REG_SYSCFG,
++			   AES_REG_SYSCFG_DREQ_DATA_OUT_EN | AES_REG_SYSCFG_DREQ_DATA_IN_EN,
++			   AES_REG_SYSCFG_DREQ_MASK);
++
++	return 0;
++}
++
++static int omap4_aes_crypt_dma_start(struct omap4_aes_dev *dd)
++{
++	struct crypto_tfm *tfm = crypto_ablkcipher_tfm(
++					crypto_ablkcipher_reqtfm(dd->req));
++	int err, fast = 0, in, out;
++	size_t count;
++	dma_addr_t addr_in, addr_out;
++
++	pr_debug("total: %d\n", dd->total);
++
++	if (sg_is_last(dd->in_sg) && sg_is_last(dd->out_sg)) {
++		/* check for alignment */
++		in = IS_ALIGNED((u32)dd->in_sg->offset, sizeof(u32));
++		out = IS_ALIGNED((u32)dd->out_sg->offset, sizeof(u32));
++
++		fast = in && out;
++	}
++
++	if (fast)  {
++		count = min(dd->total, sg_dma_len(dd->in_sg));
++		count = min(count, sg_dma_len(dd->out_sg));
++
++		if (count != dd->total) {
++			pr_err("request length != buffer length\n");
++			return -EINVAL;
++		}
++
++		pr_debug("fast\n");
++
++		err = dma_map_sg(dd->dev, dd->in_sg, 1, DMA_TO_DEVICE);
++		if (!err) {
++			dev_err(dd->dev, "dma_map_sg() error\n");
++			return -EINVAL;
++		}
++
++		err = dma_map_sg(dd->dev, dd->out_sg, 1, DMA_FROM_DEVICE);
++		if (!err) {
++			dev_err(dd->dev, "dma_map_sg() error\n");
++			dma_unmap_sg(dd->dev, dd->in_sg, 1, DMA_TO_DEVICE);
++			return -EINVAL;
++		}
++
++		addr_in = sg_dma_address(dd->in_sg);
++		addr_out = sg_dma_address(dd->out_sg);
++
++		dd->flags |= FLAGS_FAST;
++
++	} else {
++		/* use cache buffers */
++		count = sg_copy(&dd->in_sg, &dd->in_offset, dd->buf_in,
++				dd->buflen, dd->total, 0);
++
++		addr_in = dd->dma_addr_in;
++		addr_out = dd->dma_addr_out;
++
++		dd->flags &= ~FLAGS_FAST;
++
++	}
++
++	dd->total -= count;
++
++	err = omap4_aes_crypt_dma(tfm, addr_in, addr_out, count);
++	if (err) {
++		dma_unmap_sg(dd->dev, dd->in_sg, 1, DMA_TO_DEVICE);
++		dma_unmap_sg(dd->dev, dd->out_sg, 1, DMA_TO_DEVICE);
++	}
++
++	return err;
++}
++
++static void omap4_aes_finish_req(struct omap4_aes_dev *dd, int err)
++{
++	struct ablkcipher_request *req = dd->req;
++
++	pr_debug("err: %d\n", err);
++
++	clk_disable(dd->iclk);
++	dd->flags &= ~FLAGS_BUSY;
++
++	req->base.complete(&req->base, err);
++}
++
++static int omap4_aes_crypt_dma_stop(struct omap4_aes_dev *dd)
++{
++	int err = 0;
++	size_t count;
++
++	pr_debug("total: %d\n", dd->total);
++
++	omap4_aes_write_mask(dd, AES_REG_SYSCFG, 0, AES_REG_SYSCFG_DREQ_MASK);
++
++	edma_stop(dd->dma_lch_in);
++	edma_clean_channel(dd->dma_lch_in);
++	edma_stop(dd->dma_lch_out);
++	edma_clean_channel(dd->dma_lch_out);
++
++	if (dd->flags & FLAGS_FAST) {
++		dma_unmap_sg(dd->dev, dd->out_sg, 1, DMA_FROM_DEVICE);
++		dma_unmap_sg(dd->dev, dd->in_sg, 1, DMA_TO_DEVICE);
++	} else {
++		dma_sync_single_for_device(dd->dev, dd->dma_addr_out,
++					   dd->dma_size, DMA_FROM_DEVICE);
++
++		/* copy data */
++		count = sg_copy(&dd->out_sg, &dd->out_offset, dd->buf_out,
++				dd->buflen, dd->dma_size, 1);
++		if (count != dd->dma_size) {
++			err = -EINVAL;
++			pr_err("not all data converted: %u\n", count);
++		}
++	}
++
++	return err;
++}
++
++static int omap4_aes_handle_queue(struct omap4_aes_dev *dd,
++				 struct ablkcipher_request *req)
++{
++	struct crypto_async_request *async_req, *backlog;
++	struct omap4_aes_ctx *ctx;
++	struct omap4_aes_reqctx *rctx;
++	unsigned long flags;
++	int err, ret = 0;
++
++	spin_lock_irqsave(&dd->lock, flags);
++	if (req)
++		ret = ablkcipher_enqueue_request(&dd->queue, req);
++
++	if (dd->flags & FLAGS_BUSY) {
++		spin_unlock_irqrestore(&dd->lock, flags);
++		return ret;
++	}
++	backlog = crypto_get_backlog(&dd->queue);
++	async_req = crypto_dequeue_request(&dd->queue);
++	if (async_req)
++		dd->flags |= FLAGS_BUSY;
++	spin_unlock_irqrestore(&dd->lock, flags);
++
++	if (!async_req)
++		return ret;
++
++	if (backlog)
++		backlog->complete(backlog, -EINPROGRESS);
++
++	req = ablkcipher_request_cast(async_req);
++
++	/* assign new request to device */
++	dd->req = req;
++	dd->total = req->nbytes;
++	dd->in_offset = 0;
++	dd->in_sg = req->src;
++	dd->out_offset = 0;
++	dd->out_sg = req->dst;
++
++	rctx = ablkcipher_request_ctx(req);
++	ctx = crypto_ablkcipher_ctx(crypto_ablkcipher_reqtfm(req));
++	rctx->mode &= FLAGS_MODE_MASK;
++	dd->flags = (dd->flags & ~FLAGS_MODE_MASK) | rctx->mode;
++
++	dd->ctx = ctx;
++	ctx->dd = dd;
++
++	err = omap4_aes_write_ctrl(dd);
++	if (!err)
++		err = omap4_aes_crypt_dma_start(dd);
++	if (err) {
++		/* aes_task will not finish it, so do it here */
++		omap4_aes_finish_req(dd, err);
++		tasklet_schedule(&dd->queue_task);
++	}
++
++	return ret; /* return ret, which is enqueue return value */
++}
++
++static void omap4_aes_done_task(unsigned long data)
++{
++	struct omap4_aes_dev *dd = (struct omap4_aes_dev *)data;
++	int err;
++
++	pr_debug("enter\n");
++
++	err = omap4_aes_crypt_dma_stop(dd);
++
++	err = dd->err ? : err;
++
++	if (dd->total && !err) {
++		err = omap4_aes_crypt_dma_start(dd);
++		if (!err)
++			return; /* DMA started. Not finishing. */
++	}
++
++	omap4_aes_finish_req(dd, err);
++	omap4_aes_handle_queue(dd, NULL);
++
++	pr_debug("exit\n");
++}
++
++static void omap4_aes_queue_task(unsigned long data)
++{
++	struct omap4_aes_dev *dd = (struct omap4_aes_dev *)data;
++
++	omap4_aes_handle_queue(dd, NULL);
++}
++
++static int omap4_aes_crypt(struct ablkcipher_request *req, unsigned long mode)
++{
++	struct omap4_aes_ctx *ctx = crypto_ablkcipher_ctx(
++		crypto_ablkcipher_reqtfm(req));
++	struct omap4_aes_reqctx *rctx = ablkcipher_request_ctx(req);
++	struct omap4_aes_dev *dd;
++
++	pr_debug("nbytes: %d, enc: %d, cbc: %d, ctr: %d\n", req->nbytes,
++		 !!(mode & FLAGS_ENCRYPT),
++		 !!(mode & FLAGS_CBC),
++		 !!(mode & FLAGS_CTR));
++
++	if (!IS_ALIGNED(req->nbytes, AES_BLOCK_SIZE)) {
++		pr_err("request size is not exact amount of AES blocks\n");
++		return -EINVAL;
++	}
++
++	dd = omap4_aes_find_dev(ctx);
++	if (!dd)
++		return -ENODEV;
++
++	rctx->mode = mode;
++
++	return omap4_aes_handle_queue(dd, req);
++}
++
++/* ********************** ALG API ************************************ */
++
++static int omap4_aes_setkey(struct crypto_ablkcipher *tfm, const u8 *key,
++			   unsigned int keylen)
++{
++	struct omap4_aes_ctx *ctx = crypto_ablkcipher_ctx(tfm);
++
++	if (keylen != AES_KEYSIZE_128 && keylen != AES_KEYSIZE_192 &&
++	    keylen != AES_KEYSIZE_256)
++		return -EINVAL;
++
++	pr_debug("enter, keylen: %d\n", keylen);
++
++	memcpy(ctx->key, key, keylen);
++	ctx->keylen = keylen;
++
++	return 0;
++}
++
++static int omap4_aes_ecb_encrypt(struct ablkcipher_request *req)
++{
++	return omap4_aes_crypt(req, FLAGS_ENCRYPT);
++}
++
++static int omap4_aes_ecb_decrypt(struct ablkcipher_request *req)
++{
++	return omap4_aes_crypt(req, 0);
++}
++
++static int omap4_aes_cbc_encrypt(struct ablkcipher_request *req)
++{
++	return omap4_aes_crypt(req, FLAGS_ENCRYPT | FLAGS_CBC);
++}
++
++static int omap4_aes_cbc_decrypt(struct ablkcipher_request *req)
++{
++	return omap4_aes_crypt(req, FLAGS_CBC);
++}
++
++static int omap4_aes_ctr_encrypt(struct ablkcipher_request *req)
++{
++	return omap4_aes_crypt(req, FLAGS_ENCRYPT | FLAGS_CTR);
++}
++
++static int omap4_aes_ctr_decrypt(struct ablkcipher_request *req)
++{
++	return omap4_aes_crypt(req, FLAGS_CTR);
++}
++
++static int omap4_aes_cra_init(struct crypto_tfm *tfm)
++{
++	pr_debug("enter\n");
++
++	tfm->crt_ablkcipher.reqsize = sizeof(struct omap4_aes_reqctx);
++
++	return 0;
++}
++
++static void omap4_aes_cra_exit(struct crypto_tfm *tfm)
++{
++	pr_debug("enter\n");
++}
++
++/* ********************** ALGS ************************************ */
++
++static struct crypto_alg algs[] = {
++	{
++		.cra_name		= "ecb(aes)",
++		.cra_driver_name	= "ecb-aes-omap4",
++		.cra_priority		= 300,
++		.cra_flags		= CRYPTO_ALG_TYPE_ABLKCIPHER | CRYPTO_ALG_ASYNC,
++		.cra_blocksize		= AES_BLOCK_SIZE,
++		.cra_ctxsize		= sizeof(struct omap4_aes_ctx),
++		.cra_alignmask		= 0,
++		.cra_type		= &crypto_ablkcipher_type,
++		.cra_module		= THIS_MODULE,
++		.cra_init		= omap4_aes_cra_init,
++		.cra_exit		= omap4_aes_cra_exit,
++		.cra_u.ablkcipher = {
++			.min_keysize	= AES_MIN_KEY_SIZE,
++			.max_keysize	= AES_MAX_KEY_SIZE,
++			.setkey		= omap4_aes_setkey,
++			.encrypt	= omap4_aes_ecb_encrypt,
++			.decrypt	= omap4_aes_ecb_decrypt,
++		}
++	},
++	{
++		.cra_name		= "cbc(aes)",
++		.cra_driver_name	= "cbc-aes-omap4",
++		.cra_priority		= 300,
++		.cra_flags		= CRYPTO_ALG_TYPE_ABLKCIPHER | CRYPTO_ALG_ASYNC,
++		.cra_blocksize		= AES_BLOCK_SIZE,
++		.cra_ctxsize		= sizeof(struct omap4_aes_ctx),
++		.cra_alignmask		= 0,
++		.cra_type		= &crypto_ablkcipher_type,
++		.cra_module		= THIS_MODULE,
++		.cra_init		= omap4_aes_cra_init,
++		.cra_exit		= omap4_aes_cra_exit,
++		.cra_u.ablkcipher = {
++			.min_keysize	= AES_MIN_KEY_SIZE,
++			.max_keysize	= AES_MAX_KEY_SIZE,
++			.geniv		= "eseqiv",
++			.ivsize		= AES_BLOCK_SIZE,
++			.setkey		= omap4_aes_setkey,
++			.encrypt	= omap4_aes_cbc_encrypt,
++			.decrypt	= omap4_aes_cbc_decrypt,
++
++		}
++	},
++	{
++		.cra_name		= "ctr(aes)",
++		.cra_driver_name	= "ctr-aes-omap4",
++		.cra_priority		= 300,
++		.cra_flags		= CRYPTO_ALG_TYPE_ABLKCIPHER | CRYPTO_ALG_ASYNC,
++		.cra_blocksize		= AES_BLOCK_SIZE,
++		.cra_ctxsize		= sizeof(struct omap4_aes_ctx),
++		.cra_alignmask		= 0,
++		.cra_type		= &crypto_ablkcipher_type,
++		.cra_module		= THIS_MODULE,
++		.cra_init		= omap4_aes_cra_init,
++		.cra_exit		= omap4_aes_cra_exit,
++		.cra_u.ablkcipher = {
++			.min_keysize	= AES_MIN_KEY_SIZE,
++			.max_keysize	= AES_MAX_KEY_SIZE,
++			.geniv		= "eseqiv",
++			.ivsize		= AES_BLOCK_SIZE,
++			.setkey		= omap4_aes_setkey,
++			.encrypt	= omap4_aes_ctr_encrypt,
++			.decrypt	= omap4_aes_ctr_decrypt,
++		}
++	}
++};
++
++static int omap4_aes_probe(struct platform_device *pdev)
++{
++	struct device *dev = &pdev->dev;
++	struct omap4_aes_dev *dd;
++	struct resource *res;
++	int err = -ENOMEM, i, j;
++	u32 reg;
++
++	dd = kzalloc(sizeof(struct omap4_aes_dev), GFP_KERNEL);
++	if (dd == NULL) {
++		dev_err(dev, "unable to alloc data struct.\n");
++		goto err_data;
++	}
++	dd->dev = dev;
++	platform_set_drvdata(pdev, dd);
++
++	spin_lock_init(&dd->lock);
++	crypto_init_queue(&dd->queue, AM33X_AES_QUEUE_LENGTH);
++
++	/* Get the base address */
++	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
++	if (!res) {
++		dev_err(dev, "invalid resource type\n");
++		err = -ENODEV;
++		goto err_res;
++	}
++	dd->phys_base = res->start;
++
++	/* Get the DMA */
++	res = platform_get_resource(pdev, IORESOURCE_DMA, 0);
++	if (!res)
++		dev_info(dev, "no DMA info\n");
++	else
++		dd->dma_out = res->start;
++
++	/* Get the DMA */
++	res = platform_get_resource(pdev, IORESOURCE_DMA, 1);
++	if (!res)
++		dev_info(dev, "no DMA info\n");
++	else
++		dd->dma_in = res->start;
++
++	/* Initializing the clock */
++	dd->iclk = clk_get(dev, "aes0_fck");
++	if (IS_ERR(dd->iclk)) {
++		dev_err(dev, "clock initialization failed.\n");
++		err = PTR_ERR(dd->iclk);
++		goto err_res;
++	}
++
++	dd->io_base = ioremap(dd->phys_base, SZ_4K);
++	if (!dd->io_base) {
++		dev_err(dev, "can't ioremap\n");
++		err = -ENOMEM;
++		goto err_io;
++	}
++
++	omap4_aes_hw_init(dd);
++	reg = omap4_aes_read(dd, AES_REG_REV);
++	clk_disable(dd->iclk);
++	dev_info(dev, "AM33X AES hw accel rev: %u.%02u\n",
++		 ((reg & AES_REG_REV_X_MAJOR_MASK) >> 8),
++		 (reg & AES_REG_REV_Y_MINOR_MASK));
++
++	tasklet_init(&dd->done_task, omap4_aes_done_task, (unsigned long)dd);
++	tasklet_init(&dd->queue_task, omap4_aes_queue_task, (unsigned long)dd);
++
++	err = omap4_aes_dma_init(dd);
++	if (err)
++		goto err_dma;
++
++	INIT_LIST_HEAD(&dd->list);
++	spin_lock(&list_lock);
++	list_add_tail(&dd->list, &dev_list);
++	spin_unlock(&list_lock);
++
++	for (i = 0; i < ARRAY_SIZE(algs); i++) {
++		pr_debug("reg alg: %s\n", algs[i].cra_name);
++		INIT_LIST_HEAD(&algs[i].cra_list);
++		err = crypto_register_alg(&algs[i]);
++		if (err)
++			goto err_algs;
++	}
++
++	pr_info("probe() done\n");
++
++	return 0;
++
++err_algs:
++	for (j = 0; j < i; j++)
++		crypto_unregister_alg(&algs[j]);
++	omap4_aes_dma_cleanup(dd);
++err_dma:
++	tasklet_kill(&dd->done_task);
++	tasklet_kill(&dd->queue_task);
++	iounmap(dd->io_base);
++
++err_io:
++	clk_put(dd->iclk);
++err_res:
++	kfree(dd);
++	dd = NULL;
++err_data:
++	dev_err(dev, "initialization failed.\n");
++	return err;
++}
++
++static int omap4_aes_remove(struct platform_device *pdev)
++{
++	struct omap4_aes_dev *dd = platform_get_drvdata(pdev);
++	int i;
++
++	if (!dd)
++		return -ENODEV;
++
++	spin_lock(&list_lock);
++	list_del(&dd->list);
++	spin_unlock(&list_lock);
++
++	for (i = 0; i < ARRAY_SIZE(algs); i++)
++		crypto_unregister_alg(&algs[i]);
++
++	tasklet_kill(&dd->done_task);
++	tasklet_kill(&dd->queue_task);
++	omap4_aes_dma_cleanup(dd);
++	iounmap(dd->io_base);
++	clk_put(dd->iclk);
++	kfree(dd);
++	dd = NULL;
++
++	return 0;
++}
++
++static struct platform_driver omap4_aes_driver = {
++	.probe	= omap4_aes_probe,
++	.remove	= omap4_aes_remove,
++	.driver	= {
++		.name	= "omap4-aes",
++		.owner	= THIS_MODULE,
++	},
++};
++
++static int __init omap4_aes_mod_init(void)
++{
++	pr_info("loading AM33X AES driver\n");
++
++	/* This only works on a GP device */
++	if (!cpu_is_am33xx() || omap_type() != OMAP2_DEVICE_TYPE_GP) {
++		pr_err("Unsupported cpu\n");
++		return -ENODEV;
++	}
++	return  platform_driver_register(&omap4_aes_driver);
++}
++
++static void __exit omap4_aes_mod_exit(void)
++{
++	pr_info("unloading AM33X AES driver\n");
++
++	platform_driver_unregister(&omap4_aes_driver);
++}
++
++module_init(omap4_aes_mod_init);
++module_exit(omap4_aes_mod_exit);
++
++MODULE_DESCRIPTION("AM33X AES acceleration support.");
++MODULE_LICENSE("GPL v2");
++MODULE_AUTHOR("Herman Schuurman");
+--
+1.7.0.4
diff --git a/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0008-am33x-Create-driver-for-SHA-MD5-crypto-module.patch b/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0008-am33x-Create-driver-for-SHA-MD5-crypto-module.patch
new file mode 100644
index 0000000..13c7e9e
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0008-am33x-Create-driver-for-SHA-MD5-crypto-module.patch
@@ -0,0 +1,1444 @@
+From 31e5e24a1d713b1f8306050e6b6a640ec30b1848 Mon Sep 17 00:00:00 2001
+From: Greg Turner <gregturner@ti.com>
+Date: Thu, 17 May 2012 15:19:26 -0500
+Subject: [PATCH 8/8] am33x: Create driver for SHA/MD5 crypto module
+
+This is the initial version of the SHA/MD5 driver for OMAP4 derivative SOC's such as AM335x.
+
+Signed-off-by: Greg Turner <gregturner@ti.com>
+---
+ drivers/crypto/omap4-sham.c | 1423 +++++++++++++++++++++++++++++++++++++++++++
+ 1 files changed, 1423 insertions(+), 0 deletions(-)
+ create mode 100755 drivers/crypto/omap4-sham.c
+
+diff --git a/drivers/crypto/omap4-sham.c b/drivers/crypto/omap4-sham.c
+new file mode 100755
+index 0000000..79f6be9
+--- /dev/null
++++ b/drivers/crypto/omap4-sham.c
+@@ -0,0 +1,1423 @@
++/*
++ * Cryptographic API.
++ *
++ * Support for OMAP SHA1/MD5 HW acceleration.
++ *
++ * Copyright (c) 2010 Nokia Corporation
++ * Author: Dmitry Kasatkin <dmitry.kasatkin@nokia.com>
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as published
++ * by the Free Software Foundation.
++ *
++ * Some ideas are from old omap-sha1-md5.c driver.
++ */
++/*
++ * Copyright © 2011 Texas Instruments Incorporated
++ * Author: Herman Schuurman
++ * Change: July 2011 - Adapted the omap-sham.c driver to support Netra
++ *	implementation of SHA/MD5 hardware accelerator.
++ *	Dec 2011 - Updated with latest omap-sham.c driver changes.
++ */
++
++//#define	DEBUG
++
++#define pr_fmt(fmt) "%s: " fmt, __func__
++
++#include <linux/err.h>
++#include <linux/device.h>
++#include <linux/module.h>
++#include <linux/init.h>
++#include <linux/errno.h>
++#include <linux/interrupt.h>
++#include <linux/kernel.h>
++#include <linux/clk.h>
++#include <linux/irq.h>
++#include <linux/io.h>
++#include <linux/platform_device.h>
++#include <linux/scatterlist.h>
++#include <linux/dma-mapping.h>
++#include <linux/delay.h>
++#include <linux/crypto.h>
++#include <linux/cryptohash.h>
++#include <crypto/scatterwalk.h>
++#include <crypto/algapi.h>
++#include <crypto/sha.h>
++#include <crypto/md5.h>
++#include <crypto/hash.h>
++#include <crypto/internal/hash.h>
++
++#include <mach/hardware.h>
++#include <plat/cpu.h>
++#include <plat/dma.h>
++#include <mach/edma.h>
++#include <mach/irqs.h>
++#include "omap4.h"
++
++#define SHA2_MD5_BLOCK_SIZE		SHA1_BLOCK_SIZE
++
++#define DEFAULT_TIMEOUT_INTERVAL	HZ
++
++/* device flags */
++#define FLAGS_BUSY		0
++#define FLAGS_FINAL		1
++#define FLAGS_DMA_ACTIVE	2
++#define FLAGS_OUTPUT_READY	3 /* shared with context flags */
++#define FLAGS_INIT		4
++#define FLAGS_CPU		5 /* shared with context flags */
++#define	FLAGS_DMA_READY		6 /* shared with context flags */
++
++/* context flags */
++#define FLAGS_FINUP		16
++#define FLAGS_SG		17
++#define	FLAGS_MODE_SHIFT	18
++#define	FLAGS_MODE_MASK		(SHA_REG_MODE_ALGO_MASK     << (FLAGS_MODE_SHIFT - 1))
++#define	 FLAGS_MD5		(SHA_REG_MODE_ALGO_MD5_128  << (FLAGS_MODE_SHIFT - 1))
++#define  FLAGS_SHA1		(SHA_REG_MODE_ALGO_SHA1_160 << (FLAGS_MODE_SHIFT - 1))
++#define	 FLAGS_SHA224		(SHA_REG_MODE_ALGO_SHA2_224 << (FLAGS_MODE_SHIFT - 1))
++#define	 FLAGS_SHA256		(SHA_REG_MODE_ALGO_SHA2_256 << (FLAGS_MODE_SHIFT - 1))
++#define FLAGS_HMAC		20
++#define FLAGS_ERROR		21
++
++#define OP_UPDATE		1
++#define OP_FINAL		2
++
++#define AM33X_ALIGN_MASK	(sizeof(u32)-1)
++#define AM33X_ALIGNED		__attribute__((aligned(sizeof(u32))))
++
++#define BUFLEN			PAGE_SIZE
++
++struct omap4_sham_dev;
++
++struct omap4_sham_reqctx {
++	struct omap4_sham_dev	*dd;
++	unsigned long		rflags;
++	unsigned long		op;
++
++	u8			digest[SHA256_DIGEST_SIZE] AM33X_ALIGNED;
++	size_t			digcnt; /* total digest byte count */
++	size_t			bufcnt; /* bytes in buffer */
++	size_t			buflen; /* buffer length */
++	dma_addr_t		dma_addr;
++
++	/* walk state */
++	struct scatterlist	*sg;
++	unsigned int		offset;	/* offset in current sg */
++	unsigned int		total;	/* total request */
++
++	u8			buffer[0] AM33X_ALIGNED;
++};
++
++/* This structure holds the initial HMAC key value, and subsequently
++ * the outer digest in the first 32 bytes.  The inner digest will be
++ * kept within the request context to conform to hash only
++ * computations.
++ */
++struct omap4_sham_hmac_ctx {
++	struct crypto_shash	*shash;
++	u8			keypad[SHA2_MD5_BLOCK_SIZE] AM33X_ALIGNED;
++	u32			odigest[SHA256_DIGEST_SIZE / sizeof(u32)];
++};
++
++struct omap4_sham_ctx {
++	struct omap4_sham_dev	*dd;
++
++	unsigned long		cflags;
++
++	/* fallback stuff */
++	struct crypto_shash	*fallback;
++
++	struct omap4_sham_hmac_ctx base[0];
++};
++
++#define AM33X_SHAM_QUEUE_LENGTH	1
++
++struct omap4_sham_dev {
++	struct list_head	list;
++	unsigned long		phys_base;
++	struct device		*dev;
++	void __iomem		*io_base;
++	int			irq;
++	struct clk		*iclk;
++	spinlock_t		lock;
++	int			err;
++	int			dma;
++	int			dma_lch;
++	struct tasklet_struct	done_task;
++
++	unsigned long		dflags;
++	struct crypto_queue	queue;
++	struct ahash_request	*req;
++};
++
++struct omap4_sham_drv {
++	struct list_head	dev_list;
++	spinlock_t		lock;
++	unsigned long		flags; /* superfluous ???? */
++};
++
++static struct omap4_sham_drv sham = {
++	.dev_list = LIST_HEAD_INIT(sham.dev_list),
++	.lock = __SPIN_LOCK_UNLOCKED(sham.lock),
++};
++
++static inline u32 omap4_sham_read(struct omap4_sham_dev *dd, u32 offset)
++{
++	return __raw_readl(dd->io_base + offset);
++}
++
++static inline void omap4_sham_write(struct omap4_sham_dev *dd,
++				  u32 offset, u32 value)
++{
++	__raw_writel(value, dd->io_base + offset);
++}
++
++static inline void omap4_sham_write_mask(struct omap4_sham_dev *dd, u32 address,
++				       u32 value, u32 mask)
++{
++	u32 val;
++
++	val = omap4_sham_read(dd, address);
++	val &= ~mask;
++	val |= value;
++	omap4_sham_write(dd, address, val);
++}
++
++static inline void omap4_sham_write_n(struct omap4_sham_dev *dd, u32 offset,
++				    u32 *value, int count)
++{
++	for (; count--; value++, offset += 4)
++		omap4_sham_write(dd, offset, *value);
++}
++
++static inline int omap4_sham_wait(struct omap4_sham_dev *dd, u32 offset, u32 bit)
++{
++	unsigned long timeout = jiffies + DEFAULT_TIMEOUT_INTERVAL;
++
++	while (!(omap4_sham_read(dd, offset) & bit)) {
++		if (time_is_before_jiffies(timeout))
++			return -ETIMEDOUT;
++	}
++
++	return 0;
++}
++
++static void omap4_sham_copy_hash(struct ahash_request *req, int out)
++{
++	struct omap4_sham_reqctx *ctx = ahash_request_ctx(req);
++	u32 *hash = (u32 *)ctx->digest;
++	int i;
++
++	if (ctx->rflags & BIT(FLAGS_HMAC)) {
++		struct crypto_ahash *tfm = crypto_ahash_reqtfm(ctx->dd->req);
++		struct omap4_sham_ctx *tctx = crypto_ahash_ctx(tfm);
++		struct omap4_sham_hmac_ctx *bctx = tctx->base;
++
++		for (i = 0; i < SHA256_DIGEST_SIZE / sizeof(u32); i++) {
++			if (out)
++				bctx->odigest[i] = omap4_sham_read(ctx->dd,
++						SHA_REG_ODIGEST_N(i));
++			else
++				omap4_sham_write(ctx->dd,
++					       SHA_REG_ODIGEST_N(i), bctx->odigest[i]);
++		}
++	}
++
++	/* Copy sha256 size to reduce code */
++	for (i = 0; i < SHA256_DIGEST_SIZE / sizeof(u32); i++) {
++		if (out)
++			hash[i] = omap4_sham_read(ctx->dd,
++						SHA_REG_IDIGEST_N(i));
++		else
++			omap4_sham_write(ctx->dd,
++				       SHA_REG_IDIGEST_N(i), hash[i]);
++	}
++}
++
++static void omap4_sham_copy_ready_hash(struct ahash_request *req)
++{
++	struct omap4_sham_reqctx *ctx = ahash_request_ctx(req);
++	u32 *in = (u32 *)ctx->digest;
++	u32 *hash = (u32 *)req->result;
++	int i, d;
++
++	if (!hash)
++		return;
++
++	switch (ctx->rflags & FLAGS_MODE_MASK) {
++	case FLAGS_MD5:
++		d = MD5_DIGEST_SIZE / sizeof(u32);
++		break;
++	case FLAGS_SHA1:
++		d = SHA1_DIGEST_SIZE / sizeof(u32);
++		break;
++	case FLAGS_SHA224:
++		d = SHA224_DIGEST_SIZE / sizeof(u32);
++		break;
++	case FLAGS_SHA256:
++		d = SHA256_DIGEST_SIZE / sizeof(u32);
++		break;
++	}
++
++	/* all results are in little endian */
++	for (i = 0; i < d; i++)
++		hash[i] = le32_to_cpu(in[i]);
++}
++
++#if 0
++static int omap4_sham_hw_init(struct omap4_sham_dev *dd)
++{
++	omap4_sham_write(dd, SHA_REG_SYSCFG, SHA_REG_SYSCFG_SOFTRESET);
++	/*
++	 * prevent OCP bus error (SRESP) in case an access to the module
++	 * is performed while the module is coming out of soft reset
++	 */
++	__asm__ __volatile__("nop");
++	__asm__ __volatile__("nop");
++
++	if (omap4_sham_wait(dd, SHA_REG_SYSSTATUS, SHA_REG_SYSSTATUS_RESETDONE))
++		return -ETIMEDOUT;
++
++	omap4_sham_write(dd, SHA_REG_SYSCFG,
++		       SHA_REG_SYSCFG_SIDLE_SMARTIDLE | SHA_REG_SYSCFG_AUTOIDLE);
++	set_bit(FLAGS_INIT, &dd->dflags);
++	dd->err = 0;
++
++	return 0;
++}
++#endif
++
++static void omap4_sham_write_ctrl(struct omap4_sham_dev *dd, int final, int dma)
++{
++	struct omap4_sham_reqctx *ctx = ahash_request_ctx(dd->req);
++	u32 val, mask;
++
++	/*
++	 * Setting ALGO_CONST only for the first iteration and
++	 * CLOSE_HASH only for the last one. Note that flags mode bits
++	 * correspond to algorithm encoding in mode register.
++	 */
++	val = (ctx->rflags & FLAGS_MODE_MASK) >> (FLAGS_MODE_SHIFT - 1);
++	if (!ctx->digcnt) {
++		struct crypto_ahash *tfm = crypto_ahash_reqtfm(dd->req);
++		struct omap4_sham_ctx *tctx = crypto_ahash_ctx(tfm);
++		struct omap4_sham_hmac_ctx *bctx = tctx->base;
++
++		val |= SHA_REG_MODE_ALGO_CONSTANT;
++		if (ctx->rflags & BIT(FLAGS_HMAC)) {
++			val |= SHA_REG_MODE_HMAC_KEY_PROC;
++			omap4_sham_write_n(dd, SHA_REG_ODIGEST, (u32 *) bctx->keypad,
++					 SHA2_MD5_BLOCK_SIZE / sizeof(u32));
++			ctx->digcnt += SHA2_MD5_BLOCK_SIZE;
++		}
++	}
++	if (final) {
++		val |= SHA_REG_MODE_CLOSE_HASH;
++
++		if (ctx->rflags & BIT(FLAGS_HMAC)) {
++			val |= SHA_REG_MODE_HMAC_OUTER_HASH;
++		}
++	}
++
++	mask = SHA_REG_MODE_ALGO_CONSTANT | SHA_REG_MODE_CLOSE_HASH |
++		SHA_REG_MODE_ALGO_MASK | SHA_REG_MODE_HMAC_OUTER_HASH |
++		SHA_REG_MODE_HMAC_KEY_PROC;
++
++	dev_dbg(dd->dev, "ctrl: %08x, flags: %08lx\n", val, ctx->rflags);
++	omap4_sham_write_mask(dd, SHA_REG_MODE, val, mask);
++	omap4_sham_write(dd, SHA_REG_IRQENA, SHA_REG_IRQENA_OUTPUT_RDY);
++	omap4_sham_write_mask(dd, SHA_REG_SYSCFG,
++			    SHA_REG_SYSCFG_SIT_EN | (dma ? SHA_REG_SYSCFG_SDMA_EN : 0),
++			    SHA_REG_SYSCFG_SIT_EN | SHA_REG_SYSCFG_SDMA_EN);
++}
++
++static int omap4_sham_xmit_cpu(struct omap4_sham_dev *dd, const u8 *buf,
++			      size_t length, int final)
++{
++	struct omap4_sham_reqctx *ctx = ahash_request_ctx(dd->req);
++	int count, len32;
++	const u32 *buffer = (const u32 *)buf;
++
++	dev_dbg(dd->dev, "xmit_cpu: digcnt: %d, length: %d, final: %d\n",
++						ctx->digcnt, length, final);
++
++	if (final)
++		set_bit(FLAGS_FINAL, &dd->dflags); /* catch last interrupt */
++
++	set_bit(FLAGS_CPU, &dd->dflags);
++
++	omap4_sham_write_ctrl(dd, final, 0);
++	/*
++	 * Setting the length field will also trigger start of
++	 * processing.
++	 */
++	omap4_sham_write(dd, SHA_REG_LENGTH, length);
++
++	/* short-circuit zero length */
++	if (likely(length)) {
++		ctx->digcnt += length;
++
++		if (omap4_sham_wait(dd, SHA_REG_IRQSTATUS, SHA_REG_IRQSTATUS_INPUT_RDY))
++			return -ETIMEDOUT;
++
++		len32 = DIV_ROUND_UP(length, sizeof(u32));
++
++		for (count = 0; count < len32; count++)
++			omap4_sham_write(dd, SHA_REG_DATA_N(count), buffer[count]);
++	}
++
++	return -EINPROGRESS;
++}
++
++static int omap4_sham_xmit_dma(struct omap4_sham_dev *dd, dma_addr_t dma_addr,
++			      size_t length, int final)
++{
++	struct omap4_sham_reqctx *ctx = ahash_request_ctx(dd->req);
++	int nblocks;
++	struct edmacc_param p_ram;
++
++	dev_dbg(dd->dev, "xmit_dma: digcnt: %d, length: %d, final: %d\n",
++						ctx->digcnt, length, final);
++
++	nblocks = DIV_ROUND_UP(length, SHA2_MD5_BLOCK_SIZE);
++
++	/* EDMA IN */
++	p_ram.opt	   = TCINTEN |
++		EDMA_TCC(EDMA_CHAN_SLOT(dd->dma_lch));
++	p_ram.src	   = dma_addr;
++	p_ram.a_b_cnt      = SHA2_MD5_BLOCK_SIZE | nblocks << 16;
++	p_ram.dst          = dd->phys_base + SHA_REG_DATA;
++	p_ram.src_dst_bidx = SHA2_MD5_BLOCK_SIZE;
++	p_ram.link_bcntrld = 1 << 16 | 0xFFFF;
++	p_ram.src_dst_cidx = 0;
++	p_ram.ccnt         = 1;
++	edma_write_slot(dd->dma_lch, &p_ram);
++
++	omap4_sham_write_ctrl(dd, final, 1);
++
++	ctx->digcnt += length;
++
++	if (final)
++		set_bit(FLAGS_FINAL, &dd->dflags); /* catch last interrupt */
++
++	set_bit(FLAGS_DMA_ACTIVE, &dd->dflags);
++
++	edma_start(dd->dma_lch);
++
++	/*
++	 * Setting the length field will also trigger start of
++	 * processing.
++	 */
++	omap4_sham_write(dd, SHA_REG_LENGTH, length);
++
++	return -EINPROGRESS;
++}
++
++static size_t omap4_sham_append_buffer(struct omap4_sham_reqctx *ctx,
++				const u8 *data, size_t length)
++{
++	size_t count = min(length, ctx->buflen - ctx->bufcnt);
++
++	count = min(count, ctx->total);
++	if (count <= 0)
++		return 0;
++	memcpy(ctx->buffer + ctx->bufcnt, data, count);
++	ctx->bufcnt += count;
++
++	return count;
++}
++
++static size_t omap4_sham_append_sg(struct omap4_sham_reqctx *ctx)
++{
++	size_t count;
++
++	while (ctx->sg) {
++		if (ctx->sg->length) {
++			count = omap4_sham_append_buffer(ctx,
++							 sg_virt(ctx->sg) + ctx->offset,
++							 ctx->sg->length - ctx->offset);
++			if (!count)
++				break;
++			ctx->offset += count;
++			ctx->total -= count;
++		}
++		if (ctx->offset == ctx->sg->length) {
++			ctx->sg = sg_next(ctx->sg);
++			if (ctx->sg)
++				ctx->offset = 0;
++			else
++				ctx->total = 0;
++		}
++	}
++
++	return 0;
++}
++
++static int omap4_sham_xmit_dma_map(struct omap4_sham_dev *dd,
++				  struct omap4_sham_reqctx *ctx,
++				  size_t length, int final)
++{
++	ctx->dma_addr = dma_map_single(dd->dev, ctx->buffer, ctx->buflen,
++				       DMA_TO_DEVICE);
++	if (dma_mapping_error(dd->dev, ctx->dma_addr)) {
++		dev_err(dd->dev, "dma %u bytes error\n", ctx->buflen);
++		return -EINVAL;
++	}
++
++	ctx->rflags &= ~BIT(FLAGS_SG);
++
++	/* next call does not fail... so no unmap in the case of error */
++	return omap4_sham_xmit_dma(dd, ctx->dma_addr, length, final);
++}
++
++static int omap4_sham_update_dma_slow(struct omap4_sham_dev *dd)
++{
++	struct omap4_sham_reqctx *ctx = ahash_request_ctx(dd->req);
++	unsigned int final;
++	size_t count;
++
++	omap4_sham_append_sg(ctx);
++
++	final = (ctx->rflags & BIT(FLAGS_FINUP)) && !ctx->total;
++
++	dev_dbg(dd->dev, "slow: bufcnt: %u, digcnt: %d, final: %d\n",
++					 ctx->bufcnt, ctx->digcnt, final);
++
++	if (final || (ctx->bufcnt == ctx->buflen && ctx->total)) {
++		count = ctx->bufcnt;
++		ctx->bufcnt = 0;
++		return omap4_sham_xmit_dma_map(dd, ctx, count, final);
++	}
++
++	return 0;
++}
++
++/* Start address alignment */
++#define SG_AA(sg)	(IS_ALIGNED(sg->offset, sizeof(u32)))
++/* SHA1 block size alignment */
++#define SG_SA(sg)	(IS_ALIGNED(sg->length, SHA2_MD5_BLOCK_SIZE))
++
++static int omap4_sham_update_dma_start(struct omap4_sham_dev *dd)
++{
++	struct omap4_sham_reqctx *ctx = ahash_request_ctx(dd->req);
++	unsigned int length, final, tail;
++	struct scatterlist *sg;
++
++	if (!ctx->total)
++		return 0;
++
++	if (ctx->bufcnt || ctx->offset)
++		return omap4_sham_update_dma_slow(dd);
++
++	dev_dbg(dd->dev, "fast: digcnt: %d, bufcnt: %u, total: %u\n",
++			ctx->digcnt, ctx->bufcnt, ctx->total);
++
++	sg = ctx->sg;
++
++	if (!SG_AA(sg))
++		return omap4_sham_update_dma_slow(dd);
++
++	if (!sg_is_last(sg) && !SG_SA(sg))
++		/* size is not SHA1_BLOCK_SIZE aligned */
++		return omap4_sham_update_dma_slow(dd);
++
++	length = min(ctx->total, sg->length);
++
++	if (sg_is_last(sg)) {
++		if (!(ctx->rflags & BIT(FLAGS_FINUP))) {
++			/* not last sg must be SHA2_MD5_BLOCK_SIZE aligned */
++			tail = length & (SHA2_MD5_BLOCK_SIZE - 1);
++			/* without finup() we need one block to close hash */
++			if (!tail)
++				tail = SHA2_MD5_BLOCK_SIZE;
++			length -= tail;
++		}
++	}
++
++	if (!dma_map_sg(dd->dev, ctx->sg, 1, DMA_TO_DEVICE)) {
++		dev_err(dd->dev, "dma_map_sg  error\n");
++		return -EINVAL;
++	}
++
++	ctx->rflags |= BIT(FLAGS_SG);
++
++	ctx->total -= length;
++	ctx->offset = length; /* offset where to start slow */
++
++	final = (ctx->rflags & BIT(FLAGS_FINUP)) && !ctx->total;
++
++	/* next call does not fail... so no unmap in the case of error */
++	return omap4_sham_xmit_dma(dd, sg_dma_address(ctx->sg), length, final);
++}
++
++static int omap4_sham_update_cpu(struct omap4_sham_dev *dd)
++{
++	struct omap4_sham_reqctx *ctx = ahash_request_ctx(dd->req);
++	int bufcnt;
++
++	omap4_sham_append_sg(ctx);
++	bufcnt = ctx->bufcnt;
++	ctx->bufcnt = 0;
++
++	return omap4_sham_xmit_cpu(dd, ctx->buffer, bufcnt, 1);
++}
++
++static int omap4_sham_update_dma_stop(struct omap4_sham_dev *dd)
++{
++	struct omap4_sham_reqctx *ctx = ahash_request_ctx(dd->req);
++
++	edma_stop(dd->dma_lch);
++	if (ctx->rflags & BIT(FLAGS_SG)) {
++		dma_unmap_sg(dd->dev, ctx->sg, 1, DMA_TO_DEVICE);
++		if (ctx->sg->length == ctx->offset) {
++			ctx->sg = sg_next(ctx->sg);
++			if (ctx->sg)
++				ctx->offset = 0;
++		}
++	} else {
++		dma_unmap_single(dd->dev, ctx->dma_addr, ctx->buflen,
++				 DMA_TO_DEVICE);
++	}
++
++	return 0;
++}
++
++static int omap4_sham_init(struct ahash_request *req)
++{
++	struct crypto_ahash *tfm = crypto_ahash_reqtfm(req);
++	struct omap4_sham_ctx *tctx = crypto_ahash_ctx(tfm);
++	struct omap4_sham_reqctx *ctx = ahash_request_ctx(req);
++	struct omap4_sham_dev *dd = NULL, *tmp;
++
++	spin_lock_bh(&sham.lock);
++	if (!tctx->dd) {
++		list_for_each_entry(tmp, &sham.dev_list, list) {
++			dd = tmp;
++			break;
++		}
++		tctx->dd = dd;
++	} else {
++		dd = tctx->dd;
++	}
++	spin_unlock_bh(&sham.lock);
++
++	ctx->dd = dd;
++
++	ctx->rflags = 0;
++
++	dev_dbg(dd->dev, "init: digest size: %d (@0x%08lx)\n",
++		crypto_ahash_digestsize(tfm), dd->phys_base);
++
++	switch (crypto_ahash_digestsize(tfm)) {
++	case MD5_DIGEST_SIZE:
++		ctx->rflags |= FLAGS_MD5;
++		break;
++	case SHA1_DIGEST_SIZE:
++		ctx->rflags |= FLAGS_SHA1;
++		break;
++	case SHA224_DIGEST_SIZE:
++		ctx->rflags |= FLAGS_SHA224;
++		break;
++	case SHA256_DIGEST_SIZE:
++		ctx->rflags |= FLAGS_SHA256;
++		break;
++	}
++
++	ctx->bufcnt = 0;
++	ctx->digcnt = 0;
++	ctx->buflen = BUFLEN;
++
++	if (tctx->cflags & BIT(FLAGS_HMAC)) {
++		ctx->rflags |= BIT(FLAGS_HMAC);
++	}
++
++	return 0;
++}
++
++static int omap4_sham_update_req(struct omap4_sham_dev *dd)
++{
++	struct ahash_request *req = dd->req;
++	struct omap4_sham_reqctx *ctx = ahash_request_ctx(req);
++	int err;
++
++	dev_dbg(dd->dev, "update_req: total: %u, digcnt: %d, finup: %d\n",
++		ctx->total, ctx->digcnt, (ctx->rflags & BIT(FLAGS_FINUP)) != 0);
++
++	if (ctx->rflags & BIT(FLAGS_CPU))
++		err = omap4_sham_update_cpu(dd);
++	else
++		err = omap4_sham_update_dma_start(dd);
++
++	/* wait for dma completion before can take more data */
++	dev_dbg(dd->dev, "update: err: %d, digcnt: %d\n", err, ctx->digcnt);
++
++	return err;
++}
++
++static int omap4_sham_final_req(struct omap4_sham_dev *dd)
++{
++	struct ahash_request *req = dd->req;
++	struct omap4_sham_reqctx *ctx = ahash_request_ctx(req);
++	int err = 0;
++
++	if (ctx->bufcnt <= SHA2_MD5_BLOCK_SIZE) /* faster to handle single block with CPU */
++		err = omap4_sham_xmit_cpu(dd, ctx->buffer, ctx->bufcnt, 1);
++	else
++		err = omap4_sham_xmit_dma_map(dd, ctx, ctx->bufcnt, 1);
++
++	ctx->bufcnt = 0;
++
++	dev_dbg(dd->dev, "final_req: err: %d\n", err);
++
++	return err;
++}
++
++static int omap4_sham_finish(struct ahash_request *req)
++{
++	struct omap4_sham_reqctx *ctx = ahash_request_ctx(req);
++	struct omap4_sham_dev *dd = ctx->dd;
++
++	omap4_sham_copy_ready_hash(req);
++	dev_dbg(dd->dev, "digcnt: %d, bufcnt: %d\n", ctx->digcnt, ctx->bufcnt);
++
++	return 0;
++}
++
++static void omap4_sham_finish_req(struct ahash_request *req, int err)
++{
++	struct omap4_sham_reqctx *ctx = ahash_request_ctx(req);
++	struct omap4_sham_dev *dd = ctx->dd;
++
++	if (!err) {
++		omap4_sham_copy_hash(req, 1);
++		if (test_bit(FLAGS_FINAL, &dd->dflags)) {
++			err = omap4_sham_finish(req);
++		}
++	} else {
++		ctx->rflags |= BIT(FLAGS_ERROR);
++	}
++
++	/* atomic operation is not needed here */
++	dd->dflags &= ~(BIT(FLAGS_BUSY) | BIT(FLAGS_FINAL) | BIT(FLAGS_CPU) |
++			BIT(FLAGS_DMA_READY) | BIT(FLAGS_OUTPUT_READY));
++	clk_disable(dd->iclk);
++
++	if (req->base.complete)
++		req->base.complete(&req->base, err);
++
++	/* handle new request */
++	tasklet_schedule(&dd->done_task);
++}
++
++static int omap4_sham_handle_queue(struct omap4_sham_dev *dd,
++				  struct ahash_request *req)
++{
++	struct crypto_async_request *async_req, *backlog;
++	struct omap4_sham_reqctx *ctx;
++	unsigned long flags;
++	int err = 0, ret = 0;
++
++	spin_lock_irqsave(&dd->lock, flags);
++	if (req)
++		ret = ahash_enqueue_request(&dd->queue, req);
++	if (test_bit(FLAGS_BUSY, &dd->dflags)) {
++		spin_unlock_irqrestore(&dd->lock, flags);
++		return ret;
++	}
++	backlog = crypto_get_backlog(&dd->queue);
++	async_req = crypto_dequeue_request(&dd->queue);
++	if (async_req)
++		set_bit(FLAGS_BUSY, &dd->dflags);
++	spin_unlock_irqrestore(&dd->lock, flags);
++
++	if (!async_req)
++		return ret;
++
++	if (backlog)
++		backlog->complete(backlog, -EINPROGRESS);
++
++	req = ahash_request_cast(async_req);
++	dd->req = req;
++	ctx = ahash_request_ctx(req);
++
++	dev_dbg(dd->dev, "handling new req, op: %lu, nbytes: %d\n",
++						ctx->op, req->nbytes);
++
++	clk_enable(dd->iclk);
++	if (!test_bit(FLAGS_INIT, &dd->dflags)) {
++		set_bit(FLAGS_INIT, &dd->dflags);
++		dd->err = 0;
++	}
++
++	if (ctx->digcnt)	/* not initial request - restore hash */
++		omap4_sham_copy_hash(req, 0);
++
++	if (ctx->op == OP_UPDATE) {
++		err = omap4_sham_update_req(dd);
++		if (err != -EINPROGRESS && (ctx->rflags & BIT(FLAGS_FINUP)))
++			/* no final() after finup() */
++			err = omap4_sham_final_req(dd);
++	} else if (ctx->op == OP_FINAL) {
++		err = omap4_sham_final_req(dd);
++	}
++
++	if (err != -EINPROGRESS)
++		/* done_task will not finish it, so do it here */
++		omap4_sham_finish_req(req, err);
++
++	dev_dbg(dd->dev, "exit, err: %d\n", err);
++
++	return ret;
++}
++
++static int omap4_sham_enqueue(struct ahash_request *req, unsigned int op)
++{
++	struct omap4_sham_reqctx *ctx = ahash_request_ctx(req);
++	struct omap4_sham_ctx *tctx = crypto_tfm_ctx(req->base.tfm);
++	struct omap4_sham_dev *dd = tctx->dd;
++
++	ctx->op = op;
++
++	return omap4_sham_handle_queue(dd, req);
++}
++
++static int omap4_sham_update(struct ahash_request *req)
++{
++	struct omap4_sham_reqctx *ctx = ahash_request_ctx(req);
++
++	if (!(ctx->rflags & BIT(FLAGS_FINUP)))
++		if (!req->nbytes)
++			return 0;
++
++	ctx->total = req->nbytes;
++	ctx->sg = req->src;
++	ctx->offset = 0;
++
++	if (ctx->rflags & BIT(FLAGS_FINUP)) {
++		if (ctx->bufcnt + ctx->total <= SHA2_MD5_BLOCK_SIZE) {
++			/*
++			 * faster to use CPU for short transfers
++			 */
++			ctx->rflags |= BIT(FLAGS_CPU);
++		}
++	} else if (ctx->bufcnt + ctx->total < ctx->buflen) {
++		omap4_sham_append_sg(ctx);
++		return 0;
++	}
++
++	return omap4_sham_enqueue(req, OP_UPDATE);
++}
++
++static int omap4_sham_shash_digest(struct crypto_shash *shash, u32 flags,
++				  const u8 *data, unsigned int len, u8 *out)
++{
++	struct {
++		struct shash_desc shash;
++		char ctx[crypto_shash_descsize(shash)];
++	} desc;
++
++	desc.shash.tfm = shash;
++	desc.shash.flags = flags & CRYPTO_TFM_REQ_MAY_SLEEP;
++
++	return crypto_shash_digest(&desc.shash, data, len, out);
++}
++
++static int omap4_sham_final(struct ahash_request *req)
++{
++	struct omap4_sham_reqctx *ctx = ahash_request_ctx(req);
++
++	ctx->rflags |= BIT(FLAGS_FINUP);
++
++	if (ctx->rflags & BIT(FLAGS_ERROR))
++		return 0; /* uncompleted hash is not needed */
++
++	return omap4_sham_enqueue(req, OP_FINAL);
++}
++
++static int omap4_sham_finup(struct ahash_request *req)
++{
++	struct omap4_sham_reqctx *ctx = ahash_request_ctx(req);
++	int err1, err2;
++
++	ctx->rflags |= BIT(FLAGS_FINUP);
++
++	err1 = omap4_sham_update(req);
++	if (err1 == -EINPROGRESS || err1 == -EBUSY)
++		return err1;
++	/*
++	 * final() has to be always called to cleanup resources
++	 * even if update() failed, except EINPROGRESS
++	 */
++	err2 = omap4_sham_final(req);
++
++	return err1 ?: err2;
++}
++
++static int omap4_sham_digest(struct ahash_request *req)
++{
++	return omap4_sham_init(req) ?: omap4_sham_finup(req);
++}
++
++static int omap4_sham_setkey(struct crypto_ahash *tfm, const u8 *key,
++		      unsigned int keylen)
++{
++	struct omap4_sham_ctx *tctx = crypto_ahash_ctx(tfm);
++	struct omap4_sham_hmac_ctx *bctx = tctx->base;
++	int bs = crypto_shash_blocksize(bctx->shash);
++	int ds = crypto_shash_digestsize(bctx->shash);
++	int err;
++
++	/* If key is longer than block size, use hash of original key */
++	if (keylen > bs) {
++		err = crypto_shash_setkey(tctx->fallback, key, keylen) ?:
++			omap4_sham_shash_digest(bctx->shash,
++				crypto_shash_get_flags(bctx->shash),
++				key, keylen, bctx->keypad);
++		if (err)
++			return err;
++		keylen = ds;
++	} else {
++		memcpy(bctx->keypad, key, keylen);
++	}
++
++	/* zero-pad the key (or its digest) */
++	if (keylen < bs)
++		memset(bctx->keypad + keylen, 0, bs - keylen);
++
++	return 0;
++}
++
++static int omap4_sham_cra_init_alg(struct crypto_tfm *tfm, const char *alg_base)
++{
++	struct omap4_sham_ctx *tctx = crypto_tfm_ctx(tfm);
++	const char *alg_name = crypto_tfm_alg_name(tfm);
++
++	/* Allocate a fallback and abort if it failed. */
++	tctx->fallback = crypto_alloc_shash(alg_name, 0,
++					    CRYPTO_ALG_NEED_FALLBACK);
++	if (IS_ERR(tctx->fallback)) {
++		pr_err("omap4-sham: fallback driver '%s' "
++				"could not be loaded.\n", alg_name);
++		return PTR_ERR(tctx->fallback);
++	}
++
++	crypto_ahash_set_reqsize(__crypto_ahash_cast(tfm),
++				 sizeof(struct omap4_sham_reqctx) + BUFLEN);
++
++	if (alg_base) {
++		struct omap4_sham_hmac_ctx *bctx = tctx->base;
++		tctx->cflags |= BIT(FLAGS_HMAC);
++		bctx->shash = crypto_alloc_shash(alg_base, 0,
++						CRYPTO_ALG_NEED_FALLBACK);
++		if (IS_ERR(bctx->shash)) {
++			pr_err("omap4-sham: base driver '%s' "
++					"could not be loaded.\n", alg_base);
++			crypto_free_shash(tctx->fallback);
++			return PTR_ERR(bctx->shash);
++		}
++
++	}
++
++	return 0;
++}
++
++static int omap4_sham_cra_init(struct crypto_tfm *tfm)
++{
++	return omap4_sham_cra_init_alg(tfm, NULL);
++}
++
++static int omap4_sham_cra_sha1_init(struct crypto_tfm *tfm)
++{
++	return omap4_sham_cra_init_alg(tfm, "sha1");
++}
++
++static int omap4_sham_cra_sha224_init(struct crypto_tfm *tfm)
++{
++	return omap4_sham_cra_init_alg(tfm, "sha224");
++}
++
++static int omap4_sham_cra_sha256_init(struct crypto_tfm *tfm)
++{
++	return omap4_sham_cra_init_alg(tfm, "sha256");
++}
++
++static int omap4_sham_cra_md5_init(struct crypto_tfm *tfm)
++{
++	return omap4_sham_cra_init_alg(tfm, "md5");
++}
++
++static void omap4_sham_cra_exit(struct crypto_tfm *tfm)
++{
++	struct omap4_sham_ctx *tctx = crypto_tfm_ctx(tfm);
++
++	crypto_free_shash(tctx->fallback);
++	tctx->fallback = NULL;
++
++	if (tctx->cflags & BIT(FLAGS_HMAC)) {
++		struct omap4_sham_hmac_ctx *bctx = tctx->base;
++		crypto_free_shash(bctx->shash);
++	}
++}
++
++static struct ahash_alg algs[] = {
++{
++	.init		= omap4_sham_init,
++	.update		= omap4_sham_update,
++	.final		= omap4_sham_final,
++	.finup		= omap4_sham_finup,
++	.digest		= omap4_sham_digest,
++	.halg.digestsize	= SHA1_DIGEST_SIZE,
++	.halg.base	= {
++		.cra_name		= "sha1",
++		.cra_driver_name	= "omap4-sha1",
++		.cra_priority		= 300,
++		.cra_flags		= CRYPTO_ALG_TYPE_AHASH |
++						CRYPTO_ALG_ASYNC |
++						CRYPTO_ALG_NEED_FALLBACK,
++		.cra_blocksize		= SHA1_BLOCK_SIZE,
++		.cra_ctxsize		= sizeof(struct omap4_sham_ctx),
++		.cra_alignmask		= 0,
++		.cra_module		= THIS_MODULE,
++		.cra_init		= omap4_sham_cra_init,
++		.cra_exit		= omap4_sham_cra_exit,
++	}
++},
++{
++	.init		= omap4_sham_init,
++	.update		= omap4_sham_update,
++	.final		= omap4_sham_final,
++	.finup		= omap4_sham_finup,
++	.digest		= omap4_sham_digest,
++	.halg.digestsize	= SHA224_DIGEST_SIZE,
++	.halg.base	= {
++		.cra_name		= "sha224",
++		.cra_driver_name	= "omap4-sha224",
++		.cra_priority		= 300,
++		.cra_flags		= CRYPTO_ALG_TYPE_AHASH |
++						CRYPTO_ALG_ASYNC |
++						CRYPTO_ALG_NEED_FALLBACK,
++		.cra_blocksize		= SHA224_BLOCK_SIZE,
++		.cra_ctxsize		= sizeof(struct omap4_sham_ctx),
++		.cra_alignmask		= 0,
++		.cra_module		= THIS_MODULE,
++		.cra_init		= omap4_sham_cra_init,
++		.cra_exit		= omap4_sham_cra_exit,
++	}
++},
++{
++	.init		= omap4_sham_init,
++	.update		= omap4_sham_update,
++	.final		= omap4_sham_final,
++	.finup		= omap4_sham_finup,
++	.digest		= omap4_sham_digest,
++	.halg.digestsize	= SHA256_DIGEST_SIZE,
++	.halg.base	= {
++		.cra_name		= "sha256",
++		.cra_driver_name	= "omap4-sha256",
++		.cra_priority		= 300,
++		.cra_flags		= CRYPTO_ALG_TYPE_AHASH |
++						CRYPTO_ALG_ASYNC |
++						CRYPTO_ALG_NEED_FALLBACK,
++		.cra_blocksize		= SHA256_BLOCK_SIZE,
++		.cra_ctxsize		= sizeof(struct omap4_sham_ctx),
++		.cra_alignmask		= 0,
++		.cra_module		= THIS_MODULE,
++		.cra_init		= omap4_sham_cra_init,
++		.cra_exit		= omap4_sham_cra_exit,
++	}
++},
++{
++	.init		= omap4_sham_init,
++	.update		= omap4_sham_update,
++	.final		= omap4_sham_final,
++	.finup		= omap4_sham_finup,
++	.digest		= omap4_sham_digest,
++	.halg.digestsize	= MD5_DIGEST_SIZE,
++	.halg.base	= {
++		.cra_name		= "md5",
++		.cra_driver_name	= "omap4-md5",
++		.cra_priority		= 300,
++		.cra_flags		= CRYPTO_ALG_TYPE_AHASH |
++						CRYPTO_ALG_ASYNC |
++						CRYPTO_ALG_NEED_FALLBACK,
++		.cra_blocksize		= SHA1_BLOCK_SIZE,
++		.cra_ctxsize		= sizeof(struct omap4_sham_ctx),
++		.cra_alignmask		= AM33X_ALIGN_MASK,
++		.cra_module		= THIS_MODULE,
++		.cra_init		= omap4_sham_cra_init,
++		.cra_exit		= omap4_sham_cra_exit,
++	}
++},
++{
++	.init		= omap4_sham_init,
++	.update		= omap4_sham_update,
++	.final		= omap4_sham_final,
++	.finup		= omap4_sham_finup,
++	.digest		= omap4_sham_digest,
++	.setkey		= omap4_sham_setkey,
++	.halg.digestsize	= SHA1_DIGEST_SIZE,
++	.halg.base	= {
++		.cra_name		= "hmac(sha1)",
++		.cra_driver_name	= "omap4-hmac-sha1",
++		.cra_priority		= 300,
++		.cra_flags		= CRYPTO_ALG_TYPE_AHASH |
++						CRYPTO_ALG_ASYNC |
++						CRYPTO_ALG_NEED_FALLBACK,
++		.cra_blocksize		= SHA1_BLOCK_SIZE,
++		.cra_ctxsize		= sizeof(struct omap4_sham_ctx) +
++					sizeof(struct omap4_sham_hmac_ctx),
++		.cra_alignmask		= AM33X_ALIGN_MASK,
++		.cra_module		= THIS_MODULE,
++		.cra_init		= omap4_sham_cra_sha1_init,
++		.cra_exit		= omap4_sham_cra_exit,
++	}
++},
++{
++	.init		= omap4_sham_init,
++	.update		= omap4_sham_update,
++	.final		= omap4_sham_final,
++	.finup		= omap4_sham_finup,
++	.digest		= omap4_sham_digest,
++	.setkey		= omap4_sham_setkey,
++	.halg.digestsize	= SHA224_DIGEST_SIZE,
++	.halg.base	= {
++		.cra_name		= "hmac(sha224)",
++		.cra_driver_name	= "omap4-hmac-sha224",
++		.cra_priority		= 300,
++		.cra_flags		= CRYPTO_ALG_TYPE_AHASH |
++						CRYPTO_ALG_ASYNC |
++						CRYPTO_ALG_NEED_FALLBACK,
++		.cra_blocksize		= SHA224_BLOCK_SIZE,
++		.cra_ctxsize		= sizeof(struct omap4_sham_ctx) +
++					sizeof(struct omap4_sham_hmac_ctx),
++		.cra_alignmask		= AM33X_ALIGN_MASK,
++		.cra_module		= THIS_MODULE,
++		.cra_init		= omap4_sham_cra_sha224_init,
++		.cra_exit		= omap4_sham_cra_exit,
++	}
++},
++{
++	.init		= omap4_sham_init,
++	.update		= omap4_sham_update,
++	.final		= omap4_sham_final,
++	.finup		= omap4_sham_finup,
++	.digest		= omap4_sham_digest,
++	.setkey		= omap4_sham_setkey,
++	.halg.digestsize	= SHA256_DIGEST_SIZE,
++	.halg.base	= {
++		.cra_name		= "hmac(sha256)",
++		.cra_driver_name	= "omap4-hmac-sha256",
++		.cra_priority		= 300,
++		.cra_flags		= CRYPTO_ALG_TYPE_AHASH |
++						CRYPTO_ALG_ASYNC |
++						CRYPTO_ALG_NEED_FALLBACK,
++		.cra_blocksize		= SHA256_BLOCK_SIZE,
++		.cra_ctxsize		= sizeof(struct omap4_sham_ctx) +
++					sizeof(struct omap4_sham_hmac_ctx),
++		.cra_alignmask		= AM33X_ALIGN_MASK,
++		.cra_module		= THIS_MODULE,
++		.cra_init		= omap4_sham_cra_sha256_init,
++		.cra_exit		= omap4_sham_cra_exit,
++	}
++},
++{
++	.init		= omap4_sham_init,
++	.update		= omap4_sham_update,
++	.final		= omap4_sham_final,
++	.finup		= omap4_sham_finup,
++	.digest		= omap4_sham_digest,
++	.setkey		= omap4_sham_setkey,
++	.halg.digestsize	= MD5_DIGEST_SIZE,
++	.halg.base	= {
++		.cra_name		= "hmac(md5)",
++		.cra_driver_name	= "omap4-hmac-md5",
++		.cra_priority		= 300,
++		.cra_flags		= CRYPTO_ALG_TYPE_AHASH |
++						CRYPTO_ALG_ASYNC |
++						CRYPTO_ALG_NEED_FALLBACK,
++		.cra_blocksize		= SHA1_BLOCK_SIZE,
++		.cra_ctxsize		= sizeof(struct omap4_sham_ctx) +
++					sizeof(struct omap4_sham_hmac_ctx),
++		.cra_alignmask		= AM33X_ALIGN_MASK,
++		.cra_module		= THIS_MODULE,
++		.cra_init		= omap4_sham_cra_md5_init,
++		.cra_exit		= omap4_sham_cra_exit,
++	}
++}
++};
++
++static void omap4_sham_done_task(unsigned long data)
++{
++	struct omap4_sham_dev *dd = (struct omap4_sham_dev *)data;
++	int err = 0;
++
++	if (!test_bit(FLAGS_BUSY, &dd->dflags)) {
++		omap4_sham_handle_queue(dd, NULL);
++		return;
++	}
++
++	if (test_bit(FLAGS_CPU, &dd->dflags)) {
++		if (test_and_clear_bit(FLAGS_OUTPUT_READY, &dd->dflags))
++			goto finish;
++	} else if (test_bit(FLAGS_OUTPUT_READY, &dd->dflags)) {
++		if (test_and_clear_bit(FLAGS_DMA_ACTIVE, &dd->dflags)) {
++			omap4_sham_update_dma_stop(dd);
++			if (dd->err) {
++				err = dd->err;
++				goto finish;
++			}
++		}
++		if (test_and_clear_bit(FLAGS_OUTPUT_READY, &dd->dflags)) {
++			/* hash or semi-hash ready */
++			clear_bit(FLAGS_DMA_READY, &dd->dflags);
++			err = omap4_sham_update_dma_start(dd);
++			if (err != -EINPROGRESS)
++				goto finish;
++		}
++	}
++
++	return;
++
++finish:
++	dev_dbg(dd->dev, "update done: err: %d\n", err);
++	/* finish current request */
++	omap4_sham_finish_req(dd->req, err);
++}
++
++static irqreturn_t omap4_sham_irq(int irq, void *dev_id)
++{
++	struct omap4_sham_dev *dd = dev_id;
++
++#if 0
++	if (unlikely(test_bit(FLAGS_FINAL, &dd->flags)))
++		/* final -> allow device to go to power-saving mode */
++		omap4_sham_write_mask(dd, SHA_REG_CTRL, 0, SHA_REG_CTRL_LENGTH);
++#endif
++
++	/* TODO check whether the result needs to be read out here,
++	   or if we just disable the interrupt */
++	omap4_sham_write_mask(dd, SHA_REG_SYSCFG, 0, SHA_REG_SYSCFG_SIT_EN);
++
++	if (!test_bit(FLAGS_BUSY, &dd->dflags)) {
++		dev_warn(dd->dev, "Interrupt when no active requests.\n");
++	} else {
++		set_bit(FLAGS_OUTPUT_READY, &dd->dflags);
++		tasklet_schedule(&dd->done_task);
++	}
++
++	return IRQ_HANDLED;
++}
++
++static void omap4_sham_dma_callback(unsigned int lch, u16 ch_status, void *data)
++{
++	struct omap4_sham_dev *dd = data;
++
++	edma_stop(lch);
++
++	if (ch_status != DMA_COMPLETE) {
++		pr_err("omap4-sham DMA error status: 0x%hx\n", ch_status);
++		dd->err = -EIO;
++		clear_bit(FLAGS_INIT, &dd->dflags); /* request to re-initialize */
++	}
++
++	set_bit(FLAGS_DMA_READY, &dd->dflags);
++	tasklet_schedule(&dd->done_task);
++}
++
++static int omap4_sham_dma_init(struct omap4_sham_dev *dd)
++{
++	int err;
++
++	dd->dma_lch = -1;
++
++	dd->dma_lch = edma_alloc_channel(dd->dma, omap4_sham_dma_callback, dd, EVENTQ_2);
++	if (dd->dma_lch < 0) {
++		dev_err(dd->dev, "Unable to request EDMA channel\n");
++		return -1;
++	}
++
++	return 0;
++}
++
++static void omap4_sham_dma_cleanup(struct omap4_sham_dev *dd)
++{
++	if (dd->dma_lch >= 0) {
++		edma_free_channel(dd->dma_lch);
++		dd->dma_lch = -1;
++	}
++}
++
++static int __devinit omap4_sham_probe(struct platform_device *pdev)
++{
++	struct omap4_sham_dev *dd;
++	struct device *dev = &pdev->dev;
++	struct resource *res;
++	int err, i, j;
++	u32 reg;
++
++	dd = kzalloc(sizeof(struct omap4_sham_dev), GFP_KERNEL);
++	if (dd == NULL) {
++		dev_err(dev, "unable to alloc data struct.\n");
++		err = -ENOMEM;
++		goto data_err;
++	}
++	dd->dev = dev;
++	platform_set_drvdata(pdev, dd);
++
++	INIT_LIST_HEAD(&dd->list);
++	spin_lock_init(&dd->lock);
++	tasklet_init(&dd->done_task, omap4_sham_done_task, (unsigned long)dd);
++	crypto_init_queue(&dd->queue, AM33X_SHAM_QUEUE_LENGTH);
++
++	dd->irq = -1;
++
++	/* Get the base address */
++	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
++	if (!res) {
++		dev_err(dev, "no MEM resource info\n");
++		err = -ENODEV;
++		goto res_err;
++	}
++	dd->phys_base = res->start;
++
++	/* Get the DMA */
++	res = platform_get_resource(pdev, IORESOURCE_DMA, 0);
++	if (!res) {
++		dev_err(dev, "no DMA resource info\n");
++		err = -ENODEV;
++		goto res_err;
++	}
++	dd->dma = res->start;
++
++	/* Get the IRQ */
++	dd->irq = platform_get_irq(pdev,  0);
++	if (dd->irq < 0) {
++		dev_err(dev, "no IRQ resource info\n");
++		err = dd->irq;
++		goto res_err;
++	}
++
++	err = request_irq(dd->irq, omap4_sham_irq,
++			IRQF_TRIGGER_LOW, dev_name(dev), dd);
++	if (err) {
++		dev_err(dev, "unable to request irq.\n");
++		goto res_err;
++	}
++
++	err = omap4_sham_dma_init(dd);
++	if (err)
++		goto dma_err;
++
++	/* Initializing the clock */
++	dd->iclk = clk_get(dev, "sha0_fck");
++	if (IS_ERR(dd->iclk)) {
++		dev_err(dev, "clock initialization failed.\n");
++		err = PTR_ERR(dd->iclk);
++		goto clk_err;
++	}
++
++	dd->io_base = ioremap(dd->phys_base, SZ_4K);
++	if (!dd->io_base) {
++		dev_err(dev, "can't ioremap\n");
++		err = -ENOMEM;
++		goto io_err;
++	}
++
++	clk_enable(dd->iclk);
++	reg = omap4_sham_read(dd, SHA_REG_REV);
++	clk_disable(dd->iclk);
++
++	dev_info(dev, "AM33X SHA/MD5 hw accel rev: %u.%02u\n",
++		 (reg & SHA_REG_REV_X_MAJOR_MASK) >> 8, reg & SHA_REG_REV_Y_MINOR_MASK);
++
++	spin_lock(&sham.lock);
++	list_add_tail(&dd->list, &sham.dev_list);
++	spin_unlock(&sham.lock);
++
++	for (i = 0; i < ARRAY_SIZE(algs); i++) {
++		err = crypto_register_ahash(&algs[i]);
++		if (err)
++			goto err_algs;
++	}
++
++	pr_info("probe() done\n");
++
++	return 0;
++
++err_algs:
++	for (j = 0; j < i; j++)
++		crypto_unregister_ahash(&algs[j]);
++	iounmap(dd->io_base);
++io_err:
++	clk_put(dd->iclk);
++clk_err:
++	omap4_sham_dma_cleanup(dd);
++dma_err:
++	if (dd->irq >= 0)
++		free_irq(dd->irq, dd);
++res_err:
++	kfree(dd);
++	dd = NULL;
++data_err:
++	dev_err(dev, "initialization failed.\n");
++
++	return err;
++}
++
++static int __devexit omap4_sham_remove(struct platform_device *pdev)
++{
++	static struct omap4_sham_dev *dd;
++	int i;
++
++	dd = platform_get_drvdata(pdev);
++	if (!dd)
++		return -ENODEV;
++	spin_lock(&sham.lock);
++	list_del(&dd->list);
++	spin_unlock(&sham.lock);
++	for (i = 0; i < ARRAY_SIZE(algs); i++)
++		crypto_unregister_ahash(&algs[i]);
++	tasklet_kill(&dd->done_task);
++	iounmap(dd->io_base);
++	clk_put(dd->iclk);
++	omap4_sham_dma_cleanup(dd);
++	if (dd->irq >= 0)
++		free_irq(dd->irq, dd);
++	kfree(dd);
++	dd = NULL;
++
++	return 0;
++}
++
++static struct platform_driver omap4_sham_driver = {
++	.probe	= omap4_sham_probe,
++	.remove	= omap4_sham_remove,
++	.driver	= {
++		.name	= "omap4-sham",
++		.owner	= THIS_MODULE,
++	},
++};
++
++static int __init omap4_sham_mod_init(void)
++{
++	pr_info("loading AM33X SHA/MD5 driver\n");
++
++	if (!cpu_is_am33xx() || omap_type() != OMAP2_DEVICE_TYPE_GP) {
++		pr_err("Unsupported cpu\n");
++		return -ENODEV;
++	}
++
++	return platform_driver_register(&omap4_sham_driver);
++}
++
++static void __exit omap4_sham_mod_exit(void)
++{
++	platform_driver_unregister(&omap4_sham_driver);
++}
++
++module_init(omap4_sham_mod_init);
++module_exit(omap4_sham_mod_exit);
++
++MODULE_DESCRIPTION("AM33x SHA/MD5 hw acceleration support.");
++MODULE_LICENSE("GPL v2");
++MODULE_AUTHOR("Herman Schuurman");
+--
+1.7.0.4
diff --git a/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/defconfig b/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/defconfig
new file mode 100644
index 0000000..f8cbc03
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/defconfig
@@ -0,0 +1 @@
+use-kernel-config=am335x_evm_defconfig
diff --git a/meta-arago-distro/recipes-kernel/linux/linux-am335x_3.2.0-psp05.06.00.00.bb b/meta-arago-distro/recipes-kernel/linux/linux-am335x_3.2.0-psp05.06.00.00.bb
new file mode 100644
index 0000000..8248d2d
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/linux/linux-am335x_3.2.0-psp05.06.00.00.bb
@@ -0,0 +1,91 @@
+SECTION = "kernel"
+DESCRIPTION = "Linux kernel for TI33x devices from PSP"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
+COMPATIBLE_MACHINE = "ti33x"
+
+DEFAULT_PREFERENCE = "-1"
+
+inherit kernel
+
+###################################################
+# When this recipe is moved to meta-ti these changes should go in a bbappend in meta-arago-distro.
+# Also the currently used defconfig should stay in meta-arago-distro and a completely working defconfig
+# should be used in meta-ti
+# KVER is used by arago-source-ipk.conf
+KVER = "${PV}"
+
+require copy-defconfig.inc
+require setup-defconfig.inc
+###################################################
+
+# Stage the power management firmware before building the kernel
+DEPENDS += "am33x-cm3"
+
+KERNEL_IMAGETYPE = "uImage"
+
+# The main PR is now using MACHINE_KERNEL_PR, for ti33x see conf/machine/include/ti33x.inc
+MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
+
+BRANCH = "v3.2-staging"
+
+SRCREV = "${AUTOREV}"
+
+SRC_URI = "git://arago-project.org/git/projects/linux-am33x.git;protocol=git;branch=${BRANCH} \
+           file://defconfig \
+           ${KERNEL_PATCHES} \
+"
+
+S = "${WORKDIR}/git"
+
+# Allow a layer to easily add to the list of patches or completely override them.
+KERNEL_PATCHES = "${PATCHES}"
+
+# Add a set of patches that enabled features, fixed bugs or disabled buggy features
+# that weren't part of the official PSP release
+PATCHES = "file://0001-musb-update-PIO-mode-help-information-in-Kconfig.patch \
+               file://0001-am335x_evm_defconfig-turn-off-MUSB-DMA.patch \
+               file://0001-mach-omap2-pm33xx-Disable-VT-switch.patch"
+
+# Add Cryptography support early driver patches while working to get the driver
+# upstream.
+PATCHES += "file://0001-am33x-Add-memory-addresses-for-crypto-modules.patch \
+                file://0002-am33x-Add-crypto-device-and-resource-structures.patch \
+                file://0003-am33x-Add-crypto-device-and-resource-structure-for-T.patch \
+                file://0004-am33x-Add-crypto-drivers-to-Kconfig-and-Makefiles.patch \
+                file://0005-am33x-Create-header-file-for-OMAP4-crypto-modules.patch \
+                file://0006-am33x-Create-driver-for-TRNG-crypto-module.patch \
+                file://0007-am33x-Create-driver-for-AES-crypto-module.patch \
+                file://0008-am33x-Create-driver-for-SHA-MD5-crypto-module.patch \
+                file://0002-AM335x-OCF-Driver-for-Linux-3.patch \
+                file://0001-am335x-Add-crypto-driver-settings-to-defconfig.patch \
+                file://0001-am335x-Add-pm_runtime-API-to-crypto-driver.patch \
+                file://0002-am335x-Add-suspend-resume-routines-to-crypto-driver.patch \
+               "
+
+# Add SmartReflex support early driver patches while working to get the driver
+# upstream.
+PATCHES += "file://0001-am33xx-Add-SmartReflex-support.patch \
+                file://0002-am33xx-Enable-CONFIG_AM33XX_SMARTREFLEX.patch \
+               "
+
+# Add a patch to the omap-serial driver to allow suspend/resume during
+# Bluetooth traffic
+PATCHES += "file://0001-omap-serial-add-delay-before-suspending.patch"
+
+# Add patch to allow wireless to work properly on EVM-SK 1.2.
+PATCHES += "file://0001-am3358-sk-modified-WLAN-enable-and-irq-to-match-boar.patch"
+
+# Add CPU utilization patch for WLAN
+PATCHES += "file://0001-am335xevm-using-edge-triggered-interrupts-for-WLAN.patch"
+
+# Add patch to enable pullup on WLAN enable
+PATCHES += "file://0001-am335x-enable-pullup-on-the-WLAN-enable-pin-fo.patch"
+
+# Copy the am33x-cm3 firmware if it is available
+do_compile_prepend() {
+    if [ -e "${STAGING_DIR_HOST}/${base_libdir}/firmware/am335x-pm-firmware.bin" ]
+    then
+        cp "${STAGING_DIR_HOST}/${base_libdir}/firmware/am335x-pm-firmware.bin" "${S}/firmware"
+    fi
+}
-- 
1.7.0.4


