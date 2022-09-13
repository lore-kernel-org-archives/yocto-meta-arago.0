Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6C3DC6FD1A
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 04:02:56 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.894.1663041770148571784
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 12 Sep 2022 21:02:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 94D4540D74
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 04:02:48 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OVDsndoIMZjU for <meta-arago@lists.yoctoproject.org>;
	Tue, 13 Sep 2022 04:02:48 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8B35B40D8A
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 04:02:47 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 2D58D1749D5
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 00:02:46 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 26/52] qtbase-conf: Unset fixed HDMI mode
Date: Tue, 13 Sep 2022 04:02:20 +0000
Message-Id: <20220913040246.2365077-27-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220913040246.2365077-1-denis@denix.org>
References: <20220913040246.2365077-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 13 Sep 2022 04:02:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14011

From: Sai Sree Kartheek Adivi <s-adivi@ti.com>

HDMI mode is set to 1024x768 in eglfs_kms_cfg.json. This needs to be
unset since not all devices use the same resolution display.

When mode is not defined, the system's preferred mode is chosen.
Ref: https://doc.qt.io/qt-5/embedded-linux.html#display-output

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
Reviewed-by: Devarsh Thakkar <devarsht@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-qt/qt5/qtbase-conf/eglfs_kms_cfg.json            | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/eglfs_kms_cfg.j=
son b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/eglfs_kms_cfg.json
index 61b834be..ac19b8ec 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/eglfs_kms_cfg.json
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/eglfs_kms_cfg.json
@@ -8,8 +8,7 @@
       "mode": "off"
     },
     {
-      "name": "HDMI1",
-      "mode": "1024x768"
+      "name": "HDMI1"
     }
   ]
-}
\ No newline at end of file
+}
--=20
2.25.1


