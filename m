Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E61BC6FA8A
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 04:02:56 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.898.1663041772223068818
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 12 Sep 2022 21:02:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id ABDE540D6E
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 04:02:51 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kvBZTL-pNSVn for <meta-arago@lists.yoctoproject.org>;
	Tue, 13 Sep 2022 04:02:51 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9BBDA40D7C
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 04:02:47 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 1F8E31749D3
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 00:02:46 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 24/52] weston-init: fix killproc for
 thinlinux so that it doesn't kill itself
Date: Tue, 13 Sep 2022 04:02:18 +0000
Message-Id: <20220913040246.2365077-25-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220913040246.2365077-1-denis@denix.org>
References: <20220913040246.2365077-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 13 Sep 2022 04:02:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14030

From: Darren Etheridge <detheridge@ti.com>

busybox pidof doesn't omit the current pid
as this script is called weston on the target
in thinlinux with a busybox based utility load
later killproc operations end up killing this
script, which leads to the script not actually
starting weston.

Signed-off-by: Darren Etheridge <detheridge@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-graphics/wayland/weston-init/init   | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init/init =
b/meta-arago-distro/recipes-graphics/wayland/weston-init/init
index 7a80238b..fa3f0372 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston-init/init
+++ b/meta-arago-distro/recipes-graphics/wayland/weston-init/init
@@ -9,8 +9,21 @@
 ### END INIT INFO
=20
 killproc() {
-        pid=3D`/bin/pidof $1`
-        [ "$pid" !=3D "" ] && kill $pid
+	all_pids=3D`/bin/pidof $1`
+
+	# busybox pidof doesn't ommit the current pid
+	# as this script is called weston on the target
+	# in thinlinux with a busybox based utility load
+	# later killproc operations end up killing this
+	# script.
+	for pid in $all_pids
+	do
+		if [ "$pid" !=3D "$$" ]; then
+			kill_pids+=3D$pid
+		fi
+	done
+
+	[ "$kill_pids" !=3D "" ] && kill $kill_pids
 }
=20
 read CMDLINE < /proc/cmdline
--=20
2.25.1


