Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id AA17052AC1
	for <meta-arago@arago-project.org>;
	Sat, 19 Jan 2013 21:52:19 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id x4so4770240obh.24
	for <meta-arago@arago-project.org>;
	Sat, 19 Jan 2013 13:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=ERP32xlUbkkv/QO78YszQaC8jsIgM0E1uuwYjk3CcI8=;
	b=qSQxyjhisLBBdKY+ROKqLPjKBf7bAy3nCHRwY1LhLRFJFuQxMcAh1Etz4bWQ0+8mVV
	PATKS+KUTRnZ6H5Odw39Qd8ly2VrgzGyY3heAbwkSI3xUlGNO8UthYiCDnsm4TA83TjT
	s2Lz3HeUCnFUsjQVnhkf38zHmG2DUaNW4M48taLf6GtIQtbotbtrVxs5zMF8TO0A+m/J
	/niKGmn66PMqTHhSk8TsS1vRn52a0YeeQe9H4aCjFOz3iNSC0B5mxLuGk5czYWSA4sBC
	CKo6wlRhhh3LTTKdFemKhdBRl1A7l9OD1E0R0DEZpxLSXeIicSQuXz2bH4AsIcWqOPMx
	oAJg==
X-Received: by 10.182.43.99 with SMTP id v3mr10235759obl.48.1358632339186;
	Sat, 19 Jan 2013 13:52:19 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id b3sm6845496obo.6.2013.01.19.13.52.17
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sat, 19 Jan 2013 13:52:18 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Sat, 19 Jan 2013 15:51:35 -0600
Message-Id: <1358632316-12266-10-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1358632316-12266-1-git-send-email-fcooper@ti.com>
References: <1358632316-12266-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 10/31] ti-compat-bluetooth: Port ti-compat-bluetooth recipe
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
X-List-Received-Date: Sat, 19 Jan 2013 21:52:20 -0000

* Port ti-compat-bluetooth recipe from arago.
* Ti-compat-bluetooth provides the necessary bluetooth drivers for the
  TI wl12xx Wi-Fi + Bluetooth module.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 ...tooth-2.6-removed-unused-BT-modules-from-.patch |   47 +++++++++++++++++
 ...at-bluetooth-fixing-kernel-panic-in-l2cap.patch |   54 ++++++++++++++++++++
 ...h-Fix-l2cap-conn-failures-for-ssp-devices.patch |   45 ++++++++++++++++
 .../ti-compat-bluetooth/ti-compat-bluetooth_1.0.bb |   39 ++++++++++++++
 4 files changed, 185 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-extras/recipes-bsp/ti-compat-bluetooth/files/0001-compat-bluetooth-2.6-removed-unused-BT-modules-from-.patch
 create mode 100644 meta-arago-extras/recipes-bsp/ti-compat-bluetooth/files/0001-compat-bluetooth-fixing-kernel-panic-in-l2cap.patch
 create mode 100644 meta-arago-extras/recipes-bsp/ti-compat-bluetooth/files/0002-Bluetooth-Fix-l2cap-conn-failures-for-ssp-devices.patch
 create mode 100644 meta-arago-extras/recipes-bsp/ti-compat-bluetooth/ti-compat-bluetooth_1.0.bb

diff --git a/meta-arago-extras/recipes-bsp/ti-compat-bluetooth/files/0001-compat-bluetooth-2.6-removed-unused-BT-modules-from-.patch b/meta-arago-extras/recipes-bsp/ti-compat-bluetooth/files/0001-compat-bluetooth-2.6-removed-unused-BT-modules-from-.patch
new file mode 100644
index 0000000..a383e4c
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/ti-compat-bluetooth/files/0001-compat-bluetooth-2.6-removed-unused-BT-modules-from-.patch
@@ -0,0 +1,47 @@
+From 267cb471c7b182786f58a2a74f3d8bc977cb4527 Mon Sep 17 00:00:00 2001
+From: Vita Preskovsky <vitap@ti.com>
+Date: Thu, 29 Dec 2011 16:09:36 +0200
+Subject: [PATCH] compat-bluetooth-2.6: removed unused BT modules from compilation
+
+  * config.mk is changed to not compile unused BT modules
+
+ Signed-off-by: Vita Preskovsky <vitap@ti.com>
+---
+ config.mk |   10 +++++-----
+ 1 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/config.mk b/config.mk
+index f09d16d..56ac6df 100644
+--- a/config.mk
++++ b/config.mk
+@@ -226,14 +226,14 @@ ifndef CONFIG_COMPAT_KERNEL_2_6_28
+ CONFIG_COMPAT_BT_HIDP=m
+ endif #CONFIG_COMPAT_KERNEL_2_6_28
+
+-CONFIG_BT_HCIUART=M
++CONFIG_BT_HCIUART=m
+ CONFIG_BT_HCIUART_H4=y
+ CONFIG_BT_HCIUART_BCSP=y
+-CONFIG_BT_HCIUART_ATH3K=y
++#CONFIG_BT_HCIUART_ATH3K=y
+ CONFIG_BT_HCIUART_LL=y
+
+ CONFIG_BT_HCIVHCI=m
+-CONFIG_BT_MRVL=m
++#CONFIG_BT_MRVL=m
+
+ ifdef CONFIG_PCMCIA
+ CONFIG_BT_HCIDTL1=m
+@@ -606,8 +606,8 @@ CONFIG_IWM=m
+ # CONFIG_IWM_DEBUG=y
+ # CONFIG_IWM_TRACING=y
+
+-CONFIG_BT_HCIBTSDIO=m
+-CONFIG_BT_MRVL_SDIO=m
++#CONFIG_BT_HCIBTSDIO=m
++#CONFIG_BT_MRVL_SDIO=m
+
+ ifndef CONFIG_COMPAT_KERNEL_2_6_27
+ CONFIG_ATH6KL=m
+--
+1.7.0.4
diff --git a/meta-arago-extras/recipes-bsp/ti-compat-bluetooth/files/0001-compat-bluetooth-fixing-kernel-panic-in-l2cap.patch b/meta-arago-extras/recipes-bsp/ti-compat-bluetooth/files/0001-compat-bluetooth-fixing-kernel-panic-in-l2cap.patch
new file mode 100644
index 0000000..db04b5c
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/ti-compat-bluetooth/files/0001-compat-bluetooth-fixing-kernel-panic-in-l2cap.patch
@@ -0,0 +1,54 @@
+From 95bb5df2c28a51790ab3d63b34e417e2fc9c6235 Mon Sep 17 00:00:00 2001
+From: Vita Preskovsky <vitap@ti.com>
+Date: Tue, 12 Jun 2012 17:56:02 +0300
+Subject: [PATCH] compat-bluetooth: fixing kernel panic in l2cap
+
+ * fixing kernel panic in l2cap layer. The problem appears
+   for first time in new version R5.00.18.
+
+Upstream-Status: Pending
+
+Signed-off-by: Vita Preskovsky <vitap@ti.com>
+---
+ include/net/bluetooth/l2cap.h |    1 +
+ net/bluetooth/l2cap_core.c    |    6 +++++-
+ 2 files changed, 6 insertions(+), 1 deletions(-)
+
+diff --git a/include/net/bluetooth/l2cap.h b/include/net/bluetooth/l2cap.h
+index c0d168a..5651a70 100644
+--- a/include/net/bluetooth/l2cap.h
++++ b/include/net/bluetooth/l2cap.h
+@@ -494,6 +494,7 @@ struct l2cap_chan {
+
+	struct list_head list;
+	struct list_head global_l;
++	bool global_b;
+
+	void		*data;
+	struct l2cap_ops *ops;
+diff --git a/net/bluetooth/l2cap_core.c b/net/bluetooth/l2cap_core.c
+index ffa2f6b..847dabc 100644
+--- a/net/bluetooth/l2cap_core.c
++++ b/net/bluetooth/l2cap_core.c
+@@ -316,6 +316,7 @@ struct l2cap_chan *l2cap_chan_create(struct sock *sk)
+
+	write_lock_bh(&chan_list_lock);
+	list_add(&chan->global_l, &chan_list);
++	chan->global_b = true;
+	write_unlock_bh(&chan_list_lock);
+
+	INIT_DELAYED_WORK(&chan->chan_timer, l2cap_chan_timeout);
+@@ -332,7 +333,10 @@ struct l2cap_chan *l2cap_chan_create(struct sock *sk)
+ void l2cap_chan_destroy(struct l2cap_chan *chan)
+ {
+	write_lock_bh(&chan_list_lock);
+-	list_del(&chan->global_l);
++	if (chan->global_b) {
++		list_del(&chan->global_l);
++		chan->global_b = false;
++	}
+	write_unlock_bh(&chan_list_lock);
+
+	chan_put(chan);
+--
+1.7.0.4
diff --git a/meta-arago-extras/recipes-bsp/ti-compat-bluetooth/files/0002-Bluetooth-Fix-l2cap-conn-failures-for-ssp-devices.patch b/meta-arago-extras/recipes-bsp/ti-compat-bluetooth/files/0002-Bluetooth-Fix-l2cap-conn-failures-for-ssp-devices.patch
new file mode 100644
index 0000000..bf7bf47
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/ti-compat-bluetooth/files/0002-Bluetooth-Fix-l2cap-conn-failures-for-ssp-devices.patch
@@ -0,0 +1,45 @@
+From 18daf1644e634bae951a6e3d4d19d89170209762 Mon Sep 17 00:00:00 2001
+From: Peter Hurley <peter@hurleysoftware.com>
+Date: Fri, 13 Jan 2012 15:11:30 +0100
+Subject: [PATCH] Bluetooth: Fix l2cap conn failures for ssp devices
+
+Commit 330605423c fixed l2cap conn establishment for non-ssp remote
+devices by not setting HCI_CONN_ENCRYPT_PEND every time conn security
+is tested (which was always returning failure on any subsequent
+security checks).
+
+However, this broke l2cap conn establishment for ssp remote devices
+when an ACL link was already established at SDP-level security. This
+fix ensures that encryption must be pending whenever authentication
+is also pending.
+
+Signed-off-by: Peter Hurley <peter@hurleysoftware.com>
+Tested-by: Daniel Wagner <daniel.wagner@bmw-carit.de>
+Acked-by: Marcel Holtmann <marcel@holtmann.org>
+Signed-off-by: Johan Hedberg <johan.hedberg@intel.com>
+
+Upstream-Status: Backported
+From 18daf1644e634bae951a6e3d4d19d89170209762 in Linux kernel git
+
+Signed-off-by: Moosa Baransi <moosab@ti.com>
+---
+ net/bluetooth/hci_conn.c |    4 ++++
+ 1 files changed, 4 insertions(+), 0 deletions(-)
+
+diff --git a/net/bluetooth/hci_conn.c b/net/bluetooth/hci_conn.c
+index 3db4324..07bc69e 100644
+--- a/net/bluetooth/hci_conn.c
++++ b/net/bluetooth/hci_conn.c
+@@ -635,6 +635,10 @@ static int hci_conn_auth(struct hci_conn *conn, __u8 sec_level, __u8 auth_type)
+
+	if (!test_and_set_bit(HCI_CONN_AUTH_PEND, &conn->pend)) {
+		struct hci_cp_auth_requested cp;
++
++		/* encrypt must be pending if auth is also pending */
++		set_bit(HCI_CONN_ENCRYPT_PEND, &conn->pend);
++
+		cp.handle = cpu_to_le16(conn->handle);
+		hci_send_cmd(conn->hdev, HCI_OP_AUTH_REQUESTED,
+							sizeof(cp), &cp);
+--
+1.7.4.1
diff --git a/meta-arago-extras/recipes-bsp/ti-compat-bluetooth/ti-compat-bluetooth_1.0.bb b/meta-arago-extras/recipes-bsp/ti-compat-bluetooth/ti-compat-bluetooth_1.0.bb
new file mode 100644
index 0000000..e9fc22b
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/ti-compat-bluetooth/ti-compat-bluetooth_1.0.bb
@@ -0,0 +1,39 @@
+DESCRIPTION = "TI compat-bluetooth drivers"
+HOMEPAGE = "https://gforge.ti.com/gf/project/ecs_nlcp/"
+SECTION = "kernel/modules"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=d7810fab7487fb0aad327b76f1be7cd7"
+
+inherit module
+
+RDEPENDS_${PN} = "ti-compat-wireless-wl12xx"
+
+PR = "${MACHINE_KERNEL_PR}"
+PR_append = "a"
+
+COMPAT_BLUETOOTH_VERSION = "2012-05-22-r5-18"
+TAG = "${@'${COMPAT_BLUETOOTH_VERSION}'.replace('-', '')}"
+PV = "0.${TAG}"
+
+SRC_URI = "https://gforge.ti.com/gf/download/frsrelease/865/5622/compat-bluetooth-wl12xx-2012-05-22-r5-18.tgz \
+           file://0001-compat-bluetooth-2.6-removed-unused-BT-modules-from-.patch \
+           file://0002-Bluetooth-Fix-l2cap-conn-failures-for-ssp-devices.patch \
+           file://0001-compat-bluetooth-fixing-kernel-panic-in-l2cap.patch \
+          "
+
+SRC_URI[md5sum] = "85118756a605ebd8f4fbff19995368a6"
+SRC_URI[sha256sum] = "d250a6447de54f0776a12ca604bf2a2a48b022108b699de5008f48462e535393"
+
+S = "${WORKDIR}/compat-bluetooth/"
+
+EXTRA_OEMAKE = "KLIB_BUILD=${STAGING_KERNEL_DIR} KLIB=${D}"
+
+do_configure() {
+    cd ${S}
+    ./scripts/driver-select bt
+}
+
+do_install() {
+    oe_runmake DEPMOD=echo DESTDIR="${D}" INSTALL_MOD_PATH="${D}" LDFLAGS="" install-modules
+    find ${D} -name compat.ko | xargs rm
+}
-- 
1.7.0.4


