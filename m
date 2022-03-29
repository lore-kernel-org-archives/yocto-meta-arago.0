Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1B91C433F5
	for <webhook@archiver.kernel.org>; Tue, 29 Mar 2022 05:39:33 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.3285.1648532372106659166
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 28 Mar 2022 22:39:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 64A6F40C1E;
	Tue, 29 Mar 2022 05:39:31 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SrWfl2eCc7EW; Tue, 29 Mar 2022 05:39:31 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4A7A840952;
	Tue, 29 Mar 2022 05:39:30 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 88EA41747C9;
	Tue, 29 Mar 2022 01:39:29 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH] gnutls: update INCOMPATIBLE_LICENSE to SPDX format
Date: Tue, 29 Mar 2022 05:39:29 +0000
Message-Id: <20220329053929.2367932-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 29 Mar 2022 05:39:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13760

From: Denys Dmytriyenko <denys@konsulko.com>

All licenses have been migrated to SPDX format, so update their usage in
variables like INCOMPATIBLE_LICENSE.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-arago-distro/recipes-support/gnutls/gnutls_%.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-support/gnutls/gnutls_%.bbappend b=
/meta-arago-distro/recipes-support/gnutls/gnutls_%.bbappend
index 7928a810..4ad4f70a 100644
--- a/meta-arago-distro/recipes-support/gnutls/gnutls_%.bbappend
+++ b/meta-arago-distro/recipes-support/gnutls/gnutls_%.bbappend
@@ -2,4 +2,4 @@ PR:append =3D ".arago0"
=20
 # Set INCOMPATIBLE_LICENSE to GPLv3 to allow gnutls to use the non GPLv2
 # version of gettext.
-INCOMPATIBLE_LICENSE =3D "GPLv3"
+INCOMPATIBLE_LICENSE =3D "GPL-3.0*"
--=20
2.25.1


