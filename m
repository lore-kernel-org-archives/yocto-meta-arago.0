Return-Path: <jreeder@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 15ED352981
	for <meta-arago@arago-project.org>;
	Thu, 11 May 2017 19:47:47 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v4BJllXT012808
	for <meta-arago@arago-project.org>; Thu, 11 May 2017 14:47:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1494532067;
	bh=pH0Anu8dxBBuHzUOrZQNAksFzw/zedyvqmG81WsPiZE=;
	h=From:To:CC:Subject:Date;
	b=DSCBHVx7Z+yuJ9BbddAkrni5hAF0i4b+h7+4fBMRehK1ZFfxQ3mcnoOzbT4IKKijm
	Y7MVSh76vRxmJLLyOfH9gkZn/BdpthXGR41sp3kNRugF5YJwdxBnMq3IVLjFq5re5K
	dglluWWUCCuVDjEiVOg+AVjOsYnPEDN9uSBUVJVg=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v4BJll90025309
	for <meta-arago@arago-project.org>; Thu, 11 May 2017 14:47:47 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 11 May 2017 14:47:47 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v4BJllXU026961;	Thu, 11 May 2017 14:47:47 -0500
Received: from localhost (uda0273976.am.dhcp.ti.com [10.219.21.82])	by
	legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	v4BJll309921; Thu, 11 May 2017 14:47:47 -0500 (CDT)
From: Jason Reeder <jreeder@ti.com>
To: meta-arago <meta-arago@arago-project.org>
Date: Thu, 11 May 2017 14:47:28 -0500
Message-ID: <1494532048-21235-1-git-send-email-jreeder@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] systemd: updating upstreamed networkd patch
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
X-List-Received-Date: Thu, 11 May 2017 19:47:49 -0000
Content-Type: text/plain

Upstream-Status: Accepted[233]
Signed-off-by: Jason Reeder <jreeder@ti.com>
---
 ...ibsystemd-network-ipv4ll-probe-conflict-counter.patch | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta-arago-distro/recipes-core/systemd/systemd/0001-libsystemd-network-ipv4ll-probe-conflict-counter.patch b/meta-arago-distro/recipes-core/systemd/systemd/0001-libsystemd-network-ipv4ll-probe-conflict-counter.patch
index 557a297..c92e662 100644
--- a/meta-arago-distro/recipes-core/systemd/systemd/0001-libsystemd-network-ipv4ll-probe-conflict-counter.patch
+++ b/meta-arago-distro/recipes-core/systemd/systemd/0001-libsystemd-network-ipv4ll-probe-conflict-counter.patch
@@ -1,6 +1,6 @@
-From 1e47842a0144c501cc6fd7ccc7996761f3e32ea9 Mon Sep 17 00:00:00 2001
+From 76f4df1e95b57746094a1b91c38cd4770f2396cc Mon Sep 17 00:00:00 2001
 From: Jason Reeder <jasonreeder@gmail.com>
-Date: Mon, 3 Apr 2017 12:07:17 -0500
+Date: Thu, 11 May 2017 13:44:52 -0500
 Subject: [PATCH 1/3] libsystemd-network: ipv4ll probe conflict counter
 
 A bug exists where the conflict counter is cleared
@@ -31,17 +31,17 @@ Signed-off-by: Jason Reeder <jasonreeder@gmail.com>
  1 file changed, 2 deletions(-)
 
 diff --git a/src/libsystemd-network/sd-ipv4acd.c b/src/libsystemd-network/sd-ipv4acd.c
-index cc7436d..97f37f2 100644
+index 4dd343c..2ebc00f 100644
 --- a/src/libsystemd-network/sd-ipv4acd.c
 +++ b/src/libsystemd-network/sd-ipv4acd.c
-@@ -249,8 +249,6 @@ static int ipv4acd_on_timeout(sd_event_source *s, uint64_t usec, void *userdata)
-                         r = ipv4acd_set_next_wakeup(ll, RATE_LIMIT_INTERVAL, PROBE_WAIT);
+@@ -242,8 +242,6 @@ static int ipv4acd_on_timeout(sd_event_source *s, uint64_t usec, void *userdata)
+                         r = ipv4acd_set_next_wakeup(acd, RATE_LIMIT_INTERVAL_USEC, PROBE_WAIT_USEC);
                          if (r < 0)
-                                 goto out;
+                                 goto fail;
 -
--                        ll->conflict = 0;
+-                        acd->n_conflict = 0;
                  } else {
-                         r = ipv4acd_set_next_wakeup(ll, 0, PROBE_WAIT);
+                         r = ipv4acd_set_next_wakeup(acd, 0, PROBE_WAIT_USEC);
                          if (r < 0)
 -- 
 1.9.1
-- 
1.9.1


