Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B357CC74A5B
	for <webhook@archiver.kernel.org>; Tue, 21 Mar 2023 19:04:38 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.23115.1679425471996371901
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 21 Mar 2023 12:04:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8C2F840C90
	for <meta-arago@lists.yoctoproject.org>; Tue, 21 Mar 2023 19:04:30 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3CAjiaYbHQbK for <meta-arago@lists.yoctoproject.org>;
	Tue, 21 Mar 2023 19:04:30 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7DEE340C2C
	for <meta-arago@lists.yoctoproject.org>; Tue, 21 Mar 2023 19:04:30 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 6F2741637C5
	for <meta-arago@lists.yoctoproject.org>; Tue, 21 Mar 2023 15:03:56 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [kirkstone/master][PATCH 2/4] tisdk-core-bundle: Deploy the unsigned versions of bl31 and bl32
Date: Tue, 21 Mar 2023 19:04:26 +0000
Message-Id: <20230321190428.2818600-2-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230321190428.2818600-1-denis@denix.org>
References: <20230321190428.2818600-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 21 Mar 2023 19:04:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14268

From: Ryan Eatmon <reatmon@ti.com>

In addition to releasing the signed versions of the bl31.bin and
bl32.bin files, also release the unsigned original versions.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb b=
/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
index b49548a6..2a8eb9ef 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
@@ -10,7 +10,7 @@ require tisdk-core-bundle.inc
 DEPLOY_SPL_NAME:omapl138 =3D ""
 DEPLOY_SPL_NAME:k3 =3D "tispl.bin tiboot3.bin"
=20
-DEPLOY_IMAGES_NAME:k3 =3D "bl31.bin bl32.bin"
+DEPLOY_IMAGES_NAME:k3 =3D "bl31.bin bl32.bin bl31.bin.unsigned bl32.bin.=
unsigned"
 DEPLOY_IMAGES_NAME:append:am65xx =3D " sysfw.itb"
 DEPLOY_IMAGES_NAME:append:j721e =3D " sysfw.itb"
 DEPLOY_IMAGES_NAME:append:am65xx-evm =3D " sysfw-am65x-evm.itb sysfw-am6=
5x_sr2-evm.itb"
--=20
2.25.1


