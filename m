Return-Path: <fcooperjr27@gmail.com>
Received: from mail-qe0-f45.google.com (mail-qe0-f45.google.com
	[209.85.128.45])
	by arago-project.org (Postfix) with ESMTPS id C325552A3B
	for <meta-arago@arago-project.org>;
	Mon, 18 Mar 2013 14:02:35 +0000 (UTC)
Received: by mail-qe0-f45.google.com with SMTP id b4so3376332qen.32
	for <meta-arago@arago-project.org>;
	Mon, 18 Mar 2013 07:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=xaQjXZBSY/JrqfmiiSIXpukSB4wZah1OOyMG0dxcEeQ=;
	b=PSSHXHK4G0yChut00b6amG3gBXypQj3bLEmj2xHc0ipqTNIOX0tXJWszZ3QQAKZSQB
	amBFRa1BvrD+xqBxAQ1L8BFo6CLTZ9xDrkzP8DeawMKOiBuClqK0RQsTkq2nBaelfTaX
	6padXkCQbZLrG4A/ujr9IEEbooDM26Jvw6CZCz5IsFZCYCLQFuGIzBR/5woEpFKqpGVi
	NHP47M/JjuBh4vOXBdbiMghpFrqJIJy9+sz1U/fcPgOmg+dtYOk6cdD93p58VwbQRekp
	ujtsXFDX7tbp3ZUmfeKPw+EumJ3yz5oF3DW9WbrCL+u3YwISt8weIk0DQJ9DffshpX+i
	kXEg==
X-Received: by 10.49.59.105 with SMTP id y9mr22765882qeq.41.1363615353915;
	Mon, 18 Mar 2013 07:02:33 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id t3sm32492548qen.5.2013.03.18.07.02.31
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 18 Mar 2013 07:02:32 -0700 (PDT)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Mon, 18 Mar 2013 09:02:22 -0500
Message-Id: <1363615345-6416-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 1/4] ti-compat-wireless-wl12xx: modifiy for using r5.sp4.01 release
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
X-List-Received-Date: Mon, 18 Mar 2013 14:02:38 -0000

From: Eyal Reizer <eyalr@ti.com>

* Modify the recipe to fetch a new wlan driver version (ol_R5.SP4.01)
* as described in "http://wireless.kernel.org/en/users/Download/hacking"
  we are extracting a compat package so it can be compiled with
  different kernels.
  In our case the same compat-wireless package compiles with the
  am335,am37,am18 which use different Linux versions.
  Until now this process was done manually and the resulted zip
  (compat-wireless.zip) was placed in a temporary location in g-forge
  and fetched by the recipe.
  WLAN r&d are already using the approach of generating the
  compat-wireless package during build for building for example with
  android and we are adapting the same method."
* Change the recipe to generate the compat-wireless package directly
  from the ti-opnenlink gits instead of fetching a pre packaged zip
  from g-forge.
* Remove patches that are no longer needed as they were pulled into
  the compat-wireless git

Signed-off-by: Eyal Reizer <eyalr@ti.com>
---
 .../0001-compat-wireless-exclude-BT-building.patch |   29 ------------
 .../0002-compat-wireless-enable-test-mode.patch    |   29 ------------
 ...ompat-wireless-enable-uapsd-configuration.patch |   27 -----------
 .../ti-compat-wireless-wl12xx_r5.bb                |   47 +++++++++++++-------
 4 files changed, 31 insertions(+), 101 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0001-compat-wireless-exclude-BT-building.patch
 delete mode 100644 meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0002-compat-wireless-enable-test-mode.patch
 delete mode 100644 meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0002-ti-compat-wireless-enable-uapsd-configuration.patch

diff --git a/meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0001-compat-wireless-exclude-BT-building.patch b/meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0001-compat-wireless-exclude-BT-building.patch
deleted file mode 100644
index 731da28..0000000
--- a/meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0001-compat-wireless-exclude-BT-building.patch
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
diff --git a/meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0002-compat-wireless-enable-test-mode.patch b/meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0002-compat-wireless-enable-test-mode.patch
deleted file mode 100644
index 556ec8a..0000000
--- a/meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0002-compat-wireless-enable-test-mode.patch
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
diff --git a/meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0002-ti-compat-wireless-enable-uapsd-configuration.patch b/meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0002-ti-compat-wireless-enable-uapsd-configuration.patch
deleted file mode 100644
index 2cd3502..0000000
--- a/meta-arago-extras/recipes-bsp/ti-compat-wireless/files/0002-ti-compat-wireless-enable-uapsd-configuration.patch
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
diff --git a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx_r5.bb b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx_r5.bb
index ca70ea9..1886e00 100644
--- a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx_r5.bb
+++ b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl12xx_r5.bb
@@ -9,38 +9,53 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=d7810fab7487fb0aad327b76f1be7cd7"
 
 RDEPENDS_${PN} = "wireless-tools"
 
-TAG = "${@'${COMPAT_WIRELESS_VERSION}'.replace('-', '')}"
-PV = "0.${TAG}"
+PV = "r5.sp4.01"
 
 inherit module
 
 PR = "${MACHINE_KERNEL_PR}"
-PR_append = "b"
+PR_append = "c"
 
-COMPAT_WIRELESS_VERSION = "2012-11-18-r5-sp3"
+SRCREV_wl12xx = "ol_R5.SP4.01"
+SRCREV_compat = "ol_R5.SP4.01"
+SRCREV_compat-wireless = "ol_R5.SP4.01"
+
+SRCREV_FORMAT = "compat-wireless"
 
 S = "${WORKDIR}/compat-wireless"
 
-SRC_URI = "https://gforge.ti.com/gf/download/frsrelease/994/6330/ti-compat-wireless-R5_SP3.05.tar.gz \
-           file://0001-compat-wireless-add-pm_runtime_enabled.patch \
-           file://0001-compat-wireless-exclude-BT-building.patch \
-           file://0002-compat-wireless-enable-test-mode.patch \
-           file://0002-ti-compat-wireless-enable-uapsd-configuration.patch \
-           file://0001-wl12xx-additional-two-members-for-wl12xx_platform_da.patch \
-           file://0001-git-version-use-compat-base-tree.patch \
+SRC_URI = "git://github.com/TI-OpenLink/compat-wireless.git;destsuffix=compat-wireless;name=compat-wireless \
+           git://github.com/TI-OpenLink/compat.git;destsuffix=compat;name=compat \
+           git://github.com/TI-OpenLink/wl12xx.git;destsuffix=wl12xx;name=wl12xx \
+           file://0001-git-version-use-compat-base-tree.patch;patchdir=../wl12xx \
+           file://0001-compat-wireless-add-pm_runtime_enabled.patch;patchdir=../compat \
+           file://0001-wl12xx-additional-two-members-for-wl12xx_platform_da.patch;patchdir=../wl12xx \
           "
-SRC_URI_append_am335x-evm = "file://0001-wl12xx-Decrease-number-of-RX-transactions.patch \
-                             file://0002-wl12xx-Decrease-number-of-TX-transactions.patch \
-"
 
-SRC_URI[md5sum] = "3d86e0cbd0e2f07d09bf3cd52b6b2f98"
-SRC_URI[sha256sum] = "927e4a6f8397973c7ed30dada28a661b76486004756beef38176fda35370dd83"
+SRC_URI_append_am335x-evm = "file://0001-wl12xx-Decrease-number-of-RX-transactions.patch;patchdir=../wl12xx \
+                             file://0002-wl12xx-Decrease-number-of-TX-transactions.patch;patchdir=../wl12xx \
+"
 
 EXTRA_OEMAKE = "KLIB_BUILD=${STAGING_KERNEL_DIR} KLIB=${D}"
 
+# Prevent sourceipk clear_git function from running.
+# This preserves the git repo until driver-select is ran.
+
+clear_git() {
+    :
+}
+
 do_configure() {
     cd ${S}
+    GIT_TREE="${WORKDIR}/wl12xx" GIT_COMPAT_TREE="${WORKDIR}/compat" ./scripts/admin-refresh.sh
+
     ./scripts/driver-select wl12xx
+
+    # Delete the .git repository since it should no longer be needed.
+    rm -rf ${S}/.git ${S}/.gitignore
+
+    # Now generate the sourceipk with the properly configured sources
+    sourceipk_do_create_srcipk
 }
 
 do_configure_append() {
-- 
1.7.0.4


