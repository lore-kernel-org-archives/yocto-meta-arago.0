Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D8A4C433F5
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 23:30:04 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.3876.1647300602977991675
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 14 Mar 2022 16:30:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4C23440C3A;
	Mon, 14 Mar 2022 23:30:02 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jRYtkbcfVBXU; Mon, 14 Mar 2022 23:30:02 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1B6FA407E5;
	Mon, 14 Mar 2022 23:30:01 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id D982A165570;
	Mon, 14 Mar 2022 19:30:00 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [dunfell][PATCH] README: update compatible release version and
 maintainer
Date: Mon, 14 Mar 2022 19:30:00 -0400
Message-Id: <1647300600-29771-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 14 Mar 2022 23:30:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13628

From: Denys Dmytriyenko <denys@konsulko.com>

Update the layer maintainer entry and compatible release version.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
Reviewed-by: Praneeth Bajjuri <praneeth@ti.com>
---
This is a modified backport of a similar change from master.

 meta-arago-distro/README | 4 ++--
 meta-arago-extras/README | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/README b/meta-arago-distro/README
index 39acade..ccfb516 100644
--- a/meta-arago-distro/README
+++ b/meta-arago-distro/README
@@ -1,6 +1,6 @@
 meta-arago-distro provides Arago distribution configuration for TI SDK products
 
-This layer works with the latest Yocto Project release (currently 2.2+) and tracks
+This layer works with the latest Yocto Project release (currently 3.1+) and tracks
 the stable/maintenance branches (currently "dunfell") of the corresponding layers:
 
 URI: git://git.openembedded.org/openembedded-core
@@ -34,5 +34,5 @@ layers: meta-arago-extras
 Send pull requests to meta-arago@arago-project.org
 
 Layer maintainers:
-Praneeth Bajjuri <praneeth@ti.com>
+Ryan Eatmon <reatmon@ti.com>
 Denys Dmytriyenko <denys@konsulko.com>
diff --git a/meta-arago-extras/README b/meta-arago-extras/README
index 91d257e..e3329fe 100644
--- a/meta-arago-extras/README
+++ b/meta-arago-extras/README
@@ -1,6 +1,6 @@
 meta-arago-extras provides additional TI SDK applications that are distro-agnostic
 
-This layer works with the latest Yocto Project release (currently 2.2+) and tracks
+This layer works with the latest Yocto Project release (currently 3.1+) and tracks
 the stable/maintenance branches (currently "dunfell") of the corresponding layers:
 
 URI: git://git.openembedded.org/openembedded-core
@@ -29,5 +29,5 @@ revision: HEAD
 Send pull requests to meta-arago@arago-project.org
 
 Layer maintainers:
-Praneeth Bajjuri <praneeth@ti.com>
+Ryan Eatmon <reatmon@ti.com>
 Denys Dmytriyenko <denys@konsulko.com>
-- 
2.7.4


