Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EAE9C41513
	for <webhook@archiver.kernel.org>; Tue, 16 Jul 2024 01:50:25 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.1210.1721094618416598816
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 15 Jul 2024 18:50:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B4A2640C83;
	Tue, 16 Jul 2024 01:50:17 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GqYzFGZTT7aA; Tue, 16 Jul 2024 01:50:17 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5A8E3407DA;
	Tue, 16 Jul 2024 01:50:16 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 13C5C163FF0;
	Mon, 15 Jul 2024 21:50:16 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH] arago.conf: disable buildpaths QA errors in meta-qt5
Date: Mon, 15 Jul 2024 21:50:12 -0400
Message-Id: <20240716015013.3051611-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 16 Jul 2024 01:50:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15443

From: Denys Dmytriyenko <denys@konsulko.com>

As meta-qt5 is not going to fix the issues causing the errors:

https://github.com/meta-qt5/meta-qt5/issues/575

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-arago-distro/conf/distro/arago.conf | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro=
/conf/distro/arago.conf
index deaa8c02..716068ba 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -188,3 +188,7 @@ LICENSE_FLAGS_ACCEPTED =3D "commercial_gst-ffmpeg com=
mercial_gstreamer1.0-libav co
=20
 # Do not package own copy of perl into devkit, rely on host one
 ASSUME_PROVIDED +=3D "nativesdk-perl"
+
+# https://github.com/meta-qt5/meta-qt5/issues/575
+ERROR_QA:remove:layer-qt5-layer =3D "buildpaths"
+WARN_QA:append:layer-qt5-layer =3D " buildpaths"
--=20
2.25.1


