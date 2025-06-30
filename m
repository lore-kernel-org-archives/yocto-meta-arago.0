Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B4ADC83029
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 16:15:51 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.45045.1751300146892176460
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 30 Jun 2025 09:15:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4507A407DA;
	Mon, 30 Jun 2025 16:15:46 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qgO9B6-pelS0; Mon, 30 Jun 2025 16:15:46 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 28B0240C7B;
	Mon, 30 Jun 2025 16:15:45 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 3BE8816AFB9;
	Mon, 30 Jun 2025 12:15:44 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 2/2] arago-prefs: drop very old preference for ltp-ddt
Date: Mon, 30 Jun 2025 12:15:43 -0400
Message-Id: <20250630161543.1781117-2-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250630161543.1781117-1-denis@denix.org>
References: <20250630161543.1781117-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 30 Jun 2025 16:15:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16275

From: Denys Dmytriyenko <denys@konsulko.com>

It has been a long time since there were multiple providers for
ltp-ddt, based on the kernel version around 3.8 - there's no need
to set it anymore.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-arago-distro/conf/distro/include/arago-prefs.inc | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta=
-arago-distro/conf/distro/include/arago-prefs.inc
index 1273070f..f05fc43c 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -1,6 +1,3 @@
-# Use the latest version of ltp-ddt for kernel versions 3.8+
-PREFERRED_PROVIDER_ltp-ddt =3D "ltp-ddt"
-
 PREFERRED_PROVIDER_virtual/gettext =3D "gettext"
=20
 PREFERRED_PROVIDER_virtual/kernel:append =3D "${ARAGO_KERNEL_SUFFIX}"
--=20
2.25.1


