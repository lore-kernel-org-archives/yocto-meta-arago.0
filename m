Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 0DAAC52A68
	for <meta-arago@arago-project.org>;
	Thu, 16 Jan 2014 23:57:52 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0GNvqSE016619
	for <meta-arago@arago-project.org>; Thu, 16 Jan 2014 17:57:52 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0GNvqSv004003
	for <meta-arago@arago-project.org>; Thu, 16 Jan 2014 17:57:52 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 16 Jan 2014 17:57:51 -0600
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0GNvfd6003746;
	Thu, 16 Jan 2014 17:57:50 -0600
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 16 Jan 2014 19:19:09 -0600
Message-ID: <1389921550-8122-4-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1389921550-8122-1-git-send-email-fcooper@ti.com>
References: <1389921550-8122-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 4/5] Remove all Wilink bluetooth related recipes
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
X-List-Received-Date: Thu, 16 Jan 2014 23:57:53 -0000
Content-Type: text/plain

* Wilink will no longer support bluetooth via bluez.
* Therefore, delete all bluetooth related recipes.
---
 ...kefile-Update-makefile-to-work-well-in-OE.patch |   78 --------------------
 .../recipes-bsp/bt-enable/bt-enable_1.0.bb         |   32 --------
 ...001-Makefile-allow-building-within-the-OE.patch |   49 ------------
 .../recipes-bsp/bt-firmware/bt-firmware_git.bb     |   41 ----------
 ...tooth-2.6-removed-unused-BT-modules-from-.patch |   47 ------------
 ...at-bluetooth-fixing-kernel-panic-in-l2cap.patch |   54 --------------
 ...h-Fix-l2cap-conn-failures-for-ssp-devices.patch |   45 -----------
 .../ti-compat-bluetooth/ti-compat-bluetooth.inc    |   26 -------
 .../ti-compat-bluetooth_r5.00.18.bb                |   12 ---
 .../ti-compat-bluetooth_r5.sp3.05.bb               |   12 ---
 .../bluetooth-gui/bluetooth-gui.bb                 |   56 --------------
 .../bluetooth-gui/files/bluetooth-icon.png         |  Bin 12479 -> 0 bytes
 .../bluetooth-gui/files/bt_demo.desktop            |    9 --
 .../bluetooth-gui/files/desc_bluetooth.html        |    5 -
 .../bluez-tools/bluez-tools_git.bb                 |   30 --------
 .../bluez/bluez-hcidump_2.2.bb                     |   19 -----
 .../bluez/bluez4/bluetooth.conf                    |   16 ----
 .../recipes-connectivity/bluez/bluez4_4.98.bb      |   35 ---------
 18 files changed, 0 insertions(+), 566 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-bsp/bt-enable/bt-enable/0001-Makefile-Update-makefile-to-work-well-in-OE.patch
 delete mode 100644 meta-arago-extras/recipes-bsp/bt-enable/bt-enable_1.0.bb
 delete mode 100644 meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware/0001-Makefile-allow-building-within-the-OE.patch
 delete mode 100644 meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware_git.bb
 delete mode 100644 meta-arago-extras/recipes-bsp/ti-compat-bluetooth/files/0001-compat-bluetooth-2.6-removed-unused-BT-modules-from-.patch
 delete mode 100644 meta-arago-extras/recipes-bsp/ti-compat-bluetooth/files/0001-compat-bluetooth-fixing-kernel-panic-in-l2cap.patch
 delete mode 100644 meta-arago-extras/recipes-bsp/ti-compat-bluetooth/files/0002-Bluetooth-Fix-l2cap-conn-failures-for-ssp-devices.patch
 delete mode 100644 meta-arago-extras/recipes-bsp/ti-compat-bluetooth/ti-compat-bluetooth.inc
 delete mode 100644 meta-arago-extras/recipes-bsp/ti-compat-bluetooth/ti-compat-bluetooth_r5.00.18.bb
 delete mode 100644 meta-arago-extras/recipes-bsp/ti-compat-bluetooth/ti-compat-bluetooth_r5.sp3.05.bb
 delete mode 100644 meta-arago-extras/recipes-connectivity/bluetooth-gui/bluetooth-gui.bb
 delete mode 100755 meta-arago-extras/recipes-connectivity/bluetooth-gui/files/bluetooth-icon.png
 delete mode 100755 meta-arago-extras/recipes-connectivity/bluetooth-gui/files/bt_demo.desktop
 delete mode 100644 meta-arago-extras/recipes-connectivity/bluetooth-gui/files/desc_bluetooth.html
 delete mode 100644 meta-arago-extras/recipes-connectivity/bluez-tools/bluez-tools_git.bb
 delete mode 100644 meta-arago-extras/recipes-connectivity/bluez/bluez-hcidump_2.2.bb
 delete mode 100644 meta-arago-extras/recipes-connectivity/bluez/bluez4/bluetooth.conf
 delete mode 100644 meta-arago-extras/recipes-connectivity/bluez/bluez4_4.98.bb

diff --git a/meta-arago-extras/recipes-bsp/bt-enable/bt-enable/0001-Makefile-Update-makefile-to-work-well-in-OE.patch b/meta-arago-extras/recipes-bsp/bt-enable/bt-enable/0001-Makefile-Update-makefile-to-work-well-in-OE.patch
deleted file mode 100644
index 7e6756c..0000000
--- a/meta-arago-extras/recipes-bsp/bt-enable/bt-enable/0001-Makefile-Update-makefile-to-work-well-in-OE.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-From a400ac3d83023a66a356d056899d6b380cb30473 Mon Sep 17 00:00:00 2001
-From: Chase Maupin <Chase.Maupin@ti.com>
-Date: Wed, 7 Mar 2012 10:51:43 -0600
-Subject: [PATCH] Makefile: Update makefile to work with OE
-
-* Updated the makefile to with OE
-* Use the kernel install target for installing the module
-
-Upstream-Status: Pending
-    * will be in next release
-
-Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
----
- Makefile |   45 ++++++++++++++++++++++++++++++++++++++++-----
- 1 files changed, 40 insertions(+), 5 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index ebbcd11..b17d33e 100755
---- a/Makefile
-+++ b/Makefile
-@@ -7,15 +7,50 @@ else
-   EXTRA_CFLAGS += -O2
- endif
-
-+-include ../../../Rules.make
-+
-+# If KERNEL_DIR is not set then use the default in Rules.make
-+KERNEL_DIR ?= ${LINUXKERNEL_INSTALL_DIR}
-+DEST_DIR ?= ${DESTDIR}
-+
-+PLATFORM ?= "unknown"
-+MACHINE_NAME ?= "unknown"
-+
-+# Use the PLATFORM value from the Rules.make if it was sourced
-+ifeq ($(PLATFORM), am335x-evm)
-+    MACHINE_NAME := "am335x"
-+endif
-+ifeq ($(PLATFORM), am180x-evm)
-+    MACHINE_NAME := "am1808"
-+endif
-+ifeq ($(PLATFORM), da850-omapl138-evm)
-+    MACHINE_NAME := "am1808"
-+endif
-+ifeq ($(PLATFORM), am37x-evm)
-+    MACHINE_NAME := "omap3evm"
-+endif
-+
-+# If CROSS_COMPILE is not set by Rules.make then set a sane default
-+CROSS_COMPILE ?= arm-arago-linux-gnueabi-
-+export CROSS_COMPILE
-+
-+# set the INSTALL_MOD_DIR so that the executables won't be placed in extra
-+INSTALL_MOD_DIR = kernel/drivers/bt_enable
-+export INSTALL_MOD_DIR
-+
- obj-m := gpio_en.o
-
-+MAKE_ENV = ARCH=arm
-+
- PWD := $(shell pwd)
- all:
--	pwd
--	@echo EXTRA_CFLAGS = $(EXTRA_CFLAGS)
--	$(MAKE) CROSS_COMPILE=$(CROSS_COMPILE) ARCH=$(ARCH) EXTRA_CFLAGS="$(EXTRA_CFLAGS)" -C $(KERNEL_DIR) M=$(PWD) modules
-+	@cp -f gpio_en_${MACHINE_NAME}.c gpio_en.c
-+	$(MAKE) EXTRA_CFLAGS="$(EXTRA_CFLAGS)" -C $(KERNEL_DIR) $(MAKE_ENV) \
-+    M=$(PWD) modules
-+
- install:
--	install -d ${DEST_DIR}${BASE_LIB_DIR}/modules/${KRNL_VER}/kernel/drivers/bt_enable
--	install -m 0755 ./gpio_en.ko ${DEST_DIR}${BASE_LIB_DIR}/modules/${KRNL_VER}/kernel/drivers/bt_enable
-+	$(MAKE) EXTRA_CFLAGS="$(EXTRA_CFLAGS)" -C $(KERNEL_DIR) $(MAKE_ENV) \
-+    M=$(PWD) INSTALL_MOD_PATH="${DEST_DIR}" modules_install
-+
- clean:
-	rm -rf *.o *~ core .depend .*.cmd *.ko *.mod.c .tmp_versions *.symvers
---
-1.7.0.4
diff --git a/meta-arago-extras/recipes-bsp/bt-enable/bt-enable_1.0.bb b/meta-arago-extras/recipes-bsp/bt-enable/bt-enable_1.0.bb
deleted file mode 100644
index ae51e3f..0000000
--- a/meta-arago-extras/recipes-bsp/bt-enable/bt-enable_1.0.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-DESCRIPTION = "BT GPIO Enable"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://gpio_en_am1808.c;beginline=1;endline=34;md5=fe94639d8f61c867d1bc4bf61473d3cd \
-                    file://gpio_en_am335x.c;beginline=1;endline=34;md5=fe94639d8f61c867d1bc4bf61473d3cd \
-                    file://gpio_en_omap3evm.c;beginline=1;endline=34;md5=fe94639d8f61c867d1bc4bf61473d3cd \
-"
-COMPATIBLE_MACHINE = "omap3|omapl138|ti33x"
-
-PR = "${MACHINE_KERNEL_PR}"
-PR_append = "b+gitr${SRCPV}"
-
-SRCREV = "97c4600ff7d39f1cc6079939248cd9ed15100db4"
-
-SRC_URI = "git://github.com/TI-ECS/bt_enable.git;protocol=git \
-           file://0001-Makefile-Update-makefile-to-work-well-in-OE.patch \
-"
-
-S = "${WORKDIR}/git"
-
-inherit module
-
-INHIBIT_PACKAGE_STRIP = "1"
-
-PLATFORM_ti33x = "am335x-evm"
-PLATFORM_omap3 = "am37x-evm"
-PLATFORM_omapl138 = "am180x-evm"
-
-EXTRA_OEMAKE += "KERNEL_DIR=${STAGING_KERNEL_DIR} PLATFORM=${PLATFORM}"
-
-do_install () {
-    oe_runmake 'DEST_DIR=${D}' install
-}
diff --git a/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware/0001-Makefile-allow-building-within-the-OE.patch b/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware/0001-Makefile-allow-building-within-the-OE.patch
deleted file mode 100644
index 49caa85..0000000
--- a/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware/0001-Makefile-allow-building-within-the-OE.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 8f226ccc9d2cbd10d454e131376c35f502a45e3b Mon Sep 17 00:00:00 2001
-From: Chase Maupin <Chase.Maupin@ti.com>
-Date: Wed, 7 Mar 2012 14:11:42 -0600
-Subject: [PATCH] Makefile: allow building with OE
-
-* Use defaults and source values that allow building this
-  component with OE.
-
-Upstread-Status: Pending
-    * Will be accepted into next release
-
-Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
----
- Makefile |   21 +++++++++++++++++++++
- 1 files changed, 21 insertions(+), 0 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 9035e40..bd94881 100644
---- a/Makefile
-+++ b/Makefile
-@@ -1,5 +1,26 @@
- # Installs the the Bluetooth firmware files into the root file system
-
-+-include ../../../Rules.make
-+
-+# If KERNEL_DIR is not set then use the default in Rules.make
-+DEST_DIR ?= ${DESTDIR}
-+
-+PLATFORM ?= "unknown"
-+MACHINE_NAME ?= "unknown"
-+
-+ifeq ($(PLATFORM), am335x-evm)
-+    MACHINE_NAME := am335x
-+endif
-+ifeq ($(PLATFORM), am180x-evm)
-+    MACHINE_NAME := am1808
-+endif
-+ifeq ($(PLATFORM), da850-omapl138-evm)
-+    MACHINE_NAME := am1808
-+endif
-+ifeq ($(PLATFORM), am37x-evm)
-+    MACHINE_NAME := omap3evm
-+endif
-+
- install:
-	install -d $(DEST_DIR)${BASE_LIB_DIR}/firmware
-	cp -f ./${MACHINE_NAME}/* $(DEST_DIR)${BASE_LIB_DIR}/firmware
---
-1.7.0.4
diff --git a/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware_git.bb b/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware_git.bb
deleted file mode 100644
index 2b320da..0000000
--- a/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware_git.bb
+++ /dev/null
@@ -1,41 +0,0 @@
-DESCRIPTION = "Firmware files for Bluetooth"
-LICENSE = "TI-TSPA"
-LIC_FILES_CHKSUM = "file://am335x/LICENCE;md5=ba590e1d103f891d0151609046aef9e8 \
-                    file://am1808/LICENCE;md5=ba590e1d103f891d0151609046aef9e8 \
-                    file://omap3evm/LICENCE;md5=ba590e1d103f891d0151609046aef9e8 \
-"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-# This recipe provides the latest firmware files for wl12xx.
-# Therefore, use the contents of this recipe instead of the contents
-# of linux-firmware-wl12xx.
-RCONFLICTS_${PN} = "linux-firmware-wl12xx"
-RREPLACES_${PN}  = "linux-firmware-wl12xx"
-
-PR = "r2+gitr${SRCPV}"
-
-COMPATIBLE_MACHINE = "omap3|omapl138|da850-omapl138-evm|ti33x"
-
-SRCREV = "adbc27c11d5c5c8c20a93a8beca647b4a6aaa03b"
-SRC_URI = "git://github.com/TI-ECS/bt-firmware.git;protocol=git \
-           file://0001-Makefile-allow-building-within-the-OE.patch"
-
-PLATFORM = "unknown"
-PLATFORM_ti33x = "am335x-evm"
-PLATFORM_omap3 = "am37x-evm"
-PLATFORM_omapl138 = "am180x-evm"
-PLATFORM_da850-omapl138-evm = "am180x-evm"
-
-S = "${WORKDIR}/git"
-
-do_compile() {
-    :
-}
-
-do_install() {
-    install -d ${D}${base_libdir}/firmware
-    oe_runmake 'DEST_DIR=${D}' 'BASE_LIB_DIR=${base_libdir}' 'PLATFORM=${PLATFORM}' install
-}
-
-FILES_${PN} += "${base_libdir}/firmware"
diff --git a/meta-arago-extras/recipes-bsp/ti-compat-bluetooth/files/0001-compat-bluetooth-2.6-removed-unused-BT-modules-from-.patch b/meta-arago-extras/recipes-bsp/ti-compat-bluetooth/files/0001-compat-bluetooth-2.6-removed-unused-BT-modules-from-.patch
deleted file mode 100644
index a383e4c..0000000
--- a/meta-arago-extras/recipes-bsp/ti-compat-bluetooth/files/0001-compat-bluetooth-2.6-removed-unused-BT-modules-from-.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 267cb471c7b182786f58a2a74f3d8bc977cb4527 Mon Sep 17 00:00:00 2001
-From: Vita Preskovsky <vitap@ti.com>
-Date: Thu, 29 Dec 2011 16:09:36 +0200
-Subject: [PATCH] compat-bluetooth-2.6: removed unused BT modules from compilation
-
-  * config.mk is changed to not compile unused BT modules
-
- Signed-off-by: Vita Preskovsky <vitap@ti.com>
----
- config.mk |   10 +++++-----
- 1 files changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/config.mk b/config.mk
-index f09d16d..56ac6df 100644
---- a/config.mk
-+++ b/config.mk
-@@ -226,14 +226,14 @@ ifndef CONFIG_COMPAT_KERNEL_2_6_28
- CONFIG_COMPAT_BT_HIDP=m
- endif #CONFIG_COMPAT_KERNEL_2_6_28
-
--CONFIG_BT_HCIUART=M
-+CONFIG_BT_HCIUART=m
- CONFIG_BT_HCIUART_H4=y
- CONFIG_BT_HCIUART_BCSP=y
--CONFIG_BT_HCIUART_ATH3K=y
-+#CONFIG_BT_HCIUART_ATH3K=y
- CONFIG_BT_HCIUART_LL=y
-
- CONFIG_BT_HCIVHCI=m
--CONFIG_BT_MRVL=m
-+#CONFIG_BT_MRVL=m
-
- ifdef CONFIG_PCMCIA
- CONFIG_BT_HCIDTL1=m
-@@ -606,8 +606,8 @@ CONFIG_IWM=m
- # CONFIG_IWM_DEBUG=y
- # CONFIG_IWM_TRACING=y
-
--CONFIG_BT_HCIBTSDIO=m
--CONFIG_BT_MRVL_SDIO=m
-+#CONFIG_BT_HCIBTSDIO=m
-+#CONFIG_BT_MRVL_SDIO=m
-
- ifndef CONFIG_COMPAT_KERNEL_2_6_27
- CONFIG_ATH6KL=m
---
-1.7.0.4
diff --git a/meta-arago-extras/recipes-bsp/ti-compat-bluetooth/files/0001-compat-bluetooth-fixing-kernel-panic-in-l2cap.patch b/meta-arago-extras/recipes-bsp/ti-compat-bluetooth/files/0001-compat-bluetooth-fixing-kernel-panic-in-l2cap.patch
deleted file mode 100644
index db04b5c..0000000
--- a/meta-arago-extras/recipes-bsp/ti-compat-bluetooth/files/0001-compat-bluetooth-fixing-kernel-panic-in-l2cap.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 95bb5df2c28a51790ab3d63b34e417e2fc9c6235 Mon Sep 17 00:00:00 2001
-From: Vita Preskovsky <vitap@ti.com>
-Date: Tue, 12 Jun 2012 17:56:02 +0300
-Subject: [PATCH] compat-bluetooth: fixing kernel panic in l2cap
-
- * fixing kernel panic in l2cap layer. The problem appears
-   for first time in new version R5.00.18.
-
-Upstream-Status: Pending
-
-Signed-off-by: Vita Preskovsky <vitap@ti.com>
----
- include/net/bluetooth/l2cap.h |    1 +
- net/bluetooth/l2cap_core.c    |    6 +++++-
- 2 files changed, 6 insertions(+), 1 deletions(-)
-
-diff --git a/include/net/bluetooth/l2cap.h b/include/net/bluetooth/l2cap.h
-index c0d168a..5651a70 100644
---- a/include/net/bluetooth/l2cap.h
-+++ b/include/net/bluetooth/l2cap.h
-@@ -494,6 +494,7 @@ struct l2cap_chan {
-
-	struct list_head list;
-	struct list_head global_l;
-+	bool global_b;
-
-	void		*data;
-	struct l2cap_ops *ops;
-diff --git a/net/bluetooth/l2cap_core.c b/net/bluetooth/l2cap_core.c
-index ffa2f6b..847dabc 100644
---- a/net/bluetooth/l2cap_core.c
-+++ b/net/bluetooth/l2cap_core.c
-@@ -316,6 +316,7 @@ struct l2cap_chan *l2cap_chan_create(struct sock *sk)
-
-	write_lock_bh(&chan_list_lock);
-	list_add(&chan->global_l, &chan_list);
-+	chan->global_b = true;
-	write_unlock_bh(&chan_list_lock);
-
-	INIT_DELAYED_WORK(&chan->chan_timer, l2cap_chan_timeout);
-@@ -332,7 +333,10 @@ struct l2cap_chan *l2cap_chan_create(struct sock *sk)
- void l2cap_chan_destroy(struct l2cap_chan *chan)
- {
-	write_lock_bh(&chan_list_lock);
--	list_del(&chan->global_l);
-+	if (chan->global_b) {
-+		list_del(&chan->global_l);
-+		chan->global_b = false;
-+	}
-	write_unlock_bh(&chan_list_lock);
-
-	chan_put(chan);
---
-1.7.0.4
diff --git a/meta-arago-extras/recipes-bsp/ti-compat-bluetooth/files/0002-Bluetooth-Fix-l2cap-conn-failures-for-ssp-devices.patch b/meta-arago-extras/recipes-bsp/ti-compat-bluetooth/files/0002-Bluetooth-Fix-l2cap-conn-failures-for-ssp-devices.patch
deleted file mode 100644
index bf7bf47..0000000
--- a/meta-arago-extras/recipes-bsp/ti-compat-bluetooth/files/0002-Bluetooth-Fix-l2cap-conn-failures-for-ssp-devices.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 18daf1644e634bae951a6e3d4d19d89170209762 Mon Sep 17 00:00:00 2001
-From: Peter Hurley <peter@hurleysoftware.com>
-Date: Fri, 13 Jan 2012 15:11:30 +0100
-Subject: [PATCH] Bluetooth: Fix l2cap conn failures for ssp devices
-
-Commit 330605423c fixed l2cap conn establishment for non-ssp remote
-devices by not setting HCI_CONN_ENCRYPT_PEND every time conn security
-is tested (which was always returning failure on any subsequent
-security checks).
-
-However, this broke l2cap conn establishment for ssp remote devices
-when an ACL link was already established at SDP-level security. This
-fix ensures that encryption must be pending whenever authentication
-is also pending.
-
-Signed-off-by: Peter Hurley <peter@hurleysoftware.com>
-Tested-by: Daniel Wagner <daniel.wagner@bmw-carit.de>
-Acked-by: Marcel Holtmann <marcel@holtmann.org>
-Signed-off-by: Johan Hedberg <johan.hedberg@intel.com>
-
-Upstream-Status: Backported
-From 18daf1644e634bae951a6e3d4d19d89170209762 in Linux kernel git
-
-Signed-off-by: Moosa Baransi <moosab@ti.com>
----
- net/bluetooth/hci_conn.c |    4 ++++
- 1 files changed, 4 insertions(+), 0 deletions(-)
-
-diff --git a/net/bluetooth/hci_conn.c b/net/bluetooth/hci_conn.c
-index 3db4324..07bc69e 100644
---- a/net/bluetooth/hci_conn.c
-+++ b/net/bluetooth/hci_conn.c
-@@ -635,6 +635,10 @@ static int hci_conn_auth(struct hci_conn *conn, __u8 sec_level, __u8 auth_type)
-
-	if (!test_and_set_bit(HCI_CONN_AUTH_PEND, &conn->pend)) {
-		struct hci_cp_auth_requested cp;
-+
-+		/* encrypt must be pending if auth is also pending */
-+		set_bit(HCI_CONN_ENCRYPT_PEND, &conn->pend);
-+
-		cp.handle = cpu_to_le16(conn->handle);
-		hci_send_cmd(conn->hdev, HCI_OP_AUTH_REQUESTED,
-							sizeof(cp), &cp);
---
-1.7.4.1
diff --git a/meta-arago-extras/recipes-bsp/ti-compat-bluetooth/ti-compat-bluetooth.inc b/meta-arago-extras/recipes-bsp/ti-compat-bluetooth/ti-compat-bluetooth.inc
deleted file mode 100644
index 9003630..0000000
--- a/meta-arago-extras/recipes-bsp/ti-compat-bluetooth/ti-compat-bluetooth.inc
+++ /dev/null
@@ -1,26 +0,0 @@
-DESCRIPTION = "TI compat-bluetooth drivers"
-HOMEPAGE = "https://gforge.ti.com/gf/project/ecs_nlcp/"
-SECTION = "kernel/modules"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=d7810fab7487fb0aad327b76f1be7cd7"
-
-inherit module
-
-RDEPENDS_${PN} = "ti-compat-wireless-wl12xx"
-
-PR = "${MACHINE_KERNEL_PR}b"
-
-S = "${WORKDIR}/compat-bluetooth/"
-
-EXTRA_OEMAKE = "KLIB_BUILD=${STAGING_KERNEL_DIR} KLIB=${D}"
-
-do_configure() {
-    cd ${S}
-    ./scripts/driver-select bt
-}
-
-do_install() {
-    oe_runmake DEPMOD=echo DESTDIR="${D}" INSTALL_MOD_PATH="${D}" LDFLAGS="" install-modules
-    find ${D} -name compat.ko | xargs rm
-}
-
diff --git a/meta-arago-extras/recipes-bsp/ti-compat-bluetooth/ti-compat-bluetooth_r5.00.18.bb b/meta-arago-extras/recipes-bsp/ti-compat-bluetooth/ti-compat-bluetooth_r5.00.18.bb
deleted file mode 100644
index fa789cc..0000000
--- a/meta-arago-extras/recipes-bsp/ti-compat-bluetooth/ti-compat-bluetooth_r5.00.18.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require ti-compat-bluetooth.inc
-
-PR_append = "-r0"
-
-SRC_URI = "https://gforge.ti.com/gf/download/frsrelease/865/5622/compat-bluetooth-wl12xx-2012-05-22-r5-18.tgz \
-           file://0001-compat-bluetooth-2.6-removed-unused-BT-modules-from-.patch \
-           file://0002-Bluetooth-Fix-l2cap-conn-failures-for-ssp-devices.patch \
-           file://0001-compat-bluetooth-fixing-kernel-panic-in-l2cap.patch \
-"
-
-SRC_URI[md5sum] = "85118756a605ebd8f4fbff19995368a6"
-SRC_URI[sha256sum] = "d250a6447de54f0776a12ca604bf2a2a48b022108b699de5008f48462e535393"
diff --git a/meta-arago-extras/recipes-bsp/ti-compat-bluetooth/ti-compat-bluetooth_r5.sp3.05.bb b/meta-arago-extras/recipes-bsp/ti-compat-bluetooth/ti-compat-bluetooth_r5.sp3.05.bb
deleted file mode 100644
index f49bcb0..0000000
--- a/meta-arago-extras/recipes-bsp/ti-compat-bluetooth/ti-compat-bluetooth_r5.sp3.05.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require ti-compat-bluetooth.inc
-
-PR_append = "-r0"
-
-SRC_URI = "https://gforge.ti.com/gf/download/frsrelease/802/5435/ti-compat-bluetooth-2012-02-20.tar.gz \
-           file://0001-compat-bluetooth-2.6-removed-unused-BT-modules-from-.patch \
-           file://0002-Bluetooth-Fix-l2cap-conn-failures-for-ssp-devices.patch \
-           file://0001-compat-bluetooth-fixing-kernel-panic-in-l2cap.patch \
-"
-
-SRC_URI[md5sum] = "7c231b35a2297391b5192f86ff4f10dd"
-SRC_URI[sha256sum] = "d8882da8bb37821bfd0b9334b859f64d0ce82ae5262360367a3f3fdf31c7f350"
diff --git a/meta-arago-extras/recipes-connectivity/bluetooth-gui/bluetooth-gui.bb b/meta-arago-extras/recipes-connectivity/bluetooth-gui/bluetooth-gui.bb
deleted file mode 100644
index 9be5ae9..0000000
--- a/meta-arago-extras/recipes-connectivity/bluetooth-gui/bluetooth-gui.bb
+++ /dev/null
@@ -1,56 +0,0 @@
-DESCRIPTION = "Bluetooth GUI Application"
-SECTION = "network"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://src/main.cpp;beginline=1;endline=37;md5=83d75e9470fc1ba29e6f494fdef321be"
-COMPATIBLE_MACHINE = "(omap3evm|am37x-evm|am335x-evm|am180x-evm|am181x-evm)"
-
-BRANCH = "master"
-SRCREV = "046643eac13b4d6b6fd7525539ef666509df264e"
-
-PR = "r13"
-
-SRC_URI = "git://www.github.com/TI-ECS/BT_Demo.git;protocol=git;branch=${BRANCH} \
-           file://bluetooth-icon.png \
-           file://desc_bluetooth.html \
-           file://bt_demo.desktop"
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
-       install -m 755 BT_Demo ${D}/${bindir}/bluetooth-gui
-       install -m 755 ${S}/scripts/BT_Init_${PLATFORM}.sh ${D}${bindir}/BT_Init.sh
-       install -m 755 ${S}/scripts/BT_Exit.sh ${D}${bindir}
-       install -d 2755 ${D}${MATRIX_APP_DIR}/bt_demo
-       install -m 644 ${WORKDIR}/bt_demo.desktop ${D}${MATRIX_APP_DIR}/bt_demo
-       install -m 644 ${WORKDIR}/desc_bluetooth.html ${D}${MATRIX_APP_DIR}/bt_demo
-       install -m 644 ${WORKDIR}/bluetooth-icon.png ${D}${MATRIX_APP_DIR}/bt_demo
-}
-
-PACKAGES += "matrix-gui-bluetooth-demos"
-
-FILES_${PN} +=" \
-	${bindir}/bluetooth-gui \
-	${bindir}/BT_Init.sh \
-	${bindir}/BT_Exit.sh \
-	"
-
-RDEPENDS_${PN} += "pulseaudio"
-
-FILES_matrix-gui-bluetooth-demos += " \
-    	${MATRIX_APP_DIR}/bt_demo/* \
-        "
-
-RDEPENDS_matrix-gui-bluetooth-demos += "matrix-gui-apps-images matrix-gui-submenus-wifi ${PN}"
-
-SRC_URI[md5sum] = "357da8591816ff05e81f31379bde9a01"
-SRC_URI[sha256sum] = "aad229f585b21bf2eb4d3dee4b123271683b357bf0625b6da1ebced881595e6d"
diff --git a/meta-arago-extras/recipes-connectivity/bluetooth-gui/files/bluetooth-icon.png b/meta-arago-extras/recipes-connectivity/bluetooth-gui/files/bluetooth-icon.png
deleted file mode 100755
index 3411afa0aa0a205731f22ab4033825c7f18a69fa..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 12479
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
JPDHLkV1hvelhyzL

diff --git a/meta-arago-extras/recipes-connectivity/bluetooth-gui/files/bt_demo.desktop b/meta-arago-extras/recipes-connectivity/bluetooth-gui/files/bt_demo.desktop
deleted file mode 100755
index f462500..0000000
--- a/meta-arago-extras/recipes-connectivity/bluetooth-gui/files/bt_demo.desktop
+++ /dev/null
@@ -1,9 +0,0 @@
-#!/usr/bin/env xdg-open
-[Desktop Entry]
-Name=Bluetooth
-GenericName=Bluetooth
-Icon=/usr/share/matrix-gui-2.0/apps/bt_demo/bluetooth-icon.png
-Type=Application
-Exec=bluetooth-gui --blacklist-alsa-cards="L138 EVM,omap3evm,AM335X EVM"
-X-ProgramType=gui
-X-MATRIX-Description=/usr/share/matrix-gui-2.0/apps/bt_demo/desc_bluetooth.html
diff --git a/meta-arago-extras/recipes-connectivity/bluetooth-gui/files/desc_bluetooth.html b/meta-arago-extras/recipes-connectivity/bluetooth-gui/files/desc_bluetooth.html
deleted file mode 100644
index 9c70972..0000000
--- a/meta-arago-extras/recipes-connectivity/bluetooth-gui/files/desc_bluetooth.html
+++ /dev/null
@@ -1,5 +0,0 @@
-<h1> Bluetooth GUI </h1>
-
-<h2>Warning: The WiFi/Bluetooth daughter card is required in order for bluetooth to operate correctly.
-Please ensure it is attached before continuing.</h2>
-
diff --git a/meta-arago-extras/recipes-connectivity/bluez-tools/bluez-tools_git.bb b/meta-arago-extras/recipes-connectivity/bluez-tools/bluez-tools_git.bb
deleted file mode 100644
index 5ef5046..0000000
--- a/meta-arago-extras/recipes-connectivity/bluez-tools/bluez-tools_git.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-DESCRIPTION = "Bluez Tools"
-HOMEPAGE = "http://code.google.com/p/bluez-tools/"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
-
-RDEPENDS_${PN} = "bluez4 obexd"
-DEPENDS = "glib-2.0 dbus-glib"
-
-PR = "r2+gitr${SRCPV}"
-
-SRCREV = "171181b6ef6c94aefc828dc7fd8de136b9f97532"
-
-S = "${WORKDIR}/git"
-
-SRC_URI = "git://gitorious.org/bluez-tools/bluez-tools.git;protocol=git"
-
-inherit autotools
-
-do_install() {
-       install -d ${D}${bindir}
-       install -m 755 ${S}/src/bt-adapter ${D}${bindir}
-       install -m 755 ${S}/src/bt-agent   ${D}${bindir}
-       install -m 755 ${S}/src/bt-audio   ${D}${bindir}
-       install -m 755 ${S}/src/bt-device  ${D}${bindir}
-       install -m 755 ${S}/src/bt-input   ${D}${bindir}
-       install -m 755 ${S}/src/bt-monitor ${D}${bindir}
-       install -m 755 ${S}/src/bt-network ${D}${bindir}
-       install -m 755 ${S}/src/bt-obex    ${D}${bindir}
-       install -m 755 ${S}/src/bt-serial  ${D}${bindir}
-}
diff --git a/meta-arago-extras/recipes-connectivity/bluez/bluez-hcidump_2.2.bb b/meta-arago-extras/recipes-connectivity/bluez/bluez-hcidump_2.2.bb
deleted file mode 100644
index 4c005ee..0000000
--- a/meta-arago-extras/recipes-connectivity/bluez/bluez-hcidump_2.2.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-DESCRIPTION = "Linux Bluetooth Stack HCI Debugger Tool."
-SECTION = "console"
-PRIORITY = "optional"
-DEPENDS = "bluez4"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
-                    file://src/hcidump.c;beginline=1;endline=23;md5=3bee3a162dff43a5be7470710b99fbcf"
-PR = "r1"
-
-SRC_URI = "http://www.kernel.org/pub/linux/bluetooth/bluez-hcidump-${PV}.tar.gz"
-S = "${WORKDIR}/bluez-hcidump-${PV}"
-
-EXTRA_OECONF = "--with-bluez-libs=${STAGING_LIBDIR} --with-bluez-includes=${STAGING_INCDIR}"
-
-inherit autotools
-
-SRC_URI[md5sum] = "3c298a8be67099fe227f3e4d9de539d5"
-SRC_URI[sha256sum] = "073066d3ec1f7d1c52bb0fe27cde84ea273e1ab3097b27fa1fd45a5992e1a441"
-
diff --git a/meta-arago-extras/recipes-connectivity/bluez/bluez4/bluetooth.conf b/meta-arago-extras/recipes-connectivity/bluez/bluez4/bluetooth.conf
deleted file mode 100644
index ca5e9e4..0000000
--- a/meta-arago-extras/recipes-connectivity/bluez/bluez4/bluetooth.conf
+++ /dev/null
@@ -1,16 +0,0 @@
-<!-- This configuration file specifies the required security policies
-     for Bluetooth core daemon to work. -->
-
-<!DOCTYPE busconfig PUBLIC "-//freedesktop//DTD D-BUS Bus Configuration 1.0//EN"
- "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
-<busconfig>
-
-  <!-- ../system.conf have denied everything, so we just punch some holes -->
-
-  <policy context="default">
-    <allow own="org.bluez"/>
-    <allow send_destination="org.bluez"/>
-    <allow send_interface="org.bluez.Agent"/>
-  </policy>
-
-</busconfig>
diff --git a/meta-arago-extras/recipes-connectivity/bluez/bluez4_4.98.bb b/meta-arago-extras/recipes-connectivity/bluez/bluez4_4.98.bb
deleted file mode 100644
index 2cb8618..0000000
--- a/meta-arago-extras/recipes-connectivity/bluez/bluez4_4.98.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-require recipes-connectivity/bluez/bluez4.inc
-
-PR = "r0"
-
-SRC_URI += "file://bluetooth.conf \
-"
-
-SRC_URI[md5sum] = "362864b716950baa04797de735fc237b"
-SRC_URI[sha256sum] = "9a5b655bada7c7a1921cb3bac83b8a32bbe49893e4c7a1377cdc1b0d35f7d233"
-
-do_install_append() {
-    install -m 0644 ${S}/audio/audio.conf ${D}/${sysconfdir}/bluetooth/
-    install -m 0644 ${S}/network/network.conf ${D}/${sysconfdir}/bluetooth/
-    install -m 0644 ${S}/input/input.conf ${D}/${sysconfdir}/bluetooth/
-    # at_console doesn't really work with the current state of OE, so punch some more holes so people can actually use BT
-    install -m 0644 ${WORKDIR}/bluetooth.conf ${D}/${sysconfdir}/dbus-1/system.d/
-}
-
-RDEPENDS_${PN}-dev = "bluez-hcidump"
-
-ALLOW_EMPTY_libasound-module-bluez = "1"
-PACKAGES =+ "libasound-module-bluez"
-
-FILES_libasound-module-bluez = "${libdir}/alsa-lib/lib*.so ${datadir}/alsa"
-FILES_${PN} += "${libdir}/bluetooth/plugins ${libdir}/bluetooth/plugins/*.so ${base_libdir}/udev/ ${systemd_unitdir}/ ${datadir}/dbus-1"
-FILES_${PN}-dev += "\
-  ${libdir}/bluetooth/plugins/*.la \
-  ${libdir}/alsa-lib/*.la \
-"
-
-FILES_${PN}-dbg += "\
-  ${libdir}/bluetooth/plugins/.debug \
-  ${libdir}/*/.debug \
-  ${base_libdir}/udev/.debug \
-"
-- 
1.7.0.4


