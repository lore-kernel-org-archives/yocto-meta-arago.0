Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3E43C6FD22
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 04:02:56 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.889.1663041772224426660
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 12 Sep 2022 21:02:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id AB3E540D44
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 04:02:51 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D7af7MzoZOg9 for <meta-arago@lists.yoctoproject.org>;
	Tue, 13 Sep 2022 04:02:51 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 689CC40D7F
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 04:02:47 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 9F9BE1749D9
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 00:02:45 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 13/52] tisdk-tiny-image: Add some usability
 notes
Date: Tue, 13 Sep 2022 04:02:07 +0000
Message-Id: <20220913040246.2365077-14-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220913040246.2365077-1-denis@denix.org>
References: <20220913040246.2365077-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 13 Sep 2022 04:02:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14029

From: Nishanth Menon <nm@ti.com>

Lets clarify the usage of tiny image as something meant as a building
block and not something that folks can directly use.

Signed-off-by: Nishanth Menon <nm@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-core/images/tisdk-tiny-image.bb            | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb b/=
meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
index 00e4e6ae..8117ebc5 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
@@ -1,3 +1,13 @@
+SUMMARY =3D "Arago TI SDK super minimal base image for initramfs"
+
+DESCRIPTION =3D "Image meant for basic boot of linux kernel. Intended as=
\
+ bare system, this image does not package the kernel in the\
+ standard /boot folder in rootfs. Instead, it provides a base\
+ rootfs allowing kernel to be deployed elsewhere\
+ (tftp/separate boot partition/jtag log etc..) and boot\
+ the image.\
+"
+
 ARAGO_TINY_IMAGE_EXTRA_INSTALL ?=3D ""
=20
 require arago-tiny-image.inc
--=20
2.25.1


