Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B36B1CA0EC3
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 01:00:21 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.15069.1694480416172708307
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 11 Sep 2023 18:00:17 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C03CA40C21;
	Tue, 12 Sep 2023 01:00:14 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R0nHZsAlIDIY; Tue, 12 Sep 2023 01:00:14 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-110-236.washdc.fios.verizon.net [100.15.110.236])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id EA4EC408CD;
	Tue, 12 Sep 2023 01:00:12 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id DB8AB163CA3;
	Mon, 11 Sep 2023 21:00:11 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [kirkstone][PATCH] libssh: Update LICENSE variable to use SPDX license identifier
Date: Tue, 12 Sep 2023 01:00:07 +0000
Message-Id: <20230912010007.2702057-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 12 Sep 2023 01:00:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14897

From: Denys Dmytriyenko <denys@konsulko.com>

Fixes:

| WARNING: libssh-0.9.5-r0 do_package_qa: QA Issue: Recipe LICENSE includ=
es obsolete licenses LGPLv2.1 [obsolete-license]

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-arago-extras/recipes-sysrepo/libssh/libssh_0.9.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-sysrepo/libssh/libssh_0.9.5.bb b/m=
eta-arago-extras/recipes-sysrepo/libssh/libssh_0.9.5.bb
index 43a6827e..481356c5 100644
--- a/meta-arago-extras/recipes-sysrepo/libssh/libssh_0.9.5.bb
+++ b/meta-arago-extras/recipes-sysrepo/libssh/libssh_0.9.5.bb
@@ -1,7 +1,7 @@
 SUMMARY =3D "Multiplatform C library implementing the SSHv2 and SSHv1 pr=
otocol"
 HOMEPAGE =3D "http://www.libssh.org"
 SECTION =3D "libs"
-LICENSE =3D "LGPLv2.1"
+LICENSE =3D "LGPL-2.1-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Ddabb4958b830e5df11d2b0ed8ea25=
5a0"
=20
 DEPENDS =3D "zlib openssl"
--=20
2.25.1


