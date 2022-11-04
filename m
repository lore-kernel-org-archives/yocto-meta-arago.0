Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AB3AC43217
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 21:41:18 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.227.1667598074623537307
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 04 Nov 2022 14:41:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0FDAB40D84
	for <meta-arago@lists.yoctoproject.org>; Fri,  4 Nov 2022 21:41:14 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Afmw7x0bzIfS for <meta-arago@lists.yoctoproject.org>;
	Fri,  4 Nov 2022 21:41:14 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 052DE40D52
	for <meta-arago@lists.yoctoproject.org>; Fri,  4 Nov 2022 21:41:12 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 956B516367F
	for <meta-arago@lists.yoctoproject.org>; Fri,  4 Nov 2022 17:41:09 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 07/14] packagegroup-arago-tisdk-addons: Make ti-rtos-firmware available for k3
Date: Fri,  4 Nov 2022 21:41:05 +0000
Message-Id: <20221104214112.1221365-8-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104214112.1221365-1-denis@denix.org>
References: <20221104214112.1221365-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 04 Nov 2022 21:41:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14109

From: Andrew Davis <afd@ti.com>

The ti-rtos-firmware is common across all K3 devices, only the pru-icss
component is variable. Make the appending logic match.

Signed-off-by: Andrew Davis <afd@ti.com>
Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../packagegroups/packagegroup-arago-tisdk-addons.bb  | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packag=
egroup-arago-tisdk-addons.bb
index f4e72a89..07ae8b07 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-addons.bb
@@ -57,13 +57,10 @@ UTILS:append:k3 =3D " mmc-utils \
                     statcol \
 "
=20
-UTILS:append:am64xx =3D " ti-rtos-firmware pru-icss"
-UTILS:append:am62xx =3D " ti-rtos-firmware"
-#UTILS:append:am65xx =3D " ti-rtos-firmware pru-icss pru-pwm-fw"
-UTILS:append:am65xx =3D " ti-rtos-firmware pru-icss"
-UTILS:append:j7 =3D " ti-rtos-firmware"
-UTILS:append:j721e-evm =3D " pru-icss"
-UTILS:append:j721e-hs-evm =3D " pru-icss"
+UTILS:append:k3 =3D " ti-rtos-firmware"
+UTILS:append:am64xx =3D " pru-icss"
+UTILS:append:am65xx =3D " pru-icss"
+UTILS:append:j721e =3D " pru-icss"
=20
 UTILS:append:omapl138 =3D " ti-ipc-rtos-fw"
=20
--=20
2.25.1


