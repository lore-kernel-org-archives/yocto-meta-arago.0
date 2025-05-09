Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91632C3ABC5
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 02:22:00 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.5441.1746757310411277972
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 08 May 2025 19:21:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 46F1640CC1;
	Fri,  9 May 2025 02:21:49 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xD0JwoeP3e-u; Fri,  9 May 2025 02:21:49 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 259F740CB6;
	Fri,  9 May 2025 02:21:48 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 81097167B71;
	Thu,  8 May 2025 22:21:47 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/scarthgap][PATCH] recipes: fix whitespace warnings
Date: Thu,  8 May 2025 22:21:47 -0400
Message-Id: <20250509022147.310719-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 09 May 2025 02:22:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16194

From: Denys Dmytriyenko <denys@konsulko.com>

Bitbake now warns if there are no whitespaces around "=3D" equal
sign.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../initscript-telnetd/initscript-telnetd.bb                | 2 +-
 meta-arago-extras/recipes-connectivity/hostap/hostap.inc    | 2 +-
 .../tensorflow-lite/tensorflow-lite_2.18.0.bb               | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-arago-distro/recipes-connectivity/initscript-telnetd/in=
itscript-telnetd.bb b/meta-arago-distro/recipes-connectivity/initscript-t=
elnetd/initscript-telnetd.bb
index c71a3fdb..30f25e70 100644
--- a/meta-arago-distro/recipes-connectivity/initscript-telnetd/initscrip=
t-telnetd.bb
+++ b/meta-arago-distro/recipes-connectivity/initscript-telnetd/initscrip=
t-telnetd.bb
@@ -1,7 +1,7 @@
 DESCRIPTION =3D "Initscripts for telnetd"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://telnetd;beginline=3D2;endline=3D18;md5=3Dd1=
34d0d385c53f9201a270fef8448f29"
-PR =3D"r1"
+PR  =3D "r1"
=20
 SRC_URI =3D "file://telnetd"
=20
diff --git a/meta-arago-extras/recipes-connectivity/hostap/hostap.inc b/m=
eta-arago-extras/recipes-connectivity/hostap/hostap.inc
index 6695d3a3..5a5f7014 100644
--- a/meta-arago-extras/recipes-connectivity/hostap/hostap.inc
+++ b/meta-arago-extras/recipes-connectivity/hostap/hostap.inc
@@ -14,7 +14,7 @@ DEFAULT_PREFERENCE =3D "-1"
 PR =3D "r6"
=20
 inherit update-rc.d pkgconfig
-INITSCRIPT_NAME=3D"hostapd"
+INITSCRIPT_NAME =3D "hostapd"
=20
 CONFFILES:${PN} +=3D "${sysconfdir}/hostapd.conf"
=20
diff --git a/meta-arago-extras/recipes-framework/tensorflow-lite/tensorfl=
ow-lite_2.18.0.bb b/meta-arago-extras/recipes-framework/tensorflow-lite/t=
ensorflow-lite_2.18.0.bb
index a20c090a..78b971a5 100644
--- a/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite=
_2.18.0.bb
+++ b/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite=
_2.18.0.bb
@@ -74,9 +74,9 @@ DEPENDS =3D " \
 "
=20
 # Set building environment variables
-TENSORFLOW_TARGET=3D"linux"
-TENSORFLOW_TARGET_ARCH:aarch64=3D"aarch64"
-TENSORFLOW_TARGET_ARCH:arm=3D"armv7"
+TENSORFLOW_TARGET =3D "linux"
+TENSORFLOW_TARGET_ARCH:aarch64 =3D "aarch64"
+TENSORFLOW_TARGET_ARCH:arm =3D "armv7"
=20
 PACKAGECONFIG ??=3D "xnnpack ruy"
 PACKAGECONFIG[xnnpack] =3D "-DTFLITE_ENABLE_XNNPACK=3DON, -DTFLITE_ENABL=
E_XNNPACK=3DOFF"
--=20
2.25.1


