Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AD84C6FA93
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 04:02:56 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.896.1663041770108993381
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 12 Sep 2022 21:02:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7E4DD40D8F
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 04:02:48 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o2uxHLNB0s2d for <meta-arago@lists.yoctoproject.org>;
	Tue, 13 Sep 2022 04:02:48 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 71D6C40D8C
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 04:02:47 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 06BB11749D0
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 00:02:46 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 21/52] recipes-core: images: Introduce
 tisdk-bootstrap-image
Date: Tue, 13 Sep 2022 04:02:15 +0000
Message-Id: <20220913040246.2365077-22-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220913040246.2365077-1-denis@denix.org>
References: <20220913040246.2365077-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 13 Sep 2022 04:02:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14010

From: Nishanth Menon <nm@ti.com>

Lets introduce tisdk-bootstrap-image which now consists of a
completely bootable system with minimal initramfs that can be used
to boot up a system. We also will create a rootfs that matches with
the initramfs to allow users who use mmc and other boot media to have
access to the same debug tools for a new platform bringup

Signed-off-by: Nishanth Menon <nm@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../images/tisdk-bootstrap-image.bb           | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-arago-distro/recipes-core/images/tisdk-bootstrap=
-image.bb

diff --git a/meta-arago-distro/recipes-core/images/tisdk-bootstrap-image.=
bb b/meta-arago-distro/recipes-core/images/tisdk-bootstrap-image.bb
new file mode 100644
index 00000000..b41f09fb
--- /dev/null
+++ b/meta-arago-distro/recipes-core/images/tisdk-bootstrap-image.bb
@@ -0,0 +1,22 @@
+SUMMARY =3D "Arago TI SDK bootstrap image usable for board bringup"
+
+DESCRIPTION =3D "This image is a complete package containing a rootfs\
+ and an initrd with platform test utilities that can be used for new\
+ platform bringup activities. Typically one would use the bootstrap\
+ initrd till the storage media access is debugged, following which one\
+ would switch over to using the storage media of choice with the same\
+ content.\
+"
+
+require arago-tiny-image.inc
+
+ARAGO_BOOTSTRAP_IMAGE_EXTRA_INSTALL ?=3D ""
+
+IMAGE_INSTALL +=3D " \
+	packagegroup-arago-bootstrap \
+	kernel-base \
+	bootstrap-initrd \
+	${ARAGO_BOOTSTRAP_IMAGE_EXTRA_INSTALL} \
+"
+
+export IMAGE_BASENAME =3D "tisdk-bootstrap-image"
--=20
2.25.1


