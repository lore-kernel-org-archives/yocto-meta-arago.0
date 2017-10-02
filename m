Return-Path: <denys@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id B485852A23
	for <meta-arago@arago-project.org>;
	Mon,  2 Oct 2017 22:45:11 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v92MjB2L013422
	for <meta-arago@arago-project.org>; Mon, 2 Oct 2017 17:45:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1506984311;
	bh=kYch4tOHYUr2/DW5r2VsaFQt9pC0+IAH5H5zhiZyWv4=;
	h=From:To:CC:Subject:Date;
	b=elhaLlpWiasntyaMRwjm9OWcNgRY+B6uL+xPDPj9r52c3K3JDfJnXW3/ol5cYUpsr
	vyx31Z/7dIMN7A5JILWnP1BGGxAdLSKRKBqqkI1Jo3uHmHfnZqK1yADxm+pK43XGUj
	l5gdPVwx+/qKnBdvTBnfhY1O/vyibvgBk6bb9fTM=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v92MjBHv017140
	for <meta-arago@arago-project.org>; Mon, 2 Oct 2017 17:45:11 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Mon, 2 Oct 2017 17:45:11 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Mon, 2 Oct 2017 17:45:11 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v92MjAHG004450;
	Mon, 2 Oct 2017 17:45:11 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 2 Oct 2017 18:45:10 -0400
Message-ID: <1506984310-13069-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master][PATCH] systemd: remove upstreamed networkd patches
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
X-List-Received-Date: Mon, 02 Oct 2017 22:45:11 -0000
Content-Type: text/plain

systemd version in master is 234 now.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...emd-network-ipv4ll-probe-conflict-counter.patch |   48 ----------------
 ...network-sd-ipv4ll-Wrapper-to-restart-addr.patch |   53 ------------------
 ...network-sd-ipv4ll-acquire-new-address-aft.patch |   59 --------------------
 .../recipes-core/systemd/systemd_%.bbappend        |    5 +-
 4 files changed, 1 insertion(+), 164 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-core/systemd/systemd/0001-libsystemd-network-ipv4ll-probe-conflict-counter.patch
 delete mode 100644 meta-arago-distro/recipes-core/systemd/systemd/0002-libsystemd-network-sd-ipv4ll-Wrapper-to-restart-addr.patch
 delete mode 100644 meta-arago-distro/recipes-core/systemd/systemd/0003-libsystemd-network-sd-ipv4ll-acquire-new-address-aft.patch

diff --git a/meta-arago-distro/recipes-core/systemd/systemd/0001-libsystemd-network-ipv4ll-probe-conflict-counter.patch b/meta-arago-distro/recipes-core/systemd/systemd/0001-libsystemd-network-ipv4ll-probe-conflict-counter.patch
deleted file mode 100644
index c92e662..0000000
--- a/meta-arago-distro/recipes-core/systemd/systemd/0001-libsystemd-network-ipv4ll-probe-conflict-counter.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 76f4df1e95b57746094a1b91c38cd4770f2396cc Mon Sep 17 00:00:00 2001
-From: Jason Reeder <jasonreeder@gmail.com>
-Date: Thu, 11 May 2017 13:44:52 -0500
-Subject: [PATCH 1/3] libsystemd-network: ipv4ll probe conflict counter
-
-A bug exists where the conflict counter is cleared
-regardless of whether or not the next probe attempt leads to
-a successful address acquisition. This causes 'bursts' of
-MAX_CONFLICTS probes followed by a delay of
-RATE_LIMIT_INTERVAL instead of a single probe each
-RATE_LIMIT_INTERVAL when beyond MAX_CONFLICTS.
-
-The conflict counter should only be cleared after an
-address is successfully acquired. This commit achieves that
-goal.
-
-From RFC3927:
-A host should maintain a counter of the number of address
-conflicts it has experienced in the process of trying to
-acquire an address, and if the number of conflicts exceeds
-MAX_CONFLICTS then the host MUST limit the rate at which it
-probes for new addresses to no more than one new address per
-RATE_LIMIT_INTERVAL.  This is to prevent catastrophic ARP
-storms in pathological failure cases, such as a rogue host
-that answers all ARP probes, causing legitimate hosts to go
-into an infinite loop attempting to select a usable address.
-
-Signed-off-by: Jason Reeder <jasonreeder@gmail.com>
----
- src/libsystemd-network/sd-ipv4acd.c | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/src/libsystemd-network/sd-ipv4acd.c b/src/libsystemd-network/sd-ipv4acd.c
-index 4dd343c..2ebc00f 100644
---- a/src/libsystemd-network/sd-ipv4acd.c
-+++ b/src/libsystemd-network/sd-ipv4acd.c
-@@ -242,8 +242,6 @@ static int ipv4acd_on_timeout(sd_event_source *s, uint64_t usec, void *userdata)
-                         r = ipv4acd_set_next_wakeup(acd, RATE_LIMIT_INTERVAL_USEC, PROBE_WAIT_USEC);
-                         if (r < 0)
-                                 goto fail;
--
--                        acd->n_conflict = 0;
-                 } else {
-                         r = ipv4acd_set_next_wakeup(acd, 0, PROBE_WAIT_USEC);
-                         if (r < 0)
--- 
-1.9.1
-
diff --git a/meta-arago-distro/recipes-core/systemd/systemd/0002-libsystemd-network-sd-ipv4ll-Wrapper-to-restart-addr.patch b/meta-arago-distro/recipes-core/systemd/systemd/0002-libsystemd-network-sd-ipv4ll-Wrapper-to-restart-addr.patch
deleted file mode 100644
index 8929f22..0000000
--- a/meta-arago-distro/recipes-core/systemd/systemd/0002-libsystemd-network-sd-ipv4ll-Wrapper-to-restart-addr.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 920ece8950b1422c80cf3235626d78646c6cc88a Mon Sep 17 00:00:00 2001
-From: Jason Reeder <jasonreeder@gmail.com>
-Date: Mon, 3 Apr 2017 12:15:55 -0500
-Subject: [PATCH 2/3] libsystemd-network: sd-ipv4ll: Wrapper to restart address
- acquisition after conflict
-
-After an ipv4ll claimed address conflict occurs a new address needs
-to be chosen and then the acquisition state machine needs to be
-restarted.
-
-This commit adds a function (sd_ipv4ll_restart) that clears the
-previously acquired address (ll->address) and then calls the existing
-sd_ipv4ll_start function to choose the new address and start the
-acquisition.
-
-Signed-off-by: Jason Reeder <jasonreeder@gmail.com>
----
- src/libsystemd-network/sd-ipv4ll.c | 6 ++++++
- src/systemd/sd-ipv4ll.h            | 1 +
- 2 files changed, 7 insertions(+)
-
-diff --git a/src/libsystemd-network/sd-ipv4ll.c b/src/libsystemd-network/sd-ipv4ll.c
-index 2a06418..2996516 100644
---- a/src/libsystemd-network/sd-ipv4ll.c
-+++ b/src/libsystemd-network/sd-ipv4ll.c
-@@ -289,6 +289,12 @@ static int ipv4ll_pick_address(sd_ipv4ll *ll) {
-         return 0;
- }
- 
-+int sd_ipv4ll_restart(sd_ipv4ll *ll) {
-+        ll->address = 0;
-+
-+        return sd_ipv4ll_start(ll);
-+}
-+
- int sd_ipv4ll_start(sd_ipv4ll *ll) {
-         int r;
- 
-diff --git a/src/systemd/sd-ipv4ll.h b/src/systemd/sd-ipv4ll.h
-index 6fa38a2..7c54979 100644
---- a/src/systemd/sd-ipv4ll.h
-+++ b/src/systemd/sd-ipv4ll.h
-@@ -47,6 +47,7 @@ int sd_ipv4ll_set_index(sd_ipv4ll *ll, int interface_index);
- int sd_ipv4ll_set_address(sd_ipv4ll *ll, const struct in_addr *address);
- int sd_ipv4ll_set_address_seed(sd_ipv4ll *ll, unsigned seed);
- int sd_ipv4ll_is_running(sd_ipv4ll *ll);
-+int sd_ipv4ll_restart(sd_ipv4ll *ll);
- int sd_ipv4ll_start(sd_ipv4ll *ll);
- int sd_ipv4ll_stop(sd_ipv4ll *ll);
- sd_ipv4ll *sd_ipv4ll_ref(sd_ipv4ll *ll);
--- 
-1.9.1
-
diff --git a/meta-arago-distro/recipes-core/systemd/systemd/0003-libsystemd-network-sd-ipv4ll-acquire-new-address-aft.patch b/meta-arago-distro/recipes-core/systemd/systemd/0003-libsystemd-network-sd-ipv4ll-acquire-new-address-aft.patch
deleted file mode 100644
index 9cb4908..0000000
--- a/meta-arago-distro/recipes-core/systemd/systemd/0003-libsystemd-network-sd-ipv4ll-acquire-new-address-aft.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From d3a4823b019a27bd9387216dcb94360bc432590e Mon Sep 17 00:00:00 2001
-From: Jason Reeder <jasonreeder@gmail.com>
-Date: Mon, 3 Apr 2017 12:16:58 -0500
-Subject: [PATCH 3/3] libsystemd-network: sd-ipv4ll: acquire new address after
- claimed address conflict
-
-If a conflict occurs on a claimed ipv4ll address, the device releases
-the address and then does not attempt to acquire a new ipv4ll
-address. According to RFC3927, releasing the address in this
-situation is correct. However, this should be followed by an attempt
-to configure a new ipv4ll address.
-
-This commit restarts the ipv4ll address acquisition state machine
-after releasing the conflicting address.
-
-From RFC3927 Section 2.5 conflict defense method (b):
-...
-However, if this is not the first conflicting ARP packet the host has
-seen, and the time recorded for the previous conflicting ARP packet is
-recent, within DEFEND_INTERVAL seconds, then the host MUST immediately
-cease using this address and configure a new IPv4 Link-Local address
-as described above.
-...
-
-Signed-off-by: Jason Reeder <jasonreeder@gmail.com>
----
- src/network/networkd-ipv4ll.c | 10 ++++++++++
- 1 file changed, 10 insertions(+)
-
-diff --git a/src/network/networkd-ipv4ll.c b/src/network/networkd-ipv4ll.c
-index ae323d5..10f25f0 100644
---- a/src/network/networkd-ipv4ll.c
-+++ b/src/network/networkd-ipv4ll.c
-@@ -178,12 +178,22 @@ static void ipv4ll_handler(sd_ipv4ll *ll, int event, void *userdata) {
- 
-         switch(event) {
-                 case SD_IPV4LL_EVENT_STOP:
-+                        r = ipv4ll_address_lost(link);
-+                        if (r < 0) {
-+                                link_enter_failed(link);
-+                                return;
-+                        }
-+                        break;
-                 case SD_IPV4LL_EVENT_CONFLICT:
-                         r = ipv4ll_address_lost(link);
-                         if (r < 0) {
-                                 link_enter_failed(link);
-                                 return;
-                         }
-+
-+                        r = sd_ipv4ll_restart(ll);
-+                        if (r < 0)
-+                                log_link_warning(link, "Could not acquire IPv4 link-local address");
-                         break;
-                 case SD_IPV4LL_EVENT_BIND:
-                         r = ipv4ll_address_claimed(ll, link);
--- 
-1.9.1
-
diff --git a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
index 7f2ffb6..f6cb954 100644
--- a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
+++ b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
@@ -1,4 +1,4 @@
-PR_append = ".arago4"
+PR_append = ".arago5"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
@@ -14,9 +14,6 @@ SRC_URI_append = " \
     file://30-wlan.network \
     file://60-usb.network \
     file://sync-clocks.service \
-    file://0001-libsystemd-network-ipv4ll-probe-conflict-counter.patch \
-    file://0002-libsystemd-network-sd-ipv4ll-Wrapper-to-restart-addr.patch \
-    file://0003-libsystemd-network-sd-ipv4ll-acquire-new-address-aft.patch \
 "
 
 do_install_append() {
-- 
1.7.9.5


