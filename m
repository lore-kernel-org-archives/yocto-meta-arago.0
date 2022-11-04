Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44986C41535
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 21:41:18 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.220.1667598074393043101
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 04 Nov 2022 14:41:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1DA4440D82
	for <meta-arago@lists.yoctoproject.org>; Fri,  4 Nov 2022 21:41:13 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ftMGwwiywmMT for <meta-arago@lists.yoctoproject.org>;
	Fri,  4 Nov 2022 21:41:13 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1338840D86
	for <meta-arago@lists.yoctoproject.org>; Fri,  4 Nov 2022 21:41:13 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 9DB7416367B
	for <meta-arago@lists.yoctoproject.org>; Fri,  4 Nov 2022 17:41:09 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 11/14] arago.conf: Specify omapl138 directly instead of omapl1
Date: Fri,  4 Nov 2022 21:41:09 +0000
Message-Id: <20221104214112.1221365-12-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104214112.1221365-1-denis@denix.org>
References: <20221104214112.1221365-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 04 Nov 2022 21:41:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14104

From: Andrew Davis <afd@ti.com>

Only omapl138 is supported now, being specific here lets us
remove a layer of family name support.

Signed-off-by: Andrew Davis <afd@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-arago-distro/conf/distro/arago.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro=
/conf/distro/arago.conf
index c1eb8f6d..57eeb57a 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -173,7 +173,7 @@ IMAGE_FSTYPES:remove =3D "${@['','ubi ubifs'][d.getVa=
r('ARAGO_SYSTEST_ENABLE') =3D=3D
 # Set some sane defaults, in case someone forgets to set them in local.c=
onf
 TC_SANE_DEFAULT ?=3D "arm"
 TOOLCHAIN_TYPE ?=3D "internal"
-TOOLCHAIN_TYPE:omapl1 =3D "internal"
+TOOLCHAIN_TYPE:omapl138 =3D "internal"
 TOOLCHAIN_BRAND ?=3D "${@[d.getVar('TC_SANE_DEFAULT'),'gcc'][d.getVar('T=
OOLCHAIN_TYPE') =3D=3D 'internal']}"
=20
 require conf/distro/include/toolchain-${TOOLCHAIN_BRAND}.inc
--=20
2.25.1


