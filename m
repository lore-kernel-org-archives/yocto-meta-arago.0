Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AED24C6FD1B
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 04:02:56 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.930.1663041769098134594
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 12 Sep 2022 21:02:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A0A2E40D80
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 04:02:47 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lKIzykKthWxf for <meta-arago@lists.yoctoproject.org>;
	Tue, 13 Sep 2022 04:02:47 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9753940D78
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 04:02:47 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id F03C01749CF
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 00:02:45 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 20/52] recipes-bsp: Create a
 bootstrap-initrd package
Date: Tue, 13 Sep 2022 04:02:14 +0000
Message-Id: <20220913040246.2365077-21-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220913040246.2365077-1-denis@denix.org>
References: <20220913040246.2365077-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 13 Sep 2022 04:02:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13997

From: Nishanth Menon <nm@ti.com>

Lets create an bootstrap-initrd package that installs the cpio
generated in the correct locations.

Signed-off-by: Nishanth Menon <nm@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../bootstrap-initrd/bootstrap-initrd_1.0.bb  | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-arago-distro/recipes-bsp/bootstrap-initrd/bootst=
rap-initrd_1.0.bb

diff --git a/meta-arago-distro/recipes-bsp/bootstrap-initrd/bootstrap-ini=
trd_1.0.bb b/meta-arago-distro/recipes-bsp/bootstrap-initrd/bootstrap-ini=
trd_1.0.bb
new file mode 100644
index 00000000..92822dc3
--- /dev/null
+++ b/meta-arago-distro/recipes-bsp/bootstrap-initrd/bootstrap-initrd_1.0=
.bb
@@ -0,0 +1,22 @@
+SUMMARY =3D "Prebuilt initramfs with apps for bootstraping new board"
+
+LICENSE =3D "MIT"
+
+CLEANBROKEN =3D "1"
+
+PACKAGE_ARCH =3D "${MACHINE_ARCH}"
+
+S =3D "${WORKDIR}"
+
+BOOSTRAP_IMAGE =3D "tisdk-bootstrap-base-image"
+
+TARGET =3D "bootstrap-rootfs-${MACHINE}.cpio"
+
+do_install() {
+	install -d ${D}/boot
+	install -m 0644 ${DEPLOY_DIR_IMAGE}/${BOOSTRAP_IMAGE}-${MACHINE}.cpio $=
{D}/boot/${TARGET}
+}
+
+FILES:${PN} =3D "/boot"
+
+do_install[depends] =3D "${BOOSTRAP_IMAGE}:do_image_complete"
--=20
2.25.1


