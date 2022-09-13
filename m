Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 576BBC54EE9
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 04:02:56 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.900.1663041774268194438
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 12 Sep 2022 21:02:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B6B5140D6E
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 04:02:53 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EmGaoNBzBxuV for <meta-arago@lists.yoctoproject.org>;
	Tue, 13 Sep 2022 04:02:53 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 69EFE40D8B
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 04:02:47 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id E48AB1749CE
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 00:02:45 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 19/52] recipes-core: images: Add a basic
 bootstrap base image
Date: Tue, 13 Sep 2022 04:02:13 +0000
Message-Id: <20220913040246.2365077-20-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220913040246.2365077-1-denis@denix.org>
References: <20220913040246.2365077-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 13 Sep 2022 04:02:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14032

From: Nishanth Menon <nm@ti.com>

Since we do not wish to modify the tiny-image from anything but really
tiny, lets use that infrastructure and add the bootstrap package group
to create initramfs (not exactly a completely usable system) which can
be used for basic board bringup.

This generates cpio around 36-40MB which should be usually fine for
even smaller systems (Ofcourse, this is much larger than tiny-image
which is around 6MB size). The packages are organized per size to
allow easier customization if desired.

Signed-off-by: Nishanth Menon <nm@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../images/tisdk-bootstrap-base-image.bb      | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-arago-distro/recipes-core/images/tisdk-bootstrap=
-base-image.bb

diff --git a/meta-arago-distro/recipes-core/images/tisdk-bootstrap-base-i=
mage.bb b/meta-arago-distro/recipes-core/images/tisdk-bootstrap-base-imag=
e.bb
new file mode 100644
index 00000000..8b7f10c9
--- /dev/null
+++ b/meta-arago-distro/recipes-core/images/tisdk-bootstrap-base-image.bb
@@ -0,0 +1,22 @@
+SUMMARY =3D "Arago TI SDK bootstrap base image for initramfs"
+
+DESCRIPTION =3D "Image meant for basic system verification of linux kern=
el.\
+ Intended as basic test system, this image does not package the kernel\
+ in the standard /boot folder in rootfs. Instead, it provides a base\
+ rootfs with enough basic board bringup utilities allowing kernel to be\
+ deployed elsewhere (tftp/separate boot partition/jtag log etc..) and\
+ maybe used for basic platform bringup (bootstrap) activities.\
+"
+
+require arago-tiny-image.inc
+
+IMAGE_FSTYPES +=3D "cpio cpio.xz"
+
+ARAGO_BOOTSTRAP_IMAGE_EXTRA_INSTALL ?=3D ""
+
+IMAGE_INSTALL +=3D " \
+	packagegroup-arago-bootstrap \
+	${ARAGO_BOOTSTRAP_IMAGE_EXTRA_INSTALL} \
+"
+
+export IMAGE_BASENAME =3D "tisdk-bootstrap-base-image"
--=20
2.25.1


