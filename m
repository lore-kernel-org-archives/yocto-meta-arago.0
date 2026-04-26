Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C81DFF8850
	for <webhook@archiver.kernel.org>; Sun, 26 Apr 2026 22:18:51 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29080.1777241929906896517
 for <meta-arago@lists.yoctoproject.org>;
 Sun, 26 Apr 2026 15:18:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0502940CB4;
	Sun, 26 Apr 2026 22:18:49 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cMqnORu8YlxU; Sun, 26 Apr 2026 22:18:48 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D2D7740A3D;
	Sun, 26 Apr 2026 22:18:47 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id C44CE17CA07;
	Sun, 26 Apr 2026 18:18:46 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: "Denys Dmytriyenko (TI)" <denys@konsulko.com>
Subject: [master][PATCH] arago.conf: update DISTRO_FEATURES handling
Date: Sun, 26 Apr 2026 18:18:46 -0400
Message-Id: <20260426221846.2594764-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sun, 26 Apr 2026 22:18:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17491

From: "Denys Dmytriyenko (TI)" <denys@konsulko.com>

Recently OE-Core changed the way DISTRO_FEATURES are handled. Update our
Distro config to match.

* No need to initialize DISTRO_FEATURES with the defaults, as OE-Core
  appends those automatically.
* DISTRO_FEATURES_LIBC has been deprecated long ago.
* Use DISTRO_FEATURES_OPTED_OUT to opt out from specific defaults.

Signed-off-by: Denys Dmytriyenko (TI) <denys@konsulko.com>
---
 meta-arago-distro/conf/distro/arago.conf | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro=
/conf/distro/arago.conf
index b119179e..f3feb8b5 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -39,12 +39,8 @@ IMAGE_BOOT_FILES +=3D "uEnv.txt"
 TCMODEAPPEND ?=3D "-${TCMODE}"
 TMPDIR .=3D "${TCMODEAPPEND}"
=20
-# Start with default set of distro features
-DISTRO_FEATURES =3D "${DISTRO_FEATURES_DEFAULT} ${DISTRO_FEATURES_LIBC}"
-
 # Add additional distro features
 DISTRO_FEATURES:append =3D " pam opencl"
-DISTRO_FEATURES:remove =3D "x11"
=20
 # Normally target distro features will not be applied to native builds:
 # Native distro features on this list will use the target feature value
@@ -52,7 +48,7 @@ DISTRO_FEATURES_FILTER_NATIVE:append =3D " opencl"
 DISTRO_FEATURES_FILTER_NATIVESDK:append =3D " opencl"
=20
 # Do not include these default DISTRO_FEATURES from oe-core
-DISTRO_FEATURES_OPTED_OUT =3D "ptest"
+DISTRO_FEATURES_OPTED_OUT =3D "ptest x11"
=20
 # Set global runtime providers for major components
 ARAGO_SYSVINIT ??=3D "0"
--=20
2.25.1


