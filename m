Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2190C3ABBE
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 22:44:33 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.731.1746571466058536747
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 06 May 2025 15:44:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C59DD40CBF;
	Tue,  6 May 2025 22:44:24 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hrbKfK2sBWm4; Tue,  6 May 2025 22:44:24 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A938C40CBD;
	Tue,  6 May 2025 22:44:23 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 1A84E167928;
	Tue,  6 May 2025 18:44:23 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH] irqbalance: remove bbappend
Date: Tue,  6 May 2025 18:44:22 -0400
Message-Id: <20250506224422.39211-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 06 May 2025 22:44:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16185

From: Denys Dmytriyenko <denys@konsulko.com>

The version in meta-virtualization master branch is newer than
this bbappend specifies, plus it has a fix for gcc-15 build
issue.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-extended/irqbalance/irqbalance-arago.inc        | 4 ----
 .../recipes-extended/irqbalance/irqbalance_git.bbappend     | 6 ------
 2 files changed, 10 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-extended/irqbalance/irqbala=
nce-arago.inc
 delete mode 100644 meta-arago-distro/recipes-extended/irqbalance/irqbala=
nce_git.bbappend

diff --git a/meta-arago-distro/recipes-extended/irqbalance/irqbalance-ara=
go.inc b/meta-arago-distro/recipes-extended/irqbalance/irqbalance-arago.i=
nc
deleted file mode 100644
index 55f4b54b..00000000
--- a/meta-arago-distro/recipes-extended/irqbalance/irqbalance-arago.inc
+++ /dev/null
@@ -1,4 +0,0 @@
-SRCREV =3D "c24ed221e9e82faf1ad22de133c3c97a0117c5d7"
-PV =3D "1.9.2+git"
-
-PR:append =3D ".arago3"
diff --git a/meta-arago-distro/recipes-extended/irqbalance/irqbalance_git=
.bbappend b/meta-arago-distro/recipes-extended/irqbalance/irqbalance_git.=
bbappend
deleted file mode 100644
index af834564..00000000
--- a/meta-arago-distro/recipes-extended/irqbalance/irqbalance_git.bbappe=
nd
+++ /dev/null
@@ -1,6 +0,0 @@
-
-IRQBALANCE_ARAGO =3D ""
-IRQBALANCE_ARAGO:arago =3D "irqbalance-arago.inc"
-
-require ${IRQBALANCE_ARAGO}
-
--=20
2.25.1


