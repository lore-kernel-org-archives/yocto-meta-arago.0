Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f52.google.com (mail-oa0-f52.google.com
	[209.85.219.52])
	by arago-project.org (Postfix) with ESMTPS id C468A52A99
	for <meta-arago@arago-project.org>;
	Mon, 28 Jan 2013 17:26:18 +0000 (UTC)
Received: by mail-oa0-f52.google.com with SMTP id k14so2274007oag.11
	for <meta-arago@arago-project.org>;
	Mon, 28 Jan 2013 09:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=1bX/5+E199H1iA7vAeAiGO+1qXA/eBz1oaDOV+E5w+Y=;
	b=T8Vab3StntJbdAXCzL1edzsv9nUfGK/I3WJVGjJEWa8EW8c1F8rtUCvxHIYtECciaj
	CiPGTd6CM9Ba0r7GPhGN+uRggmAh5PlLzSUk17sfqXfyJNr9bQ9EtrEpF+xkauctbsq4
	V4NSFwRA72SW6otRR97Utn6ZDMk5Bpk2zQq8dy9xuG+7MMb9Zk6EDqACeeATlpjxw0NP
	AmvNHTdGg4+ZXNCQOM8IHjJS4z3kXmhWj4FjFPpPS5t19Afj3Dpq9cVnZMHbEnMKMYIr
	qzVB1+tT4dFDlRfl4Wj9SCFJlJM9Pp3wSfT5tqIF4hZWuaRfajmeXwYN0m2uklADwJ7V
	FbfQ==
X-Received: by 10.60.27.199 with SMTP id v7mr11670777oeg.23.1359393978190;
	Mon, 28 Jan 2013 09:26:18 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id m3sm8149180obm.21.2013.01.28.09.26.16
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 28 Jan 2013 09:26:17 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Mon, 28 Jan 2013 11:25:22 -0600
Message-Id: <1359393932-31361-22-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1359393932-31361-1-git-send-email-fcooper@ti.com>
References: <1359393932-31361-1-git-send-email-fcooper@ti.com>
Cc: Eyal Reizer <eyalr@ti.com>
Subject: [PATCH 22/32] ti-compat-wireless: remove driver version print
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
X-List-Received-Date: Mon, 28 Jan 2013 17:26:19 -0000

From: Eyal Reizer <eyalr@ti.com>

* Remove a driver version print when bringing up the interface.
  This info is now shown when the wl12xx module is being inserted
  and hence this path is redundant.
---
 .../files/0004-added-driver-version.patch          |   36 --------------------
 .../ti-compat-wireless-wl12xx_r5.bb                |    3 +-
 2 files changed, 1 insertions(+), 38 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0004-added-driver-version.patch

diff --git a/meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0004-added-driver-version.patch b/meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0004-added-driver-version.patch
deleted file mode 100644
index b118166..0000000
--- a/meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0004-added-driver-version.patch
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
diff --git a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx_r5.bb b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx_r5.bb
index 9b68254..ca70ea9 100644
--- a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx_r5.bb
+++ b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx_r5.bb
@@ -15,7 +15,7 @@ PV = "0.${TAG}"
 inherit module
 
 PR = "${MACHINE_KERNEL_PR}"
-PR_append = "a"
+PR_append = "b"
 
 COMPAT_WIRELESS_VERSION = "2012-11-18-r5-sp3"
 
@@ -25,7 +25,6 @@ SRC_URI = "https://gforge.ti.com/gf/download/frsrelease/994/6330/ti-compat-wirel
            file://0001-compat-wireless-add-pm_runtime_enabled.patch \
            file://0001-compat-wireless-exclude-BT-building.patch \
            file://0002-compat-wireless-enable-test-mode.patch \
-           file://0004-added-driver-version.patch \
            file://0002-ti-compat-wireless-enable-uapsd-configuration.patch \
            file://0001-wl12xx-additional-two-members-for-wl12xx_platform_da.patch \
            file://0001-git-version-use-compat-base-tree.patch \
-- 
1.7.0.4


