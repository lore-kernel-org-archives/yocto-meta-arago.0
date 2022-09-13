Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B95BFC6FD1F
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 04:02:56 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.852.1663041767771662772
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 12 Sep 2022 21:02:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3891640D4B
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 04:02:47 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SwigoGxJQE_s for <meta-arago@lists.yoctoproject.org>;
	Tue, 13 Sep 2022 04:02:47 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 12DB540D73
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 04:02:46 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 56B391749D0
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 00:02:45 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 04/52] matrix-gui-apps-git: Update SRCREV to
 latest
Date: Tue, 13 Sep 2022 04:01:58 +0000
Message-Id: <20220913040246.2365077-5-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220913040246.2365077-1-denis@denix.org>
References: <20220913040246.2365077-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 13 Sep 2022 04:02:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13988

From: Aparna M <a-m1@ti.com>

Update SRCREV to pick up changes to the out-of-board LED blink demo for
am64xx-evm

Signed-off-by: Aparna M <a-m1@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.in=
c b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
index fb61b340..5d6df788 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
@@ -4,7 +4,7 @@ LICENSE_CHECKSUM =3D "LICENSE;md5=3D6e0ae7214f6c74c149cb2=
5f373057fa9"
 LIC_FILES_CHKSUM :=3D "file://../${LICENSE_CHECKSUM}"
=20
 SRC_URI =3D "git://git.ti.com/matrix-gui-v2/matrix-gui-v2-apps.git;proto=
col=3Dgit;branch=3D${BRANCH}"
-SRCREV =3D "976e775a1275198d3391018ce8115a66d00120a2"
+SRCREV =3D "cad105b0c2b75a90f4def523b4fdbd0b6aa2fe8e"
 BRANCH =3D "master"
 INC_PR =3D "r76"
=20
--=20
2.25.1


