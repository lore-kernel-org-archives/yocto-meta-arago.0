Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 2A445529AF
	for <meta-arago@arago-project.org>;
	Wed, 20 Mar 2013 02:05:53 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2K25pQZ023816
	for <meta-arago@arago-project.org>; Tue, 19 Mar 2013 21:05:52 -0500
Received: from DBDE71.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2K25oJk022958
	for <meta-arago@arago-project.org>;
	Wed, 20 Mar 2013 07:35:50 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by DBDE71.ent.ti.com
	(172.24.170.149) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 20 Mar 2013 07:35:50 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2K25epJ026167;
	Wed, 20 Mar 2013 07:35:49 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 19 Mar 2013 21:05:27 -0500
Message-ID: <1363745138-10288-6-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1363745138-10288-1-git-send-email-fcooper@ti.com>
References: <1363745138-10288-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 06/17] ti-compat-wireless-wl12xx: Pull in older ti-compat-wireless-wl12xx release
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
X-List-Received-Date: Wed, 20 Mar 2013 02:05:53 -0000
Content-Type: text/plain

* Current am180x-evm ships with a PG 2 wilink 6 module that isn't supported in
  newer wilink 6 releases.
* A newer PG 3 wilink 6 module is available for am180x-evm but needs to be
  purchased separately..
* Bring old r5.00.18 ti-compat-wireless-wl12xx recipe with updated recipe name
  to add support for am180x-evm default wilink 6 module.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../0001-compat-wireless-exclude-BT-building.patch |   29 +++++++++
 ...xx-detect-between-wl1271-PG-3.0-and-lower.patch |   65 ++++++++++++++++++++
 .../0002-compat-wireless-enable-test-mode.patch    |   29 +++++++++
 ...ompat-wireless-enable-uapsd-configuration.patch |   27 ++++++++
 .../0004-added-driver-version.patch                |   36 +++++++++++
 .../ti-compat-wireless-wl12xx_r5.00.18.bb          |   49 +++++++++++++++
 6 files changed, 235 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx-r5.00.18/0001-compat-wireless-exclude-BT-building.patch
 create mode 100644 meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx-r5.00.18/0001-wl12xx-detect-between-wl1271-PG-3.0-and-lower.patch
 create mode 100644 meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx-r5.00.18/0002-compat-wireless-enable-test-mode.patch
 create mode 100644 meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx-r5.00.18/0002-ti-compat-wireless-enable-uapsd-configuration.patch
 create mode 100644 meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx-r5.00.18/0004-added-driver-version.patch
 create mode 100644 meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx_r5.00.18.bb

diff --git a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx-r5.00.18/0001-compat-wireless-exclude-BT-building.patch b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx-r5.00.18/0001-compat-wireless-exclude-BT-building.patch
new file mode 100644
index 0000000..731da28
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx-r5.00.18/0001-compat-wireless-exclude-BT-building.patch
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
diff --git a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx-r5.00.18/0001-wl12xx-detect-between-wl1271-PG-3.0-and-lower.patch b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx-r5.00.18/0001-wl12xx-detect-between-wl1271-PG-3.0-and-lower.patch
new file mode 100644
index 0000000..13bce85
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx-r5.00.18/0001-wl12xx-detect-between-wl1271-PG-3.0-and-lower.patch
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
diff --git a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx-r5.00.18/0002-compat-wireless-enable-test-mode.patch b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx-r5.00.18/0002-compat-wireless-enable-test-mode.patch
new file mode 100644
index 0000000..556ec8a
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx-r5.00.18/0002-compat-wireless-enable-test-mode.patch
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
diff --git a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx-r5.00.18/0002-ti-compat-wireless-enable-uapsd-configuration.patch b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx-r5.00.18/0002-ti-compat-wireless-enable-uapsd-configuration.patch
new file mode 100644
index 0000000..2cd3502
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx-r5.00.18/0002-ti-compat-wireless-enable-uapsd-configuration.patch
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
diff --git a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx-r5.00.18/0004-added-driver-version.patch b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx-r5.00.18/0004-added-driver-version.patch
new file mode 100644
index 0000000..b118166
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx-r5.00.18/0004-added-driver-version.patch
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
diff --git a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx_r5.00.18.bb b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx_r5.00.18.bb
new file mode 100644
index 0000000..6b39806
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx_r5.00.18.bb
@@ -0,0 +1,49 @@
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
+inherit module
+
+PR = "${MACHINE_KERNEL_PR}"
+PR_append = "a"
+
+S = "${WORKDIR}/compat-wireless"
+
+SRC_URI = "https://gforge.ti.com/gf/download/frsrelease/864/5621/ti-compat-wireless-wl12xx-2012-05-17-r5-18.tar.gz \
+           file://0001-git-version-use-compat-base-tree.patch \
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


