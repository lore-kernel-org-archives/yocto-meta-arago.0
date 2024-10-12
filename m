Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2F2DCF2584
	for <webhook@archiver.kernel.org>; Sat, 12 Oct 2024 21:19:31 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.19618.1728767967227655823
 for <meta-arago@lists.yoctoproject.org>;
 Sat, 12 Oct 2024 14:19:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9AE2F4126C;
	Sat, 12 Oct 2024 21:19:26 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jbIW1MLLT8VN; Sat, 12 Oct 2024 21:19:26 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 85B2241266;
	Sat, 12 Oct 2024 21:19:25 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 4962F16408C;
	Sat, 12 Oct 2024 17:19:25 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH] layer.conf: add compatibility with walnascar
Date: Sat, 12 Oct 2024 17:19:25 -0400
Message-Id: <20241012211925.54869-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sat, 12 Oct 2024 21:19:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15569

From: Denys Dmytriyenko <denys@konsulko.com>

The next Yocto Project release is called walnascar and OE-Core master bra=
nch
is now marked accordingly. Add layer compatibility with walnascar.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-arago-demos/conf/layer.conf  | 2 +-
 meta-arago-distro/conf/layer.conf | 2 +-
 meta-arago-extras/conf/layer.conf | 2 +-
 meta-arago-test/conf/layer.conf   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arago-demos/conf/layer.conf b/meta-arago-demos/conf/lay=
er.conf
index cb18f840..782c5914 100644
--- a/meta-arago-demos/conf/layer.conf
+++ b/meta-arago-demos/conf/layer.conf
@@ -8,7 +8,7 @@ BBFILE_COLLECTIONS +=3D "meta-arago-demos"
 BBFILE_PATTERN_meta-arago-demos :=3D "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-arago-demos =3D "10"
=20
-LAYERSERIES_COMPAT_meta-arago-demos =3D "scarthgap styhead"
+LAYERSERIES_COMPAT_meta-arago-demos =3D "scarthgap styhead walnascar"
=20
 LAYERDEPENDS_meta-arago-demos =3D " \
     core \
diff --git a/meta-arago-distro/conf/layer.conf b/meta-arago-distro/conf/l=
ayer.conf
index 3368b8c0..d86da75c 100644
--- a/meta-arago-distro/conf/layer.conf
+++ b/meta-arago-distro/conf/layer.conf
@@ -8,7 +8,7 @@ BBFILE_COLLECTIONS +=3D "meta-arago-distro"
 BBFILE_PATTERN_meta-arago-distro :=3D "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-arago-distro =3D "10"
=20
-LAYERSERIES_COMPAT_meta-arago-distro =3D "scarthgap styhead"
+LAYERSERIES_COMPAT_meta-arago-distro =3D "scarthgap styhead walnascar"
=20
 LAYERDEPENDS_meta-arago-distro =3D " \
     core \
diff --git a/meta-arago-extras/conf/layer.conf b/meta-arago-extras/conf/l=
ayer.conf
index 5ab1591f..b7390e44 100644
--- a/meta-arago-extras/conf/layer.conf
+++ b/meta-arago-extras/conf/layer.conf
@@ -8,7 +8,7 @@ BBFILE_COLLECTIONS +=3D "meta-arago-extras"
 BBFILE_PATTERN_meta-arago-extras :=3D "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-arago-extras =3D "10"
=20
-LAYERSERIES_COMPAT_meta-arago-extras =3D "scarthgap styhead"
+LAYERSERIES_COMPAT_meta-arago-extras =3D "scarthgap styhead walnascar"
=20
 # Set a variable to get to the top of the metadata location
 ARAGOBASE :=3D '${@os.path.normpath("${LAYERDIR}/../")}'
diff --git a/meta-arago-test/conf/layer.conf b/meta-arago-test/conf/layer=
.conf
index 20d72c24..da73fb05 100644
--- a/meta-arago-test/conf/layer.conf
+++ b/meta-arago-test/conf/layer.conf
@@ -8,7 +8,7 @@ BBFILE_COLLECTIONS +=3D "meta-arago-test"
 BBFILE_PATTERN_meta-arago-test :=3D "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-arago-test =3D "10"
=20
-LAYERSERIES_COMPAT_meta-arago-test =3D "scarthgap styhead"
+LAYERSERIES_COMPAT_meta-arago-test =3D "scarthgap styhead walnascar"
=20
 # Set a variable to get to the top of the metadata location
 TITESTBASE :=3D '${@os.path.normpath("${LAYERDIR}/")}'
--=20
2.25.1


