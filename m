Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40117C30658
	for <webhook@archiver.kernel.org>; Tue,  2 Jul 2024 19:52:21 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.33741.1719949933465462357
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 02 Jul 2024 12:52:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5C09640C7B;
	Tue,  2 Jul 2024 19:52:12 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a8ig0lYAvh5o; Tue,  2 Jul 2024 19:52:12 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A4A7540C6C;
	Tue,  2 Jul 2024 19:52:10 +0000 (UTC)
Received: from gimli.cabin (argonath.cabin [172.31.1.2])
	by mail.denix.org (Postfix) with ESMTP id A0E65163FD6;
	Tue,  2 Jul 2024 15:52:09 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH] weston: adjust bbappend for minor version bump
Date: Tue,  2 Jul 2024 15:52:08 -0400
Message-Id: <20240702195208.39626-1-denis@denix.org>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 02 Jul 2024 19:52:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15427

From: Denys Dmytriyenko <denys@konsulko.com>

Make bbappend less strict to apply against minor version bumps, such as 3=
.0.1

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../wayland/{weston_13.0.0.bbappend =3D> weston_13.0.%.bbappend}    | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-arago-distro/recipes-graphics/wayland/{weston_13.0.0.bbappen=
d =3D> weston_13.0.%.bbappend} (100%)

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_13.0.0.bba=
ppend b/meta-arago-distro/recipes-graphics/wayland/weston_13.0.%.bbappend
similarity index 100%
rename from meta-arago-distro/recipes-graphics/wayland/weston_13.0.0.bbap=
pend
rename to meta-arago-distro/recipes-graphics/wayland/weston_13.0.%.bbappe=
nd
--=20
2.35.3


