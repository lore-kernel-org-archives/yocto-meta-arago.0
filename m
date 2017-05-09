Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id EC2DC52A4A
	for <meta-arago@arago-project.org>;
	Tue,  9 May 2017 18:06:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 08AC620BF7;
	Tue,  9 May 2017 18:07:00 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id W11qaxlEqRao; Tue,  9 May 2017 18:06:59 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E03A220BE4;
	Tue,  9 May 2017 18:06:58 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 8DB061624AC;
	Tue,  9 May 2017 14:06:58 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue,  9 May 2017 14:06:50 -0400
Message-Id: <1494353215-51061-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH 1/6] systemd: remove first upstreamed network patch, now in 232
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
X-List-Received-Date: Tue, 09 May 2017 18:07:00 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...emd-network-ipv4ll-probe-conflict-counter.patch | 48 ----------------------
 .../recipes-core/systemd/systemd_%.bbappend        |  1 -
 2 files changed, 49 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-core/systemd/systemd/0001-libsystemd-network-ipv4ll-probe-conflict-counter.patch

diff --git a/meta-arago-distro/recipes-core/systemd/systemd/0001-libsystemd-network-ipv4ll-probe-conflict-counter.patch b/meta-arago-distro/recipes-core/systemd/systemd/0001-libsystemd-network-ipv4ll-probe-conflict-counter.patch
deleted file mode 100644
index 557a297..0000000
--- a/meta-arago-distro/recipes-core/systemd/systemd/0001-libsystemd-network-ipv4ll-probe-conflict-counter.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 1e47842a0144c501cc6fd7ccc7996761f3e32ea9 Mon Sep 17 00:00:00 2001
-From: Jason Reeder <jasonreeder@gmail.com>
-Date: Mon, 3 Apr 2017 12:07:17 -0500
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
-index cc7436d..97f37f2 100644
---- a/src/libsystemd-network/sd-ipv4acd.c
-+++ b/src/libsystemd-network/sd-ipv4acd.c
-@@ -249,8 +249,6 @@ static int ipv4acd_on_timeout(sd_event_source *s, uint64_t usec, void *userdata)
-                         r = ipv4acd_set_next_wakeup(ll, RATE_LIMIT_INTERVAL, PROBE_WAIT);
-                         if (r < 0)
-                                 goto out;
--
--                        ll->conflict = 0;
-                 } else {
-                         r = ipv4acd_set_next_wakeup(ll, 0, PROBE_WAIT);
-                         if (r < 0)
--- 
-1.9.1
-
diff --git a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
index 8fccdb5..5f54316 100644
--- a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
+++ b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
@@ -14,7 +14,6 @@ SRC_URI_append = " \
     file://30-wlan.network \
     file://60-usb.network \
     file://sync-clocks.service \
-    file://0001-libsystemd-network-ipv4ll-probe-conflict-counter.patch \
     file://0002-libsystemd-network-sd-ipv4ll-Wrapper-to-restart-addr.patch \
     file://0003-libsystemd-network-sd-ipv4ll-acquire-new-address-aft.patch \
 "
-- 
2.7.4


