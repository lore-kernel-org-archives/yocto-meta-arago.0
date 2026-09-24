Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E6A7C98317
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 13:51:45 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8311.1790257896781529806
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 24 Sep 2026 06:51:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DA5D940C82;
	Thu, 24 Sep 2026 13:51:35 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZQe1sezZgjOK; Thu, 24 Sep 2026 13:51:35 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B360540BA7;
	Thu, 24 Sep 2026 13:51:34 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 5224F17E3F6;
	Thu, 24 Sep 2026 09:51:34 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: "Denys Dmytriyenko (TI)" <denys@konsulko.com>
Subject: [master][PATCH] meta*/layer.con: update layer compatibility for blacksail
Date: Thu, 24 Sep 2026 09:51:33 -0400
Message-Id: <20260924135133.1406245-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 24 Sep 2026 13:51:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17706

From: "Denys Dmytriyenko (TI)" <denys@konsulko.com>

The upcoming 6.1 "Blacksail" release is around the corner and OE-Core
set the layer compatibility requirements accordingly:
https://git.openembedded.org/openembedded-core/commit/?id=3D37623ffbdd34a=
5c6b3e12ee33195f8e82343f198

While at it, drop "whinlatter" compatibility, which is now EOL.

Signed-off-by: Denys Dmytriyenko (TI) <denys@konsulko.com>
---
 meta-arago-distro/conf/layer.conf | 2 +-
 meta-arago-extras/conf/layer.conf | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/conf/layer.conf b/meta-arago-distro/conf/l=
ayer.conf
index f1593d83..e1843a53 100644
--- a/meta-arago-distro/conf/layer.conf
+++ b/meta-arago-distro/conf/layer.conf
@@ -8,7 +8,7 @@ BBFILE_COLLECTIONS +=3D "meta-arago-distro"
 BBFILE_PATTERN_meta-arago-distro :=3D "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-arago-distro =3D "10"
=20
-LAYERSERIES_COMPAT_meta-arago-distro =3D "whinlatter wrynose"
+LAYERSERIES_COMPAT_meta-arago-distro =3D "wrynose blacksail"
=20
 LAYERDEPENDS_meta-arago-distro =3D " \
     core \
diff --git a/meta-arago-extras/conf/layer.conf b/meta-arago-extras/conf/l=
ayer.conf
index 29107f12..3644c174 100644
--- a/meta-arago-extras/conf/layer.conf
+++ b/meta-arago-extras/conf/layer.conf
@@ -8,7 +8,7 @@ BBFILE_COLLECTIONS +=3D "meta-arago-extras"
 BBFILE_PATTERN_meta-arago-extras :=3D "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-arago-extras =3D "10"
=20
-LAYERSERIES_COMPAT_meta-arago-extras =3D "whinlatter wrynose"
+LAYERSERIES_COMPAT_meta-arago-extras =3D "wrynose blacksail"
=20
 # Set a variable to get to the top of the metadata location
 ARAGOBASE :=3D '${@os.path.normpath("${LAYERDIR}/../")}'
--=20
2.25.1


