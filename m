Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 36BFE52ACF
	for <meta-arago@arago-project.org>;
	Wed, 25 Jan 2017 22:02:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 246AD20B1D;
	Wed, 25 Jan 2017 22:02:13 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id n-xjpnQPN5LF; Wed, 25 Jan 2017 22:02:13 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DDDD7208B1;
	Wed, 25 Jan 2017 22:02:11 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by mail.denix.org (Postfix) with ESMTP id 5E20116231F;
	Wed, 25 Jan 2017 17:02:11 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Wed, 25 Jan 2017 17:02:10 -0500
Message-Id: <1485381730-3351-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] recipes: remove old recipes and bbappends for bluez4 specific packages
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
X-List-Received-Date: Wed, 25 Jan 2017 22:02:13 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../0001-bluez-enable-source-interface.patch       |  30 ------
 .../bluez4/0001-socket-enable-for-bluez-4_98.patch |  24 -----
 ...synchronization-between-bluetoothd-and-dr.patch |  49 ---------
 .../bluez/bluez4_4.101.bbappend                    |  25 -----
 .../recipes-connectivity/obex/openobex_%.bbappend  |  19 ----
 .../0001-obexd-fix-UTF-conversions.patch           | 118 ---------------------
 .../0001-obexd-make-OPP-push-timeout-longer.patch  |  44 --------
 .../recipes-connectivity/obexd/obexd_0.34.bbappend |   7 --
 .../recipes-connectivity/obexd/obexd_0.34.bb       |  23 ----
 .../oppserver/oppserver_1.0.bb                     |  17 ---
 .../ussp-push/ussp-push-0.11/hci_remote_name.patch |  13 ---
 .../ussp-push/ussp-push_0.11.bb                    |  20 ----
 12 files changed, 389 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-connectivity/bluez/bluez4/0001-bluez-enable-source-interface.patch
 delete mode 100644 meta-arago-distro/recipes-connectivity/bluez/bluez4/0001-socket-enable-for-bluez-4_98.patch
 delete mode 100644 meta-arago-distro/recipes-connectivity/bluez/bluez4/bluez4-fix-synchronization-between-bluetoothd-and-dr.patch
 delete mode 100644 meta-arago-distro/recipes-connectivity/bluez/bluez4_4.101.bbappend
 delete mode 100644 meta-arago-distro/recipes-connectivity/obex/openobex_%.bbappend
 delete mode 100644 meta-arago-distro/recipes-connectivity/obexd/obexd-0.34/0001-obexd-fix-UTF-conversions.patch
 delete mode 100644 meta-arago-distro/recipes-connectivity/obexd/obexd-0.34/0001-obexd-make-OPP-push-timeout-longer.patch
 delete mode 100644 meta-arago-distro/recipes-connectivity/obexd/obexd_0.34.bbappend
 delete mode 100644 meta-arago-extras/recipes-connectivity/obexd/obexd_0.34.bb
 delete mode 100644 meta-arago-extras/recipes-connectivity/oppserver/oppserver_1.0.bb
 delete mode 100644 meta-arago-extras/recipes-connectivity/ussp-push/ussp-push-0.11/hci_remote_name.patch
 delete mode 100644 meta-arago-extras/recipes-connectivity/ussp-push/ussp-push_0.11.bb

diff --git a/meta-arago-distro/recipes-connectivity/bluez/bluez4/0001-bluez-enable-source-interface.patch b/meta-arago-distro/recipes-connectivity/bluez/bluez4/0001-bluez-enable-source-interface.patch
deleted file mode 100644
index a705c4e..0000000
--- a/meta-arago-distro/recipes-connectivity/bluez/bluez4/0001-bluez-enable-source-interface.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 87bcf52a6e9f2ec018bab9dd0da2a2b844b37108 Mon Sep 17 00:00:00 2001
-From: Moosa <moosab@ti.com>
-Date: Wed, 14 Mar 2012 16:43:57 +0200
-Subject: [PATCH] bluez: enable source interface
-
-Enable Source interface on D-Bus that can be used to access
-the Sink functionality
-
-Upstream-Status: Inappropriate [enable feature]
-
-Signed-off-by: Moosa Baransi <moosab@ti.com>
----
- audio/audio.conf |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/audio/audio.conf b/audio/audio.conf
-index 9533ada..b554936 100644
---- a/audio/audio.conf
-+++ b/audio/audio.conf
-@@ -3,7 +3,7 @@
- # This section contains options which are not specific to any
- # particular interface
- [General]
--Enable=Socket
-+Enable=Socket,Source
-
- # Switch to master role for incoming connections (defaults to true)
- #Master=true
---
-1.7.1
diff --git a/meta-arago-distro/recipes-connectivity/bluez/bluez4/0001-socket-enable-for-bluez-4_98.patch b/meta-arago-distro/recipes-connectivity/bluez/bluez4/0001-socket-enable-for-bluez-4_98.patch
deleted file mode 100644
index 025e7fa..0000000
--- a/meta-arago-distro/recipes-connectivity/bluez/bluez4/0001-socket-enable-for-bluez-4_98.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From e142a28897c0b0fe9e61259a96dad6fb9f818ecd Mon Sep 17 00:00:00 2001
-From: Moosa <moosa.baransi@babcomsoftware.com>
-Date: Wed, 22 Feb 2012 10:06:37 +0200
-Subject: [PATCH] socket enable for bluez 0_98
-
-* This is necessary for working with A2DP
----
- audio/audio.conf |    1 +
- 1 files changed, 1 insertions(+), 0 deletions(-)
-
-diff --git a/audio/audio.conf b/audio/audio.conf
-index 302e046..9533ada 100644
---- a/audio/audio.conf
-+++ b/audio/audio.conf
-@@ -3,6 +3,7 @@
- # This section contains options which are not specific to any
- # particular interface
- [General]
-+Enable=Socket
-
- # Switch to master role for incoming connections (defaults to true)
- #Master=true
---
-1.7.1
diff --git a/meta-arago-distro/recipes-connectivity/bluez/bluez4/bluez4-fix-synchronization-between-bluetoothd-and-dr.patch b/meta-arago-distro/recipes-connectivity/bluez/bluez4/bluez4-fix-synchronization-between-bluetoothd-and-dr.patch
deleted file mode 100644
index 7ca0bd7..0000000
--- a/meta-arago-distro/recipes-connectivity/bluez/bluez4/bluez4-fix-synchronization-between-bluetoothd-and-dr.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From ddca351e504dc3cb8d91ea10a1863949699c6e50 Mon Sep 17 00:00:00 2001
-From: Vita Preskovsky <vitap@ti.com>
-Date: Tue, 13 Dec 2011 22:54:47 +0200
-Subject: [PATCH] bluez4: fix synchronization between bluetoothd and driver
-  * To fix situation when bluetoothd doesn't get messages
-    it expects to receive from the kernel. Therefore the
-    the required requests are sent again at the stage when device
-    is up. The mismatch caused to the list of adapters to be
-    empty.
-
-Signed-off-by: Vita Preskovsky <vitap@ti.com>
----
- plugins/hciops.c |   21 +++++++++++++++++++++
- 1 files changed, 21 insertions(+), 0 deletions(-)
-
-diff --git a/plugins/hciops.c b/plugins/hciops.c
-index ecc0e86..e2198ee 100644
---- a/plugins/hciops.c
-+++ b/plugins/hciops.c
-@@ -2512,6 +2512,27 @@ static void device_devup_setup(int index)
-	hci_send_cmd(dev->sk, OGF_HOST_CTL, OCF_READ_STORED_LINK_KEY,
-					READ_STORED_LINK_KEY_CP_SIZE, &cp);
-
-+	/* Even though it shouldn't happen it seems like we might miss
-+	 * initialization commands that kernel sends. So we check it here
-+	 * to avoid situation when we have device but it is not in the list
-+	 * of adapters. */
-+       if (hci_test_bit(PENDING_FEATURES, &dev->pending))
-+               hci_send_cmd(dev->sk, OGF_INFO_PARAM,
-+                                       OCF_READ_LOCAL_FEATURES, 0, NULL);
-+
-+       if (hci_test_bit(PENDING_VERSION, &dev->pending))
-+               hci_send_cmd(dev->sk, OGF_INFO_PARAM,
-+                                       OCF_READ_LOCAL_VERSION, 0, NULL);
-+
-+       if (hci_test_bit(PENDING_NAME, &dev->pending))
-+               hci_send_cmd(dev->sk, OGF_HOST_CTL,
-+                                       OCF_READ_LOCAL_NAME, 0, NULL);
-+
-+       if (hci_test_bit(PENDING_BDADDR, &dev->pending))
-+               hci_send_cmd(dev->sk, OGF_INFO_PARAM,
-+                                       OCF_READ_BD_ADDR, 0, NULL);
-+
-+
-	if (!dev->pending)
-		init_adapter(index);
- }
---
-1.7.0.4
diff --git a/meta-arago-distro/recipes-connectivity/bluez/bluez4_4.101.bbappend b/meta-arago-distro/recipes-connectivity/bluez/bluez4_4.101.bbappend
deleted file mode 100644
index 21d696c..0000000
--- a/meta-arago-distro/recipes-connectivity/bluez/bluez4_4.101.bbappend
+++ /dev/null
@@ -1,25 +0,0 @@
-PR_append = ".arago2"
-
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-SRC_URI += "file://bluez4-fix-synchronization-between-bluetoothd-and-dr.patch \
-            file://0001-socket-enable-for-bluez-4_98.patch \
-            file://0001-bluez-enable-source-interface.patch \
-"
-# udev 150-170 provide its on hid2hci tool and udev rules for it. Therefore,
-# disabling hid2hci from bluez4.
-
-EXTRA_OECONF_remove = "--enable-hid2hci"
-EXTRA_OECONF_remove = "--disable-hidd"
-EXTRA_OECONF_append = " --enable-hid"
-
-DEPENDS += "libsndfile1"
-
-# Add test/agent for testing
-PACKAGES =+ "bluez4-agent"
-
-do_install_append () {
-    ${TARGET_SYS}-libtool --mode=install install -c 'test/agent' ${D}${bindir}/agent
-}
-
-FILES_bluez4-agent = "${bindir}/agent"
diff --git a/meta-arago-distro/recipes-connectivity/obex/openobex_%.bbappend b/meta-arago-distro/recipes-connectivity/obex/openobex_%.bbappend
deleted file mode 100644
index 5af0b4c..0000000
--- a/meta-arago-distro/recipes-connectivity/obex/openobex_%.bbappend
+++ /dev/null
@@ -1,19 +0,0 @@
-PR_append = ".arago2"
-
-# Add apps/obex_test for testing
-do_configure_prepend() {
-	sed -i -e 's:bin_PROGRAMS = irxfer obex_tcp irobex_palm3:bin_PROGRAMS = irxfer obex_tcp irobex_palm3 obex_test:g' ${S}/apps/Makefile.am
-	( cd ${S}; autoreconf -f -i -s )
-}
-
-# tell the openobex configure script NOT to enable syslog and dump.
-# enabling log and dump prints lots of debug messages and hex dump value during BT
-# file transfer using openobex, due to which BT transfer get slow.
-
-EXTRA_OECONF_remove = "--enable-syslog"
-EXTRA_OECONF_remove = "--enable-dump"
-
-# WiLink Bluetooth application build depends on libmisc.a.
-do_install_append() {
-	install -m 644 ${B}/apps/libmisc.a ${D}/${libdir}
-}
diff --git a/meta-arago-distro/recipes-connectivity/obexd/obexd-0.34/0001-obexd-fix-UTF-conversions.patch b/meta-arago-distro/recipes-connectivity/obexd/obexd-0.34/0001-obexd-fix-UTF-conversions.patch
deleted file mode 100644
index 24d1958..0000000
--- a/meta-arago-distro/recipes-connectivity/obexd/obexd-0.34/0001-obexd-fix-UTF-conversions.patch
+++ /dev/null
@@ -1,118 +0,0 @@
-From 856e73619bc4ddf2d44e4b969d785c1afc0773a7 Mon Sep 17 00:00:00 2001
-From: Moosa <moosab@ti.com>
-Date: Tue, 13 Mar 2012 16:27:11 +0200
-Subject: [PATCH] obexd: fix UTF conversions
-
-* Implements the UTF16BE to UTF8 conversion
-
-The glib library may not support conversion from UTF16BE to UTF8 (which
-is needed to get the name of a file received in obexd), Specifically,
-when glib is complied to use native iconv which does not support it
-(and not use libiconv, GNU's iconv library, which does).
-
-Upstream-Status: Inappropriate [Needed only since glib doesn't have UTF conversion support]
-
-Signed-off-by: Moosa Baransi <moosab@ti.com>
----
- src/obex.c |   64 ++++++++++++++++++++++++++++++++++++++++++++++++++++++-----
- 1 files changed, 58 insertions(+), 6 deletions(-)
-
-diff --git a/src/obex.c b/src/obex.c
-index ab7125c..b0f6106 100644
---- a/src/obex.c
-+++ b/src/obex.c
-@@ -179,6 +179,61 @@ static struct {
- 	{ 0xFF,					NULL			},
- };
- 
-+#if __BYTE_ORDER == __LITTLE_ENDIAN
-+	#define BETOH16(sh) ((sh>>8)|(sh<<8))
-+#elif __BYTE_ORDER == __BIG_ENDIAN
-+	#define BETOH16(sh) (sh)
-+#else
-+#error "Unknown byte order"
-+#endif
-+
-+char *utf16be_to_utf8(const char *instr_ch, size_t inlen_ch)
-+{
-+	uint16_t *instr = (uint16_t*)instr_ch;
-+	size_t inlen = inlen_ch / 2; 
-+	uint16_t val,ext;
-+	size_t in_i = 0, out_i = 0;
-+	char *outstr = NULL;
-+
-+	if (inlen_ch % 2 != 0) {
-+		error("%s(): odd number!",__func__);
-+		return NULL;
-+	}
-+
-+	outstr = g_malloc(inlen + 1);
-+	if (outstr == NULL) {
-+		error("%s(): g_malloc failed",__func__);
-+		return NULL;
-+	}	
-+
-+	while (in_i < inlen) {
-+		val = BETOH16(instr[in_i]); 
-+		in_i++;
-+		if ((val & 0xf800) == 0xd800) {	
-+			if (in_i < inlen) {
-+				error("%s(): cut short",__func__);
-+				g_free(outstr);
-+				return NULL;
-+			}
-+			ext = BETOH16(instr[in_i]);
-+			in_i++;
-+			if ( ((val & 0xfc00) != 0xd800) || 
-+			     ((ext & 0xfc00) != 0xdc00) ) {
-+				error("%s(): illegal sequence",
-+					__func__);
-+				g_free(outstr);
-+				return NULL;
-+			}
-+			val = ((val & 0x3ff) << 10) + 
-+				(ext & 0x3ff) + 0x10000;
-+		}
-+		outstr[out_i] = val;
-+		out_i++;
-+	}
-+	outstr[out_i++] = '\x00';
-+	return outstr;
-+}
-+
- static void print_event(int evt, int cmd, int rsp)
- {
- 	const char *evtstr = NULL, *cmdstr = NULL, *rspstr = NULL;
-@@ -736,8 +791,7 @@ static void cmd_get(struct obex_session *os, obex_t *obex, obex_object_t *obj)
- 			if (hlen == 0)
- 				continue;
- 
--			os->name = g_convert((const char *) hd.bs, hlen,
--					"UTF8", "UTF16BE", NULL, NULL, NULL);
-+			os->name = utf16be_to_utf8((const char *) hd.bs, hlen);
- 			DBG("OBEX_HDR_NAME: %s", os->name);
- 			break;
- 		case OBEX_HDR_TYPE:
-@@ -857,8 +911,7 @@ static void cmd_setpath(struct obex_session *os,
- 			break;
- 		}
- 
--		os->name = g_convert((const char *) hd.bs, hlen,
--				"UTF8", "UTF16BE", NULL, NULL, NULL);
-+		os->name = utf16be_to_utf8((const char *) hd.bs, hlen);
- 
- 		DBG("Set path name: %s", os->name);
- 		break;
-@@ -954,8 +1007,7 @@ static gboolean check_put(obex_t *obex, obex_object_t *obj)
- 			if (hlen == 0)
- 				continue;
- 
--			os->name = g_convert((const char *) hd.bs, hlen,
--					"UTF8", "UTF16BE", NULL, NULL, NULL);
-+			os->name = utf16be_to_utf8((const char *) hd.bs, hlen);
- 			DBG("OBEX_HDR_NAME: %s", os->name);
- 			break;
- 
--- 
-1.7.1
-
diff --git a/meta-arago-distro/recipes-connectivity/obexd/obexd-0.34/0001-obexd-make-OPP-push-timeout-longer.patch b/meta-arago-distro/recipes-connectivity/obexd/obexd-0.34/0001-obexd-make-OPP-push-timeout-longer.patch
deleted file mode 100644
index 626f802..0000000
--- a/meta-arago-distro/recipes-connectivity/obexd/obexd-0.34/0001-obexd-make-OPP-push-timeout-longer.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 5d6d09c2338ae62796c2a326340e81320faf3593 Mon Sep 17 00:00:00 2001
-From: Vita Preskovsky <vitap@ti.com>
-Date: Wed, 19 Sep 2012 13:05:18 +0200
-Subject: [PATCH] obexd: make OPP push timeout longer
-
-Current OPP push timeout is not long enough for user to confirm on OPP server
-to receive file. As a result, OPP client exists with error.
-
-
-Signed-off-by: Vita Preskovsky <vitap@ti.com>
----
- plugins/bluetooth.c |    2 +-
- src/manager.c       |    2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/plugins/bluetooth.c b/plugins/bluetooth.c
-index 851daa2..204ccf5 100644
---- a/plugins/bluetooth.c
-+++ b/plugins/bluetooth.c
-@@ -46,7 +46,7 @@
- #define BT_RX_MTU 32767
- #define BT_TX_MTU 32767
- 
--#define TIMEOUT 60*1000 /* Timeout for user response (miliseconds) */
-+#define TIMEOUT 180*1000 /* Timeout for user response (miliseconds) */
- 
- struct pending_request {
- 	DBusPendingCall *call;
-diff --git a/src/manager.c b/src/manager.c
-index 80140b6..e64a433 100644
---- a/src/manager.c
-+++ b/src/manager.c
-@@ -52,7 +52,7 @@
- #define TRANSFER_INTERFACE OPENOBEX_SERVICE ".Transfer"
- #define SESSION_INTERFACE OPENOBEX_SERVICE ".Session"
- 
--#define TIMEOUT 60*1000 /* Timeout for user response (miliseconds) */
-+#define TIMEOUT 180*1000 /* Timeout for user response (miliseconds) */
- 
- struct agent {
- 	char *bus_name;
--- 
-1.7.9.5
-
diff --git a/meta-arago-distro/recipes-connectivity/obexd/obexd_0.34.bbappend b/meta-arago-distro/recipes-connectivity/obexd/obexd_0.34.bbappend
deleted file mode 100644
index 89a77d5..0000000
--- a/meta-arago-distro/recipes-connectivity/obexd/obexd_0.34.bbappend
+++ /dev/null
@@ -1,7 +0,0 @@
-PR_append = ".arago1"
-
-FILESEXTRAPATHS_prepend := "${THISDIR}/${P}:"
-
-SRC_URI += "file://0001-obexd-fix-UTF-conversions.patch \
-            file://0001-obexd-make-OPP-push-timeout-longer.patch \
-"
diff --git a/meta-arago-extras/recipes-connectivity/obexd/obexd_0.34.bb b/meta-arago-extras/recipes-connectivity/obexd/obexd_0.34.bb
deleted file mode 100644
index 60199fa..0000000
--- a/meta-arago-extras/recipes-connectivity/obexd/obexd_0.34.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-DESCRIPTION = "OBEX Server and Client"
-DEPENDS = "openobex glib-2.0 dbus bluez4 libical"
-
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
-
-PR = "r1"
-
-SRC_URI = "http://www.kernel.org/pub/linux/bluetooth/obexd-${PV}.tar.gz \
-"
-
-SRC_URI[md5sum] = "36080a767e63e54878cd6bcfb20c4f3b"
-SRC_URI[sha256sum] = "f99fb58562a3d7edef6fd9e63ca04510e241bbdab37fdb122c2c7a112a09100a"
-
-inherit autotools-brokensep pkgconfig
-
-PACKAGES =+ "obex-client obex-plugins"
-
-FILES_${PN} += "${datadir}/dbus-1/services/${PN}.service"
-FILES_obex-client = "${libexecdir}/obex-client \
-                     ${datadir}/dbus-1/services/obex-client.service"
-# currently the plugins are empty
-FILES_obex-plugins = "${libdir}/obex/plugins"
diff --git a/meta-arago-extras/recipes-connectivity/oppserver/oppserver_1.0.bb b/meta-arago-extras/recipes-connectivity/oppserver/oppserver_1.0.bb
deleted file mode 100644
index 71f49ab..0000000
--- a/meta-arago-extras/recipes-connectivity/oppserver/oppserver_1.0.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-DESCRIPTION = "OPP Server"
-DEPENDS = "openobex bluez4"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://oppserver.c;beginline=1;endline=37;md5=c0ee352b095c583115f6600c1b4a3f60"
-
-PR = "r0"
-
-SRC_URI = "https://gforge.ti.com/gf/download/frsrelease/803/5450/oppserver.tar.gz"
-
-S = "${WORKDIR}"
-
-do_install() {
-	oe_runmake 'DEST_DIR=${D}' 'BIN_DIR=${bindir}' install
-}
-
-SRC_URI[md5sum] = "a73b39e9e17153aad488de0f9a25f926"
-SRC_URI[sha256sum] = "c6c4c6c54c1ca6a54b8212e51aa0a2748cebd0c67b1b3560802348fb83b8748e"
diff --git a/meta-arago-extras/recipes-connectivity/ussp-push/ussp-push-0.11/hci_remote_name.patch b/meta-arago-extras/recipes-connectivity/ussp-push/ussp-push-0.11/hci_remote_name.patch
deleted file mode 100644
index 956e048..0000000
--- a/meta-arago-extras/recipes-connectivity/ussp-push/ussp-push-0.11/hci_remote_name.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-diff -urN ussp-push-0.11/src/obex_socket.c ussp-push-0.11_Demo/src/obex_socket.c
---- ussp-push-0.11/src/obex_socket.c	2008-08-25 02:18:53.000000000 +0530
-+++ ussp-push-0.11_Demo/src/obex_socket.c	2010-04-16 15:11:27.000000000 +0530
-@@ -197,7 +197,8 @@
-	for (i = 0; i < niinf; i++) {
-		char devname[128];
-
--		if (hci_remote_name(dd, &piinf[i].bdaddr, sizeof(devname) - 1,
-+		if (hci_read_remote_name(dd, &piinf[i].bdaddr,
-+					sizeof(devname) - 1,
-				    devname, 100000) >= 0) {
-			if (strcasecmp(devname, btname) == 0) {
-				*btaddr = piinf[i].bdaddr;
diff --git a/meta-arago-extras/recipes-connectivity/ussp-push/ussp-push_0.11.bb b/meta-arago-extras/recipes-connectivity/ussp-push/ussp-push_0.11.bb
deleted file mode 100644
index e33cace..0000000
--- a/meta-arago-extras/recipes-connectivity/ussp-push/ussp-push_0.11.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-DESCRIPTION = "OBEX object pusher"
-HOMEPAGE = "http://www.xmailserver.org/ussp-push.html"
-SECTION = "console"
-DEPENDS = "bluez4 openobex"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
-
-PR = "r0"
-
-SRC_URI = "http://www.xmailserver.org/ussp-push-${PV}.tar.gz \
-	       file://hci_remote_name.patch"
-
-S = "${WORKDIR}/ussp-push-${PV}"
-
-EXTRA_OECONF = "--with-bluez-libs=${STAGING_LIBDIR} --with-bluez-includes=${STAGING_INCDIR}"
-
-inherit autotools
-
-SRC_URI[md5sum] = "5c44983ee27809867041feff6bb4423a"
-SRC_URI[sha256sum] = "bb2748eaed6164812555b4a1e186c4f2820c5ef9ce30f12d7aac28a452719bbd"
-- 
2.7.4


