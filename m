Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 656B3C3ABBC
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 20:01:07 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.85398.1746561661989941351
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 06 May 2025 13:01:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B375840CCD;
	Tue,  6 May 2025 20:01:00 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rfpbpcdAnyPu; Tue,  6 May 2025 20:01:00 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 95A9D40CC0;
	Tue,  6 May 2025 20:00:59 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 4B0EA16791F;
	Tue,  6 May 2025 16:00:59 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/scarthgap][PATCH 1/2] cpuloadgen: force older GNU/C standard
Date: Tue,  6 May 2025 16:00:57 -0400
Message-Id: <20250506200058.1227765-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 06 May 2025 20:01:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16183

From: Denys Dmytriyenko <denys@konsulko.com>

This is an old code base based on Dhrystone and hasn't been updated in
a very long time. It now fails to compile with gcc-15 (C23 standard).
Force compilation with GNU/C11 standard instead.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-arago-test/recipes-devtools/cpuloadgen/cpuloadgen_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-test/recipes-devtools/cpuloadgen/cpuloadgen_git.b=
b b/meta-arago-test/recipes-devtools/cpuloadgen/cpuloadgen_git.bb
index 751f91c0..12d0905d 100644
--- a/meta-arago-test/recipes-devtools/cpuloadgen/cpuloadgen_git.bb
+++ b/meta-arago-test/recipes-devtools/cpuloadgen/cpuloadgen_git.bb
@@ -15,7 +15,7 @@ SRC_URI =3D "git://github.com/ptitiano/cpuloadgen.git;p=
rotocol=3Dhttps;branch=3D${BRAN
 S =3D "${WORKDIR}/git"
=20
 EXTRA_OEMAKE =3D "DESTDIR=3D${D}${bindir} CROSS_COMPILE=3D${TARGET_PREFI=
X} CC=3D"${CC}" CFLAGS=3D"${CFLAGS}""
-CFLAGS +=3D "-fpermissive"
+CFLAGS +=3D "-fpermissive -std=3Dgnu11"
=20
 do_install () {
     install -d ${D}${bindir}
--=20
2.25.1


