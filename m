Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f176.google.com (mail-ob0-f176.google.com
	[209.85.214.176])
	by arago-project.org (Postfix) with ESMTPS id C6EBA529E1
	for <meta-arago@arago-project.org>;
	Fri, 25 Jan 2013 21:58:10 +0000 (UTC)
Received: by mail-ob0-f176.google.com with SMTP id v19so1019619obq.7
	for <meta-arago@arago-project.org>;
	Fri, 25 Jan 2013 13:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=7oWrG/ydqjQtU93SqlSF3IbXIpCCpt14cAaKCHb/d4k=;
	b=jp2dzoFlwInVIb3drGvuFG7jiz8jmrRpCZC4LpoWD2rn4yft+7sp01rmTs2wFSkKZC
	bKyfkRJ4p3XJslbYDJXw1Y0ThurmKrRIemZBUuyJ8Dq1rgSgChmQ5YTtFVA/tjDErskb
	a8wWu8dxAmUdquoZqFddPOGpPCmZpndQikARpuhvSH9WNWZqmIULQNTDU6LKeClU454Z
	0aIWD2QdV8Zura8g+bEmnqYNXZE6REy6KyoxENafNWfKgBO3uj0u+lBBR2M8Ou7L3dEM
	ktw6Cz0QRTjPwUWFGOxZwvbntzW7Jp0evcWsnqHsvbBIzS5xouOdbULfT5Ei6AjSSACt
	o+bg==
X-Received: by 10.60.171.170 with SMTP id av10mr5843676oec.78.1359151090160;
	Fri, 25 Jan 2013 13:58:10 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id y4sm1625632oea.7.2013.01.25.13.58.08
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 13:58:09 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Fri, 25 Jan 2013 15:53:47 -0600
Message-Id: <1359150851-23602-6-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1359150851-23602-1-git-send-email-fcooper@ti.com>
References: <1359150851-23602-1-git-send-email-fcooper@ti.com>
Cc: Eyal Reizer <eyalr@ti.com>
Subject: [PATCH 07/31] wpa-supplicant: update based on wlan r5_sp3 release
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
X-List-Received-Date: Fri, 25 Jan 2013 21:58:11 -0000

From: Eyal Reizer <eyalr@ti.com>

Update to use the new version released with wlan r5_sp3 release.

Signed-off-by: Eyal Reizer <eyalr@ti.com>
---
 ...ken-rx-action-frame-handling-INTERNAL-SQU.patch |   86 +++++++++++++
 ...ant-dbus-AP-Add-support-for-WPS-Internal-.patch |  134 --------------------
 .../wpa-supplicant/wpa-supplicant/defconfig        |    4 +
 .../wpa-supplicant/wpa-supplicant_git.bb           |   14 +-
 4 files changed, 97 insertions(+), 141 deletions(-)
 create mode 100644 meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-P2P-Fix-broken-rx-action-frame-handling-INTERNAL-SQU.patch
 delete mode 100644 meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-wpa_supplicant-dbus-AP-Add-support-for-WPS-Internal-.patch

diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-P2P-Fix-broken-rx-action-frame-handling-INTERNAL-SQU.patch b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-P2P-Fix-broken-rx-action-frame-handling-INTERNAL-SQU.patch
new file mode 100644
index 0000000..b991357
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-P2P-Fix-broken-rx-action-frame-handling-INTERNAL-SQU.patch
@@ -0,0 +1,86 @@
+From 4e1835b2ccb4698e8e7022522928317d219bca32 Mon Sep 17 00:00:00 2001
+From: Eyal Shapira <eyal@wizery.com>
+Date: Tue, 13 Nov 2012 03:00:21 +0200
+Subject: [PATCH] P2P: Fix broken rx action frame handling (INTERNAL-SQUASH)
+
+Commit "P2P: Fix duplicate handling of rx action frames"
+went too far and dropped any rx action frames arriving on the GO
+interface. It assumed that any action frames were duplicated
+and received on both GO interface and P2P device interface.
+This is wrong as some actions frames like P2P presence request
+are sent to the GO interface address and won't be duplicated.
+
+The root cause of the duplication lies within the Rx path in mac80211
+in Johannes` patch "mac80211: accept public action frames with mismatched BSSID".
+When wpa_s works with a separate group interface this creates a duplicated Rx
+on both the P2P dev interface and the GO interface.
+
+Fix the issue by canceling the duplication in wpa_s and discarding
+public action frames with unmatching bssid arriving on a dedicated GO interface
+
+(This should be squashed with
+"P2P: Fix duplicate handling of rx action frames")
+
+Signed-off-by: Eyal Shapira <eyal@wizery.com>
+---
+ src/p2p/p2p.h                   |    5 +++++
+ src/p2p/p2p_i.h                 |    1 -
+ wpa_supplicant/p2p_supplicant.c |   16 +++++++++++++---
+ 3 files changed, 18 insertions(+), 4 deletions(-)
+
+diff --git a/src/p2p/p2p.h b/src/p2p/p2p.h
+index 3c439f3..a60974f 100644
+--- a/src/p2p/p2p.h
++++ b/src/p2p/p2p.h
+@@ -1726,4 +1726,9 @@ int p2p_prepare_channel(struct p2p_data *p2p, unsigned int force_freq);
+ void p2p_set_config_timeout(struct p2p_data *p2p, u8 go_timeout,
+ 			    u8 client_timeout);
+ 
++/**
++ * p2p_group_get_interface_addr - Get the interface address of a P2P group
++ * @group: P2P group context from p2p_group_init()
++ */
++const u8 *p2p_group_get_interface_addr(struct p2p_group *group);
+ #endif /* P2P_H */
+diff --git a/src/p2p/p2p_i.h b/src/p2p/p2p_i.h
+index d254818..9e3fd6f 100644
+--- a/src/p2p/p2p_i.h
++++ b/src/p2p/p2p_i.h
+@@ -557,7 +557,6 @@ struct p2p_noa_desc {
+ };
+ 
+ /* p2p_group.c */
+-const u8 * p2p_group_get_interface_addr(struct p2p_group *group);
+ u8 p2p_group_presence_req(struct p2p_group *group,
+ 			  const u8 *client_interface_addr,
+ 			  const u8 *noa, size_t noa_len);
+diff --git a/wpa_supplicant/p2p_supplicant.c b/wpa_supplicant/p2p_supplicant.c
+index d8d72da..42c062f 100644
+--- a/wpa_supplicant/p2p_supplicant.c
++++ b/wpa_supplicant/p2p_supplicant.c
+@@ -4137,9 +4137,19 @@ void wpas_p2p_rx_action(struct wpa_supplicant *wpa_s, const u8 *da,
+ 	if (wpa_s->global->p2p == NULL)
+ 		return;
+ 
+-	if (wpa_s->p2p_group_interface != NOT_P2P_GROUP_INTERFACE) {
+-		wpa_printf(MSG_DEBUG, "Discard RX action event on P2P "
+-			   "GO/CLI iface. P2P Device interface will handle it");
++	/*
++	 * Discard an Rx duplication created by mac80211 rx path
++	 * when receiving public action frames with mismatched BSSID
++	 * In case of separate GO interface such public action frames (prov disc
++	 * dev disc, invites) these should be handled by the P2P dev interface
++	 */
++	if (wpa_s->p2p_group_interface == P2P_GROUP_INTERFACE_GO &&
++	    category == WLAN_ACTION_PUBLIC &&
++	    wpa_s->p2p_group &&
++	    os_memcmp(bssid, p2p_group_get_interface_addr(wpa_s->p2p_group),
++		      ETH_ALEN)) {
++		wpa_printf(MSG_DEBUG, "Discard duplicate RX action event on"
++			   " P2P GO interface");
+ 		return;
+ 	}
+ 
+-- 
+1.7.9.5
+
diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-wpa_supplicant-dbus-AP-Add-support-for-WPS-Internal-.patch b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-wpa_supplicant-dbus-AP-Add-support-for-WPS-Internal-.patch
deleted file mode 100644
index 15ec6fe..0000000
--- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-wpa_supplicant-dbus-AP-Add-support-for-WPS-Internal-.patch
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
diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig
index 9b9882a..b982e2a 100755
--- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig
+++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig
@@ -424,3 +424,7 @@ CONFIG_DEBUG_FILE=y
 # for p2p
 CONFIG_P2P=y
 CONFIG_AP=y
+
+# IEEE 802.11n (High Throughput) support
+CONFIG_IEEE80211N=y
+
diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant_git.bb b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant_git.bb
index 6236ab3..c471c4c 100644
--- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant_git.bb
+++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant_git.bb
@@ -6,9 +6,9 @@ HOMEPAGE = "http://hostap.epitest.fi/wpa_supplicant/"
 BUGTRACKER = "http://hostap.epitest.fi/bugz/"
 SECTION = "network"
 LICENSE = "GPLv2 | BSD"
-LIC_FILES_CHKSUM = "file://../COPYING;md5=c54ce9345727175ff66d17b67ff51f58 \
-                    file://../README;md5=79cddd95f8b7539aced400f6aab996e9 \
-                    file://wpa_supplicant.c;beginline=1;endline=17;md5=009c87d612d92175fe8cd1e93137bf42"
+LIC_FILES_CHKSUM = "file://../COPYING;md5=ab87f20cd7e8c0d0a6539b34d3791d0e \
+                    file://../README;md5=5cb758942d25f6f61fd4ac388fd446fa \
+                    file://wpa_supplicant.c;beginline=1;endline=17;md5=8835156c8ab8cad6356ec7f39ebe3aba"
 DEPENDS = "gnutls dbus libnl openssl ${@base_contains("COMBINED_FEATURES", "madwifi", "madwifi-ng", "",d)}"
 RRECOMMENDS_${PN} = "wpa-supplicant-passphrase wpa-supplicant-cli"
 
@@ -16,10 +16,10 @@ RRECOMMENDS_${PN} = "wpa-supplicant-passphrase wpa-supplicant-cli"
 # wpa-supplicant the DEFAULT_PREFERENCE will be set to -1.
 DEFAULT_PREFERENCE = "-1"
 
-SRCREV = "ol_R5.00.18"
-PR = "r0+gitr${SRCPV}"
+SRCREV = "ol_R5.SP3.05"
+PR = "r1+gitr${SRCPV}"
 # Add ti to the PV to indicate that this is a TI modify version of wpa-supplicant.
-PV = "0.7.3+0.8.0-rc-ti"
+PV = "2.0-devel-ti"
 
 SRC_URI = "git://github.com/TI-OpenLink/hostap.git;protocol=git \
            file://defconfig \
@@ -28,10 +28,10 @@ SRC_URI = "git://github.com/TI-OpenLink/hostap.git;protocol=git \
            file://wpa_supplicant.conf \
            file://wpa_supplicant.conf-sane \
            file://99_wpa_supplicant \
-           file://0001-wpa_supplicant-dbus-AP-Add-support-for-WPS-Internal-.patch;patchdir=.. \
            file://wpa_supplicant.conf \
            file://fi.epitest.hostap.WPASupplicant.service \
            file://fi.w1.wpa_supplicant1.service \
+           file://0001-P2P-Fix-broken-rx-action-frame-handling-INTERNAL-SQU.patch;patchdir=.. \
           "
 
 S = "${WORKDIR}/git/wpa_supplicant"
-- 
1.7.0.4


