Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 0061E529A9
	for <meta-arago@arago-project.org>;
	Thu, 16 Jan 2014 23:57:47 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0GNvlZp016614
	for <meta-arago@arago-project.org>; Thu, 16 Jan 2014 17:57:47 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0GNvlGu003980
	for <meta-arago@arago-project.org>; Thu, 16 Jan 2014 17:57:47 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 16 Jan 2014 17:57:46 -0600
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0GNvfd4003746;
	Thu, 16 Jan 2014 17:57:45 -0600
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 16 Jan 2014 19:19:07 -0600
Message-ID: <1389921550-8122-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1389921550-8122-1-git-send-email-fcooper@ti.com>
References: <1389921550-8122-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 2/5] Remove all Wilink 6 related recipes
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
X-List-Received-Date: Thu, 16 Jan 2014 23:57:48 -0000
Content-Type: text/plain

* Wilink 6 will no longer be supported in future sdks and kernels.
* Remove all Wilink 6 related recipes.
* Users who absolutely need Wilink 6 can locally revert this patch or use any of
  the older maintenance branches.
---
 .../wpa-supplicant_r5.00.18.bbappend               |   11 -
 .../wpa-supplicant_r5.sp4.01.bbappend              |   11 -
 ...01-compat-wireless-add-pm_runtime_enabled.patch |   36 --
 .../0001-git-version-use-compat-base-tree.patch    |   29 --
 ...wl12xx-Decrease-number-of-RX-transactions.patch |   34 --
 ...tional-two-members-for-wl12xx_platform_da.patch |   30 --
 ...wl12xx-Decrease-number-of-TX-transactions.patch |  139 -------
 .../0001-compat-wireless-exclude-BT-building.patch |   29 --
 ...xx-detect-between-wl1271-PG-3.0-and-lower.patch |   65 ---
 .../0002-compat-wireless-enable-test-mode.patch    |   29 --
 ...ompat-wireless-enable-uapsd-configuration.patch |   27 --
 .../0004-added-driver-version.patch                |   36 --
 .../ti-compat-wireless-wl12xx_r5.00.18.bb          |   49 ---
 .../ti-compat-wireless-wl12xx_r5.sp4.01.bb         |   66 ---
 .../wl12xx-firmware-r5.sp4.01/Makefile             |    7 -
 .../wl12xx-firmware/wl12xx-firmware_r5.00.18.bb    |   28 --
 .../wl12xx-firmware/wl12xx-firmware_r5.sp4.01.bb   |   32 --
 .../battleship/battleship_git.bb                   |   48 ---
 .../battleship/files/battleship.desktop            |    9 -
 ...d-change-conf-file-for-better-oob-startup.patch |   49 ---
 ...d-change-conf-file-for-better-oob-startup.patch |   40 --
 .../hostap/hostap-daemon_r5.00.18.bb               |   12 -
 .../hostap/hostap-daemon_r5.sp4.01.bb              |   12 -
 .../files/wifi-direct-demo.desktop                 |    9 -
 .../wifi-direct-demo/files/wifi_exit.sh            |    3 -
 .../wifi-direct-demo/files/wifi_init.sh            |   13 -
 .../wifi-direct-demo/wifi-direct-demo_git.bb       |   52 ---
 .../wifi-direct-launcher/wifi-direct-launcher.sh   |   13 -
 .../wifi-direct-launcher_1.0.bb                    |   17 -
 .../wl1271-demo/0001-Add-additional-hci0-up.patch  |   54 ---
 .../wl12xx-demo/wl1271-demo_git.bb                 |   48 ---
 ...ant-dbus-AP-Add-support-for-WPS-Internal-.patch |  134 ------
 .../wpa-supplicant-r5.00.18/defconfig              |  426 -------------------
 .../wpa-supplicant-r5.sp4.01/defconfig             |  430 --------------------
 .../wpa-supplicant/wpa-supplicant_r5.00.18.bb      |   14 -
 .../wpa-supplicant/wpa-supplicant_r5.sp4.01.bb     |   13 -
 .../ti-wifi-utils/ti-wifi-utils.inc                |   29 --
 .../ti-wifi-utils/ti-wifi-utils_r5.00.18.bb        |    8 -
 .../ti-wifi-utils/ti-wifi-utils_r5.sp3.05.bb       |   10 -
 39 files changed, 0 insertions(+), 2101 deletions(-)
 delete mode 100755 meta-arago-distro/recipes-connectivity/wpa-supplicant/wpa-supplicant_r5.00.18.bbappend
 delete mode 100755 meta-arago-distro/recipes-connectivity/wpa-supplicant/wpa-supplicant_r5.sp4.01.bbappend
 delete mode 100644 meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0001-compat-wireless-add-pm_runtime_enabled.patch
 delete mode 100755 meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0001-git-version-use-compat-base-tree.patch
 delete mode 100755 meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0001-wl12xx-Decrease-number-of-RX-transactions.patch
 delete mode 100644 meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0001-wl12xx-additional-two-members-for-wl12xx_platform_da.patch
 delete mode 100755 meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0002-wl12xx-Decrease-number-of-TX-transactions.patch
 delete mode 100644 meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx-r5.00.18/0001-compat-wireless-exclude-BT-building.patch
 delete mode 100644 meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx-r5.00.18/0001-wl12xx-detect-between-wl1271-PG-3.0-and-lower.patch
 delete mode 100644 meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx-r5.00.18/0002-compat-wireless-enable-test-mode.patch
 delete mode 100644 meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx-r5.00.18/0002-ti-compat-wireless-enable-uapsd-configuration.patch
 delete mode 100644 meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx-r5.00.18/0004-added-driver-version.patch
 delete mode 100644 meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx_r5.00.18.bb
 delete mode 100644 meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx_r5.sp4.01.bb
 delete mode 100644 meta-arago-extras/recipes-bsp/wl12xx-firmware/wl12xx-firmware-r5.sp4.01/Makefile
 delete mode 100644 meta-arago-extras/recipes-bsp/wl12xx-firmware/wl12xx-firmware_r5.00.18.bb
 delete mode 100644 meta-arago-extras/recipes-bsp/wl12xx-firmware/wl12xx-firmware_r5.sp4.01.bb
 delete mode 100644 meta-arago-extras/recipes-connectivity/battleship/battleship_git.bb
 delete mode 100644 meta-arago-extras/recipes-connectivity/battleship/files/battleship.desktop
 delete mode 100644 meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-r5.00.18/0001-hostapd-change-conf-file-for-better-oob-startup.patch
 delete mode 100644 meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-r5.sp4.01/0001-hostapd-change-conf-file-for-better-oob-startup.patch
 delete mode 100644 meta-arago-extras/recipes-connectivity/hostap/hostap-daemon_r5.00.18.bb
 delete mode 100644 meta-arago-extras/recipes-connectivity/hostap/hostap-daemon_r5.sp4.01.bb
 delete mode 100644 meta-arago-extras/recipes-connectivity/wifi-direct-demo/files/wifi-direct-demo.desktop
 delete mode 100644 meta-arago-extras/recipes-connectivity/wifi-direct-demo/files/wifi_exit.sh
 delete mode 100644 meta-arago-extras/recipes-connectivity/wifi-direct-demo/files/wifi_init.sh
 delete mode 100644 meta-arago-extras/recipes-connectivity/wifi-direct-demo/wifi-direct-demo_git.bb
 delete mode 100644 meta-arago-extras/recipes-connectivity/wifi-direct-launcher/wifi-direct-launcher/wifi-direct-launcher.sh
 delete mode 100644 meta-arago-extras/recipes-connectivity/wifi-direct-launcher/wifi-direct-launcher_1.0.bb
 delete mode 100644 meta-arago-extras/recipes-connectivity/wl12xx-demo/wl1271-demo/0001-Add-additional-hci0-up.patch
 delete mode 100644 meta-arago-extras/recipes-connectivity/wl12xx-demo/wl1271-demo_git.bb
 delete mode 100644 meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-r5.00.18/0001-wpa_supplicant-dbus-AP-Add-support-for-WPS-Internal-.patch
 delete mode 100755 meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-r5.00.18/defconfig
 delete mode 100755 meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-r5.sp4.01/defconfig
 delete mode 100644 meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant_r5.00.18.bb
 delete mode 100644 meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant_r5.sp4.01.bb
 delete mode 100644 meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils.inc
 delete mode 100644 meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils_r5.00.18.bb
 delete mode 100644 meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils_r5.sp3.05.bb

diff --git a/meta-arago-distro/recipes-connectivity/wpa-supplicant/wpa-supplicant_r5.00.18.bbappend b/meta-arago-distro/recipes-connectivity/wpa-supplicant/wpa-supplicant_r5.00.18.bbappend
deleted file mode 100755
index 6fe2023..0000000
--- a/meta-arago-distro/recipes-connectivity/wpa-supplicant/wpa-supplicant_r5.00.18.bbappend
+++ /dev/null
@@ -1,11 +0,0 @@
-################################################################################
-######################### TSU EXEMPTION REQUIRED ###############################
-################################################################################
-# Versions of wpa_supplicant that are TSU Exempted:
-# wpa_supplicant-0.7.3
-
-# This package requires TSU exemption. Any update to the version of
-# wpa_supplicant must be double checked to see if a new TSU exemption must be made.
-################################################################################
-
-PR_append = "-arago0"
diff --git a/meta-arago-distro/recipes-connectivity/wpa-supplicant/wpa-supplicant_r5.sp4.01.bbappend b/meta-arago-distro/recipes-connectivity/wpa-supplicant/wpa-supplicant_r5.sp4.01.bbappend
deleted file mode 100755
index 6fe2023..0000000
--- a/meta-arago-distro/recipes-connectivity/wpa-supplicant/wpa-supplicant_r5.sp4.01.bbappend
+++ /dev/null
@@ -1,11 +0,0 @@
-################################################################################
-######################### TSU EXEMPTION REQUIRED ###############################
-################################################################################
-# Versions of wpa_supplicant that are TSU Exempted:
-# wpa_supplicant-0.7.3
-
-# This package requires TSU exemption. Any update to the version of
-# wpa_supplicant must be double checked to see if a new TSU exemption must be made.
-################################################################################
-
-PR_append = "-arago0"
diff --git a/meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0001-compat-wireless-add-pm_runtime_enabled.patch b/meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0001-compat-wireless-add-pm_runtime_enabled.patch
deleted file mode 100644
index ba73dd8..0000000
--- a/meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0001-compat-wireless-add-pm_runtime_enabled.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 0f11fd034274c795d9c506faa83a9fa947ba358a Mon Sep 17 00:00:00 2001
-From: Moosa <moosab@ti.com>
-Date: Thu, 3 May 2012 17:37:17 +0300
-Subject: [PATCH] compat-wireless: add pm_runtime_enabled
-
-* Add pm_runtime definition to header file
-
-Upstream-Status: Pending
-
-Signed-off-by: Moosa Baransi <moosab@ti.com>
----
- include/linux/compat-2.6.38.h |    9 +++++++++
- 1 files changed, 9 insertions(+), 0 deletions(-)
-
-diff --git a/include/linux/compat-2.6.38.h b/include/linux/compat-2.6.38.h
-index 63f9dd6..94ee602 100644
---- a/include/linux/compat-2.6.38.h
-+++ b/include/linux/compat-2.6.38.h
-@@ -9,6 +9,15 @@
- #include <linux/skbuff.h>
- #include <linux/etherdevice.h>
-
-+#ifdef CONFIG_PM_RUNTIME
-+static inline bool pm_runtime_enabled(struct device *dev)
-+{
-+    return !dev->power.disable_depth;
-+}
-+#else
-+    static inline bool pm_runtime_enabled(struct device *dev) { return false; }
-+#endif
-+
- /* rename member in struct mmc_host in include/linux/mmc/host.h */
- #define max_segs	max_hw_segs
-
---
-1.7.1
diff --git a/meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0001-git-version-use-compat-base-tree.patch b/meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0001-git-version-use-compat-base-tree.patch
deleted file mode 100755
index 61fe912..0000000
--- a/meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0001-git-version-use-compat-base-tree.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-For compat-wireless based  builds use compat_base_tree_version in  version.h
-When building with compat-wireless mechanism, the version info captured in version.h reflects target kernel and not the wl12xx version.
-Signed-off-by: Vishal Mahaveer <vishalm@ti.com>
-
-diff  a/drivers/net/wireless/wl12xx/Makefile b/drivers/net/wireless/wl12xx/Makefile
-
---- a/drivers/net/wireless/wl12xx/Makefile 2012-08-12 18:18:10.000000000 +0300
-+++ b/drivers/net/wireless/wl12xx/Makefile 2012-08-13 13:55:11.000000000 +0300
-@@ -3,12 +3,16 @@
- 
- define filechk_version.h
- 	(echo 'static const char *wl12xx_timestamp = __TIMESTAMP__;'; \
--	echo 'static const char *wl12xx_git_head = \
--			"$(shell git describe --dirty)";')
-+         echo '#ifdef COMPAT_BASE_TREE_VERSION'; \
-+         echo 'static const char *wl12xx_git_head =  COMPAT_BASE_TREE_VERSION;'; \
-+         echo '#else'; \
-+         echo 'static const char *wl12xx_git_head = \
-+                        "$(shell git describe --dirty)";'; \
-+         echo '#endif')
- endef
- 
--$(obj)/version.h: .git/HEAD .git/index .git/refs/tags
--	@$(call filechk,version.h)
-+#$(obj)/version.h: .git/HEAD .git/index .git/refs/tags
-+#	@$(call filechk,version.h)
- 
- $(obj)/main.c: $(src)/version.h
- 
diff --git a/meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0001-wl12xx-Decrease-number-of-RX-transactions.patch b/meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0001-wl12xx-Decrease-number-of-RX-transactions.patch
deleted file mode 100755
index 90aec78..0000000
--- a/meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0001-wl12xx-Decrease-number-of-RX-transactions.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 5cd7de59a61168b784ea7f51c09e64f847e81c92 Mon Sep 17 00:00:00 2001
-From: Ido Yariv <ido@wizery.com>
-Date: Tue, 13 Dec 2011 23:16:01 +0200
-Subject: [PATCH 1/2] wl12xx: Decrease number of RX transactions
-
-On weak platforms, it is crucial to keep the number of SDIO transactions
-to a bare minimum. It is probably more important to keep CPU utilization
-low, than to handle FW events asap.
-
-In order to decrease the number of RX transactions, set the FW to only
-wake up the host when it has at least 4 pending packets. In addition,
-increase the relevant timeout, so the FW could actually reach this
-threshold.
----
- drivers/net/wireless/wl12xx/main.c |    4 ++--
- 1 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/drivers/net/wireless/wl12xx/main.c b/drivers/net/wireless/wl12xx/main.c
-index bdb7166..f90b96a 100644
---- a/drivers/net/wireless/wl12xx/main.c
-+++ b/drivers/net/wireless/wl12xx/main.c
-@@ -130,8 +130,8 @@ static struct conf_drv_settings default_conf = {
-		.rts_threshold               = IEEE80211_MAX_RTS_THRESHOLD,
-		.rx_cca_threshold            = 0,
-		.irq_blk_threshold           = 0xFFFF,
--		.irq_pkt_threshold           = 0,
--		.irq_timeout                 = 600,
-+		.irq_pkt_threshold           = 4,
-+		.irq_timeout                 = 1200,
-		.queue_type                  = CONF_RX_QUEUE_TYPE_LOW_PRIORITY,
-	},
-	.tx = {
---
-1.7.7.6
diff --git a/meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0001-wl12xx-additional-two-members-for-wl12xx_platform_da.patch b/meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0001-wl12xx-additional-two-members-for-wl12xx_platform_da.patch
deleted file mode 100644
index 69863cb..0000000
--- a/meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0001-wl12xx-additional-two-members-for-wl12xx_platform_da.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 351a513dabfb55c3aab448613c2b10b7b5788d93 Mon Sep 17 00:00:00 2001
-From: Vita Preskovsky <vitap@ti.com>
-Date: Sun, 1 Jul 2012 11:49:30 +0300
-Subject: [PATCH] wl12xx: additional two members for wl12xx_platform_data
-
-  * Adding bt_enable_gpio and wlan_enable_gpio to wl12xx_platform_data.
-    This is needed in order to align this structure
-    with the one which is part of the linux kernel
-
-
-Signed-off-by: Vita Preskovsky <vitap@ti.com>
----
- include/linux/wl12xx.h |    2 ++
- 1 files changed, 2 insertions(+), 0 deletions(-)
-
-diff --git a/include/linux/wl12xx.h b/include/linux/wl12xx.h
-index 0d63731..535058e 100644
---- a/include/linux/wl12xx.h
-+++ b/include/linux/wl12xx.h
-@@ -54,6 +54,8 @@ struct wl12xx_platform_data {
-	int board_ref_clock;
-	int board_tcxo_clock;
-	unsigned long platform_quirks;
-+	int bt_enable_gpio;
-+	int wlan_enable_gpio;
-	bool pwr_in_suspend;
-
-	struct wl1271_if_operations *ops;
---
-1.7.0.4
diff --git a/meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0002-wl12xx-Decrease-number-of-TX-transactions.patch b/meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0002-wl12xx-Decrease-number-of-TX-transactions.patch
deleted file mode 100755
index 3e2185a..0000000
--- a/meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0002-wl12xx-Decrease-number-of-TX-transactions.patch
+++ /dev/null
@@ -1,139 +0,0 @@
-From a7807fffc76117a9d0a40fdcc85b56644e81f34c Mon Sep 17 00:00:00 2001
-From: Eyal Reizer <eyalr@ti.com>
-Date: Tue, 27 Nov 2012 16:05:20 +0200
-Subject: [PATCH] wl12xx: Decrease number of TX transactions
-
-On weak platforms, it is crucial to keep the number of SDIO transactions
-to a bare minimum. It is probably more important to keep CPU utilization
-low, than to handle FW events asap.
-
-In order to decrease the number of TX transactions, don't schedule tx
-work right away for every outgoing packet. Instead, try to wait for a
-short period before scheduling tx work if there aren't enough pending
-packets.
-
-In addition, increase the TX pacing timeout, so the FW will have enough
-free memory blocks for larger transfers.
-
-Adapted from original patch made by Ido Yariv <ido@wizery.com>
-Signed-off-by: Eyal Reizer <eyalr@ti.com>
----
- drivers/net/wireless/wl12xx/main.c   |   39 ++++++++++++++++++++++++++++++----
- drivers/net/wireless/wl12xx/wl12xx.h |    3 +++
- 2 files changed, 38 insertions(+), 4 deletions(-)
-
-diff --git a/drivers/net/wireless/wl12xx/main.c b/drivers/net/wireless/wl12xx/main.c
-index c9888f4..a59ac43 100644
---- a/drivers/net/wireless/wl12xx/main.c
-+++ b/drivers/net/wireless/wl12xx/main.c
-@@ -218,8 +218,8 @@ static struct conf_drv_settings default_conf = {
- 			},
- 		},
- 		.frag_threshold              = IEEE80211_MAX_FRAG_THRESHOLD,
--		.tx_compl_timeout            = 700,
--		.tx_compl_threshold          = 4,
-+		.tx_compl_timeout            = 1500,
-+		.tx_compl_threshold          = 6,
- 		.basic_rate                  = CONF_HW_BIT_RATE_1MBPS,
- 		.basic_rate_5                = CONF_HW_BIT_RATE_6MBPS,
- 		.tmpl_short_retry_limit      = 10,
-@@ -1199,6 +1199,8 @@ static int wl12xx_irq_locked(struct wl1271 *wl)
- 			spin_lock_irqsave(&wl->wl_lock, flags);
- 			if (!test_bit(WL1271_FLAG_FW_TX_BUSY, &wl->flags) &&
- 			    wl1271_tx_total_queue_count(wl) > 0) {
-+				hrtimer_try_to_cancel(&wl->tx_timer);
-+				clear_bit(WL1271_FLAG_TX_TIMER_SET, &wl->flags);
- 				spin_unlock_irqrestore(&wl->wl_lock, flags);
- 				/*
- 				 * In order to avoid starvation of the TX path,
-@@ -2056,6 +2058,9 @@ out:
- 	return ret;
- }
- 
-+#define TX_PACKETS_THRESHOLD	6
-+#define TX_WORK_DELAY_NS	(1500 * 1000)
-+
- static void wl1271_op_tx(struct ieee80211_hw *hw, struct sk_buff *skb)
- {
- 	struct wl1271 *wl = hw->priv;
-@@ -2113,14 +2118,37 @@ static void wl1271_op_tx(struct ieee80211_hw *hw, struct sk_buff *skb)
- 	 * before that, the tx_work will not be initialized!
- 	 */
- 
--	if (!test_bit(WL1271_FLAG_FW_TX_BUSY, &wl->flags) &&
--	    !test_bit(WL1271_FLAG_TX_PENDING, &wl->flags))
-+	if (test_bit(WL1271_FLAG_FW_TX_BUSY, &wl->flags) ||
-+	    test_bit(WL1271_FLAG_TX_PENDING, &wl->flags))
-+		goto out;
-+
-+	if (wl1271_tx_total_queue_count(wl) < TX_PACKETS_THRESHOLD) {
-+		if (!test_and_set_bit(WL1271_FLAG_TX_TIMER_SET, &wl->flags))
-+			hrtimer_start(&wl->tx_timer,
-+				      ktime_set(0, TX_WORK_DELAY_NS),
-+				      HRTIMER_MODE_REL);
-+	} else {
-+		hrtimer_try_to_cancel(&wl->tx_timer);
-+		clear_bit(WL1271_FLAG_TX_TIMER_SET, &wl->flags);
- 		ieee80211_queue_work(wl->hw, &wl->tx_work);
-+	}
- 
- out:
- 	spin_unlock_irqrestore(&wl->wl_lock, flags);
- }
- 
-+enum hrtimer_restart wl12xx_tx_timer(struct hrtimer *timer)
-+{
-+	struct wl1271 *wl = container_of(timer, struct wl1271, tx_timer);
-+	unsigned long flags;
-+
-+	spin_lock_irqsave(&wl->wl_lock, flags);
-+	clear_bit(WL1271_FLAG_TX_TIMER_SET, &wl->flags);
-+	ieee80211_queue_work(wl->hw, &wl->tx_work);
-+	spin_unlock_irqrestore(&wl->wl_lock, flags);
-+	return HRTIMER_NORESTART;
-+}
-+
- int wl1271_tx_dummy_packet(struct wl1271 *wl)
- {
- 	unsigned long flags;
-@@ -2740,6 +2768,7 @@ static void wl1271_op_stop_locked(struct wl1271 *wl)
- 	 * held while doing so without deadlocking.
- 	 */
- 	wlcore_disable_interrupts_nosync(wl);
-+	hrtimer_cancel(&wl->tx_timer);
- 	mutex_unlock(&wl->mutex);
- 
- 	mutex_lock(&wl_list_mutex);
-@@ -6798,6 +6827,8 @@ static struct ieee80211_hw *wl1271_alloc_hw(void)
- 	wl->active_sta_count = 0;
- 	wl->fwlog_size = 0;
- 	init_waitqueue_head(&wl->fwlog_waitq);
-+	hrtimer_init(&wl->tx_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-+	wl->tx_timer.function = wl12xx_tx_timer;
- 
- 	/* The system link is always allocated */
- 	__set_bit(WL12XX_SYSTEM_HLID, wl->links_map);
-diff --git a/drivers/net/wireless/wl12xx/wl12xx.h b/drivers/net/wireless/wl12xx/wl12xx.h
-index 9c00dbf..e34f095 100644
---- a/drivers/net/wireless/wl12xx/wl12xx.h
-+++ b/drivers/net/wireless/wl12xx/wl12xx.h
-@@ -275,6 +275,7 @@ enum wl12xx_flags {
- 	WL1271_FLAG_VIF_CHANGE_IN_PROGRESS,
- 	WL1271_FLAG_INTENDED_FW_RECOVERY,
- 	WL1271_FLAG_IO_FAILED,
-+	WL1271_FLAG_TX_TIMER_SET,
- };
- 
- enum wl12xx_vif_flags {
-@@ -594,6 +595,8 @@ struct wl1271 {
- 
- 	/* Patterns configured with set_rx_filters */
- 	struct cfg80211_wowlan *wowlan_patterns;
-+
-+	struct hrtimer tx_timer;
- };
- 
- struct wl1271_station {
--- 
-1.7.9.5
-
diff --git a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx-r5.00.18/0001-compat-wireless-exclude-BT-building.patch b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx-r5.00.18/0001-compat-wireless-exclude-BT-building.patch
deleted file mode 100644
index 731da28..0000000
--- a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx-r5.00.18/0001-compat-wireless-exclude-BT-building.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 491bf7e73abf395f2af4a914d972dc7b73af2533 Mon Sep 17 00:00:00 2001
-From: Moosa <moosab@ti.com>
-Date: Thu, 24 May 2012 11:53:07 +0300
-Subject: [PATCH 1/2] compat-wireless: exclude BT building
-
-* Exclude Bluetooth components building from compat-wireless
-
-Upstream-Status: Pending
-
-Signed-off-by: Moosa Baransi <moosab@ti.com>
----
- Makefile |    2 --
- 1 files changed, 0 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index a020661..ac75fb0 100644
---- a/Makefile
-+++ b/Makefile
-@@ -37,8 +37,6 @@ endif
-
- endif
-
--obj-$(CONFIG_COMPAT_BLUETOOTH) += net/bluetooth/
--obj-$(CONFIG_COMPAT_BLUETOOTH_MODULES) += drivers/bluetooth/
-
- else
-
---
-1.7.1
diff --git a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx-r5.00.18/0001-wl12xx-detect-between-wl1271-PG-3.0-and-lower.patch b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx-r5.00.18/0001-wl12xx-detect-between-wl1271-PG-3.0-and-lower.patch
deleted file mode 100644
index 13bce85..0000000
--- a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx-r5.00.18/0001-wl12xx-detect-between-wl1271-PG-3.0-and-lower.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From f100c47eff6a24a9594702dc72037773f7dd8911 Mon Sep 17 00:00:00 2001
-From: Eyal Reizer <eyalr@ti.com>
-Date: Tue, 29 May 2012 14:45:07 +0300
-Subject: [PATCH] wl12xx: detect between wl1271 PG 3.0 and lower
-
-* Detect between wl1271 PG version 3.0 and lower for using the right
-  firmware with R5 based releases
-* Do not allow activating multi-role on PG 2.0(and lower)
-
-Upstream-Status: Pending
-
-Signed-off-by: Eyal Reizer <eyalr@ti.com>
----
- drivers/net/wireless/wl12xx/main.c |   22 ++++++++++++++++++++--
- 1 files changed, 20 insertions(+), 2 deletions(-)
-
-diff --git a/drivers/net/wireless/wl12xx/main.c b/drivers/net/wireless/wl12xx/main.c
-index 3f05874..db50bf0 100644
---- a/drivers/net/wireless/wl12xx/main.c
-+++ b/drivers/net/wireless/wl12xx/main.c
-@@ -51,6 +51,8 @@
- #include "scan.h"
- #include "version.h"
-
-+#define WL1271_PG_VERSION_2 2
-+#define WL127X_PG20_FW_NAME_SINGLE	"ti-connectivity/wl127x-fw-4-pg2-0-sr.bin"
- #define WL1271_BOOT_RETRIES 3
-
- static struct conf_drv_settings default_conf = {
-@@ -1081,8 +1083,12 @@ static int wl12xx_fetch_firmware(struct wl1271 *wl, bool plt)
-			fw_type = WL12XX_FW_TYPE_NORMAL;
-			if (wl->chip.id == CHIP_ID_1283_PG20)
-				fw_name = WL128X_FW_NAME_SINGLE;
--			else
--				fw_name = WL127X_FW_NAME_SINGLE;
-+			else {
-+				if (wl->hw_pg_ver > WL1271_PG_VERSION_2)
-+					fw_name = WL127X_FW_NAME_SINGLE;
-+				else
-+					fw_name = WL127X_PG20_FW_NAME_SINGLE;
-+			}
-		}
-	}
-
-@@ -2494,6 +2500,18 @@ static int wl1271_op_add_interface(struct ieee80211_hw *hw,
-		goto out;
-	}
-
-+	/*
-+	 * Only WL127x PG 3.0 supports multi-role. Do not allow bringing up more
-+	 * than one interface at a time in-case of using an older version.
-+	 */
-+	if ((wl->chip.id == CHIP_ID_1271_PG20) && (wl->hw_pg_ver <= WL1271_PG_VERSION_2)) {
-+		open_count = ieee80211_get_open_count(hw, vif);
-+		if (open_count) {
-+			wl1271_error("WL127x PG %d.0 doesn't support multi-role",wl->hw_pg_ver + 1);
-+			ret = -EBUSY;
-+			goto out;
-+		}
-+	}
-
-	ret = wl12xx_init_vif_data(wl, vif);
-	if (ret < 0)
---
-1.7.0.4
diff --git a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx-r5.00.18/0002-compat-wireless-enable-test-mode.patch b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx-r5.00.18/0002-compat-wireless-enable-test-mode.patch
deleted file mode 100644
index 556ec8a..0000000
--- a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx-r5.00.18/0002-compat-wireless-enable-test-mode.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From ca17ce77efde9a69ea4d82b86d4d51463d3e2b4a Mon Sep 17 00:00:00 2001
-From: Moosa <moosab@ti.com>
-Date: Thu, 24 May 2012 11:54:06 +0300
-Subject: [PATCH 2/2] compat-wireless: enable test mode
-
-* Enable test mode switch. Needed for the calibration process
-
-Upstream-Status: Pending
-
-Signed-off-by: Moosa Baransi <moosab@ti.com>
----
- config.mk |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/config.mk b/config.mk
-index f09d16d..65b485e 100644
---- a/config.mk
-+++ b/config.mk
-@@ -198,7 +198,7 @@ CONFIG_MAC80211_MESH=y
- CONFIG_CFG80211=m
- CONFIG_CFG80211_DEFAULT_PS=y
- # CONFIG_CFG80211_DEBUGFS=y
--# CONFIG_NL80211_TESTMODE=y
-+CONFIG_NL80211_TESTMODE=y
- # CONFIG_CFG80211_DEVELOPER_WARNINGS=y
- # CONFIG_CFG80211_REG_DEBUG=y
- # CONFIG_CFG80211_INTERNAL_REGDB=y
---
-1.7.1
diff --git a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx-r5.00.18/0002-ti-compat-wireless-enable-uapsd-configuration.patch b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx-r5.00.18/0002-ti-compat-wireless-enable-uapsd-configuration.patch
deleted file mode 100644
index 2cd3502..0000000
--- a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx-r5.00.18/0002-ti-compat-wireless-enable-uapsd-configuration.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 74d34f0573183f3d4971fcae46ed9dadbf514626 Mon Sep 17 00:00:00 2001
-From: Eyal Reizer <eyalr@ti.com>
-Date: Sun, 12 Jun 2011 17:33:09 +0300
-Subject: [PATCH] ti-compat-wireless:enable uapsd configuration
-
-this switch activates the wlan uapsd_queues settings
-
-Signed-off-by: Eyal Reizer <eyalr@ti.com>
----
- config.mk |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/config.mk b/config.mk
-index f4cf832..a464b99 100644
---- a/config.mk
-+++ b/config.mk
-@@ -110,7 +110,7 @@ endif #CONFIG_COMPAT_KERNEL_33
- # Wireless subsystem stuff
- CONFIG_MAC80211=m
-
--# CONFIG_MAC80211_DEBUGFS=y
-+CONFIG_MAC80211_DEBUGFS=y
- # CONFIG_MAC80211_NOINLINE=y
- # CONFIG_MAC80211_VERBOSE_DEBUG=y
- # CONFIG_MAC80211_HT_DEBUG=y
---
-1.7.0.4
diff --git a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx-r5.00.18/0004-added-driver-version.patch b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx-r5.00.18/0004-added-driver-version.patch
deleted file mode 100644
index b118166..0000000
--- a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx-r5.00.18/0004-added-driver-version.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 6147f6523fd3e82b1bed0ea5de1c23cff808a39f Mon Sep 17 00:00:00 2001
-From: Moosa <moosa.baransi@babcomsoftware.com>
-Date: Thu, 29 Dec 2011 09:26:16 +0200
-Subject: [PATCH] added driver version
-
-* Add printing of driver version after printing FW version.
-
-Upstream-Status: Pending
-
-Signed-off-by: Moosa <moosa.baransi@babcomsoftware.com>
----
- drivers/net/wireless/wl12xx/main.c |    2 ++
- 1 files changed, 2 insertions(+), 0 deletions(-)
-
-diff --git a/drivers/net/wireless/wl12xx/main.c b/drivers/net/wireless/wl12xx/main.c
-index aae6a74..fbf754b 100644
---- a/drivers/net/wireless/wl12xx/main.c
-+++ b/drivers/net/wireless/wl12xx/main.c
-@@ -49,6 +49,7 @@
- #include "scan.h"
-
- #define WL1271_BOOT_RETRIES 3
-+#define WLAN_DRIVER_VERSION "R5_00_18"
-
- static struct conf_drv_settings default_conf = {
-	.sg = {
-@@ -2227,6 +2228,7 @@ power_off:
-	wl->state = WL1271_STATE_ON;
-	set_bit(WL1271_FLAG_IF_INITIALIZED, &wl->flags);
-	wl1271_info("firmware booted (%s)", wl->chip.fw_ver_str);
-+	wl1271_info("Driver version: %s", WLAN_DRIVER_VERSION);
-
-	/* update hw/fw version info in wiphy struct */
-	wiphy->hw_version = wl->chip.id;
---
-1.7.0.4
diff --git a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx_r5.00.18.bb b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx_r5.00.18.bb
deleted file mode 100644
index 6b39806..0000000
--- a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx_r5.00.18.bb
+++ /dev/null
@@ -1,49 +0,0 @@
-# This is a TI specific version of the compat-wireless recipe using a
-# compat-wireless package created from the TI Systems Tested mac80211 releases.
-
-DESCRIPTION = "ti compat-wireless drivers"
-HOMEPAGE = "https://gforge.ti.com/gf/project/ecs_nlcp/"
-SECTION = "kernel/modules"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=d7810fab7487fb0aad327b76f1be7cd7"
-
-RDEPENDS_${PN} = "wireless-tools"
-
-inherit module
-
-PR = "${MACHINE_KERNEL_PR}"
-PR_append = "a"
-
-S = "${WORKDIR}/compat-wireless"
-
-SRC_URI = "https://gforge.ti.com/gf/download/frsrelease/864/5621/ti-compat-wireless-wl12xx-2012-05-17-r5-18.tar.gz \
-           file://0001-git-version-use-compat-base-tree.patch \
-           file://0001-compat-wireless-add-pm_runtime_enabled.patch \
-           file://0001-compat-wireless-exclude-BT-building.patch \
-           file://0002-compat-wireless-enable-test-mode.patch \
-           file://0004-added-driver-version.patch \
-           file://0002-ti-compat-wireless-enable-uapsd-configuration.patch \
-           file://0001-wl12xx-detect-between-wl1271-PG-3.0-and-lower.patch \
-           file://0001-wl12xx-additional-two-members-for-wl12xx_platform_da.patch \
-          "
-SRC_URI_append_am335x-evm = "file://0001-wl12xx-Decrease-number-of-RX-transactions.patch \
-                             file://0002-wl12xx-Decrease-number-of-TX-transactions.patch \
-"
-
-SRC_URI[md5sum] = "9b6228d2ad39ece76ec022452df59621"
-SRC_URI[sha256sum] = "c5564cbdb5d89d488be13f8d9310242597728eb1e0918ef64a6fae55dba53f5e"
-
-EXTRA_OEMAKE = "KLIB_BUILD=${STAGING_KERNEL_DIR} KLIB=${D}"
-
-do_configure() {
-    cd ${S}
-    ./scripts/driver-select wl12xx
-}
-
-do_configure_append() {
-    sed -i "s#@./scripts/update-initramfs## " Makefile
-}
-
-do_install() {
-    oe_runmake DEPMOD=echo DESTDIR="${D}" INSTALL_MOD_PATH="${D}" LDFLAGS="" install-modules
-}
diff --git a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx_r5.sp4.01.bb b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx_r5.sp4.01.bb
deleted file mode 100644
index c1d82bb..0000000
--- a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx_r5.sp4.01.bb
+++ /dev/null
@@ -1,66 +0,0 @@
-# This is a TI specific version of the compat-wireless recipe using a
-# compat-wireless package created from the TI Systems Tested mac80211 releases.
-
-DESCRIPTION = "ti compat-wireless drivers"
-HOMEPAGE = "https://gforge.ti.com/gf/project/ecs_nlcp/"
-SECTION = "kernel/modules"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=d7810fab7487fb0aad327b76f1be7cd7"
-
-RDEPENDS_${PN} = "wireless-tools"
-
-inherit module
-
-PR = "${MACHINE_KERNEL_PR}"
-PR_append = "e"
-
-# Tags: ol_R5.SP4.01
-SRCREV_wl12xx = "e96a68476155f1c3576066ab2d0b1417835dfdcf"
-SRCREV_compat = "984ab77279488f3fea4436da76c0f81a618cef1b"
-SRCREV_compat-wireless = "bcc169e624f54e643e182bc6c15b6380b2f8408a"
-
-SRCREV_FORMAT = "compat-wireless"
-
-S = "${WORKDIR}/compat-wireless"
-
-SRC_URI = "git://github.com/TI-OpenLink/compat-wireless.git;destsuffix=compat-wireless;name=compat-wireless \
-           git://github.com/TI-OpenLink/compat.git;destsuffix=compat;name=compat \
-           git://github.com/TI-OpenLink/wl12xx.git;destsuffix=wl12xx;name=wl12xx \
-           file://0001-git-version-use-compat-base-tree.patch;patchdir=../wl12xx \
-           file://0001-compat-wireless-add-pm_runtime_enabled.patch;patchdir=../compat \
-           file://0001-wl12xx-additional-two-members-for-wl12xx_platform_da.patch;patchdir=../wl12xx \
-          "
-
-SRC_URI_append_am335x-evm = "file://0001-wl12xx-Decrease-number-of-RX-transactions.patch;patchdir=../wl12xx \
-                             file://0002-wl12xx-Decrease-number-of-TX-transactions.patch;patchdir=../wl12xx \
-"
-
-EXTRA_OEMAKE = "KLIB_BUILD=${STAGING_KERNEL_DIR} KLIB=${D}"
-
-# Prevent sourceipk adjust_git function from running.
-# This preserves the git repo until driver-select is ran.
-
-adjust_git() {
-    :
-}
-
-do_configure() {
-    cd ${S}
-    GIT_TREE="${WORKDIR}/wl12xx" GIT_COMPAT_TREE="${WORKDIR}/compat" ./scripts/admin-refresh.sh
-
-    ./scripts/driver-select wl12xx
-
-    # Delete the .git repository since it should no longer be needed.
-    rm -rf ${S}/.git ${S}/.gitignore
-
-    # Now generate the sourceipk with the properly configured sources
-    sourceipk_do_create_srcipk
-}
-
-do_configure_append() {
-    sed -i "s#@./scripts/update-initramfs## " Makefile
-}
-
-do_install() {
-    oe_runmake DEPMOD=echo DESTDIR="${D}" INSTALL_MOD_PATH="${D}" LDFLAGS="" install-modules
-}
diff --git a/meta-arago-extras/recipes-bsp/wl12xx-firmware/wl12xx-firmware-r5.sp4.01/Makefile b/meta-arago-extras/recipes-bsp/wl12xx-firmware/wl12xx-firmware-r5.sp4.01/Makefile
deleted file mode 100644
index 0bb7ab8..0000000
--- a/meta-arago-extras/recipes-bsp/wl12xx-firmware/wl12xx-firmware-r5.sp4.01/Makefile
+++ /dev/null
@@ -1,7 +0,0 @@
-# Installs the the ti-connectiviy wlan firmware files into the root file system
-
-install:
-	install -d  $(DEST_DIR)/lib/firmware/ti-connectivity
-	cp -RpP * $(DEST_DIR)/lib/firmware/ti-connectivity/
-	rm -f $(DEST_DIR)/lib/firmware/ti-connectivity/Makefile
-
diff --git a/meta-arago-extras/recipes-bsp/wl12xx-firmware/wl12xx-firmware_r5.00.18.bb b/meta-arago-extras/recipes-bsp/wl12xx-firmware/wl12xx-firmware_r5.00.18.bb
deleted file mode 100644
index 4535c47..0000000
--- a/meta-arago-extras/recipes-bsp/wl12xx-firmware/wl12xx-firmware_r5.00.18.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-DESCRIPTION = "Firmware files for use with TI wl12xx"
-LICENSE = "TI-TSPA"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=ba590e1d103f891d0151609046aef9e8"
-
-PACKAGE_ARCH = "all"
-
-PR = "r1+gitr${SRCPV}"
-
-# This recipe provides the latest firmware files for wl12xx.
-# Therefore, use the contents of this recipe instead of the contents
-# of linux-firmware-wl12xx.
-RCONFLICTS_${PN} = "linux-firmware-wl12xx"
-RPROVIDES_${PN}  = "linux-firmware-wl12xx"
-
-SRCREV = "38e0dd7999b9087e00d1a59306a7c22fd23246cf"
-SRC_URI = "git://github.com/TI-ECS/ti-utils.git;protocol=git"
-
-S = "${WORKDIR}/git/hw/firmware"
-
-do_compile() {
-    :
-}
-
-do_install() {
-    oe_runmake 'DEST_DIR=${D}' install
-}
-
-FILES_${PN} = "/lib/firmware/ti-connectivity/*"
diff --git a/meta-arago-extras/recipes-bsp/wl12xx-firmware/wl12xx-firmware_r5.sp4.01.bb b/meta-arago-extras/recipes-bsp/wl12xx-firmware/wl12xx-firmware_r5.sp4.01.bb
deleted file mode 100644
index 2232e1c..0000000
--- a/meta-arago-extras/recipes-bsp/wl12xx-firmware/wl12xx-firmware_r5.sp4.01.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-DESCRIPTION = "Firmware files for use with TI wl12xx"
-LICENSE = "TI-TSPA"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=ba590e1d103f891d0151609046aef9e8"
-
-PACKAGE_ARCH = "all"
-
-PR = "r3+gitr${SRCPV}"
-
-# This recipe provides the latest firmware files for wl12xx.
-# Therefore, use the contents of this recipe instead of the contents
-# of linux-firmware-wl12xx.
-RCONFLICTS_${PN} = "linux-firmware-wl12xx"
-RPROVIDES_${PN}  = "linux-firmware-wl12xx"
-
-# Tag: ol_R5.SP4.01
-SRCREV = "c8d6b8e6ddf81091e1b1c99ebfb6751cc62b2c63"
-SRC_URI = "git://github.com/TI-OpenLink/ti-utils.git;protocol=git \
-           file://Makefile \
-          "
-
-S = "${WORKDIR}/git/hw/firmware"
-
-do_compile() {
-    :
-}
-
-do_install() {
-    cp ${WORKDIR}/Makefile ${S}
-    oe_runmake 'DEST_DIR=${D}' install
-}
-
-FILES_${PN} = "/lib/firmware/ti-connectivity/*"
diff --git a/meta-arago-extras/recipes-connectivity/battleship/battleship_git.bb b/meta-arago-extras/recipes-connectivity/battleship/battleship_git.bb
deleted file mode 100644
index 545fbc7..0000000
--- a/meta-arago-extras/recipes-connectivity/battleship/battleship_git.bb
+++ /dev/null
@@ -1,48 +0,0 @@
-DESCRIPTION = "Battleship game with wifi direct"
-SECTION = "network"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=75859989545e37968a99b631ef42722e"
-
-PR = "r8"
-
-COMPATIBLE_MACHINE = "(omap3evm|am37x-evm|am335x-evm|am180x-evm|am181x-evm)"
-
-BRANCH = "master"
-SRCREV = "b5d47f31da94545f89b0333b879b533003f5c841"
-PR_append = "+gitr${SRCPV}"
-
-SRC_URI = "git://www.github.com/TI-ECS/battleship.git;protocol=git;branch=${BRANCH} \
-           file://battleship.desktop"
-
-require recipes-core/matrix/matrix-gui-paths.inc
-
-S = "${WORKDIR}/git"
-
-inherit qt4e
-
-PLATFORM_am37x-evm = "omap3evm"
-PLATFORM_omapl138 = "am1808"
-PLATFORM_am335x-evm = "am335x"
-PLATFORM ?= "UNKNOWN"
-
-do_install () {
-       install -d ${D}${bindir}
-       install -m 755 tmp/battleship ${D}/${bindir}/battleship
-       install -d 2755 ${D}${MATRIX_APP_DIR}/battleship
-       install -m 644 ${S}/data/battleship-icon.png ${D}${MATRIX_APP_DIR}/battleship
-       install -m 644 ${WORKDIR}/battleship.desktop ${D}${MATRIX_APP_DIR}/battleship
-}
-
-PACKAGES += "matrix-gui-wifi-battleship-demo"
-
-FILES_${PN} +=" \
-	${bindir}/battleship \
-	"
-
-RDEPENDS_${PN} += "wpa-supplicant wifi-direct-launcher"
-
-FILES_matrix-gui-wifi-battleship-demo += " \
-	${MATRIX_APP_DIR}/battleship/* \
-    "
-
-RDEPENDS_matrix-gui-wifi-battleship-demo += "matrix-gui-apps-images matrix-gui-submenus-wifi ${PN}"
diff --git a/meta-arago-extras/recipes-connectivity/battleship/files/battleship.desktop b/meta-arago-extras/recipes-connectivity/battleship/files/battleship.desktop
deleted file mode 100644
index c6da1a5..0000000
--- a/meta-arago-extras/recipes-connectivity/battleship/files/battleship.desktop
+++ /dev/null
@@ -1,9 +0,0 @@
-#!/usr/bin/env xdg-open
-[Desktop Entry]
-Name=Battleship
-GenericName=Demo App
-Icon=/usr/share/matrix-gui-2.0/apps/battleship/battleship-icon.png
-Type=Application
-Exec=/usr/sbin/wifi-direct-launcher.sh battleship
-Categories=wifi
-X-ProgramType=gui
diff --git a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-r5.00.18/0001-hostapd-change-conf-file-for-better-oob-startup.patch b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-r5.00.18/0001-hostapd-change-conf-file-for-better-oob-startup.patch
deleted file mode 100644
index fa68357..0000000
--- a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-r5.00.18/0001-hostapd-change-conf-file-for-better-oob-startup.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 4c5fe9901219956fb754306a2093e78fb460bbdd Mon Sep 17 00:00:00 2001
-From: Eyal Reizer <eyalr@ti.com>
-Date: Thu, 23 Jun 2011 10:13:44 +0300
-Subject: [PATCH] hostapd: change conf file for better sdk out of box startup
-
-The default hostapd.conf file that is fetched from upstream is using
-a band which is not supported by the 1271 chip.
-I am using this amend.inc in order to modify it to use g band and default
-channel 6 and change the ssid to a more meaningful name.
-
-Upstream-status: inappropriate [SDK specific patch]
-
-Signed-off-by: Eyal Reizer <eyalr@ti.com>
----
- hostapd/hostapd.conf |    6 +++---
- 1 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/hostapd/hostapd.conf b/hostapd/hostapd.conf
-index 6d7263a..bb27beb 100644
---- a/hostapd/hostapd.conf
-+++ b/hostapd/hostapd.conf
-@@ -83,7 +83,7 @@ ctrl_interface_group=0
- ##### IEEE 802.11 related configuration #######################################
-
- # SSID to be used in IEEE 802.11 management frames
--ssid=test
-+ssid=TexasInstruments_0001
-
- # Country code (ISO/IEC 3166-1). Used to set regulatory domain.
- # Set as needed to indicate country in which device is operating.
-@@ -99,14 +99,14 @@ ssid=test
-
- # Operation mode (a = IEEE 802.11a, b = IEEE 802.11b, g = IEEE 802.11g,
- # Default: IEEE 802.11b
--hw_mode=a
-+hw_mode=g
-
- # Channel number (IEEE 802.11)
- # (default: 0, i.e., not set)
- # Please note that some drivers (e.g., madwifi) do not use this value from
- # hostapd and the channel will need to be configuration separately with
- # iwconfig.
--channel=60
-+channel=6
-
- # Beacon interval in kus (1.024 ms) (default: 100; range 15..65535)
- beacon_int=100
---
-1.7.0.4
diff --git a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-r5.sp4.01/0001-hostapd-change-conf-file-for-better-oob-startup.patch b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-r5.sp4.01/0001-hostapd-change-conf-file-for-better-oob-startup.patch
deleted file mode 100644
index 562970e..0000000
--- a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-r5.sp4.01/0001-hostapd-change-conf-file-for-better-oob-startup.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 66b55f187843bca53cb3b7ef9c8fcd434a72f768 Mon Sep 17 00:00:00 2001
-From: Eyal Reizer <eyalr@ti.com>
-Date: Thu, 21 Feb 2013 03:55:22 -0800
-Subject: [PATCH] hostapd: change conf file for better sdk out of box startup
-
-Change the default channel to 6 and change the ssid to a more
-meaningful name.
-
-Upstream-status: inappropriate [SDK specific patch]
-
-Signed-off-by: Eyal Reizer <eyalr@ti.com>
----
- hostapd/hostapd.conf |    4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/hostapd/hostapd.conf b/hostapd/hostapd.conf
-index f71a881..00843aa 100644
---- a/hostapd/hostapd.conf
-+++ b/hostapd/hostapd.conf
-@@ -83,7 +83,7 @@ ctrl_interface_group=0
- ##### IEEE 802.11 related configuration #######################################
- 
- # SSID to be used in IEEE 802.11 management frames
--ssid=test
-+ssid=TexasInstruments_0001
- 
- # Country code (ISO/IEC 3166-1). Used to set regulatory domain.
- # Set as needed to indicate country in which device is operating.
-@@ -107,7 +107,7 @@ hw_mode=g
- # channel will need to be configured separately with iwconfig.
- # When set to 0, automatic channel selection will be engaged. A channel
- # will be selected from the desired hw_mode.
--channel=1
-+channel=6
- 
- # Automatic channel selection (ACS) whitelist
- # (default: not set)
--- 
-1.7.9.5
-
diff --git a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon_r5.00.18.bb b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon_r5.00.18.bb
deleted file mode 100644
index e0c0306..0000000
--- a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon_r5.00.18.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-# This is a TI specific version of the hostap-daemon recipe for use with the
-# wl12xx wlan and bluetooth module.
-
-require hostap.inc
-
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://../COPYING;md5=c54ce9345727175ff66d17b67ff51f58"
-
-PR_append = "b+gitr${SRCPV}"
-
-# Tag: ol_R5.00.18
-SRCREV = "b228361c306aea007672cda115b2701907d8d685"
diff --git a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon_r5.sp4.01.bb b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon_r5.sp4.01.bb
deleted file mode 100644
index b3f38f8..0000000
--- a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon_r5.sp4.01.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-# This is a TI specific version of the hostap-daemon recipe for use with the
-# wl12xx wlan and bluetooth module.
-
-require hostap.inc
-
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://../COPYING;md5=ab87f20cd7e8c0d0a6539b34d3791d0e"
-
-PR_append = "b+gitr${SRCPV}"
-
-# Tag: ol_R5.SP4.01
-SRCREV = "7190ff7dbd43243290b626068ded0d61c5019050"
diff --git a/meta-arago-extras/recipes-connectivity/wifi-direct-demo/files/wifi-direct-demo.desktop b/meta-arago-extras/recipes-connectivity/wifi-direct-demo/files/wifi-direct-demo.desktop
deleted file mode 100644
index 431c956..0000000
--- a/meta-arago-extras/recipes-connectivity/wifi-direct-demo/files/wifi-direct-demo.desktop
+++ /dev/null
@@ -1,9 +0,0 @@
-#!/usr/bin/env xdg-open
-[Desktop Entry]
-Name=WiFi-Direct Demo
-GenericName=Demo App
-Icon=/usr/share/matrix-gui-2.0/apps/wifi-direct-demo/wifi-direct-icon.png
-Type=Application
-Exec=/usr/sbin/wifi-direct-launcher.sh wifi-direct-demo
-Categories=wifi
-X-ProgramType=gui
diff --git a/meta-arago-extras/recipes-connectivity/wifi-direct-demo/files/wifi_exit.sh b/meta-arago-extras/recipes-connectivity/wifi-direct-demo/files/wifi_exit.sh
deleted file mode 100644
index baf436b..0000000
--- a/meta-arago-extras/recipes-connectivity/wifi-direct-demo/files/wifi_exit.sh
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-killall udhcpd
diff --git a/meta-arago-extras/recipes-connectivity/wifi-direct-demo/files/wifi_init.sh b/meta-arago-extras/recipes-connectivity/wifi-direct-demo/files/wifi_init.sh
deleted file mode 100644
index a240e20..0000000
--- a/meta-arago-extras/recipes-connectivity/wifi-direct-demo/files/wifi_init.sh
+++ /dev/null
@@ -1,13 +0,0 @@
-#!/bin/sh
-
-if [ -z  $1 ]
-then
-    echo "start Client"
-    udhcpc -i wlan0
-else
-    echo "start Daemon"
-    echo 1 > /proc/sys/net/ipv4/ip_forward
-    ifconfig wlan0 192.168.0.1
-    udhcpd /etc/udhcpd.conf
-    iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
-fi
diff --git a/meta-arago-extras/recipes-connectivity/wifi-direct-demo/wifi-direct-demo_git.bb b/meta-arago-extras/recipes-connectivity/wifi-direct-demo/wifi-direct-demo_git.bb
deleted file mode 100644
index a36b4d1..0000000
--- a/meta-arago-extras/recipes-connectivity/wifi-direct-demo/wifi-direct-demo_git.bb
+++ /dev/null
@@ -1,52 +0,0 @@
-DESCRIPTION = "Wifi Direct Demo"
-SECTION = "network"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=75859989545e37968a99b631ef42722e"
-
-COMPATIBLE_MACHINE = "(am37x-evm|am335x-evm|am180x-evm|am181x-evm)"
-
-PR = "r7"
-
-BRANCH = "master"
-SRCREV = "1d41618cded6d82b285e14b85b59f3320fb22469"
-
-SRC_URI = "git://www.github.com/TI-ECS/wifi-direct-demo.git;protocol=git;branch=${BRANCH} \
-           file://wifi-direct-demo.desktop"
-
-require recipes-core/matrix/matrix-gui-paths.inc
-
-
-S = "${WORKDIR}/git"
-
-inherit qt4e
-
-PLATFORM_am37x-evm = "omap3evm"
-PLATFORM_omapl138 = "am1808"
-PLATFORM_am335x-evm = "am335x"
-PLATFORM ?= "UNKNOWN"
-
-do_install () {
-       install -d ${D}${bindir}
-       install -m 755 ${S}/scripts/wifi_init.sh ${D}${bindir}/
-       install -m 755 ${S}/scripts/wifi_exit.sh ${D}${bindir}/
-       install -m 755 tmp/wifi-direct-demo ${D}/${bindir}/
-       install -d 2755 ${D}${MATRIX_APP_DIR}/wifi-direct-demo
-       install -m 644 ${S}/images/wifi-direct-icon.png ${D}${MATRIX_APP_DIR}/wifi-direct-demo
-       install -m 644 ${WORKDIR}/wifi-direct-demo.desktop ${D}${MATRIX_APP_DIR}/wifi-direct-demo
-}
-
-PACKAGES += "matrix-gui-wifi-direct-demo"
-
-FILES_${PN} +=" \
-	${bindir}/wifi-direct-demo \
-	${bindir}/wifi_init.sh \
-	${bindir}/wifi_exit.sh \
-	"
-
-RDEPENDS_${PN} += "wpa-supplicant wifi-direct-launcher"
-
-FILES_matrix-gui-wifi-direct-demo += " \
-	${MATRIX_APP_DIR}/wifi-direct-demo/* \
-	"
-
-RDEPENDS_matrix-gui-wifi-direct-demo += "matrix-gui-apps-images matrix-gui-submenus-wifi ${PN}"
diff --git a/meta-arago-extras/recipes-connectivity/wifi-direct-launcher/wifi-direct-launcher/wifi-direct-launcher.sh b/meta-arago-extras/recipes-connectivity/wifi-direct-launcher/wifi-direct-launcher/wifi-direct-launcher.sh
deleted file mode 100644
index 5a94d22..0000000
--- a/meta-arago-extras/recipes-connectivity/wifi-direct-launcher/wifi-direct-launcher/wifi-direct-launcher.sh
+++ /dev/null
@@ -1,13 +0,0 @@
-#check if the wpa_suppicant is already running
-#if it does, stop it.
-StationRunning=`ps | grep -c wpa_supplicant`
-if [ $StationRunning -eq 2 ]; then
-        killall wpa_supplicant
-fi
-
-# Correct dbus permission. Incorrect permission causes dbus (wifi direct demos)
-# dependent demos to fail. 
-chmod u+s /usr/libexec/dbus-daemon-launch-helper
-
-# start the application
-$*
diff --git a/meta-arago-extras/recipes-connectivity/wifi-direct-launcher/wifi-direct-launcher_1.0.bb b/meta-arago-extras/recipes-connectivity/wifi-direct-launcher/wifi-direct-launcher_1.0.bb
deleted file mode 100644
index 28f5590..0000000
--- a/meta-arago-extras/recipes-connectivity/wifi-direct-launcher/wifi-direct-launcher_1.0.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
-
-inherit allarch
-
-PR ="r0"
-
-SRC_URI = "file://wifi-direct-launcher.sh"
-
-S = "${WORKDIR}"
-
-do_install() {
-    install -d ${D}${sbindir}
-    install -m 755 ${WORKDIR}/wifi-direct-launcher.sh ${D}${sbindir}
-}
-
-FILES_${PN} = "/usr/sbin/wifi-direct-launcher.sh"
diff --git a/meta-arago-extras/recipes-connectivity/wl12xx-demo/wl1271-demo/0001-Add-additional-hci0-up.patch b/meta-arago-extras/recipes-connectivity/wl12xx-demo/wl1271-demo/0001-Add-additional-hci0-up.patch
deleted file mode 100644
index 67603dc..0000000
--- a/meta-arago-extras/recipes-connectivity/wl12xx-demo/wl1271-demo/0001-Add-additional-hci0-up.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 3dd9df41002dd57af0c6ad8e4f6d36156b5bd2e0 Mon Sep 17 00:00:00 2001
-From: Franklin S. Cooper Jr <fcooper@ti.com>
-Date: Fri, 31 May 2013 14:05:29 -0500
-Subject: [PATCH] Add additional hci0 up
-
-* After running the Bluetooth GUI BT CLI wasn't initialized properly.
-* Adding hciconfig hci0 up statement fixes this problem.
-
-Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
----
- script/am1808/BT_Init.sh   |    1 +
- script/am335x/BT_Init.sh   |    1 +
- script/omap3evm/BT_Init.sh |    1 +
- 3 files changed, 3 insertions(+), 0 deletions(-)
-
-diff --git a/script/am1808/BT_Init.sh b/script/am1808/BT_Init.sh
-index 1645cbf..5620dc5 100755
---- a/script/am1808/BT_Init.sh
-+++ b/script/am1808/BT_Init.sh
-@@ -22,6 +22,7 @@ modprobe gpio_en
- sleep 2
- hciattach /dev/ttyS1 texas 2000000 & 
- sleep 10
-+hciconfig hci0 up
- hciconfig hci0 piscan &> /dev/null
- agent --path /org/bluez/agent 0000 &> /dev/null &
- sleep 2
-diff --git a/script/am335x/BT_Init.sh b/script/am335x/BT_Init.sh
-index 0e6f714..873cc30 100755
---- a/script/am335x/BT_Init.sh
-+++ b/script/am335x/BT_Init.sh
-@@ -25,6 +25,7 @@ modprobe gpio_en
- sleep 2
- hciattach /dev/ttyO1 texas 3000000 & 
- sleep 5
-+hciconfig hci0 up
- hciconfig hci0 piscan &> /dev/null
- agent --path /org/bluez/agent 0000 &> /dev/null &
- sleep 2
-diff --git a/script/omap3evm/BT_Init.sh b/script/omap3evm/BT_Init.sh
-index 0e6f714..873cc30 100755
---- a/script/omap3evm/BT_Init.sh
-+++ b/script/omap3evm/BT_Init.sh
-@@ -25,6 +25,7 @@ modprobe gpio_en
- sleep 2
- hciattach /dev/ttyO1 texas 3000000 & 
- sleep 5
-+hciconfig hci0 up
- hciconfig hci0 piscan &> /dev/null
- agent --path /org/bluez/agent 0000 &> /dev/null &
- sleep 2
--- 
-1.7.0.4
-
diff --git a/meta-arago-extras/recipes-connectivity/wl12xx-demo/wl1271-demo_git.bb b/meta-arago-extras/recipes-connectivity/wl12xx-demo/wl1271-demo_git.bb
deleted file mode 100644
index bd728a4..0000000
--- a/meta-arago-extras/recipes-connectivity/wl12xx-demo/wl1271-demo_git.bb
+++ /dev/null
@@ -1,48 +0,0 @@
-DESCRIPTION = "Initialization and demo application for bluetooth on WL1271 chipset"
-SECTION = "network"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=bb965abb1955d78452750ca40717999c"
-
-DEPENDS += "openobex"
-RDEPENDS_${PN} += "bluez4 openobex ussp-push obexftp bluez-hcidump obex-client"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-PACKAGE_STRIP = "no"
-
-PR = "r5+gitr${SRCPV}"
-
-BRANCH = "wl12xx"
-SRCREV = "7736f86b8c157ffc3e2a0b9e55a97c093faae14e"
-
-COMPATIBLE_MACHINE = "am37x-evm|am180x-evm|da850-omapl138-evm|am335x-evm"
-
-SRC_URI = "git://github.com/TI-ECS/wl1271-bluetooth.git;protocol=git;branch=${BRANCH} \
-           file://0001-Add-additional-hci0-up.patch \
-"
-
-S = "${WORKDIR}/git"
-
-PLATFORM_am37x-evm = "omap3evm"
-PLATFORM_am180x-evm = "am1808"
-PLATFORM_da850-omapl138-evm = "am1808"
-PLATFORM_am335x-evm = "am335x"
-PLATFORM ?= "UNKNOWN"
-
-do_install () {
-	install -d ${D}${datadir}/wl1271-demos
-	install -d ${D}${datadir}/wl1271-demos/bluetooth
-	install -d ${D}${datadir}/wl1271-demos/bluetooth/gallery
-	install -d ${D}${datadir}/wl1271-demos/bluetooth/scripts
-	install -d ${D}${datadir}/wl1271-demos/bluetooth/ftp_folder
-
-	install -m 0755 ${S}/gallery/* ${D}${datadir}/wl1271-demos/bluetooth/gallery
-	install -m 0755 ${S}/script/common/* ${D}${datadir}/wl1271-demos/bluetooth/scripts
-	install -m 0755 ${S}/script/${PLATFORM}/* ${D}${datadir}/wl1271-demos/bluetooth/scripts
-	install -m 0755 ${S}/ftp_folder/* ${D}${datadir}/wl1271-demos/bluetooth/ftp_folder
-}
-
-FILES_${PN} +=" \
-	${datadir}/wl1271-demos/bluetooth/scripts \
-	${datadir}/wl1271-demos/bluetooth/gallery \
-	${datadir}/wl1271-demos/bluetooth/ftp_folder \
-	"
diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-r5.00.18/0001-wpa_supplicant-dbus-AP-Add-support-for-WPS-Internal-.patch b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-r5.00.18/0001-wpa_supplicant-dbus-AP-Add-support-for-WPS-Internal-.patch
deleted file mode 100644
index 15ec6fe..0000000
--- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-r5.00.18/0001-wpa_supplicant-dbus-AP-Add-support-for-WPS-Internal-.patch
+++ /dev/null
@@ -1,134 +0,0 @@
-From 19030351b95f48714007e425eaa2163d9122d788 Mon Sep 17 00:00:00 2001
-From: Gustavo Sverzut Barbieri <barbieri@profusion.mobi>
-Date: Sun, 18 Dec 2011 17:06:31 +0200
-Subject: [PATCH] wpa_supplicant/dbus AP: Add support for WPS Internal
- Registrar
-
-When in AP mode, wpa_supplicant is now enabling WPS (only Internal
-Registrar). WPS.Start() call can be used to initiate WPS negotiation
-similarly to how this is done in station mode.
-
-This was done to ctrl_iface by Jouni Malinen on April 21, 2009 (commit
-3ec97afe571f159ea95213262c1c6b89965827d4)
-
-Upstream-Status: Submitted [http://lists.shmoo.com/pipermail/hostap/2011-December/024947.html]
-
-Signed-hostap: Gustavo Sverzut Barbieri <barbieri@profusion.mobi>
----
- wpa_supplicant/dbus/dbus_new_handlers_wps.c |   72 +++++++++++++++++++++++++--
- 1 file changed, 67 insertions(+), 5 deletions(-)
-
-diff --git a/wpa_supplicant/dbus/dbus_new_handlers_wps.c b/wpa_supplicant/dbus/dbus_new_handlers_wps.c
-index d8b74d0..a72cfb3 100644
---- a/wpa_supplicant/dbus/dbus_new_handlers_wps.c
-+++ b/wpa_supplicant/dbus/dbus_new_handlers_wps.c
-@@ -19,6 +19,8 @@
- #include "../config.h"
- #include "../wpa_supplicant_i.h"
- #include "../wps_supplicant.h"
-+#include "../driver_i.h"
-+#include "../ap.h"
- #include "dbus_new_helpers.h"
- #include "dbus_new.h"
- #include "dbus_new_handlers.h"
-@@ -30,6 +32,7 @@ struct wps_start_params {
-	int type; /* 0 - not set, 1 - pin,      2 - pbc       */
-	u8 *bssid;
-	char *pin;
-+	u8 *p2p_dev_addr;
- };
-
-
-@@ -148,6 +151,41 @@ static int wpas_dbus_handler_wps_pin(DBusMessage *message,
- }
-
-
-+#ifdef CONFIG_P2P
-+static int wpas_dbus_handler_wps_p2p_dev_addr(DBusMessage *message,
-+					      DBusMessageIter *entry_iter,
-+					      struct wps_start_params *params,
-+					      DBusMessage **reply)
-+{
-+	DBusMessageIter variant_iter, array_iter;
-+	int len;
-+
-+	dbus_message_iter_recurse(entry_iter, &variant_iter);
-+	if (dbus_message_iter_get_arg_type(&variant_iter) != DBUS_TYPE_ARRAY ||
-+	    dbus_message_iter_get_element_type(&variant_iter) !=
-+	    DBUS_TYPE_BYTE) {
-+		wpa_printf(MSG_DEBUG, "dbus: WPS.Start - Wrong "
-+			   "P2PDeviceAddress type, byte array required");
-+		*reply = wpas_dbus_error_invalid_args(
-+			message, "P2PDeviceAddress must be a byte array");
-+		return -1;
-+	}
-+	dbus_message_iter_recurse(&variant_iter, &array_iter);
-+	dbus_message_iter_get_fixed_array(&array_iter, &params->p2p_dev_addr,
-+					  &len);
-+	if (len != ETH_ALEN) {
-+		wpa_printf(MSG_DEBUG, "dbus: WPS.Start - Wrong "
-+			   "P2PDeviceAddress length %d", len);
-+		*reply = wpas_dbus_error_invalid_args(message,
-+						      "P2PDeviceAddress "
-+						      "has wrong length");
-+		return -1;
-+	}
-+	return 0;
-+}
-+#endif /* CONFIG_P2P */
-+
-+
- static int wpas_dbus_handler_wps_start_entry(DBusMessage *message, char *key,
-					     DBusMessageIter *entry_iter,
-					     struct wps_start_params *params,
-@@ -165,6 +203,11 @@ static int wpas_dbus_handler_wps_start_entry(DBusMessage *message, char *key,
-	else if (os_strcmp(key, "Pin") == 0)
-		return wpas_dbus_handler_wps_pin(message, entry_iter,
-						 params, reply);
-+#ifdef CONFIG_P2P
-+	else if (os_strcmp(key, "P2PDeviceAddress") == 0)
-+		return wpas_dbus_handler_wps_p2p_dev_addr(message, entry_iter,
-+							  params, reply);
-+#endif /* CONFIG_P2P */
-
-	wpa_printf(MSG_DEBUG, "dbus: WPS.Start - unknown key %s", key);
-	*reply = wpas_dbus_error_invalid_args(message, key);
-@@ -231,12 +274,31 @@ DBusMessage * wpas_dbus_handler_wps_start(DBusMessage *message,
-		ret = wpas_wps_start_reg(wpa_s, params.bssid, params.pin,
-					 NULL);
-	else if (params.type == 1) {
--		ret = wpas_wps_start_pin(wpa_s, params.bssid, params.pin, 0,
--					 DEV_PW_DEFAULT);
--		if (ret > 0)
--			os_snprintf(npin, sizeof(npin), "%08d", ret);
--	} else
-+#ifdef CONFIG_AP
-+		if (wpa_s->ap_iface)
-+			ret = wpa_supplicant_ap_wps_pin(wpa_s,
-+							params.bssid,
-+							params.pin,
-+							npin, sizeof(npin));
-+		else
-+#endif /* CONFIG_AP */
-+		{
-+			ret = wpas_wps_start_pin(wpa_s, params.bssid,
-+						 params.pin, 0,
-+						 DEV_PW_DEFAULT);
-+			if (ret > 0)
-+				os_snprintf(npin, sizeof(npin), "%08d", ret);
-+		}
-+	} else {
-+#ifdef CONFIG_AP
-+		if (wpa_s->ap_iface)
-+			ret = wpa_supplicant_ap_wps_pbc(wpa_s,
-+							params.bssid,
-+							params.p2p_dev_addr);
-+		else
-+#endif /* CONFIG_AP */
-		ret = wpas_wps_start_pbc(wpa_s, params.bssid, 0);
-+	}
-
-	if (ret < 0) {
-		wpa_printf(MSG_DEBUG, "dbus: WPS.Start wpas_wps_failed in "
---
-1.7.10
diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-r5.00.18/defconfig b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-r5.00.18/defconfig
deleted file mode 100755
index 9b9882a..0000000
--- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-r5.00.18/defconfig
+++ /dev/null
@@ -1,426 +0,0 @@
-# Example wpa_supplicant build time configuration
-#
-# This file lists the configuration options that are used when building the
-# hostapd binary. All lines starting with # are ignored. Configuration option
-# lines must be commented out complete, if they are not to be included, i.e.,
-# just setting VARIABLE=n is not disabling that variable.
-#
-# This file is included in Makefile, so variables like CFLAGS and LIBS can also
-# be modified from here. In most cases, these lines should use += in order not
-# to override previous values of the variables.
-
-
-# Uncomment following two lines and fix the paths if you have installed OpenSSL
-# or GnuTLS in non-default location
-#CFLAGS += -I/usr/local/openssl/include
-#LIBS += -L/usr/local/openssl/lib
-
-# Some Red Hat versions seem to include kerberos header files from OpenSSL, but
-# the kerberos files are not in the default include path. Following line can be
-# used to fix build issues on such systems (krb5.h not found).
-#CFLAGS += -I/usr/include/kerberos
-
-# Example configuration for various cross-compilation platforms
-
-#### sveasoft (e.g., for Linksys WRT54G) ######################################
-#CC=mipsel-uclibc-gcc
-#CC=/opt/brcm/hndtools-mipsel-uclibc/bin/mipsel-uclibc-gcc
-#CFLAGS += -Os
-#CPPFLAGS += -I../src/include -I../../src/router/openssl/include
-#LIBS += -L/opt/brcm/hndtools-mipsel-uclibc-0.9.19/lib -lssl
-###############################################################################
-
-#### openwrt (e.g., for Linksys WRT54G) #######################################
-#CC=mipsel-uclibc-gcc
-#CC=/opt/brcm/hndtools-mipsel-uclibc/bin/mipsel-uclibc-gcc
-#CFLAGS += -Os
-#CPPFLAGS=-I../src/include -I../openssl-0.9.7d/include \
-#	-I../WRT54GS/release/src/include
-#LIBS = -lssl
-###############################################################################
-
-#CC=$(CROSS_COMPILE)gcc
-#CFLAGS += -DCONFIG_LIBNL20
-#CPPFLAGS += -DCONFIG_LIBNL20
-#LIBS += -L$(NFSROOT)/lib -lnl
-#LIBS_p += -L$(NFSROOT)/lib
-#LIBDIR = $(NFSROOT)/lib
-#BINDIR = $(NFSROOT)/usr/sbin
-
-CONFIG_WAPI=y
-CONFIG_LIBNL20=y
-NEED_BGSCAN=y
-CONFIG_BGSCAN_LEARN=y
-
-# Driver interface for Host AP driver
-#CONFIG_DRIVER_HOSTAP=y
-
-# Driver interface for Agere driver
-#CONFIG_DRIVER_HERMES=y
-# Change include directories to match with the local setup
-#CFLAGS += -I../../hcf -I../../include -I../../include/hcf
-#CFLAGS += -I../../include/wireless
-
-# Driver interface for madwifi driver
-# Deprecated; use CONFIG_DRIVER_WEXT=y instead.
-#CONFIG_DRIVER_MADWIFI=y
-# Set include directory to the madwifi source tree
-#CFLAGS += -I../../madwifi
-
-# Driver interface for ndiswrapper
-# Deprecated; use CONFIG_DRIVER_WEXT=y instead.
-#CONFIG_DRIVER_NDISWRAPPER=y
-
-# Driver interface for Atmel driver
-#CONFIG_DRIVER_ATMEL=y
-
-# Driver interface for old Broadcom driver
-# Please note that the newer Broadcom driver ("hybrid Linux driver") supportsBG
-# Linux wireless extensions and does not need (or even work) with the old
-# driver wrapper. Use CONFIG_DRIVER_WEXT=y with that driver.
-#CONFIG_DRIVER_BROADCOM=y
-# Example path for wlioctl.h; change to match your configuration
-#CFLAGS += -I/opt/WRT54GS/release/src/include
-
-# Driver interface for Intel ipw2100/2200 driver
-# Deprecated; use CONFIG_DRIVER_WEXT=y instead.
-#CONFIG_DRIVER_IPW=y
-
-# Driver interface for Ralink driver
-#CONFIG_DRIVER_RALINK=y
-
-# Driver interface for generic Linux wireless extensions
-CONFIG_DRIVER_WEXT=y
-
-# Driver interface for Linux drivers using the nl80211 kernel interface
-CONFIG_DRIVER_NL80211=y
-
-# Driver interface for FreeBSD net80211 layer (e.g., Atheros driver)
-#CONFIG_DRIVER_BSD=y
-#CFLAGS += -I/usr/local/include
-#LIBS += -L/usr/local/lib
-#LIBS_p += -L/usr/local/libBG
-#LIBS_c += -L/usr/local/lib
-
-# Driver interface for Windows NDIS
-#CONFIG_DRIVER_NDIS=y
-#CFLAGS += -I/usr/include/w32api/ddk
-#LIBS += -L/usr/local/lib
-# For native build using mingw
-#CONFIG_NATIVE_WINDOWS=y
-# Additional directories for cross-compilation on Linux host for mingw target
-#CFLAGS += -I/opt/mingw/mingw32/include/ddk
-#LIBS += -L/opt/mingw/mingw32/lib
-#CC=mingw32-gcc
-# By default, driver_ndis uses WinPcap for low-level operations. This can be
-# replaced with the following option which replaces WinPcap calls with NDISUIO.
-# However, this requires that WZC is disabled (net stop wzcsvc) before starting
-# wpa_supplicant.
-# CONFIG_USE_NDISUIO=y
-
-# Driver interface for development testing
-#CONFIG_DRIVER_TEST=y
-
-# Include client MLME (management frame processing) for test driver
-# This can be used to test MLME operations in hostapd with the test interface.
-# space.
-#CONFIG_CLIENT_MLME=y
-
-# Driver interface for wired Ethernet drivers
-CONFIG_DRIVER_WIRED=y
-
-# Driver interface for the Broadcom RoboSwitch family
-#CONFIG_DRIVER_ROBOSWITCH=y
-
-# Driver interface for no driver (e.g., WPS ER only)
-#CONFIG_DRIVER_NONE=y
-
-# Solaris libraries
-#LIBS += -lsocket -ldlpi -lnsl
-#LIBS_c += -lsocket
-
-# Enable IEEE 802.1X Supplicant (automatically included if any EAP method is
-# included)
-CONFIG_IEEE8021X_EAPOL=y
-
-# EAP-MD5
-CONFIG_EAP_MD5=y
-
-# EAP-MSCHAPv2
-CONFIG_EAP_MSCHAPV2=y
-
-# EAP-TLS
-CONFIG_EAP_TLS=y
-
-# EAL-PEAP
-CONFIG_EAP_PEAP=y
-
-# EAP-TTLS
-CONFIG_EAP_TTLS=y
-
-# EAP-FAST
-# Note: Default OpenSSL package does not include support for all the
-# functionality needed for EAP-FAST. If EAP-FAST is enabled with OpenSSL,
-# the OpenSSL library must be patched (openssl-0.9.8d-tls-extensions.patch)
-# to add the needed functions.
-#CONFIG_EAP_FAST=y
-
-# EAP-GTC
-CONFIG_EAP_GTC=y
-
-# EAP-OTP
-CONFIG_EAP_OTP=y
-
-# EAP-SIM (enable CONFIG_PCSC, if EAP-SIM is used)
-#CONFIG_EAP_SIM=y
-
-# EAP-PSK (experimental; this is _not_ needed for WPA-PSK)
-#CONFIG_EAP_PSK=y
-
-# EAP-PAX
-#CONFIG_EAP_PAX=y
-
-# LEAP
-CONFIG_EAP_LEAP=y
-
-# EAP-AKA (enable CONFIG_PCSC, if EAP-AKA is used)
-#CONFIG_EAP_AKA=y
-
-# EAP-AKA' (enable CONFIG_PCSC, if EAP-AKA' is used).
-# This requires CONFIG_EAP_AKA to be enabled, too.
-#CONFIG_EAP_AKA_PRIME=y
-
-# Enable USIM simulator (Milenage) for EAP-AKA
-#CONFIG_USIM_SIMULATOR=y
-
-# EAP-SAKE
-#CONFIG_EAP_SAKE=y
-
-# EAP-GPSK
-#CONFIG_EAP_GPSK=y
-# Include support for optional SHA256 cipher suite in EAP-GPSK
-#CONFIG_EAP_GPSK_SHA256=y
-
-# EAP-TNC and related Trusted Network Connect support (experimental)
-#CONFIG_EAP_TNC=y
-
-# Wi-Fi Protected Setup (WPS)
-CONFIG_WPS=y
-# Enable WSC 2.0 support
-CONFIG_WPS2=y
-
-# EAP-IKEv2
-#CONFIG_EAP_IKEV2=y
-
-# PKCS#12 (PFX) support (used to read private key and certificate file from
-# a file that usually has extension .p12 or .pfx)
-CONFIG_PKCS12=y
-
-# Smartcard support (i.e., private key on a smartcard), e.g., with openssl
-# engine.
-CONFIG_SMARTCARD=y
-
-# PC/SC interface for smartcards (USIM, GSM SIM)
-# Enable this if EAP-SIM or EAP-AKA is included
-#CONFIG_PCSC=y
-
-# Development testingBG
-#CONFIG_EAPOL_TEST=y
-
-# Select control interface backend for external programs, e.g, wpa_cli:
-# unix = UNIX domain sockets (default for Linux/*BSD)
-# udp = UDP sockets using localhost (127.0.0.1)
-# named_pipe = Windows Named Pipe (default for Windows)
-# y = use default (backwards compatibility)
-# If this option is commented out, control interface is not included in the
-# build.
-CONFIG_CTRL_IFACE=y
-
-# Include support for GNU Readline and History Libraries in wpa_cli.
-# When building a wpa_cli binary for distribution, please note that these
-# libraries are licensed under GPL and as such, BSD license may not apply for
-# the resulting binary.
-#CONFIG_READLINE=y
-
-# Remove debugging code that is printing out debug message to stdout.
-# This can be used to reduce the size of the wpa_supplicant considerably
-# if debugging code is not needed. The size reduction can be around 35%
-# (e.g., 90 kB).
-#CONFIG_NO_STDOUT_DEBUG=y
-
-# Remove WPA support, e.g., for wired-only IEEE 802.1X supplicant, to save
-# 35-50 kB in code size.
-#CONFIG_NO_WPA=y
-
-# Remove WPA2 support. This allows WPA to be used, but removes WPA2 code to
-# save about 1 kB in code size when building only WPA-Personal (no EAP support)
-# or 6 kB if building for WPA-Enterprise.
-#CONFIG_NO_WPA2=y
-
-# Remove IEEE 802.11i/WPA-Personal ASCII passphrase support
-# This option can be used to reduce code size by removing support for
-# converting ASCII passphrases into PSK. If this functionality is removed, the
-# PSK can only be configured as the 64-octet hexstring (e.g., from
-# wpa_passphrase). This saves about 0.5 kB in code size.
-#CONFIG_NO_WPA_PASSPHRASE=y
-
-# Disable scan result processing (ap_mode=1) to save code size by about 1 kB.
-# This can be used if ap_scan=1 mode is never enabled.
-#CONFIG_NO_SCAN_PROCESSING=y
-
-# Select configuration backend:
-# file = text file (e.g., wpa_supplicant.conf; note: the configuration file
-#	path is given on command line, not here; this option is just used to
-#	select the backend that allows configuration files to be used)
-# winreg = Windows registry (see win_example.reg for an example)
-CONFIG_BACKEND=file
-
-# Remove configuration write functionality (i.e., to allow the configuration
-# file to be updated based on runtime configuration changes). The runtime
-# configuration can still be changed, the changes are just not going to be
-# persistent over restarts. This option can be used to reduce code size by
-# about 3.5 kB.
-#CONFIG_NO_CONFIG_WRITE=y
-
-# Remove support for configuration blobs to reduce code size by about 1.5 kB.
-#CONFIG_NO_CONFIG_BLOBS=y
-
-# Select program entry point implementation:
-# main = UNIX/POSIX like main() function (default)
-# main_winsvc = Windows service (read parameters from registry)
-# main_none = Very basic example (development use only)
-#CONFIG_MAIN=main
-
-# Select wrapper for operatins system and C library specific functions
-# unix = UNIX/POSIX like systems (default)
-# win32 = Windows systems
-# none = Empty template
-#CONFIG_OS=unix
-
-# Select event loop implementation
-# eloop = select() loop (default)
-# eloop_win = Windows events and WaitForMultipleObject() loop
-# eloop_none = Empty template
-#CONFIG_ELOOP=eloop
-
-# Select layer 2 packet implementation
-# linux = Linux packet socket (default)
-# pcap = libpcap/libdnet/WinPcap
-# freebsd = FreeBSD libpcap
-# winpcap = WinPcap with receive thread
-# ndis = Windows NDISUIO (note: requires CONFIG_USE_NDISUIO=y)
-# none = Empty template
-#CONFIG_L2_PACKET=linux
-
-# PeerKey handshake for Station to Station Link (IEEE 802.11e DLS)
-CONFIG_PEERKEY=y
-
-# IEEE 802.11w (management frame protection)
-# This version is an experimental implementation based on IEEE 802.11w/D1.0
-# draft and is subject to change since the standard has not yet been finalized.
-# Driver support is also needed for IEEE 802.11w.
-#CONFIG_IEEE80211W=y
-
-# Select TLS implementation
-# openssl = OpenSSL (default)
-# gnutls = GnuTLS (needed for TLS/IA, see also CONFIG_GNUTLS_EXTRA)
-# internal = Internal TLSv1 implementation (experimental)
-# none = Empty template
-#CONFIG_TLS=openssl
-
-# Whether to enable TLS/IA support, which is required for EAP-TTLSv1.
-# You need CONFIG_TLS=gnutls for this to have any effect. Please note that
-# even though the core GnuTLS library is released under LGPL, this extra
-# library uses GPL and as such, the terms of GPL apply to the combination
-# of wpa_supplicant and GnuTLS if this option is enabled. BSD license may not
-# apply for distribution of the resulting binary.
-#CONFIG_GNUTLS_EXTRA=y
-
-# If CONFIG_TLS=internal is used, additional library and include paths are
-# needed for LibTomMath. Alternatively, an integrated, minimal version of
-# LibTomMath can be used. See beginning of libtommath.c for details on benefits
-# and drawbacks of this option.
-#CONFIG_INTERNAL_LIBTOMMATH=y
-#ifndef CONFIG_INTERNAL_LIBTOMMATH
-#LTM_PATH=/usr/src/libtommath-0.39
-#CFLAGS += -I$(LTM_PATH)
-#LIBS += -L$(LTM_PATH)
-#LIBS_p += -L$(LTM_PATH)
-#endif
-# At the cost of about 4 kB of additional binary size, the internal LibTomMath
-# can be configured to include faster routines for exptmod, sqr, and div to
-# speed up DH and RSA calculation considerably
-#CONFIG_INTERNAL_LIBTOMMATH_FAST=y
-
-# Include NDIS event processing through WMI into wpa_supplicant/wpasvc.
-# This is only for Windows builds and requires WMI-related header files and
-# WbemUuid.Lib from Platform SDK even when building with MinGW.
-#CONFIG_NDIS_EVENTS_INTEGRATED=y
-#PLATFORMSDKLIB="/opt/Program Files/Microsoft Platform SDK/Lib"
-
-# Add support for old DBus control interface
-# (fi.epitest.hostap.WPASupplicant)
-CONFIG_CTRL_IFACE_DBUS=y
-
-# Add support for new DBus control interface
-# (fi.w1.hostap.wpa_supplicant1)
-CONFIG_CTRL_IFACE_DBUS_NEW=y
-
-# Add introspection support for new DBus control interface
-CONFIG_CTRL_IFACE_DBUS_INTRO=y
-
-# Add support for loading EAP methods dynamically as shared libraries.
-# When this option is enabled, each EAP method can be either included
-# statically (CONFIG_EAP_<method>=y) or dynamically (CONFIG_EAP_<method>=dyn).
-# Dynamic EAP methods are build as shared objects (eap_*.so) and they need to
-# be loaded in the beginning of the wpa_supplicant configuration file
-# (see load_dynamic_eap parameter in the example file) before being used in
-# the network blocks.
-#
-# Note that some shared parts of EAP methods are included in the main program
-# and in order to be able to use dynamic EAP methods using these parts, the
-# main program must have been build with the EAP method enabled (=y or =dyn).
-# This means that EAP-TLS/PEAP/TTLS/FAST cannot be added as dynamic libraries
-# unless at least one of them was included in the main build to force inclusion
-# of the shared code. Similarly, at least one of EAP-SIM/AKA must be included
-# in the main build to be able to load these methods dynamically.
-#
-# Please also note that using dynamic libraries will increase the total binary
-# size. Thus, it may not be the best option for targets that have limited
-# amount of memory/flash.
-#CONFIG_DYNAMIC_EAP_METHODS=y
-
-# IEEE Std 802.11r-2008 (Fast BSS Transition)
-#CONFIG_IEEE80211R=y
-
-# Add support for writing debug log to a file (/tmp/wpa_supplicant-log-#.txt)
-CONFIG_DEBUG_FILE=y
-
-# Enable privilege separation (see README 'Privilege separation' for details)
-#CONFIG_PRIVSEP=y
-
-# Enable mitigation against certain attacks against TKIP by delaying Michael
-# MIC error reports by a random amount of time between 0 and 60 seconds
-#CONFIG_DELAYED_MIC_ERROR_REPORT=y
-
-# Enable tracing code for developer debugging
-# This tracks use of memory allocations and other registrations and reports
-# incorrect use with a backtrace of call (or allocation) location.
-#CONFIG_WPA_TRACE=y
-# For BSD, comment out these.
-#LIBS += -lexecinfo
-#LIBS_p += -lexecinfo
-#LIBS_c += -lexecinfo
-
-# Use libbfd to get more details for developer debugging
-# This enables use of libbfd to get more detailed symbols for the backtraces
-# generated by CONFIG_WPA_TRACE=y.
-#CONFIG_WPA_TRACE_BFD=y
-# For BSD, comment out these.
-#LIBS += -lbfd -liberty -lz
-#LIBS_p += -lbfd -liberty -lz
-#LIBS_c += -lbfd -liberty -lz
-
-# for p2p
-CONFIG_P2P=y
-CONFIG_AP=y
diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-r5.sp4.01/defconfig b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-r5.sp4.01/defconfig
deleted file mode 100755
index b982e2a..0000000
--- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-r5.sp4.01/defconfig
+++ /dev/null
@@ -1,430 +0,0 @@
-# Example wpa_supplicant build time configuration
-#
-# This file lists the configuration options that are used when building the
-# hostapd binary. All lines starting with # are ignored. Configuration option
-# lines must be commented out complete, if they are not to be included, i.e.,
-# just setting VARIABLE=n is not disabling that variable.
-#
-# This file is included in Makefile, so variables like CFLAGS and LIBS can also
-# be modified from here. In most cases, these lines should use += in order not
-# to override previous values of the variables.
-
-
-# Uncomment following two lines and fix the paths if you have installed OpenSSL
-# or GnuTLS in non-default location
-#CFLAGS += -I/usr/local/openssl/include
-#LIBS += -L/usr/local/openssl/lib
-
-# Some Red Hat versions seem to include kerberos header files from OpenSSL, but
-# the kerberos files are not in the default include path. Following line can be
-# used to fix build issues on such systems (krb5.h not found).
-#CFLAGS += -I/usr/include/kerberos
-
-# Example configuration for various cross-compilation platforms
-
-#### sveasoft (e.g., for Linksys WRT54G) ######################################
-#CC=mipsel-uclibc-gcc
-#CC=/opt/brcm/hndtools-mipsel-uclibc/bin/mipsel-uclibc-gcc
-#CFLAGS += -Os
-#CPPFLAGS += -I../src/include -I../../src/router/openssl/include
-#LIBS += -L/opt/brcm/hndtools-mipsel-uclibc-0.9.19/lib -lssl
-###############################################################################
-
-#### openwrt (e.g., for Linksys WRT54G) #######################################
-#CC=mipsel-uclibc-gcc
-#CC=/opt/brcm/hndtools-mipsel-uclibc/bin/mipsel-uclibc-gcc
-#CFLAGS += -Os
-#CPPFLAGS=-I../src/include -I../openssl-0.9.7d/include \
-#	-I../WRT54GS/release/src/include
-#LIBS = -lssl
-###############################################################################
-
-#CC=$(CROSS_COMPILE)gcc
-#CFLAGS += -DCONFIG_LIBNL20
-#CPPFLAGS += -DCONFIG_LIBNL20
-#LIBS += -L$(NFSROOT)/lib -lnl
-#LIBS_p += -L$(NFSROOT)/lib
-#LIBDIR = $(NFSROOT)/lib
-#BINDIR = $(NFSROOT)/usr/sbin
-
-CONFIG_WAPI=y
-CONFIG_LIBNL20=y
-NEED_BGSCAN=y
-CONFIG_BGSCAN_LEARN=y
-
-# Driver interface for Host AP driver
-#CONFIG_DRIVER_HOSTAP=y
-
-# Driver interface for Agere driver
-#CONFIG_DRIVER_HERMES=y
-# Change include directories to match with the local setup
-#CFLAGS += -I../../hcf -I../../include -I../../include/hcf
-#CFLAGS += -I../../include/wireless
-
-# Driver interface for madwifi driver
-# Deprecated; use CONFIG_DRIVER_WEXT=y instead.
-#CONFIG_DRIVER_MADWIFI=y
-# Set include directory to the madwifi source tree
-#CFLAGS += -I../../madwifi
-
-# Driver interface for ndiswrapper
-# Deprecated; use CONFIG_DRIVER_WEXT=y instead.
-#CONFIG_DRIVER_NDISWRAPPER=y
-
-# Driver interface for Atmel driver
-#CONFIG_DRIVER_ATMEL=y
-
-# Driver interface for old Broadcom driver
-# Please note that the newer Broadcom driver ("hybrid Linux driver") supportsBG
-# Linux wireless extensions and does not need (or even work) with the old
-# driver wrapper. Use CONFIG_DRIVER_WEXT=y with that driver.
-#CONFIG_DRIVER_BROADCOM=y
-# Example path for wlioctl.h; change to match your configuration
-#CFLAGS += -I/opt/WRT54GS/release/src/include
-
-# Driver interface for Intel ipw2100/2200 driver
-# Deprecated; use CONFIG_DRIVER_WEXT=y instead.
-#CONFIG_DRIVER_IPW=y
-
-# Driver interface for Ralink driver
-#CONFIG_DRIVER_RALINK=y
-
-# Driver interface for generic Linux wireless extensions
-CONFIG_DRIVER_WEXT=y
-
-# Driver interface for Linux drivers using the nl80211 kernel interface
-CONFIG_DRIVER_NL80211=y
-
-# Driver interface for FreeBSD net80211 layer (e.g., Atheros driver)
-#CONFIG_DRIVER_BSD=y
-#CFLAGS += -I/usr/local/include
-#LIBS += -L/usr/local/lib
-#LIBS_p += -L/usr/local/libBG
-#LIBS_c += -L/usr/local/lib
-
-# Driver interface for Windows NDIS
-#CONFIG_DRIVER_NDIS=y
-#CFLAGS += -I/usr/include/w32api/ddk
-#LIBS += -L/usr/local/lib
-# For native build using mingw
-#CONFIG_NATIVE_WINDOWS=y
-# Additional directories for cross-compilation on Linux host for mingw target
-#CFLAGS += -I/opt/mingw/mingw32/include/ddk
-#LIBS += -L/opt/mingw/mingw32/lib
-#CC=mingw32-gcc
-# By default, driver_ndis uses WinPcap for low-level operations. This can be
-# replaced with the following option which replaces WinPcap calls with NDISUIO.
-# However, this requires that WZC is disabled (net stop wzcsvc) before starting
-# wpa_supplicant.
-# CONFIG_USE_NDISUIO=y
-
-# Driver interface for development testing
-#CONFIG_DRIVER_TEST=y
-
-# Include client MLME (management frame processing) for test driver
-# This can be used to test MLME operations in hostapd with the test interface.
-# space.
-#CONFIG_CLIENT_MLME=y
-
-# Driver interface for wired Ethernet drivers
-CONFIG_DRIVER_WIRED=y
-
-# Driver interface for the Broadcom RoboSwitch family
-#CONFIG_DRIVER_ROBOSWITCH=y
-
-# Driver interface for no driver (e.g., WPS ER only)
-#CONFIG_DRIVER_NONE=y
-
-# Solaris libraries
-#LIBS += -lsocket -ldlpi -lnsl
-#LIBS_c += -lsocket
-
-# Enable IEEE 802.1X Supplicant (automatically included if any EAP method is
-# included)
-CONFIG_IEEE8021X_EAPOL=y
-
-# EAP-MD5
-CONFIG_EAP_MD5=y
-
-# EAP-MSCHAPv2
-CONFIG_EAP_MSCHAPV2=y
-
-# EAP-TLS
-CONFIG_EAP_TLS=y
-
-# EAL-PEAP
-CONFIG_EAP_PEAP=y
-
-# EAP-TTLS
-CONFIG_EAP_TTLS=y
-
-# EAP-FAST
-# Note: Default OpenSSL package does not include support for all the
-# functionality needed for EAP-FAST. If EAP-FAST is enabled with OpenSSL,
-# the OpenSSL library must be patched (openssl-0.9.8d-tls-extensions.patch)
-# to add the needed functions.
-#CONFIG_EAP_FAST=y
-
-# EAP-GTC
-CONFIG_EAP_GTC=y
-
-# EAP-OTP
-CONFIG_EAP_OTP=y
-
-# EAP-SIM (enable CONFIG_PCSC, if EAP-SIM is used)
-#CONFIG_EAP_SIM=y
-
-# EAP-PSK (experimental; this is _not_ needed for WPA-PSK)
-#CONFIG_EAP_PSK=y
-
-# EAP-PAX
-#CONFIG_EAP_PAX=y
-
-# LEAP
-CONFIG_EAP_LEAP=y
-
-# EAP-AKA (enable CONFIG_PCSC, if EAP-AKA is used)
-#CONFIG_EAP_AKA=y
-
-# EAP-AKA' (enable CONFIG_PCSC, if EAP-AKA' is used).
-# This requires CONFIG_EAP_AKA to be enabled, too.
-#CONFIG_EAP_AKA_PRIME=y
-
-# Enable USIM simulator (Milenage) for EAP-AKA
-#CONFIG_USIM_SIMULATOR=y
-
-# EAP-SAKE
-#CONFIG_EAP_SAKE=y
-
-# EAP-GPSK
-#CONFIG_EAP_GPSK=y
-# Include support for optional SHA256 cipher suite in EAP-GPSK
-#CONFIG_EAP_GPSK_SHA256=y
-
-# EAP-TNC and related Trusted Network Connect support (experimental)
-#CONFIG_EAP_TNC=y
-
-# Wi-Fi Protected Setup (WPS)
-CONFIG_WPS=y
-# Enable WSC 2.0 support
-CONFIG_WPS2=y
-
-# EAP-IKEv2
-#CONFIG_EAP_IKEV2=y
-
-# PKCS#12 (PFX) support (used to read private key and certificate file from
-# a file that usually has extension .p12 or .pfx)
-CONFIG_PKCS12=y
-
-# Smartcard support (i.e., private key on a smartcard), e.g., with openssl
-# engine.
-CONFIG_SMARTCARD=y
-
-# PC/SC interface for smartcards (USIM, GSM SIM)
-# Enable this if EAP-SIM or EAP-AKA is included
-#CONFIG_PCSC=y
-
-# Development testingBG
-#CONFIG_EAPOL_TEST=y
-
-# Select control interface backend for external programs, e.g, wpa_cli:
-# unix = UNIX domain sockets (default for Linux/*BSD)
-# udp = UDP sockets using localhost (127.0.0.1)
-# named_pipe = Windows Named Pipe (default for Windows)
-# y = use default (backwards compatibility)
-# If this option is commented out, control interface is not included in the
-# build.
-CONFIG_CTRL_IFACE=y
-
-# Include support for GNU Readline and History Libraries in wpa_cli.
-# When building a wpa_cli binary for distribution, please note that these
-# libraries are licensed under GPL and as such, BSD license may not apply for
-# the resulting binary.
-#CONFIG_READLINE=y
-
-# Remove debugging code that is printing out debug message to stdout.
-# This can be used to reduce the size of the wpa_supplicant considerably
-# if debugging code is not needed. The size reduction can be around 35%
-# (e.g., 90 kB).
-#CONFIG_NO_STDOUT_DEBUG=y
-
-# Remove WPA support, e.g., for wired-only IEEE 802.1X supplicant, to save
-# 35-50 kB in code size.
-#CONFIG_NO_WPA=y
-
-# Remove WPA2 support. This allows WPA to be used, but removes WPA2 code to
-# save about 1 kB in code size when building only WPA-Personal (no EAP support)
-# or 6 kB if building for WPA-Enterprise.
-#CONFIG_NO_WPA2=y
-
-# Remove IEEE 802.11i/WPA-Personal ASCII passphrase support
-# This option can be used to reduce code size by removing support for
-# converting ASCII passphrases into PSK. If this functionality is removed, the
-# PSK can only be configured as the 64-octet hexstring (e.g., from
-# wpa_passphrase). This saves about 0.5 kB in code size.
-#CONFIG_NO_WPA_PASSPHRASE=y
-
-# Disable scan result processing (ap_mode=1) to save code size by about 1 kB.
-# This can be used if ap_scan=1 mode is never enabled.
-#CONFIG_NO_SCAN_PROCESSING=y
-
-# Select configuration backend:
-# file = text file (e.g., wpa_supplicant.conf; note: the configuration file
-#	path is given on command line, not here; this option is just used to
-#	select the backend that allows configuration files to be used)
-# winreg = Windows registry (see win_example.reg for an example)
-CONFIG_BACKEND=file
-
-# Remove configuration write functionality (i.e., to allow the configuration
-# file to be updated based on runtime configuration changes). The runtime
-# configuration can still be changed, the changes are just not going to be
-# persistent over restarts. This option can be used to reduce code size by
-# about 3.5 kB.
-#CONFIG_NO_CONFIG_WRITE=y
-
-# Remove support for configuration blobs to reduce code size by about 1.5 kB.
-#CONFIG_NO_CONFIG_BLOBS=y
-
-# Select program entry point implementation:
-# main = UNIX/POSIX like main() function (default)
-# main_winsvc = Windows service (read parameters from registry)
-# main_none = Very basic example (development use only)
-#CONFIG_MAIN=main
-
-# Select wrapper for operatins system and C library specific functions
-# unix = UNIX/POSIX like systems (default)
-# win32 = Windows systems
-# none = Empty template
-#CONFIG_OS=unix
-
-# Select event loop implementation
-# eloop = select() loop (default)
-# eloop_win = Windows events and WaitForMultipleObject() loop
-# eloop_none = Empty template
-#CONFIG_ELOOP=eloop
-
-# Select layer 2 packet implementation
-# linux = Linux packet socket (default)
-# pcap = libpcap/libdnet/WinPcap
-# freebsd = FreeBSD libpcap
-# winpcap = WinPcap with receive thread
-# ndis = Windows NDISUIO (note: requires CONFIG_USE_NDISUIO=y)
-# none = Empty template
-#CONFIG_L2_PACKET=linux
-
-# PeerKey handshake for Station to Station Link (IEEE 802.11e DLS)
-CONFIG_PEERKEY=y
-
-# IEEE 802.11w (management frame protection)
-# This version is an experimental implementation based on IEEE 802.11w/D1.0
-# draft and is subject to change since the standard has not yet been finalized.
-# Driver support is also needed for IEEE 802.11w.
-#CONFIG_IEEE80211W=y
-
-# Select TLS implementation
-# openssl = OpenSSL (default)
-# gnutls = GnuTLS (needed for TLS/IA, see also CONFIG_GNUTLS_EXTRA)
-# internal = Internal TLSv1 implementation (experimental)
-# none = Empty template
-#CONFIG_TLS=openssl
-
-# Whether to enable TLS/IA support, which is required for EAP-TTLSv1.
-# You need CONFIG_TLS=gnutls for this to have any effect. Please note that
-# even though the core GnuTLS library is released under LGPL, this extra
-# library uses GPL and as such, the terms of GPL apply to the combination
-# of wpa_supplicant and GnuTLS if this option is enabled. BSD license may not
-# apply for distribution of the resulting binary.
-#CONFIG_GNUTLS_EXTRA=y
-
-# If CONFIG_TLS=internal is used, additional library and include paths are
-# needed for LibTomMath. Alternatively, an integrated, minimal version of
-# LibTomMath can be used. See beginning of libtommath.c for details on benefits
-# and drawbacks of this option.
-#CONFIG_INTERNAL_LIBTOMMATH=y
-#ifndef CONFIG_INTERNAL_LIBTOMMATH
-#LTM_PATH=/usr/src/libtommath-0.39
-#CFLAGS += -I$(LTM_PATH)
-#LIBS += -L$(LTM_PATH)
-#LIBS_p += -L$(LTM_PATH)
-#endif
-# At the cost of about 4 kB of additional binary size, the internal LibTomMath
-# can be configured to include faster routines for exptmod, sqr, and div to
-# speed up DH and RSA calculation considerably
-#CONFIG_INTERNAL_LIBTOMMATH_FAST=y
-
-# Include NDIS event processing through WMI into wpa_supplicant/wpasvc.
-# This is only for Windows builds and requires WMI-related header files and
-# WbemUuid.Lib from Platform SDK even when building with MinGW.
-#CONFIG_NDIS_EVENTS_INTEGRATED=y
-#PLATFORMSDKLIB="/opt/Program Files/Microsoft Platform SDK/Lib"
-
-# Add support for old DBus control interface
-# (fi.epitest.hostap.WPASupplicant)
-CONFIG_CTRL_IFACE_DBUS=y
-
-# Add support for new DBus control interface
-# (fi.w1.hostap.wpa_supplicant1)
-CONFIG_CTRL_IFACE_DBUS_NEW=y
-
-# Add introspection support for new DBus control interface
-CONFIG_CTRL_IFACE_DBUS_INTRO=y
-
-# Add support for loading EAP methods dynamically as shared libraries.
-# When this option is enabled, each EAP method can be either included
-# statically (CONFIG_EAP_<method>=y) or dynamically (CONFIG_EAP_<method>=dyn).
-# Dynamic EAP methods are build as shared objects (eap_*.so) and they need to
-# be loaded in the beginning of the wpa_supplicant configuration file
-# (see load_dynamic_eap parameter in the example file) before being used in
-# the network blocks.
-#
-# Note that some shared parts of EAP methods are included in the main program
-# and in order to be able to use dynamic EAP methods using these parts, the
-# main program must have been build with the EAP method enabled (=y or =dyn).
-# This means that EAP-TLS/PEAP/TTLS/FAST cannot be added as dynamic libraries
-# unless at least one of them was included in the main build to force inclusion
-# of the shared code. Similarly, at least one of EAP-SIM/AKA must be included
-# in the main build to be able to load these methods dynamically.
-#
-# Please also note that using dynamic libraries will increase the total binary
-# size. Thus, it may not be the best option for targets that have limited
-# amount of memory/flash.
-#CONFIG_DYNAMIC_EAP_METHODS=y
-
-# IEEE Std 802.11r-2008 (Fast BSS Transition)
-#CONFIG_IEEE80211R=y
-
-# Add support for writing debug log to a file (/tmp/wpa_supplicant-log-#.txt)
-CONFIG_DEBUG_FILE=y
-
-# Enable privilege separation (see README 'Privilege separation' for details)
-#CONFIG_PRIVSEP=y
-
-# Enable mitigation against certain attacks against TKIP by delaying Michael
-# MIC error reports by a random amount of time between 0 and 60 seconds
-#CONFIG_DELAYED_MIC_ERROR_REPORT=y
-
-# Enable tracing code for developer debugging
-# This tracks use of memory allocations and other registrations and reports
-# incorrect use with a backtrace of call (or allocation) location.
-#CONFIG_WPA_TRACE=y
-# For BSD, comment out these.
-#LIBS += -lexecinfo
-#LIBS_p += -lexecinfo
-#LIBS_c += -lexecinfo
-
-# Use libbfd to get more details for developer debugging
-# This enables use of libbfd to get more detailed symbols for the backtraces
-# generated by CONFIG_WPA_TRACE=y.
-#CONFIG_WPA_TRACE_BFD=y
-# For BSD, comment out these.
-#LIBS += -lbfd -liberty -lz
-#LIBS_p += -lbfd -liberty -lz
-#LIBS_c += -lbfd -liberty -lz
-
-# for p2p
-CONFIG_P2P=y
-CONFIG_AP=y
-
-# IEEE 802.11n (High Throughput) support
-CONFIG_IEEE80211N=y
-
diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant_r5.00.18.bb b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant_r5.00.18.bb
deleted file mode 100644
index b8c2d51..0000000
--- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant_r5.00.18.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-# This is a TI specific version of the wpa-supplicant recipe for use with the
-# wl12xx wlan and bluetooth module.
-
-require wpa-supplicant.inc
-
-LIC_FILES_CHKSUM = "file://../COPYING;md5=c54ce9345727175ff66d17b67ff51f58 \
-                    file://../README;md5=79cddd95f8b7539aced400f6aab996e9 \
-                    file://wpa_supplicant.c;beginline=1;endline=17;md5=009c87d612d92175fe8cd1e93137bf42"
-
-# Tag: ol_R5.00.18
-SRCREV = "b228361c306aea007672cda115b2701907d8d685"
-PR_append = "b+gitr${SRCPV}"
-
-SRC_URI += "file://0001-wpa_supplicant-dbus-AP-Add-support-for-WPS-Internal-.patch;patchdir=.. "
diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant_r5.sp4.01.bb b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant_r5.sp4.01.bb
deleted file mode 100644
index 2fc77a5..0000000
--- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant_r5.sp4.01.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-# This is a TI specific version of the wpa-supplicant recipe for use with the
-# wl12xx wlan and bluetooth module.
-
-require wpa-supplicant.inc
-
-LIC_FILES_CHKSUM = "file://../COPYING;md5=ab87f20cd7e8c0d0a6539b34d3791d0e \
-                    file://../README;md5=5cb758942d25f6f61fd4ac388fd446fa \
-                    file://wpa_supplicant.c;beginline=1;endline=17;md5=8835156c8ab8cad6356ec7f39ebe3aba"
-
-
-# Tag: ol_R5.SP4.01
-SRCREV = "7190ff7dbd43243290b626068ded0d61c5019050"
-PR_append = "b+gitr${SRCPV}"
diff --git a/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils.inc b/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils.inc
deleted file mode 100644
index cdb3746..0000000
--- a/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils.inc
+++ /dev/null
@@ -1,29 +0,0 @@
-DESCRIPTION = "The calibrator and other useful utilities for TI wireless solution based on wl12xx driver"
-LICENSE = "BSD"
-
-DEPENDS = "libnl"
-RDEPENDS_${PN} = "ti-compat-wireless-wl12xx wl12xx-firmware"
-
-PR ="r1"
-
-SRC_URI = "git://github.com/TI-OpenLink/ti-utils.git;protocol=git"
-
-S = "${WORKDIR}/git"
-
-export CROSS_COMPILE = "${TARGET_PREFIX}"
-CFLAGS += " -DCONFIG_LIBNL20"
-
-do_install() {
-	install -d ${D}${bindir}
-	install -d ${D}${datadir}/ti/wifi-utils/ini_files/127x
-	install -d ${D}${datadir}/ti/wifi-utils/ini_files/128x
-
-	install -m 0755 calibrator ${D}${bindir}/
-	install -m 0755 ${S}/hw/ini_files/127x/* ${D}${datadir}/ti/wifi-utils/ini_files/127x
-	install -m 0755 ${S}/hw/ini_files/128x/* ${D}${datadir}/ti/wifi-utils/ini_files/128x
-}
-
-FILES_${PN} += " \
-	${datadir}/ti/wifi-utils/ini_files/127x \
-	${datadir}/ti/wifi-utils/ini_files/128x \
-"
diff --git a/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils_r5.00.18.bb b/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils_r5.00.18.bb
deleted file mode 100644
index 6d3560f..0000000
--- a/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils_r5.00.18.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require ti-wifi-utils.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=4725015cb0be7be389cf06deeae3683d"
-
-PR_append ="b+gitr${SRCPV}"
-
-# Tag: ol_R5.00.18
-SRCREV = "b42044175ca7262cd3e8f76d59dce46fe857ccb6"
diff --git a/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils_r5.sp3.05.bb b/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils_r5.sp3.05.bb
deleted file mode 100644
index c04286d..0000000
--- a/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils_r5.sp3.05.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require ti-wifi-utils.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=4725015cb0be7be389cf06deeae3683d"
-
-PR_append ="c+gitr${SRCPV}"
-
-# Tag: ol_R5.SP3.05
-SRCREV = "e6dcb896facd7b3c422fd2bb4d10765ee691ceb4"
-
-RDEPENDS_${PN}_am335x-evm_append = " wilink-calibrate"
-- 
1.7.0.4


