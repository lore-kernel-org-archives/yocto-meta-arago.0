Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id B0D2252A39
	for <meta-arago@arago-project.org>;
	Mon,  1 Apr 2013 14:55:21 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r31EtJbu028480
	for <meta-arago@arago-project.org>; Mon, 1 Apr 2013 09:55:20 -0500
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r31EtJi2011791
	for <meta-arago@arago-project.org>; Mon, 1 Apr 2013 20:25:19 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by dbde70.ent.ti.com
	(172.24.170.148) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 1 Apr 2013 20:25:19 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r31EsxCl020052;
	Mon, 1 Apr 2013 20:25:18 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 1 Apr 2013 09:54:50 -0500
Message-ID: <1364828095-28755-12-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1364828095-28755-1-git-send-email-fcooper@ti.com>
References: <1364828095-28755-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 12/17 v2] wpa-supplicant: Pull back in old r5-00-18 recipe.
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
X-List-Received-Date: Mon, 01 Apr 2013 14:55:22 -0000
Content-Type: text/plain

* Current am180x-evm ships with a PG 2 wilink 6 module that isn't supported in
  newer wilink 6 releases.
* A newer PG 3 wilink 6 module is available for am180x-evm but needs to be
  purchased separately..
* Bring old r5.00.18 wpa-supplicant recipe with updated recipe name
  to add support for am180x-evm default wilink 6 module.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
Version 2 changes:
Remove LICENSE field since it is now located in common .inc file.

 ...ant-dbus-AP-Add-support-for-WPS-Internal-.patch |  134 ++++++++++++++++++++
 .../defconfig                                      |    4 -
 .../wpa-supplicant/wpa-supplicant_r5.00.18.bb      |   13 ++
 3 files changed, 147 insertions(+), 4 deletions(-)
 create mode 100644 meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-r5.00.18/0001-wpa_supplicant-dbus-AP-Add-support-for-WPS-Internal-.patch
 copy meta-arago-extras/recipes-connectivity/wpa-supplicant/{wpa-supplicant-r5.sp4.01 => wpa-supplicant-r5.00.18}/defconfig (99%)
 create mode 100644 meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant_r5.00.18.bb

diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-r5.00.18/0001-wpa_supplicant-dbus-AP-Add-support-for-WPS-Internal-.patch b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-r5.00.18/0001-wpa_supplicant-dbus-AP-Add-support-for-WPS-Internal-.patch
new file mode 100644
index 0000000..15ec6fe
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-r5.00.18/0001-wpa_supplicant-dbus-AP-Add-support-for-WPS-Internal-.patch
@@ -0,0 +1,134 @@
+From 19030351b95f48714007e425eaa2163d9122d788 Mon Sep 17 00:00:00 2001
+From: Gustavo Sverzut Barbieri <barbieri@profusion.mobi>
+Date: Sun, 18 Dec 2011 17:06:31 +0200
+Subject: [PATCH] wpa_supplicant/dbus AP: Add support for WPS Internal
+ Registrar
+
+When in AP mode, wpa_supplicant is now enabling WPS (only Internal
+Registrar). WPS.Start() call can be used to initiate WPS negotiation
+similarly to how this is done in station mode.
+
+This was done to ctrl_iface by Jouni Malinen on April 21, 2009 (commit
+3ec97afe571f159ea95213262c1c6b89965827d4)
+
+Upstream-Status: Submitted [http://lists.shmoo.com/pipermail/hostap/2011-December/024947.html]
+
+Signed-hostap: Gustavo Sverzut Barbieri <barbieri@profusion.mobi>
+---
+ wpa_supplicant/dbus/dbus_new_handlers_wps.c |   72 +++++++++++++++++++++++++--
+ 1 file changed, 67 insertions(+), 5 deletions(-)
+
+diff --git a/wpa_supplicant/dbus/dbus_new_handlers_wps.c b/wpa_supplicant/dbus/dbus_new_handlers_wps.c
+index d8b74d0..a72cfb3 100644
+--- a/wpa_supplicant/dbus/dbus_new_handlers_wps.c
++++ b/wpa_supplicant/dbus/dbus_new_handlers_wps.c
+@@ -19,6 +19,8 @@
+ #include "../config.h"
+ #include "../wpa_supplicant_i.h"
+ #include "../wps_supplicant.h"
++#include "../driver_i.h"
++#include "../ap.h"
+ #include "dbus_new_helpers.h"
+ #include "dbus_new.h"
+ #include "dbus_new_handlers.h"
+@@ -30,6 +32,7 @@ struct wps_start_params {
+	int type; /* 0 - not set, 1 - pin,      2 - pbc       */
+	u8 *bssid;
+	char *pin;
++	u8 *p2p_dev_addr;
+ };
+
+
+@@ -148,6 +151,41 @@ static int wpas_dbus_handler_wps_pin(DBusMessage *message,
+ }
+
+
++#ifdef CONFIG_P2P
++static int wpas_dbus_handler_wps_p2p_dev_addr(DBusMessage *message,
++					      DBusMessageIter *entry_iter,
++					      struct wps_start_params *params,
++					      DBusMessage **reply)
++{
++	DBusMessageIter variant_iter, array_iter;
++	int len;
++
++	dbus_message_iter_recurse(entry_iter, &variant_iter);
++	if (dbus_message_iter_get_arg_type(&variant_iter) != DBUS_TYPE_ARRAY ||
++	    dbus_message_iter_get_element_type(&variant_iter) !=
++	    DBUS_TYPE_BYTE) {
++		wpa_printf(MSG_DEBUG, "dbus: WPS.Start - Wrong "
++			   "P2PDeviceAddress type, byte array required");
++		*reply = wpas_dbus_error_invalid_args(
++			message, "P2PDeviceAddress must be a byte array");
++		return -1;
++	}
++	dbus_message_iter_recurse(&variant_iter, &array_iter);
++	dbus_message_iter_get_fixed_array(&array_iter, &params->p2p_dev_addr,
++					  &len);
++	if (len != ETH_ALEN) {
++		wpa_printf(MSG_DEBUG, "dbus: WPS.Start - Wrong "
++			   "P2PDeviceAddress length %d", len);
++		*reply = wpas_dbus_error_invalid_args(message,
++						      "P2PDeviceAddress "
++						      "has wrong length");
++		return -1;
++	}
++	return 0;
++}
++#endif /* CONFIG_P2P */
++
++
+ static int wpas_dbus_handler_wps_start_entry(DBusMessage *message, char *key,
+					     DBusMessageIter *entry_iter,
+					     struct wps_start_params *params,
+@@ -165,6 +203,11 @@ static int wpas_dbus_handler_wps_start_entry(DBusMessage *message, char *key,
+	else if (os_strcmp(key, "Pin") == 0)
+		return wpas_dbus_handler_wps_pin(message, entry_iter,
+						 params, reply);
++#ifdef CONFIG_P2P
++	else if (os_strcmp(key, "P2PDeviceAddress") == 0)
++		return wpas_dbus_handler_wps_p2p_dev_addr(message, entry_iter,
++							  params, reply);
++#endif /* CONFIG_P2P */
+
+	wpa_printf(MSG_DEBUG, "dbus: WPS.Start - unknown key %s", key);
+	*reply = wpas_dbus_error_invalid_args(message, key);
+@@ -231,12 +274,31 @@ DBusMessage * wpas_dbus_handler_wps_start(DBusMessage *message,
+		ret = wpas_wps_start_reg(wpa_s, params.bssid, params.pin,
+					 NULL);
+	else if (params.type == 1) {
+-		ret = wpas_wps_start_pin(wpa_s, params.bssid, params.pin, 0,
+-					 DEV_PW_DEFAULT);
+-		if (ret > 0)
+-			os_snprintf(npin, sizeof(npin), "%08d", ret);
+-	} else
++#ifdef CONFIG_AP
++		if (wpa_s->ap_iface)
++			ret = wpa_supplicant_ap_wps_pin(wpa_s,
++							params.bssid,
++							params.pin,
++							npin, sizeof(npin));
++		else
++#endif /* CONFIG_AP */
++		{
++			ret = wpas_wps_start_pin(wpa_s, params.bssid,
++						 params.pin, 0,
++						 DEV_PW_DEFAULT);
++			if (ret > 0)
++				os_snprintf(npin, sizeof(npin), "%08d", ret);
++		}
++	} else {
++#ifdef CONFIG_AP
++		if (wpa_s->ap_iface)
++			ret = wpa_supplicant_ap_wps_pbc(wpa_s,
++							params.bssid,
++							params.p2p_dev_addr);
++		else
++#endif /* CONFIG_AP */
+		ret = wpas_wps_start_pbc(wpa_s, params.bssid, 0);
++	}
+
+	if (ret < 0) {
+		wpa_printf(MSG_DEBUG, "dbus: WPS.Start wpas_wps_failed in "
+--
+1.7.10
diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-r5.sp4.01/defconfig b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-r5.00.18/defconfig
similarity index 99%
copy from meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-r5.sp4.01/defconfig
copy to meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-r5.00.18/defconfig
index b982e2a..9b9882a 100755
--- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-r5.sp4.01/defconfig
+++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-r5.00.18/defconfig
@@ -424,7 +424,3 @@ CONFIG_DEBUG_FILE=y
 # for p2p
 CONFIG_P2P=y
 CONFIG_AP=y
-
-# IEEE 802.11n (High Throughput) support
-CONFIG_IEEE80211N=y
-
diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant_r5.00.18.bb b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant_r5.00.18.bb
new file mode 100644
index 0000000..295d5e2
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant_r5.00.18.bb
@@ -0,0 +1,13 @@
+# This is a TI specific version of the wpa-supplicant recipe for use with the
+# wl12xx wlan and bluetooth module.
+
+require wpa-supplicant.inc
+
+LIC_FILES_CHKSUM = "file://../COPYING;md5=c54ce9345727175ff66d17b67ff51f58 \
+                    file://../README;md5=79cddd95f8b7539aced400f6aab996e9 \
+                    file://wpa_supplicant.c;beginline=1;endline=17;md5=009c87d612d92175fe8cd1e93137bf42"
+
+SRCREV = "ol_R5.00.18"
+PR_append = "a+gitr${SRCPV}"
+
+SRC_URI += "file://0001-wpa_supplicant-dbus-AP-Add-support-for-WPS-Internal-.patch;patchdir=.. "
-- 
1.7.0.4


