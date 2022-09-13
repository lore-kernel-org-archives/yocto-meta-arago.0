Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3113C6FD21
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 04:02:56 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.889.1663041769037531252
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 12 Sep 2022 21:02:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 75AC540D7A
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 04:02:47 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QNtvWCVn3qvj for <meta-arago@lists.yoctoproject.org>;
	Tue, 13 Sep 2022 04:02:47 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 60BAB40D73
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 04:02:47 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 9DEB41749D8
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 00:02:45 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 12/52] tisdk-tiny-image: Split common
 components into include file
Date: Tue, 13 Sep 2022 04:02:06 +0000
Message-Id: <20220913040246.2365077-13-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220913040246.2365077-1-denis@denix.org>
References: <20220913040246.2365077-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 13 Sep 2022 04:02:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13994

From: Nishanth Menon <nm@ti.com>

Lets split the common pieces for creating a tiny image into an include
file. This can then be used to incrementally build additional images
as well.

Signed-off-by: Nishanth Menon <nm@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-core/images/arago-tiny-image.inc          |  9 +++++++++
 .../recipes-core/images/tisdk-tiny-image.bb           | 11 ++++-------
 2 files changed, 13 insertions(+), 7 deletions(-)
 create mode 100644 meta-arago-distro/recipes-core/images/arago-tiny-imag=
e.inc

diff --git a/meta-arago-distro/recipes-core/images/arago-tiny-image.inc b=
/meta-arago-distro/recipes-core/images/arago-tiny-image.inc
new file mode 100644
index 00000000..242e763c
--- /dev/null
+++ b/meta-arago-distro/recipes-core/images/arago-tiny-image.inc
@@ -0,0 +1,9 @@
+ARAGO_SYSVINIT =3D "1"
+
+require arago-image.inc
+
+IMAGE_FEATURES:remove =3D "splash"
+
+IMAGE_INSTALL =3D " \
+	packagegroup-arago-sysvinit-boot \
+"
diff --git a/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb b/=
meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
index 9ea91701..00e4e6ae 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
@@ -1,15 +1,12 @@
-ARAGO_SYSVINIT =3D "1"
+ARAGO_TINY_IMAGE_EXTRA_INSTALL ?=3D ""
=20
-require arago-image.inc
+require arago-tiny-image.inc
=20
-IMAGE_FEATURES:remove =3D "package-management splash"
+IMAGE_FEATURES:remove =3D "package-management"
=20
 IMAGE_FSTYPES +=3D "cpio cpio.xz"
=20
-ARAGO_TINY_IMAGE_EXTRA_INSTALL ?=3D ""
-
-IMAGE_INSTALL =3D " \
-	packagegroup-arago-sysvinit-boot \
+IMAGE_INSTALL +=3D " \
 	${ARAGO_TINY_IMAGE_EXTRA_INSTALL} \
 "
=20
--=20
2.25.1


