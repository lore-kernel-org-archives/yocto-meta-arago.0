Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 598E4EB64DA
	for <webhook@archiver.kernel.org>; Wed,  5 Jul 2023 22:42:06 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.8785.1688596924550171728
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 05 Jul 2023 15:42:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 64FE740C50;
	Wed,  5 Jul 2023 22:42:03 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jj_4z9Tb25Xy; Wed,  5 Jul 2023 22:42:03 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 489F9400CF;
	Wed,  5 Jul 2023 22:42:02 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 389B2163BC5;
	Wed,  5 Jul 2023 18:42:01 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/kirkstone][PATCH] libredblack: fix warnings
Date: Wed,  5 Jul 2023 22:42:01 +0000
Message-Id: <20230705224201.675681-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 05 Jul 2023 22:42:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14752

From: Denys Dmytriyenko <denys@konsulko.com>

1. Explicitly specify branch in git URL
2. Use the correct SPDX license identifier

Fixes these warnings:

| WARNING: libredblack_git.bb: URL: git://github.com/sysrepo/libredblack.=
git;protocol=3Dhttps does not set any branch parameter. The future defaul=
t branch used by tools and repositories is uncertain and we will therefor=
e soon require this is set in all git urls.
| WARNING: libredblack-1.0+gitAUTOINC+a399310d99-r0 do_package_qa: QA Iss=
ue: Recipe LICENSE includes obsolete licenses LGPLv2.1 [obsolete-license]

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-sysrepo/libredblack/libredblack_git.bb            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-sysrepo/libredblack/libredblack_gi=
t.bb b/meta-arago-extras/recipes-sysrepo/libredblack/libredblack_git.bb
index ea51b618..f073aa06 100644
--- a/meta-arago-extras/recipes-sysrepo/libredblack/libredblack_git.bb
+++ b/meta-arago-extras/recipes-sysrepo/libredblack/libredblack_git.bb
@@ -1,9 +1,9 @@
 SUMMARY =3D "Library for handling red-black tree searching algorithm"
 DESCRIPTION =3D "A library to provide the RedBlack balanced tree searchi=
ng and sorting algorithm."
-LICENSE =3D "LGPLv2.1"
+LICENSE =3D "LGPL-2.1-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dde174fb5a92cdbe038c88dc4c4316=
f99"
=20
-SRC_URI =3D "git://github.com/sysrepo/libredblack.git;protocol=3Dhttps"
+SRC_URI =3D "git://github.com/sysrepo/libredblack.git;protocol=3Dhttps;b=
ranch=3Dmaster"
=20
 PV =3D "1.0+git${SRCPV}"
 SRCREV =3D "a399310d99b61eec4d3c0677573ab5dddcf9395d"
--=20
2.25.1


