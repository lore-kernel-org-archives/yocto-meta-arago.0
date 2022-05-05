Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24EBBC433F5
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 22:04:11 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.2751.1651788240925336791
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 05 May 2022 15:04:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id F1ABC40C30;
	Thu,  5 May 2022 22:03:59 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yIhqCtPUNpnM; Thu,  5 May 2022 22:03:59 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D7ED840A3D;
	Thu,  5 May 2022 22:03:58 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 9436717491D;
	Thu,  5 May 2022 18:03:58 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 2/2] arago-prefs: drop setting preferences for 3D
 graphics providers
Date: Thu,  5 May 2022 22:03:57 +0000
Message-Id: <20220505220357.343789-2-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220505220357.343789-1-denis@denix.org>
References: <20220505220357.343789-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 05 May 2022 22:04:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13838

From: Denys Dmytriyenko <denys@konsulko.com>

As meta-ti now sets them per-machine.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../conf/distro/include/arago-prefs.inc           | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta=
-arago-distro/conf/distro/include/arago-prefs.inc
index 65ce2a96..2dc4f212 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -6,21 +6,6 @@ PREFERRED_PROVIDER_ltp-ddt =3D "ltp-ddt"
=20
 PREFERRED_PROVIDER_virtual/gettext =3D "gettext"
=20
-# OpenGLES/EGL/GBM preferences
-# Most of existing TI platforms have SGX GPU core
-PREFERRED_PROVIDER_virtual/egl =3D "ti-sgx-ddk-um"
-PREFERRED_PROVIDER_virtual/libgles1 =3D "ti-sgx-ddk-um"
-PREFERRED_PROVIDER_virtual/libgles2 =3D "ti-sgx-ddk-um"
-PREFERRED_PROVIDER_virtual/libgbm =3D "ti-sgx-ddk-um"
-PREFERRED_PROVIDER_virtual/gpudriver =3D "ti-sgx-ddk-km"
-
-# J721e has a Rogue GPU core
-PREFERRED_PROVIDER_virtual/egl:j721e =3D "ti-img-rogue-umlibs"
-PREFERRED_PROVIDER_virtual/libgles1:j721e =3D "ti-img-rogue-umlibs"
-PREFERRED_PROVIDER_virtual/libgles2:j721e =3D "ti-img-rogue-umlibs"
-PREFERRED_PROVIDER_virtual/libgbm:j721e =3D "ti-img-rogue-umlibs"
-PREFERRED_PROVIDER_virtual/gpudriver:j721e =3D "ti-img-rogue-driver"
-
 PREFERRED_PROVIDER_virtual/kernel =3D "linux-ti-staging${ARAGO_KERNEL_SU=
FFIX}"
=20
 PREFERRED_PROVIDER_jpeg =3D "libjpeg-turbo"
--=20
2.25.1


