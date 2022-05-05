Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24125C433EF
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 22:04:11 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.2646.1651788240960070116
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 05 May 2022 15:04:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0080640C81;
	Thu,  5 May 2022 22:04:00 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X6CRLE6wyh8m; Thu,  5 May 2022 22:03:59 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D95E640BE9;
	Thu,  5 May 2022 22:03:58 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 87B0E17491C;
	Thu,  5 May 2022 18:03:58 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 1/2] packagegroup-arago-tisdk-addons: add RTOS FW
 images for am62xx
Date: Thu,  5 May 2022 22:03:56 +0000
Message-Id: <20220505220357.343789-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 05 May 2022 22:04:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13839

From: Denys Dmytriyenko <denys@konsulko.com>

Pull standard RTOS FW images for am62xx. This matches similar change in d=
unfell.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../packagegroups/packagegroup-arago-tisdk-addons.bb             | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packag=
egroup-arago-tisdk-addons.bb
index 363602b5..46182c9d 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-addons.bb
@@ -65,6 +65,7 @@ UTILS:append:k3 =3D " mmc-utils \
 "
=20
 UTILS:append:am64xx =3D " ti-rtos-firmware pru-icss"
+UTILS:append:am62xx =3D " ti-rtos-firmware"
 #UTILS:append:am65xx =3D " ti-rtos-firmware pru-icss pru-pwm-fw"
 UTILS:append:am65xx =3D " ti-rtos-firmware pru-icss"
 UTILS:append:j7 =3D " ti-rtos-firmware"
--=20
2.25.1


