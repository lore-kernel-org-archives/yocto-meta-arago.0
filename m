Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0023DC6FD35
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 04:02:56 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.890.1663041768912066367
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 12 Sep 2022 21:02:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5863C40D79
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 04:02:47 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CPVqgX7ESJyX for <meta-arago@lists.yoctoproject.org>;
	Tue, 13 Sep 2022 04:02:47 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4D27840D6E
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 04:02:47 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 6E7481749D2
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 00:02:45 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 06/52] ti-tisdk-setup: Update SRCREV to
 latest
Date: Tue, 13 Sep 2022 04:02:00 +0000
Message-Id: <20220913040246.2365077-7-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220913040246.2365077-1-denis@denix.org>
References: <20220913040246.2365077-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 13 Sep 2022 04:02:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13989

From: Aparna M <a-m1@ti.com>

Update SRCREV to include updates to create-sdcard.sh, uboot setup env
scripts and tftp support for HS EVMs.

Signed-off-by: Aparna M <a-m1@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setu=
p.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
index 5524ffcb..d312c59d 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://setup.sh;beginline=3D3;endli=
ne=3D31;md5=3Dfc4b04a33df6d892c
 PR =3D "r46"
=20
 BRANCH ?=3D "master"
-SRCREV =3D "42a8379fda829f34c374ddfca0242a479a84d454"
+SRCREV =3D "22f4e5af1894a60d9e7d04caf83f26a556c14eca"
 SRC_URI =3D "git://arago-project.org/git/projects/tisdk-setup-scripts.gi=
t;protocol=3Dgit;branch=3D${BRANCH}"
=20
 S =3D "${WORKDIR}/git"
--=20
2.25.1


