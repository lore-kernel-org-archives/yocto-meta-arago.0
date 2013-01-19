Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f171.google.com (mail-ob0-f171.google.com
	[209.85.214.171])
	by arago-project.org (Postfix) with ESMTPS id 2DA0552AB9
	for <meta-arago@arago-project.org>;
	Sat, 19 Jan 2013 21:52:18 +0000 (UTC)
Received: by mail-ob0-f171.google.com with SMTP id dn14so4811353obc.2
	for <meta-arago@arago-project.org>;
	Sat, 19 Jan 2013 13:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=yTYSpfzea1TEKQW1D0VM4ATcYEMnaHIpj3R/wZjRjos=;
	b=k4UqxLLMnZ9ApYZteZ1k0Ipxz4mkmMuWFClNJDrxD0A2OIPR4SVwUmiYeEODxHKEbS
	2GCIh6kzNLWQ6bvZch04osoh/kHtHcjxg1V3aSzbqmIFdFuZNTxrViGN8DGZtnd7pUQq
	Yx5Ax2AfOUrPATmuxiGP6ekoDk1zkyCJvhr7wia4U3UmmfTtoTp0BU+FxRBQEwr77RD/
	jLXv1J69A1PCu+GnBLrpvQcp+8T38JCSc4XIoUB3eo3+bTnxrb9NPsu5Dx7PiQDGC4m7
	D8wRk1FGN5bBuw8k033/ibpKKlBfUhuKLA9J68CIFcVI89ori+JWcAHZRizW29iuDqxD
	9vfA==
X-Received: by 10.60.21.167 with SMTP id w7mr10323391oee.18.1358632337680;
	Sat, 19 Jan 2013 13:52:17 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id b3sm6845496obo.6.2013.01.19.13.52.15
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sat, 19 Jan 2013 13:52:16 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Sat, 19 Jan 2013 15:51:34 -0600
Message-Id: <1358632316-12266-9-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1358632316-12266-1-git-send-email-fcooper@ti.com>
References: <1358632316-12266-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 09/31] ti-compat-wireless: Port ti-compat-wireless recipe.
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
X-List-Received-Date: Sat, 19 Jan 2013 21:52:18 -0000

* Port ti-compat-wireless recipe from arago.
* This is a TI specific version of the compat-wireless recipe.
* Ti-compat-wireless provides the necessary wireless drivers for the TI
  wl12xx Wi-Fi + Bluetooth module.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 ...01-compat-wireless-add-pm_runtime_enabled.patch |   36 +++++
 .../0001-compat-wireless-exclude-BT-building.patch |   29 ++++
 ...wl12xx-Decrease-number-of-RX-transactions.patch |   34 +++++
 ...tional-two-members-for-wl12xx_platform_da.patch |   30 +++++
 ...xx-detect-between-wl1271-PG-3.0-and-lower.patch |   65 ++++++++++
 .../0002-compat-wireless-enable-test-mode.patch    |   29 ++++
 ...ompat-wireless-enable-uapsd-configuration.patch |   27 ++++
 ...wl12xx-Decrease-number-of-TX-transactions.patch |  135 ++++++++++++++++++++
 .../files/0004-added-driver-version.patch          |   36 +++++
 .../ti-compat-wireless-wl12xx_r5_18.bb             |   53 ++++++++
 10 files changed, 474 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0001-compat-wireless-add-pm_runtime_enabled.patch
 create mode 100644 meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0001-compat-wireless-exclude-BT-building.patch
 create mode 100755 meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0001-wl12xx-Decrease-number-of-RX-transactions.patch
 create mode 100644 meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0001-wl12xx-additional-two-members-for-wl12xx_platform_da.patch
 create mode 100644 meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0001-wl12xx-detect-between-wl1271-PG-3.0-and-lower.patch
 create mode 100644 meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0002-compat-wireless-enable-test-mode.patch
 create mode 100644 meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0002-ti-compat-wireless-enable-uapsd-configuration.patch
 create mode 100755 meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0002-wl12xx-Decrease-number-of-TX-transactions.patch
 create mode 100644 meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0004-added-driver-version.patch
 create mode 100644 meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx_r5_18.bb

diff --git a/meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0001-compat-wireless-add-pm_runtime_enabled.patch b/meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0001-compat-wireless-add-pm_runtime_enabled.patch
new file mode 100644
index 0000000..ba73dd8
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0001-compat-wireless-add-pm_runtime_enabled.patch
@@ -0,0 +1,36 @@
+From 0f11fd034274c795d9c506faa83a9fa947ba358a Mon Sep 17 00:00:00 2001
+From: Moosa <moosab@ti.com>
+Date: Thu, 3 May 2012 17:37:17 +0300
+Subject: [PATCH] compat-wireless: add pm_runtime_enabled
+
+* Add pm_runtime definition to header file
+
+Upstream-Status: Pending
+
+Signed-off-by: Moosa Baransi <moosab@ti.com>
+---
+ include/linux/compat-2.6.38.h |    9 +++++++++
+ 1 files changed, 9 insertions(+), 0 deletions(-)
+
+diff --git a/include/linux/compat-2.6.38.h b/include/linux/compat-2.6.38.h
+index 63f9dd6..94ee602 100644
+--- a/include/linux/compat-2.6.38.h
++++ b/include/linux/compat-2.6.38.h
+@@ -9,6 +9,15 @@
+ #include <linux/skbuff.h>
+ #include <linux/etherdevice.h>
+
++#ifdef CONFIG_PM_RUNTIME
++static inline bool pm_runtime_enabled(struct device *dev)
++{
++    return !dev->power.disable_depth;
++}
++#else
++    static inline bool pm_runtime_enabled(struct device *dev) { return false; }
++#endif
++
+ /* rename member in struct mmc_host in include/linux/mmc/host.h */
+ #define max_segs	max_hw_segs
+
+--
+1.7.1
diff --git a/meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0001-compat-wireless-exclude-BT-building.patch b/meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0001-compat-wireless-exclude-BT-building.patch
new file mode 100644
index 0000000..731da28
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0001-compat-wireless-exclude-BT-building.patch
@@ -0,0 +1,29 @@
+From 491bf7e73abf395f2af4a914d972dc7b73af2533 Mon Sep 17 00:00:00 2001
+From: Moosa <moosab@ti.com>
+Date: Thu, 24 May 2012 11:53:07 +0300
+Subject: [PATCH 1/2] compat-wireless: exclude BT building
+
+* Exclude Bluetooth components building from compat-wireless
+
+Upstream-Status: Pending
+
+Signed-off-by: Moosa Baransi <moosab@ti.com>
+---
+ Makefile |    2 --
+ 1 files changed, 0 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index a020661..ac75fb0 100644
+--- a/Makefile
++++ b/Makefile
+@@ -37,8 +37,6 @@ endif
+
+ endif
+
+-obj-$(CONFIG_COMPAT_BLUETOOTH) += net/bluetooth/
+-obj-$(CONFIG_COMPAT_BLUETOOTH_MODULES) += drivers/bluetooth/
+
+ else
+
+--
+1.7.1
diff --git a/meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0001-wl12xx-Decrease-number-of-RX-transactions.patch b/meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0001-wl12xx-Decrease-number-of-RX-transactions.patch
new file mode 100755
index 0000000..90aec78
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0001-wl12xx-Decrease-number-of-RX-transactions.patch
@@ -0,0 +1,34 @@
+From 5cd7de59a61168b784ea7f51c09e64f847e81c92 Mon Sep 17 00:00:00 2001
+From: Ido Yariv <ido@wizery.com>
+Date: Tue, 13 Dec 2011 23:16:01 +0200
+Subject: [PATCH 1/2] wl12xx: Decrease number of RX transactions
+
+On weak platforms, it is crucial to keep the number of SDIO transactions
+to a bare minimum. It is probably more important to keep CPU utilization
+low, than to handle FW events asap.
+
+In order to decrease the number of RX transactions, set the FW to only
+wake up the host when it has at least 4 pending packets. In addition,
+increase the relevant timeout, so the FW could actually reach this
+threshold.
+---
+ drivers/net/wireless/wl12xx/main.c |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/net/wireless/wl12xx/main.c b/drivers/net/wireless/wl12xx/main.c
+index bdb7166..f90b96a 100644
+--- a/drivers/net/wireless/wl12xx/main.c
++++ b/drivers/net/wireless/wl12xx/main.c
+@@ -130,8 +130,8 @@ static struct conf_drv_settings default_conf = {
+		.rts_threshold               = IEEE80211_MAX_RTS_THRESHOLD,
+		.rx_cca_threshold            = 0,
+		.irq_blk_threshold           = 0xFFFF,
+-		.irq_pkt_threshold           = 0,
+-		.irq_timeout                 = 600,
++		.irq_pkt_threshold           = 4,
++		.irq_timeout                 = 1200,
+		.queue_type                  = CONF_RX_QUEUE_TYPE_LOW_PRIORITY,
+	},
+	.tx = {
+--
+1.7.7.6
diff --git a/meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0001-wl12xx-additional-two-members-for-wl12xx_platform_da.patch b/meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0001-wl12xx-additional-two-members-for-wl12xx_platform_da.patch
new file mode 100644
index 0000000..69863cb
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0001-wl12xx-additional-two-members-for-wl12xx_platform_da.patch
@@ -0,0 +1,30 @@
+From 351a513dabfb55c3aab448613c2b10b7b5788d93 Mon Sep 17 00:00:00 2001
+From: Vita Preskovsky <vitap@ti.com>
+Date: Sun, 1 Jul 2012 11:49:30 +0300
+Subject: [PATCH] wl12xx: additional two members for wl12xx_platform_data
+
+  * Adding bt_enable_gpio and wlan_enable_gpio to wl12xx_platform_data.
+    This is needed in order to align this structure
+    with the one which is part of the linux kernel
+
+
+Signed-off-by: Vita Preskovsky <vitap@ti.com>
+---
+ include/linux/wl12xx.h |    2 ++
+ 1 files changed, 2 insertions(+), 0 deletions(-)
+
+diff --git a/include/linux/wl12xx.h b/include/linux/wl12xx.h
+index 0d63731..535058e 100644
+--- a/include/linux/wl12xx.h
++++ b/include/linux/wl12xx.h
+@@ -54,6 +54,8 @@ struct wl12xx_platform_data {
+	int board_ref_clock;
+	int board_tcxo_clock;
+	unsigned long platform_quirks;
++	int bt_enable_gpio;
++	int wlan_enable_gpio;
+	bool pwr_in_suspend;
+
+	struct wl1271_if_operations *ops;
+--
+1.7.0.4
diff --git a/meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0001-wl12xx-detect-between-wl1271-PG-3.0-and-lower.patch b/meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0001-wl12xx-detect-between-wl1271-PG-3.0-and-lower.patch
new file mode 100644
index 0000000..13bce85
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0001-wl12xx-detect-between-wl1271-PG-3.0-and-lower.patch
@@ -0,0 +1,65 @@
+From f100c47eff6a24a9594702dc72037773f7dd8911 Mon Sep 17 00:00:00 2001
+From: Eyal Reizer <eyalr@ti.com>
+Date: Tue, 29 May 2012 14:45:07 +0300
+Subject: [PATCH] wl12xx: detect between wl1271 PG 3.0 and lower
+
+* Detect between wl1271 PG version 3.0 and lower for using the right
+  firmware with R5 based releases
+* Do not allow activating multi-role on PG 2.0(and lower)
+
+Upstream-Status: Pending
+
+Signed-off-by: Eyal Reizer <eyalr@ti.com>
+---
+ drivers/net/wireless/wl12xx/main.c |   22 ++++++++++++++++++++--
+ 1 files changed, 20 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/net/wireless/wl12xx/main.c b/drivers/net/wireless/wl12xx/main.c
+index 3f05874..db50bf0 100644
+--- a/drivers/net/wireless/wl12xx/main.c
++++ b/drivers/net/wireless/wl12xx/main.c
+@@ -51,6 +51,8 @@
+ #include "scan.h"
+ #include "version.h"
+
++#define WL1271_PG_VERSION_2 2
++#define WL127X_PG20_FW_NAME_SINGLE	"ti-connectivity/wl127x-fw-4-pg2-0-sr.bin"
+ #define WL1271_BOOT_RETRIES 3
+
+ static struct conf_drv_settings default_conf = {
+@@ -1081,8 +1083,12 @@ static int wl12xx_fetch_firmware(struct wl1271 *wl, bool plt)
+			fw_type = WL12XX_FW_TYPE_NORMAL;
+			if (wl->chip.id == CHIP_ID_1283_PG20)
+				fw_name = WL128X_FW_NAME_SINGLE;
+-			else
+-				fw_name = WL127X_FW_NAME_SINGLE;
++			else {
++				if (wl->hw_pg_ver > WL1271_PG_VERSION_2)
++					fw_name = WL127X_FW_NAME_SINGLE;
++				else
++					fw_name = WL127X_PG20_FW_NAME_SINGLE;
++			}
+		}
+	}
+
+@@ -2494,6 +2500,18 @@ static int wl1271_op_add_interface(struct ieee80211_hw *hw,
+		goto out;
+	}
+
++	/*
++	 * Only WL127x PG 3.0 supports multi-role. Do not allow bringing up more
++	 * than one interface at a time in-case of using an older version.
++	 */
++	if ((wl->chip.id == CHIP_ID_1271_PG20) && (wl->hw_pg_ver <= WL1271_PG_VERSION_2)) {
++		open_count = ieee80211_get_open_count(hw, vif);
++		if (open_count) {
++			wl1271_error("WL127x PG %d.0 doesn't support multi-role",wl->hw_pg_ver + 1);
++			ret = -EBUSY;
++			goto out;
++		}
++	}
+
+	ret = wl12xx_init_vif_data(wl, vif);
+	if (ret < 0)
+--
+1.7.0.4
diff --git a/meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0002-compat-wireless-enable-test-mode.patch b/meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0002-compat-wireless-enable-test-mode.patch
new file mode 100644
index 0000000..556ec8a
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0002-compat-wireless-enable-test-mode.patch
@@ -0,0 +1,29 @@
+From ca17ce77efde9a69ea4d82b86d4d51463d3e2b4a Mon Sep 17 00:00:00 2001
+From: Moosa <moosab@ti.com>
+Date: Thu, 24 May 2012 11:54:06 +0300
+Subject: [PATCH 2/2] compat-wireless: enable test mode
+
+* Enable test mode switch. Needed for the calibration process
+
+Upstream-Status: Pending
+
+Signed-off-by: Moosa Baransi <moosab@ti.com>
+---
+ config.mk |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/config.mk b/config.mk
+index f09d16d..65b485e 100644
+--- a/config.mk
++++ b/config.mk
+@@ -198,7 +198,7 @@ CONFIG_MAC80211_MESH=y
+ CONFIG_CFG80211=m
+ CONFIG_CFG80211_DEFAULT_PS=y
+ # CONFIG_CFG80211_DEBUGFS=y
+-# CONFIG_NL80211_TESTMODE=y
++CONFIG_NL80211_TESTMODE=y
+ # CONFIG_CFG80211_DEVELOPER_WARNINGS=y
+ # CONFIG_CFG80211_REG_DEBUG=y
+ # CONFIG_CFG80211_INTERNAL_REGDB=y
+--
+1.7.1
diff --git a/meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0002-ti-compat-wireless-enable-uapsd-configuration.patch b/meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0002-ti-compat-wireless-enable-uapsd-configuration.patch
new file mode 100644
index 0000000..2cd3502
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0002-ti-compat-wireless-enable-uapsd-configuration.patch
@@ -0,0 +1,27 @@
+From 74d34f0573183f3d4971fcae46ed9dadbf514626 Mon Sep 17 00:00:00 2001
+From: Eyal Reizer <eyalr@ti.com>
+Date: Sun, 12 Jun 2011 17:33:09 +0300
+Subject: [PATCH] ti-compat-wireless:enable uapsd configuration
+
+this switch activates the wlan uapsd_queues settings
+
+Signed-off-by: Eyal Reizer <eyalr@ti.com>
+---
+ config.mk |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/config.mk b/config.mk
+index f4cf832..a464b99 100644
+--- a/config.mk
++++ b/config.mk
+@@ -110,7 +110,7 @@ endif #CONFIG_COMPAT_KERNEL_33
+ # Wireless subsystem stuff
+ CONFIG_MAC80211=m
+
+-# CONFIG_MAC80211_DEBUGFS=y
++CONFIG_MAC80211_DEBUGFS=y
+ # CONFIG_MAC80211_NOINLINE=y
+ # CONFIG_MAC80211_VERBOSE_DEBUG=y
+ # CONFIG_MAC80211_HT_DEBUG=y
+--
+1.7.0.4
diff --git a/meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0002-wl12xx-Decrease-number-of-TX-transactions.patch b/meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0002-wl12xx-Decrease-number-of-TX-transactions.patch
new file mode 100755
index 0000000..344f06f
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0002-wl12xx-Decrease-number-of-TX-transactions.patch
@@ -0,0 +1,135 @@
+From 35d7ab5678ce2287b681cb2735ec4307f3f83a6b Mon Sep 17 00:00:00 2001
+From: Ido Yariv <ido@wizery.com>
+Date: Tue, 13 Dec 2011 23:28:12 +0200
+Subject: [PATCH 2/2] wl12xx: Decrease number of TX transactions
+
+On weak platforms, it is crucial to keep the number of SDIO transactions
+to a bare minimum. It is probably more important to keep CPU utilization
+low, than to handle FW events asap.
+
+In order to decrease the number of TX transactions, don't schedule tx
+work right away for every outgoing packet. Instead, try to wait for a
+short period before scheduling tx work if there aren't enough pending
+packets.
+
+In addition, increase the TX pacing timeout, so the FW will have enough
+free memory blocks for larger transfers.
+---
+ drivers/net/wireless/wl12xx/main.c   |   39 ++++++++++++++++++++++++++++++---
+ drivers/net/wireless/wl12xx/wl12xx.h |    3 ++
+ 2 files changed, 38 insertions(+), 4 deletions(-)
+
+diff --git a/drivers/net/wireless/wl12xx/main.c b/drivers/net/wireless/wl12xx/main.c
+index f90b96a..e65eb5d 100644
+--- a/drivers/net/wireless/wl12xx/main.c
++++ b/drivers/net/wireless/wl12xx/main.c
+@@ -211,8 +211,8 @@ static struct conf_drv_settings default_conf = {
+			},
+		},
+		.frag_threshold              = IEEE80211_MAX_FRAG_THRESHOLD,
+-		.tx_compl_timeout            = 700,
+-		.tx_compl_threshold          = 4,
++		.tx_compl_timeout            = 1500,
++		.tx_compl_threshold          = 6,
+		.basic_rate                  = CONF_HW_BIT_RATE_1MBPS,
+		.basic_rate_5                = CONF_HW_BIT_RATE_6MBPS,
+		.tmpl_short_retry_limit      = 10,
+@@ -994,6 +994,8 @@ static irqreturn_t wl1271_irq(int irq, void *cookie)
+			spin_lock_irqsave(&wl->wl_lock, flags);
+			if (!test_bit(WL1271_FLAG_FW_TX_BUSY, &wl->flags) &&
+			    wl1271_tx_total_queue_count(wl) > 0) {
++				hrtimer_try_to_cancel(&wl->tx_timer);
++				clear_bit(WL1271_FLAG_TX_TIMER_SET, &wl->flags);
+				spin_unlock_irqrestore(&wl->wl_lock, flags);
+				/*
+				 * In order to avoid starvation of the TX path,
+@@ -1536,6 +1538,9 @@ out:
+	return ret;
+ }
+
++#define TX_PACKETS_THRESHOLD	6
++#define TX_WORK_DELAY_NS	(1500 * 1000)
++
+ static void wl1271_op_tx(struct ieee80211_hw *hw, struct sk_buff *skb)
+ {
+	struct wl1271 *wl = hw->priv;
+@@ -1584,14 +1589,37 @@ static void wl1271_op_tx(struct ieee80211_hw *hw, struct sk_buff *skb)
+	 * before that, the tx_work will not be initialized!
+	 */
+
+-	if (!test_bit(WL1271_FLAG_FW_TX_BUSY, &wl->flags) &&
+-	    !test_bit(WL1271_FLAG_TX_PENDING, &wl->flags))
++	if (test_bit(WL1271_FLAG_FW_TX_BUSY, &wl->flags) ||
++	    test_bit(WL1271_FLAG_TX_PENDING, &wl->flags))
++		goto out;
++
++	if (wl1271_tx_total_queue_count(wl) < TX_PACKETS_THRESHOLD) {
++		if (!test_and_set_bit(WL1271_FLAG_TX_TIMER_SET, &wl->flags))
++			hrtimer_start(&wl->tx_timer,
++				      ktime_set(0, TX_WORK_DELAY_NS),
++				      HRTIMER_MODE_REL);
++	} else {
++		hrtimer_try_to_cancel(&wl->tx_timer);
++		clear_bit(WL1271_FLAG_TX_TIMER_SET, &wl->flags);
+		ieee80211_queue_work(wl->hw, &wl->tx_work);
++	}
+
+ out:
+	spin_unlock_irqrestore(&wl->wl_lock, flags);
+ }
+
++enum hrtimer_restart wl12xx_tx_timer(struct hrtimer *timer)
++{
++	struct wl1271 *wl = container_of(timer, struct wl1271, tx_timer);
++	unsigned long flags;
++
++	spin_lock_irqsave(&wl->wl_lock, flags);
++	clear_bit(WL1271_FLAG_TX_TIMER_SET, &wl->flags);
++	ieee80211_queue_work(wl->hw, &wl->tx_work);
++	spin_unlock_irqrestore(&wl->wl_lock, flags);
++	return HRTIMER_NORESTART;
++}
++
+ int wl1271_tx_dummy_packet(struct wl1271 *wl)
+ {
+	unsigned long flags;
+@@ -2162,6 +2190,7 @@ static void wl1271_op_stop(struct ieee80211_hw *hw)
+	 * functions don't perform further work.
+	 */
+	wl->state = WL1271_STATE_OFF;
++	hrtimer_cancel(&wl->tx_timer);
+	mutex_unlock(&wl->mutex);
+
+	mutex_lock(&wl_list_mutex);
+@@ -5835,6 +5864,8 @@ static struct ieee80211_hw *wl1271_alloc_hw(void)
+	wl->active_sta_count = 0;
+	wl->fwlog_size = 0;
+	init_waitqueue_head(&wl->fwlog_waitq);
++	hrtimer_init(&wl->tx_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
++	wl->tx_timer.function = wl12xx_tx_timer;
+
+	/* The system link is always allocated */
+	__set_bit(WL12XX_SYSTEM_HLID, wl->links_map);
+diff --git a/drivers/net/wireless/wl12xx/wl12xx.h b/drivers/net/wireless/wl12xx/wl12xx.h
+index 269fadf..437526f 100644
+--- a/drivers/net/wireless/wl12xx/wl12xx.h
++++ b/drivers/net/wireless/wl12xx/wl12xx.h
+@@ -265,6 +265,7 @@ enum wl12xx_flags {
+	WL1271_FLAG_RECOVERY_IN_PROGRESS,
+	WL1271_FLAG_VIF_CHANGE_IN_PROGRESS,
+	WL1271_FLAG_INTENDED_FW_RECOVERY,
++	WL1271_FLAG_TX_TIMER_SET,
+ };
+
+ enum wl12xx_vif_flags {
+@@ -552,6 +553,8 @@ struct wl1271 {
+	struct list_head peers_list;
+
+	bool watchdog_recovery;
++
++	struct hrtimer tx_timer;
+ };
+
+ struct wl1271_station {
+--
+1.7.7.6
diff --git a/meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0004-added-driver-version.patch b/meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0004-added-driver-version.patch
new file mode 100644
index 0000000..b118166
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0004-added-driver-version.patch
@@ -0,0 +1,36 @@
+From 6147f6523fd3e82b1bed0ea5de1c23cff808a39f Mon Sep 17 00:00:00 2001
+From: Moosa <moosa.baransi@babcomsoftware.com>
+Date: Thu, 29 Dec 2011 09:26:16 +0200
+Subject: [PATCH] added driver version
+
+* Add printing of driver version after printing FW version.
+
+Upstream-Status: Pending
+
+Signed-off-by: Moosa <moosa.baransi@babcomsoftware.com>
+---
+ drivers/net/wireless/wl12xx/main.c |    2 ++
+ 1 files changed, 2 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/net/wireless/wl12xx/main.c b/drivers/net/wireless/wl12xx/main.c
+index aae6a74..fbf754b 100644
+--- a/drivers/net/wireless/wl12xx/main.c
++++ b/drivers/net/wireless/wl12xx/main.c
+@@ -49,6 +49,7 @@
+ #include "scan.h"
+
+ #define WL1271_BOOT_RETRIES 3
++#define WLAN_DRIVER_VERSION "R5_00_18"
+
+ static struct conf_drv_settings default_conf = {
+	.sg = {
+@@ -2227,6 +2228,7 @@ power_off:
+	wl->state = WL1271_STATE_ON;
+	set_bit(WL1271_FLAG_IF_INITIALIZED, &wl->flags);
+	wl1271_info("firmware booted (%s)", wl->chip.fw_ver_str);
++	wl1271_info("Driver version: %s", WLAN_DRIVER_VERSION);
+
+	/* update hw/fw version info in wiphy struct */
+	wiphy->hw_version = wl->chip.id;
+--
+1.7.0.4
diff --git a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx_r5_18.bb b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx_r5_18.bb
new file mode 100644
index 0000000..51c2a83
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx_r5_18.bb
@@ -0,0 +1,53 @@
+# This is a TI specific version of the compat-wireless recipe using a
+# compat-wireless package created from the TI Systems Tested mac80211 releases.
+
+DESCRIPTION = "ti compat-wireless drivers"
+HOMEPAGE = "https://gforge.ti.com/gf/project/ecs_nlcp/"
+SECTION = "kernel/modules"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=d7810fab7487fb0aad327b76f1be7cd7"
+
+RDEPENDS_${PN} = "wireless-tools"
+
+TAG = "${@'${COMPAT_WIRELESS_VERSION}'.replace('-', '')}"
+PV = "0.${TAG}"
+
+inherit module
+
+PR = "${MACHINE_KERNEL_PR}"
+PR_append = "a"
+
+COMPAT_WIRELESS_VERSION = "2012-05-15-r5-18"
+
+S = "${WORKDIR}/compat-wireless"
+
+SRC_URI = "https://gforge.ti.com/gf/download/frsrelease/864/5621/ti-compat-wireless-wl12xx-2012-05-17-r5-18.tar.gz \
+           file://0001-compat-wireless-add-pm_runtime_enabled.patch \
+           file://0001-compat-wireless-exclude-BT-building.patch \
+           file://0002-compat-wireless-enable-test-mode.patch \
+           file://0004-added-driver-version.patch \
+           file://0002-ti-compat-wireless-enable-uapsd-configuration.patch \
+           file://0001-wl12xx-detect-between-wl1271-PG-3.0-and-lower.patch \
+           file://0001-wl12xx-additional-two-members-for-wl12xx_platform_da.patch \
+          "
+SRC_URI_append_am335x-evm = "file://0001-wl12xx-Decrease-number-of-RX-transactions.patch \
+                             file://0002-wl12xx-Decrease-number-of-TX-transactions.patch \
+"
+
+SRC_URI[md5sum] = "9b6228d2ad39ece76ec022452df59621"
+SRC_URI[sha256sum] = "c5564cbdb5d89d488be13f8d9310242597728eb1e0918ef64a6fae55dba53f5e"
+
+EXTRA_OEMAKE = "KLIB_BUILD=${STAGING_KERNEL_DIR} KLIB=${D}"
+
+do_configure() {
+    cd ${S}
+    ./scripts/driver-select wl12xx
+}
+
+do_configure_append() {
+    sed -i "s#@./scripts/update-initramfs## " Makefile
+}
+
+do_install() {
+    oe_runmake DEPMOD=echo DESTDIR="${D}" INSTALL_MOD_PATH="${D}" LDFLAGS="" install-modules
+}
-- 
1.7.0.4


