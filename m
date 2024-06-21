Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8FADC2BA18
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 00:43:04 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.62518.1718930582100006853
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 20 Jun 2024 17:43:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 30A9840CB7;
	Fri, 21 Jun 2024 00:43:01 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XnNGN1v--ygi; Fri, 21 Jun 2024 00:43:01 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 16D2640AC9;
	Fri, 21 Jun 2024 00:43:00 +0000 (UTC)
Received: from gimli.cabin (argonath.cabin [172.31.1.2])
	by mail.denix.org (Postfix) with ESMTP id 2B4E7163FC1;
	Thu, 20 Jun 2024 20:42:59 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/scarthgap][PATCH] branding: fix the variable name for selecting BSP
Date: Thu, 20 Jun 2024 20:42:58 -0400
Message-Id: <20240621004258.5737-1-denis@denix.org>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 21 Jun 2024 00:43:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15407

From: Denys Dmytriyenko <denys@konsulko.com>

The variable name to select the BSP has changed in meta-ti, but was not
reflected in meta-arago. Fix it now.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-arago-distro/conf/distro/include/branding-ltsprep.inc  | 2 +-
 meta-arago-distro/conf/distro/include/branding-mainline.inc | 2 +-
 meta-arago-distro/conf/distro/include/branding-next.inc     | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/branding-ltsprep.inc b=
/meta-arago-distro/conf/distro/include/branding-ltsprep.inc
index 1b295adf..2d4e162b 100644
--- a/meta-arago-distro/conf/distro/include/branding-ltsprep.inc
+++ b/meta-arago-distro/conf/distro/include/branding-ltsprep.inc
@@ -1,4 +1,4 @@
-TI_DEFAULT_BSP =3D "ti-6_6"
+TI_PREFERRED_BSP =3D "ti-6_6"
=20
 # Remove mmip - DRM allocator, KMS sink, Wayland sink need porting to GS=
T 1.18
 MACHINE_FEATURES:remove =3D "mmip"
diff --git a/meta-arago-distro/conf/distro/include/branding-mainline.inc =
b/meta-arago-distro/conf/distro/include/branding-mainline.inc
index 245fa19b..95cbe10c 100644
--- a/meta-arago-distro/conf/distro/include/branding-mainline.inc
+++ b/meta-arago-distro/conf/distro/include/branding-mainline.inc
@@ -1 +1 @@
-TI_DEFAULT_BSP =3D "mainline"
+TI_PREFERRED_BSP =3D "mainline"
diff --git a/meta-arago-distro/conf/distro/include/branding-next.inc b/me=
ta-arago-distro/conf/distro/include/branding-next.inc
index 3b504aa1..8f68b75a 100644
--- a/meta-arago-distro/conf/distro/include/branding-next.inc
+++ b/meta-arago-distro/conf/distro/include/branding-next.inc
@@ -1,4 +1,4 @@
-TI_DEFAULT_BSP =3D "mainline"
+TI_PREFERRED_BSP =3D "mainline"
 PREFERRED_PROVIDER_virtual/kernel =3D "linux-ti-next"
=20
 SRCREV:pn-linux-ti-next =3D "${AUTOREV}"
--=20
2.35.3


