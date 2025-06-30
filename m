Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CB04C8302D
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 16:15:51 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.44849.1751300147137487167
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 30 Jun 2025 09:15:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 37C1040C85;
	Mon, 30 Jun 2025 16:15:46 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pqZUQUpsGKXt; Mon, 30 Jun 2025 16:15:46 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1C667407DA;
	Mon, 30 Jun 2025 16:15:45 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 30B9316AEED;
	Mon, 30 Jun 2025 12:15:44 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 1/2] arago-prefs: set runtime preference for libnss-mdns
Date: Mon, 30 Jun 2025 12:15:42 -0400
Message-Id: <20250630161543.1781117-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 30 Jun 2025 16:15:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16276

From: Denys Dmytriyenko <denys@konsulko.com>

There now could be multiple providers of runtime libnss-mdns with
OE-Core providing one by avahi package and meta-oe providing another
one by mdns package. Set PREFERRED_RPROVIDER to be explit and to
suppress the corresponding message:

| NOTE: Multiple providers are available for runtime libnss-mdns (avahi-l=
ibnss-mdns, mdns)
| Consider defining a PREFERRED_RPROVIDER entry to match libnss-mdns

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-arago-distro/conf/distro/include/arago-prefs.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta=
-arago-distro/conf/distro/include/arago-prefs.inc
index 4f7fe591..1273070f 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -5,6 +5,8 @@ PREFERRED_PROVIDER_virtual/gettext =3D "gettext"
=20
 PREFERRED_PROVIDER_virtual/kernel:append =3D "${ARAGO_KERNEL_SUFFIX}"
=20
+PREFERRED_RPROVIDER_libnss-mdns =3D "avahi-libnss-mdns"
+
 VIRTUAL-RUNTIME_dbus =3D "dbus-broker"
=20
 # Setting PREFERRED_VERSIONS due to selecting a specific version of a li=
brary or
--=20
2.25.1


