Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ADDCC433F5
	for <webhook@archiver.kernel.org>; Fri, 13 May 2022 02:00:16 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.3468.1652407211558511506
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 12 May 2022 19:00:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8BEE140CEF;
	Fri, 13 May 2022 02:00:10 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lz6uIkNqVcTw; Fri, 13 May 2022 02:00:10 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7CEA640CF3;
	Fri, 13 May 2022 02:00:09 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id ABAA917492B;
	Thu, 12 May 2022 22:00:08 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [kirkstone/master][PATCH] arago.conf: switch to internal toolchain
 for now
Date: Fri, 13 May 2022 02:00:08 +0000
Message-Id: <20220513020008.3048052-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 13 May 2022 02:00:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13853

From: Denys Dmytriyenko <denys@konsulko.com>

Set default to build and use internal toolchain for now, instead of a pre=
-built
external one, as external gcc-11.2 toolchain still requires some work and=
 syncup
with latest meta-arm codebase.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-arago-distro/conf/distro/arago.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro=
/conf/distro/arago.conf
index b2246537..e24cace9 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -170,7 +170,7 @@ IMAGE_FSTYPES:remove =3D "${@['','ubi ubifs'][d.getVa=
r('ARAGO_SYSTEST_ENABLE') =3D=3D
 # Toolchain should be selected by setting TOOLCHAIN_BRAND in local.conf
 # Set some sane defaults, in case someone forgets to set them in local.c=
onf
 TC_SANE_DEFAULT ?=3D "arm"
-TOOLCHAIN_TYPE ?=3D "external"
+TOOLCHAIN_TYPE ?=3D "internal"
 TOOLCHAIN_TYPE:omapl1 =3D "internal"
 TOOLCHAIN_BRAND ?=3D "${@[d.getVar('TC_SANE_DEFAULT'),'gcc'][d.getVar('T=
OOLCHAIN_TYPE') =3D=3D 'internal']}"
=20
--=20
2.25.1


