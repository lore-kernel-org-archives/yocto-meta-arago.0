Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB83FC3ABBC
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 23:44:51 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.391.1746575081475962843
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 06 May 2025 16:44:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B10C040CB6;
	Tue,  6 May 2025 23:44:40 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zvr-QZ0SHfIP; Tue,  6 May 2025 23:44:40 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 94E5D40C50;
	Tue,  6 May 2025 23:44:39 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 4A56116792D;
	Tue,  6 May 2025 19:44:39 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH] arago-prefs: set VIRTUAL-RUNTIME_dbus
Date: Tue,  6 May 2025 19:44:38 -0400
Message-Id: <20250506234438.436995-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 06 May 2025 23:44:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16187

From: Denys Dmytriyenko <denys@konsulko.com>

OE-Core has recently introduced VIRTUAL-RUNTIME_dbus to set runtime
provider of D-Bus:

https://git.openembedded.org/openembedded-core/commit/?id=3D81fd917ac05be=
19d8345fff272a2ffc17a257880

Since Arago uses dbus-broker package in standard images, need to set
VIRTUAL-RUNTIME_dbus accordingly to avoid inadvertently pulling the
reference dbus package and having a conflict between them.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-arago-distro/conf/distro/include/arago-prefs.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta=
-arago-distro/conf/distro/include/arago-prefs.inc
index 69bae7d7..64b87e7b 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -5,6 +5,8 @@ PREFERRED_PROVIDER_virtual/gettext =3D "gettext"
=20
 PREFERRED_PROVIDER_virtual/kernel:append =3D "${ARAGO_KERNEL_SUFFIX}"
=20
+VIRTUAL-RUNTIME_dbus =3D "dbus-broker"
+
 # Setting PREFERRED_VERSIONS due to selecting a specific version of a li=
brary or
 # application that does not have a GPLv3 license
 PREFERRED_VERSION_crda =3D "3.18"
--=20
2.25.1


