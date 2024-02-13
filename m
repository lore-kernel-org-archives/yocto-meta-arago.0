Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDBA3C4829E
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 03:25:31 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.3573.1707794721622483338
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 12 Feb 2024 19:25:22 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id F044940C56;
	Tue, 13 Feb 2024 03:25:20 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HS5JQplmuvqz; Tue, 13 Feb 2024 03:25:20 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E6A9E40C2E;
	Tue, 13 Feb 2024 03:25:18 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id A1020163E37;
	Mon, 12 Feb 2024 22:25:18 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH] layer.conf: add compatibility with scarthgap
Date: Mon, 12 Feb 2024 22:25:13 -0500
Message-Id: <20240213032513.3884498-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 13 Feb 2024 03:25:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15171

From: Denys Dmytriyenko <denys@konsulko.com>

OE-Core master has switched compatibility requirements from nanbield
to scarthgap in preparation for the upcoming 5.0 release.
https://wiki.yoctoproject.org/wiki/Releases

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-arago-demos/conf/layer.conf  | 2 +-
 meta-arago-distro/conf/layer.conf | 2 +-
 meta-arago-extras/conf/layer.conf | 2 +-
 meta-arago-test/conf/layer.conf   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arago-demos/conf/layer.conf b/meta-arago-demos/conf/lay=
er.conf
index ad443057..bcfbf0de 100644
--- a/meta-arago-demos/conf/layer.conf
+++ b/meta-arago-demos/conf/layer.conf
@@ -8,7 +8,7 @@ BBFILE_COLLECTIONS +=3D "meta-arago-demos"
 BBFILE_PATTERN_meta-arago-demos :=3D "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-arago-demos =3D "10"
=20
-LAYERSERIES_COMPAT_meta-arago-demos =3D "kirkstone langdale mickledore n=
anbield"
+LAYERSERIES_COMPAT_meta-arago-demos =3D "kirkstone langdale mickledore n=
anbield scarthgap"
=20
 LAYERDEPENDS_meta-arago-demos =3D " \
     core \
diff --git a/meta-arago-distro/conf/layer.conf b/meta-arago-distro/conf/l=
ayer.conf
index 086b0411..6d0a071d 100644
--- a/meta-arago-distro/conf/layer.conf
+++ b/meta-arago-distro/conf/layer.conf
@@ -8,7 +8,7 @@ BBFILE_COLLECTIONS +=3D "meta-arago-distro"
 BBFILE_PATTERN_meta-arago-distro :=3D "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-arago-distro =3D "10"
=20
-LAYERSERIES_COMPAT_meta-arago-distro =3D "kirkstone langdale mickledore =
nanbield"
+LAYERSERIES_COMPAT_meta-arago-distro =3D "kirkstone langdale mickledore =
nanbield scarthgap"
=20
 LAYERDEPENDS_meta-arago-distro =3D " \
     core \
diff --git a/meta-arago-extras/conf/layer.conf b/meta-arago-extras/conf/l=
ayer.conf
index be84afb8..1a415e89 100644
--- a/meta-arago-extras/conf/layer.conf
+++ b/meta-arago-extras/conf/layer.conf
@@ -8,7 +8,7 @@ BBFILE_COLLECTIONS +=3D "meta-arago-extras"
 BBFILE_PATTERN_meta-arago-extras :=3D "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-arago-extras =3D "10"
=20
-LAYERSERIES_COMPAT_meta-arago-extras =3D "kirkstone langdale mickledore =
nanbield"
+LAYERSERIES_COMPAT_meta-arago-extras =3D "kirkstone langdale mickledore =
nanbield scarthgap"
=20
 # Set a variable to get to the top of the metadata location
 ARAGOBASE :=3D '${@os.path.normpath("${LAYERDIR}/../")}'
diff --git a/meta-arago-test/conf/layer.conf b/meta-arago-test/conf/layer=
.conf
index f31d69c4..3d23e5de 100644
--- a/meta-arago-test/conf/layer.conf
+++ b/meta-arago-test/conf/layer.conf
@@ -8,7 +8,7 @@ BBFILE_COLLECTIONS +=3D "meta-arago-test"
 BBFILE_PATTERN_meta-arago-test :=3D "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-arago-test =3D "10"
=20
-LAYERSERIES_COMPAT_meta-arago-test =3D "kirkstone langdale mickledore na=
nbield"
+LAYERSERIES_COMPAT_meta-arago-test =3D "kirkstone langdale mickledore na=
nbield scarthgap"
=20
 # Set a variable to get to the top of the metadata location
 TITESTBASE :=3D '${@os.path.normpath("${LAYERDIR}/")}'
--=20
2.25.1


