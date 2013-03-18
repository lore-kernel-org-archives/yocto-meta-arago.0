Return-Path: <fcooperjr27@gmail.com>
Received: from mail-qa0-f52.google.com (mail-qa0-f52.google.com
	[209.85.216.52])
	by arago-project.org (Postfix) with ESMTPS id 458AB52A3B
	for <meta-arago@arago-project.org>;
	Mon, 18 Mar 2013 14:02:39 +0000 (UTC)
Received: by mail-qa0-f52.google.com with SMTP id bs12so1657546qab.18
	for <meta-arago@arago-project.org>;
	Mon, 18 Mar 2013 07:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=PPA1Uym4ILOx+hHZ7JwZBdnRsmYe+XxuS8rv4sRB5G4=;
	b=KCuvV7LBIxMW63HTK4TGVeM/i6Ftijv7ki3a5AfiUzbxbYkHBMnO/vVtlCOTSI2vCy
	REvp5uhyjYUep9O/xFGVkdCA7Mg0VU8NO9T6BF2hELwXFbgG69HtQPwQf+uKwU8yIDMV
	qVT9tDXA33ICxoCY44wLNHkxsA0D6YZ7fRU2vlEg234x9gnN3lp1Crn8v31qyLf71DQB
	Ep59itgv2PMcq8unin1xblQMDzERJPYaf4KyALcM3rIi9UaVvquTsDz/iVm2bO7mBBGH
	JL4LN5f88a5jHGOZVASVDFymIcguH87CBLRHmRY1ztezMMj+RoOHEwedM5dc9unEwpG4
	CADg==
X-Received: by 10.224.188.82 with SMTP id cz18mr19732159qab.71.1363615358856; 
	Mon, 18 Mar 2013 07:02:38 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id t3sm32492548qen.5.2013.03.18.07.02.37
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 18 Mar 2013 07:02:38 -0700 (PDT)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Mon, 18 Mar 2013 09:02:25 -0500
Message-Id: <1363615345-6416-4-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1363615345-6416-1-git-send-email-fcooper@ti.com>
References: <1363615345-6416-1-git-send-email-fcooper@ti.com>
Subject: [PATCH 4/4] wpa-supplicant: update for r5.sp4.01 version
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
X-List-Received-Date: Mon, 18 Mar 2013 14:02:39 -0000

From: Eyal Reizer <eyalr@ti.com>

update for using the wpa-supplicant version from r5.sp4.01 release

Signed-off-by: Eyal Reizer <eyalr@ti.com>
---
 ...ken-rx-action-frame-handling-INTERNAL-SQU.patch |   86 --------------------
 .../wpa-supplicant/wpa-supplicant_git.bb           |    5 +-
 2 files changed, 2 insertions(+), 89 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-P2P-Fix-broken-rx-action-frame-handling-INTERNAL-SQU.patch

diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-P2P-Fix-broken-rx-action-frame-handling-INTERNAL-SQU.patch b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-P2P-Fix-broken-rx-action-frame-handling-INTERNAL-SQU.patch
deleted file mode 100644
index b991357..0000000
--- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-P2P-Fix-broken-rx-action-frame-handling-INTERNAL-SQU.patch
+++ /dev/null
@@ -1,86 +0,0 @@
-From 4e1835b2ccb4698e8e7022522928317d219bca32 Mon Sep 17 00:00:00 2001
-From: Eyal Shapira <eyal@wizery.com>
-Date: Tue, 13 Nov 2012 03:00:21 +0200
-Subject: [PATCH] P2P: Fix broken rx action frame handling (INTERNAL-SQUASH)
-
-Commit "P2P: Fix duplicate handling of rx action frames"
-went too far and dropped any rx action frames arriving on the GO
-interface. It assumed that any action frames were duplicated
-and received on both GO interface and P2P device interface.
-This is wrong as some actions frames like P2P presence request
-are sent to the GO interface address and won't be duplicated.
-
-The root cause of the duplication lies within the Rx path in mac80211
-in Johannes` patch "mac80211: accept public action frames with mismatched BSSID".
-When wpa_s works with a separate group interface this creates a duplicated Rx
-on both the P2P dev interface and the GO interface.
-
-Fix the issue by canceling the duplication in wpa_s and discarding
-public action frames with unmatching bssid arriving on a dedicated GO interface
-
-(This should be squashed with
-"P2P: Fix duplicate handling of rx action frames")
-
-Signed-off-by: Eyal Shapira <eyal@wizery.com>
----
- src/p2p/p2p.h                   |    5 +++++
- src/p2p/p2p_i.h                 |    1 -
- wpa_supplicant/p2p_supplicant.c |   16 +++++++++++++---
- 3 files changed, 18 insertions(+), 4 deletions(-)
-
-diff --git a/src/p2p/p2p.h b/src/p2p/p2p.h
-index 3c439f3..a60974f 100644
---- a/src/p2p/p2p.h
-+++ b/src/p2p/p2p.h
-@@ -1726,4 +1726,9 @@ int p2p_prepare_channel(struct p2p_data *p2p, unsigned int force_freq);
- void p2p_set_config_timeout(struct p2p_data *p2p, u8 go_timeout,
- 			    u8 client_timeout);
- 
-+/**
-+ * p2p_group_get_interface_addr - Get the interface address of a P2P group
-+ * @group: P2P group context from p2p_group_init()
-+ */
-+const u8 *p2p_group_get_interface_addr(struct p2p_group *group);
- #endif /* P2P_H */
-diff --git a/src/p2p/p2p_i.h b/src/p2p/p2p_i.h
-index d254818..9e3fd6f 100644
---- a/src/p2p/p2p_i.h
-+++ b/src/p2p/p2p_i.h
-@@ -557,7 +557,6 @@ struct p2p_noa_desc {
- };
- 
- /* p2p_group.c */
--const u8 * p2p_group_get_interface_addr(struct p2p_group *group);
- u8 p2p_group_presence_req(struct p2p_group *group,
- 			  const u8 *client_interface_addr,
- 			  const u8 *noa, size_t noa_len);
-diff --git a/wpa_supplicant/p2p_supplicant.c b/wpa_supplicant/p2p_supplicant.c
-index d8d72da..42c062f 100644
---- a/wpa_supplicant/p2p_supplicant.c
-+++ b/wpa_supplicant/p2p_supplicant.c
-@@ -4137,9 +4137,19 @@ void wpas_p2p_rx_action(struct wpa_supplicant *wpa_s, const u8 *da,
- 	if (wpa_s->global->p2p == NULL)
- 		return;
- 
--	if (wpa_s->p2p_group_interface != NOT_P2P_GROUP_INTERFACE) {
--		wpa_printf(MSG_DEBUG, "Discard RX action event on P2P "
--			   "GO/CLI iface. P2P Device interface will handle it");
-+	/*
-+	 * Discard an Rx duplication created by mac80211 rx path
-+	 * when receiving public action frames with mismatched BSSID
-+	 * In case of separate GO interface such public action frames (prov disc
-+	 * dev disc, invites) these should be handled by the P2P dev interface
-+	 */
-+	if (wpa_s->p2p_group_interface == P2P_GROUP_INTERFACE_GO &&
-+	    category == WLAN_ACTION_PUBLIC &&
-+	    wpa_s->p2p_group &&
-+	    os_memcmp(bssid, p2p_group_get_interface_addr(wpa_s->p2p_group),
-+		      ETH_ALEN)) {
-+		wpa_printf(MSG_DEBUG, "Discard duplicate RX action event on"
-+			   " P2P GO interface");
- 		return;
- 	}
- 
--- 
-1.7.9.5
-
diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant_git.bb b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant_git.bb
index db32d4e..927a556 100644
--- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant_git.bb
+++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant_git.bb
@@ -16,8 +16,8 @@ RRECOMMENDS_${PN} = "wpa-supplicant-passphrase wpa-supplicant-cli"
 # wpa-supplicant the DEFAULT_PREFERENCE will be set to -1.
 DEFAULT_PREFERENCE = "-1"
 
-SRCREV = "ol_R5.SP3.05"
-PR = "r2+gitr${SRCPV}"
+SRCREV = "ol_R5.SP4.01"
+PR = "r3+gitr${SRCPV}"
 # Add ti to the PV to indicate that this is a TI modify version of wpa-supplicant.
 PV = "2.0-devel-ti"
 
@@ -32,7 +32,6 @@ SRC_URI = "git://github.com/TI-OpenLink/hostap.git;protocol=git \
            file://wpa_supplicant.conf \
            file://fi.epitest.hostap.WPASupplicant.service \
            file://fi.w1.wpa_supplicant1.service \
-           file://0001-P2P-Fix-broken-rx-action-frame-handling-INTERNAL-SQU.patch;patchdir=.. \
           "
 
 S = "${WORKDIR}/git/wpa_supplicant"
-- 
1.7.0.4


