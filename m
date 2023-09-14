Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7308EEAA79
	for <webhook@archiver.kernel.org>; Thu, 14 Sep 2023 20:59:53 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.6081.1694725187039897695
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 14 Sep 2023 13:59:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3142A40BA7;
	Thu, 14 Sep 2023 20:59:46 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hsc8TwkLmu-M; Thu, 14 Sep 2023 20:59:46 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-110-236.washdc.fios.verizon.net [100.15.110.236])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 141B140C13;
	Thu, 14 Sep 2023 20:59:44 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 24834163CA3;
	Thu, 14 Sep 2023 16:59:43 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 1/2] weston: update bbappend to match oe-core/master
Date: Thu, 14 Sep 2023 20:59:41 +0000
Message-Id: <20230914205942.2817800-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 14 Sep 2023 20:59:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14900

From: Denys Dmytriyenko <denys@konsulko.com>

OE-Core has updated weston to version 12.0.2 recently.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../wayland/{weston_12.0.1.bbappend =3D> weston_12.0.2.bbappend}    | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-arago-distro/recipes-graphics/wayland/{weston_12.0.1.bbappen=
d =3D> weston_12.0.2.bbappend} (100%)

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_12.0.1.bba=
ppend b/meta-arago-distro/recipes-graphics/wayland/weston_12.0.2.bbappend
similarity index 100%
rename from meta-arago-distro/recipes-graphics/wayland/weston_12.0.1.bbap=
pend
rename to meta-arago-distro/recipes-graphics/wayland/weston_12.0.2.bbappe=
nd
--=20
2.25.1


