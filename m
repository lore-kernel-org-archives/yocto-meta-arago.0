Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01164C6FD36
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 04:02:57 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.888.1663041768960669026
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 12 Sep 2022 21:02:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 601F740D6E
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 04:02:47 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id erkqXeV7ue7a for <meta-arago@lists.yoctoproject.org>;
	Tue, 13 Sep 2022 04:02:47 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4EF8740D75
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 04:02:47 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 86B341749D5
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 00:02:45 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 09/52] recipes-core: images: Add
 tisdk-thinlinux-image
Date: Tue, 13 Sep 2022 04:02:03 +0000
Message-Id: <20220913040246.2365077-10-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220913040246.2365077-1-denis@denix.org>
References: <20220913040246.2365077-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 13 Sep 2022 04:02:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13990

From: Nishanth Menon <nm@ti.com>

Currently we have tisdk-tiny-image tisdk-base-image and
tisdk-default-image which serve certain purpose for the users.

However, These are either too heavy or too pointed towards validation.

Hence, let us introduce a basic thinlinux image that has the basic
system configured for out of box container usage without changing the
meaning of existing image content definitions.

Signed-off-by: Nishanth Menon <nm@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../images/tisdk-thinlinux-image.bb           | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-arago-distro/recipes-core/images/tisdk-thinlinux=
-image.bb

diff --git a/meta-arago-distro/recipes-core/images/tisdk-thinlinux-image.=
bb b/meta-arago-distro/recipes-core/images/tisdk-thinlinux-image.bb
new file mode 100644
index 00000000..b344cdbf
--- /dev/null
+++ b/meta-arago-distro/recipes-core/images/tisdk-thinlinux-image.bb
@@ -0,0 +1,24 @@
+# Arago TI Thin Linux image
+# Minimal bootable image with container to start the next complex system=
 up.
+
+require arago-image.inc
+
+SPLASH =3D "${@bb.utils.contains('MACHINE_FEATURES','gpu','psplash','',d=
)}"
+
+# Allow users to tack on additional packages as interesting.
+ARAGO_THIN_IMAGE_EXTRA_INSTALL ?=3D ""
+
+IMAGE_INSTALL +=3D "\
+    packagegroup-arago-base \
+    packagegroup-arago-console \
+    packagegroup-arago-base-tisdk \
+    ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-ti=
sdk-graphics','',d)} \
+    docker \
+    ${ARAGO_THIN_IMAGE_EXTRA_INSTALL} \
+"
+
+export IMAGE_BASENAME =3D "tisdk-thinlinux-image"
+
+# Disable ubi/ubifs as the filesystem requires more space than is
+# available on the HW.
+IMAGE_FSTYPES:remove:omapl138 =3D "ubifs ubi"
--=20
2.25.1


