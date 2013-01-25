Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f174.google.com (mail-ob0-f174.google.com
	[209.85.214.174])
	by arago-project.org (Postfix) with ESMTPS id 27BBA529AA
	for <meta-arago@arago-project.org>;
	Fri, 25 Jan 2013 21:56:55 +0000 (UTC)
Received: by mail-ob0-f174.google.com with SMTP id 16so1035406obc.5
	for <meta-arago@arago-project.org>;
	Fri, 25 Jan 2013 13:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=w8UmHUCF+nLsrT4ZDqOFni+T6mJg7o3jf1zys1NfAnk=;
	b=EvBt14p9PHljzrJGvatK5TWCeQyJ3NuVzrmylN4YX5mlI5iYWmv1GIgKZKldzcuYE9
	xvD4aKOshzJfIMYoVbG92pmtaQLSShTrEMJxuIw7uTyAItEw/AopclcvMpkCe8WNriQ4
	ktNTgvXBm25DoYNFyP9FuAW5AmulHWGeN1Jw8/AYvex7ilZmcl/emfSxNlpHAXVmLlpS
	QwtGYI6ywRg7rixPUwi5sKzwFg92rskKzYXLatkzs/1XBgWudPoBqdop1F8woYOcxpi1
	bHW0SdL9uwG63XW4NjPcsMufpme5fOjIEsiRztvnatLVYsql0jvqojlijPcgW9AvucP1
	y0+A==
X-Received: by 10.60.169.207 with SMTP id ag15mr5580298oec.120.1359151014398; 
	Fri, 25 Jan 2013 13:56:54 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id y4sm1625632oea.7.2013.01.25.13.56.52
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 13:56:53 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Fri, 25 Jan 2013 15:53:43 -0600
Message-Id: <1359150851-23602-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1359150851-23602-1-git-send-email-fcooper@ti.com>
References: <1359150851-23602-1-git-send-email-fcooper@ti.com>
Cc: Eyal Reizer <eyalr@ti.com>
Subject: [PATCH 03/31] ti-compat-wireless-wl12xx: update for wlan r5_sp3 release
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
X-List-Received-Date: Fri, 25 Jan 2013 21:56:55 -0000

From: Eyal Reizer <eyalr@ti.com>

* Update the recipe to use the new wlan r5_sp3 release

Signed-off-by: Eyal Reizer <eyalr@ti.com>
---
 .../0001-git-version-use-compat-base-tree.patch    |   29 +++++
 ...xx-detect-between-wl1271-PG-3.0-and-lower.patch |   65 ----------
 ...wl12xx-Decrease-number-of-TX-transactions.patch |  126 ++++++++++----------
 ...xx_r5_18.bb => ti-compat-wireless-wl12xx_r5.bb} |   10 +-
 4 files changed, 99 insertions(+), 131 deletions(-)
 create mode 100755 meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0001-git-version-use-compat-base-tree.patch
 delete mode 100644 meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0001-wl12xx-detect-between-wl1271-PG-3.0-and-lower.patch
 rename meta-arago-extras/recipes-bsp/ti-compat-wireless/{ti-compat-wireless-wl12xx_r5_18.bb => ti-compat-wireless-wl12xx_r5.bb} (79%)

diff --git a/meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0001-git-version-use-compat-base-tree.patch b/meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0001-git-version-use-compat-base-tree.patch
new file mode 100755
index 0000000..61fe912
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0001-git-version-use-compat-base-tree.patch
@@ -0,0 +1,29 @@
+For compat-wireless based  builds use compat_base_tree_version in  version.h
+When building with compat-wireless mechanism, the version info captured in version.h reflects target kernel and not the wl12xx version.
+Signed-off-by: Vishal Mahaveer <vishalm@ti.com>
+
+diff  a/drivers/net/wireless/wl12xx/Makefile b/drivers/net/wireless/wl12xx/Makefile
+
+--- a/drivers/net/wireless/wl12xx/Makefile 2012-08-12 18:18:10.000000000 +0300
++++ b/drivers/net/wireless/wl12xx/Makefile 2012-08-13 13:55:11.000000000 +0300
+@@ -3,12 +3,16 @@
+ 
+ define filechk_version.h
+ 	(echo 'static const char *wl12xx_timestamp = __TIMESTAMP__;'; \
+-	echo 'static const char *wl12xx_git_head = \
+-			"$(shell git describe --dirty)";')
++         echo '#ifdef COMPAT_BASE_TREE_VERSION'; \
++         echo 'static const char *wl12xx_git_head =  COMPAT_BASE_TREE_VERSION;'; \
++         echo '#else'; \
++         echo 'static const char *wl12xx_git_head = \
++                        "$(shell git describe --dirty)";'; \
++         echo '#endif')
+ endef
+ 
+-$(obj)/version.h: .git/HEAD .git/index .git/refs/tags
+-	@$(call filechk,version.h)
++#$(obj)/version.h: .git/HEAD .git/index .git/refs/tags
++#	@$(call filechk,version.h)
+ 
+ $(obj)/main.c: $(src)/version.h
+ 
diff --git a/meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0001-wl12xx-detect-between-wl1271-PG-3.0-and-lower.patch b/meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0001-wl12xx-detect-between-wl1271-PG-3.0-and-lower.patch
deleted file mode 100644
index 13bce85..0000000
--- a/meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0001-wl12xx-detect-between-wl1271-PG-3.0-and-lower.patch
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
diff --git a/meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0002-wl12xx-Decrease-number-of-TX-transactions.patch b/meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0002-wl12xx-Decrease-number-of-TX-transactions.patch
index 344f06f..3e2185a 100755
--- a/meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0002-wl12xx-Decrease-number-of-TX-transactions.patch
+++ b/meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0002-wl12xx-Decrease-number-of-TX-transactions.patch
@@ -1,7 +1,7 @@
-From 35d7ab5678ce2287b681cb2735ec4307f3f83a6b Mon Sep 17 00:00:00 2001
-From: Ido Yariv <ido@wizery.com>
-Date: Tue, 13 Dec 2011 23:28:12 +0200
-Subject: [PATCH 2/2] wl12xx: Decrease number of TX transactions
+From a7807fffc76117a9d0a40fdcc85b56644e81f34c Mon Sep 17 00:00:00 2001
+From: Eyal Reizer <eyalr@ti.com>
+Date: Tue, 27 Nov 2012 16:05:20 +0200
+Subject: [PATCH] wl12xx: Decrease number of TX transactions
 
 On weak platforms, it is crucial to keep the number of SDIO transactions
 to a bare minimum. It is probably more important to keep CPU utilization
@@ -14,49 +14,52 @@ packets.
 
 In addition, increase the TX pacing timeout, so the FW will have enough
 free memory blocks for larger transfers.
+
+Adapted from original patch made by Ido Yariv <ido@wizery.com>
+Signed-off-by: Eyal Reizer <eyalr@ti.com>
 ---
- drivers/net/wireless/wl12xx/main.c   |   39 ++++++++++++++++++++++++++++++---
- drivers/net/wireless/wl12xx/wl12xx.h |    3 ++
+ drivers/net/wireless/wl12xx/main.c   |   39 ++++++++++++++++++++++++++++++----
+ drivers/net/wireless/wl12xx/wl12xx.h |    3 +++
  2 files changed, 38 insertions(+), 4 deletions(-)
 
 diff --git a/drivers/net/wireless/wl12xx/main.c b/drivers/net/wireless/wl12xx/main.c
-index f90b96a..e65eb5d 100644
+index c9888f4..a59ac43 100644
 --- a/drivers/net/wireless/wl12xx/main.c
 +++ b/drivers/net/wireless/wl12xx/main.c
-@@ -211,8 +211,8 @@ static struct conf_drv_settings default_conf = {
-			},
-		},
-		.frag_threshold              = IEEE80211_MAX_FRAG_THRESHOLD,
+@@ -218,8 +218,8 @@ static struct conf_drv_settings default_conf = {
+ 			},
+ 		},
+ 		.frag_threshold              = IEEE80211_MAX_FRAG_THRESHOLD,
 -		.tx_compl_timeout            = 700,
 -		.tx_compl_threshold          = 4,
 +		.tx_compl_timeout            = 1500,
 +		.tx_compl_threshold          = 6,
-		.basic_rate                  = CONF_HW_BIT_RATE_1MBPS,
-		.basic_rate_5                = CONF_HW_BIT_RATE_6MBPS,
-		.tmpl_short_retry_limit      = 10,
-@@ -994,6 +994,8 @@ static irqreturn_t wl1271_irq(int irq, void *cookie)
-			spin_lock_irqsave(&wl->wl_lock, flags);
-			if (!test_bit(WL1271_FLAG_FW_TX_BUSY, &wl->flags) &&
-			    wl1271_tx_total_queue_count(wl) > 0) {
+ 		.basic_rate                  = CONF_HW_BIT_RATE_1MBPS,
+ 		.basic_rate_5                = CONF_HW_BIT_RATE_6MBPS,
+ 		.tmpl_short_retry_limit      = 10,
+@@ -1199,6 +1199,8 @@ static int wl12xx_irq_locked(struct wl1271 *wl)
+ 			spin_lock_irqsave(&wl->wl_lock, flags);
+ 			if (!test_bit(WL1271_FLAG_FW_TX_BUSY, &wl->flags) &&
+ 			    wl1271_tx_total_queue_count(wl) > 0) {
 +				hrtimer_try_to_cancel(&wl->tx_timer);
 +				clear_bit(WL1271_FLAG_TX_TIMER_SET, &wl->flags);
-				spin_unlock_irqrestore(&wl->wl_lock, flags);
-				/*
-				 * In order to avoid starvation of the TX path,
-@@ -1536,6 +1538,9 @@ out:
-	return ret;
+ 				spin_unlock_irqrestore(&wl->wl_lock, flags);
+ 				/*
+ 				 * In order to avoid starvation of the TX path,
+@@ -2056,6 +2058,9 @@ out:
+ 	return ret;
  }
-
+ 
 +#define TX_PACKETS_THRESHOLD	6
 +#define TX_WORK_DELAY_NS	(1500 * 1000)
 +
  static void wl1271_op_tx(struct ieee80211_hw *hw, struct sk_buff *skb)
  {
-	struct wl1271 *wl = hw->priv;
-@@ -1584,14 +1589,37 @@ static void wl1271_op_tx(struct ieee80211_hw *hw, struct sk_buff *skb)
-	 * before that, the tx_work will not be initialized!
-	 */
-
+ 	struct wl1271 *wl = hw->priv;
+@@ -2113,14 +2118,37 @@ static void wl1271_op_tx(struct ieee80211_hw *hw, struct sk_buff *skb)
+ 	 * before that, the tx_work will not be initialized!
+ 	 */
+ 
 -	if (!test_bit(WL1271_FLAG_FW_TX_BUSY, &wl->flags) &&
 -	    !test_bit(WL1271_FLAG_TX_PENDING, &wl->flags))
 +	if (test_bit(WL1271_FLAG_FW_TX_BUSY, &wl->flags) ||
@@ -71,13 +74,13 @@ index f90b96a..e65eb5d 100644
 +	} else {
 +		hrtimer_try_to_cancel(&wl->tx_timer);
 +		clear_bit(WL1271_FLAG_TX_TIMER_SET, &wl->flags);
-		ieee80211_queue_work(wl->hw, &wl->tx_work);
+ 		ieee80211_queue_work(wl->hw, &wl->tx_work);
 +	}
-
+ 
  out:
-	spin_unlock_irqrestore(&wl->wl_lock, flags);
+ 	spin_unlock_irqrestore(&wl->wl_lock, flags);
  }
-
+ 
 +enum hrtimer_restart wl12xx_tx_timer(struct hrtimer *timer)
 +{
 +	struct wl1271 *wl = container_of(timer, struct wl1271, tx_timer);
@@ -92,44 +95,45 @@ index f90b96a..e65eb5d 100644
 +
  int wl1271_tx_dummy_packet(struct wl1271 *wl)
  {
-	unsigned long flags;
-@@ -2162,6 +2190,7 @@ static void wl1271_op_stop(struct ieee80211_hw *hw)
-	 * functions don't perform further work.
-	 */
-	wl->state = WL1271_STATE_OFF;
+ 	unsigned long flags;
+@@ -2740,6 +2768,7 @@ static void wl1271_op_stop_locked(struct wl1271 *wl)
+ 	 * held while doing so without deadlocking.
+ 	 */
+ 	wlcore_disable_interrupts_nosync(wl);
 +	hrtimer_cancel(&wl->tx_timer);
-	mutex_unlock(&wl->mutex);
-
-	mutex_lock(&wl_list_mutex);
-@@ -5835,6 +5864,8 @@ static struct ieee80211_hw *wl1271_alloc_hw(void)
-	wl->active_sta_count = 0;
-	wl->fwlog_size = 0;
-	init_waitqueue_head(&wl->fwlog_waitq);
+ 	mutex_unlock(&wl->mutex);
+ 
+ 	mutex_lock(&wl_list_mutex);
+@@ -6798,6 +6827,8 @@ static struct ieee80211_hw *wl1271_alloc_hw(void)
+ 	wl->active_sta_count = 0;
+ 	wl->fwlog_size = 0;
+ 	init_waitqueue_head(&wl->fwlog_waitq);
 +	hrtimer_init(&wl->tx_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
 +	wl->tx_timer.function = wl12xx_tx_timer;
-
-	/* The system link is always allocated */
-	__set_bit(WL12XX_SYSTEM_HLID, wl->links_map);
+ 
+ 	/* The system link is always allocated */
+ 	__set_bit(WL12XX_SYSTEM_HLID, wl->links_map);
 diff --git a/drivers/net/wireless/wl12xx/wl12xx.h b/drivers/net/wireless/wl12xx/wl12xx.h
-index 269fadf..437526f 100644
+index 9c00dbf..e34f095 100644
 --- a/drivers/net/wireless/wl12xx/wl12xx.h
 +++ b/drivers/net/wireless/wl12xx/wl12xx.h
-@@ -265,6 +265,7 @@ enum wl12xx_flags {
-	WL1271_FLAG_RECOVERY_IN_PROGRESS,
-	WL1271_FLAG_VIF_CHANGE_IN_PROGRESS,
-	WL1271_FLAG_INTENDED_FW_RECOVERY,
+@@ -275,6 +275,7 @@ enum wl12xx_flags {
+ 	WL1271_FLAG_VIF_CHANGE_IN_PROGRESS,
+ 	WL1271_FLAG_INTENDED_FW_RECOVERY,
+ 	WL1271_FLAG_IO_FAILED,
 +	WL1271_FLAG_TX_TIMER_SET,
  };
-
+ 
  enum wl12xx_vif_flags {
-@@ -552,6 +553,8 @@ struct wl1271 {
-	struct list_head peers_list;
-
-	bool watchdog_recovery;
+@@ -594,6 +595,8 @@ struct wl1271 {
+ 
+ 	/* Patterns configured with set_rx_filters */
+ 	struct cfg80211_wowlan *wowlan_patterns;
 +
 +	struct hrtimer tx_timer;
  };
-
+ 
  struct wl1271_station {
---
-1.7.7.6
+-- 
+1.7.9.5
+
diff --git a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx_r5_18.bb b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx_r5.bb
similarity index 79%
rename from meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx_r5_18.bb
rename to meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx_r5.bb
index 51c2a83..9b68254 100644
--- a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx_r5_18.bb
+++ b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx_r5.bb
@@ -17,25 +17,25 @@ inherit module
 PR = "${MACHINE_KERNEL_PR}"
 PR_append = "a"
 
-COMPAT_WIRELESS_VERSION = "2012-05-15-r5-18"
+COMPAT_WIRELESS_VERSION = "2012-11-18-r5-sp3"
 
 S = "${WORKDIR}/compat-wireless"
 
-SRC_URI = "https://gforge.ti.com/gf/download/frsrelease/864/5621/ti-compat-wireless-wl12xx-2012-05-17-r5-18.tar.gz \
+SRC_URI = "https://gforge.ti.com/gf/download/frsrelease/994/6330/ti-compat-wireless-R5_SP3.05.tar.gz \
            file://0001-compat-wireless-add-pm_runtime_enabled.patch \
            file://0001-compat-wireless-exclude-BT-building.patch \
            file://0002-compat-wireless-enable-test-mode.patch \
            file://0004-added-driver-version.patch \
            file://0002-ti-compat-wireless-enable-uapsd-configuration.patch \
-           file://0001-wl12xx-detect-between-wl1271-PG-3.0-and-lower.patch \
            file://0001-wl12xx-additional-two-members-for-wl12xx_platform_da.patch \
+           file://0001-git-version-use-compat-base-tree.patch \
           "
 SRC_URI_append_am335x-evm = "file://0001-wl12xx-Decrease-number-of-RX-transactions.patch \
                              file://0002-wl12xx-Decrease-number-of-TX-transactions.patch \
 "
 
-SRC_URI[md5sum] = "9b6228d2ad39ece76ec022452df59621"
-SRC_URI[sha256sum] = "c5564cbdb5d89d488be13f8d9310242597728eb1e0918ef64a6fae55dba53f5e"
+SRC_URI[md5sum] = "3d86e0cbd0e2f07d09bf3cd52b6b2f98"
+SRC_URI[sha256sum] = "927e4a6f8397973c7ed30dada28a661b76486004756beef38176fda35370dd83"
 
 EXTRA_OEMAKE = "KLIB_BUILD=${STAGING_KERNEL_DIR} KLIB=${D}"
 
-- 
1.7.0.4


