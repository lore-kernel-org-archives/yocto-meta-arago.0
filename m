Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B239C3DA59
	for <webhook@archiver.kernel.org>; Tue, 16 Jul 2024 22:05:00 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.2212.1721167496359957039
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 16 Jul 2024 15:04:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6364A40C79;
	Tue, 16 Jul 2024 22:04:55 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6IMvO_4SXmhz; Tue, 16 Jul 2024 22:04:55 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4DAD4407DA;
	Tue, 16 Jul 2024 22:04:54 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 22FAD163FF0;
	Tue, 16 Jul 2024 18:04:53 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH] arago.conf: disable build-deps QA check for nativesdk-openssl-misc
Date: Tue, 16 Jul 2024 18:04:52 -0400
Message-Id: <20240716220452.3827868-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 16 Jul 2024 22:05:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15452

From: Denys Dmytriyenko <denys@konsulko.com>

This gets exposed by nativesdk-perl in ASSUME_PROVIDED and being
tracked in upstream bugzilla:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15552

So, when/if this gets fixed upstream, the workaround can be dropped.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-arago-distro/conf/distro/arago.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro=
/conf/distro/arago.conf
index 716068ba..be833c94 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -189,6 +189,9 @@ LICENSE_FLAGS_ACCEPTED =3D "commercial_gst-ffmpeg com=
mercial_gstreamer1.0-libav co
 # Do not package own copy of perl into devkit, rely on host one
 ASSUME_PROVIDED +=3D "nativesdk-perl"
=20
+# https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15552
+INSANE_SKIP:nativesdk-openssl-misc +=3D "build-deps"
+
 # https://github.com/meta-qt5/meta-qt5/issues/575
 ERROR_QA:remove:layer-qt5-layer =3D "buildpaths"
 WARN_QA:append:layer-qt5-layer =3D " buildpaths"
--=20
2.25.1


