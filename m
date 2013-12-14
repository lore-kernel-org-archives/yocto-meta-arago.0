Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTP id 321CE52A16
	for <meta-arago@arago-project.org>;
	Sat, 14 Dec 2013 07:57:59 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [96.231.138.104])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MXS0080GE4ML590@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Sat, 14 Dec 2013 01:57:58 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 2FA59200A9; Sat,
	14 Dec 2013 02:57:58 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Sat, 14 Dec 2013 02:57:55 -0500
Message-id: <1387007875-23969-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] linux-ti-staging: update defconfig to match meta-ti
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
X-List-Received-Date: Sat, 14 Dec 2013 07:57:59 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../linux/linux-ti-staging-3.12.4/defconfig        | 54 +++++++++++-----------
 .../linux/linux-ti-staging_3.12.bbappend           |  2 +-
 2 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-3.12.4/defconfig b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-3.12.4/defconfig
index 26a9271..9104ce7 100644
--- a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-3.12.4/defconfig
+++ b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-3.12.4/defconfig
@@ -1026,7 +1026,7 @@ CONFIG_FW_LOADER_USER_HELPER=y
 CONFIG_SOC_BUS=y
 CONFIG_REGMAP=y
 CONFIG_REGMAP_I2C=y
-CONFIG_REGMAP_SPI=m
+CONFIG_REGMAP_SPI=y
 CONFIG_REGMAP_MMIO=y
 CONFIG_REGMAP_IRQ=y
 CONFIG_DMA_SHARED_BUFFER=y
@@ -2811,21 +2811,21 @@ CONFIG_LOGO_LINUX_MONO=y
 CONFIG_LOGO_LINUX_VGA16=y
 CONFIG_LOGO_LINUX_CLUT224=y
 # CONFIG_FB_SSD1307 is not set
-CONFIG_SOUND=m
+CONFIG_SOUND=y
 CONFIG_SOUND_OSS_CORE=y
 CONFIG_SOUND_OSS_CORE_PRECLAIM=y
-CONFIG_SND=m
-CONFIG_SND_TIMER=m
-CONFIG_SND_PCM=m
-CONFIG_SND_DMAENGINE_PCM=m
+CONFIG_SND=y
+CONFIG_SND_TIMER=y
+CONFIG_SND_PCM=y
+CONFIG_SND_DMAENGINE_PCM=y
 CONFIG_SND_HWDEP=m
 CONFIG_SND_RAWMIDI=m
-CONFIG_SND_COMPRESS_OFFLOAD=m
+CONFIG_SND_COMPRESS_OFFLOAD=y
 CONFIG_SND_JACK=y
 # CONFIG_SND_SEQUENCER is not set
 CONFIG_SND_OSSEMUL=y
-CONFIG_SND_MIXER_OSS=m
-CONFIG_SND_PCM_OSS=m
+CONFIG_SND_MIXER_OSS=y
+CONFIG_SND_PCM_OSS=y
 CONFIG_SND_PCM_OSS_PLUGINS=y
 # CONFIG_SND_HRTIMER is not set
 # CONFIG_SND_DYNAMIC_MINORS is not set
@@ -2919,30 +2919,30 @@ CONFIG_SND_USB_AUDIO=m
 # CONFIG_SND_USB_CAIAQ is not set
 # CONFIG_SND_USB_6FIRE is not set
 # CONFIG_SND_USB_HIFACE is not set
-CONFIG_SND_SOC=m
+CONFIG_SND_SOC=y
 # CONFIG_SND_ATMEL_SOC is not set
-CONFIG_SND_DAVINCI_SOC=m
-CONFIG_SND_DAVINCI_SOC_MCASP=m
-CONFIG_SND_DAVINCI_SOC_GENERIC_EVM=m
-CONFIG_SND_AM33XX_SOC_EVM=m
+CONFIG_SND_DAVINCI_SOC=y
+CONFIG_SND_DAVINCI_SOC_MCASP=y
+CONFIG_SND_DAVINCI_SOC_GENERIC_EVM=y
+CONFIG_SND_AM33XX_SOC_EVM=y
 # CONFIG_SND_DESIGNWARE_I2S is not set
-CONFIG_SND_OMAP_SOC=m
-CONFIG_SND_OMAP_SOC_DMIC=m
-CONFIG_SND_OMAP_SOC_MCBSP=m
-CONFIG_SND_OMAP_SOC_MCPDM=m
+CONFIG_SND_OMAP_SOC=y
+CONFIG_SND_OMAP_SOC_DMIC=y
+CONFIG_SND_OMAP_SOC_MCBSP=y
+CONFIG_SND_OMAP_SOC_MCPDM=y
 # CONFIG_SND_OMAP_SOC_N810 is not set
 # CONFIG_SND_OMAP_SOC_RX51 is not set
 # CONFIG_SND_OMAP_SOC_AM3517EVM is not set
-CONFIG_SND_OMAP_SOC_DRA7EVM=m
-CONFIG_SND_OMAP_SOC_OMAP_TWL4030=m
-CONFIG_SND_OMAP_SOC_OMAP_ABE_TWL6040=m
+CONFIG_SND_OMAP_SOC_DRA7EVM=y
+CONFIG_SND_OMAP_SOC_OMAP_TWL4030=y
+CONFIG_SND_OMAP_SOC_OMAP_ABE_TWL6040=y
 # CONFIG_SND_OMAP_SOC_OMAP_HDMI is not set
 CONFIG_SND_OMAP_SOC_OMAP3_PANDORA=m
-CONFIG_SND_SOC_I2C_AND_SPI=m
-CONFIG_SND_SOC_DMIC=m
-CONFIG_SND_SOC_TLV320AIC3X=m
-CONFIG_SND_SOC_TWL4030=m
-CONFIG_SND_SOC_TWL6040=m
+CONFIG_SND_SOC_I2C_AND_SPI=y
+CONFIG_SND_SOC_DMIC=y
+CONFIG_SND_SOC_TLV320AIC3X=y
+CONFIG_SND_SOC_TWL4030=y
+CONFIG_SND_SOC_TWL6040=y
 # CONFIG_SND_SIMPLE_CARD is not set
 # CONFIG_SOUND_PRIME is not set
 
@@ -3079,7 +3079,7 @@ CONFIG_USB_MUSB_OMAP2PLUS=m
 # CONFIG_USB_MUSB_AM35X is not set
 CONFIG_USB_MUSB_DSPS=m
 # CONFIG_USB_MUSB_UX500 is not set
-CONFIG_USB_MUSB_AM335X_CHILD=m
+CONFIG_USB_MUSB_AM335X_CHILD=y
 # CONFIG_USB_INVENTRA_DMA is not set
 CONFIG_USB_TI_CPPI41_DMA=y
 # CONFIG_MUSB_PIO_ONLY is not set
diff --git a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_3.12.bbappend b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_3.12.bbappend
index 22d1f4f..93bff5f 100644
--- a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_3.12.bbappend
+++ b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_3.12.bbappend
@@ -1,4 +1,4 @@
-MACHINE_KERNEL_PR_append = "-arago2"
+MACHINE_KERNEL_PR_append = "-arago3"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${P}:"
 
-- 
1.8.3.2


