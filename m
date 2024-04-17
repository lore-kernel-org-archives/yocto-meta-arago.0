Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ECAFC4345F
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 19:07:35 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.22687.1713380846643009534
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 17 Apr 2024 12:07:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E077140C7B;
	Wed, 17 Apr 2024 19:07:25 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1BJ2y2LR-hup; Wed, 17 Apr 2024 19:07:25 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5877F40A0B;
	Wed, 17 Apr 2024 19:07:24 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 13EC2163F1D;
	Wed, 17 Apr 2024 15:07:24 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/scarthgap][PATCH] php: cleanup more places where php-fpm is creeping in
Date: Wed, 17 Apr 2024 15:07:22 -0400
Message-Id: <20240417190722.2983348-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 17 Apr 2024 19:07:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15297

From: Denys Dmytriyenko <denys@konsulko.com>

As php has started giving an error now:

ERROR: php-8.2.16-r0.arago1 do_package: php-fpm does not appear in packag=
e list, please add it

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-arago-distro/recipes-devtools/php/php_%.bbappend | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-arago-distro/recipes-devtools/php/php_%.bbappend b/meta=
-arago-distro/recipes-devtools/php/php_%.bbappend
index 7db1f1cb..c2cca255 100644
--- a/meta-arago-distro/recipes-devtools/php/php_%.bbappend
+++ b/meta-arago-distro/recipes-devtools/php/php_%.bbappend
@@ -11,10 +11,14 @@ SRC_URI:append:virtclass-native =3D " file://0001-php=
-native-Fix-host-contaminatio
 # Issue mentioned here: https://bugs.php.net/bug.php?id=3D60144
=20
 EXTRA_OECONF:remove =3D "--enable-fpm"
+EXTRA_OECONF:append =3D " --disable-fpm"
=20
 PACKAGES:remove =3D "${PN}-fpm"
 PACKAGES:remove =3D "${PN}-fpm-apache2"
=20
+SYSTEMD_PACKAGES:remove =3D "${PN}-fpm"
+INITSCRIPT_PACKAGES:remove =3D "${PN}-fpm"
+
 do_install:prepend:pn-php() {
     # Add the below file even though we aren't going to use it.
     # do_install will complain and fail if this file isn't found.
--=20
2.25.1


