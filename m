Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9FEBCA0EC9
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 04:45:03 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.18444.1694493897425279149
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 11 Sep 2023 21:44:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C2ED440C13;
	Tue, 12 Sep 2023 04:44:56 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6qaBZd9KB0iL; Tue, 12 Sep 2023 04:44:56 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-110-236.washdc.fios.verizon.net [100.15.110.236])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A847B40952;
	Tue, 12 Sep 2023 04:44:55 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 667ED163CAA;
	Tue, 12 Sep 2023 00:44:55 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH] meta-arago: layer.conf: add compatibility with nanbield
Date: Tue, 12 Sep 2023 04:44:55 +0000
Message-Id: <20230912044455.1080895-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 12 Sep 2023 04:45:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14899

From: Denys Dmytriyenko <denys@konsulko.com>

OE-Core is switching layer compatibility to nanbield for the upcoming rel=
ease.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-arago-demos/conf/layer.conf  | 2 +-
 meta-arago-distro/conf/layer.conf | 2 +-
 meta-arago-extras/conf/layer.conf | 2 +-
 meta-arago-test/conf/layer.conf   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arago-demos/conf/layer.conf b/meta-arago-demos/conf/lay=
er.conf
index 3d452d6f..ad443057 100644
--- a/meta-arago-demos/conf/layer.conf
+++ b/meta-arago-demos/conf/layer.conf
@@ -8,7 +8,7 @@ BBFILE_COLLECTIONS +=3D "meta-arago-demos"
 BBFILE_PATTERN_meta-arago-demos :=3D "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-arago-demos =3D "10"
=20
-LAYERSERIES_COMPAT_meta-arago-demos =3D "kirkstone langdale mickledore"
+LAYERSERIES_COMPAT_meta-arago-demos =3D "kirkstone langdale mickledore n=
anbield"
=20
 LAYERDEPENDS_meta-arago-demos =3D " \
     core \
diff --git a/meta-arago-distro/conf/layer.conf b/meta-arago-distro/conf/l=
ayer.conf
index b112a332..b6d3202f 100644
--- a/meta-arago-distro/conf/layer.conf
+++ b/meta-arago-distro/conf/layer.conf
@@ -8,7 +8,7 @@ BBFILE_COLLECTIONS +=3D "meta-arago-distro"
 BBFILE_PATTERN_meta-arago-distro :=3D "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-arago-distro =3D "10"
=20
-LAYERSERIES_COMPAT_meta-arago-distro =3D "kirkstone langdale mickledore"
+LAYERSERIES_COMPAT_meta-arago-distro =3D "kirkstone langdale mickledore =
nanbield"
=20
 LAYERDEPENDS_meta-arago-distro =3D " \
     core \
diff --git a/meta-arago-extras/conf/layer.conf b/meta-arago-extras/conf/l=
ayer.conf
index 15074dad..be84afb8 100644
--- a/meta-arago-extras/conf/layer.conf
+++ b/meta-arago-extras/conf/layer.conf
@@ -8,7 +8,7 @@ BBFILE_COLLECTIONS +=3D "meta-arago-extras"
 BBFILE_PATTERN_meta-arago-extras :=3D "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-arago-extras =3D "10"
=20
-LAYERSERIES_COMPAT_meta-arago-extras =3D "kirkstone langdale mickledore"
+LAYERSERIES_COMPAT_meta-arago-extras =3D "kirkstone langdale mickledore =
nanbield"
=20
 # Set a variable to get to the top of the metadata location
 ARAGOBASE :=3D '${@os.path.normpath("${LAYERDIR}/../")}'
diff --git a/meta-arago-test/conf/layer.conf b/meta-arago-test/conf/layer=
.conf
index b56c3046..f31d69c4 100644
--- a/meta-arago-test/conf/layer.conf
+++ b/meta-arago-test/conf/layer.conf
@@ -8,7 +8,7 @@ BBFILE_COLLECTIONS +=3D "meta-arago-test"
 BBFILE_PATTERN_meta-arago-test :=3D "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-arago-test =3D "10"
=20
-LAYERSERIES_COMPAT_meta-arago-test =3D "kirkstone langdale mickledore"
+LAYERSERIES_COMPAT_meta-arago-test =3D "kirkstone langdale mickledore na=
nbield"
=20
 # Set a variable to get to the top of the metadata location
 TITESTBASE :=3D '${@os.path.normpath("${LAYERDIR}/")}'
--=20
2.25.1


