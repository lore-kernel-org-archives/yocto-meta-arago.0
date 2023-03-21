Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2143C6FD1D
	for <webhook@archiver.kernel.org>; Tue, 21 Mar 2023 19:04:38 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.23114.1679425471646138594
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 21 Mar 2023 12:04:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8EAA340C2C
	for <meta-arago@lists.yoctoproject.org>; Tue, 21 Mar 2023 19:04:30 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3Y0CG-fLbFHg for <meta-arago@lists.yoctoproject.org>;
	Tue, 21 Mar 2023 19:04:30 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8079340C46
	for <meta-arago@lists.yoctoproject.org>; Tue, 21 Mar 2023 19:04:30 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 79C5A1637C6
	for <meta-arago@lists.yoctoproject.org>; Tue, 21 Mar 2023 15:03:56 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [kirkstone/master][PATCH 3/4] ltp-ddt: update to the latest from Dunfell
Date: Tue, 21 Mar 2023 19:04:27 +0000
Message-Id: <20230321190428.2818600-3-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230321190428.2818600-1-denis@denix.org>
References: <20230321190428.2818600-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 21 Mar 2023 19:04:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14267

From: Denys Dmytriyenko <denys@konsulko.com>

Match the latest sha used in Dunfell.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.=
bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
index 88a2a0e2..f3c237df 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
@@ -11,10 +11,10 @@ PROVIDES +=3D "ltp"
 DEPENDS +=3D "alsa-lib"
=20
 PE =3D "1"
-PR =3D "r5"
+PR =3D "r7"
 PV:append =3D "+git${SRCPV}"
=20
-SRCREV =3D "e0f92958396f7cee40da505319681aee1f331542"
+SRCREV =3D "0b51638be46d1e00e2e7e6c4c65dcff738ff2e60"
 BRANCH ?=3D "master"
=20
 SRC_URI:remove =3D "git://github.com/linux-test-project/ltp.git;protocol=
=3Dhttps;branch=3Dmaster"
--=20
2.25.1


