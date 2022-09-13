Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 899A2C6FA96
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 04:02:56 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.934.1663041771123437943
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 12 Sep 2022 21:02:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A150F40D75
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 04:02:49 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AYG6ms-IRkb4 for <meta-arago@lists.yoctoproject.org>;
	Tue, 13 Sep 2022 04:02:49 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9772A40D73
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 04:02:48 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 369141666A7
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 00:02:47 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 51/52] packagegroups: fix remainder of
 ${PN}-src instances
Date: Tue, 13 Sep 2022 04:02:45 +0000
Message-Id: <20220913040246.2365077-52-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220913040246.2365077-1-denis@denix.org>
References: <20220913040246.2365077-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 13 Sep 2022 04:02:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14027

From: Denys Dmytriyenko <denys@konsulko.com>

Commit 331e49bf718d0915c67cf59bf9734cf82b768b3a changed ${PN}-src into ${=
PN}-source,
rename some left overs.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb | 4 ++--
 .../packagegroup-arago-tisdk-multimedia-sdk-host.bb           | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegrou=
ps/packagegroup-arago-tisdk-addons-sdk-host.bb
index a741eb03..d79d2756 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-addons-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-addons-sdk-host.bb
@@ -50,7 +50,7 @@ UTILS:append:am65xx =3D " \
 "
=20
 UTILS:append:am64xx =3D " \
-    pru-icss-src \
+    pru-icss-source \
 "
=20
 EXTRA_LIBS =3D ""
@@ -76,7 +76,7 @@ EXTRA_LIBS:append:ti43x =3D " \
 "
=20
 PDM_ANOMALY_PKG_SRC =3D "\
-    ${@bb.utils.contains('MACHINE_FEATURES', 'gpu', 'pdm-anomaly-detecti=
on-src', '', d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'gpu', 'pdm-anomaly-detecti=
on-source', '', d)} \
 "
=20
 EXTRA_PACKAGES =3D ""
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-multimedia-sdk-host.bb b/meta-arago-distro/recipes-core/package=
groups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
index 3169fd0a..d377f500 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-multimedia-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-multimedia-sdk-host.bb
@@ -11,8 +11,8 @@ BARCODE_PKG =3D ""
 #    ${@['','barcode-roi-source'][oe.utils.all_distro_features(d, 'openc=
v', True, False) and bb.utils.contains('MACHINE_FEATURES', 'dsp', True, F=
alse, d)]} \
 #"
=20
-DUAL_CAMERA_PKG =3D "${@bb.utils.contains('MACHINE_FEATURES', 'gpu', 'du=
al-camera-demo-src', '', d)}"
-IMAGE_GALLERY_PKG =3D "${@bb.utils.contains('MACHINE_FEATURES', 'gpu','i=
mage-gallery-src', '', d)}"
+DUAL_CAMERA_PKG =3D "${@bb.utils.contains('MACHINE_FEATURES', 'gpu', 'du=
al-camera-demo-source', '', d)}"
+IMAGE_GALLERY_PKG =3D "${@bb.utils.contains('MACHINE_FEATURES', 'gpu','i=
mage-gallery-source', '', d)}"
=20
 MULTIMEDIA =3D ""
=20
--=20
2.25.1


