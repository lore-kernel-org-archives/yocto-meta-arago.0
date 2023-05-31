Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 057D6C77B7A
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 15:52:49 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.635.1685548362727990851
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 31 May 2023 08:52:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id F066540C67;
	Wed, 31 May 2023 15:52:41 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0YcvuUr9jA24; Wed, 31 May 2023 15:52:41 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D8BC040C13;
	Wed, 31 May 2023 15:52:40 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 81F1416392B;
	Wed, 31 May 2023 11:51:54 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH] toolchain-gcc: bump preferred gcc version
Date: Wed, 31 May 2023 15:52:40 +0000
Message-Id: <20230531155240.3704741-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 31 May 2023 15:52:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14483

From: Denys Dmytriyenko <denys@konsulko.com>

OE-Core has moved to gcc 13, update our preference accordingly.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-arago-distro/conf/distro/include/toolchain-gcc.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/toolchain-gcc.inc b/me=
ta-arago-distro/conf/distro/include/toolchain-gcc.inc
index 78957364..c2f730e0 100644
--- a/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
+++ b/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
@@ -13,7 +13,7 @@ PREFERRED_PROVIDER_binutils-cross-canadian-${TRANSLATED=
_TARGET_ARCH} ?=3D "binutil
 PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "gdb=
-cross-canadian-${TRANSLATED_TARGET_ARCH}"
=20
 # Set Cross and SDK toolchain preferences
-SDKGCCVERSION ?=3D "12%"
+SDKGCCVERSION ?=3D "13%"
 SDKBINUVERSION ?=3D "2.40%"
 SDKGLIBCVERSION ?=3D "2.37%"
=20
@@ -30,7 +30,7 @@ PREFERRED_VERSION_nativesdk-glibc-initial ?=3D "${SDKGL=
IBCVERSION}"
=20
 # Set target toolchain preferences to match Cross/SDK by default
 # Can be overwritten globally, if needed
-GCCVERSION ?=3D "12%"
+GCCVERSION ?=3D "13%"
 BINUVERSION ?=3D "2.40%"
 GLIBCVERSION ?=3D "2.37%"
=20
--=20
2.25.1


