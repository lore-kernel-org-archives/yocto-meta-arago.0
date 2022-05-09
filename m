Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CE14C433F5
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 18:00:53 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.664.1652119252739873976
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 09 May 2022 11:00:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1B7BF407DA
	for <meta-arago@lists.yoctoproject.org>;
 Mon,  9 May 2022 18:00:52 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Niyc640BAN4O for <meta-arago@lists.yoctoproject.org>;
	Mon,  9 May 2022 18:00:52 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0F60C40BC4
	for <meta-arago@lists.yoctoproject.org>;
 Mon,  9 May 2022 18:00:52 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id CCF2E174921
	for <meta-arago@lists.yoctoproject.org>;
 Mon,  9 May 2022 14:00:51 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [master][PATCH 2/3] glsdk-example-apps: specify branch and drop
 FILESEXTRAPATHS
Date: Mon,  9 May 2022 18:00:50 +0000
Message-Id: <20220509180051.2146987-2-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220509180051.2146987-1-denis@denix.org>
References: <20220509180051.2146987-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 09 May 2022 18:00:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13842

From: Denys Dmytriyenko <denys@konsulko.com>

Fixes these warnings:

| WARNING: glsdk-example-apps-1.0-r52 do_fetch: URL: git://git.ti.com/gls=
dk/example-applications.git;protocol=3Dgit
| does not set any branch parameter. The future default branch used by to=
ols and repositories
| is uncertain and we will therefore soon require this is set in all git =
urls.
| WARNING: glsdk-example-apps-1.0-r52 do_unpack: URL: git://git.ti.com/gl=
sdk/example-applications.git;protocol=3Dgit
| does not set any branch parameter. The future default branch used by to=
ols and repositories
| is uncertain and we will therefore soon require this is set in all git =
urls.

Also, modifying FILESEXTRAPATHS here is unnecessary.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-=
example-apps.bb b/meta-arago-extras/recipes-graphics/glsdk-example-apps/g=
lsdk-example-apps.bb
index 6e3ec7b3..de725c07 100644
--- a/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example=
-apps.bb
+++ b/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example=
-apps.bb
@@ -11,7 +11,7 @@ S =3D "${WORKDIR}/git"
=20
 inherit autotools pkgconfig
=20
-SRC_URI =3D "git://git.ti.com/glsdk/example-applications.git;protocol=3D=
git \
+SRC_URI =3D "git://git.ti.com/glsdk/example-applications.git;protocol=3D=
git;branch=3Dmaster \
 "
=20
 SRCREV=3D"52466430609c402a9f1c0667ccf727d096336d0d"
@@ -29,5 +29,3 @@ do_install:append () {
 }
=20
 FILES:${PN} +=3D "${sysconfdir}/glsdkstatcoll/* ${sysconfdir}/visualizat=
ion_scripts/*"
-
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
--=20
2.25.1


