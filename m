Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E18FFC6FD2D
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 04:02:56 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.932.1663041769967568928
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 12 Sep 2022 21:02:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5C09440D88
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 04:02:48 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o4jb0JVgn-ME for <meta-arago@lists.yoctoproject.org>;
	Tue, 13 Sep 2022 04:02:48 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 52CE840D87
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 04:02:47 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 62FEB1749D1
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 00:02:45 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 05/52] matrix-gui-crypto-demos: Use
 crypto_apps_script instead of crypto_apps_program
Date: Tue, 13 Sep 2022 04:01:59 +0000
Message-Id: <20220913040246.2365077-6-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220913040246.2365077-1-denis@denix.org>
References: <20220913040246.2365077-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 13 Sep 2022 04:02:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14005

From: Corentin Labbe <clabbe@baylibre.com>

In the current situation all crypto tests (like openssl_aes256_encdec.sh)=
 are not copied in final images.
There were present in both crypto_apps_program and crypto_apps_script.
But crypto_apps_program depended on ti-crypto-examples which is disabled =
since 2 years now.
So let's fallback to original crypto_apps_script.

Signed-off-by: Corentin LABBE <clabbe@baylibre.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb         | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demo=
s_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_=
2.0.bb
index 5e07519a..7dc809a6 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.b=
b
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.b=
b
@@ -7,9 +7,6 @@ PR =3D "${INC_PR}.12"
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
 S =3D "${WORKDIR}/git/cryptos_apps_scripts"
-S:ti33x =3D "${WORKDIR}/git/cryptos_apps_program"
-S:ti43x =3D "${WORKDIR}/git/cryptos_apps_program"
-S:dra7xx =3D "${WORKDIR}/git/cryptos_apps_program"
=20
 FILES:${PN} +=3D "${MATRIX_BASE_DIR}/*"
=20
--=20
2.25.1


